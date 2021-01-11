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
   href="<c:url value="/static/commons/css/perfect-scrollbar.min.css"/>" />
<link rel="stylesheet" type="text/css" 
   href="<c:url value="/static/commons/css/page.css"/>" />
  
 <!--  <link rel="stylesheet" href="css/font-awesome.min.css"> -->
  <!-- <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/grids.css">
  <link href="js/perfect-scrollbar/css/perfect-scrollbar.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/page.css"> -->
  
  <title>新区图片</title>
</head>

<body>
  <div class="page-shouye">
    <!-- 头部 start -->
    <div class="top">
   
    <img src="<c:url value="/static/commons/images/head-left.png"/>">
    <img src="<c:url value="/static/commons/images/head-right.png"/>">
      <!-- <img src="images/head-left.png" alt="" class="head-left">
      <img src="images/head-right.png" alt="" class="head-right"> -->
      <div class="title">
      <img src="<c:url value="/static/commons/images/logo.png"/>">
        <!-- <img src="images/logo.png" alt=""> -->
        <span>苏州市高新区全民健康信息平台</span>
      </div>
      <div class="bot-box">
        <ul id="top-tab">
          <li class="active">健康高新</li>
          <li>医疗监测</li>
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
                <li class="active">综合医院</li>
                <li>基层医院</li>
              </ul>
              <div class="time-choose">
                <span class="start-time">开始时间</span>
                <span class="input-box">
                  <input type="text" class="start-input" placeholder="2019-02" id="test1">
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                  <!-- <img src="images/date-icon.png" alt="" id="date1"> -->
                </span>
                <span class="end-time">结束时间</span>
                <span class="input-box">
                  <input type="text" class="end-input" placeholder="2019-09" id="test2">
                   <img src="<c:url value="/static/commons/images/date-icon.png"/>">
                  <!-- <img src="images/date-icon.png" alt=""  id="date2"> -->
                </span>
                <button>查询</button>
              </div>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle01.png"/>">
               <!--  <img src="images/subtitle01.png" alt=""> -->
                <span>基层医院</span>
                <span class="num1">217</span>
                <span>家，占比</span>
                <span class="num2">17.26</span>
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
                      <select name="" id="">
                        <option value="1">职称查询</option>
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
              <select name="" id="">
                <option value="1">职称查询</option>
              </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
               <img src="<c:url value="/static/commons/images/subtitle02.png"/>">
                <!-- <img src="images/subtitle02.png" alt=""> -->
                <span>全区本年度出生人数</span>
                <span class="num1">4353</span>
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
                <span class="num1">18</span>
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
                      <tr>
                        <td>苏州大学第一附属医院</td>
                        <td>1</td>
                        <td>12</td>
                      </tr>
                      <tr class="col">
                        <td>苏州大学第二附属医院</td>
                        <td>1</td>
                        <td>22</td>
                      </tr>
                      <tr>
                        <td>木渎人民医院</td>
                        <td>1</td>
                        <td>22.5</td>
                      </tr>
                      <tr class="col">
                        <td>相城区中医医院</td>
                        <td>1</td>
                        <td>22.5</td>
                      </tr>
                      <tr>
                        <td>苏州大学第一附属医院</td>
                        <td>1</td>
                        <td>12</td>
                      </tr>
                      <tr class="col">
                        <td>苏州大学第二附属医院</td>
                        <td>1</td>
                        <td>22</td>
                      </tr>
                      <tr>
                        <td>木渎人民医院</td>
                        <td>1</td>
                        <td>22.5</td>
                      </tr>
                      <tr class="col">
                        <td>相城区中医医院</td>
                        <td>1</td>
                        <td>22.5</td>
                      </tr>
                      <tr>
                        <td>苏州大学第一附属医院</td>
                        <td>1</td>
                        <td>12</td>
                      </tr>
                      <tr class="col">
                        <td>苏州大学第二附属医院</td>
                        <td>1</td>
                        <td>22</td>
                      </tr>
                      <tr>
                        <td>木渎人民医院</td>
                        <td>1</td>
                        <td>22.5</td>
                      </tr>
                      <tr class="col">
                        <td>相城区中医医院</td>
                        <td>1</td>
                        <td>22.5</td>
                      </tr>
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
                        <tr>
                          <td>综合医院</td>
                          <td>2356</td>
                          <td>2279</td>
                          <td>2279</td>
                          <td>1818</td>
                          <td>48.18%</td>
                        </tr>
                        <tr class="col">
                          <td>基层医院</td>
                          <td>2356</td>
                          <td>2279</td>
                          <td>2279</td>
                          <td>1818</td>
                          <td>48.18</td>
                        </tr>
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
              <select name="" id="">
                <option value="1">签约机构</option>
              </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitl04.png"/>">
              
                <!-- <img src="images/subtitl04.png" alt=""> -->
                <span>全区本月度签约人数</span>
                <span class="num1">372</span>
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
              <span>外送检验样本量</span>
            </div>
            <div class="mode-main">
              <div class="echarts-box">
              <img src="<c:url value="/static/commons/images/mode06-icon.png"/>">
                <!-- <img src="images/mode06-icon.png" alt="" class="center"> -->
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
            <div class="mode-main">
              <div class="echarts-box">
               <img src="<c:url value="/static/commons/images/mode07-icon.png"/>">
               <!--  <img src="images/mode07-icon.png" alt="" class="center"> -->
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
                <input type="text" class="start-input" placeholder="2019-02-01" id="test3">
                <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date3">
               <!--  <img src="images/date-icon.png" alt="" id="date3"> -->
              </span>
              <span class="end-time">结束时间</span>
              <span class="input-box">
                <input type="text" class="end-input" placeholder="2019-09-01" id="test4">
                 <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date4">
               <!--  <img src="images/date-icon.png" alt="" id="date4"> -->
              </span>
              <button>查询</button>
            </div>
            <div class="mode-main">
              <div class="table-box">
                <span class="planer-name">
                  <span class="icon"></span>
                  <span class="name">综合医院</span>
                  <span class="icon"></span>
                </span>
                <div id="viewTable2" class="view">
                  <div class="fixed-header-table"></div>
                  <table class="table-data">
                    <thead>
                      <tr>
                        <th>业务时间</th>
                        <th>门诊人次</th>
                        <th>急诊人次</th>
                        <th>在院人次</th>
                        <th>入院人次</th>
                        <th>出院人次</th>
                        <th>门诊……</th>
                        <th>住院……</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>2019-10-01</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr class="col">
                        <td>2019-10-02</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>2019-10-03</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr class="col">
                        <td>2019-10-04</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>2019-10-05</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr class="col">
                        <td>2019-10-06</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>2019-10-07</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr class="col">
                        <td>2019-10-08</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>2019-10-09</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr class="col">
                        <td>2019-10-10</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr>
                        <td>2019-10-11</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                      <tr class="col">
                        <td>2019-10-12</td>
                        <td>832</td>
                        <td>40</td>
                        <td>545</td>
                        <td>47</td>
                        <td>72</td>
                        <td>0</td>
                        <td>0</td>
                      </tr>
                    </tbody>
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
                  <input type="text" class="start-input" placeholder="2019-02-01" id="test5">
               <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date5"> 
                 <!--  <img src="images/date-icon.png" alt="" id="date5"> -->
                </div>
              </li>
              <li>
                <div class="end-time">结束时间</div>
                <div class="input-box">
                  <input type="text" class="end-input" placeholder="2019-09-01" id="test6">
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date6">
                  <!-- <img src="images/date-icon.png" alt="" id="date6"> -->
                </div>
              </li>
              <li>
                <div class="end-time">机构名称</div>
                <select name="" id="">
                  <option value="">医疗机构</option>
                  <option value="">医疗机构</option>
                </select>
              </li>
              <li>
                <button>查询</button>
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
                  <input type="text" class="start-input" placeholder="2019-02-01" id="test7">
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date7">
                  <!-- <img src="images/date-icon.png" alt="" id="date7"> -->
                </div>
              </li>
              <li>
                <div class="end-time">结束时间</div>
                <div class="input-box">
                  <input type="text" class="end-input" placeholder="2019-09-01" id="test8">
                  <img src="<c:url value="/static/commons/images/date-icon.png"/>" alt="" id="date8">
                 <!--  <img src="images/date-icon.png" alt="" id="date8"> -->
                </div>
              </li>
              <li>
                <div class="end-time">机构名称</div>
                <select name="" id="">
                  <option value="">医疗机构</option>
                  <option value="">医疗机构</option>
                </select>
              </li>
              <li>
                <button>查询</button>
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
              <select name="" id="">
                <option value="1">手术级别</option>
              </select>
            </div>
            <div class="mode-main">
              <div class="subtitle">
              <img src="<c:url value="/static/commons/images/subtitle10.png"/>" alt="" >
                <!-- <img src="images/subtitle10.png" alt=""> -->
                <span>手术总量</span>
                <span class="num1">21</span>
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
                <span class="num1">463901</span>
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
	
	
	
<script type="text/javascript"
	src="<c:url value="/static/commons/js/shouye-chart.js"/>"></script>		
<!--  <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script src="js/echarts.min.js"></script> -->
<!-- <script src="js/laydate/laydate.js"></script> -->
<!-- <script src="js/forweb-w.js"></script> -->
<!-- <script src="js/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"></script> -->
<!-- <script src="js/shouye-chart.js"></script>  -->
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
</script>