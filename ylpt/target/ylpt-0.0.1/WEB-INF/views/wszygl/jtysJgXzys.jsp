<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>家庭医生签约机构_医生</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,rs,qyjgid,qyjgmc,tdbh,tdmc,ysid,ysxm){
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
                 data: [qyjgmc[0]+"-"+ysxm+"-"+"家庭医生签约机构_医生"]
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
          name: qyjgmc[0]+"-"+ysxm+"-"+"家庭医生签约机构_医生",
            type: 'bar',
            barWidth:60,
            data: rs
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
   search(ysid[param.dataIndex],tdbh[param.dataIndex],qyjgid[param.dataIndex])
  });
}
function search(ysid,tdbh,qyjgid){
	 
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/jtysJgXzys/jtysJgXzysXx',
					toolbar : '#toolbarDemo',
					method : 'post',
					where : { 
						p_ysid : ysid,
						p_tdbh : tdbh,
						p_qyjgid : qyjgid,
					},
					cols : [[ 
						{ field : 'qyrxm', title : '签约人姓名', width : '120' }, 
	                    { field : 'qyjgmc', title : '签约机构', width : '300' },
	                    { field : 'tdmc', title : '签约团队', width : '300' }, 
	                    { field : 'qyfamc', title : '签约方案', width : '300' } ,
	                    { field : 'ysxm', title : '签约医生', width : '120' } ,
	                    { field : 'qysxkssj', title : '签约生效时间', width : '300' }
	                   

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
function getechatsdata(tdbh,qyjgid){
 
    $.ajax({
      url: "${ctx}/jtysJgXzys/jtysJgXzys.json?p_tdbh="+tdbh+"&p_qyjgid="+qyjgid,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.jtysJgXzysList;
          
         var rs=new Array();
           var qyjgid =new Array();
           var qyjgmc =new Array();
          var tdbh=new Array();
          var tdmc=new Array();
          var ysid=new Array();
          var ysxm=new Array();
             
         for (var i=0;i<fianl.length;i++)
               {   
        	 rs[i]=fianl[i].rs; 
        	 qyjgid[i]=fianl[i].qyjgid; 
        	 qyjgmc[i]=fianl[i].qyjgmc; 
        	 tdbh[i]=fianl[i].tdbh;
        	 tdmc[i]=fianl[i].tdmc;
        	 ysid[i]=fianl[i].ysid;
        	 ysxm[i]=fianl[i].ysxm;
               }
           
           chart01('map',rs,qyjgid,qyjgmc,tdbh,tdmc,ysid,ysxm);
        }
        });
    
}



function getData(){                   
   var tdbh='${tdbh}';  
   var qyjgid='${qyjgid}';  
    getechatsdata(tdbh,qyjgid);        
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