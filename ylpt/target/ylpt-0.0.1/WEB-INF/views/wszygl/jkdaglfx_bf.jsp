<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>健康档案管理分析</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/reset2.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/css/index2.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/commons/js/My97DatePicker/skin/WdatePicker.css"/>" />


<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery3-1.11.1.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts2.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<style>
html, body {
	background: #ededed;
	height: 100%;
	width: 100%;
}
</style>



<script type="text/javascript">
$(document).ready(function(){
	 getData();
	 sjxz();
});
function search() {
    getData();
}


function getData(){
	var kssj=$("#kssj").val();
    var jssj=$("#jssj").val();
	var jgdm=$("#jgdm").val();
    if(jgdm=="" ||jgdm==null){ jgdm='${jgdm}' } 
    if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
    getJdechats(kssj,jssj,jgdm); 
    }

function getJdechats(kssj,jssj,jgdm){
	 $.ajax({
	      url: "${ctx}/jkdaglfx/jkdaglfx.json?p_kssj="+kssj
	            +"&p_jssj="+jssj
	            +"&p_yljgdm="+jgdm,    
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	         var nodes=eval(data);
	         var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh);
	         var fianl=xx.yjdfxList;
	         var yljgmc=new Array();
	         var yjdhjrk=new Array();
	         var yjdldrk=new Array();
	         var yjdqtrk=new Array();
	         var jdhjzb=new Array();
	         var jdldzb=new Array();
	         var fian2=xx.czrkzs;//户籍人口总数
	         var fian3=xx.ldrkzs;//流动人口总数
	         
	         var fian4=xx.djdfxList;//待建档分析
	         var djdczrk=new Array();//待建档户籍人口
	         var djdldrk=new Array();//待建档流动人口
	         var pcsmc=new Array();//派出所名称
	         var yljgdm=new Array();//
	         
	         var fian5=xx.jdqsfxList;//建档趋势分析
	         var jdrs=new Array();//建档人数
	         var jdrq=new Array();//建档日期
	         
	            for (var i=0;i<fianl.length;i++) { 
	            	yljgmc[i]=fianl[i].yljgmc;
	            	yjdhjrk[i]=fianl[i].yjdhjrk; 
	            	yjdldrk[i]=fianl[i].yjdldrk;
	            	yjdqtrk[i]=fianl[i].yjdqtrk;
	            	jdhjzb[i]=((fianl[i].yjdhjrk/fian2)*100).toFixed(3);//建档户籍占比
	            	jdldzb[i]=((fianl[i].yjdldrk/fian3)*100).toFixed(3);//建档流动占比
	            }
	            for (var i=0;i<fian4.length;i++) { 
	            	djdczrk[i]=fian4[i].djdczrk;
	            	djdldrk[i]=fian4[i].djdldrk;
	            	pcsmc[i]=fian4[i].pcsmc;
	            	yljgdm[i]=fian4[i].yljgdm;
	            }
	            for(var i=0;i<fian5.length;i++){
	            	jdrs[i]=fian5[i].jdrs;
	            	jdrq[i]=fian5[i].jdrq;
	            }
	           chart01('chart01',yljgmc,yjdhjrk,yjdldrk,yjdqtrk,jdhjzb,jdldzb,fian2,fian3); 
	           chart02('chart02',djdczrk,djdldrk,pcsmc,yljgdm);
	           chart03('chart03',jdrs,jdrq);  
	        }
	        });
}
function chart01(id,yljgmc,yjdhjrk,yjdldrk,yjdqtrk,jdhjzb,jdldzb,fian2,fian3){ 
    var jdhjzs=null;
    var jdldzs=null;
    var jdqtzs=null;
    for(var i=0;i<yjdhjrk.length;i++){
    	jdhjzs+=Number(yjdhjrk[i])
    }
    for(var i=0;i<yjdldrk.length;i++){
    	jdldzs+=Number(yjdldrk[i])
    }
    for(var i=0;i<yjdqtrk.length;i++){
    	jdqtzs+=Number(yjdqtrk[i])
    }
      var zs=jdhjzs+jdldzs+jdqtzs;  
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	  var option = { 
	      title: {
		                text: '健康档案各乡镇发布(总数:'+zs+')'  
		           }, 
	      tooltip : {
	            trigger: 'axis',
	            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
	              },
	              formatter: function(params){
	                  var str = "";
	                  var hjItem = null;
	                  var ldItem = null;
	                  var qtItem = null; 
	                  var zbItem=null;
	                  var hjzbItem=null;
	                  var ldzbItem=null;
	                  var mcs = null;
	                  params.forEach(function(item,idx){
	                    if (item.seriesName==='户籍建档数') {
	                    	hjItem = item;
	                    }
	                    if (item.seriesName==='流动建档数') {
	                    	ldItem = item;
	                    }
	                    if (item.seriesName==='其他建档数') {
	                    	qtItem = item;
	                    }
	                    if (item.seriesName==='户籍建档数占比') {
	                    	hjzbItem = item;
	                    }
	                    if (item.seriesName==='流动建档数占比') {
	                    	ldzbItem = item;
	                    }
	                      
	                    mcs=item;
	                     
	                  });
	                  str += mcs.name+":"+"<br>";
	                  str += hjItem.marker+hjItem.seriesName+":"+hjItem.data+"<br>";
	                  str += ldItem.marker+ldItem.seriesName+":"+ldItem.data+"<br>";
	                  str += qtItem.marker+qtItem.seriesName+":"+qtItem.data+"<br>";
	                  str += hjzbItem.marker+hjzbItem.seriesName+":"+hjzbItem.data+"%"+"<br>";
	                  str += ldzbItem.marker+ldzbItem.seriesName+":"+ldzbItem.data+"%"+"<br>"; 
	                  return str; 
	                }
	             
	         },
	         color:['#26c2ca','#35a6ed','#99FF99','#FF7744','#FFFF00','#CC0000'],
	         legend: [
	           {
	                 data: [ '户籍建档数','流动建档数','其他建档数','户籍建档数占比','流动建档数占比']
	                }
	         ],
	            toolbox: {
	             x:'85%',
	               show : true,
	               feature : { 
	                   saveAsImage : {show: true}
	               }
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
	             yAxis : [ 
	            	 {type:'value',name:'比率%'},
	            	    {type:'value',name:'数量'},
	                      ],
	             xAxis : [
	                   {
	                       type : 'category',name:'乡镇',
	                       data : yljgmc
	                   }
	                ],
	           series :[
	            {
	              name:'户籍建档数',
	              type:'bar',
	              stack: 'two',
	              yAxisIndex:1,
	               itemStyle: {
	                            borderColor: '#fff',
	                            borderWidth: 2,
	                        },
	              barWidth:20,
	              data:yjdhjrk
	            },
	            {
	              name:'流动建档数',
	              type:'bar',
	              stack: 'two',
	              yAxisIndex:1,
	               itemStyle: {
	                            borderColor: '#fff',
	                            borderWidth: 2,
	                        },
	              barWidth:20,
	              data:yjdldrk
	            }, 
	            {
		              name:'其他建档数',
		              type:'bar',
		              stack: 'two',
		              yAxisIndex:1,
		               itemStyle: {
		                            borderColor: '#fff',
		                            borderWidth: 2,
		                        },
		              barWidth:20,
		              data:yjdqtrk
		            },
		             
			          {
			        	name:'户籍建档数占比',
					type:'line',
					yAxisIndex:0,
					
					data:jdhjzb
				},   {
			        	name:'流动建档数占比',
					type:'line',
					yAxisIndex:0,
					
					data:jdldzb
				},   
				  
	            ],   
	    };
	    myChart.setOption(option);
	}
	 
function chart02(id,djdczrk,djdldrk,pcsmc,yljgdm){ 
	  var myChart=echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	  var option = { 
	      title: {
	            text: '待建档分析(可下钻)', 
	        },
	      tooltip : {
	            trigger: 'axis',
	            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'   
	            }, 
	            formatter: function(params){
	                  var str = "";
	                  var hjItem = null;
	                  var ldItem = null;
	                  var qtItem = null; 
	                  var zbItem=null;
	                  var hjzbItem=null;
	                  var ldzbItem=null;
	                  var mcs = null;
	                  params.forEach(function(item,idx){
	                    if (item.seriesName==='待建档户籍人口') {
	                    	hjItem = item;
	                    }
	                    if (item.seriesName==='待建档流动人口') {
	                    	ldItem = item;
	                    } 
	                    mcs=item;
	                     
	                  });
	                  str += mcs.name+":"+"<br>";
	                  str += hjItem.marker+hjItem.seriesName+":"+hjItem.data+"<br>";
	                  str += ldItem.marker+ldItem.seriesName+":"+ldItem.data+"<br>";
	                    
	                  return str; 
	                }
	         },
	         color:['#26c2ca','#35a6ed','#99FF99','#FF7744','#FFFF00','#CC0000'],
	         legend: [
	           {
	                 data: [ '待建档户籍人口','待建档流动人口']
	                }
	         ],
	            toolbox: {
	             x:'85%',
	               show : true,
	               feature : { 
	                   saveAsImage : {show: true}
	               }
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
	             yAxis : [  
	                  {type:'value',name:''},
	                  {type:'value',name:'数量'},
	                      ],
	             xAxis : [
	                   {
	                       type : 'category',name:'乡镇',
	                       data : pcsmc
	                   }
	                ],
	           series :[
	        	   {
	 	              name:'待建档流动人口',
	 	              type:'bar',
	 	              stack: 'two',
	 	              yAxisIndex:1,
	 	               itemStyle: {
	 	                            borderColor: '#fff',
	 	                            borderWidth: 2,
	 	                        },
	 	              barWidth:20,
	 	              data:djdldrk
	 	            }  ,
	            {
	              name:'待建档户籍人口',
	              type:'bar',
	              stack: 'two',
	              yAxisIndex:1,
	               itemStyle: {
	                            borderColor: '#fff',
	                            borderWidth: 2,
	                        },
	              barWidth:20,
	              data:djdczrk
	            },
	            
	            ],   
	    };
	    myChart.setOption(option);
	    myChart.on('click', function(params) { 
	    	$("#yljgdm").val('');
	    	$("#xlh").val('');
	    	$("#yljgdm").val(yljgdm[params.dataIndex])
	    	$("#xlh").val(params.seriesIndex);
	     search2(yljgdm[params.dataIndex],params.seriesIndex); 
	    // window.open("${ctx}/jkdaglfx/djdfxxz2?p_yljgdm="+yljgdm[params.dataIndex]+"&p_xlh="+params.seriesIndex); 
	    });  
	}
	
	
function cx(){
	 var jg=$("#yljgdm").val();
	 var xl=$("#xlh").val(); 
	 var xb=$("#xb").val();
	 var csrq=$("#csrq").val();
	 var DATE_FORMAT = /^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$/;
	  if(csrq!=''){
		  if(DATE_FORMAT.test(csrq)){ 
			  } else {
			   alert("抱歉，您输入的日期格式有误，正确格式应为 2012-01-01 ");
			   retrun ;
			  }  
	  }
	 search2(jg,xl,xb,csrq) 
	 
}
function search2(yljgdm,xlh,xb,csrq){
	 document.getElementById("idname").style.display="";//显示
	 document.getElementById("idname2").style.display="";//显示
	layui.use([ 'table', 'layer' ], function() {
		var table = layui.table;
		table.render({
					elem : '#querytable',
					url : '${ctx}/jkdaglfx/djdfxxz',
					method : 'post',
					where : { 
						p_yljgdm : yljgdm,
						p_xlh : xlh,
						p_xb : xb,
						p_csrq : csrq,
					},
					cols : [[ 
						{ field : 'lxmc', title : '用户类型', width : '100' }, 
	                    { field : 'xm', title : '姓名', width : '100' },
	                    { field : 'xbmc', title : '性别', width : '100' }, 
	                    { field : 'csrq', title : '出生日期', width : '200' } ,
	                    { field : 'zjhm', title : '证件号码', width : '200' } ,
	                    { field : 'mz', title : '名族', width : '100' },
	                    { field : 'hjdz', title : '户籍', width : '200' },
	                    { field : 'ssxz', title : '所属乡镇', width : '200' } 
	                     

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
	
function chart03(id,jdrs,jdrq){
	  var myChart=echarts.init(document.getElementById(id));
	  var options = {
	      title: {
	                text: '建档趋势分析',  
	            },
	    color : [ '#188df0', '#DD228F', '#7cb5ec', '#f6ae6e',
	      '#adff2f', '#444446', '#799aec', '#61d4e2',
	      '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
	    tooltip : {
	      trigger : 'axis'
	    },
	    legend : { 
	    },
	    xAxis :  {
	      name:"时间",
	      type : 'category',
	      boundaryGap : false,
	      data : jdrq
	    },
	    yAxis : {
	      name:"人数",
	      type : 'value'
	    },
	    series : [
	      {
	        name: '建档人数', 
	                data: jdrs,
	                type: 'line',
	                showBackground: true,
	        },
	        ]
	  };
	  myChart.setOption(options);
	}
  Date.prototype.Format = function (fmt) { //author: meizz 
      var o = {
          "M+": this.getMonth() + 1, //月份 
          "d+": this.getDate(), //日 
          "h+": this.getHours(), //小时 
          "m+": this.getMinutes(), //分 
          "s+": this.getSeconds(), //秒 
          "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
          "S": this.getMilliseconds() //毫秒 
      };
      if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
      for (var k in o)
          if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
      return fmt;
  } 

  function sjxz(id){ 
    var myDate=new Date() 
      var month=myDate.getMonth()+1;
      var year=myDate.getFullYear(); 
      if (month<10) { month = "0" + month; }
      
    if(id=='year'){
      $("#kssj").val('${kssj}'.substr(0,4));
      $("#jssj").val('${jssj}'.substr(0,4));
      document.getElementById("kssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy'});
        };
      document.getElementById("jssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy'});
          };
      } else if(id=='month'){
      $("#kssj").val('${kssj}'.substr(0,7));
      $("#jssj").val('${jssj}'.substr(0,7));
      document.getElementById("kssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy-MM'});
        };
      document.getElementById("jssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy-MM'});
          };
      } else if(id=='day'){
       $("#kssj").val('${kssj}'+'-01');
      $("#jssj").val('${jssjs}');
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM-dd'})
      };
    document.getElementById("jssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM-dd'})
        };
    }else{
    	 $("#kssj").val('${kssj}'.substr(0,7));
         $("#jssj").val('${jssj}'.substr(0,7));
      document.getElementById("kssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy-MM'})
        };
      document.getElementById("jssj").onclick = function(){
        WdatePicker({dateFmt:'yyyy-MM'})
          };
    }
     
  } 
</script>
</head>
<body>
	<!-- 头部 start-->
	<div class="headBox"></div>
	<!-- 头部 end-->

	<div class="main mainThree">
		<div class="top clearfix">
			<div class="topLeft">
				<span class="det"> <span class="sj sjKs"> 
				<i class="n" onclick="sjxz('year')">年</i> 
				<i class="y active" onclick="sjxz('month')">月</i> 
				<i class="r " onclick="sjxz('day')">日</i>
				</span> <span class="det"> <label for="">开始时间</label> <input
						type="text" id="kssj" readonly="readonly" onClick=""
						value="${kssj }" class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jssj" readonly="readonly" onClick=""
					value="${jssj }" class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">乡镇名称</label> <select id="jgdm" name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${jdjgList}" var="jg">
							<option value="${jg.jgdm}">${jg.jgmc}</option>
						</c:forEach>
				</select>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>

		<div id="chart01"
			style="width: 100%; height: 400px; background: #FFFFFF; margin-top: 48px"></div>

		<div id="chart02"
			style="width: 100%; height: 400px; background: #FFFFFF; margin-top: 48px"></div>
		<div style="position: absolute; margin-top: -7px; margin-left: 110px;">
			<span style="font-size: 15px; color: #ff0000; font-weight: bold;"
				class="name">*</span> <span>备注:此分析是所有时间段待建档人数分析,因为待建档统计无法用时间来限制</span>
		</div>

		 <div id="idname2" style=" margin-left: 650px; margin-top:  40px;display: none">
					<span > <label
						for="">性别</label> <select id="xb" name="xb" lay-search>
							<option value="">全部</option>
							<option value="男">男</option>
							<option value="女">女</option>

					</select>
					</span>
					<span > <label
						for="">出生日期</label> <input id='csrq' style='width: 100px' type="text" name="fname" /> 
						</span>
						<span ><input id='yljgdm' style='width: 100px;display: none' type="text" name="fname" /> 
						</span>
						<span ><input id='xlh' style='width: 100px;display: none' type="text" name="fname" /> 
						</span>
				   <button type="button" class="layui-btn layui-btn-xs" onclick="cx()">查询</button>
				</div>
			<div id="idname" style="width: 100%; background: #FFFFFF; margin: 35px auto;display: none">
				<table id="querytable" class="layui-table" lay-filter="querytab"
					style="margin: -10px;"></table>
			</div>

		<div id="chart03"
			style="width: 100%; height: 400px; background: #FFFFFF; margin-top: 48px"></div>
	    </div>
 

</body>

<script>
  $(".sjKs").siblings("input").hide().siblings("input").eq(0).show();

  $(".sjKs i").click(function(){
    $(this).addClass("active").siblings("i").removeClass("active");
    $(".sjKs").siblings("input").hide().eq($(this).index()).show();
  });
  
  $(".sjJs").siblings("input").hide().siblings("input").eq(0).show();

  $(".sjJs i").click(function(){
    $(this).addClass("active").siblings("i").removeClass("active");
    $(".sjJs").siblings("input").hide().eq($(this).index()).show();
  });

</script>
</html>