<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>急救患者年龄分布</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
function sess(nllx,xb,startdate,enddate){ 
	  layui.use([ 'table', 'layer' ], function() {
	    var table = layui.table; 
	    table.render({
	          elem : '#querytable',
	          url : '${ctx}/jjhznlfx/jjhznlfxXx',
	          toolbar : '#toolbarDemo',
	          method : 'post',
	          where : { 
	            p_nllx : nllx,
	            p_xb : xb,
	            p_startdate:startdate,
	            p_enddate:enddate
	          },
	          cols : [[ 
	            { field : 'name', title : '患者姓名', width : '100' }, 
	            { field : 'xbmc', title : '患者性别', width : '150' },
	            { field : 'nl', title : '年龄', width : '150' }, 
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
function chart01(id,nsl,vsl,nllx,startdate,enddate){
	  var myChart=echarts.init(document.getElementById(id));
	  var option = {


	      color:['#989cf3', '#9deb8d', '#7cb5ec', '#f6ae6e', 
	          '#adff2f', '#444446', '#799aec', '#61d4e2',
	          '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
	      title: {
	            text: '急救患者年龄分布',
	            textStyle: {
	              fontSize: 16
	              }
	        },
	        tooltip : {
	            trigger: 'axis',
	            formatter:function(v){
	              var res = v[0].name;
	              for(var i = 0; i<v.length; i++) {
	                console.log(typeof v[i].value);
	                res += '<br/>'+'<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:' + 
	                v[i].color.colorStops[0].color + '"></span>' + v[i].seriesName + ' : ' + (v[i].value+"").replace("-","");
	              }
	              return res;},
	            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	            }
	        },
	        toolbox: {
	            show: true,
	            feature: {
	                magicType: {show: true, type: ['line', 'bar']},
	                saveAsImage: {show: true}
	            }
	        },
	        legend: {
	            
	        data:['男性急救患者年龄分布', '女性急救患者年龄分布'],
	            right:'12%',
	            orient: 'vertical'
	           
	        },
	        grid: {
	            left: '3%',
	            right: '4%',
	            bottom: '3%',
	            containLabel: true
	        },
	        xAxis : [
	            {
	              axisLabel:{
	                  formatter:function(v){return Math.abs(v)},
	              },
	                type : 'value',
	                name:'人数'
	            }
	        ],
	        yAxis : [
	            {
	                type : 'category',
	                axisTick : {show: true},
	                data :  nllx 
	                 
	            }
	        ],
	        series : [
	         
	            {
	                name:'男性急救患者年龄分布',
	                type:'bar',
	                stack: '总量',
	                label: {
	                    normal: {
	                        show: false
	                    }
	                },
	                itemStyle: {
	                    normal: {
	                        color: new echarts.graphic.LinearGradient(
	                            0, 0, 0, 1,
	                            [
	                                {offset: 0, color: '#83bff6'},
	                                {offset: 0.5, color: '#188df0'},
	                                {offset: 1, color: '#188df0'}
	                            ]
	                        )
	                    },
	                    emphasis: {
	                        color: new echarts.graphic.LinearGradient(
	                            0, 0, 0, 1,
	                            [
	                                {offset: 0, color: '#2378f7'},
	                                {offset: 0.7, color: '#2378f7'},
	                                {offset: 1, color: '#83bff6'}
	                            ]
	                        )
	                    }
	                },
	                data:nsl
	            },
	            {
	                name:'女性急救患者年龄分布',
	                type:'bar',
	                stack: '总量',
	                label: {
	                    normal: {
	                        show: false
	                        //position: 'left'
	                    }
	                },
	                itemStyle: {
	                    normal: {
	                        color: new echarts.graphic.LinearGradient(
	                            0, 0, 0, 1,
	                            [
	                                {offset: 0, color: '#E765B1'},
	                                {offset: 0.5, color: '#E765B1'},
	                                {offset: 1, color: '#DD228F'}
	                            ]
	                        )
	                    },
	                    emphasis: {
	                        color: new echarts.graphic.LinearGradient(
	                            0, 0, 0, 1,
	                            [
	                  {offset: 0, color: '#E765B1'},
	                  {offset: 0.5, color: '#E765B1'},
	                  {offset: 1, color: '#DD228F'}
	                            ]
	                        )
	                    }
	                },
	                data:vsl
	            }
	        ]
	    };
	    myChart.setOption(option);
	     myChart.on('click', function(param) {  
	         
	       sess(nllx[param.dataIndex],param.seriesIndex,startdate,enddate ) 
	        
	        
	  }); 
	}
function getechatsdata(startdate,enddate){
    $.ajax({
      url: "${ctx}/jjhznlfx/jjhznlfx.json?p_startdate="+startdate+"&p_enddate="+enddate,
       datatype:"json",
      context: document.body, 
      success: function(data){
         var nodes=eval(data);
         var hh= JSON.stringify(nodes);
         var xx=JSON.parse(hh);
         var fianl=xx.jjhznlfxList;
          var nsl=new Array();
         var vsl=new Array();
         var nllx=new Array();
         for (var i=0;i<fianl.length;i++)
               {   
            nsl[i]=fianl[i].nsl; 
           vsl[i]=fianl[i].vsl; 
           nllx[i]=fianl[i].nllx;
            }
        chart01('map',nsl,vsl,nllx,startdate,enddate);
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