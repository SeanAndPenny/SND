<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/font-awesome.min.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/reset.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/grids.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/perfect-scrollbar.min.css"/>" rel="stylesheet"/>
   <link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/perfect-scrollbar.min.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/page.css"/>" />
  

   
   <script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts.min.js"/>"></script>    
  
  
<script type="text/javascript"
  src="<c:url value="/static/commons/js/jquery-1.11.1.min.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/laydate/laydate.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/forweb-w.js"/>"></script>
  
  
<script type="text/javascript"
  src="<c:url value="/static/commons/js/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"/>"></script>
  
  
  <%-- 
<script type="text/javascript"
  src="<c:url value="/static/commons/js/shouye-chart.js"/>"></script>   --%>  
 
  
  
  <title>新区统计</title>
  <%@ include file="/commons/meta2.jsp"%>
<script type="text/javascript"
   src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
  
  
  <style>
  	body{
  		overflow: hidden;
  	}
  	.menu,.menu:hover,.menu:active{
  		color:#fff !important;
  	}
  	
  	
  </style>
  
   
  
</head>

<body> 
  <div class="page-shouye">
    <!-- 头部 start -->
    <div class="top">
   
    <img src="<c:url value="/static/commons/images/head-left.png"/>">
    <img src="<c:url value="/static/commons/images/head-right.png"/>" style="margin-left: 265px;">
      <!-- <img src="images/head-left.png" alt="" class="head-left">
      <img src="images/head-right.png" alt="" class="head-right"> -->
      <div class="title">
      <img src="<c:url value="/static/commons/images/logo.png"/>">
        <!-- <img src="images/logo.png" alt=""> -->
        <span>苏州市高新区全民健康信息平台</span>
      </div>
      <div class="bot-box">
        <ul id="top-tab">
       
          <li class="active" onclick="window.location.href='${ctx}/xqtj_new/xqtj_new'">健康高新</li>
          
          <li>科教科研</li>
          <li><a href="http://10.10.100.120:8080/zhjg_cd/newindex.action?resId=71b3ba722b064f30bddd0bd9f73b6166" target="Content" class="menu">主题报表</a></li>
        </ul>
        <div class="user">
          <span>你好，管理员</span>
          <img src="<c:url value="/static/commons/images/arrow-down.png"/>">
          <!-- <img src="images/arrow-down.png" alt=""> -->
        </div>
      </div>
    </div>
    <!-- 头部 end -->

    <!-- 主体 start -->
    <div class="main" style="height:500px">
    	 <iframe id="Content" name="Content" frameborder="0" src="${ctx}/xqtj/xqtj" width="100%" height="100%" scrolling="yes" style="overflow-x: hidden"  ></iframe>
    </div>
     
       
    
    <!-- 主体 end -->
  </div>
</body>

</html>

<script>
reSetSize();
window.onresize = reSetSize;

function reSetSize() {
	var windowsHeight = window.innerHeight;
	document.getElementById("Content").style.height = (windowsHeight - 157) + "px";
}

  function timePicker1(inputId, imgId) {
    //年月选择器
    laydate.render({
      elem: inputId,
      type: 'month',
    });
    $(imgId).click(function () {
      laydate.render({
        show: true,
        elem: inputId,
        type: 'month',
        closeStop: imgId
      });
      return false
    });
  };
  timePicker1("#test1","#date1");
  timePicker1("#test2","#date2");

  function timePicker2(inputId, imgId) {
    //年月日选择器
    laydate.render({
      elem: inputId,
    });
    $(imgId).click(function () {
      laydate.render({
        show: true,
        elem: inputId,
        closeStop: imgId
      });
      return false
    });
  };
  timePicker2("#test3","#date3");
  timePicker2("#test4","#date4");
  timePicker2("#test5","#date5");
  timePicker2("#test6","#date6");
  timePicker2("#test7","#date7");
  timePicker2("#test8","#date8");

  //滚动
  if ($.fn.perfectScrollbar) {
    tableScrollFixed('#viewTable');
    tableScrollFixed('#viewTable2');
  };
  //模块1头部tab
  $(".mode01 .mode-top li").click(function () {
    $(this).addClass("active").siblings(".mode01 .mode-top li").removeClass("active")
  });

  //整体头部切换
  $("#top-tab li").click(function () {
    $(this).addClass("active").siblings("#top-tab li").removeClass("active")
  })
</script>