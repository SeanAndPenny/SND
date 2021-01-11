<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/font-awesome.min.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/reset.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/grids.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/perfect-scrollbar.min.css"/>" rel="stylesheet"/>
   <link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/perfect-scrollbar.min.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/page.css"/>" />
  

   
   <script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts.min.js"/>"></script>    
  
  
<script type="text/javascript"
  src="<c:url value="/static/commons/js/jquery-1.11.1.min.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/laydate/laydate.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/forweb-w.js"/>"></script>
  
  
<script type="text/javascript"
  src="<c:url value="/static/commons/js/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"/>"></script>
  
  
  <%-- 
<script type="text/javascript"
  src="<c:url value="/static/commons/js/shouye-chart.js"/>"></script>   --%>  
 
  
  
  <title>新区统计</title>
  <%@ include file="/commons/meta2.jsp"%>
<script type="text/javascript"
   src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
  
  
  <style>
  	body{
  		overflow: hidden;
  	}
  	.menu,.menu:hover,.menu:active{
  		color:#fff !important;
  	}
  	
  	
  </style>
  
  <script type="text/javascript">
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
  
  
$(document).ready(function () {   
  getData();
  getData1(); 
  bassxx();
  basysearch();
  chartRank('#topList01', mockData.top01, mockData.top02);
});
var mockData = {
      top01: [
        <c:forEach items="${cwtjList}" var="cwtjList">
        {
              name  :"${cwtjList.lxmc}",value:"${cwtjList.dqsycws}"
            },
        </c:forEach>
         ],
         top02: [
           <c:forEach items="${cwtjList}" var="cwtjList">
           {
                 name  :"${cwtjList.lxmc}",value:"${cwtjList.kfcws}"
               },
           </c:forEach>
            ],
  }
//进度条

function chartRank(id, data, max1) {
  for(var j=0;j<max1.length;j++){
    max=max1[j].value   
  } 
    var $_id = $(id);
    var html = "";
    $.each(data, function (index, value) {
        var percent = (value.value / max * 100).toFixed(2);
        if (id === "#topList01") {
            console.log(123);
            html += '<li>' +
                '<h5 class="name">' + value.name + '</h5>' +
                '<div class="bar">' +
                '<div class="bar-box">' +
                '<div class="bar-inner" style="width:' + percent + '%;"></div>' +
                '</div>' +
                '<span class="number"><span class="rate">使用率</span>' + percent + '%</span>' +
                '</div>' +
                '</li>';
        } else {
            html += '<li>' +
                '<h5 class="name">' + value.name + '</h5>' +
                '<div class="bar">' +
                '<div class="bar-box">' +
                '<div class="bar-inner" style="width:' + percent + '%;"></div>' +
                '</div>' +
                '<span class="number">' + value.value + '</span>' +
                '</div>' +
                '</li>';
        }
    });
    $_id.html(html);
};
function getData(){
  var startdates=$("#startdate").val();
  var enddates=$("#enddate").val()
  
  if ($("#startdate").val()>$("#enddate").val()) {
    alert("结束日期请大于或等于开始日期");
    return;
  }
  var myDate=new Date() 
  var month=myDate.getMonth()+1;
  var year=myDate.getFullYear(); 
  if (month<10) { month = "0" + month; }
  
  if(startdates==""||startdates==null||startdates=='undefined'){ 
    var startdate=year-2+"-"+"01"+"-01";
    
  }else{ 
    var startdate=startdates; 
  }
  if(enddates==""||enddates==null||enddates=='undefined'){
    var enddate=myDate.Format('yyyy-MM-dd');  
  }else{ 
    var enddate=enddates; 
  } 
  $("#startdate").val(startdate)
   $("#enddate").val(enddate)

   layui.use(['table','layer','laydate'] , function(){
              var table = layui.table;
              var laydate=layui.laydate;
              laydate.render({ 
                  elem: '#startdate' 
              });
              laydate.render({ 
                elem: '#enddate' 
            }); 
             
              table.render({
                 
                  url: '${ctx}/xqtj/xqtj',
                  method:'post',
                  where:{p_startdate:$("#startdate").val(),p_enddate:$("#enddate").val()}          
                 
              });
              //监听工具条
              table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                  var data = obj.data //获得当前行数据
                      ,layEvent = obj.event; //获得 lay-event 对应的值
          if (layEvent === 'detail') {
            
          }else if(layEvent === 'del'){
        
          }
        });
          
          }); 
    
    chart01('chart01');
    chart02('chart02');
    chart03('chart03');
    chart04('chart04');
    chart05('chart05');
    chart06('chart06');
    chart07('chart07');
    chart09('chart09');
    chart10('chart10')
      }
function getData1_02(){
   
   
  var tableId = document.getElementById("querytable1");
  var str = "";
  var str1=[];
   
  for(var i=1;i<tableId.rows.length;i++) {
    str1=tableId.rows[i].cells[1].innerHTML; 
    }
  
   if(str1!=null&&str1!=''&&str1!='undefined'){
       getData1(str1) 
   } else {
     getData1('')  
   }
   
}
function getData1(id) {   
   
  var ywkssjs=$("#ywkssj").val();
  var ywjssjs=$("#ywjssj").val(); 
  if (ywjssjs<ywkssjs) {
    alert("结束日期请大于或等于开始日期");
    return;
  }
  var myDate=new Date() 
  var month=myDate.getMonth()+1;
  var year=myDate.getFullYear(); 
  if (month<10) { month = "0" + month; }
  if(ywkssjs==""||ywkssjs==null||ywkssjs=='undefined'){ 
    var ywkssj=year+'-'+month+'-01';
  }else{ 
    var ywkssj=ywkssjs; 
  }
  if(ywjssjs==""||ywjssjs==null||ywjssjs=='undefined'){
    var ywjssj=myDate.Format('yyyy-MM-dd');  
  }else{ 
    var ywjssj=ywjssjs; 
  } 
  $("#ywkssj").val(ywkssj)
     $("#ywjssj").val(ywjssj)
     $.ajax({
          url: "${ctx}/xqtj/ssywzs.json?p_ywkssj="+$("#ywkssj").val()
              +"&p_ywjssj="+ $("#ywjssj").val()+"&p_bz="+id,
           datatype:"json",
          context: document.body, 
          success: function(data){ 
            
             var nodes=eval(data);
            var hh= JSON.stringify(nodes);
             var xx=JSON.parse(hh);
             var fianl=xx.ssywzsList; 
              var $tbl = $("#querytable1");
              $tbl.html('');
              $tbl.append(
                '<thead>'
              +'<tr>'
            + '<th>业务时间</th>'
            + '<th style="display:none">yylx</th>'
            + '<th>门诊人次</th>'
            + '<th>急诊人次</th>'
            + '<th>在院人次</th>'
            + '<th>入院人次</th>'
            + '<th>出院人次</th>'
            + '<th>门诊费用</th>'
                        + '<th>住院费用</th>'
            + '</tr>'
            +'</thead>'
            +'<tbody>'); 
             for (var i=0;i<fianl.length;i++)
                   {   
               
                  $tbl.append(
                '<tr>'
                +'<td>'
                +' <a href="${ctx}/ssywYylx/ssywYylx?p_ids='+fianl[i].ids+'&p_ywsj='+fianl[i].sj+'  "'
                 
                 
                +' target="_blank">'
                +fianl[i].sj
            +'</a>'
                +'</td>'
                +'<td style="display:none" id="ids">'
                +fianl[i].ids
                +'</td>'
                
                 
                +'<td>'+fianl[i].mzrs +'</td>'
                +'<td>'+ fianl[i].jzrs+'</td>'
                +'<td>'+fianl[i].zyrs +'</td>'
                +'<td>'+ fianl[i].ryrs+'</td>'
                +'<td>'+fianl[i].cyrs +'</td>'
                +'<td>'+fianl[i].mzfy +'</td>'
                +'<td>'+fianl[i].zyfy +'</td>'
                +'</tr>' );
                   }
             $tbl.append('</tbody>')
              getSsywjcechats($("#ywkssj").val(),$("#ywjssj").val());  
            }
            }); 
     }

function getSsywjcechats(ywkssj,ywjssj){
    $.ajax({
      url: "${ctx}/ssywjc/getSsywjcechats.json?p_ywkssj="+ywkssj+"&p_ywjssj="+ywjssj,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
        var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.ssywjcechatsList;
         var categories = [];
        var data1 = [];
        var data2 = [];
        var data3=[];
         for (var i=0;i<fianl.length;i++)
               {   
                  
                 
                 categories.push(fianl[i].rq);
            data1.push(fianl[i].mzrs);
            data2.push(fianl[i].ryrs);
            data3.push(fianl[i].cyrs);
                 
               }
           
            chart08('chart08',categories,data1,data2,data3); 
        }
        });
  } 
function bassxx(){//病案手术查询 
  var basskssj= $("#basskssj").val();
  var bassjssj= $("#bassjssj").val();
  var bassjgdm= $("#bassjgdm").val(); 
  if (basskssj>bassjssj) {
    alert("结束日期请大于或等于开始日期");
    return;
  }
   $.ajax({
        url: "${ctx}/basscx/basscx.json?p_basskssj="+basskssj+"&p_bassjssj="+bassjssj
            +"&p_bassjgdm="+bassjgdm,
         datatype:"json",
        context: document.body, 
        success: function(data){ 
          $("#basskssj").val(data.basskssj)
           $("#bassjssj").val(data.bassjssj)
           var nodes=eval(data);
          var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.bassechatsList;
           var rs = [];
            var ssbm = [];
            var ssmc = [];
           for (var i=0;i<fianl.length;i++)
                 {   
             rs.push(fianl[i].rs);
             ssbm.push(fianl[i].ssbm);
             ssmc.push(fianl[i].ssmc);
                 }
             
              chart11('chart11',rs,ssbm,ssmc,basskssj,bassjssj,bassjgdm);  
             
          }
          });
}
function basysearch(){//病案首页病种查询
  var basystartDate= $("#basystartDate").val();
  var basyendDate= $("#basyendDate").val();
  var bajgdm= $("#bajgdm").val();
  if (basyendDate<basystartDate) {
    alert("查询的 结束日期请大于或等于开始日期");
    return;
  }
   $.ajax({
        url: "${ctx}/basycx/basycx.json?p_kssj="+basystartDate+"&p_jssj="+basyendDate
            +"&p_bajgdm="+bajgdm,
         datatype:"json",
        context: document.body, 
        success: function(data){
          $("#basystartDate").val(data.kssj)
           $("#basyendDate").val(data.jssj)
           var nodes=eval(data);
          var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.basycxechatsList;
           var rs = [];
            var jbdm = [];
            var jbmc = [];
            var rq  =[];
           for (var i=0;i<fianl.length;i++)
                 {     
             rs.push(fianl[i].rs);
             jbdm.push(fianl[i].jbdm);
             jbmc.push(fianl[i].jbmc); 
                   
                 }
            
              chart12('chart12',rs,jbdm,jbmc,basystartDate,basyendDate,bajgdm); 
          }
          });
}
function chart12(id,rs,jbdm,jbmc,basystartDate,basyendDate,bajgdm) {
  var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    var data = rs
   var dataShadow = [];
    var xMax = 300;
    for (var i = 0; i < data.length; i++) {
        dataShadow.push({
            value: xMax,
            value2: data[i]
         });
    } ;
    option = {
        
        tooltip: {
            trigger: "axis",
            axisPointer: {
                type: "shadow"
            }
        },
        grid: {
            // left: "22%",
            containLabel: true,
            left: 0,
            right: "14%",
            bottom: "0%",
            top: "4%"
        },
        xAxis: {
            type: "value",
             
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
            data:jbdm
        },
        color: "#43bcf4",
        series: [
            {
                // For shadow
                type: "bar",
                itemStyle: {
                    color: "#bce8da",
                    barBorderRadius: [3, 3, 3, 3]
                },
                label: {
                    show: true,
                    position: "right",
                    fontSize: 13,
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
                    barBorderRadius: [3, 3, 3, 3],
                    color:"#57c5a2"
                },

                data: data,
            }
        ]
    };
    myChart.setOption(option);
    myChart.on('click', function(param) { 
        
        window.open("${ctx}/basycx/basyxz?p_kssj="+basystartDate
            +"&p_jssj="+basyendDate+"&p_jbdm="+jbdm[param.dataIndex]
                +"&p_bajgdm="+bajgdm);
       
         });
};
function chart11(id,rs,ssbm,ssmc,basskssj,bassjssj,bassjgdm) {
  
  var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    var data =  rs;
    var dataShadow = [];
    var xMax = 300;
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
            data:  ssmc
        },
        color: "#43bcf4",
        series: [
            {
                // For shadow
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
    myChart.on('click', function(param) { 
      window.open("${ctx}/basscx/bassxz?p_kssj="+basskssj
            +"&p_jssj="+bassjssj+"&p_jgdm="+bassjgdm
                +"&p_ssbm="+ssbm[param.dataIndex]);
    }
   )
      
};
function chart01(id) {
  var pidList =<%=request.getAttribute("pidList")%>;
  var pidList2 =<%=request.getAttribute("pidList2")%>;
    var myChart = echarts.init(document.getElementById(id));
    option = {
        color:['#76caf4', '#00adf4', '#57c5a2', '#86cb68',
        '#f7a932', '#ee7a8d', '#9884f3', '#6288d1',
        '#066fd8', '#87ceeb', '#32cd32' ],
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        series: [
            {
                name: '医疗机构占比分布',
                type: 'pie',
                radius: ['5%', '42%'],
                center: ['50%', '46%'],
                avoidLabelOverlap: true,
                hoverOffset:5,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    position: 'inside',
                    color: "#fff",
                    fontSize: 13,
                },
                data: [
                     
                  <c:forEach var="tbList" items="${tbList}">
                {
                  name  :"${tbList.jcfl}",value:"${tbList.rs}"
                },
                </c:forEach>
                ]
            },
            {
                name: '医疗机构占比分布',
                type: 'pie',
                radius: ['50%', '63%'],
                center: ['50%', '46%'],
                avoidLabelOverlap: true,
                hoverOffset:5,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return " ● " + "{a|" + params.data.name + "，}" + "{b|占比：" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 13
                        },
                        b: {
                            color: "#333333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 22,
                    length2: 14,
                    lineStyle: {
                        // color: '#627da3',
                    }
                },
                data: [ 
                  <c:forEach var="tbList2" items="${tbList2}">
          {
              value:"${tbList2.rs}",name :"${tbList2.id_name}"
          },
          </c:forEach>  
                ]
            }]
    };
    myChart.setOption(option);
    myChart.on('click', function(params) { 
      if(params.seriesIndex==0){ 
  window.open("${ctx}/xqtj/xqtj2?p_pid="+pidList[params.dataIndex]
       +"&p_startdate="+$("#startdate").val()+"&p_enddate="+$("#enddate").val());
   } else  if(params.seriesIndex==1){
  window.open("${ctx}/xqtj/xqtj3?p_pid="+pidList2[params.dataIndex]
              +"&p_startdate="+$("#startdate").val()+"&p_enddate="+$("#enddate").val());
      }  
      });
    
};
function chart02(id) {
  var GrsList =<%=request.getAttribute("GrsList")%>;
  var LxList =<%=request.getAttribute("LxList")%>;
  var Lx2List =<%=request.getAttribute("Lx2List")%>;
  var CrsList =<%=request.getAttribute("CrsList")%>;
  var ZrsList =<%=request.getAttribute("ZrsList")%>;
  
     
    var myChart = echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    var option = {
        color:['#86cb68', '#00adf4', '#066fd8', 
          '#87ceeb', '#32cd32' ],
        tooltip: {
            trigger: 'axis',
            padding: [5, 10],
            //backgroundColor: '#529bfb',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: 46,
            right: 37,
            top: 50,
            bottom: 45,
        },
        legend: {
            top: 10,
            right: 35,
            itemWidth: 15,
            itemHeight: 9,
            bottom: -5,
            data: [ '高级职称','中级职称','初级职称' ]
        },
        xAxis:
        {
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
                fontSize: 12,
                color: '#333',
                interval: 0,
                margin: 14,
            },
            data: LxList,
        },
        yAxis: [
            {
                type: 'value',
                interval: 200,
                min: 0,
                max: 1000,
                name: "人次",
                nameTextStyle: {
                    fontSize: 12,
                    color: '#333',
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
                    color: ["#f6f8fb", "#fff"]
                },
                axisLabel: {
                    fontSize: 12,
                    color: '#333'
                },

            }
        ],
        series: [
            {
                name: '高级职称',
                type: 'bar',
                barWidth: 19,
                itemStyle: {
                    barBorderRadius: [2, 2, 2, 2],
                    color: '#86cb68'
                },
                data: GrsList
            },
            {
                name: '中级职称',
                type: 'bar',
                barWidth: 19,
                itemStyle: {
                    barBorderRadius: [2, 2, 2, 2],
                    color: '#00adf4'
                },
                data: ZrsList
            },
            {
                name: '初级职称',
                type: 'bar',
                barWidth: 19,
                itemStyle: {
                    barBorderRadius: [2, 2, 2, 2],
                    color: '#066fd8'
                },
                data: CrsList
            },
        ]
    };
    myChart.setOption(option);
    myChart.on('click', function(param) { 
      window.open("${ctx}/ryxz/ryxzjg?p_jb="+param.seriesName+"&p_zc="+Lx2List[param.dataIndex]);
          }); 
    };
     function chart03(id) {
       var yylxList =<%=request.getAttribute("yylxList")%>; 
        var myChart = echarts.init(document.getElementById(id));
        myChart.dispose();
        myChart = echarts.init(document.getElementById(id));
        option = {
            color:['#066fd8','#627da3','#9684f2', '#ee7a8d', '#ffc231', 
            '#86cb68', '#57c5a2','#00adf4',
             '#76caf4','#527df9'],
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            series: [
                {
                    name:"出生人数统计",
                    type: 'pie',
                    radius: ['38%', '50%'],
                    center: ['50%', '50%'],
                    avoidLabelOverlap: true,
                    hoverOffset:5,
                    itemStyle: {
                        borderColor: '#fff',
                        borderWidth: 2,
                    },
                    label: {
                        show: true,
                        fontSize: 13,
                        formatter: function (params) {
                            return " ● " + "{a|" + params.data.name + "}" + "\n " + "{b|" + params.percent + "%}"
                        },
                        lineHeight: 18,
                        rich: {
                            a: {
                                color: "#333",
                                fontSize: 13
                            },
                            b: {
                                color: "#333",
                                fontSize: 13
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length: 10,
                        length2: 8
                    },
                    data: [ 
                      <c:forEach var="csrsList" items="${csrsList}">
                      {
                        name  :"${csrsList.yylxmc}",value:"${csrsList.csrs}"
                      },
                      </c:forEach>
                    ]
                }]
        };
        myChart.setOption(option);
        myChart.on('click', function(param) { 
           
        window.open("${ctx}/csrsXzjg/csrsXzjg?p_yylx="+yylxList[param.dataIndex]);
         
      });   
    };
    function chart04(id) {
       var idList =<%=request.getAttribute("idList")%>; 
       var myChart = echarts.init(document.getElementById(id));
       myChart.dispose();
       myChart = echarts.init(document.getElementById(id));
        option = {
            color:['#00adf4','#57c5a2','#627da3'     ],
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                bottom: 0,
                data: [ 
                  <c:forEach var="cwList" items="${cwList}">
                        {
                    name  :"${cwList.lxmc}" ,icon: "circle"
                       },
                  </c:forEach>]
            },
            series: [
                {
                    name:"床位统计",
                    type: 'pie',
                    radius: ['29%', '42%'],
                    center: ['50%', '50%'],
                    avoidLabelOverlap: true,
                    hoverOffset:5,
                    startAngle: 200,
                    itemStyle: {
                        borderColor: '#fff',
                        borderWidth: 2,
                    },
                    label: {
                        show: true,
                        color: "#627da3",
                        fontSize: 13,
                        formatter: function (params) {
                            return "{a|" + params.data.name + "\n" + "共" + params.data.value + "条}" + "\n" + "{b|占比：" + params.percent + "%}"
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
                        length2: 5
                    },
                    data: [ 
                      <c:forEach var="cwList" items="${cwList}">
                        {
                          name  :"${cwList.lxmc}",value:"${cwList.hdcws}"
                        },
                        </c:forEach>
                    ]
                }]
        };
        myChart.setOption(option);
        myChart.on('click', function(param) { 
          window.open("${ctx}/cwtj/cwtjXzJg?p_id="+idList[param.dataIndex]);
           
        });
    };
    
    function chart05(id) {
      var qyjgidList =<%=request.getAttribute("qyjgidList")%>;
      var myChart = echarts.init(document.getElementById(id));
        myChart.dispose();
        myChart = echarts.init(document.getElementById(id));
        option = {
          color:['#9684f2','#6288d1', '#00adf4', '#76caf4', 
          '#57c5a2', '#86cb68','#527df9'],
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            series: [
                {
                    name:"签约机构占比",
                    type: 'pie',
                    radius: ['45%', '62%'],
                    center: ['50%', '47%'],
                    avoidLabelOverlap: true,
                    hoverOffset:5,
                    itemStyle: {
                        borderColor: '#fff',
                        borderWidth: 2,
                    },
                    label: {
                        show: true,
                        fontSize: 13,
                        formatter: function (params) {
                            return " ● " + "{a|" + params.data.name + "\n " + "签约" + params.data.value + "人," + "}" + "{b|占比：" + params.percent + "%}"
                        },
                        lineHeight: 18,
                        rich: {
                            a: {
                                color: "#333",
                                fontSize: 13
                            },
                            b: {
                                color: "#333",
                                fontSize: 13
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length: 5,
                        length2: 5,
                        lineStyle: {
                            color: '#627da3',
                        }
                    },
                    data: [ 
                      <c:forEach var="jtysJg" items="${jtysJgList}">
                      {
                        value:"${jtysJg.rs}",name :"${jtysJg.qyjgmc}"
                      },
                      </c:forEach>
                    ]
                }]
        };
        myChart.setOption(option);
        myChart.on('click', function(param) { 
          window.open("${ctx}/jtysJgxz/jtysJgxz?p_qyjgid="+qyjgidList[param.dataIndex]);
       });
    }; 
    function chart06(id) {
      var sfwsList =<%=request.getAttribute("sfwsList")%>;
      var myChart = echarts.init(document.getElementById(id));
      myChart.dispose();
      myChart = echarts.init(document.getElementById(id));
        var option = {
            color:['#527df9','#fcb145' ],
            legend: {
                orient: 'vertical',
                left: 'center',
                itemHeight: 7,
                itemWidth: 7,
                itemGap: 25,
                width: 200,
                height: 30,
                bottom: 20,
                data: [
                  <c:forEach var="jyList" items="${jyList}">
                {
                  name  :"${jyList.lbmc}" 
                },
                </c:forEach>
                ]
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
                            return "{a|" + params.data.name + "\n" + "共" + params.data.value + "条}" + "\n" + "{b|占比：" + params.percent + "%}"
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
                    data: [
                      <c:forEach var="jyList" items="${jyList}">
                        {
                          name  :"${jyList.lbmc}",value:"${jyList.rs}"
                        },
                        </c:forEach> 
                    ]
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
        //下钻
        myChart.on('click', function(param) { 
          window.open("${ctx}/JyXzJg/JyXzJg?p_sfws="+sfwsList[param.dataIndex]);
        });
       
        
    };
    function chart07(id) {
    	var myChart = echarts.init(document.getElementById(id));
        myChart.dispose();
        myChart = echarts.init(document.getElementById(id));
        var option = {
            legend: {
                orient: 'vertical',
                left: 'center',
                itemHeight: 7,
                itemWidth: 7,
                itemGap: 25,
                height: 30,
                bottom: 20,
                data: [
                    {
                        name: '远程影像',
                        icon: 'circle'
                    },
                    {
                        name: '本院影像',
                        icon: 'circle'
                    }
                ]
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
                            return "{a|" + params.data.name + "\n" + "共" + params.data.value + "条}" + "\n" + "{b|占比：" + params.percent + "%}"
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
                    data: [
                        {
                            value: 30000,
                            name: '远程影像',
                            itemStyle: {
                                color: "#ee7a8d"
                            }
                        },
                        {
                            value: 88879,
                            name: '本院影像',
                            itemStyle: {
                                color: "#f7a932"
                            }
                        }
                    ]
                }
            ]
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
        
    };
  function chart08(id,categories,data1,data2,data3) {
	  var myChart = echarts.init(document.getElementById(id));
      myChart.dispose();
      myChart = echarts.init(document.getElementById(id));
        var option = {
            tooltip: {
                trigger: "axis",
                axisPointer: {
                    type: "shadow"
                }
            },
            legend: {
                orient: 'vertical',
                right: "8%",
                itemGap: 12,
                height: 20,
                top: 17,
                itemWidth:19,
                itemHeight:9,
                data: [
                    {
                        name: '门诊人次',
                    },
                    {
                        name: '入院人次',
                    },
                    {
                        name: '出院人次',
                    }
                ]
            },
            grid: {
                left: "17%",
                right: "8%",
                bottom: "15%",
                top: "15%"
            },
            xAxis: {
                type: "category",
                boundaryGap: true,
                zlevel: 10,
                axisTick: {
                    show: false
                },
                axisLabel: {
                    show: true,
                    color: "#333",
                    fontSize: 13,
                    interval: 5,
                    margin: 15
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
                splitArea: {
                    show: false,
                    color: ["#f6f8fb", "#fff"]
                },
                data: categories
            },
            yAxis: {
                type: "value",
                name: "人数",
                zlevel: 0,
                nameTextStyle: {
                    color: "#333",
                    fontSize: 13
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
                    show: true,
                    lineStyle: {
                        color: "#d3dae6"
                    }
                },
                axisLabel: {
                    show: true,
                    color: "#333",
                    fontSize: 13,
                    interval: 0,
                    margin:12
                },
            },
            series: [
                {
                    name: "门诊人次",
                    type: "line",
                    symbolSize: 8,
                    smooth: true,
                    itemStyle: {
                        color: "#2e82ff",
                        borderWidth:2,
                    },
                    lineStyle: {
                        color: '#2e82ff',
                        width: 1
                    },
                    data: data1
                },
                {
                    name: "入院人次",
                    type: "line",
                    symbolSize: 8,
                    smooth: true,
                    itemStyle: {
                        color: "#ee7c8e",
                        borderWidth:2,
                    },
                    lineStyle: {
                        color: '#ee7c8e',
                        width: 1
                    },
                    data: data2
                },
                {
                    name: "出院人次",
                    type: "line",
                    symbolSize: 8,
                    smooth: true,
                    itemStyle: {
                        color: "#f7ab38",
                        borderWidth:2,
                    },
                    lineStyle: {
                        color: '#f7ab38',
                        width: 1
                    },
                    data: data3
                }
            ]
        };
        myChart.setOption(option);
        myChart.on('click', function(param) { 
        
        if(param.seriesIndex==0){//实时业务数据监测门诊人数下钻
          window.open("${ctx}/ssywjcMzrsXz/ssywjcMzrsXz?p_rq="+param.name
           );
        }else if(param.seriesIndex==1){//实时业务数据监测入院人数下钻
          window.open("${ctx}/ssywjc/ssywjcRyrsXz?p_rq="+param.name 
              );  
        }else if(param.seriesIndex==2){//实时业务数据监测出院人数下钻
          window.open("${ctx}/ssywjcCyrsXz/ssywjcCyrsXz?p_rq="+param.name
           );
        }
        
        
          });
    };  
    function chart09(id) {
      var myChart = echarts.init(document.getElementById(id));
      var ssyljgdmList =<%=request.getAttribute("ssyljgdmList")%>;
        myChart.dispose();
        myChart = echarts.init(document.getElementById(id));
        option = {
            color:['#00adf4','#86cb68','#9884f3','#6288d1',
                 '#066fd8','#627da3', '#9684f2', '#ee7a8d',
                 '#ffc231','#57c5a2', '#76caf4','#527df9'],
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                bottom: 0,
                itemHeight:8,
                itemWidth:8,
                data: [
                  
                <c:forEach var="ssjgList" items="${ssjgList}">
                {
                  name :"${ssjgList.yljgmc}",icon: "circle"
                },
                </c:forEach>
                     
                ]
            },
            series: [
                {
                    name:"区域手术汇总",
                    type: 'pie',
                    radius: ['45%', '62%'],
                    center: ['50%', '40%'],
                    avoidLabelOverlap: true,
                    hoverOffset:4,
                    itemStyle: {
                        borderColor: '#fff',
                        borderWidth: 2,
                    },
                    label: {
                        show: true,
                        fontSize: 13,
                        formatter: function (params) {
                            return "{a|" + params.data.name + "}" + "\n " + "{b|占比:" + params.percent + "%}"
                        },
                        lineHeight: 18,
                        rich: {
                            a: {
                                color: "#333",
                                fontSize: 13
                            },
                            b: {
                                color: "#333",
                                fontSize: 13
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length: 12,
                        length2: 8,
                        lineStyle: {
                            color: '#627da3',
                        }
                    },
                    data: [
                      <c:forEach var="ssjgList" items="${ssjgList}">
                    {
                      value:"${ssjgList.rs}",name :"${ssjgList.yljgmc}"
                    },
                    </c:forEach>
                       
                    ]
                }]
        };
        myChart.setOption(option);
        myChart.on('click', function(param) { 
          window.open("${ctx}/ssJgxzKS/ssJgxzKS?p_yljgdm="+ssyljgdmList[param.dataIndex]);
        });
    };
    function chart10(id) {
        var myChart = echarts.init(document.getElementById(id));
        var jdlxList =<%=request.getAttribute("jdlxList")%>;
        option = {
            color:[ '#00adf4', '#9684f2', '#6288d1' ], 
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                bottom: 0,
                itemHeight:8,
                itemWidth:8,
                data: [
                  <c:forEach var="jdtjList" items="${jdtjList}"> 
                    {
                        name  :"${jdtjList.lxmc}" ,icon: "circle"
                      },
                      </c:forEach>
                   
                ]
            },
            series: [
                {
                    name:"全区建档人数",
                    type: 'pie',
                    radius: ['45%', '62%'],
                    center: ['50%', '40%'],
                    avoidLabelOverlap: true,
                    hoverOffset:4,
                    itemStyle: {
                        borderColor: '#fff',
                        borderWidth: 2,
                    },
                    label: {
                        show: true,
                        fontSize: 13,
                        formatter: function (params) {
                            return "{a|" + params.data.name + "}" + "\n " + "{b|占比:" + params.percent + "%}"
                        },
                        lineHeight: 18,
                        rich: {
                            a: {
                                color: "#333",
                                fontSize: 13
                            },
                            b: {
                                color: "#333",
                                fontSize: 13
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length: 12,
                        length2: 8,
                        lineStyle: {
                            color: '#627da3',
                        }
                    },
                    data: [ 
                      <c:forEach var="jdtjList" items="${jdtjList}">
                        {
                          name  :"${jdtjList.lxmc}",value:"${jdtjList.rs}"
                        },
                        </c:forEach>
                    ]
                }]
        };
        myChart.setOption(option);
        myChart.on('click', function(param) { 
           window.open("${ctx}/jdTjxx/jdtjXzxx?p_jdlx="+jdlxList[param.dataIndex]);  
        });
    };
    
function searchcx(){
  var c='<%=request.getAttribute("mc")%>'
  if(c=="基层"){
    searchjc()
  }else if(c=="综合"){
    searchzh();
  }
}
function searchjc() {
   
   window.location.href="${ctx}/xqtj/xqtj?p_startdate="+$("#startdate").val()
  +"&p_enddate="+$("#enddate").val()+"&p_ywlx=jcyy";
   
};
 function searchzh() {
   if ($("#startdate").val()>$("#enddate").val()) {
      alert("结束日期请大于或等于开始日期");
      return;
    }
   window.location.href="${ctx}/xqtj/xqtj?p_startdate="+$("#startdate").val()
  +"&p_enddate="+$("#enddate").val()+"&p_ywlx=zhyy"; 
} 
 
 function rylb(){
   var vs = $('select  option:selected').val();
   
   if(vs=="zc"){ 
     
     chart02("chart02") ;
     
    } else if(vs=="xl"){
      var XllxList =<%=request.getAttribute("XllxList")%>;
      var XlrsList =<%=request.getAttribute("XlrsList")%>;
      
      
      
      var myChart = echarts.init(document.getElementById('chart02'));
          myChart.dispose();
          var myChart = echarts.init(document.getElementById('chart02'));
      var option = { 
          
          tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                  type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
                  formatter: '{b}<br/>{c}'
                }
             },
             color:['#066fd8'],
             legend: {
                     data: ["学历统计"]
                 },
               grid: {left: 46,
                  right: 37,
                  top: 50,
                  bottom: 45,
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
            xAxis: {
                type: 'category',
                data: XllxList
            },
            yAxis: {
              type: 'value',
                    interval: 200,
                    min: 0,
                    max: 1000,
                    name: "人次",
                    nameTextStyle: {
                        fontSize: 20,
                        color: '#333',
                    }
            },
            series: [{
              
                type: 'bar',
                barWidth:20,
                data: XlrsList
            }],
            label: {
                normal: {
                    show: true,
                    position: 'top',
                    textStyle: {
                      color: 'black'
                    }
                }
             }
        };
      myChart.setOption(option);
      
   } 
   
}
 function sscx(){
   if($("#sscx").val()=="ssjgcx"){//手术按机构分
     chart09("chart09")
   }else if($("#sscx").val()=="ssjbcx"){//手术按级别分
       var ssjbdmList =<%=request.getAttribute("ssjbdmList")%>;
            var myChart = echarts.init(document.getElementById('chart09'));
         myChart.dispose();
          myChart = echarts.init(document.getElementById('chart09'));
          option = {
              color:['#ffc231','#57c5a2','#9884f3','#6288d1',
                   '#066fd8','#627da3', '#9684f2', '#ee7a8d',
                    '#76caf4','#527df9'],
              tooltip: {
                  trigger: 'item',
                  formatter: "{a} <br/>{b}: {c} ({d}%)"
              },
              legend: {
                  bottom: 0,
                  itemHeight:8,
                  itemWidth:8,
                  data: [
                    
                  <c:forEach var="ssjbList" items="${ssjbList}">
                  {
                    name :"${ssjbList.ssjbmc}",icon: "circle"
                  },
                  </c:forEach>
                       
                  ]
              },
              series: [
                  {
                      name:"区域手术汇总",
                      type: 'pie',
                      radius: ['45%', '62%'],
                      center: ['50%', '40%'],
                      avoidLabelOverlap: true,
                      hoverOffset:4,
                      itemStyle: {
                          borderColor: '#fff',
                          borderWidth: 2,
                      },
                      label: {
                          show: true,
                          fontSize: 13,
                          formatter: function (params) {
                              return "{a|" + params.data.name + "}" + "\n " + "{b|占比:" + params.percent + "%}"
                          },
                          lineHeight: 18,
                          rich: {
                              a: {
                                  color: "#333",
                                  fontSize: 13
                              },
                              b: {
                                  color: "#333",
                                  fontSize: 13
                              }
                          }
                      },
                      labelLine: {
                          show: true,
                          length: 12,
                          length2: 8,
                          lineStyle: {
                              color: '#627da3',
                          }
                      },
                      data: [
                        <c:forEach var="ssjbList" items="${ssjbList}">
                      {
                        value:"${ssjbList.rs}",name :"${ssjbList.ssjbmc}"
                      },
                      </c:forEach>
                         
                      ]
                  }]
          };
          myChart.setOption(option);
          myChart.on('click', function(param) { 
            window.open("${ctx}/ssJbxzJg/ssJbxzJg?p_ssjb="+ssjbdmList[param.dataIndex]);
          }); 
   }
     
 }
 function cslxcx(){
   
   
    if($("#cslxcx").val()=="cszmcx"){
      
      var csrstj='<%=request.getAttribute("csrstj")%>'
        $("#csrs").html(csrstj);
      
      chart03("chart03");
      
    }else if ($("#cslxcx").val()=="fmjlcx"){
    
      var hjbzList =<%=request.getAttribute("hjbzList")%>;
      var fmcstj='<%=request.getAttribute("fmcsrstj")%>'
        $("#csrs").html(fmcstj)
          var myChart = echarts.init(document.getElementById("chart03"));
      myChart.dispose();
      myChart = echarts.init(document.getElementById("chart03"));
          option = {
              color:['#066fd8','#627da3','#9684f2', '#ee7a8d', '#ffc231', 
              '#86cb68', '#57c5a2','#00adf4',
               '#76caf4','#527df9'],
              tooltip: {
                  trigger: 'item',
                  formatter: "{a} <br/>{b}: {c} ({d}%)"
              },
              series: [
                  {
                      name:"分娩记录统计",
                      type: 'pie',
                      radius: ['38%', '50%'],
                      center: ['50%', '50%'],
                      avoidLabelOverlap: true,
                      hoverOffset:5,
                      itemStyle: {
                          borderColor: '#fff',
                          borderWidth: 2,
                      },
                      label: {
                          show: true,
                          fontSize: 13,
                          formatter: function (params) {
                              return " ● " + "{a|" + params.data.name + "}" + "\n " + "{b|" + params.percent + "%}"
                          },
                          lineHeight: 18,
                          rich: {
                              a: {
                                  color: "#333",
                                  fontSize: 13
                              },
                              b: {
                                  color: "#333",
                                  fontSize: 13
                              }
                          }
                      },
                      labelLine: {
                          show: true,
                          length: 10,
                          length2: 8
                      },
                      data: [ 
                        <c:forEach var="fmrsList" items="${fmrsList}">
                          {
                            name  :"${fmrsList.hjbzmc}",value:"${fmrsList.csrs}"
                          },
                          </c:forEach>
                      ]
                  }]
          };
          myChart.setOption(option);
          myChart.on('click', function(param) { 
          window.open("${ctx}/fmxz/fmxzJg?p_hjbz="+hjbzList[param.dataIndex]);
      });         
    }
  }
 function jtyslb(){
   if($("#jtyslb").val()=="qyfwb"){
     var qyfwbidList =<%=request.getAttribute("qyfwbidList")%>;
     var myChart = echarts.init(document.getElementById("chart05"));
     myChart.dispose();
          myChart = echarts.init(document.getElementById("chart05"));
        option = {
            color:['#9684f2','#6288d1', '#00adf4', '#76caf4', 
              '#57c5a2', '#86cb68','#527df9'],
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            series: [
                {
                    name:"签约服务包占比",
                    type: 'pie',
                    radius: ['45%', '62%'],
                    center: ['50%', '47%'],
                    avoidLabelOverlap: true,
                    hoverOffset:5,
                    itemStyle: {
                        borderColor: '#fff',
                        borderWidth: 2,
                    },
                    label: {
                        show: true,
                        fontSize: 13,
                        formatter: function (params) {
                            return " ● " + "{a|" + params.data.name + "\n " + "签约" + params.data.value + "人," + "}" + "{b|占比：" + params.percent + "%}"
                        },
                        lineHeight: 18,
                        rich: {
                            a: {
                                color: "#333",
                                fontSize: 13
                            },
                            b: {
                                color: "#333",
                                fontSize: 13
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length: 5,
                        length2: 5,
                        lineStyle: {
                            color: '#627da3',
                        }
                    },
                    data: [ 
                      <c:forEach var="jtysFwt" items="${jtysFwbList}">
                    {
                      value:"${jtysFwt.rs}",name :"${jtysFwt.fwbmc}"
                    },
                    </c:forEach>
                    ]
                }]
        };
        myChart.setOption(option); 
        myChart.on('click', function(param) { 
          window.open("${ctx}/jtysFwbXz/jtysFwbXz?p_fwbid="+qyfwbidList[param.dataIndex]);
     });
        
   }else if($("#jtyslb").val()=="qytd"){ 
     var qytdbhList =<%=request.getAttribute("qytdbhList")%>;
     var myChart = echarts.init(document.getElementById("chart05"));
     myChart.dispose();
          myChart = echarts.init(document.getElementById("chart05"));
        option = {
            color:['#9684f2','#6288d1', '#00adf4', '#76caf4', 
              '#57c5a2', '#86cb68','#527df9'],
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            series: [
                {
                    name:"签约团队占比",
                    type: 'pie',
                    radius: ['45%', '62%'],
                    center: ['50%', '47%'],
                    avoidLabelOverlap: true,
                    hoverOffset:5,
                    itemStyle: {
                        borderColor: '#fff',
                        borderWidth: 2,
                    },
                    label: {
                        show: true,
                        fontSize: 13,
                        formatter: function (params) {
                            return " ● " + "{a|" + params.data.name + "\n " + "签约" + params.data.value + "人," + "}" + "{b|占比：" + params.percent + "%}"
                        },
                        lineHeight: 18,
                        rich: {
                            a: {
                                color: "#333",
                                fontSize: 13
                            },
                            b: {
                                color: "#333",
                                fontSize: 13
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length: 5,
                        length2: 5,
                        lineStyle: {
                            color: '#627da3',
                        }
                    },
                    data: [ 
                      <c:forEach var="jtystd" items="${jtystdList}">
                    {
                      value:"${jtystd.rs}",name :"${jtystd.tdmc}"
                    },
                    </c:forEach>
                    ]
                }]
        };
        myChart.setOption(option); 
        myChart.on('click', function(param) { 
          window.open("${ctx}/jtysTdXzYs/jtysTdXzYs?p_tdbh="+qytdbhList[param.dataIndex]);
    
        });
     
   }else if($("#jtyslb").val()=="qyjg"){ 
     chart05("chart05");
   }
 };
</script>
  
</head>

<body> 
  <div class="page-shouye">
    <!-- 头部 start -->
    
    <!-- 头部 end -->

    <!-- 主体 start -->
     
     
      <ul class="wd-g">
        <li class="mode wd-u-3-4 mode01">
          <div class="itembg">
            <div class="mode-top">
              <ul> 
             <li  onclick="searchzh()">综合医院</li>
      <li  class="layui-this" onclick="searchjc()">基层医院</li>
              </ul>
              <div class="time-choose">
                <span class="start-time">注册开始时间</span>
                <span class="input-box">
                  <input type="text"
            id="startdate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${startdate }'
            class="start-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <span class="end-time">注册结束时间</span>
                <span class="input-box">
                  <!-- <input type="text" class="end-input" placeholder="2019-09" id="test2"> -->
                  <input type="text"
            id="enddate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${enddate }'
            class="end-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <button onclick="searchcx()">查询</button>
              </div>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle01.png"/>">
                <span id="searchyy"><%=request.getAttribute("mc")%>医院</span>
                <span class="num1"><%=request.getAttribute("xsnr")%></span>
                <span>家，占比</span>
                <span class="num2"><%=request.getAttribute("xsnr2")%></span>
                <span>%</span>
              </div>
              <ul>
                <li class="left-part">
                  <div class="echarts-box">
                    <span class="planer-name">
                      <span class="icon"></span>
                      <span class="name">医疗机构占比分布</span>
                      <span class="icon"></span>
                    </span>
                    <div class="chart01" id="chart01"></div>
                  </div>
                </li>
                <li class="right-part">
                  <div class="echarts-box">
                    <span class="planer-name">
                      <span class="icon"></span>
                      <span class="name">人员类型分析</span>
                      <span class="icon"></span>
                    </span>
                    <div class="select-box">
                          <select id="rylb" name="rylb" onchange="rylb()">
                            <c:forEach items="${rylbList}" var="rylb">
                <option value="${rylb.lbdm}">${rylb.lbmc}</option>
                 </c:forEach>
                </select>
                      
                    </div>
                    <div class="chart02" id="chart02"></div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mode wd-u-1-4 mode02">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>出生人数统计(本年)</span>
            </div>
            <div class="select-box">
              <select id="cslxcx" name="cslxcx" onchange="cslxcx()">
        <c:forEach items="${csrscxlbList}" var="cslxcx">
          <option value="${cslxcx.lbdm}">${cslxcx.lbmc}</option>
        </c:forEach>
      </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
               <img src="<c:url value="/static/commons/images/subtitle02.png"/>">
                <!-- <img src="images/subtitle02.png" alt=""> -->
                <span >全区本年度出生人数</span>
                <span  id="csrs"  class="num1"><%=request.getAttribute("csrstj")%></span>
                <span>人</span>
              </div>
              <div class="echarts-box">
                <div class="chart03" id="chart03"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-3-8 mode03">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>急救资源统计(当月)</span>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle03.png"/>">
                <!-- <img src="images/subtitle03.png" alt=""> -->
                <span>全区应急车辆</span>
                <span class="num1"><%=request.getAttribute("yjcl")%></span>
                <span>辆</span>
              </div>
              <div class="table-box">
                <div id="viewTable" class="view">
                  <div class="fixed-header-table"></div>
                  <table class="table-data">
                    <thead>
                      <tr>
                        <th>医院名称</th>
                        <th>当月出车量</th>
                        <th>平均响应时间(分)</th>
                      </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${yjclList}" var="yjclList">
                           <tr> 
                              <td> <a
              href="${ctx}/yjclXx/yjclXx?p_yljgdm=${yjclList.yljgdm}"
                target="_blank"> ${yjclList.yljgmc}</i>
              </a>
              </td>
                    <td >${yjclList.dyccl}</td>
                    <td >${yjclList.ccpjxjsj}</td> 
                </tr>
                       </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-5-8 mode04">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>区域床位统计(当天)</span>
            </div>
            <div class="mode-main">
              <div class="left-part">
                <div class="subtitle">
                  <span class="icon"></span>
                  <span>资源数据统计</span>
                </div>
                <div class="table-box">
                  <div class="view">
                    <table class="table-data">
                      <thead>
                        <tr>
                          <th>医院类型</th>
                          <th>核定床位数</th>
                          <th>开放床位数</th>
                          <th>当前使用数</th>
                          <th>剩余数</th>
                          <th>床位使用率</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${cwtjList}" var="cwtjList">
                        <tr> 
                          <td> <a
              href="${ctx}/cwtj/cwtjXzJg?p_id=${cwtjList.id}"
                target="_blank"> ${cwtjList.lxmc}</i>
              </a>
              </td>
                          <td>   ${cwtjList.hdcws} </td>
                          <td>${cwtjList.kfcws}</td>
                          <td>${cwtjList.dqsycws}</td>
                          <td>${cwtjList.sycws}</td>
                          <td>${cwtjList.cwsyl}</td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
                <ul id="topList01" class="top-list top-01"></ul>
              </div>
              <div class="echarts-box">
                <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">床位统计</span>
                  <span class="icon"></span>
                </span>
                <div class="chart04" id="chart04"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-3-8 mode05">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>家庭医生签约(当月)</span>
            </div>
            <div class="select-box">
              <select id="jtyslb" name="jtyslb" onchange="jtyslb()">
                <c:forEach items="${jtyslbList}" var="jtyslb">
          <option value="${jtyslb.lbdm}">${jtyslb.lbmc}</option>
        </c:forEach>
      </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitl04.png"/>">
              
                <!-- <img src="images/subtitl04.png" alt=""> -->
                <span>全区本月度签约人数</span>
                <span class="num1"><%=request.getAttribute("jtystj")%></span>
                <span>人</span>
              </div>
              <div class="echarts-box">
                <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">签约机构占比</span>
                  <span class="icon"></span>
                </span>
                <div class="chart05" id="chart05"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-5-16 mode06">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>外送检验样本量(本年)</span>
            </div>
            <div class="mode-main" style="margin-top: 8px;">
              <div class="echarts-box">
              <div style="position: absolute;margin-top: 110px;margin-left: 166px;">
              <img src="<c:url value="/static/commons/images/mode06-icon.png"/>">
              </div>
                <div class="chart06" id="chart06"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-5-16 mode07">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>远程影像诊断量</span>
            </div>
            <div class="mode-main" style="margin-top: 8px;">
              <div class="echarts-box">
              <div style="position: absolute;margin-top: 110px;margin-left: 166px;">
               <img src="<c:url value="/static/commons/images/mode07-icon.png"/>"> 
               </div>
                <div class="chart07" id="chart07"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-1-1 mode08">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>实时业务监测</span>
            </div> 
            
            <div class="time-choose">
                <span class="start-time">开始时间</span>
                <span class="input-box">
                  <input type="text"
            id="ywkssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${ywkssj }'
            class="start-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <span class="end-time">结束时间</span>
                <span class="input-box">
                  <!-- <input type="text" class="end-input" placeholder="2019-09" id="test2"> -->
                  <input type="text"
            id="ywjssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${ywjssj }'
            class="end-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <button onclick="getData1_02()">查询</button>
              </div>
            <div class="mode-main">
              <div class="table-box">
              
              
               <!--  <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">综合医院</span>
                  <span class="icon"></span>
                </span> -->
                
                <div  >
            <div  >
              <ul> 
             <li  onclick="getData1('A1')"><span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">综合医院</span>
                  <span class="icon"></span></li>
      <li  class="layui-this" onclick="getData1('AA')"
      style="margin-top: -42px;margin-left: 113px;"  >
      <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">基层医院</span>
                  <span class="icon"></span></li>
              </ul>
              </div>
              </div>
                
                <div id="viewTable2" class="view">
                  <div class="fixed-header-table"></div>
                  <table class="table-data" id="querytable1">
                     
                    
                  </table>
                </div>
              </div>
              <div class="echarts-box">
                <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">实时人次分析</span>
                  <span class="icon"></span>
                </span>
                <div class="chart08" id="chart08"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-6-16 mode09">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>住院病案手术查询</span>
            </div>
            <ul class="time-choose clearfix">
              <li>
                <div class="start-time">开始时间</div>
                <div class="input-box">
                  <input type="text"
            id="basskssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${basskssj }'
            class="start-input" style="width: 100px" /> 
               <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date5"> 
                 
                </div>
              </li>
              <li>
                <div class="end-time">结束时间</div>
                <div class="input-box">
                  <input type="text"
            id="bassjssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${bassjssj }'
            class="start-input" style="width: 100px" /> 
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date6">
                  
                </div>
              </li>
              <li>
            <div class="end-time">机构名称</div>
               <select id="bassjgdm" name="bassjgdm" lay-search>
        <option value="">医疗机构</option>
          <c:forEach items="${bajgList}" var="jg">
          <option value="${jg.jgdm}">${jg.jgmc}</option>
        </c:forEach>
      </select>  
              </li>
              <li>
                <button onclick="bassxx()">查询</button>
              </li>
            </ul>
            <div class="mode-main">
              <span class="planer-name">
                <span class="icon"></span>
                <span class="name">住院疾病手术人次TOP15</span>
                <span class="icon"></span>
              </span>
              <div class="echarts-box">
                <div class="chart11" id="chart11"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-6-16 mode10">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>住院病案病种查询</span>
            </div>
            <ul class="time-choose clearfix">
              <li>
                <div class="start-time">开始时间</div>
                <div class="input-box">
                   <input type="text"
            id="basystartDate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${kssj }'
            class="start-input" style="width: 100px" /> 
            
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date7">
                  <!-- <img src="images/date-icon.png" alt="" id="date7"> -->
                </div>
              </li>
              <li>
                <div class="end-time">结束时间</div>
                <div class="input-box">
                   <input type="text"
            id="basyendDate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${jssj }'
            class="start-input" style="width: 100px" /> 
            
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date8">
                 <!--  <img src="images/date-icon.png" alt="" id="date8"> -->
                </div>
              </li>
              <li>
                <div class="end-time">机构名称</div>
                <select id="bajgdm" name="bajgdm" lay-search>
        <option value="">医疗机构</option>
          <c:forEach items="${bajgList}" var="jg">
            <option value="${jg.jgdm}">${jg.jgmc}</option>
          </c:forEach>
        </select>  
              </li>
              <li>
                <button onclick="basysearch()">查询</button>
              </li>
            </ul>
            <div class="mode-main">
              <span class="planer-name">
                <span class="icon"></span>
                <span class="name">住院疾病发病人次TOP15</span>
                <span class="icon"></span>
              </span>
              <div class="echarts-box">
                  <div class="chart12" id="chart12"></div>
                </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-1-4 mode11">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>区域手术汇总(月)</span>
            </div>
            <div class="select-box">
              <select id="sscx" name="sscx" onchange="sscx()">
        <c:forEach items="${sscxList}" var="sscx">
          <option value="${sscx.lbdm}">${sscx.lbmc}</option>
        </c:forEach>
      </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle10.png"/>" alt="" >
                <!-- <img src="images/subtitle10.png" alt=""> -->
                <span>手术总量</span>
                <span class="num1"><%=request.getAttribute("sstj")%></span>
                <span>台</span>
              </div>
              <div class="echarts-box">
                <div class="chart09" id="chart09"></div>
              </div>
            </div>
          </div>
          <div class="itembg itembg-bot">
            <div class="mode-title">
              <span class="icon"></span>
              <span>全区建档</span>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle11.png"/>" alt="" >
                <!-- <img src="images/subtitle11.png" alt=""> -->
                <span>全区建档人数</span>
                <span class="num1"><%=request.getAttribute("jdtjrs")%></span>
                <span>人</span>
              </div>
              <div class="echarts-box">
                <div class="chart10" id="chart10"></div>
              </div>
            </div>
          </div>
        </li>
      </ul>
      
    
    <!-- 主体 end -->
  </div>
</body>

</html>

<script>
reSetSize();
window.onresize = reSetSize;

function reSetSize() {
	var windowsHeight = window.innerHeight;
	document.getElementById("Content").style.height = (windowsHeight - 157) + "px";
}

  function timePicker1(inputId, imgId) {
    //年月选择器
    laydate.render({
      elem: inputId,
      type: 'month',
    });
    $(imgId).click(function () {
      laydate.render({
        show: true,
        elem: inputId,
        type: 'month',
        closeStop: imgId
      });
      return false
    });
  };
  timePicker1("#test1","#date1");
  timePicker1("#test2","#date2");

  function timePicker2(inputId, imgId) {
    //年月日选择器
    laydate.render({
      elem: inputId,
    });
    $(imgId).click(function () {
      laydate.render({
        show: true,
        elem: inputId,
        closeStop: imgId
      });
      return false
    });
  };
  timePicker2("#test3","#date3");
  timePicker2("#test4","#date4");
  timePicker2("#test5","#date5");
  timePicker2("#test6","#date6");
  timePicker2("#test7","#date7");
  timePicker2("#test8","#date8");

  //滚动
  if ($.fn.perfectScrollbar) {
    tableScrollFixed('#viewTable');
    tableScrollFixed('#viewTable2');
  };
  //模块1头部tab
  $(".mode01 .mode-top li").click(function () {
    $(this).addClass("active").siblings(".mode01 .mode-top li").removeClass("active")
  });

  //整体头部切换
  $("#top-tab li").click(function () {
    $(this).addClass("active").siblings("#top-tab li").removeClass("active")
  })
</script>