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
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/layui/css/layui.css"/>" />
  

   
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
<title></title>
  <%@ include file="/commons/meta2.jsp"%>
<script type="text/javascript"
   src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/layui/layui.js"/>"></script>  
</head>
 
<body>

  <div class="page-shouye"> 
    <div class="main">
      <ul class="wd-g">
        <li class="mode wd-u-3-4 mode01">    
        </li>
       <li class="mode wd-u-1-1 mode08">
          <div class="itembg">
            <div class="mode-main">
              <div class="table-box" style="width:100% !important;margin:0 auto !important;">
              <div  >
            <div  >
              <ul>   
      <li  class="layui-this" >
              </ul>
              </div>
              </div>
                <div id="viewTable2" class="view" style="height:500px">
                  <div class="fixed-header-table"></div>
                     <table class="table-data" lay-filter="demo"  >
                    <thead>
                       <tr>
                         <c:forEach items="${list1}" var="list1">
                                 <th lay-data="{field:'${list1.key}'}" nowrap="nowrap" style="width: 100px;">${list1.key}</th>
                         </c:forEach>
                    </tr>
                    </thead>
                    <tbody  >
                        <c:forEach items="${list2}" var="list2" varStatus="list2count">
                          <c:if test="${list2count.count%list1siz  eq 0}||${list2count.count eq 1}">
                            <tr>
                          </c:if>
                            <td>${list2.value}</td>
                         <c:if test="${list2count.count%list1siz eq 0}">
                          </tr>
                        </c:if>
                        </c:forEach>
                    </tbody>
                  </table>   
                </div>
              </div>
               
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
  <div style="margin-top: -42px;margin-left: 31px;" id="page"></div> 
</body>
</html>
<script>
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
  $(function(){
   layui.use(['table','laypage'],function(){
     var cc='${cc }';
      var table = layui.table;
      var laypage = layui.laypage; 
      laypage.render({
        elem: 'page',
        count:cc,
              limit: 50,
              curr:'${param.p_curr}',
              jump: function(obj, first){
                //首次不执行
                   if(!first){
                      var _href = window.location.href;
                     _href = _href.substring(0,(_href.indexOf("&p_curr=")==-1?_href.length:_href.indexOf("&p_curr=")))+"&p_curr="+obj.curr;
                     
                    window.location.href = _href 
                   }
                
              }
      })
    });
  });
</script>