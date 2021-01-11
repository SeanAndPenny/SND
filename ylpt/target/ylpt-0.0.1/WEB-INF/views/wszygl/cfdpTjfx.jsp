<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" />
<script type="text/javascript"
        src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
		<style>
			.statement-card .table {
				margin-top: 0px;
			}
			
			.tips {
				color: red;
			}
			
			.gray-button {
				-webkit-filter: grayscale(1);
				filter: grayscale(1);
			}
			/*.btn-info {
				color: #fff;
				background-color: #30B19B!important;
				border-color: transparent
			}
			
			.btn-warning {
				color: #fff;
				background-color: #dfba47!important;
				border-color: transparent
			}*/
			
			.layui-form-label {
				padding: 9px 0px;
			}
			
			.label1 {
				line-height: 33px;
			}
			
			.layui-form-item {
				margin-bottom: 10px;
			}
			
			.comment-table {
				width: 100%;
				margin: 0 auto;
				background: #ffffff;
			}
			
			.layui-btn-container {
				width: 25%;
				padding-left: 29px;
				display: inline-block;
			}
		</style>
	</head>

	<body class="compact-menu">
		<!-- Search Form -->
		<main class="page-content content-wrap">
			

			<!--主要内容-->
			<div class="page-inner">
				<div id="main-wrapper">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-white">
								<div class="panel-body">
									<div class="layui-form">
										<table style="width: 100%">
			<tr>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"
						autocomplete="off" class="layui-input .input2" placeholder="开始时间">
						</div>
					</div>
				</td>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间：</label>
						<div class="layui-input-inline input3">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2" placeholder="结束时间">
						</div>
					</div>
				</td>
				<td style="width: 40%" colspan="2">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">医疗机构：</label>
						<div class="layui-input-inline input3">
							<select id="yljgdm" name="yljgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
								<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
				<td>
											<div class="layui-inline">
												<button class="layui-btn" onclick="search();">查询</button>
												<!-- <button type="button" class="btn btn-info">Excel导出</button> -->
											</div>
				</td>
			</tr>
										</div>
									</div>
									<table class="layui-table">
										<thead>
											<tr>
												<th>医疗机构</th>
												<th>总处方数</th>
												<th>点评处方数</th>
												
												<th>不合理处方数</th>
												
												
											</tr>
										</thead>
										<c:forEach items="${tjfx}" var="tjfx">
											<tr>
												<td>${tjfx.jgmc }</td>
												<td>${tjfx.zs }</td>
												<td>${tjfx.dps }</td>
												<td>${tjfx.bhgs }</td>
											</tr>
										</c:forEach>
									</table>
									<div class="echarts">
										<div id="chartBar01" class="chart-box02" style="height: 300px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Main Wrapper -->
				<div class="page-footer">
					<p class="no-s"><i class="fa fa-heart"></i></p>
				</div>
			</div>
			<!-- Page Inner -->
		</main>
		<!-- Page Content -->
		
		<div class="cd-overlay"></div>

		<!-- Javascripts -->
		<script>
			$(document).ready(function() {
				layui.use('form', function() {
					var form = layui.form;
					form.render();
				});
			});

			layui.use('laydate', function() {
				var laydate = layui.laydate;
				//日期范围
				laydate.render({ 
	            	  elem: '#startdate' 
	            });
	            laydate.render({ 
	          	  elem: '#enddate' 
	          });
			});
			
			function xxxx() {
				layui.use('layer', function() {
					var layer = layui.layer //获取layer模块
					var index = layer.open({
						title: '点评汇总详细信息',
						type: 2,
						content: 'xxxx.html',
						area: ['800px', '420px'],
					});
				});
			}

			$(function() {
				chart04('chartBar01');
			});
			
			
			function chart04(id) {

					var myChart = echarts.init(document.getElementById(id));
					var tjfx="${tjfx}";
					var dataAll=[
						<c:forEach var="list" items="${tjfx}">
						{
							value:"${list.jgmc}"
						},
						</c:forEach>
					];
					var dataAll1=[
						<c:forEach var="list" items="${tjfx}">
						{
							value:"${list.bhgs}"
						},
						</c:forEach>
					];
					var dataAll2=[
						<c:forEach var="list" items="${tjfx}">
						{
							value:"${list.hgs}"
						},
						</c:forEach>
					];
					var option = {
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    legend: {
					        data:['合理','不合理']
					    },
					    grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
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
					    xAxis : [
					        {
					            type : 'category',
					            data : dataAll
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value'
					        }
					    ],
					    series : [
					        {
					            name:'合理',
					            type:'bar',
					            data:dataAll2
					        },
					        {
					            name:'不合理',
					            type:'bar',
					            data:dataAll1
					        }
					    ]
					};


					myChart.setOption(option);

//					return myChart;

				}
		</script>
	</body>

</html>