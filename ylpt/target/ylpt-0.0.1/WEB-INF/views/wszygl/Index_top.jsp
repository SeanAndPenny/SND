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
          <li class="active" onclick="window.location.href='http://localhost:8081/ylpt/xqtj/xqtj'">健康高新</li>
          <li onclick="window.location.href='http://www.baidu.com'">医疗监测</li>
          <li>公共卫生</li>
          <li>药品监管</li>
          <li>医疗资源</li>
          <li>科教科研</li>
          <li>主题报表</li>
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
    <div class="main">
      <ul class="wd-g">
        <li class="mode wd-u-3-4 mode01">
          <div class="itembg">
            <div class="mode-top">
              <ul> 
             <li  onclick="searchzh()">综合医院</li>
      <li  class="layui-this" onclick="searchjc()">基层医院</li>
              </ul>
              <div class="time-choose">
                <span class="start-time">注册开始时间</span>
                <span class="input-box">
                  <input type="text"
            id="startdate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${startdate }'
            class="start-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <span class="end-time">注册结束时间</span>
                <span class="input-box">
                  <!-- <input type="text" class="end-input" placeholder="2019-09" id="test2"> -->
                  <input type="text"
            id="enddate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${enddate }'
            class="end-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <button onclick="searchcx()">查询</button>
              </div>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle01.png"/>">
                <span id="searchyy"><%=request.getAttribute("mc")%>医院</span>
                <span class="num1"><%=request.getAttribute("xsnr")%></span>
                <span>家，占比</span>
                <span class="num2"><%=request.getAttribute("xsnr2")%></span>
                <span>%</span>
              </div>
              <ul>
                <li class="left-part">
                  <div class="echarts-box">
                    <span class="planer-name">
                      <span class="icon"></span>
                      <span class="name">医疗机构占比分布</span>
                      <span class="icon"></span>
                    </span>
                    <div class="chart01" id="chart01"></div>
                  </div>
                </li>
                <li class="right-part">
                  <div class="echarts-box">
                    <span class="planer-name">
                      <span class="icon"></span>
                      <span class="name">人员类型分析</span>
                      <span class="icon"></span>
                    </span>
                    <div class="select-box">
                          <select id="rylb" name="rylb" onchange="rylb()">
                            <c:forEach items="${rylbList}" var="rylb">
                <option value="${rylb.lbdm}">${rylb.lbmc}</option>
                 </c:forEach>
                </select>
                      
                    </div>
                    <div class="chart02" id="chart02"></div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mode wd-u-1-4 mode02">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>出生人数统计(本年)</span>
            </div>
            <div class="select-box">
              <select id="cslxcx" name="cslxcx" onchange="cslxcx()">
        <c:forEach items="${csrscxlbList}" var="cslxcx">
          <option value="${cslxcx.lbdm}">${cslxcx.lbmc}</option>
        </c:forEach>
      </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
               <img src="<c:url value="/static/commons/images/subtitle02.png"/>">
                <!-- <img src="images/subtitle02.png" alt=""> -->
                <span >全区本年度出生人数</span>
                <span  id="csrs"  class="num1"><%=request.getAttribute("csrstj")%></span>
                <span>人</span>
              </div>
              <div class="echarts-box">
                <div class="chart03" id="chart03"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-3-8 mode03">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>急救资源统计(当月)</span>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle03.png"/>">
                <!-- <img src="images/subtitle03.png" alt=""> -->
                <span>全区应急车辆</span>
                <span class="num1"><%=request.getAttribute("yjcl")%></span>
                <span>辆</span>
              </div>
              <div class="table-box">
                <div id="viewTable" class="view">
                  <div class="fixed-header-table"></div>
                  <table class="table-data">
                    <thead>
                      <tr>
                        <th>医院名称</th>
                        <th>当月出车量</th>
                        <th>平均响应时间(分)</th>
                      </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${yjclList}" var="yjclList">
                           <tr> 
                              <td> <a
              href="${ctx}/yjclXx/yjclXx?p_yljgdm=${yjclList.yljgdm}"
                target="_blank"> ${yjclList.yljgmc}</i>
              </a>
              </td>
                    <td >${yjclList.dyccl}</td>
                    <td >${yjclList.ccpjxjsj}</td> 
                </tr>
                       </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-5-8 mode04">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>区域床位统计(当天)</span>
            </div>
            <div class="mode-main">
              <div class="left-part">
                <div class="subtitle">
                  <span class="icon"></span>
                  <span>资源数据统计</span>
                </div>
                <div class="table-box">
                  <div class="view">
                    <table class="table-data">
                      <thead>
                        <tr>
                          <th>医院类型</th>
                          <th>核定床位数</th>
                          <th>开放床位数</th>
                          <th>当前使用数</th>
                          <th>剩余数</th>
                          <th>床位使用率</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${cwtjList}" var="cwtjList">
                        <tr> 
                          <td> <a
              href="${ctx}/cwtj/cwtjXzJg?p_id=${cwtjList.id}"
                target="_blank"> ${cwtjList.lxmc}</i>
              </a>
              </td>
                          <td>   ${cwtjList.hdcws} </td>
                          <td>${cwtjList.kfcws}</td>
                          <td>${cwtjList.dqsycws}</td>
                          <td>${cwtjList.sycws}</td>
                          <td>${cwtjList.cwsyl}</td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
                <ul id="topList01" class="top-list top-01"></ul>
              </div>
              <div class="echarts-box">
                <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">床位统计</span>
                  <span class="icon"></span>
                </span>
                <div class="chart04" id="chart04"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-3-8 mode05">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>家庭医生签约(当月)</span>
            </div>
            <div class="select-box">
              <select id="jtyslb" name="jtyslb" onchange="jtyslb()">
                <c:forEach items="${jtyslbList}" var="jtyslb">
          <option value="${jtyslb.lbdm}">${jtyslb.lbmc}</option>
        </c:forEach>
      </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitl04.png"/>">
              
                <!-- <img src="images/subtitl04.png" alt=""> -->
                <span>全区本月度签约人数</span>
                <span class="num1"><%=request.getAttribute("jtystj")%></span>
                <span>人</span>
              </div>
              <div class="echarts-box">
                <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">签约机构占比</span>
                  <span class="icon"></span>
                </span>
                <div class="chart05" id="chart05"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-5-16 mode06">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>外送检验样本量(本年)</span>
            </div>
            <div class="mode-main" style="margin-top: 8px;">
              <div class="echarts-box">
              <div style="position: absolute;margin-top: 110px;margin-left: 166px;">
              <img src="<c:url value="/static/commons/images/mode06-icon.png"/>">
              </div>
                <div class="chart06" id="chart06"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-5-16 mode07">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>远程影像诊断量</span>
            </div>
            <div class="mode-main" style="margin-top: 8px;">
              <div class="echarts-box">
              <div style="position: absolute;margin-top: 110px;margin-left: 166px;">
               <img src="<c:url value="/static/commons/images/mode07-icon.png"/>"> 
               </div>
                <div class="chart07" id="chart07"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-1-1 mode08">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>实时业务监测</span>
            </div> 
            
            <div class="time-choose">
                <span class="start-time">开始时间</span>
                <span class="input-box">
                  <input type="text"
            id="ywkssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${ywkssj }'
            class="start-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <span class="end-time">结束时间</span>
                <span class="input-box">
                  <!-- <input type="text" class="end-input" placeholder="2019-09" id="test2"> -->
                  <input type="text"
            id="ywjssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${ywjssj }'
            class="end-input" style="width: 100px" /> 
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                </span>
                <button onclick="getData1_02()">查询</button>
              </div>
            <div class="mode-main">
              <div class="table-box">
              
              
               <!--  <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">综合医院</span>
                  <span class="icon"></span>
                </span> -->
                
                <div  >
            <div  >
              <ul> 
             <li  onclick="getData1('A1')"><span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">综合医院</span>
                  <span class="icon"></span></li>
      <li  class="layui-this" onclick="getData1('AA')"
      style="margin-top: -42px;margin-left: 113px;"  >
      <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">基层医院</span>
                  <span class="icon"></span></li>
              </ul>
              </div>
              </div>
                
                <div id="viewTable2" class="view">
                  <div class="fixed-header-table"></div>
                  <table class="table-data" id="querytable1">
                     
                    
                  </table>
                </div>
              </div>
              <div class="echarts-box">
                <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">实时人次分析</span>
                  <span class="icon"></span>
                </span>
                <div class="chart08" id="chart08"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-6-16 mode09">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>住院病案手术查询</span>
            </div>
            <ul class="time-choose clearfix">
              <li>
                <div class="start-time">开始时间</div>
                <div class="input-box">
                  <input type="text"
            id="basskssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${basskssj }'
            class="start-input" style="width: 100px" /> 
               <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date5"> 
                 
                </div>
              </li>
              <li>
                <div class="end-time">结束时间</div>
                <div class="input-box">
                  <input type="text"
            id="bassjssj" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${bassjssj }'
            class="start-input" style="width: 100px" /> 
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date6">
                  
                </div>
              </li>
              <li>
            <div class="end-time">机构名称</div>
               <select id="bassjgdm" name="bassjgdm" lay-search>
        <option value="">医疗机构</option>
          <c:forEach items="${bajgList}" var="jg">
          <option value="${jg.jgdm}">${jg.jgmc}</option>
        </c:forEach>
      </select>  
              </li>
              <li>
                <button onclick="bassxx()">查询</button>
              </li>
            </ul>
            <div class="mode-main">
              <span class="planer-name">
                <span class="icon"></span>
                <span class="name">住院疾病手术人次TOP15</span>
                <span class="icon"></span>
              </span>
              <div class="echarts-box">
                <div class="chart11" id="chart11"></div>
              </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-6-16 mode10">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>住院病案病种查询</span>
            </div>
            <ul class="time-choose clearfix">
              <li>
                <div class="start-time">开始时间</div>
                <div class="input-box">
                   <input type="text"
            id="basystartDate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${kssj }'
            class="start-input" style="width: 100px" /> 
            
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date7">
                  <!-- <img src="images/date-icon.png" alt="" id="date7"> -->
                </div>
              </li>
              <li>
                <div class="end-time">结束时间</div>
                <div class="input-box">
                   <input type="text"
            id="basyendDate" readonly="readonly"
            onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value='${jssj }'
            class="start-input" style="width: 100px" /> 
            
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date8">
                 <!--  <img src="images/date-icon.png" alt="" id="date8"> -->
                </div>
              </li>
              <li>
                <div class="end-time">机构名称</div>
                <select id="bajgdm" name="bajgdm" lay-search>
        <option value="">医疗机构</option>
          <c:forEach items="${bajgList}" var="jg">
            <option value="${jg.jgdm}">${jg.jgmc}</option>
          </c:forEach>
        </select>  
              </li>
              <li>
                <button onclick="basysearch()">查询</button>
              </li>
            </ul>
            <div class="mode-main">
              <span class="planer-name">
                <span class="icon"></span>
                <span class="name">住院疾病发病人次TOP15</span>
                <span class="icon"></span>
              </span>
              <div class="echarts-box">
                  <div class="chart12" id="chart12"></div>
                </div>
            </div>
          </div>
        </li>
        <li class="mode wd-u-1-4 mode11">
          <div class="itembg">
            <div class="mode-title">
              <span class="icon"></span>
              <span>区域手术汇总(月)</span>
            </div>
            <div class="select-box">
              <select id="sscx" name="sscx" onchange="sscx()">
        <c:forEach items="${sscxList}" var="sscx">
          <option value="${sscx.lbdm}">${sscx.lbmc}</option>
        </c:forEach>
      </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle10.png"/>" alt="" >
                <!-- <img src="images/subtitle10.png" alt=""> -->
                <span>手术总量</span>
                <span class="num1"><%=request.getAttribute("sstj")%></span>
                <span>台</span>
              </div>
              <div class="echarts-box">
                <div class="chart09" id="chart09"></div>
              </div>
            </div>
          </div>
          <div class="itembg itembg-bot">
            <div class="mode-title">
              <span class="icon"></span>
              <span>全区建档</span>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle11.png"/>" alt="" >
                <!-- <img src="images/subtitle11.png" alt=""> -->
                <span>全区建档人数</span>
                <span class="num1"><%=request.getAttribute("jdtjrs")%></span>
                <span>人</span>
              </div>
              <div class="echarts-box">
                <div class="chart10" id="chart10"></div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <!-- 主体 end -->
  </div>
</body>
</html>