<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>急救患者字典项查询统计图</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
function sess(ids,startdate,enddate){ 
	 
    layui.use([ 'table', 'layer' ], function() {
      var table = layui.table; 
      table.render({
            elem : '#querytable',
            url : '${ctx}/jjhzzdbfx/jjhzzdbfxXx',
            toolbar : '#toolbarDemo',
            method : 'post',
            where : { 
              p_ids : ids, 
              p_startdate:startdate,
              p_enddate:enddate
            },
            cols : [[ 
            	 { field : 'name', title : '患者姓名', width : '100' }, 
 	            { field : 'xbmc', title : '患者性别', width : '150' },
 	            { field : 'nl', title : '年龄', width : '150' }, 
 	           { field : 'fzzs', title : '分诊主诉', width : '250' },
 	            { field : 'fzsj', title : '分诊时间', width : '250' },
 	            { field : 'fzhs', title : '分诊护士', width : '200' },
 	            { field : 'fzks', title : '分诊科室', width : '200' },
 	            { field : 'fzjg', title : '分诊结果', width : '200' }
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
function chart01(id,sl,zdblx,ids,startdate,enddate){
    var myChart=echarts.init(document.getElementById(id));
    var option = {
             tooltip : {
    		trigger: 'axis',
    		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
        	type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
        	formatter: '{b}<br/>{c}'
    		}
			},
			color:['#989cf3', '#9deb8d', '#7cb5ec', '#f6ae6e', 
	            '#adff2f', '#444446', '#799aec', '#61d4e2',
	            '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
			legend: {
	            data: ["急救患者字典项查询统计图"]
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
	    xAxis: {
	        type: 'category',
	        data: zdblx,
	        name:"字典项名称"
	    },
	    yAxis: {
	    	type:'value',
	    	name:'人数(人)'
	    },
	    series: [{
	    	name: "急救患者字典项查询统计图",
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
           
         sess(ids[param.dataIndex],startdate,enddate ) 
          
          
    }); 
  }
function getechatsdata(startdate,enddate){
    $.ajax({
      url: "${ctx}/jjhzzdbfx/jjhzzdbfx.json?p_startdate="+startdate+"&p_enddate="+enddate,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         
         var fianl=xx.jjhzzdbfxList;
         var sl=new Array();
         var zdblx=new Array();
         var ids=new Array();
         
         for (var i=0;i<fianl.length;i++)
               {   
            sl[i]=fianl[i].sl; 
            zdblx[i]=fianl[i].zdblx; 
            ids[i]=fianl[i].ids; 
           
            }
        chart01('map',sl,zdblx,ids,startdate,enddate);
        }
        });
    
}

function getData(){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
            laydate.render({ 
              elem: '#startdate' 
            });
            laydate.render({ 
              elem: '#enddate' 
          });
            
         
        });
        var startdate=$("#startdate").val(); 
        var enddate=$("#enddate").val();
        getechatsdata(startdate,enddate); 
    }
    
  $(document).ready(function(){
    var myDate=new Date() 
    var month=myDate.getMonth()+1;
    var year=myDate.getFullYear();
    if (month<10)
    {
    month = "0" + month;
    }
    var startdate=year+"-"+month+"-01";
    var enddate=myDate.Format('yyyy-MM-dd');
    
    $("#enddate").val(enddate);
    $("#startdate").val(startdate);
    getData();
  });
    
  function search() {
        getData();
    }
  Date.prototype.Format = function (fmt) { //author: meizz 

        var o = {
            "M+": this.getMonth() + 1, //月份 
            "d+": this.getDate(), //日 
            "h+": this.getHours(), //小时 
            "m+": this.getMinutes(), //分 
            "s+": this.getSeconds(), //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3),  
            "S": this.getMilliseconds() //毫秒 
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;

}
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
  <div id="queryform" class="layui-form" style="background: #FFFFFF">
    <table style="width: 100%">
      <tr>
      
        <td style="width: 33.3%" >
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">开始时间</label>
            <div class="layui-input-inline input3">
              <input type="text" id="startdate" name="startdate"  autocomplete="off"
                class="layui-input .input2">
            </div>
          </div>
        </td>
        <td style="width: 33.3%" >
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">结束时间</label>
            <div class="layui-input-inline input3"> 
            <input type="text" id="enddate" name="enddate" autocomplete="off"
                class="layui-input .input2">
            </div>
          </div>
        </td> 
        <td>
          <div class="layui-form-item">
            <div class="layui-input-block">
              <button class="layui-btn" onclick="search();">查询</button>
            </div>
          </div>
        </td>
        <td>
        </td>
        <td>
        </td>
      </tr>
    </table>
  </div>
  <div id="map" style="width: 90%; height: 400px;background:#FFFFFF;margin-top:15px;">
  </div>
  <div style="width:90%;background: #FFFFFF;margin:35px auto;">
     <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
      <div id="laypage"></div>
  </div>
</body>

</html>