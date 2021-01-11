<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>数据分析</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>


<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>

<script type="text/javascript">
layui.use('element', function(){
	  var $ = layui.jquery
	  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
	  
	  //触发事件
	  var active = {
	    tabAdd: function(){
	      //新增一个Tab项
	      element.tabAdd('demo', {
	        title: '新选项'+ (Math.random()*1000|0) //用于演示
	        ,content: '内容'+ (Math.random()*1000|0)
	        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
	      })
	    }
	    ,tabDelete: function(othis){
	      //删除指定Tab项
	      element.tabDelete('demo', '44'); //删除：“商品管理”
	      
	      
	      othis.addClass('layui-btn-disabled');
	    }
	    ,tabChange: function(){
	      //切换到指定Tab项
	      element.tabChange('demo', '22'); //切换到：用户管理
	    }
	  };
	  
	  $('.site-demo-active').on('click', function(){
	    var othis = $(this), type = othis.data('type');
	    active[type] ? active[type].call(this, othis) : '';
	  });
	  
	  //Hash地址的定位
	  var layid = location.hash.replace(/^#test=/, '');
	  element.tabChange('test', layid);
	  
	  element.on('tab(test)', function(elem){
	    location.hash = 'test='+ $(this).attr('lay-id');
	  });
	  
	});
</script>

<script type="text/javascript">

function chart01(id,sl1,sl2,sl3,sl4,sl5,sl6,mc,xmc,lj,ywzw){ 
	
	var colors = ['#00adf4','#86cb68','#9884f3','#6288d1',
        '#066fd8','#627da3', '#9684f2', '#ee7a8d',
        '#ffc231','#57c5a2', '#76caf4','#527df9'];
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
	var option = {

		      color:['#188df0','#FF3EFF',
		          '#f6ae6e',  '#adff2f', '#444446', 
		        '#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
		        title: {
	                text: ywzw+'趋势分析'
	            },
		      tooltip: {
		          trigger: 'axis'
		      },
		      legend: {
		    	  data: mc 
		      },
		      toolbox: {
		          show: true,
		          feature: {
		              magicType: {show: true, type: ['stack', 'tiled']},
		              saveAsImage: {show: true}
		          }
		      },
		      xAxis: {
		          type: 'category',
		          boundaryGap: false,
		          data: xmc
		      },
		      yAxis: {
		          type: 'value',
		          name :'数量'
		      },
		      dataZoom: [
		          {
		              type: 'slider',
		              show: true,
		              start: 0,
		              end: 100,
		              handleSize: 8
		          },
		            {
		                type: 'inside',
		                start: 0,
		                end: 10
		          }, 
		          {
		              start: 0,
		              end: 10,
		              
		              handleSize: '80%',
		              handleStyle: {
		                  color: '#fff',
		                  shadowBlur: 3,
		                  shadowColor: 'rgba(0, 0, 0, 0.6)',
		                  shadowOffsetX: 2,
		                  shadowOffsetY: 2
		              }
		          }
		      ],
		      series: [
		              {
		             <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
	                   <c:if test="${varStatus.count ==1}">
	                          name:"${mcpzList.mc}",
	                   </c:if>
	                </c:forEach>
	               	 type:'line',
	               	smooth: true,
	                    data:sl1
		               },
		               {
		              <c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
	                    <c:if test="${varStatus.count ==2}">
	                           name:"${mcpzList.mc}",
	                    </c:if>
	                  </c:forEach>
	                	 type:'line',
	                	 smooth: true,
	                     data:sl2
		            },
		            {
		            	<c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
	                       <c:if test="${varStatus.count ==3}">
	                           name:"${mcpzList.mc}",
	                       </c:if>
	                    </c:forEach>
	                	 type:'line',
	                	 smooth: true,
	                     data:sl3
		            },
		            {
		            	<c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
	                       <c:if test="${varStatus.count ==4}">
	                           name:"${mcpzList.mc}",
	                       </c:if>
	                    </c:forEach>
	                	 type:'line',
	                	 smooth: true,
	                     data:sl4
		            },
		            {
		            	<c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
	                       <c:if test="${varStatus.count ==5}">
	                           name:"${mcpzList.mc}",
	                       </c:if>
	                    </c:forEach>
	                	 type:'line',
	                	 smooth: true,
	                     data:sl5
		            },
		            {
		            	<c:forEach  var="mcpzList" items="${mcpzList}" varStatus="varStatus">
	                       <c:if test="${varStatus.count ==6}">
	                           name:"${mcpzList.mc}",
	                       </c:if>
	                    </c:forEach>
	                	 type:'line',
	                	 smooth: true,
	                     data:sl6
		            }
		      ]
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) {  
		  
		   });
}

function chart02(id,sl1,sl2,sl3,sl4,sl5,sl6,xmc,mc,wdzw, wdzw2,wdzw3,wdzw4,wdzw5,wdzw6, ywzw){ 
	var wdzwlist=new Array();
	var wdzwlist2=new Array();
	var wdzwlist3=new Array();
	var wdzwlist4=new Array();
	var wdzwlist5=new Array();
	var wdzwlist6=new Array();
	var wdzwAllList=new Array();
	
	
	for(var i=0;i<wdzw.length;i++){
	 if( wdzw[i]!=null){
		 wdzwlist.push(wdzw[i])
	  } 
    }
	 for(var i=0;i<wdzw2.length;i++){
		 if( wdzw2[i]!=null){
			 wdzwlist2.push(wdzw2[i])
		  } 
	    }
	
	for(var i=0;i<wdzw3.length;i++){
		 if( wdzw3[i]!=null){
			 wdzwlist3.push(wdzw3[i])
		  } 
	    }
	
	for(var i=0;i<wdzw4.length;i++){
		 if( wdzw4[i]!=null){
			 wdzwlist4.push(wdzw4[i])
		  } 
	    }
	
	for(var i=0;i<wdzw5.length;i++){
		 if( wdzw5[i]!=null){
			 wdzwlist5.push(wdzw5[i])
		  } 
	    }
	
	for(var i=0;i<wdzw6.length;i++){
		 if( wdzw6[i]!=null){
			 wdzwlist6.push(wdzw6[i])
		  } 
	    }
	
	wdzwAllList.push(wdzwlist[0]);
	wdzwAllList.push(wdzwlist2[0]);
	wdzwAllList.push(wdzwlist3[0]);
	wdzwAllList.push(wdzwlist4[0]);
	wdzwAllList.push(wdzwlist5[0]);
	wdzwAllList.push(wdzwlist5[0]);
   
	var colors = ['#00adf4','#86cb68','#9884f3','#6288d1',
        '#066fd8','#627da3', '#9684f2', '#ee7a8d',
        '#ffc231','#57c5a2', '#76caf4','#527df9'];
	var myChart=echarts.init(document.getElementById(id));
    myChart.dispose();
    myChart = echarts.init(document.getElementById(id));
    option = {

		      color:['#188df0','#FF3EFF',
		          '#f6ae6e',  '#adff2f', '#444446', 
		        '#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
		        title: {
	                text: ywzw[0]+'趋势分析'
	            },
	            tooltip: {
			          trigger: 'axis'
			      },
			      legend: {
			    	  data: wdzwAllList
			      },
		      toolbox: {
		          show: true,
		          feature: {
		              magicType: {show: true, type: ['stack', 'tiled']},
		              saveAsImage: {show: true}
		          }
		      },
		      xAxis: {
		          type: 'category',
		          boundaryGap: false,
		          data: xmc
		      },
		      yAxis: {
		          type: 'value',
		          name :'数量'
		      },
		      dataZoom: [
		          {
		              type: 'slider',
		              show: true,
		              start: 0,
		              end: 100,
		              handleSize: 8
		          },
		            {
		                type: 'inside',
		                start: 0,
		                end: 10
		          }, 
		          {
		              start: 0,
		              end: 10,
		              
		              handleSize: '80%',
		              handleStyle: {
		                  color: '#fff',
		                  shadowBlur: 3,
		                  shadowColor: 'rgba(0, 0, 0, 0.6)',
		                  shadowOffsetX: 2,
		                  shadowOffsetY: 2
		              }
		          }
		      ],
		      series: [
		              {
		             name:wdzwAllList[0],
	                 type:'line',
	               	smooth: true,
	                    data:sl1
		               } ,
		               {name:wdzwAllList[1],
			            type:'line',
			            smooth: true,
			            data:sl2
				        } ,
				        {name:wdzwAllList[2],
					     type:'line',
					     smooth: true,
					     data:sl3
						} ,
						{name:wdzwAllList[3],
						  type:'line',
						  smooth: true,
						  data:sl4
						 } ,
						 {name:wdzwAllList[4],
						   type:'line',
						   smooth: true,
						   data:sl5
						  } ,
						  {name:wdzwAllList[5],
							type:'line',
							smooth: true,
							data:sl6
						   } ,
		      ]
    	};
	  myChart.setOption(option);
	

		       
}

function getechatsdata(kssj,jssj,jgdm,lj,wdtj){
	 
    $.ajax({
    	url: "${ctx}/xxxQsfx/xxxQsfx.json?p_ywbz="+'${ywbz}'+'&p_yxbz='+'${yxbz}'
    			  +'&p_kssj='+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_jgdm="+jgdm
    			  +"&p_tjsjwd=0"
    			  +"&p_wdtj="+wdtj,
    			
    			
    			
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		   var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.xxxlist;
    		 var fian2=xx.mcpzList;
    		 var fian3=xx.mcpz;
    		 var xmc=new Array();//X轴名称
    		 var sl1=new Array();
    		 var sl2=new Array();
    		 var sl3=new Array();
    		 var sl4=new Array();
    		 var sl5=new Array();
         	 var sl6=new Array();
         	 var mc=new Array();
         	 var mc2=new Array();
         	var ywzw=new Array();
         	 var ii=0;
         	 var jj=0;
         	 
        	          
        	 for (var j=0;j<fian2.length;j++){
    			 mc2[j]=fian2[j].mc;
    			 ywzw=fian2[0].ywzw
        	 }  
    			 
        	          
    		 for (var j=0;j<fian3.length;j++){
    			 mc[j]=fian3[j].mc;
    		 }
    		  
    		 for (var i=0;i<fianl.length;i++) {
    			jj=i+1;
    			xmc[i]=fianl[i].rq;
		         	 sl1[i]=fianl[i].sl1;
		         	 sl2[i]=fianl[i].sl2; 
		         	 sl3[i]=fianl[i].sl3;
		         	 sl4[i]=fianl[i].sl4; 
		         	 sl5[i]=fianl[i].sl5;
		         	 sl6[i]=fianl[i].sl6; 
		         }  
    		 chart01('map',sl1,sl2,sl3,sl4,sl5,sl6,mc2,xmc,lj,ywzw); 
    		}
    }
      	);
    }



function getechatsdata2(kssj,jssj,jgdm,lj,wdtj){ 

	 
    $.ajax({
    	url: "${ctx}/xxxQsfx/xxxQsfx.json?p_ywbz="+'${ywbz}'+'&p_yxbz='+'${yxbz}'
    			  +'&p_kssj='+kssj
    			  +"&p_jssj="+jssj
    			  +"&p_jgdm="+jgdm
    			  +"&p_tjsjwd=0"
    			  +"&p_wdtj="+wdtj,
    			
    			
    			
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		 var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.yyyList;
    		 var xmc=new Array();//X轴名称
    		 var mc=new Array();//X轴名称
    		 var sl1=new Array();
    		 var sl2=new Array();
    		 var sl3=new Array();
    		 var sl4=new Array();
    		 var sl5=new Array();
    		 var sl6=new Array();
    		 
    		 var wdzw=new Array();
    		 var wdzw2=new Array();
    		 var wdzw3=new Array();
    		 var wdzw4=new Array();
    		 var wdzw5=new Array();
    		 var wdzw6=new Array();
    		 
             var ywzw =new Array();
         	 
        	
    		  
    		 for (var i=0;i<fianl.length;i++) {
    			 mc[i]=fianl[i].mc;
    			 xmc[i]=fianl[i].rq;
		         sl1[i]=fianl[i].sl1;
		         sl2[i]=fianl[i].sl2;
		         sl3[i]=fianl[i].sl3;
		         sl4[i]=fianl[i].sl4;
		         sl5[i]=fianl[i].sl5;
		         sl6[i]=fianl[i].sl6;
		         
		         wdzw[i]=fianl[i].wdzw;
		         wdzw2[i]=fianl[i].wdzw2;
		         wdzw3[i]=fianl[i].wdzw3;
		         wdzw4[i]=fianl[i].wdzw4;
		         wdzw5[i]=fianl[i].wdzw5;
		         wdzw6[i]=fianl[i].wdzw6;
		         
		         ywzw[i]=fianl[i].ywzw;  
		         }  
    		 chart02('map',sl1,sl2,sl3,sl4,sl5,sl6,xmc,mc,wdzw, wdzw2,wdzw3,wdzw4,wdzw5,wdzw6, ywzw); 
    		}
    }
      	);
    }


function getData(){
	
	layui.use(['table','layer','laydate'] , function(){
        var table = layui.table;
        var laydate=layui.laydate;
        laydate.render({ 
      	  elem: '#enddate',
      	type: 'year'
      });
    });
	   var kssj=$("#kssj").val();
	   var jssj=$("#jssj").val();
	   
	  var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var lj='${lj}' 
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	  
	  var wdtj=$("#wdtj").val();
	 getechatsdata(kssj,jssj,jgdm,lj,wdtj); 
    }
    
    
function getData2(){
	
	layui.use(['table','layer','laydate'] , function(){
        var table = layui.table;
        var laydate=layui.laydate;
        laydate.render({ 
      	  elem: '#enddate',
      	type: 'year'
      });
    });
	   var kssj=$("#kssj").val();
	   var jssj=$("#jssj").val();
	   
	  var jgdm=$("#yljgdm").val();
	  if(jgdm=="" ||jgdm==null){
		  jgdm='${jgdm}'  
	  }
	  var lj='${lj}' 
	  if(jssj<kssj){
		  alert("选择的结束时间请大于或等于开始时间")
		  return;
	  }
	  
	  var wdtj=$("#wdtj").val();
	 
	 getechatsdata2(kssj,jssj,jgdm,lj,wdtj); 
    }
    
    
    
	$(document).ready(function(){
		
		 if($("#wdtj").val()==''||$("#wdtj").val()==null||$("#wdtj").val()=='yljgdm'){ 
		        getData()
		        }else {
		        	getData2()
		        }
		sjxz();
	});
		
	function search() {
		
		 if($("#wdtj").val()==''||$("#wdtj").val()==null||$("#wdtj").val()=='yljgdm'){ 
          getData()
        }else {
        	getData2()
        }
        
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
			$("#kssj").val(year);
			$("#jssj").val(year);
			document.getElementById("kssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy'});
				};
			document.getElementById("jssj").onclick = function(){
					WdatePicker({dateFmt:'yyyy'});
					};
			} else if(id=='month'){
			$("#kssj").val(year+"-"+month);
			$("#jssj").val(year+"-"+month);
			document.getElementById("kssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy-MM'});
				};
			document.getElementById("jssj").onclick = function(){
					WdatePicker({dateFmt:'yyyy-MM'});
					};
			} else if(id=='day'){
			 $("#kssj").val(year+"-"+month+"-"+"01");
			$("#jssj").val(myDate.Format('yyyy-MM-dd'));
		document.getElementById("kssj").onclick = function(){
			WdatePicker({dateFmt:'yyyy-MM-dd'});
			};
		document.getElementById("jssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy-MM-dd'});
				};
		}else{
			 $("#kssj").val('${kssj}');
				$("#jssj").val('${jssj}');
			document.getElementById("kssj").onclick = function(){
				WdatePicker({dateFmt:'yyyy-MM-dd'});
				};
			document.getElementById("jssj").onclick = function(){
					WdatePicker({dateFmt:'yyyy-MM-dd'});
					};
			
		}
		 
	}
	function zxfz(){
		var jgdm=$("#yljgdm").val();
		  if(jgdm=="" ||jgdm==null){
			  jgdm='${jgdm}'  
		  }
		window.location.href="${ctx}/xxx/xxx?p_ywbz="+'${ywbz }' 
				+"&p_yxbz=1&p_tjsjwd=0&p_jgdm="
	}
</script>
</head>
<body style="background: #ffffff; overflow: scroll;">
	<div id="queryform" class="layui-form">



		<table style="width: 100%">
			<tr>
				<td style="width: 33.3%">
					<div class="layui-tab" style="width:195px;margin-left:30%">
						<ul class="layui-tab-title">
							<li onclick="sjxz('year')">年</li>
							<li onclick="sjxz('month')">月</li>
							<li class="layui-this" onclick="sjxz('day')">日</li>
						</ul>
					</div>
				</td>
				<td style="width: 33.3%">
					<div style="margin-left: 132px;">
						<span class="canter">开始时间：</span> <input type="text" id="kssj"
							readonly="readonly" onClick="" value="${kssj }" class="Wdate"
							style="width: 100px" />
					</div>
				</td>

				<td style="width: 33.3%">
					<div style="margin-left: 152px;">
						<span class="canter">结束时间：</span> <input type="text" id="jssj"
							readonly="readonly" onClick="" value="${jssj }" class="Wdate"
							style="width: 100px" />
					</div>
				</td>

			</tr>
			<tr>
			<c:if test="${ywbz != 'QYJG' && ywbz != 'YJJJ'}">
				<td>
					<div  class="layui-inline"  style="margin-left: 95px;">
						<label class="layui-form-label label3">机构名称</label>
						<div class="layui-input-inline ">
							<select id="yljgdm" name="yljgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
			</c:if>

				<td >
					<div class="layui-form-item"
						style="margin-top: 20px; margin-left: 78px;">
						<label class="layui-form-label label3">维度统计</label>
						<div class="layui-input-inline ">
							<select id="wdtj" name="wdtj" lay-search>
								<option value="">维度统计</option>
								<c:forEach items="${wdtjList}" var="wdtj">
									<option value="${wdtj.wdyw}">${wdtj.wdmc}</option>
								</c:forEach>
							</select>
						</div>
					</div>

				</td>
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block"
							style="margin-left: 152px; position: absolute">
							<button class="layui-btn" onclick="search();">查询</button>
							<button class="layui-btn" onclick="zxfz();">纵向比较</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="map"
		style="width: 100%; height: 380px; background: #FFFFFF; margin-top: 15px; align:center;">
	</div>
	<!-- <div
		style="position: absolute; margin-left: 1150px; margin-top: -342px">
		<input type="button" value="纵向比较" onclick="zxfz()" />
	</div>
 -->
</body>

</html>