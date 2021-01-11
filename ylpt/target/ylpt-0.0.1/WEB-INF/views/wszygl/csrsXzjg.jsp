<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>出生人数下钻_机构</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,csrs,yljgdm,yljgmc){
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
                 data: [yljgmc[0]+"出生人数统计"]
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
          name: yljgmc[0]+"出生人数统计",
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
   search(yljgdm[param.dataIndex])
  });
}
function search(yljgdm,xb){
 
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/csrsXzjg/csrsXzjgXX',
					toolbar : '#toolbarDemo',
					method : 'post',
					where : { 
						p_yljgdm : yljgdm
						 
					},
					cols : [[ 
						{ field : 'xm', title : '儿童姓名', width : '100' }, 
						{ field : 'xbmc', title : '性别', width : '100' },
						{ field : 'mqxm', title : '母亲姓名', width : '100' },
						{ field : 'csrq', title : '出生日期', width : '200' }, 
						{ field : 'cszm', title : '出生证明', width : '150' },
						{ field : 'csd', title : '出生地', width : '200' },
						{ field : 'jsjgmc', title : '接生机构地', width : '200' },
						{ field : 'jsryxm', title : '接生医生', width : '150' } ,
						{ field : 'tabid', title : '操作', width : '100', toolbar : '#toolbar' } 

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
		//监听工具条
		table.on('tool(querytab)', function(obj){
			  
			//注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
			, layEvent = obj.event; //获得 lay-event 对应的值

			
			if (layEvent === 'ckxx') {
				layer.open({
					type : 2,
					title : '详细信息' //不显示标题栏
					,
					//closeBtn : true,
					//skin : 'demo-class',
					area : [ '790px', '640px' ],
					shade : 0.8,
					id : 'LAY_layuipro' //设定一个id，防止重复弹出
					,
					moveType : 1 //拖拽模式，0或者1
					,
					scrollbar : true,
					content : '${ctx}/cszm/cszm?p_cszm=' + data.cszm,
					yes : function(index, layero) {

					}
				});
			}

		});
});
	
}
function getechatsdata(yylx){
 
    $.ajax({
      url: "${ctx}/csrsXzjg/csrsXzjg.json?p_yylx="+yylx,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.csrsXzjgechartsList;
          
          
         var csrs =new Array();
         var yljgdm =new Array();
         var yljgmc =new Array();
             
         for (var i=0;i<fianl.length;i++)
               {   
        	  
        	 csrs[i]=fianl[i].csrs; 
        	 yljgdm[i]=fianl[i].yljgdm; 
        	 yljgmc[i]=fianl[i].yljgmc;
               }
           
           chart01('map', csrs,yljgdm,yljgmc);
        }
        });
    
}



function getData(){                   
   var yylx='${yylx}';                
    getechatsdata(yylx);        
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
<script type="text/html" id="toolbar">
    
   <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="ckxx">查看详细</a>
  
</script>
</html>