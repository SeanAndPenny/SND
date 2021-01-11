<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>新区首页面</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
	<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
	
	<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
	
<%-- 	<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/skin/WdatePicker.css"/>"></script> --%>
	
	<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script>
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
<style>
#ssflcx {
	margin-left: 166px;
	margin-top: -42px;
}

#ssjb, #jtystj {
	width: 100%;
	max-width: 100%;
	margin-bottom: 20px;
	margin-top: 82px;
	margin-left: 20px;
}

#sstj {
	display: inline-block;
	height: 57px;
	line-height: 20px;
	padding: 17px 18px;
	white-space: nowrap;
	text-align: center;
	font-size: 19px;
	border: none;
	border-radius: 2px;
	cursor: pointer;
	margin-top: 40px;
}

#zcd {
	display: inline-block;
	height: 57px;
	line-height: 20px;
	padding: 17px 18px;
	white-space: nowrap;
	text-align: center;
	font-size: 19px;
	border: none;
	border-radius: 2px;
	cursor: pointer;
}

#yjcl {
	font-size: 19px;
	margin-top: -138px;
	margin-left: 10px;
}

#zcd1 {
	display: inline-block;
	height: 57px;
	line-height: 20px;
	padding: 17px 18px;
	white-space: nowrap;
	text-align: center;
	font-size: 19px;
	border: none;
	border-radius: 2px;
	cursor: pointer;
}

h4, h5 {
	margin-top: 10px;
	margin-bottom: -45px;
	;
}

#map2 {
	width: 60%;
	height: 250px;
	background: transparent;
	margin-top: -221px;
	margin-left: 825px;
	-webkit-tap-highlight-color: transparent;
	user-select: none;
	position: relative;
}

.layui-table-box {
	position: relative;
	overflow: hidden;
	margin-top: 60px;
}
#yjcltable{
    margin-top: -70px;
    margin-left: 177px;
}
</style>
</script>
<script type="text/javascript">
function bassgd(){
	var basskssj= $("#basskssj").val();
	var bassjssj= $("#bassjssj").val();
	var bassjgdm= $("#bassjgdm").val();
	
	 window.open("${ctx}/zybass/zybass?p_kssj="+basskssj
     		+"&p_jssj="+bassjssj+"&p_jgdm="+bassjgdm
             );
}


function bassxx(){//病案手术查询 
	var basskssj= $("#basskssj").val();
	var bassjssj= $("#bassjssj").val();
	var bassjgdm= $("#bassjgdm").val(); 
	if (basskssj>bassjssj) {
		alert("结束日期请大于或等于开始日期");
		return;
	}
	 $.ajax({
	      url: "${ctx}/basscx/basscx.json?p_basskssj="+basskssj+"&p_bassjssj="+bassjssj
	    		  +"&p_bassjgdm="+bassjgdm,
	       datatype:"json",
	      context: document.body, 
	      success: function(data){ 
	    	  $("#basskssj").val(data.basskssj)
	    	   $("#bassjssj").val(data.bassjssj)
	         var nodes=eval(data);
	        var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh);
	         var fianl=xx.bassechatsList;
	         var rs = [];
	          var ssbm = [];
	          var ssmc = [];
	         for (var i=0;i<fianl.length;i++)
	               {   
	        	 rs.push(fianl[i].rs);
	        	 ssbm.push(fianl[i].ssbm);
	        	 ssmc.push(fianl[i].ssmc);
	               }
	           
	           bass01(rs,ssbm,ssmc,basskssj,bassjssj,bassjgdm);
	        }
	        });
}
	 function bass01(rs,ssbm,ssmc,basskssj,bassjssj,bassjgdm){
 
		  var myChart = echarts.init(document.getElementById('bass'));
			    option = {
						color:[   '#b8860b', '#32cd32' ], 
					title: {
					        text: '住院疾病手术人次',
					        textStyle: {
					        	fontSize: 16
					        	}
					    },
				   tooltip: {
			            show: true,
			            trigger: 'axis',
			    		axisPointer : {                // 坐标轴指示器，坐标轴触发有效
			        		 type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			    		}
			        },
			         
			        legend: {
			            data:['住院疾病手术人次']
			        },
			        grid: {
			            //top: '18%',
			            left: '1%',
			            //right: '10%',
			            containLabel: true
			        },
			        xAxis: {
			            type: 'value',
			            boundaryGap: [0, 0.01]
			        },
			        yAxis: {
			            type: 'category',
			            data: ssmc,
			            axisLabel:{
			      			show:true,
			      			interval:0,
			      			rotate:0
			      		}
			        },
			        series : [
			            {
			                name: '住院疾病手术人次',
			                type: 'bar',
			                //barGap:'10%',
				            //barCategoryGap:'40%',
				            animation: true,
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
			                data: rs
			            }
			        ]
			};
		     myChart.setOption(option);
		     myChart.on('click', function(param) { 
		         
		         
		        window.open("${ctx}/basscx/bassxz?p_kssj="+basskssj
		        		+"&p_jssj="+bassjssj+"&p_jgdm="+bassjgdm
		                +"&p_ssbm="+ssbm[param.dataIndex]);
		       
		         });
		     
		    }	
	  

 
function basygd(){
	var basystartDate= $("#basystartDate").val();
	var basyendDate= $("#basyendDate").val();
	var bajgdm= $("#bajgdm").val();
	
	 window.open("${ctx}/zybasy/zybasy?p_kssj="+basystartDate
     		+"&p_jssj="+basyendDate+"&p_jgdm="+bajgdm
             );
}
function basysearch(){//病案首页查询
	var basystartDate= $("#basystartDate").val();
	var basyendDate= $("#basyendDate").val();
	var bajgdm= $("#bajgdm").val();
	if (basyendDate<basystartDate) {
		alert("查询的 结束日期请大于或等于开始日期");
		return;
	}
	 $.ajax({
	      url: "${ctx}/basycx/basycx.json?p_kssj="+basystartDate+"&p_jssj="+basyendDate
	    		  +"&p_bajgdm="+bajgdm,
	       datatype:"json",
	      context: document.body, 
	      success: function(data){
	    	  $("#basystartDate").val(data.kssj)
	    	   $("#basyendDate").val(data.jssj)
	         var nodes=eval(data);
	        var hh= JSON.stringify(nodes);
	         var xx=JSON.parse(hh);
	         var fianl=xx.basycxechatsList;
	         var rs = [];
	          var jbdm = [];
	          var jbmc = [];
	          var rq  =[];
	         for (var i=0;i<fianl.length;i++)
	               {     
	        	 rs.push(fianl[i].rs);
	        	 jbdm.push(fianl[i].jbdm);
	        	 jbmc.push(fianl[i].jbmc);
	        	  
	        	  
	                 
	               }
	           
	           basy01(rs,jbdm,jbmc,basystartDate,basyendDate,bajgdm);
	        }
	        });
}
	 
	 function basy01(rs,jbdm,jbmc,basystartDate,basyendDate,bajgdm){

	  var myChart = echarts.init(document.getElementById('basy'));
		    option = {
					color:['#989cf3', '#9deb8d', '#7cb5ec', '#f6ae6e', 
						'#adff2f', '#444446', '#799aec', '#61d4e2',
						'#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
				title: {
				        text: '住院疾病发病人次TOP',
				        textStyle: {
				        	fontSize: 16
				        	}
				    },
			   tooltip: {
		            show: true,
		            trigger: 'axis',
		    		axisPointer : {                // 坐标轴指示器，坐标轴触发有效
		        		 type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		    		}
		        },
		         
		        legend: {
		            data:['住院疾病发病人次']
		        },
		        grid: {
		            //top: '18%',
		            left: '1%',
		            //right: '10%',
		            containLabel: true
		        },
		        xAxis: {
		            type: 'value',
		            boundaryGap: [0, 0.01]
		        },
		        yAxis: {
		            type: 'category',
		            data: jbmc,
		            axisLabel:{
		      			show:true,
		      			interval:0,
		      			rotate:0
		      		}
		        },
		        series : [
		            {
		                name: '住院疾病发病人次',
		                type: 'bar',
		                //barGap:'10%',
			            //barCategoryGap:'40%',
			            animation: true,
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
		                data: rs
		            }
		        ]
		};
	     myChart.setOption(option);
	     myChart.on('click', function(param) { 
	          
	        window.open("${ctx}/basycx/basyxz?p_kssj="+basystartDate
	        		+"&p_jssj="+basyendDate+"&p_jbdm="+jbdm[param.dataIndex]
	                +"&p_bajgdm="+bajgdm);
	       
	         });
	     
	    }	 
}
function jtyslb(){ //家庭医生
	if($("#jtyslb").val()=="qyfwb"){
		var qyfwbidList =<%=request.getAttribute("qyfwbidList")%>;
	    var myChart = echarts.init(document.getElementById('qyjgcx'));
	    option = {
	    		color:['#188df0',   
					'#7cb5ec', '#f6ae6e',  '#adff2f', '#444446', 
					'#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
	     title: {  
	    	 text: '家庭医生签约服务包',
	    	 left: 'center'
	    		    },
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	     
	    legend: {
	        // orient: 'vertical',
	        // top: 'middle',
	        bottom: -5,
	        left: 'center',
	        data:''
	    },
	    series: [
	        {
	            name:'',
	            type:'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: false,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'center'
	                },
	                emphasis: {
	                    show: true,
	                    textStyle: {
	                        fontSize: '20',
	                        fontWeight: 'bold'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[
	            	<c:forEach var="jtysFwt" items="${jtysFwbList}">
		            {
		              value:"${jtysFwt.rs}",name :"${jtysFwt.fwbmc}"
		            },
		            </c:forEach>
	            ]
	        }
	    ]
	};
	    myChart.setOption(option);
	    myChart.on('click', function(param) { 
	    	window.open("${ctx}/jtysFwbXz/jtysFwbXz?p_fwbid="+qyfwbidList[param.dataIndex]);
	
	    });
	}else if($("#jtyslb").val()=="qytd"){ 
		var qytdbhList =<%=request.getAttribute("qytdbhList")%>;
	    var myChart = echarts.init(document.getElementById('qyjgcx'));
	    option = {
	    		color:['#188df0',   
					'#7cb5ec', '#f6ae6e',  '#adff2f', '#444446', 
					'#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
	     title: {  
	    	 text: '家庭医生签约团队',
	    	 left: 'center'
	    		    },
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	     
	    legend: {
	        // orient: 'vertical',
	        // top: 'middle',
	        bottom: -5,
	        left: 'center',
	        data:''
	    },
	    series: [
	        {
	            name:'',
	            type:'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: false,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'center'
	                },
	                emphasis: {
	                    show: true,
	                    textStyle: {
	                        fontSize: '20',
	                        fontWeight: 'bold'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[
	            	<c:forEach var="jtystd" items="${jtystdList}">
		            {
		              value:"${jtystd.rs}",name :"${jtystd.tdmc}"
		            },
		            </c:forEach>
	            ]
	        }
	    ]
	};
	    myChart.setOption(option);
	    myChart.on('click', function(param) { 
	    	window.open("${ctx}/jtysTdXzYs/jtysTdXzYs?p_tdbh="+qytdbhList[param.dataIndex]);
	
	    });
	}else if($("#jtyslb").val()=="qyjg"){ 
		var qyjgidList =<%=request.getAttribute("qyjgidList")%>;
	    var myChart = echarts.init(document.getElementById('qyjgcx'));
	    option = {
	    		color:['#188df0',   
					'#7cb5ec', '#f6ae6e',  '#adff2f', '#444446', 
					'#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
	     title: {  
	    	 text: '家庭医生签约机构',
	    	 left: 'center'
	    		    },
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	     
	    legend: {
	        // orient: 'vertical',
	        // top: 'middle',
	        bottom: -5,
	        left: 'center',
	        data:''
	    },
	    series: [
	        {
	            name:'',
	            type:'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: false,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'center'
	                },
	                emphasis: {
	                    show: true,
	                    textStyle: {
	                        fontSize: '20',
	                        fontWeight: 'bold'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[
	            	<c:forEach var="jtysJg" items="${jtysJgList}">
		            {
		              value:"${jtysJg.rs}",name :"${jtysJg.qyjgmc}"
		            },
		            </c:forEach>
	            ]
	        }
	    ]
	};
	    myChart.setOption(option);
	    myChart.on('click', function(param) { 
	    	 
	    	window.open("${ctx}/jtysJgxz/jtysJgxz?p_qyjgid="+qyjgidList[param.dataIndex]);
	    	
	    });
	}
}

function sscx(){//手术按机构分
	 if($("#sscx").val()=="ssjgcx"){
		 $.ajax({
		    	url: "${ctx}/ssjgcx/ssjgcx.json?",
		    	 datatype:"json",
		    	context: document.body, 
		    	success: function(data){
		    		var nodes=eval(data);
		     		var hh= JSON.stringify(nodes);
		     		var xx=JSON.parse(hh);
		    	    var fianl=xx.ssList;
		    	    var $tbl = $("#ssjb");
		    	    $tbl.empty();
		    		 
		    	 for (var i=0;i<fianl.length;i++) { 
		    	     $tbl.append('<tr>' + '<td span style="color: #007799; font-weight: bold;">'
		    	      
		    	     +'<a href="${ctx}/ssJgxzKS/ssJgxzKS?p_yljgdm='+fianl[i].yljgdm+'"  target="_blank">' 
		    	     +fianl[i].yljgmc
		    	     +'</a>'
		    	     +'</td>' 
		    	     + '<td span style="color: #007799; font-weight: bold;">'
		    	     +fianl[i].rs+'</td>' );
	                   } 
		}
	});
	 }else if($("#sscx").val()=="ssjbcx"){//手术按级别分
			 $.ajax({
		    	url: "${ctx}/ssjgcx/ssjbcx.json?",
		    	 datatype:"json",
		    	context: document.body, 
		    	success: function(data){
		    		var nodes=eval(data);
		     		var hh= JSON.stringify(nodes);
		     		var xx=JSON.parse(hh);
		    	    var fianl=xx.ssList;
		    	    var $tbl = $("#ssjb");
		    	    $tbl.empty();
		    	    
		    	 for (var i=0;i<fianl.length;i++){ 
		    		 if((i)%2==0){
		    			 $tbl.append('<tbody> <tr>'); 
		    		 }
		    	     $tbl.append( '<td  nowrap="nowrap" style="width: 94px;">'
		    	      
		    	     +'<a href="${ctx}/ssJbxzJg/ssJbxzJg?p_ssjb='+fianl[i].ssjb+'"  target="_blank">' 
		    	     +'<span style="color: #0088A8; font-weight: bold; font-size: 15px">'
		    	     +fianl[i].ssjbmc
		    	     +'</span>'
		    	     +'</a>'
		    	     +'</td>'  
		    	     + '<td style="width: 60%;">'
		    	     +'<span style="color: #0088A8; font-weight: bold; ">'
		    	     +fianl[i].rs
		    	     +'</span>'
		    	     +'</td>'
		    	    );
		    	     if((i)%2==0){
		    	    	 $tbl.append('</tbody> </tr>');
		    		 }
	               } 
		         	
		    	
		}
	});
	 }
 
}
function cslxcx(){
	 
	if($("#cslxcx").val()=="cszmcx"){
		var cstj='<%=request.getAttribute("csrstj")%>'
		$("#csrs").html(cstj)
		 
		 var xbList =<%=request.getAttribute("xbList")%>; 
		 
		    var myChart = echarts.init(document.getElementById('cstj'));
		 
		 
		    option = {
		    		color:[ '#7cb5ec', '#f6ae6e', '#66FFFF',
						'#adff2f', '#444446', '#799aec', '#61d4e2',
						'#6b8e23', '#87ceeb', '#32cd32' ], 
		          tooltip: {
		              trigger: 'item',
		              formatter: "{a} <br/>{b}: {c} ({d}%)"
		          },
		          legend: {
		              orient: 'vertical',
		              x: 'left',
		              data:[<c:forEach var="csrsList" items="${csrsList}">
		                {
		                    name  :"${csrsList.yylxmc}" 
		                  },
		                  </c:forEach>]
		          },
		          series: [
		              {
		                  name:'访问来源',
		                  type:'pie',
		                  radius: ['50%', '70%'],
		                  avoidLabelOverlap: false,
		                  label: {
		                      normal: {
		                          show: false,
		                          position: 'center'
		                      },
		                      emphasis: {
		                          show: true,
		                          textStyle: {
		                              fontSize: '30',
		                              fontWeight: 'bold'
		                          }
		                      }
		                  },
		                  labelLine: {
		                      normal: {
		                          show: false
		                      }
		                  },
		                  data:[
		                    <c:forEach var="csrsList" items="${csrsList}">
		                      {
		                        name  :"${csrsList.yylxmc}",value:"${csrsList.csrs}"
		                      },
		                      </c:forEach>
		                  ]
		              }
		          ]
		};
		    myChart.setOption(option);
		    myChart.on('click', function(param) { 
		       
		    	window.open("${ctx}/csrsXzjg/csrsXzjg?p_yylx="+yylxList[param.dataIndex]);
		       
		    });
	}else if($("#cslxcx").val()=="fmjlcx"){
		    var fmcstj='<%=request.getAttribute("fmcsrstj")%>'
			$("#csrs").html(fmcstj)
		  var hjbzList =<%=request.getAttribute("hjbzList")%>;
		 
			 var myChart = echarts.init(document.getElementById('cstj'));
			var option = { 

		    		color:[  '#66FFFF',
						'#adff2f', '#444446', '#799aec', '#61d4e2',
						'#6b8e23', '#87ceeb', '#32cd32' ], 
		          tooltip: {
		              trigger: 'item',
		              formatter: "{a} <br/>{b}: {c} ({d}%)"
		          },
		          legend: {
		              orient: 'vertical',
		              x: 'left',
		              data:[<c:forEach var="fmrsList" items="${fmrsList}">
		                {
		                    name  :"${fmrsList.hjbzmc}" 
		                  },
		                  </c:forEach>]
		          },
		          series: [
		              {
		                  name:'访问来源',
		                  type:'pie',
		                  radius: ['50%', '70%'],
		                  avoidLabelOverlap: false,
		                  label: {
		                      normal: {
		                          show: false,
		                          position: 'center'
		                      },
		                      emphasis: {
		                          show: true,
		                          textStyle: {
		                              fontSize: '30',
		                              fontWeight: 'bold'
		                          }
		                      }
		                  },
		                  labelLine: {
		                      normal: {
		                          show: false
		                      }
		                  },
		                  data:[
		                    <c:forEach var="fmrsList" items="${fmrsList}">
		                      {
		                        name  :"${fmrsList.hjbzmc}",value:"${fmrsList.csrs}"
		                      },
		                      </c:forEach>
		                  ]
		              }
		          ]
				};
		  myChart.setOption(option);
		  myChart.on('click', function(param) { 
		window.open("${ctx}/fmxz/fmxzJg?p_hjbz="+hjbzList[param.dataIndex]);
			
				});
		
	}
}
function rylb(){
	 var vs = $('select  option:selected').val();
	 if(vs=="zc"){ 
		 var GrsList =<%=request.getAttribute("GrsList")%>;
		var LxList =<%=request.getAttribute("LxList")%>;
		var Lx2List =<%=request.getAttribute("Lx2List")%>;
		var CrsList =<%=request.getAttribute("CrsList")%>;
		var ZrsList =<%=request.getAttribute("ZrsList")%>;
		var myChart = echarts.init(document.getElementById('main22'));
	    var option = {
	    		color:['#188df0',  
					'#00DD00',   '#61d4e2' 
					  ],
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data:['高级职称','中级职称','初级职称']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : LxList,
		            name :'职称',
		            
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
		            name:'高级职称',
		            type:'bar',
		            data:GrsList,
		            
		        },
		        {
		            name:'中级职称',
		            type:'bar',
		            data:ZrsList
		        },
		        {
		            name:'初级职称',
		            type:'bar',
		            data:CrsList
		        } 
		    ]
				
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) { 
	window.open("${ctx}/ryxz/ryxzjg?p_jb="+param.seriesName+"&p_zc="+Lx2List[param.dataIndex]);
		
			});
	  } else if(vs=="xl"){
		  var XllxList =<%=request.getAttribute("XllxList")%>;
			var XlrsList =<%=request.getAttribute("XlrsList")%>;
			 
			var myChart = echarts.init(document.getElementById('main22'));
			var option = {
					color:['#188df0','#FF3EFF','#009FCC', '#DD228F', 
						'#7cb5ec', '#f6ae6e',  '#adff2f', '#444446', 
						'#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
					tooltip : {
		        		trigger: 'axis',
		        		axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            	type : 'shadow',        // 默认为直线，可选为：'line' | 'shadow'
		            	formatter: '{b}<br/>{c}'
		        		}
		   			},
		   			color:['#60C0DD'],
		   			legend: {
		   	            data: ["学历统计"]
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
				        data: XllxList
				    },
				    yAxis: {
				    	type:'value',
				    	name:'人数(人)'
				    },
				    series: [{
				    	name:"学历统计",
				        type: 'bar',
				        barWidth:60,
				        data: XlrsList
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
		window.open("${ctx}/ryxz/ryxzjg?p_jb="+param.seriesName+"&p_zc="+Lx2List[param.dataIndex]);
			
				});
	 }else{

		  var GrsList =<%=request.getAttribute("GrsList")%>;
			var LxList =<%=request.getAttribute("LxList")%>;
			var Lx2List =<%=request.getAttribute("Lx2List")%>;
			var CrsList =<%=request.getAttribute("CrsList")%>;
			var ZrsList =<%=request.getAttribute("ZrsList")%>;
			var myChart = echarts.init(document.getElementById('main22'));
		    var option = {
		    		color:['#188df0',  
						'#00BBFF',   '#61d4e2' 
						  ],
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    legend: {
			        data:['高级职称','中级职称','初级职称']
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis : [
			        {
			            type : 'category',
			            data : LxList,
			            name :'职称',
			            
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
			            name:'高级职称',
			            type:'bar',
			            data:GrsList,
			            
			        },
			        {
			            name:'中级职称',
			            type:'bar',
			            data:ZrsList
			        },
			        {
			            name:'初级职称',
			            type:'bar',
			            data:CrsList
			        } 
			    ]
					
			};
		  myChart.setOption(option);
		  myChart.on('click', function(param) { 
		window.open("${ctx}/ryxz/ryxzjg?p_jb="+param.seriesName+"&p_zc="+Lx2List[param.dataIndex]);
			
				});
	 }
	 
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
           
            table.render({
               
                url: '${ctx}/xqtj/xqtj',
                method:'post',
                where:{p_startdate:$("#startdate").val(),p_enddate:$("#enddate").val()}          
               
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
function getData1() { 
	var ywkssjs=$("#ywkssj").val();
	var ywjssjs=$("#ywjssj").val(); 
	if (ywjssjs<ywkssjs) {
		alert("结束日期请大于或等于开始日期");
		return;
	}
	var myDate=new Date() 
	var month=myDate.getMonth()+1;
	var year=myDate.getFullYear(); 
	if (month<10) { month = "0" + month; }
	if(ywkssjs==""||ywkssjs==null||ywkssjs=='undefined'){ 
		var ywkssj=myDate.Format('yyyy-MM-dd');
	}else{ 
		var ywkssj=ywkssjs; 
	}
	if(ywjssjs==""||ywjssjs==null||ywjssjs=='undefined'){
		var ywjssj=myDate.Format('yyyy-MM-dd');  
	}else{ 
		var ywjssj=ywjssjs; 
	}
	 
	 $("#ywkssj").val(ywkssj)
	   $("#ywjssj").val(ywjssj)
	layui.use([ 'table', 'layer' ], function() { 
		var table = layui.table;
		table
				.render({
					elem : '#querytable1',
					url : '${ctx}/xqtj/ssywzs',
				//	toolbar : '#toolbarDemo',
					method : 'post', 
					 
					 where:{p_ywkssj:ywkssj,p_ywjssj:ywjssj},          
					cols : [ [  
					{ field : 'jglb', title : '<span style="color:#4682B4">医院类型</span>', width : '11%',templet: '#classStatus' }, 
					{ field : 'sj', title : '<span style="color:#4682B4">业务时间</span>', width : '13%' },
					{ field : 'mzrs', title : '<span style="color:#4682B4">门诊人数</span>', width : '11%' },
					{ field : 'jzrs', title : '<span style="color:#4682B4">急诊人数</span>', width : '11%' }, 
					{ field : 'zyrs', title : '<span style="color:#4682B4">在院人数</span>', width : '11%' },
					{ field : 'ryrs', title : '<span style="color:#4682B4">入院人数</span>', width : '11%' }, 
					{ field : 'cyrs', title : '<span style="color:#4682B4">出院人数</span>', width : '11%' }, 
					{ field : 'mzfy', title : '<span style="color:#4682B4">门诊费用</span>', width : '11%' },
					{ field : 'zyfy', title : '<span style="color:#4682B4">住院费用</span>', width : '11%' }
					
					] ],
					height : '200',
					done: function(res, curr, count){                	
	                	  
						getSsywjcechats();
	                }
									
				});

	});
	 
}
function getSsywjcechats(){
    $.ajax({
    	url: "${ctx}/ssywjc/getSsywjcechats.json?",
    	 datatype:"json",
    	context: document.body, 
    	success: function(data){
    		 var nodes=eval(data);
    		var hh= JSON.stringify(nodes);
    		 var xx=JSON.parse(hh);
    		 var fianl=xx.ssywjcechatsList;
    		 var categories = [];
    		var data1 = [];
    		var data2 = [];
    		var data3=[];
    		 for (var i=0;i<fianl.length;i++)
		         	{   
    			        
		         		
		         		categories.push(fianl[i].rq);
						data1.push(fianl[i].mzrs);
						data2.push(fianl[i].ryrs);
						data3.push(fianl[i].cyrs);
		         		
		         	}
         	
         	chart01('map2',categories,data1,data2,data3);
    		}
      	});
	}
	
	
function chart01(id,categories,data1,data2,data3){
	 
	var myChart=echarts.init(document.getElementById(id));
	
	var option = { 
			color:['#188df0','#FF3EFF',
				  '#f6ae6e',  '#adff2f', '#444446', 
				'#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
	  
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['门诊人数','入院人数','出院人数']
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
	        data: categories
	    },
	    yAxis: {
	        type: 'value',
	        name :'人数'
	    },
	    dataZoom: [
					{
					    type: 'slider',
					    show: true,
					    start: 20,
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
		               name: '门诊人数',
		               type: 'line',
		               smooth: true,
		               data: data1
		           },
		           {
				        name: '入院人数',
				        type: 'line',
				        smooth: true,
				        data: data2
				    },
				    {
				        name: '出院人数',
				        type: 'line',
				        smooth: true,
				        data: data3
				    }
	    ]
	};
	  myChart.setOption(option);
	  myChart.on('click', function(param) { 
		    
		  if(param.seriesIndex==0){//实时业务数据监测门诊人数下钻
			  window.open("${ctx}/ssywjcMzrsXz/ssywjcMzrsXz?p_rq="+param.name
			   );
		  }else if(param.seriesIndex==1){//实时业务数据监测入院人数下钻
			  window.open("${ctx}/ssywjc/ssywjcRyrsXz?p_rq="+param.name 
					  );  
		  }else if(param.seriesIndex==2){//实时业务数据监测出院人数下钻
			  window.open("${ctx}/ssywjcCyrsXz/ssywjcCyrsXz?p_rq="+param.name
			   );
		  }
		  
			
				});
	  
	 }
    
	$(document).ready(function(){
		bassxx();
		getData();
		getData1();
		getCwzy();
		getYjcl();
		basysearch();
		
		
	});
	 
	function getCwzy() {
		  layui.use([ 'table', 'layer' ], function() {
		    var table = layui.table;
		    table
		        .render({
		          elem : '#querytable2',
		          url : '${ctx}/cwtj/cwtj',
		        //  toolbar : '#toolbarDemo',
		          method : 'post', 
		          cols : [ [  
		          { field : 'lxmc', title : '<span style="color:#4682B4">医院类型</span>', width : '20%',templet: '#cwyylx' }, 
		          { field : 'hdcws', title : '<span style="color:#4682B4">核定床位数</span>', width : '20%' },
		          { field : 'kfcws', title : '<span style="color:#4682B4">开放床位数</span>', width : '20%' }, 
		          { field : 'dqsycws', title : '<span style="color:#4682B4">当前使用数</span>', width : '20%' },
		          { field : 'sycws', title : '<span style="color:#4682B4">剩余数</span>', width : '20%' }, 
		          { field : 'cwsyl', title : '<span style="color:#4682B4">床位使用率</span>', width : '20%' } 
		          ] ],
		          height : '200',
		          done: function(res, curr, count){                  
		                      
		           
		                  }
		                  
		        });

		  });
		   
		}
	function getYjcl() {
		  layui.use([ 'table', 'layer' ], function() {
		    var table = layui.table;
		    table
		        .render({
		          elem : '#querytable3',
		          url : '${ctx}/yjcl/yjcl',
		        //  toolbar : '#toolbarDemo',
		          method : 'post', 
		          cols : [ [  
		          { field : 'yljgmc', title : '<span style="color:#4682B4">医院名称</span>', width : '33%',templet: '#yjjgdm' }, 
		          { field : 'dyccl', title : '<span style="color:#4682B4">当月出车量</span>', width : '33%' },
		          { field : 'ccpjxjsj', title : '<span style="color:#4682B4">平均响应时间(分)</span>', width : '33%' } 
		          ] ],
		          height : '200',
		          done: function(res, curr, count){                  
		                      
		           
		                  }
		                  
		        });

		  });
		   
		}
	function searchjc() {
		 window.location.href="${ctx}/xqtj/xqtj?p_startdate="+$("#startdate").val()
		+"&p_enddate="+$("#enddate").val()+"p_ywlx=jcyy"
		 
   }
	function searchzh() {
		 window.location.href="${ctx}/xqtj/xqtj?p_startdate="+$("#startdate").val()
		+"&p_enddate="+$("#enddate").val()+"&p_ywlx=zhyy"
		 
  }


 
	 
</script>
</head>
<body style="background: #F9F9F9; overflow: scroll;">
	<div class="layui-tab">
		<ul class="layui-nav">
			<li class="layui-nav-item"><a href="javascript:;">急救患者分析</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="${ctx}/jjhznlfx/jjhznlfx" target="_blank"> 年龄分析</a>
					</dd>
					<dd>
						<a href="${ctx}/jjhzjbfx/jjhzjbfx" target="_blank">级别分析</a>
					</dd>
					<dd>
						<a href="${ctx}/jjhzzdbfx/jjhzzdbfx" target="_blank">字典项分析</a>
					</dd>
				</dl>
		   </li> 	   
		   <li class="layui-nav-item"><a href="javascript:;">公卫数据分析</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="${ctx}/gxysjfx/gxysjfx?p_yljgdm=" target="_blank">高血压分析</a>
					</dd>
					<dd>
						<a href="${ctx}/lnrtjfx/lnrtjfx?p_yljgdm=" target="_blank">531分析</a>
					</dd> 
					<dd>
						<a href="${ctx}/jkdagx/jkdagx?p_yljgdm=" target="_blank">健康档案更新分析</a>
					</dd> 
				</dl>
		   </li>

			<li class="layui-nav-item"><a href="javascript:;">公卫项目指标统计</a>
				<dl class="layui-nav-child">
					<dd><!-- 城乡居民健康档案管理统计报表 -->
						<a href="${ctx}/gwdazb/gwdazb?p_yljgdm=" target="_blank">城乡居民健康档案管理统计报表</a>
						<!-- 高血压患者健康管理报表 -->
						<a href="${ctx}/gwgxyglbb/gwgxyglbb?p_yljgdm=" target="_blank">高血压患者健康管理报表</a>
						<!-- 2型糖尿病患者健康管理报表 -->
						<a href="${ctx}/gwtnbglbb/gwtnbglbb?p_yljgdm=" target="_blank">2型糖尿病患者健康管理报表 </a>
					    <!-- 0-6岁儿童健康管理报表 -->
					    <a href="${ctx}/gwetjkglbb/gwetjkglbb?p_yljgdm=" target="_blank">0-6岁儿童健康管理报表</a>
					</dd> 
				</dl>
		   </li>

			<li class="layui-nav-item">
			     <a href="${ctx}/mrsjqk/mrsjqk" target="_blank">每日数据情况</a>
		   </li>
		</ul>
	</div>

	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>

				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">注册开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"
								autocomplete="off" class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">注册结束时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<div class="layui-tab">
		<ul class="layui-tab-title">
			<li onclick="searchzh()">综合医院</li>
			<li class="layui-this" onclick="searchjc()">基层医院</li>
		</ul>
	</div>
	<div id="zcd">
		<span style="color: #00AAAA; font-weight: bold;"><%=request.getAttribute("xsnr")%></span>
	</div>
	<div style="margin-left: 20px; margin-top: 0px;">
		<table>
			<tr>
				<td>
					<div id="main" style="width: 840px; height: 300px;"></div>
		<script  type="text/javascript">	
		var pidList =<%=request.getAttribute("pidList")%>;
		var pidList2 =<%=request.getAttribute("pidList2")%>;
		var myChart = echarts.init(document.getElementById('main'));
	    var option = { 
			color:['#188df0', '#7cb5ec', '#f6ae6e', '#66FFFF',
				'#adff2f', '#444446', '#799aec', '#61d4e2',
				'#6b8e23', '#87ceeb', '#32cd32' ],
			tooltip: {
		        trigger: 'item',
		        formatter: "{a} <br/>{b}: {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        x: 'left',
		        data:[
		        	
		        	<c:forEach var="tbList2" items="${tbList2}">
		            {
		              value:"${tbList2.rs}",name :"${tbList2.id_name}"
		            },
		            </c:forEach>
		        ]
		    },
		    series: [
		        {
		            name:'访问来源',
		            type:'pie',
		            selectedMode: 'single',
		            radius: [0, '30%'],

		            label: {
		                normal: {
		                    position: 'inner'
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		            	
		            	<c:forEach var="tbList" items="${tbList}">
						{
							name  :"${tbList.jcfl}",value:"${tbList.rs}"
						},
						</c:forEach>  
		              
		            ]
		        },
		        {
		            name:'',
		            type:'pie',
		            radius: ['40%', '55%'],
		            label: {
		                normal: {
		                    formatter: '共{c}家   \n 占比:{d}% \n{b}  ',
		                    backgroundColor: '#eee',
		                    borderColor: '#aaa',
		                    borderWidth: 1,
		                    borderRadius: 4,
		                    // shadowBlur:3,
		                    // shadowOffsetX: 2,
		                    // shadowOffsetY: 2,
		                    // shadowColor: '#999',
		                    // padding: [0, 7],
		                    rich: {
		                        a: {
		                            color: '#999',
		                            lineHeight: 22,
		                            align: 'center'
		                        }, 
		                        hr: {
		                            borderColor: '#aaa',
		                            width: '100%',
		                            borderWidth: 0.5,
		                            height: 0
		                        },
		                        b: {
		                            fontSize: 16,
		                            lineHeight: 33
		                        },
		                        per: {
		                            color: '#eee',
		                            backgroundColor: '#334455',
		                            padding: [2, 4],
		                            borderRadius: 2
		                        }
		                    }
		                }
		            },
		            data:[
		            	<c:forEach var="tbList2" items="${tbList2}">
			            {
			              value:"${tbList2.rs}",name :"${tbList2.id_name}"
			            },
			            </c:forEach>
		            ]
		        }
		    ]
		};
	  myChart.setOption(option);
	  myChart.on('click', function(params) { 
		
		 if(params.seriesIndex==0){
			   
			 window.open("${ctx}/xqtj/xqtj2?p_pid="+pidList[params.dataIndex]);
	
		  } else  if(params.seriesIndex==1){
			   
			  window.open("${ctx}/xqtj/xqtj3?p_pid="+pidList2[params.dataIndex]);
		  }  
			});
 
 </script>
				</td>
				<td>
					<div>

						<div>
							<select id="rylb" name="rylb" onchange="rylb()">

								<c:forEach items="${rylbList}" var="rylb">
									<option value="${rylb.lbdm}">${rylb.lbmc}</option>
								</c:forEach>
							</select>
						</div>
					</div>


					<div id="main22" style="width: 450px; height: 300px;"></div> <script
						type="text/javascript">		
		var GrsList =<%=request.getAttribute("GrsList")%>;
		var LxList =<%=request.getAttribute("LxList")%>;
		var Lx2List =<%=request.getAttribute("Lx2List")%>;
		var CrsList =<%=request.getAttribute("CrsList")%>;
		var ZrsList =<%=request.getAttribute("ZrsList")%>;
		var myChart = echarts.init(document.getElementById('main22'));
	    var option = {
	    		color:['#188df0',  
					'#00DD00',   '#61d4e2' 
					  ],
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data:['高级职称','中级职称','初级职称']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : LxList,
		            name :'职称',
		            
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
		            name:'高级职称',
		            type:'bar',
		            data:GrsList,
		            
		        },
		        {
		            name:'中级职称',
		            type:'bar',
		            data:ZrsList
		        },
		        {
		            name:'初级职称',
		            type:'bar',
		            data:CrsList
		        } 
		    ]
				
		};
	  myChart.setOption(option);
	  myChart.on('click', function(param) { 
	window.open("${ctx}/ryxz/ryxzjg?p_jb="+param.seriesName+"&p_zc="+Lx2List[param.dataIndex]);
		
			});
 </script>
				</td>
			</tr>
		</table>
	</div>
	<div style="width: 55%; height: 35%; margin-left: 10px; margin-top: 50px">
		<div>
			<h4>
				<span style="color: #003C9D; font-weight: bold;">急救资源统计(当月)</span>
			</h4>
		</div>
		<div style="margin-top: 90px;">
			<img src="<c:url value="/static/commons/images/jhc.png"/>">
		</div>
		<div id="yjcl">
			<span style="color: #00AAAA; font-weight: bold;"> <%=request.getAttribute("yjcl")%>
			</span>
		</div>
		<div id="yjcltable">
			<table id="querytable3"></table>
		</div>
	</div>






	<div
		style="height: 5%; width: 25%; position: absolute; margin-top: -220px; margin-left: 990px";>
		<div
			style="width: 45%; height: 30%; margin-left: 0px; margin-top: 0px">
			<h4>
				<spanstyle="color: #003C9D; font-weight: bold;">出生人数统计(本年)</span>
			</h4>
		</div>
		<div style="font-size: 19px; margin-top: 20px; margin-left: 10px;">
			<span  id="csrs"  style="color: #00AAAA; font-weight: bold;"> <%=request.getAttribute("csrstj")%>
			</span>
		</div>
		<div style="position: absolute;margin-left: 157px;margin-top: -58px;">
			<select id="cslxcx" name="cslxcx" onchange="cslxcx()">
				<c:forEach items="${csrscxlbList}" var="cslxcx">
					<option value="${cslxcx.lbdm}">${cslxcx.lbmc}</option>
				</c:forEach>
			</select>
		</div>
 	<div id="cstj" style="width: 280px; height: 180px; "></div> 
		<script  type="text/javascript">    
		var yylxList =<%=request.getAttribute("yylxList")%>; 
    var myChart = echarts.init(document.getElementById('cstj'));
 
 
    option = {
    		color:[ '#7cb5ec', '#f6ae6e', '#66FFFF',
				'#adff2f', '#444446', '#799aec', '#61d4e2',
				'#6b8e23', '#87ceeb', '#32cd32' ], 
    	    tooltip: {
    	        trigger: 'item',
    	        formatter: "{a} <br/>{b}: {c} ({d}%)"
    	    },
    	    legend: {
    	        orient: 'vertical',
    	        x: 'left',
    	        data:[<c:forEach var="csrsList" items="${csrsList}">
                {
	                  name  :"${csrsList.yylxmc}" 
	                },
	                </c:forEach>]
    	    },
    	    series: [
    	        {
    	            name:'访问来源',
    	            type:'pie',
    	            radius: ['50%', '70%'],
    	            avoidLabelOverlap: false,
    	            label: {
    	                normal: {
    	                    show: false,
    	                    position: 'center'
    	                },
    	                emphasis: {
    	                    show: true,
    	                    textStyle: {
    	                        fontSize: '30',
    	                        fontWeight: 'bold'
    	                    }
    	                }
    	            },
    	            labelLine: {
    	                normal: {
    	                    show: false
    	                }
    	            },
    	            data:[
    	            	<c:forEach var="csrsList" items="${csrsList}">
    	                {
    	                  name  :"${csrsList.yylxmc}",value:"${csrsList.csrs}"
    	                },
    	                </c:forEach>
    	            ]
    	        }
    	    ]
};
    myChart.setOption(option);
    myChart.on('click', function(param) { 
    	  
    	window.open("${ctx}/csrsXzjg/csrsXzjg?p_yylx="+yylxList[param.dataIndex]);
    	 
    });
   
 </script>
	</div>
 	<div style="height: 20%";>
		<div
			style="width: 25%; height: 30%; margin-left: 20px; margin-top: 52px">
			<h4>
				<span style="color: #003C9D; font-weight: bold;">区域床位资源(当天)</span>
			</h4>
		</div>
		 <div style="position: absolute;margin-top: -80px"> 
			<table id="querytable2"></table>
		</div> 
		<div id="cwecharts" style="width: 280px; height: 180px; margin-left: 1000px;
    margin-top: -26px;"></div> 
		<script  type="text/javascript">    
		 var idList =<%=request.getAttribute("idList")%>; 
    var myChart = echarts.init(document.getElementById('cwecharts'));
   //床位饼形图 代码在 yqjgzsController
 
    option = {
    		color:['#188df0',   
				'#7cb5ec', '#f6ae6e',  '#adff2f', '#444446', 
				'#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ], 
     title: {  
    	 text: '床位统计',
    	 left: 'center'
    		    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
     
    legend: {
    	
    	   orient: 'vertical',
           x: 'left',
        data:[ <c:forEach var="cwList" items="${cwList}">
        {
            name  :"${cwList.lxmc}" 
          },
          </c:forEach>]
    },
    series: [
        {
            name:'访问来源',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '20',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                 
            	<c:forEach var="cwList" items="${cwList}">
                {
                  name  :"${cwList.lxmc}",value:"${cwList.hdcws}"
                },
                </c:forEach>
            ]
        },
        {
            name:'',
            type:'pie',
            radius: ['50%', '55%'],
            label: {
                normal: {
                    formatter: '{b}\n共{c}条   \n 占比:{d}% ',
                     
                }
            },
            data:[
            	<c:forEach var="cwList" items="${cwList}">
	            {
	              value:"${cwList.hdcws}",name :"${cwList.lxmc}"
	            },
	            </c:forEach>
            ]
        }
    ]
};
    myChart.setOption(option);
    myChart.on('click', function(param) { 
    	window.open("${ctx}/cwtj/cwtjXzJg?p_id="+idList[param.dataIndex]);
    	 
    });
   
 </script>


	</div>
	<div style="position: absolute; width: 50%; height: 30%; margin-left: 10px; margin-top: 70px">
		<div>
			<h4>
				<span style="color: #003C9D; font-weight: bold;">家庭医生签约(当月)</span>
			</h4>
		</div>
		<div style="margin-top: 63px;">
			<img src="<c:url value="/static/commons/images/jtys.png"/>">
		</div>
		<div style="margin-top: -195px; margin-left: 134px;">
			<span style="font-weight: bold; font-size: 15px;"><%=request.getAttribute("jtystj")%></span>
		</div>
		<div style="position: absolute;margin-top: -45px;margin-left: 170px;">
			<select id="jtyslb" name="jtyslb" onchange="jtyslb()">
                <c:forEach items="${jtyslbList}" var="jtyslb">
					<option value="${jtyslb.lbdm}">${jtyslb.lbmc}</option>
				</c:forEach>
			</select>
		</div>
		<div style="margin-top: -79px; margin-left: 113px;">
			<table class="table quick-detail" id="jtystj"> 
			</table>
			
			<div id="qyjgcx" style="width: 300px; height: 200px;"></div> 
			<script
            type="text/javascript">    
	var qyjgidList =<%=request.getAttribute("qyjgidList")%>;
    var myChart = echarts.init(document.getElementById('qyjgcx'));
    option = {
    		color:['#188df0',   
				'#7cb5ec', '#f6ae6e',  '#adff2f', '#444446', 
				'#799aec', '#61d4e2', '#6b8e23', '#87ceeb', '#b8860b', '#32cd32' ],
     title: {  
    	 text: '家庭医生签约机构',
    	 left: 'center'
    		    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
     
    legend: {
        // orient: 'vertical',
        // top: 'middle',
        bottom: -5,
        left: 'center',
        data:''
    },
    series: [
        {
            name:'',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '20',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
            	<c:forEach var="jtysJg" items="${jtysJgList}">
	            {
	              value:"${jtysJg.rs}",name :"${jtysJg.qyjgmc}"
	            },
	            </c:forEach>
            ]
        }
    ]
};
    myChart.setOption(option);
    myChart.on('click', function(param) { 
    	 window.open("${ctx}/jtysJgxz/jtysJgxz?p_qyjgid="+qyjgidList[param.dataIndex]);
    });
   
 </script>
		</div>
	</div>

	<div style="position: absolute;width: 25%; height: 30%; margin-left: 653px; margin-top: 140px">
	<div id="jyecharts" style="width: 300px; height: 200px;    margin-left: -79px;"></div> 
	<script type="text/javascript">    <!-- 外送检验样本量 -->
	var sfwsList =<%=request.getAttribute("sfwsList")%>;
    var myChart = echarts.init(document.getElementById('jyecharts'));
    option = {
     color:['#188df0',  '#6b8e23',],
     title: {  
    	 text: '外送检验样本量(本年)',
    	 left: 'center'
    		    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    
    legend: {
        
        
        bottom: -5,
        left: 'center',
        data:[
        	<c:forEach var="jyList" items="${jyList}">
		{
			name  :"${jyList.lbmc}" ,icon: 'circle'
		},
		</c:forEach>   ]
    },
   
    series: [
        {
            name:'',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '20',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
            	<c:forEach var="jyList" items="${jyList}">
                {
                  name  :"${jyList.lbmc}",value:"${jyList.rs}"
                },
                </c:forEach>  
                
            ]
        } ,
        {
            name:'',
            type:'pie',
            radius: ['50%', '55%'],
            label: {
                normal: {
                    formatter: '{b}\n共{c}条   \n 占比:{d}% ',
                     
                }
            },
            data:[
            	<c:forEach var="jyList" items="${jyList}">
	            {
	              value:"${jyList.rs}",name :"${jyList.lbmc}"
	            },
	            </c:forEach>
            ]
        }
    ]
};
    myChart.setOption(option);
    myChart.on('click', function(param) { 
    	window.open("${ctx}/JyXzJg/JyXzJg?p_sfws="+sfwsList[param.dataIndex]);
    	
    });
 </script>
  <!--影像远程诊断量  -->
	
	<div id="jcecharts" style="width: 300px;    margin-top: -200px;margin-left: 341px; height: 200px;"></div>
	 <script type="text/javascript">    
    
    var myChart = echarts.init(document.getElementById('jcecharts'));
    option = {
     color:[ '#188df0','#f6ae6e' ],
     title: {  
    	 text: '影像远程诊断量',
    	 left: 'center'
    		    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
     
    legend: {
        // orient: 'vertical',
        // top: 'middle',
        bottom: -5,
        left: 'center',
        data:[ '视频广告','搜索引擎']
    },
    series: [
        {
            name:'',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '20',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                 
                {value:135, name:'视频广告'},
                {value:1548, name:'搜索引擎'}
            ]
        }
    ]
};
    myChart.setOption(option);   
 </script> 
	</div>

	
	<div style="width: 60%; margin-top: 400px">
		<div style="margin-left: 18px;">
			<h4>
				<span style="color: #003C9D; font-weight: bold;">实时业务监测</span>
			</h4>
		</div>
		<div  style="position: absolute;margin-left: 18px;margin-top: 49px;">
		<table style="width: 100%">
				<tr>
					<td style="width: 25%"><span class="canter" >开始时间：</span> <input type="text"
						id="ywkssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${ywkssj }"
						class="Wdate" style="width: 100px" /> 
					</td>
 					<td style="width: 25%"><span class="canter">结束时间：</span> <input type="text"
						id="ywjssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${ywjssj }'
						class="Wdate" style="width: 100px" />
					</td>
					 
   					<td>
						 
							<div  style="margin-left: 18px">
								<button onclick="getData1();">查询</button>
							</div>
						 
					</td>
					
				</tr>
			</table>
			</div>
		<div style="margin-top: 36px;">
			<table id="querytable1"></table>
		</div>
		<div id="map2"></div>
	</div>
	
	



	<div>
	<!-- 病案首页 -->
	<div style="width: 30%; margin-top: 65px;margin-left:430px;">
		<div >
			<h4>
				<span style="color: #003C9D; font-weight: bold;">住院病案病种查询</span>
			</h4>
		</div>
		<div     style="margin-left: 14px;margin-top: 70px;">
		<table style="width: 100%">
				<tr>
					<td style="width: 25%"><span class="canter" >病案开始时间：</span> <input type="text"
						id="basystartDate" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${kssj }"
						class="Wdate" style="width: 100px" />
					</td>
 					<td style="width: 25%"><span class="canter">病案结束时间：</span> <input type="text"
						id="basyendDate" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${jssj }"
						class="Wdate" style="width: 100px" />
					</td>
					<td style="width: 20%" >
					<div >
						<label >机构名称</label>
						<div >
							<select id="bajgdm" name="bajgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${bajgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>	
						</div>
					</div>
					
				</td>
   					<td>
						<div >
							<div style="margin-left: 10px;    margin-top: 22px;" >
								<button onclick="basysearch();">查询</button>
							</div>
						</div>
					</td>
					
				</tr>
			</table>
			
		</div>
		<div id="basy" style="position: absolute;width:580px; height: 380px;  margin-top: 10px;  margin-left: -10px;"></div>
	<div  style="cursor: pointer;position: absolute;margin-left: 350px;margin-top: 8px;">
		       <a onclick="basygd()" >more </a>
		 </div>	
	</div>
  <!-- 病案手术 -->
	<div style="margin-top: -89px;">
		<div>
			<h4>
				<span style="color: #003C9D; font-weight: bold;">住院病案手术查询</span>
			</h4>
		</div>
		<div     style="margin-left: 1px;margin-top: 62px;">
		<table style="width:50%">
				<tr>
					<td style="width: 10%"><span class="canter" >开始时间：</span> <input type="text"
						id="basskssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${basskssj }"
						class="Wdate" style="width: 100px" />
					</td>
 					<td style="width: 10%"><span class="canter">结束时间：</span> <input type="text"
						id="bassjssj" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${bassjssj }"
						class="Wdate" style="width: 100px" />
					</td>
					<td style="width: 10%" >
					<div >
						<label >机构名称</label>
						<div >
							<select id="bassjgdm" name="bassjgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${bajgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>	
						</div>
					</div>
					
				</td>
   					<td>
						<div >
							<div style="margin-left: 10px;    margin-top: 22px;" >
								<button onclick="bassxx();">查询</button>
							</div>
						</div>
					</td>
					
				</tr>
			</table> 	
		</div>
		  <div id="bass" style="position: absolute;width:460px; height: 380px; margin-top: 10px; "></div>  
	 <div  style="cursor: pointer;position: absolute;margin-left: 350px;margin-top: 8px;">
		       <a onclick="bassgd()" >more </a>
		 </div>	
	</div>


<!-- 手术 电子病历 -->
	<div style="width: 25%; height: 30%; margin-left: 978px; margin-top: -92px">
		<div>
			<h4>
				<span style="color: #003C9D; font-weight: bold;">区域手术汇总(月)</span>
			</h4>
		</div>
		<div id="sstj">
			<span style="color: #008888; font-weight: bold;"><%=request.getAttribute("sstj")%></span>
		</div>
		<div style="position: absolute;margin-left: 157px;margin-top: -72px;">
			<select id="sscx" name="sscx" onchange="sscx()">
				<c:forEach items="${sscxList}" var="sscx">
					<option value="${sscx.lbdm}">${sscx.lbmc}</option>
				</c:forEach>
			</select>
		</div>
		<div style="margin-top: -83px">
			<table class="table quick-detail" id="ssjb">
				<tbody>
					<tr>
						<c:forEach items="${ssList }" var="ssList" varStatus="status">
							<td nowrap="nowrap" style="width: 94px;"> 
							 <span style="color: #007799; font-weight: bold;"> <a
									href="${ctx}/ssJbxzJg/ssJbxzJg?p_ssjb=${ssList.ssjb }"
									target="_blank"> ${ssList.ssjbmc }:</a>
							</span></td>
							<td style="width: 60%;">
								<div title="${ssList.rs}">
									<span style="color: #007799; font-weight: bold;">${ssList.rs}</span>
								</div>
							</td>
							<c:if test="${status.count % 2 == 0}">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
		<!-- 建档 -->
	<div style="position: absolute;height: 10%; width: 30%;  margin-top:  33px; margin-left: 976px";>
		<div
			style="width: 80%; height: 30%; margin-left: 0px; margin-top: 0px">
			<h4>
				<span style="color: #003C9D; font-weight: bold;"> 
				<a href="${ctx}/jdTjxx/jdTjxx" target="_blank">
				<%=request.getAttribute("jdtjrs")%>
				</a>
				</span>
			</h4>
		</div>
		<div style="font-size: 19px; margin-top: 20px; margin-left: 50px;">
			</div>
 	<div id="jdtj" style="width: 400px; height: 200px; "></div> 
		<script  type="text/javascript">   
    var myChart = echarts.init(document.getElementById('jdtj'));
    var jdlxList =<%=request.getAttribute("jdlxList")%>;
    
    option = {
    		color:[ '#7cb5ec', '#f6ae6e', '#66FFFF',
				'#adff2f', '#444446', '#799aec', '#61d4e2',
				'#6b8e23', '#87ceeb', '#32cd32' ], 
          tooltip: {
              trigger: 'item',
              formatter: "{a} <br/>{b}: {c} ({d}%)"
          },
          legend: {
              orient: 'vertical',
              x: 'left',
              data:[
            	  <c:forEach var="jdtjList" items="${jdtjList}"> 
                {
                    name  :"${jdtjList.lxmc}" 
                  },
                  </c:forEach>]
          },
          series: [
              {
                  name:'访问来源',
                  type:'pie',
                  radius: ['50%', '70%'],
                  avoidLabelOverlap: false,
                  label: {
                      normal: {
                          show: false,
                          position: 'center'
                      },
                      emphasis: {
                          show: true,
                          textStyle: {
                              fontSize: '30',
                              fontWeight: 'bold'
                          }
                      }
                  },
                  labelLine: {
                      normal: {
                          show: false
                      }
                  },
                  data:[
                    <c:forEach var="jdtjList" items="${jdtjList}">
                      {
                        name  :"${jdtjList.lxmc}",value:"${jdtjList.rs}"
                      },
                      </c:forEach>
                  ]
              }
          ]
};
    myChart.setOption(option);  
    myChart.on('click', function(param) { 
    	 
    	  window.open("${ctx}/jdTjxx/jdtjXzxx?p_jdlx="+jdlxList[param.dataIndex]);  

    });
 </script>
	</div>
</div>

	<script type="text/html" id="classStatus">
	  <a href="${ctx}/ssywYylx/ssywYylx?p_ids={{d.ids}}&p_ywsj={{d.sj}}" target="_blank" class="layui-table-link" >{{d.jglb}}<a>
	</script>
	<script type="text/html" id="cwyylx">
	  <a href="${ctx}/cwtj/cwtjXzJg?p_id={{d.id}}" target="_blank" class="layui-table-link" >{{d.lxmc}}<a>
	</script>
	<script type="text/html" id="yjjgdm">
	  <a href="${ctx}/yjclXx/yjclXx?p_yljgdm={{d.yljgdm}}" target="_blank" class="layui-table-link" >{{d.yljgmc}}<a>
	</script>
</body>
</html>