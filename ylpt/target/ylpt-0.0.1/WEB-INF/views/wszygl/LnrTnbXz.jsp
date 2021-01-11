<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>患有心血管和脑卒中疾病统计下钻机构</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,tnbrs,tnblxmc,yljgdm,yljgmc,tnbzb,startdate,enddate){
	 
  var myChart=echarts.init(document.getElementById(id));
  var option = { 

	  		title: {  
		    	 text: '糖尿病统计',
		    	 left: ''
		    		    },
			color:['#188df0','red',],
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross',
		            crossStyle: {
		                color: '#999'
		            }
		        }
		    },
		    toolbox: {
		        feature: {
		            dataView: {show: true, readOnly: false},
		            magicType: {show: true, type: ['line', 'bar']},
		            restore: {show: true},
		            saveAsImage: {show: true}
		        }
		    },
		    
		    legend: {
		        data:['患有糖尿病人数','患有糖尿病比率%']
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
		    xAxis: [
		        {
		            type: 'category',
		            data: yljgmc,
		            axisPointer: {
		                type: 'shadow'
		            }
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            name: '患有糖尿病人数',
		            min: 0,
		            max: 50,
		            interval: 5,
		            axisLabel: {
		                formatter: '{value} '
		            }
		        },
		        {
		            type: 'value',
		            name: '患有糖尿病比率%',
		            min: 0,
		            max: 100,
		            interval: 10,
		            axisLabel: {
		                formatter: '{value} %'
		            }
		        }
		    ],
		    series: [
		        {
		            name:'患有糖尿病人数',
		            type:'bar',
		            data:tnbrs
		        } ,
		        {
		            name:'患有糖尿病比率%',
		            type:'line',
		            yAxisIndex: 1,
		            data:tnbzb
		        }
		    ]
		  
    };
    myChart.setOption(option);
    myChart.on('click', function(param) {  
   search(  
		   startdate,enddate,yljgdm[param.dataIndex])
  });
}
function search(startdate,enddate,yljgdm){ 
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/LnrTnbXz/LnrTnbXzXx',
					toolbar : '#toolbarDemo',
					method : 'post',
					where : { 
						p_startdate : startdate,
						p_enddate : enddate, 
						p_yljgdm : yljgdm
					},
					cols : [[  
	                    { field : 'yljgmc', title : '筛查机构', width : '300' },
	                    { field : 'xm', title : '姓名', width : '160' }, 
	                    { field : 'xb', title : '性别', width : '160' }, 
	                    { field : 'nl', title : '年龄', width : '160' } ,
	                    { field : 'jkysxm', title : '建卡医生姓名', width : '160' } ,
	                    { field : 'jksj', title : '建卡日期', width : '150' } ,
	                    { field : 'tnbfxmc', title : '糖尿病发型名称', width : '150' }
	                   

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
function getechatsdata(startdate,enddate,nllx,yljgdm){
  
    $.ajax({
      url: "${ctx}/LnrTnbXz/LnrTnbXz.json?p_startdate="+startdate+"&p_enddate="+enddate+"&p_yljgdm="+yljgdm,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.LnrTnbXzList;
          
         var tnbrs=new Array();
         var tnblxmc =new Array();  
         var yljgdm=new Array();
         var yljgmc=new Array();
         var tnbzb=new Array();
             
         for (var i=0;i<fianl.length;i++)
               {   
        	 tnbrs[i]=fianl[i].tnbrs; 
        	 tnblxmc[i]=fianl[i].tnblxmc; 
        	 yljgdm[i]=fianl[i].yljgdm;
        	 yljgmc[i]=fianl[i].yljgmc; 
        	 tnbzb[i]=fianl[i].tnbzb; 
               }
           
           chart01('map',tnbrs,tnblxmc,yljgdm,yljgmc,tnbzb,startdate,enddate);
        }
        });
    
}



function getData(){                   
   var startdate='${startdate}';  
   var enddate='${enddate}';  
   var yljgdm='${yljgdm}';
    getechatsdata(startdate,enddate,yljgdm);        
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