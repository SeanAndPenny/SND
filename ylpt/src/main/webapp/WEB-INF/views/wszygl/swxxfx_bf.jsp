<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>死亡分析</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
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
    document.getElementById("chart03").style.display='none';
    document.getElementById("chart06").style.display='none';
    document.getElementById("chart07").style.display='none';
    document.getElementById("idname").style.display='none';
    }
function getData(){
       
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
        
      
      swxxfxEchars(jgdm); 
     
      }
function swxxfxEchars(jgdm){
  
      var ksnf=$("#ksnf").val();
      var jsnf=$("#jsnf").val();
      if(jsnf<ksnf){
    	 alert("选择的结束时间请大于或等于开始时间") ;
    	 return;
      }
      $.ajax({
        url: "${ctx}/swxxfx/swxxfx.json?p_ksnf="+ksnf
              +"&p_jsnf="+jsnf
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.swxxfxList;
           var swrs=new Array();
           var swnf=new Array(); 
           var fian2=xx.swxxnldfxList;
           var ers=new Array();
           var yrs=new Array();
           var xlqqs=new Array();
             var xlqs=new Array();
             var qcs=new Array();
           var qns=new Array();
           var zns=new Array();
           var lns=new Array();
           var nldnfs=new Array(); 
           var fian3=xx.syfxnlList;
           
           var fian4=xx.syflfxList;
            
           for (var i=0;i<fianl.length;i++) { 
               swrs[i]=fianl[i].swrs;
               swnf[i]=fianl[i].swnf; 
              }
           for (var i=0;i<fian2.length;i++) { 
             ers[i] =fian2[i].ers;
             yrs[i]=fian2[i].yrs;
             xlqqs[i]=fian2[i].xlqqs;
             xlqs[i]=fian2[i].xlqs;
             qcs[i]=fian2[i].qcs;
             qns[i]=fian2[i].qns;
             zns[i]=fian2[i].zns;
             lns[i]=fian2[i].lns;
             nldnfs[i]=fian2[i].nldnf;
                } 
           
             chart01('chart01',swrs,swnf,ksnf,jsnf,jgdm); 
             chart02('chart02',swrs,swnf);
             chart04('chart04',ers,yrs,xlqqs,xlqs,qcs,qns,zns,lns,nldnfs);
             chart05('chart05',fian3,ksnf,jsnf,jgdm);
             chart08('chart08',fian4,ksnf,jsnf,jgdm);
             
          }
          });
      getechars09('2',ksnf,jsnf,jgdm,'肿瘤');
  }
  
function getechars06(nldbm,ksnf,jsnf,jgdm,name){ 
    $.ajax({
      url: "${ctx}/swxxfx/getechars06.json?p_ksnf="+ksnf
            +"&p_jsnf="+jsnf
            +"&p_yljgdm="+jgdm
            +"&p_nldbm="+nldbm,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.getechars06List;
         var swrs=new Array();
         var dqfl=new Array();  
         
         var fian2=xx.getechars07List;
         var swrs2=new Array();
         var jbflmc=new Array(); 
         var jbflbm=new Array(); 
         
         for (var i=0;i<fianl.length;i++) { 
             swrs[i]=fianl[i].swrs;
             dqfl[i]=fianl[i].dqfl; 
            }
         for (var i=0;i<fian2.length;i++) { 
           swrs2[i]=fian2[i].swrs;
           jbflmc[i]=fian2[i].jbflmc; 
           jbflbm[i]=fian2[i].jbflbm; 
             }
         chart06('chart06',swrs,dqfl,name);
         chart07('chart07',swrs2,jbflmc,name,jbflbm,nldbm,jgdm,ksnf,jsnf);
           
        }
        });
}
function getechars09(jbbm,ksnf,jsnf,jgdm,name){ 
   
    $.ajax({
      url: "${ctx}/swxxfx/getechars09.json?p_ksnf="+ksnf
            +"&p_jsnf="+jsnf
            +"&p_yljgdm="+jgdm
            +"&p_jbbm="+jbbm,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.getechars09List;
         var nldrks=new Array();
         var nldmcs=new Array();  
         
          
         
         for (var i=0;i<fianl.length;i++) { 
           nldrks[i]=fianl[i].nldrk;
           nldmcs[i]=fianl[i].nldmc; 
            }
         
         chart09('chart09',nldrks,nldmcs,name);
         
           
        }
        });
}
  
function sjxz(id){  
  var myDate=new Date() 
    var month=myDate.getMonth()+1;
    var year=myDate.getFullYear(); 
    if (month<10) { month = "0" + month; }
    if(id=='year'){
    $("#ksnf").val('${ksnf}'.substr(0,4));
    $("#jsnf").val('${jsnf}'.substr(0,4));
    document.getElementById("ksnf").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
      };
    document.getElementById("jsnf").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
        };
    } else if(id=='month'){
    $("#ksnf").val('${ksnf}'.substr(0,7));
    $("#jsnf").val('${jsnf}'.substr(0,7));
    document.getElementById("ksnf").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
      };
    document.getElementById("jsnf").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
        };
    } else if(id=='day'){
     $("#ksnf").val('${ksnf}');
    $("#jsnf").val('${jsnf}');
  document.getElementById("ksnf").onclick = function(){
    WdatePicker({dateFmt:'yyyy-MM-dd'})
    };
  document.getElementById("jsnf").onclick = function(){
    WdatePicker({dateFmt:'yyyy-MM-dd'})
      };
  }else{
    $("#ksnf").val('${ksnf}');
    $("#jsnf").val('${jsnf}');
    document.getElementById("ksnf").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM-dd'});
      };
    document.getElementById("jsnf").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM-dd'});
        };
    
  }
}
</script>
<script type="text/javascript">
function getechart03(nf,jgdm){ 
  $.ajax({
      url: "${ctx}/swxxfx/swxxfxechars.json?p_nf="+nf 
            +"&p_jgdm="+jgdm ,    
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.swxxfxecharsList;
         chart03('chart03',fianl,nf); 
        }
        });
}

function chart01(id,swrs,swnf,ksnf,jsnf,jgdm){ 
  var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id)); 
  var option = { 
       title: {
                text: '死亡横向分析(可点击查看详细)',  
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
                  //console.log(item)
                  mcs=item; 
                });
                str += mcs.name+"年"+"<br>";
                str +="死亡人数:"+ mcs.data+"<br>";
                return str;
              }
           },
            color:'#00adf4',
                xAxis: {
                  type: 'category',
                  name:'年份',
                    data: swnf
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                	barWidth:40,
                    data: swrs,
                    type: 'bar',
                    showBackground: true,  
                }]
    };
    myChart.setOption(option);
    myChart.on('click', function(params) { 
       
      getechart03(params.name,jgdm); 
        });    
}
function chart02(id,swrs,swnf){ 
  var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id)); 
  var option = { 
       title: {
                text: '死亡纵向分析',  
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
                  //console.log(item)
                  mcs=item;
                });
                str += mcs.name+"年"+"<br>";
                str +="死亡人数:"+ mcs.data+"<br>";
                return str;
              }
           },
            color:'#57c5a2',
                xAxis: {
                  type: 'category',
                  name:'年份',
                    data: swnf
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: swrs,
                    type: 'line',
                    showBackground: true,
                    
                }]
    };
    myChart.setOption(option);   
}
function chart03(id,fianl,nf){
 
  var datas = [];
  var datass = [];
  for (var i = 0; i < fianl.length; i++) {
    datas.push({
      name:fianl[i].dqfl
    })
    datass.push({
      name:fianl[i].dqfl,
      value:fianl[i].xzrs
    })
  }
  document.getElementById("chart03").style.display="";//显示
  var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    option = { 
        color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
          '#adff2f', '#444446', '#799aec', '#61d4e2',
          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
          title: {
                  text: nf+'年'+'各乡镇死亡人口分布',  
              },
        
             legend: {
                 orient: 'vertical',
                 left: 'center',
                 itemHeight: 7,
                 itemWidth: 7,
                 itemGap: 25,
                 width: 200,
                 height: 30,
                 bottom: 20,
                 data: datas
             },
             series: [
                 {
                     type: 'pie',
                     radius: ['48%', '59%'],
                     center: ['50%', '50%'],
                     avoidLabelOverlap: false,
                     hoverOffset: 8,//悬浮偏移距离
                     label: {
                         show: true,
                         fontSize: 13,
                         formatter: function (params) {
                             return "{a|" + params.data.name + ":" + "共" + params.data.value + "条}" + "{b|(" + params.percent + "%})"
                         },
                         lineHeight: 18,
                         rich: {
                             a: {
                                 color: "#333",
                                 fontSize: 12
                             },
                             b: {
                                 color: "#333333",
                                 fontSize: 13
                             }
                         }
                     },
                     labelLine: {
                         show: true,
                         length: 10,
                         length2: 15
                     },
                     data: datass
                 }
             ]
      };

    myChart.setOption(option); 
    //模块高亮
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
}

function chart04(id,ers,yrs,xlqqs,xlqs,qcs,qns,zns,lns,nldnf){

  var myChart=echarts.init(document.getElementById(id));
    

  var options = {
      title: {
                text: '死亡年龄段趋势分析',  
            },
      
    color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
      '#adff2f', '#444446', '#799aec', '#61d4e2',
      '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
    tooltip : {
      trigger : 'axis'
    },
    legend : {
       
    },
    xAxis :  {
      name:"年份",
      type : 'category',
      boundaryGap : false,
      data : nldnf
    },
    yAxis : {
      name:"人数",
      type : 'value'
    },
     
    series : [
      {
        name: '婴儿期', 
                data: ers,
                type: 'line',
                showBackground: true,
        },
        {
            name: "幼儿期",
            type: "line",
            symbolSize: 8,
            smooth: true,
             
            data: yrs
        },
        {
            name: "学龄前期",
            type: "line",
            symbolSize: 8,
            smooth: true,
             
            data: xlqqs
        },
        {
            name: "学龄期",
            type: "line",
            symbolSize: 8,
            smooth: true,
             
            data: xlqs
        },{
            name: "青春期",
            type: "line",
            symbolSize: 8,
            smooth: true,
             
            data: qcs
        },{
        name: "青年期",
        type: "line",
        symbolSize: 8,
        smooth: true,
         
        data: qns
    },{
        name: "中年期",
        type: "line",
        symbolSize: 8,
        smooth: true,
         
        data: zns
    },{
        name: "老年期",
        type: "line",
        symbolSize: 8,
        smooth: true,
         
        data: lns
    },
        ]
  };
  myChart.setOption(options);
   
}
function chart05(id,fian3,ksnf,jsnf,jgdm){
  var datas = [];
  var datass = [];
  var datasss = [];
  for (var i = 0; i < fian3.length; i++) {
    datas.push({
      name:fian3[i].nldmc
    })
    datass.push({
      name:fian3[i].nldmc,
      value:fian3[i].nldrk
    })
    datasss.push(fian3[i].nld);
  } 
  var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    option = { 
        title: {
                text: '死因分析中各年龄段的死亡人口分布(可点击查看详细)',  
          },
          tooltip: {
              trigger: 'item',
              formatter: '{a} <br/>{b}: {c} ({d}%)'
          },
        color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
          '#adff2f', '#444446', '#799aec', '#61d4e2',
          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
             legend: {
            	 orient: 'vertical',
            	 x: '320px', y: '85px',      //可设定图例在左、右、居中80
                  
                 itemHeight: 7,
                 itemWidth: 7,
                 
                 width: '100%',
                 height: 200,
                 bottom: 20,
                 data: datas
             },
             series: [ 

                 {
                	 name: '死因年龄段:',
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
                     data:datass
                 }
             ]
      };

    myChart.setOption(option); 
   myChart.on('click', function(params) {    
    getechars06(datasss[params.dataIndex],ksnf,jsnf,jgdm,params.name)
        });  
}
function chart06(id,swrs,dqfl,name){
  document.getElementById("chart06").style.display="";//显示 
  var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id)); 
  var option = { 
       title: {
                text: name+'各区死亡人数',  
            }, 
            axisLabel: {  
	              interval: 0,  
	              formatter:function(value)  
	              { 
	            	 
	                  var ret = "";//拼接加\n返回的类目项  
	                  var maxLength = 2;//每项显示文字个数  
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
              },
              formatter: function(params){
                var str = "";
                var zrkItem = null;
                var hjrkItem = null;
                var ldrkItem = null; 
                var mcs = null;
                params.forEach(function(item,idx){
                  //console.log(item)
                  mcs=item; 
                });
                str += mcs.name+"<br>";
                str += name+",死亡人数:"+ mcs.data+"<br>";
                return str;
              }
           },
            color:'#00adf4',
                xAxis: {
                  type: 'category',
                  name:'乡镇',
                    data: dqfl
                },
                yAxis: {
                  name:'死亡人数',
                    type: 'value'
                },
                series: [{
                	 barWidth:40,
                    data: swrs,
                    type: 'bar',
                    showBackground: true,  
                }]
    };
    myChart.setOption(option);
}
function chart07(id,swrs2,jbflmc,name,jbflbm,nldbm,jgdm,ksnf,jsnf) {
	 
   var xMax =null;
   for(var i=0;i<swrs2.length;i++){
     xMax+=Number(swrs2[i])
   }
   if(xMax!=null){
		 xMax=xMax.toFixed(3) 
	   }
  document.getElementById("chart07").style.display="";//显示 
    var myChart = echarts.init(document.getElementById(id));
      myChart.dispose();
      myChart = echarts.init(document.getElementById(id));
      var data =  swrs2;
      var dataShadow = [];
     
      for (var i = 0; i < data.length; i++) {
          dataShadow.push({
              value: xMax,
              value2: data[i]
          });
      }
      ;
      option = {
          tooltip: {
              trigger: "axis",
              axisPointer: {
                  type: "shadow"
              }
          },
          title: {
                text: name+'各死因分类人数'+'(可点击查看详细)',  
            }, 
          grid: {
              // left: "22%",
              containLabel: true,
              left: 0,
              right: "12%",
              bottom: "0%",
              top: "4%"
          },
          xAxis: {
              type: "value",
              min: 0,
              max: xMax,
              boundaryGap: true,
              axisTick: {
                  show: false
              },
              axisLabel: {
                  show: false,
              },
              splitLine: {
                  show: false,
              },
              axisLine: {
                  show: false,
              },
          },
          yAxis: {
              type: "category",
              axisTick: {
                  show: false
              },
              axisLine: {
                  show: false
              },
              axisLabel: {
                  interval: 0,
                  color: "#333",
                  fontSize: 14,
              },
              data:  jbflmc
          },
          color: "#43bcf4",
          series: [
              {   
                  type: "bar",
                  itemStyle: {
                      normal: {
                          color: "#ffecc8",
                          barBorderRadius: [3, 3, 3, 3]
                      }
                  },
                  label: {
                      show: true,
                      position: "right",
                      fontSize: 14,
                      color: "#333",
                      padding: [0, 0, 0, 10],
                      formatter: function (params) {
                          console.log(params.data.value2);
                          return params.data.value2
                      }

                  },
                  barWidth: 10,
                  barGap: "-100%",
                  barCategoryGap: "40%",
                  data: dataShadow,
                  animation: false
              },
              {
                  type: "bar",
                  barWidth: 10,
                  itemStyle: {
                      color: "#ffb820",
                      barBorderRadius: [3, 3, 3, 3],
                  },
                  data: data,
              }
          ]
      };
      myChart.setOption(option);
      myChart.on('click', function(params) { 
    	  
         getquery(jbflbm[params.dataIndex],nldbm,jgdm,ksnf,jsnf)
             }); 
  };

  function  getquery(jbflbm,nldbm,jgdm,ksnf,jsnf){
  	 document.getElementById("idname").style.display="";//显示
  	 
  	layui.use([ 'table', 'layer' ], function() {
  		var table = layui.table;
  		table.render({
  					elem : '#querytable',
  					url : '${ctx}/swxxfx/getquery',
  					method : 'post',
  					where : { 
  						p_jbflbm : jbflbm,
						p_nldbm : nldbm,
						p_jgdm : jgdm,
						p_ksnf : ksnf,
						p_jsnf : jsnf,
  					},
  					cols : [[ 
  						{ field : 'name', title : '姓名', width : '100' }, 
	                    { field : 'xb', title : '性别', width : '100' },
	                    { field : 'csrq', title : '出生日期', width : '150' }, 
	                    { field : 'age', title : '死亡年龄', width : '120' } ,
	                    { field : 'swrq', title : '死亡日期', width : '150' } ,
	                    { field : 'swyy', title : '死亡原因', width : '230' } ,
	                    { field : 'jbflmc', title : '疾病分类名称', width : '200' },
	                    { field : 'dqfl', title : '所属地区', width : '100' }
  	                     

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
   
  function chart08(id,fian4,ksnf,jsnf,jgdm){
    var datas = [];
    var datass = [];
    var datasss = [];
    for (var i = 0; i < fian4.length; i++) {
    	
      datas.push(
    		  {name:fian4[i].jbflmc}
    		  )
      datass.push({
        name:fian4[i].jbflmc,
        value:fian4[i].swrs
      })
      datasss.push(fian4[i].jbflbm);
    } 
    var myChart=echarts.init(document.getElementById(id));
      myChart.dispose();
      myChart = echarts.init(document.getElementById(id));
      option = { 
          title: {
                  text: '疾病分类病因分布(可点击查看详细)',  
              },
              tooltip: {
                  trigger: 'item',
                  formatter: '{a} <br/>{b}: {c} ({d}%)'
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
                       name: '死亡疾病分类:',
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
       getechars09(datasss[params.dataIndex],ksnf,jsnf,jgdm,params.name)
          });  
  }
  
  
  function chart09(id,nldrks,nldmcs,name){ 
    var myChart=echarts.init(document.getElementById(id));
      myChart.dispose();
      myChart = echarts.init(document.getElementById(id)); 
    var option = { 
         title: {
                  text: name+'死亡年龄段分析',  
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
                    //console.log(item)
                    mcs=item; 
                  });
                  str += mcs.name+"年"+"<br>";
                  str +="死亡人数:"+ mcs.data+"<br>";
                  return str;
                }
             },
              color:'#00adf4',
                  xAxis: {
                    type: 'category',
                    name:'年龄段',
                      data: nldmcs
                  },
                  yAxis: {
                    name:'死亡人数',
                      type: 'value'
                  },
                  series: [{
                	  barWidth: 40,
                      data: nldrks,
                      type: 'bar',
                      showBackground: true,  
                  }]
      };
      myChart.setOption(option);
      myChart.on('click', function(params) {  
        getechart03(params.name,jgdm); 
          });    
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
				<span class="det"> <span class="sj sjKs">
						<ul id="sjxzid">
							<i value="year" class="n " onclick="sjxz('year')">年</i>
							<i value="month" class="y" onclick="sjxz('month')">月</i>
							<i value="day" class="r active" onclick="sjxz('day')">日</i>
						</ul>
				</span> <span class="det"> <label for="">开始时间</label> <input
						type="text" id="ksnf" readonly="readonly" onClick=""
						value="${ksnf }" class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jsnf" readonly="readonly" onClick=""
					value="${jsnf }" class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">乡镇名称</label> <select id="jgdm" name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${swjdList}" var="jg">
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
			<div id="chart02"
				style="width: 50%; height: 400px; background: #FFFFFF; float: left"></div>
		</div>
		<div id="chart03"
			style="width: 100%; height: 400px; background: #FFFFFF; display: none"></div>
		<div id="chart04"
			style="width: 100%; height: 380px; background: #FFFFFF; margin-top: 90px;"></div>
		<div style="position: absolute; margin-top: -7px; margin-left: 110px;">
			<span style="font-size: 15px; color: #ff0000; font-weight: bold;"
				class="name">*</span> <span>备注:婴儿期:0~3岁;幼儿期:3~5岁;学龄前期:5~7岁;学龄期:7~18岁;青春期:18~28岁;青年期:28~40岁;中年期:40~65岁;老年期:65~120岁</span>
		</div>
		<div id="chart05"
			style="width: 100%; height: 380px; background: #FFFFFF; margin-top: 90px;"></div>
		<div id="chart06"
			style="width: 50%; height: 400px; background: #FFFFFF; display: none"></div>
		<div id="chart07"
			style="width: 50%; height: 400px; background: #FFFFFF; display: none; margin-left: 590px; margin-top: -400px; float: left"></div>
		<div id="idname"
			style="width: 100%; background: #FFFFFF; margin: 35px auto; margin-top: 105px; display: none">
			<table id="querytable" class="layui-table" lay-filter="querytab"
				style="margin: -10px;"></table>

		</div>
		<div id="chart08"
			style="width: 100%; height: 400px; background: #FFFFFF;"></div>
		<div id="chart09"
			style="width: 100%; height: 400px; background: #FFFFFF; margin-top: 45px"></div>
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