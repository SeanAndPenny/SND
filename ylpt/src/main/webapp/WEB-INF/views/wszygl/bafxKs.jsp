<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>科室分析下钻</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<style type="text/css">
 
 
/* 表格头部背景色 */
th {
    background-color: #1572D5; /* MediumSeaGreen */
    color: #fff;
    font-weight: bold

</style>
<script type="text/javascript">
 
function chart01(id,rs,ryksbm,ryksmc,yljgdm,kssj,jssj){
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
            trigger: 'none',
            axisPointer: {
                type: 'shadow'
            }
        },
        color:['#1572D5'],
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
            data: [
                {
                    name: "科室人数",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '4%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '人',
            nameGap: 13,
            nameTextStyle: {
                color: fontColor,
                fontSize: 12
            },
            axisLabel: {
                formatter: '{value}',
                rotate:40,
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
                 
            }
        }],
        xAxis: [{
            type: 'category',
            data: ryksmc,
            axisLine: lineOption,
            boundaryGap: true,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                rotate:20,
                color: fontColor,
                interval:0,
                textStyle: {
                    fontSize: 12
                }
            },
            splitLine: {
                show: true,
                 
            },
            splitArea: {
                show: false
            }
        }],
        series: [
            {
                name: '科室人数',
                type: 'bar',
                barWidth: 24,
                data: rs,
                
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.value + '人}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(21, 114, 213, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize:12
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
    myChart.setOption(option)
     myChart.on('click', function(params) {  
   search(yljgdm[params.dataIndex],ryksbm[params.dataIndex],kssj,jssj)   
          
          
           }); 
    return myChart
}
function search(yljgdm,ryksbm,kssj,jssj){
   
  layui.use([ 'table', 'layer' ], function() {
    var table = layui.table;
    table.render({
          elem : '#querytable',
          url : '${ctx}/bafx/jtysJgXzysXx',
          toolbar : '#toolbarDemo',
          method : 'post',
          where : { 
            p_yljgdm : yljgdm,
            p_ryksbm : ryksbm,
            p_kssj : kssj,
            p_jssj : jssj
          },
          cols : [[  
        	  { field : 'ryksmc', title : '科室名称', width : '500' }, 
              { field : 'rs', title : '人数', width : '500' },
              { field : 'jbflmc', title : '疾病分类名称', width : '500' }, 
             
                     

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
function getechatsdata(kssj,jssj,jgdm){
 
    $.ajax({
      url: "${ctx}/bafx/bafxKsxz.json?p_kssj="+kssj+"&p_jssj="+jssj+"&p_jgdm="+jgdm,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.getbafxKsxz;
          
         var rs=new Array();
         var ryksbm =new Array();
         var ryksmc =new Array();
        var yljgdm=new Array();
             
         for (var i=0;i<fianl.length;i++) {   
           rs[i]=fianl[i].rs; 
           ryksbm[i]=fianl[i].ryksbm; 
             ryksmc[i]=fianl[i].ryksmc; 
             yljgdm[i]=fianl[i].yljgdm;
               }
           
           chart01('map',rs,ryksbm,ryksmc,yljgdm,kssj,jssj);
           search(jgdm,'',kssj,jssj)   
        }
        });
    
}



function getData(){                   
  var kssj='${kssj}';  
     var jssj='${jssj}'; 
     var jgdm='${jgdm}'; 
      getechatsdata(kssj,jssj,jgdm);        
 }
    
  $(document).ready(function(){
    getData();
  });

</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
   
  <div id="map" style="width: 100%; height:400px;background:#FFFFFF;margin-top:15px;">
  </div>
  <div style="width:90%;background: #FFFFFF;margin:35px auto;">
     <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
      <div id="laypage"></div>
  </div>

</body>

</html>