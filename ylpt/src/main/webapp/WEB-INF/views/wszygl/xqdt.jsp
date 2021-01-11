<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=EDGE">
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人员下钻机构</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript"
	src="<c:url value="/static/commons/js/1.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/2.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>

</head>
<body>
	 
	
	<div id="container" style="height: 400px"></div>
	<script>
		
		var chart = Highcharts.chart('container', {
			chart: {
				type: 'pie',
				options3d: {
					enabled: true,
					alpha: 45,
					beta: 0
				}
			},
			title: {
				text: '2014年某网站不同浏览器访问量占比'
			},
			tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions: {
				pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					depth: 35,
					dataLabels: {
						enabled: true,
						format: '{point.name}'
					}
				}
			},
			series: [{
				type: 'pie',
				name: '浏览器占比',
				data: [
					['Firefox',   45.0],
					['IE',       26.8],
					{
						name: 'Chrome',
						y: 12.8,
						sliced: true,
						selected: true
					},
					['Safari',    8.5],
					['Opera',     6.2],
					['Others',   0.7]
				]
			}]
		});
	</script>
</body>
</html>