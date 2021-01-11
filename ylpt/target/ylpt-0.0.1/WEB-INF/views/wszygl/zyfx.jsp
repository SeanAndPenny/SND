<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>住院分析</title>

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

//日期控件
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

$(document).ready(function(){
     getData();
     sjxz();
  });

function search() {
    getData();     
    }
function getData(){
       
       var jgdm=$("#jgdm").val();
       if(jgdm=="" ||jgdm==null){
        jgdm='${jgdm}'  
      } 
        
      
      swxxfxEchars(jgdm); 
     
      }
function swxxfxEchars(jgdm){
  
      var kssj=$("#kssj").val();
      var jssj=$("#jssj").val();
      if(jssj<kssj){
    	  alert('请选择的结束时间大于或大于开始时间')
    	return   
      }
      $.ajax({
        url: "${ctx}/zyfx/zyfx.json?p_kssj="+kssj
              +"&p_jssj="+jssj
              +"&p_yljgdm="+jgdm,    
         datatype:"json",
        context: document.body, 
        success: function(data){
           var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
           var fianl=xx.zyfxList;
           var yljgmc=new Array();
           var ryrs=new Array();
           var zyrs=new Array();
           var cyrs=new Array(); 
           var yljgdm=new Array(); 
            
           for (var i=0;i<fianl.length;i++) { 
        	   yljgdm[i]=fianl[i].yljgdm;
        	   yljgmc[i]=fianl[i].yljgmc;
        	   ryrs[i]=fianl[i].ryrs;
        	   zyrs[i]=fianl[i].zyrs; 
        	   cyrs[i]=fianl[i].cyrs; 
              }
           
             chart01('chart01',yljgmc,ryrs,zyrs,cyrs,yljgdm,kssj,jssj); 
             getechar02(jgdm,kssj,jssj);
             getechar03(jgdm,kssj,jssj)
          }
          });
  }
  
 
 
  
function sjxz(id){ 
	var myDate=new Date();
	var month=myDate.getMonth()+1;
	var year=myDate.getFullYear(); 
	if (month<10) { month = "0" + month; } 
	  
	var weekday=myDate.getDate()-myDate.getDay()+1;
	if (weekday<10) { weekday = "0" + weekday; } 
	 if(id=='week'){  
		$("#kssj").val(myDate.Format('yyyy-MM')+'-'+weekday);
		$("#jssj").val(myDate.Format('yyyy-MM-dd'));  
		} 
	else if(id=='month'){
		$("#kssj").val(myDate.Format('yyyy-MM')+'-01');
		$("#jssj").val(myDate.Format('yyyy-MM-dd'));  
		} 
	else if(id=='day'){ 
		 $("#kssj").val(myDate.Format('yyyy-MM-dd'));
		$("#jssj").val(myDate.Format('yyyy-MM-dd')); 
	}else{
		  
		$("#kssj").val('${kssj }');
		$("#jssj").val('${jssj }');
		 
		
	}
	 
}
</script>
<script type="text/javascript">
function chart01(id,yljgmc,ryrs,zyrs,cyrs,yljgdm,kssj,jssj) { 
	var ryzs=0;//入院总数
	var cyzs=0;//出院总数
	 for(var i=0;i<ryrs.length;i++){
		 ryzs+=Number(ryrs[i]);
	 }
	 for(var i=0;i<cyrs.length;i++){
		 cyzs+=Number(cyrs[i]);
	 }
	 
	var myChart = echarts.init(document.getElementById(id));
	    myChart.dispose();
	    myChart = echarts.init(document.getElementById(id));
	    var option = { 	 
	  	      title: {
	  	    	  text: '出入院数据分析',
	  		     subtext:'入院院人数:'+ryzs+'人'+';出院人数'+cyzs+'人',
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
	  	                    if (item.seriesName==='入院人数') {
	  	                    	hjItem = item;
	  	                    }
	  	                   /*  if (item.seriesName==='在院人数') {
	  	                    	ldItem = item;
	  	                    } */
	  	                    if (item.seriesName==='出院人数') {
	  	                    	qtItem = item;
	  	                    } 
	  	                      
	  	                    mcs=item;
	  	                     
	  	                  });
	  	                  str += mcs.name+":"+"<br>";
	  	                  if(hjItem!=null){
	  	                	 str += hjItem.marker+hjItem.seriesName+":"+hjItem.data+"<br>"; 
	  	                  }
	  	                /*  if(ldItem!=null){
	  	                	str += ldItem.marker+ldItem.seriesName+":"+ldItem.data+"<br>"; 
	  	                 } */
	  	                  if(qtItem!=null){
	  	                	str += qtItem.marker+qtItem.seriesName+":"+qtItem.data+"<br>";  
	  	                  }
	  	                  
	  	                  
	  	                  return str; 
	  	                }
	  	             
	  	         },
	  	         color:['#26c2ca','#35a6ed','#99FF99','#FF7744','#FFFF00','#CC0000'],
	  	         legend: [
	  	           {
	  	                 data: [ '入院人数',/* '在院人数', */'出院人数']
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
	  	           grid:{
	  	            	y:100,
	  	            },
	  	             yAxis : [ 
	  	            	  {type:'value',name:'数量'},
	  	            	  
	  	                      ],
	  	             xAxis : [
	  	                   {
	  	                       type : 'category',name:'机构',
	  	                       data : yljgmc
	  	                   }
	  	                ],
	  	           series :[

		  	            {
		  	              name:'入院人数',
		  	              type:'bar',
		  	              stack: 'two',
		  	              yAxisIndex:0,
		  	               itemStyle: {
		  	                            borderColor: '#fff',
		  	                            borderWidth: 2,
		  	                        },
		  	              barWidth:20,
		  	              data:ryrs 
		  	            },
	  	        	 {
	  		              name:'出院人数',
	  		              type:'bar',
	  		              stack: 'two',
	  		              yAxisIndex:0,
	  		               itemStyle: {
	  		                            borderColor: '#fff',
	  		                            borderWidth: 2,
	  		                        },
	  		              barWidth:20,
	  		              data:cyrs
	  		            } ,
	  	           /*  {
	  	              name:'在院人数',
	  	              type:'bar',
	  	              stack: 'two',
	  	              yAxisIndex:1,
	  	               itemStyle: {
	  	                            borderColor: '#fff',
	  	                            borderWidth: 2,
	  	                        },
	  	              barWidth:20,
	  	              data:zyrs
	  	            },  */
	  	              
	  				  
	  	            ],  
	    };
	    myChart.setOption(option); 
	    myChart.on('click', function(params) { 
	    	getechar02(yljgdm[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex]);
	    	getechar03(yljgdm[params.dataIndex],kssj,jssj,yljgmc[params.dataIndex]);
		 	            });  
}
 function  getechar02(yljgdm,kssj,jssj,yljgmc){ 
     $.ajax({
       url: "${ctx}/zyfx/zyfxechars.json?p_kssj="+kssj
             +"&p_jssj="+jssj
             +"&p_yljgdm="+yljgdm,    
        datatype:"json",
       context: document.body, 
       success: function(data){
          var nodes=eval(data);
          var hh= JSON.stringify(nodes);
          var xx=JSON.parse(hh);
          var fian2=xx.getechars02List;
          var rq=new Array();
          var ryrs=new Array();
           
          var cyrs=new Array(); 
          
           
          for (var i=0;i<fian2.length;i++) { 
       	   rq[i]=fian2[i].rq;
       	   ryrs[i]=fian2[i].ryrs;
       	   
       	   cyrs[i]=fian2[i].cyrs; 
             }
          
            chart02('chart02',rq,ryrs,cyrs,yljgmc); 
            
         }
         }); 
 }
 function chart02(id,rq,ryrs,cyrs,yljgmc){
	 if(typeof yljgmc==='undefined'){
		 yljgmc='';
		}
	  var myChart=echarts.init(document.getElementById(id));
	    

	  var options = {
	      title: {
	                text: yljgmc+'出入院趋势分析',  
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
	      name:"日期",
	      type : 'category',
	      boundaryGap : false,
	      data : rq
	    },
	    dataZoom: [
            {
              type: "slider",
              realtime: true, //拖动滚动条时是否动态的更新图表数据
              height: 25, //滚动条高度
              start: 90, //滚动条开始位置（共100等份）
              end: 100 //结束位置（共100等份）
            }
          ],
	    yAxis : {
	      name:"人数",
	      type : 'value'
	    },
	     
	    series : [
	      {
	        name: '入院人数', 
	                data: ryrs,
	                type: 'line',
	                showBackground: true,
	        },
	         
	        {
	            name: "出院人数",
	            type: "line",
	            symbolSize: 8,
	            smooth: true,
	             
	            data: cyrs
	        } 
	        ]
	  };
	  myChart.setOption(options);
	   
	}
 
 
 function  getechar03(yljgdm,kssj,jssj,yljgmc){ 
     $.ajax({
       url: "${ctx}/zyfx/getechar03.json?p_kssj="+kssj
             +"&p_jssj="+jssj
             +"&p_yljgdm="+yljgdm,    
        datatype:"json",
       context: document.body, 
       success: function(data){
          var nodes=eval(data);
          var hh= JSON.stringify(nodes);
          var xx=JSON.parse(hh);
          var fian3=xx.getechars03List;
          var rq=new Array();
          var zyrs=new Array();
          for (var i=0;i<fian3.length;i++) { 
       	   rq[i]=fian3[i].rq;
       	   zyrs[i]=fian3[i].zyrs; 
             }
            chart03('chart03',rq,zyrs,yljgmc);  
         }
         }); 
 }
 function chart03(id,rq,zyrs,yljgmc){
	 if(typeof yljgmc==='undefined'){
		 yljgmc='';
		}
	 var zyzs=0;
	   for(var i=0;i<zyrs.length;i++){
		   zyzs+=Number(zyrs[i]) ;
	   }
	   
	  var myChart=echarts.init(document.getElementById(id));
	  var options = {
	      title: {
	                text: yljgmc+'在院趋势分析',
	                subtext:'在院院人数:'+zyzs+'人',
	            },
	            grid:{
  	            	y:100,
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
	      name:"日期",
	      type : 'category',
	      boundaryGap : false,
	      data : rq
	    },
	    dataZoom: [
           {
             type: "slider",
             realtime: true, //拖动滚动条时是否动态的更新图表数据
             height: 25, //滚动条高度
             start: 90, //滚动条开始位置（共100等份）
             end: 100 //结束位置（共100等份）
           }
         ],
	    yAxis : {
	      name:"人数",
	      type : 'value'
	    },
	     
	    series : [
	      {
	        name: '入院人数', 
	                data: zyrs,
	                type: 'line',
	                showBackground: true,
	        } 
	        ]
	  };
	  myChart.setOption(options);
	   
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
						<ul id="sjxzid">
							<i class="r "  onclick="sjxz('day')">当天 </i>  
                            <i class="w" onclick="sjxz('week')" >本周</i>
                             <i class="y" onclick="sjxz('month')">本月</i>  
                             <i class="qb active" onclick="sjxz('all')">全部</i>  
						</ul>
				</span> <span class="det"> <label for="">开始时间</label> <input
						type="text" id="kssj" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						value="${kssj }" class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span>
				</span> <span class="det" style="margin-left: 5px;"> <label for="">结束时间</label>
					<input type="text" id="jssj" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					value="${jssj }" class="Wdate" style="width: 100px" />
					<div
						style="position: absolute; margin-left: 188px; margin-top: -28px;">
						<img src="<c:url value="/static/commons/images/topImg1.png"/>">
					</div>
				</span> <span class="det detLast" style="margin-left: 150px;"> <label
					for="">机构名称</label> <select  style="width: 165px;" id="jgdm" name="jgdm" lay-search>
						<option value="">全区</option>
						<c:forEach items="${zyjgList}" var="jg">
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