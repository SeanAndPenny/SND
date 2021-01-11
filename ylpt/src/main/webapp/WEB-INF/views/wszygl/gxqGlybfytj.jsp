<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>重点机构医保分析</title>
 
 
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery-index.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts.min.index.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/glyb_index.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/glyb_reset.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_index.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/rkzb_reset.css"/>" />
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
	      url: "${ctx}/gxqGlybfytj/gxqGlybfytj.json?p_kssj="+kssj
	            +"&p_jssj="+jssj
	            +"&p_jgdm="+jgdm,
	              
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	         var nodes=eval(data);
	         var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh); 
	         var fianl=xx.getchart01List; 
	         var yyzrs=xx.yyzrs;  
	         var fian2=xx.getchartCf01; 
	         var jczrs=xx.jczrs; 
	         var fian3=xx.getchart02;
	         var yyzje=xx.yyzje;
	         var fian4=xx.getchartCf02;
	         var jczje=xx.jczje;
	         var fian5=xx.getchart03;
	         var categories = [];
	    	 var data1=[];
	    	 var data2=[];
	    	 var data3=[]; 
	    	 var data4=[]; 
	    	 var data5=[]; 
	    	 var data6=[]; 
	    	 var data7=[]; 
	    	 var data8=[]; 
	    	 var data9=[]; 
	    	 var data10=[]; 
	    	 var data11=[]; 
	    	 var data12=[]; 
	    	 for (var i=0;i<fian5.length;i++)
	         	{  categories.push(fian5[i].rq);
					data1.push(fian5[i].kjcyy);
					data2.push(fian5[i].gxyrmyy);
					data3.push(fian5[i].mjyy);
					data4.push(fian5[i].sdfy);
					data5.push(fian5[i].sdfe);
					data6.push(fian5[i].bb);
					data7.push(fian5[i].dq);
					data8.push(fian5[i].bq);
					data9.push(fian5[i].zyy);
					data10.push(fian5[i].jlyy);
					data11.push(fian5[i].gjyy);
					data12.push(fian5[i].dwrmyy);
	         	}
  		
	    	 var fian6=xx.getchartCf03;
	         var categories03 = [];
	    	 var data13=[];
	    	 var data14=[];
	    	 var data15=[]; 
	    	 var data16=[]; 
	    	 var data17=[]; 
	    	 var data18=[]; 
	    	 var data19=[]; 
	    	 for (var i=0;i<fian6.length;i++)
	         	{  categories03.push(fian6[i].rq);
					data13.push(fian6[i].zhjd);
					data14.push(fian6[i].ssjd);
					data15.push(fian6[i].ysjd);
					data16.push(fian6[i].htjd);
					data17.push(fian6[i].ddjd);
					data18.push(fian6[i].tajd);
					data19.push(fian6[i].xgjd);
					
					 
	         	}
  			
	    	 var fian7=xx.getchart04;
	         var categories04 = [];
	    	 var data21=[];
	    	 var data22=[];
	    	 var data23=[]; 
	    	 var data24=[]; 
	    	 var data25=[]; 
	    	 var data26=[]; 
	    	 var data27=[]; 
	    	 var data28=[]; 
	    	 var data29=[]; 
	    	 var data30=[]; 
	    	 var data31=[]; 
	    	 var data32=[]; 
	    	 for (var i=0;i<fian7.length;i++)
	         	{  categories04.push(fian7[i].rq);
					data21.push(fian7[i].kjcyy);
					data22.push(fian7[i].gxyrmyy);
					data23.push(fian7[i].mjyy);
					data24.push(fian7[i].sdfy);
					data25.push(fian7[i].sdfe);
					data26.push(fian7[i].bb);
					data27.push(fian7[i].dq);
					data28.push(fian7[i].bq);
					data29.push(fian7[i].zyy);
					data30.push(fian7[i].jlyy);
					data31.push(fian7[i].gjyy);
					data32.push(fian7[i].dwrmyy);
	         	}
  		
	    	 var fian8=xx.getchartCf04;
	         var categories04_cf = [];
	    	 var data33=[];
	    	 var data34=[];
	    	 var data35=[]; 
	    	 var data36=[]; 
	    	 var data37=[]; 
	    	 var data38=[]; 
	    	 var data39=[]; 
	    	 for (var i=0;i<fian8.length;i++)
	         	{  categories04_cf.push(fian8[i].rq);
					data33.push(fian8[i].zhjd);
					data34.push(fian8[i].ssjd);
					data35.push(fian8[i].ysjd);
					data36.push(fian8[i].htjd);
					data37.push(fian8[i].ddjd);
					data38.push(fian8[i].tajd);
					data39.push(fian8[i].xgjd);
					
					 
	         	}
  			
	    	 
	    	 var fian9=xx.getchart05;
	         var categories05= [];
	    	 var data40=[];
	    	 var data41=[];
	    	 var data42=[]; 
	    	 var data43=[]; 
	    	 var data44=[]; 
	    	 var data45=[]; 
	    	 var data46=[]; 
	    	 var data47=[]; 
	    	 var data48=[]; 
	    	 var data49=[]; 
	    	 var data50=[]; 
	    	 var data51=[]; 
	    	 for (var i=0;i<fian9.length;i++)
	         	{  categories05.push(fian9[i].rq);
					data40.push(fian9[i].kjcyy);
					data41.push(fian9[i].gxyrmyy);
					data42.push(fian9[i].mjyy);
					data43.push(fian9[i].sdfy);
					data44.push(fian9[i].sdfe);
					data45.push(fian9[i].bb);
					data46.push(fian9[i].dq);
					data47.push(fian9[i].bq);
					data48.push(fian9[i].zyy);
					data49.push(fian9[i].jlyy);
					data50.push(fian9[i].gjyy);
					data51.push(fian9[i].dwrmyy);
	         	}
	    	 
	    	 var fian10=xx.getchartCf05;
	         var categories05_cf = [];
	    	 var data52=[];
	    	 var data53=[];
	    	 var data54=[]; 
	    	 var data55=[]; 
	    	 var data56=[]; 
	    	 var data57=[]; 
	    	 var data58=[]; 
	    	 for (var i=0;i<fian10.length;i++)
	         	{  categories05_cf.push(fian10[i].rq);
					data52.push(fian10[i].zhjd);
					data53.push(fian10[i].ssjd);
					data54.push(fian10[i].ysjd);
					data55.push(fian10[i].htjd);
					data56.push(fian10[i].ddjd);
					data57.push(fian10[i].tajd);
					data58.push(fian10[i].xgjd);
				 }
	    	 
	    	 var fian11=xx.getchart06;
	         var categories06 = [];
	    	 var data59=[];
	    	 var data60=[];
	    	 var data61=[]; 
	    	 var data62=[]; 
	    	 var data63=[]; 
	    	 var data64=[]; 
	    	 var data65=[]; 
	    	 var data66=[]; 
	    	 var data67=[]; 
	    	 var data68=[]; 
	    	 var data69=[]; 
	    	 var data70=[]; 
	    	 for (var i=0;i<fian11.length;i++)
	         	{  categories06.push(fian11[i].rq);
					data59.push(fian11[i].kjcyy);
					data60.push(fian11[i].gxyrmyy);
					data61.push(fian11[i].mjyy);
					data62.push(fian11[i].sdfy);
					data63.push(fian11[i].sdfe);
					data64.push(fian11[i].bb);
					data65.push(fian11[i].dq);
					data66.push(fian11[i].bq);
					data67.push(fian11[i].zyy);
					data68.push(fian11[i].jlyy);
					data69.push(fian11[i].gjyy);
					data70.push(fian11[i].dwrmyy);
	         	}
  		
	    	 var fian12=xx.getchartCf06;
	         var categories06_cf = [];
	    	 var data71=[];
	    	 var data72=[];
	    	 var data73=[]; 
	    	 var data74=[]; 
	    	 var data75=[]; 
	    	 var data76=[]; 
	    	 var data77=[]; 
	    	 for (var i=0;i<fian12.length;i++)
	         	{  categories06_cf.push(fian12[i].rq);
					data71.push(fian12[i].zhjd);
					data72.push(fian12[i].ssjd);
					data73.push(fian12[i].ysjd);
					data74.push(fian12[i].htjd);
					data75.push(fian12[i].ddjd);
					data76.push(fian12[i].tajd);
					data77.push(fian12[i].xgjd); 
	         	}
	         chart01('chart01',fianl,yyzrs);  
	         chartCf01('chartCf01',fian2,jczrs); 
	         chart02('chart02',fian3,yyzje);
	         chartCf02('chartCf02',fian4,jczje); 
	         chart03('chart03',categories,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12);
	         chartCf03('chartCf03',categories03,data13,data14,data15,data16,data17,data18,data19);
	         chart04('chart04',categories04,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31,data32);
	         chartCf04('chartCf04',categories04_cf,data33,data34,data35,data36,data37,data38,data39);
	         chart05('chart05',categories05,data40,data41,data42,data43,data44,data45,data46,data47,data48,data49,data50,data51);
	         chartCf05('chartCf05',categories05_cf,data52,data53,data54,data55,data56,data57,data58);
	         chart06('chart06',categories06,data59,data60,data61,data62,data63,data64,data65,data66,data67,data68,data69,data70);
	         chartCf06('chartCf06',categories06_cf,data71,data72,data73,data74,data75,data76,data77);
	      }
	        });
	      }
</script>
<script type="text/javascript">
function chart01(id,fianl,yyzrs) {
	var  a="";
	var b="";
	var c="";
	var d="";
	var e="";
	var f="";
	$('#legend01').html("");
	var datas = [];
    var datass = []; 
    for (var i = 0; i < fianl.length; i++) {
    	 
      datas.push({
        name:fianl[i].yljgmc
      })
      datass.push({
        name:fianl[i].yljgmc,
        value:fianl[i].rs
      })
       if(i<=1){
        a+=('<div class="sty sty0'+(i+1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');
       }
      if(i>=2&&i<=3){
    	b+=('<div class="sty sty0'+(i-1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');
      }
      if(i>=4&&i<=5){
    	 
    	 c+=('<div class="sty sty0'+(i-3)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');  
      }
      if(i>=6&&i<=7){
     	 d+=('<div class="sty sty0'+(i-5)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');  
       }
      if(i>=8&&i<=9){
      	 e+=('<div class="sty sty0'+(i-7)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');  
        }
      if(i>=10&&i<=11){
       	 f+=('<div class="sty sty0'+(i-9)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');  
         } 
    }
      
    document.getElementById("legend01").innerHTML=
   '<li class="li01">'+a+'</li>'
   +'<li class="li02">'+b+'</li>'
   +'<li class="li03">'+c+'</li>'
   +'<li class="li04">'+d+'</li>'
   +'<li class="li05">'+e+'</li>'
   +'<li class="li06">'+f+'</li>';
    
    var myChart = echarts.init(document.getElementById(id));
    var option = {
    color : [ '#88CA6D', '#826CD1', '#3AA873','#A079E1','#0DAEF1',
    	'#C779E1','#3992F0','#E97CDB','#1572D5','#E97CA0','#7187F5','#E9987C' ],
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            }
        },
        series: [
            {
                name: '医保人次占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["20%", "47%"],
                radius: ['41%', '64%'],
                label: {
                    show: false
                },
                data:datass ,
                labelLine: {
                    show: false,
                    length: 5,
                    length2: 10
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};
function chartCf01(id,fianl,yyzrs) {
	var  a="";
	var b="";
	var c="";
	var d="";
	var e="";
	var f="";
	$('#legend02').html("");
   
	var datas = [];
    var datass = []; 
    for (var i = 0; i < fianl.length; i++) {
      datas.push({
        name:fianl[i].yljgmc
      })
      datass.push({
        name:fianl[i].yljgmc,
        value:fianl[i].rs
      })
      if(i<=1){
          a+=('<div class="sty sty0'+(i+1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');
         }
        if(i>=2&&i<=3){
      	b+=('<div class="sty sty0'+(i-1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');
        }
        if(i>=4&&i<=5){
      	 
      	 c+=('<div class="sty sty0'+(i-3)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');  
        }
        if(i>=6&&i<=7){
       	 d+=('<div class="sty sty0'+(i-5)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].rs/yyzrs*100).toFixed(2)+'%'+'</span></div>');  
         }
    }
    document.getElementById("legend02").innerHTML=
    	   '<li class="li01">'+a+'</li>'
    	   +'<li class="li02">'+b+'</li>'
    	   +'<li class="li03">'+c+'</li>'
    	   +'<li class="li04">'+d+'</li>';
    var myChart = echarts.init(document.getElementById(id));
    var option = {
    color : [ '#88CA6D', '#826CD1', '#3AA873','#A079E1','#0DAEF1',
    	'#C779E1','#3992F0','#E97CDB','#1572D5','#E97CA0','#7187F5','#E9987C' ],
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            }
        },
        series: [
            {
                name: '医保人次占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["20%", "47%"],
                radius: ['41%', '64%'],
                label: {
                    show: false
                },
                data:datass ,
                labelLine: {
                    show: false,
                    length: 5,
                    length2: 10
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

</script>
<script type="text/javascript">
function chart02(id,fianl,yyzje) {
	var  a="";
	var b="";
	var c="";
	var d="";
	var e="";
	var f="";
	$('#legend03').html("");
   
	var datas = [];
    var datass = []; 
    for (var i = 0; i < fianl.length; i++) {
      datas.push({
        name:fianl[i].yljgmc
      })
      datass.push({
        name:fianl[i].yljgmc,
        value:fianl[i].ylje
      })
      if(i<=1){
          a+=('<div class="sty sty0'+(i+1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/yyzje*100).toFixed(2)+'%'+'</span></div>');
         }
        if(i>=2&&i<=3){
      	b+=('<div class="sty sty0'+(i-1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/yyzje*100).toFixed(2)+'%'+'</span></div>');
        }
        if(i>=4&&i<=5){
      	 
      	 c+=('<div class="sty sty0'+(i-3)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/yyzje*100).toFixed(2)+'%'+'</span></div>');  
        }
        if(i>=6&&i<=7){
       	 d+=('<div class="sty sty0'+(i-5)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/yyzje*100).toFixed(2)+'%'+'</span></div>');  
         }
        if(i>=8&&i<=9){
        	 e+=('<div class="sty sty0'+(i-7)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/yyzje*100).toFixed(2)+'%'+'</span></div>');  
          }
        if(i>=10&&i<=11){
         	 f+=('<div class="sty sty0'+(i-9)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/yyzje*100).toFixed(2)+'%'+'</span></div>');  
           } 
       
    }
    document.getElementById("legend03").innerHTML=
    	   '<li class="li01">'+a+'</li>'
    	   +'<li class="li02">'+b+'</li>'
    	   +'<li class="li03">'+c+'</li>'
    	   +'<li class="li04">'+d+'</li>'
    	   +'<li class="li05">'+e+'</li>'
    	   +'<li class="li06">'+f+'</li>';
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            }
        },
        color : [ '#88CA6D', '#826CD1', '#3AA873','#A079E1','#0DAEF1',
        	'#C779E1','#3992F0','#E97CDB','#1572D5','#E97CA0','#7187F5','#E9987C' ],
        series: [
            {
                name: '医保金额占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["20%", "47%"],
                radius: ['41%', '64%'],
                label: {
                    show: false
                },
                data: datass ,
                labelLine: {
                    show: false,
                    length: 5,
                    length2: 10
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chartCf02(id,fianl,jczje) {
	var  a="";
	var b="";
	var c="";
	var d="";
	var e="";
	var f="";
	$('#legend04').html("");
   
     
	var datas = [];
    var datass = []; 
    for (var i = 0; i < fianl.length; i++) {
      datas.push({
        name:fianl[i].yljgmc
      })
      datass.push({
        name:fianl[i].yljgmc,
        value:fianl[i].ylje
      })
      if(i<=1){
          a+=('<div class="sty sty0'+(i+1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/jczje*100).toFixed(2)+'%'+'</span></div>');
         }
        if(i>=2&&i<=3){
      	b+=('<div class="sty sty0'+(i-1)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/jczje*100).toFixed(2)+'%'+'</span></div>');
        }
        if(i>=4&&i<=5){
      	 
      	 c+=('<div class="sty sty0'+(i-3)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/jczje*100).toFixed(2)+'%'+'</span></div>');  
        }
        if(i>=6&&i<=7){
       	 d+=('<div class="sty sty0'+(i-5)+'"><i></i><label for="" >'+fianl[i].yljgmc+'：</label><span>'+(fianl[i].ylje/jczje*100).toFixed(2)+'%'+'</span></div>');  
         }
    }
    document.getElementById("legend04").innerHTML=
 	   '<li class="li01">'+a+'</li>'
 	   +'<li class="li02">'+b+'</li>'
 	   +'<li class="li03">'+c+'</li>'
 	   +'<li class="li04">'+d+'</li>';
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            }
        },
        color : ['#88CA6D', '#826CD1', '#3AA873','#A079E1','#0DAEF1',
        	'#C779E1','#3992F0','#E97CDB','#1572D5','#E97CA0','#7187F5','#E9987C' ],
        series: [
            {
                name: '医保金额占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["20%", "47%"],
                radius: ['41%', '64%'],
                label: {
                    show: false
                },
                data: datass ,
                labelLine: {
                    show: false,
                    length: 5,
                    length2: 10
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

</script>
<script type="text/javascript">
function chart03(id,categories,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12) {
	 
 
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '科技城医院',
                type: 'line',
                data: data1,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: data2,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: data3,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: data4,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: data5,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: data6,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: data7,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: data8,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: data9,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: data10,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: data11,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: data12,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ] 
    };
    myChart.setOption(option)
    return myChart
};
function chartCf03(id,categories03,data13,data14,data15,data16,data17,data18,data19) {
	 
	 
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories03,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '镇湖街道',
                type: 'line',
                data: data13,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '狮山街道',
                type: 'line',
                data: data14,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '阳山街道',
                type: 'line',
                data: data15,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '横塘街道',
                type: 'line',
                data: data16,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '东渚街道',
                type: 'line',
                data: data17,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '通安街道',
                type: 'line',
                data: data18,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '浒关街道',
                type: 'line',
                data: data19,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            } ,
        ] 
    };
    myChart.setOption(option)
    return myChart
};

</script>
<script type="text/javascript">
function chart04(id,categories,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12) {
	 
	 
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '%',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '科技城医院',
                type: 'line',
                data: data1,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: data2,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: data3,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: data4,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: data5,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: data6,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: data7,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: data8,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: data9,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: data10,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: data11,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: data12,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ] 
    };
    myChart.setOption(option)
    return myChart
};
function chartCf04(id,categories03,data13,data14,data15,data16,data17,data18,data19) {
	 
	 
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '%',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories03,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '镇湖街道',
                type: 'line',
                data: data13,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '狮山街道',
                type: 'line',
                data: data14,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '阳山街道',
                type: 'line',
                data: data15,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '横塘街道',
                type: 'line',
                data: data16,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '东渚街道',
                type: 'line',
                data: data17,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '通安街道',
                type: 'line',
                data: data18,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '浒关街道',
                type: 'line',
                data: data19,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            } ,
        ] 
    };
    myChart.setOption(option)
    return myChart
};
</script>
<script type="text/javascript">
function chart05(id,categories,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12) {
	 
	 
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '元',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '科技城医院',
                type: 'line',
                data: data1,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: data2,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: data3,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: data4,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: data5,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: data6,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: data7,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: data8,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: data9,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: data10,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: data11,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: data12,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ] 
    };
    myChart.setOption(option)
    return myChart
};
function chartCf05(id,categories03,data13,data14,data15,data16,data17,data18,data19) {
	 
	 
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '元',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories03,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '镇湖街道',
                type: 'line',
                data: data13,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '狮山街道',
                type: 'line',
                data: data14,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '阳山街道',
                type: 'line',
                data: data15,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '横塘街道',
                type: 'line',
                data: data16,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '东渚街道',
                type: 'line',
                data: data17,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '通安街道',
                type: 'line',
                data: data18,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '浒关街道',
                type: 'line',
                data: data19,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            } ,
        ] 
    };
    myChart.setOption(option)
    return myChart
};
</script>
<script type="text/javascript">
function chart06(id,categories,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12) {
	 var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '%',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '科技城医院',
                type: 'line',
                data: data1,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: data2,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: data3,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: data4,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: data5,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: data6,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: data7,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: data8,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: data9,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: data10,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: data11,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: data12,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ] 
    };
    myChart.setOption(option)
    return myChart
};
function chartCf06(id,categories03,data13,data14,data15,data16,data17,data18,data19) {
	 
	 
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        color : [ '#88CA6D', '#3AA873', '#0DAEF1','#3992F0','#1572D5',
        	'#7187F5','#826CD1','#A079E1','#C779E1','#E97CDB','#E97CA0','#E9987C' ],
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '%',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: categories03,
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series:  [
            {
                name: '镇湖街道',
                type: 'line',
                data: data13,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '狮山街道',
                type: 'line',
                data: data14,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '阳山街道',
                type: 'line',
                data: data15,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '横塘街道',
                type: 'line',
                data: data16,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '东渚街道',
                type: 'line',
                data: data17,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '通安街道',
                type: 'line',
                data: data18,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '浒关街道',
                type: 'line',
                data: data19,
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            } ,
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
							<i value="all" class="all active" onclick="sjxz('all')">全部</i>
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
						<c:forEach items="${gxqglybjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>

	</div>
	 <div class="main hos-analysis">
        <div class="botCon">
            <ul class="detail clearfix">
                <li class="mode mode01 mode1-2">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">医保人次占比</label>
                                <div class="tabTop">
                                    <span class="active">医院</span>
                                    <span>基层</span>
                                </div>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart01"></div>
                            <ul class="legend" id="legend01"></ul>
                        </div>
                        <div class="modeCon" style="display: none;">
                            <div class="chartBox" id="chartCf01"></div>
                            <ul class="legend" id="legend02"></ul>
                        </div>
                    </div>
                </li>
                <li class="mode mode02 mode1-2">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">医保金额占比</label>
                                <div class="tabTop">
                                    <span class="active">医院</span>
                                    <span>基层</span>
                                </div>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart02"></div>
                            <ul class="legend" id='legend03'> </ul>
                        </div>
                        <div class="modeCon" style="display: none;">
                            <div class="chartBox" id="chartCf02"></div>
                            <ul class="legend" id='legend04'></ul>
                        </div>
                    </div>
                </li>
                <li class="mode mode03 modeSame">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title clearfix">
                                <i></i>
                                <label for="">医保人次趋势</label>
                                <div class="tabTop">
                                    <span class="active">医院</span>
                                    <span>基层</span>
                                </div>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart03"></div>
                            <ul class="legend clearfix">
                                <li class="li01">
                                    <i></i>
                                    <label for="">科技城医院</label>
                                </li>
                                <li class="li02">
                                    <i></i>
                                    <label for="">高新区医院</label>
                                </li>
                                <li class="li03">
                                    <i></i>
                                    <label for="">明基医院</label>
                                </li>
                                <li class="li04">
                                    <i></i>
                                    <label for="">苏大附一</label>
                                </li>
                                <li class="li05">
                                    <i></i>
                                    <label for="">苏大附二</label>
                                </li>
                                <li class="li06">
                                    <i></i>
                                    <label for="">市立（本部）</label>
                                </li>
                                <li class="li07">
                                    <i></i>
                                    <label for="">市立（东区）</label>
                                </li>
                                <li class="li08">
                                    <i></i>
                                    <label for="">市立（北区）</label>
                                </li>
                                <li class="li09">
                                    <i></i>
                                    <label for="">中医院</label>
                                </li>
                                <li class="li10">
                                    <i></i>
                                    <label for="">九龙医院</label>
                                </li>
                                <li class="li11">
                                    <i></i>
                                    <label for="">广济医院</label>
                                </li>
                                <li class="li12">
                                    <i></i>
                                    <label for="">第五医院</label>
                                </li>
                            </ul>
                        </div>
                        <div class="modeCon" style="display: none;">
                            <div class="chartBox" id="chartCf03"></div>
                            <ul class="legend clearfix">
                                 
								<li class="li01"><i></i> <label id='id51' for="">镇湖街道</label></li>
								<li class="li02"><i></i> <label id='id52' for="">狮山街道</label></li>
								<li class="li03"><i></i> <label id='id53' for="">阳山街道</label></li>
								<li class="li04"><i></i> <label id='id54' for="">横塘街道</label></li>
								<li class="li05"><i></i> <label id='id55' for="">东渚街道</label></li>
								<li class="li06"><i></i> <label id='id56' for="">通安街道</label></li>
								<li class="li07"><i></i> <label id='id57' for="">浒关街道</label></li>
								 
							 
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="mode mode04 modeSame">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">医保人次占比趋势</label>
                                <div class="tabTop">
                                    <span class="active">医院</span>
                                    <span>基层</span>
                                </div>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart04"></div>
                            <ul class="legend clearfix">
                                 <li class="li01"><i></i> <label for="">科技城医院</label></li>
								<li class="li02"><i></i> <label for="">高新区医院</label></li>
								<li class="li03"><i></i> <label for="">明基医院</label></li>
								<li class="li04"><i></i> <label for="">苏大附一</label></li>
								<li class="li05"><i></i> <label for="">苏大附二</label></li>
								<li class="li06"><i></i> <label for="">市立（本部）</label></li>
								<li class="li07"><i></i> <label for="">市立（东区）</label></li>
								<li class="li08"><i></i> <label for="">市立（北区）</label></li>
								<li class="li09"><i></i> <label for="">中医院</label></li>
								<li class="li10"><i></i> <label for="">九龙医院</label></li>
								<li class="li11"><i></i> <label for="">广济医院</label></li>
								<li class="li12"><i></i> <label for="">第五医院</label></li>
                            </ul>
                        </div>
                        <div class="modeCon" style="display: none;">
                            <div class="chartBox" id="chartCf04"></div>
                            <ul class="legend clearfix">
                                 <li class="li01"><i></i> <label id='id51' for="">镇湖街道</label></li>
								<li class="li02"><i></i> <label id='id52' for="">狮山街道</label></li>
								<li class="li03"><i></i> <label id='id53' for="">阳山街道</label></li>
								<li class="li04"><i></i> <label id='id54' for="">横塘街道</label></li>
								<li class="li05"><i></i> <label id='id55' for="">东渚街道</label></li>
								<li class="li06"><i></i> <label id='id56' for="">通安街道</label></li>
								<li class="li07"><i></i> <label id='id57' for="">浒关街道</label></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="mode mode05 modeSame">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">医保金额趋势</label>
                                <div class="tabTop">
                                    <span class="active">医院</span>
                                    <span>基层</span>
                                </div>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart05"></div>
                            <ul class="legend clearfix">
                                 <li class="li01"><i></i> <label for="">科技城医院</label></li>
								<li class="li02"><i></i> <label for="">高新区医院</label></li>
								<li class="li03"><i></i> <label for="">明基医院</label></li>
								<li class="li04"><i></i> <label for="">苏大附一</label></li>
								<li class="li05"><i></i> <label for="">苏大附二</label></li>
								<li class="li06"><i></i> <label for="">市立（本部）</label></li>
								<li class="li07"><i></i> <label for="">市立（东区）</label></li>
								<li class="li08"><i></i> <label for="">市立（北区）</label></li>
								<li class="li09"><i></i> <label for="">中医院</label></li>
								<li class="li10"><i></i> <label for="">九龙医院</label></li>
								<li class="li11"><i></i> <label for="">广济医院</label></li>
								<li class="li12"><i></i> <label for="">第五医院</label></li>
                            </ul>
                        </div>
                        <div class="modeCon" style="display: none;">
                            <div class="chartBox" id="chartCf05"></div>
                            <ul class="legend clearfix">
                                 <li class="li01"><i></i> <label id='id51' for="">镇湖街道</label></li>
								<li class="li02"><i></i> <label id='id52' for="">狮山街道</label></li>
								<li class="li03"><i></i> <label id='id53' for="">阳山街道</label></li>
								<li class="li04"><i></i> <label id='id54' for="">横塘街道</label></li>
								<li class="li05"><i></i> <label id='id55' for="">东渚街道</label></li>
								<li class="li06"><i></i> <label id='id56' for="">通安街道</label></li>
								<li class="li07"><i></i> <label id='id57' for="">浒关街道</label></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="mode mode06 modeSame">
                    <div class="modeBg">
                        <div class="modeTop">
                            <div class="title">
                                <i></i>
                                <label for="">医保金额占比趋势</label>
                                <div class="tabTop">
                                    <span class="active">医院</span>
                                    <span>基层</span>
                                </div>
                            </div>
                        </div>
                        <div class="modeCon">
                            <div class="chartBox" id="chart06"></div>
                            <ul class="legend clearfix">
                                 <li class="li01"><i></i> <label for="">科技城医院</label></li>
								<li class="li02"><i></i> <label for="">高新区医院</label></li>
								<li class="li03"><i></i> <label for="">明基医院</label></li>
								<li class="li04"><i></i> <label for="">苏大附一</label></li>
								<li class="li05"><i></i> <label for="">苏大附二</label></li>
								<li class="li06"><i></i> <label for="">市立（本部）</label></li>
								<li class="li07"><i></i> <label for="">市立（东区）</label></li>
								<li class="li08"><i></i> <label for="">市立（北区）</label></li>
								<li class="li09"><i></i> <label for="">中医院</label></li>
								<li class="li10"><i></i> <label for="">九龙医院</label></li>
								<li class="li11"><i></i> <label for="">广济医院</label></li>
								<li class="li12"><i></i> <label for="">第五医院</label></li>
                            </ul>
                        </div>
                        <div class="modeCon" style="display: none;">
                            <div class="chartBox" id="chartCf06"></div>
                            <ul class="legend clearfix">
                               <li class="li01"><i></i> <label id='id51' for="">镇湖街道</label></li>
								<li class="li02"><i></i> <label id='id52' for="">狮山街道</label></li>
								<li class="li03"><i></i> <label id='id53' for="">阳山街道</label></li>
								<li class="li04"><i></i> <label id='id54' for="">横塘街道</label></li>
								<li class="li05"><i></i> <label id='id55' for="">东渚街道</label></li>
								<li class="li06"><i></i> <label id='id56' for="">通安街道</label></li>
								<li class="li07"><i></i> <label id='id57' for="">浒关街道</label></li>
                            </ul>
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
    var chartInit01 = chart01('chart01','','');
     var chartInit02 = chart02('chart02','','');
     var chartInit03 = chart03('chart03','','','','','','','','','','','','','');
     var chartInit04 = chart04('chart04','','','','','','','','','','','','','');
     var chartInit05 = chart05('chart05','','','','','','','','','','','','','');
      var chartInit06 = chart06('chart06','','','','','','','','','','','','','');

    var chartInitCf01 = chartCf01('chartCf01','','');
    var chartInitCf02 = chartCf02('chartCf02','','');
    var chartInitCf03 = chartCf03('chartCf03','','','','','','','');
    var chartInitCf04 = chartCf04('chartCf04','','','','','','','');
    var chartInitCf05 = chartCf05('chartCf05','','','','','','','');
    var chartInitCf06 = chart06('chartCf06','','','','','','','');

    
    $(".modeTop .title .tabTop span").click(function () {
        $(this).addClass("active").siblings("span").removeClass("active");
        $(this).parents(".mode").find(".modeCon").eq($(this).index()).show().siblings(".modeCon").hide();
        chartInit01.resize();
         chartInitCf01.resize();
         chartInit02.resize();
         chartInitCf02.resize();
         chartInit03.resize();
         chartInitCf03.resize();
         chartInit04.resize();
         chartInitCf04.resize();
         chartInit05.resize();
         chartInitCf05.resize();
         chartInit06.resize();
         chartInitCf06.resize();
    });

    $(window).resize(function () {
        chartInit01.resize();
        chartInitCf01.resize();
        chartInit02.resize();
        chartInitCf02.resize();
        chartInit03.resize(); 
        chartInitCf03.resize();
        chartInit04.resize(); 
        chartInitCf04.resize();
        chartInit05.resize();
        chartInitCf05.resize();
        chartInit06.resize();
        chartInitCf06.resize();
    });

});

</script>

</html>