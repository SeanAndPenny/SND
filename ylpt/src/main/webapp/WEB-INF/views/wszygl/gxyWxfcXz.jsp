<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>高血压危险分层情况下钻机构</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,wxfcrs,wxfcbm,wxfcmc,yljgdm,yljgmc,startdate,enddate){
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
                 data: ["高血压"+wxfcmc[0]+"患者"]
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
            data: yljgmc,
            name:"机构名称"
        },
        yAxis: {
          type:'value',
          name:'人数(人)'
        },
        series: [{
          name: "高血压"+wxfcmc[0]+"患者",
            type: 'bar',
            barWidth:60,
            data: wxfcrs
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
   search(  
		   startdate,enddate,wxfcbm[param.dataIndex],yljgdm[param.dataIndex])
  });
}
function search(startdate,enddate,wxfcbm,yljgdm){ 
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/gxyWxfcXz/gxyWxfcXzXx',
					toolbar : '#toolbarDemo',
					method : 'post',
					where : { 
						p_startdate : startdate,
						p_enddate : enddate,
						p_wxfc : wxfcbm,
						p_yljgdm : yljgdm
					},
					cols : [[  
	                    { field : 'yljgmc', title : '管理机构', width : '300' },
	                    { field : 'xm', title : '姓名', width : '120' }, 
	                    { field : 'xb', title : '性别', width : '120' }, 
	                    { field : 'wxfcmc', title : '危险分层名称', width : '120' } ,
	                    { field : 'jkysxm', title : '管理医生', width : '120' } ,
	                    { field : 'jksj', title : '管理开始时间', width : '250' },
	                    { field : 'shzlnlmc', title : '生活自理能力', width : '300' }
	                   

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
function getechatsdata(startdate,enddate,wxfc,yljgdm){
  
    $.ajax({
      url: "${ctx}/gxyWxfcXz/gxyWxfcXz.json?p_startdate="+startdate+"&p_enddate="+enddate+"&p_wxfc="+wxfc+"&p_yljgdm="+yljgdm,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.gxyWxfcXzList;
          
         var rs=new Array();
           var wxfcrs =new Array();
           var wxfcbm =new Array();
          var wxfcmc=new Array();
          var yljgdm=new Array();
          var yljgmc=new Array();
          
             
         for (var i=0;i<fianl.length;i++)
               {   
        	 wxfcrs[i]=fianl[i].wxfcrs; 
        	 wxfcbm[i]=fianl[i].wxfcbm; 
        	 wxfcmc[i]=fianl[i].wxfcmc; 
        	 yljgdm[i]=fianl[i].yljgdm;
        	 yljgmc[i]=fianl[i].yljgmc; 
               }
           
           chart01('map',wxfcrs,wxfcbm,wxfcmc,yljgdm,yljgmc,startdate,enddate);
        }
        });
    
}



function getData(){                   
   var startdate='${startdate}';  
   var enddate='${enddate}';  
   var wxfc='${wxfc}'; 
   var yljgdm='${yljgdm}'; 
    getechatsdata(startdate,enddate,wxfc,yljgdm);        
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