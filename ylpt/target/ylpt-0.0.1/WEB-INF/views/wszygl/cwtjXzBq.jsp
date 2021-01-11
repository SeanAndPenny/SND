<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>床位统计_病区</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,yljgmc,sl,bq_code,bq_name,yljgdm,cwlxmc,ids,index){
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
                 data: [yljgmc[0]+"_"+cwlxmc[0]+"统计_病区"]
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
            data: bq_name,
            name:"病区名称"
        },
        yAxis: {
          type:'value',
          name:'人数(人)'
        },
        series: [{
          name: yljgmc[0]+"_"+cwlxmc[0]+"统计_病区",
            type: 'bar',
            barWidth:60,
            data: sl
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
    	 
   search(bq_code[param.dataIndex],yljgdm[param.dataIndex],index)
  }); 
}
function search(bq_code,yljgdm,index){
 
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/cwtjXzBq/cwtjXzBqXX',
					toolbar : '#toolbarDemo',
					method : 'post',
					where : { 
						p_bqcode : bq_code,
						p_yljgdm : yljgdm,
						p_index:index
					},
					cols : [[ 
						{ field : 'yljgmc', title : '医疗机构名称', width : '300' }, 
						{ field : 'bed_name', title : '病床名称', width : '150' },
						{ field : 'bq_name', title : '病区名称', width : '150' }, 
						{ field : 'hzxm', title : '患者姓名', width : '100' },
						{ field : 'jzksmc', title : '就诊科室名称', width : '300' },
						{ field : 'rysj', title : '入院时间', width : '300' }
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
function getechatsdata(ids,yljgdm,index){
    $.ajax({
      url: "${ctx}/cwtjXzBq/cwtjXzBq.json?p_ids="+ids+"&p_yljgdm="+yljgdm+"&p_index="+index,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.cwtjXzBqList;
          
         var yljgmc=new Array();
         var sl=new Array();
         var bq_code=new Array();
         var bq_name=new Array();
         var yljgdm=new Array();
         var cwlxmc=new Array();
         
         var ids=new Array();
             
         for (var i=0;i<fianl.length;i++)
               {   
        	 yljgmc[i]=fianl[i].yljgmc; 
        	 sl[i]=fianl[i].sl; 
        	 bq_code[i]=fianl[i].bq_code; 
        	 bq_name[i]=fianl[i].bq_name;
        	 yljgdm[i]=fianl[i].yljgdm;
        	 cwlxmc[i]=fianl[i].cwlxmc;
        	 ids[i]=fianl[i].id;
        	
               }
       
           
           chart01('map',yljgmc,sl,bq_code,bq_name,yljgdm,cwlxmc,ids,index);
        }
        });
    
}



function getData(){                   
   var ids='${ids}';   
   var yljgdm='${yljgdm}'; 
   var index='${index}';
  
    getechatsdata(ids,yljgdm,index);        
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