<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>家庭医生签约_医生</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,tdid,ysid,ysxm,month){
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
                 data: ["家庭医生签约_团队医生统计"]
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
            data: ysxm,
            name:"医生姓名"
        },
        yAxis: {
          type:'value',
          name:'人数(人)'
        },
        series: [{
          name: "家庭医生签约_团队医生统计",
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
    myChart.on('click', function(param) { 
   search(ysid[param.dataIndex],tdid[param.dataIndex])
  });
}
function search(ysid,tdid){

	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/jtysTdXzYs/jtysTdXzHz',
					toolbar : '#toolbarDemo',
					method : 'post',
					where : { 
						p_ysid : ysid,
						p_tdid : tdid
					},
					cols : [[ 
						{ field : 'qyrxm', title : '签约人姓名', width : '300' }, 
						{ field : 'qyrsfzhm', title : '签约人身份证', width : '300' },
						{ field : 'qyfamc', title : '签约方案名称', width : '400' }, 
						 
						{ field : 'ysxm', title : '签约医生姓名', width : '300' }

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
function getechatsdata(tdbh){
 
    $.ajax({
      url: "${ctx}/jtysTdXzYs/jtysTdXzYs.json?p_tdbh="+tdbh,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.jtysTdXzYsList;
          
         var tdid=new Array();
           var ysid =new Array();
           var ysxm =new Array();
          var month=new Array();
             
         for (var i=0;i<fianl.length;i++)
               {   
        	 tdid[i]=fianl[i].tdid; 
        	 ysid[i]=fianl[i].ysid; 
        	 ysxm[i]=fianl[i].ysxm; 
             month[i]=fianl[i].rs;
               }
           
           chart01('map',tdid,ysid,ysxm,month);
        }
        });
    
}



function getData(){                   
   var tdbh='${tdbh}';                
    getechatsdata(tdbh);        
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