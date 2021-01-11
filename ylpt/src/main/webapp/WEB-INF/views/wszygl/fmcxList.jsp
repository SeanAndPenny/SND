<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>分娩记录统计_医生</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,csrs,ysgh,ysxm,yljgdm,hjbz2,hjbzmc,yljgmc){
	 
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
                 data: [hjbzmc[0]+"-"+yljgmc[0]+"-"+"分娩记录统计_医生"]
             },
           grid: {
                left: '5%',
                right: '5%',
                bottom: '3%',
                containLabel: true
            },
             axisLabel: {  
                      interval: 0,  
                      formatter:function(value)  
                      { 
                       
                          var ret = "";//拼接加\n返回的类目项  
                          var maxLength = 4;//每项显示文字个数  
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
            data: ysxm,
            name:"医生姓名"
        },
        yAxis: {
          type:'value',
          name:'人数(人)'
        },
        series: [{
          name: hjbzmc[0]+"-"+yljgmc[0]+"-"+"分娩记录统计_医生",
            type: 'bar',
            barWidth:60,
            data: csrs
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
    myChart.on('click', function(param) { 
   search(yljgdm[param.dataIndex],ysgh[param.dataIndex],hjbz2[param.dataIndex])
  });
}
function search(yljgdm,ysgh,hjbz2){

	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/fmxz/fmxzysXx',
					toolbar : '#toolbarDemo',
					method : 'post',
					where : { 
						p_yljgdm : yljgdm,
						p_ysgh : ysgh,
						p_hjbz2 : hjbz2
					},
					cols : [[ 
						{ field : 'fmrqsj', title : '分娩日期', width : '300' }, 
						{ field : 'ycfid', title : '产妇id', width : '250' },
						{ field : 'fmfs', title : '分娩方式', width : '250' }, 
						{ field : 'ysxm', title : '医生姓名', width : '300' },
						{ field : 'yljgmc', title : '分娩机构', width : '200' }

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
function getechatsdata(yljgdm,hjbz2 ){
 
    $.ajax({
      url: "${ctx}/fmxz/fmxzys.json?p_yljgdm="+yljgdm+"&p_hjbz2="+hjbz2,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.fmcxList;
          
         var csrs=new Array();
         var ysgh =new Array();
         var ysxm =new Array();
         var yljgdm=new Array();
         var hjbz2=new Array();
         var hjbzmc=new Array();
         var yljgmc=new Array();
             
         for (var i=0;i<fianl.length;i++)
               {   
        	 csrs[i]=fianl[i].csrs; 
        	 ysgh[i]=fianl[i].ysgh; 
        	 ysxm[i]=fianl[i].ysxm; 
        	 yljgdm[i]=fianl[i].yljgdm;
        	 hjbz2[i]=fianl[i].hjbz;
        	 hjbzmc[i]=fianl[i].hjbzmc;
        	 yljgmc[i]=fianl[i].yljgmc;
               }
           
           chart01('map',csrs,ysgh,ysxm,yljgdm,hjbz2,hjbzmc,yljgmc);
        }
        });
    
}



function getData(){                   
   var yljgdm='${yljgdm}';   
   var hjbz2='${hjbz2}'; 
    getechatsdata(yljgdm,hjbz2);        
 }
    
  $(document).ready(function(){
    getData();
  });

</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
   
  <div id="map" style="width: 100%; height:400px;background:#FFFFFF;margin-top:15px;">
  </div>
  <div style="width:100%;background: #FFFFFF;margin:35px auto;">
     <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
      <div id="laypage"></div>
  </div>

</body>

</html>