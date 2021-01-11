<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>影像检查医生统计</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,yljgdm,sfws,sqks,bgrgh,bgrxm,month){	
  var myChart=echarts.init(document.getElementById(id));
  var option = {
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
              type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
              formatter: '{b}<br/>{c}'
            }
         },
         color:['#60C0DD'],
         legend: {
                 data: ["影像检查医生统计"]
             },
           grid: {
                left: '5%',
                right: '5%',
                bottom: '3%',
                containLabel: true
            },
              
        xAxis: {
            type: 'category',
            data: bgrxm,
            name:"医生姓名"
        },
        yAxis: {
          type:'value',
          name:'人数(人)'
        },
        series: [{
          name: "影像检查医生统计",
            type: 'bar',
            barWidth:60,
            data: month
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

function getechatsdata(sfws,yljgdm,sqks  ){
 
    $.ajax({
      url: "${ctx}/JcXzYs/JcXzYsecharts.json?p_sfws="+sfws+"&p_yljgdm="+yljgdm+"&p_sqks="+sqks,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.JcXzYsechartslist;
         var yljgdm=new Array();
           var sfws=new Array();
           var sqks =new Array();
           var bgrgh=new Array();
           var bgrxm=new Array();
          var month=new Array();
             
         for (var i=0;i<fianl.length;i++)
               {   
               yljgdm[i]=fianl[i].yljgdm; 
               sfws[i]=fianl[i].sfws; 
               sqks[i]=fianl[i].sqks; 
               bgrgh[i]=fianl[i].bgrgh; 
               bgrxm[i]=fianl[i].bgrxm; 
               month[i]=fianl[i].rs;
                  
               }
           
           chart01('map',yljgdm,sfws,sqks,bgrgh,bgrxm,month);
        }
        });
    
}



function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
             
            table.render({
                elem:'#querytable',
                url: '${ctx}/JcXzYs/JcXzYs',
                method:'post',
                where:{
                  p_sfws : '${sfws}' ,
                  p_yljgdm : '${yljgdm}' ,
                  p_sqks : '${sqks}'   
                },          
                cols: [[
                	    {field: 'yljgmc', title: '机构名称', width: '16.66%'},
                    {field: 'brxm', title: '病人姓名', width: '16.66%'},
                     {field: 'brxb', title: '病人性别', width: '16.66%'},
                     {field: 'sqksmc', title: '申请科室名称', width: '16.66%'},
                     {field: 'bgrxm', title: '申请医生', width: '16.66%'},
                     {field: 'jcmc', title: '检查名称', width: '16.66%'},
                     /* {field : 'tabid', title : '操作', width : '14.2%', toolbar : '#toolbar'} */
                  ]],
                    height: '400',
                   page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                },    
        done: function(res, curr, count){                  
                   var sfws='${sfws}';
                   var yljgdm='${yljgdm}';
                   var sqks='${sqks}';
                   
                     
                  getechatsdata(sfws,yljgdm,sqks );
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                    if (layEvent === 'ckxx') {
                    	window.open("${ctx}/JcXzYs/jybgdbh?p_bglsh="+data.bglsh+"&p_yljgdm="+data.yljgdm+"&p_jch="+data.jch);
    				}
      });
        });
    }
    
  $(document).ready(function(){
    getData();
  });
    
  function search() {
        getData();
    }
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
   
  <div id="map" style="width: 100%; height:500px;background:#FFFFFF;margin-top:15px;">
  </div>
  <div style="width:100%;background: #FFFFFF;margin:35px auto;">
     <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
      <div id="laypage"></div>
  </div>
<script type="text/html" id="toolbar">   
<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="ckxx">查看详细</a>
</script>
</body>

</html>