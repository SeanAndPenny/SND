<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>实施业务监测医院类型下钻</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
 
function chart01(id,a,b,c,d,e,f,g,aa,bb,cc,sj){
	 	var myChart=echarts.init(document.getElementById(id));
	var option = {
		      color:['#188df0','#FF3EFF','#009FCC', '#DD228F', 
		          '#7cb5ec', '#f6ae6e',  '#adff2f', '#444446', 
		          '#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
		          title: {  
		         	 text: sj[0]+'实时业务监测数据统计',
		         	 left: ''
		         		    },
		        tooltip : {
		            trigger: 'axis',
		            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		            }
		        },
		        legend: {
		            data:['门诊人数','急诊人数','在院人数','入院人数','出院人数','门诊费用(万元)','住院费用(万元)']
		        },
		        axisLabel: {  
		              interval: 0,  
		              formatter:function(value)  
		              { 
		               
		                  var ret = "";//拼接加\n返回的类目项  
		                  var maxLength = 3;//每项显示文字个数  
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
		        xAxis : [
		            {
		                type : 'category',
		                data : b,
		                name :'机构名称',
		                
		            }
		        ],
		        yAxis : [
		            {
		                type : 'value',
		                name :'人数',
		                
		            }
		        ],
		        series : [
		            {
		                name:'门诊人数',
		                type:'bar',
		                data:d,
		                
		            },
		            {
		                name:'急诊人数',
		                type:'bar',
		                data:e
		            },
		            {
		                name:'在院人数',
		                type:'bar',
		                data:f
		            } ,
		            {
		                name:'入院人数',
		                type:'bar',
		                data:g
		            } ,
		            {
		                name:'出院人数',
		                type:'bar',
		                data:aa
		            } ,
		            {
		                name:'门诊费用(万元)',
		                type:'bar',
		                data:bb
		            } ,
		            {
		                name:'住院费用(万元)',
		                type:'bar',
		                data:cc
		            } 
		        ]
		};
	  myChart.setOption(option);
	  
	  
	   myChart.on('click', function(param) { 
		   /*
		   alert(a[param.dataIndex] ) 
		   alert(param.seriesIndex)
			  window.open("${ctx}/ryxz/ryxzry?p_jb="+jb+"&p_zc="+zc+"&p_jgdm="+jgdm[param.dataIndex]
			  +"&p_ksdm="+ksdm[param.dataIndex]
			   );   */
				
					});  
}

function getechatsdata(ids,ywsj){
	
    $.ajax({
    	url: "${ctx}/ssywYylx/ssywjcCyKsecharts.json?p_ids="+ids+"&p_ywsj="+ywsj ,
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.getYylxechartsList;
    		 var a=new Array();
    		 var b=new Array();
    		 var c=new Array();
    		 var d=new Array();
    		 var e=new Array();
    		 var f=new Array();
    		 var g=new Array();
    		 var aa=new Array();
    		 var bb=new Array();
    		 var cc=new Array();
    		 var sj=new Array();
    		 for (var i=0;i<fianl.length;i++)
		         	{   
    			      a[i]=fianl[i].yljgdm;
		         	  b[i]=fianl[i].yljgmc;
		         	  c[i]=fianl[i].ids;
		         	  d[i]=fianl[i].mzrs;
		         	  e[i]=fianl[i].jzrs;
		         	  f[i]=fianl[i].zyrs;
		         	 g[i]=fianl[i].ryrs;
		         	 aa[i]=fianl[i].cyrs;
		         	 bb[i]=fianl[i].mzfy;
		         	cc[i]=fianl[i].zyfy;
		         	sj[i]=fianl[i].sj;
		         	
		         		 
		         	}
         	
         	chart01('map',a,b,c,d,e,f,g,aa,bb,cc,sj);
    		}
      	});
    
}



function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
             
            table.render({
                elem:'#querytable',
                url: '${ctx}/ssywYylx/ssywYylx',
                method:'post',
                where:{
                	p_ids : '${ids}',
                	p_ywsj : '${ywsj}'
                   
                },          
                cols: [[
                	{  field: 'yljgmc', title: '<span style="color:#4682B4">机构名称</span>', width: '18%'},
                	{ field : 'mzrs', title : '<span style="color:#4682B4">门诊人数</span>', width : '12%' },
					{ field : 'jzrs', title : '<span style="color:#4682B4">急诊人数</span>', width : '12%' }, 
					{ field : 'zyrs', title : '<span style="color:#4682B4">在院人数</span>', width : '12%' },
					{ field : 'ryrs', title : '<span style="color:#4682B4">入院人数</span>', width : '12%' }, 
					{ field : 'cyrs', title : '<span style="color:#4682B4">出院人数</span>', width : '12%' }, 
					{ field : 'mzfy', title : '<span style="color:#4682B4">门诊费用(元)</span>', width : '12%' },
					{ field : 'zyfy', title : '<span style="color:#4682B4">住院费用(元)</span>', width : '12%' }
                  ]],
                height: '400',
                 
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                },done: function(res, curr, count){                	
                	 var ids='${ids}';
                	 var ywsj='${ywsj}';
                	 
                     
                	getechatsdata(ids,ywsj);
                }
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
	 
	<div id="map" style="width: 100%; height:350px;background:#FFFFFF;margin-top:15px;">
	</div> 
	<div style="width: 100%; background: #FFFFFF; margin: 25px auto;">
    <table id="querytable" class="layui-table" lay-filter="querytab"
      style="margin: -10px;"></table>
     
  </div>

</body>

</html>