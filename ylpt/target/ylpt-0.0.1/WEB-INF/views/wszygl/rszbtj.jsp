<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>人事数据指标检测</title>
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
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
<script type="text/javascript"
	src="<c:url value="/static/commons/js/raphael.min.js"/>"></script>
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
        "d+": this.gethate(), //日 
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
     gethata();
     sjxz();
    
  });
function search() {
    gethata(); 
    }
function gethata(){
	var kssj=$("#kssj").val();    
      } 
function sjxz(id){  
   var myDate=new Date() 
    var month=myDate.getMonth()+1;
    var year=myDate.getFullYear();  
    if (month<10) { month = "0" + month; }
    if(id=='year'){
    	$("#jdd").hide();
    $("#kssj").val(year);
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
      };
    } else if(id=='month'){
    	$("#jdd").hide();
    $("#kssj").val(year+"-"+month);
   
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy-MM'});
      };
    }  else if(id=='jd'){
    	$("#jdd").show();
        $("#kssj").val(year);
        
        document.getElementById("kssj").onclick = function(){
          WdatePicker({dateFmt:'yyyy'});
          };
        } else{
    	 $("#kssj").val(year);
    document.getElementById("kssj").onclick = function(){
      WdatePicker({dateFmt:'yyyy'});
      };  
  }
}
</script>
<style type="text/css">
table-layout


:fixed


;
</style>
<style>
* {
	margin: 0;
	padding: 0;
}

caption {
	font-size: 20px;
	font-weight: bold;
}

th, td {
	border: 1px solid #ccc;
	width: 80px;
	font-size: 14px;
	line-height: 30px;
	text-align: center;
}
</style>
</head>
<body>

	<div class="main mainThree">
		<div class="top clearfix">
			<div class="topLeft">
				<span class="det"> <span class="sj sjKs">
						<ul id="sjxzid">
							<i value="year" class="n active" onclick="sjxz('year')">年</i>
							<i value="jd" class="y" onclick="sjxz('jd')">季度</i>
							<i value="month" class="y" onclick="sjxz('month')">月</i>
						</ul>
				</span> <span class="det"> <label for="">查询时间</label> <input
						type="text" id="kssj" readonly="readonly" onClick="" value=""
						class="Wdate" style="width: 100px" />
						<div
							style="position: absolute; margin-left: 188px; margin-top: -28px;">
							<img src="<c:url value="/static/commons/images/topImg1.png"/>">
						</div>
				</span> <span id='jdd' style="display: none"> <label for="">季度选择</label>
						<select id="jd" name="jd">
							<option value="01-03">第一季度</option>
							<option value="04-06">第二季度</option>
							<option value="07-09">第三季度</option>
							<option value="10-12">第四季度</option>
					</select>
				</span>
				</span>
			</div>
			<div class="topRight">
				<button class="btn1" onclick="search();">查询</button>
			</div>
		</div>

	</div>
	<div style="height: 1250px; background: #FFFFFF; width: 110%">
		<div id="lineDiv" style='position: absolute; z-index: 8888;'></div>
		<table style="border-color: #00" ellpadding=" 1" cells acing="1"
			border="1">
			<tr>
				<td colspan="24"><h1 align="center">人事数据指标检测</h1></td>
			</tr>
			<tr>
				<th id="lineTd"
					style="border: #000000 solid 1px; width: 15%; height: 76px; vertical-align: top;"
					points="[110,79,222,42,222,79]" rowspan="2">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职称、学历
					<br><br>人员类别
				</th>
				<th style='width: 5%;' rowspan="2">人数</th>
				<th style='width: 5%' rowspan="2">男</th>
				<th style='width: 5%' rowspan="2">女</th>
				<th style='width: 5%' rowspan="2">比例</th>
				<th style='width: 5%' rowspan="2">说明</th>
				<th style='width: 5%;' rowspan="2">正高人数/比例</th>
				<th rowspan="2">副高人数/比例</th>
				<th rowspan="2">中级人数/比例</th>
				<th rowspan="2">初级人数/比例</th>
				<th rowspan="2">博士后人数/比例</th>
				<th rowspan="2">博士人数/比例</th>
				<th rowspan="2">硕士人数/比例</th>
				<th rowspan="2">大学本科人数/比例</th>
				<th rowspan="2">大学专科人数/比例</th>
				<th rowspan="2">中专/比例</th>
				<th rowspan="2">高中及以下人数/比例</th>
				<th rowspan="2">35岁及以下</th>
				<th rowspan="2">36岁至40岁</th>
				<th rowspan="2">41岁至45岁</th>
				<th rowspan="2">46岁至50岁</th>
				<th rowspan="2">51岁至54岁</th>
				<th rowspan="2">55岁至59岁</th>
				<th rowspan="2">60岁及以上</th>
			</tr>
			<tr>
			</tr>
			<tr>
				<th style='width: 10%' bgcolor="#DAEEF3" ;height="5%">当月工作人员数</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#DAEEF3">其中：当月离职</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#DAEEF3">当月新增</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">其中：当月编内新增</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">当月合同新增</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">当月其他新增</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#DAEEF3">工作人员增长率</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#DAEEF3">工作人员离职率</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#DAEEF3">人力资源流动率</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#DAEEF3">净人力资源流动率</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#DAEEF3">平均人数</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">编内人员数</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">合同制人员数（单位合同+劳务派遣）</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">其他人员（退休返聘或者协议）</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#FCD5B4">卫生专业技术人员总数</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">其中：卫生管理</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">医</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">药</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">护</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">技</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#FCD5B4">卫生专业无职称人员</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%" bgcolor="#FCD5B4">非卫生专业技术人员总数</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">临床</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">其中：注册全科医生数</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">5+3</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">3+2</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">转岗</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">中医</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">放射</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">超声</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">公卫</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">口腔</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th style='width: 10%' ;height="5%">乡村医生数</th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th style='width: 5%'></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</table>
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
<script>
$(function() {
var paper = new Raphael("lineDiv");
//paper.path("M0,0L110,85");//坐标(0,0)(110,85)
//paper.path("M0,0L220,42");//坐标(0,0)(220,42)
paper.path("M0,0L220,92");//坐标(0,0)(440,370)
var offset = $("#lineTd").offset();//td的位置
//将画线的DIV移动到td的位置
$("#lineDiv").offset({top: offset.top, left: offset.left});
})
</script>
</html>