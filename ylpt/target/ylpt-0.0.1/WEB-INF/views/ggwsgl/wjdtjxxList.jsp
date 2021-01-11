
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>未建档信息提醒</title>
<%@ include file="/commons/meta.jsp"%>
<style type="text/css">
.attribute-changes {
  opacity: 0.7;
}
</style>
<script type="text/javascript">
  function chart01(id, moth, values) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
      xAxis : {
        type : 'category',
        data : moth
      },
      yAxis : {
        type : 'value'
      },
      series : [ {
        data : values,
        type : 'line'
      } ]
    };
    myChart.setOption(option);
  }

  function getData() {
	 
    layui.use([ 'table', 'layer' ], function() {
      var table = layui.table;
      table .render({
            elem : '#querytable',
            url : '${ctx}/wjdtj/wjdtjxx',
            method : 'post',
            where : {
              p_zjhm : $("#zjhm").val(),
              p_xm : $("#xm").val(),
              p_yljgdm : $("#yljgdm").val(),
              p_cklx : $("#cklx").val()
            },
            cols : [ [ {
              field : 'yljgmc',
              title : '机构名称',
              width : '15%'
            }, {
              field : 'xm',
              title : '姓名',
              width : '8%'
            }, {
              field : 'xb',
              title : '性别',
              width : '5%'
            }, {
              field : 'csrq',
              title : '出生日期',
              width : '8%'
            }, {
              field : 'zjhm',
              title : '证件号码',
              width : '15%'
            }, {
              field : 'nl',
              title : '年龄',
              width : '5%'
            }, {
              field : 'lxdh',
              title : '联系电话',
              width : '10%'
            }, {
              field : 'dz',
              title : '地址',
              width : '20%'
            }, {
              field : 'num',
              title : '提醒状态',
              width : '10%'
            },
            /* {field: 'jlgxsj', title: '就诊日期', width: '15%'}, */
            {
              field : 'tabid',
              title : '操作',
              width : '10%',
              toolbar : '#toolbar'
            } ] ],
            height : '500',
            page : {
              layout : [ 'count', 'pre', 'page', 'next', 'skip',
                  'limit' ],
              groups : 5,
              first : '首页',
              last : '尾页',
              limit : 10,
              limits : [ 5, 10, 20 ]
            },
            done : function(res, curr, count) {

            }
          });
      //监听工具条
      table.on('tool(querytab)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
      
        , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'tx') {
          layer.open({
            type : 2,
            title : false //不显示标题栏
            ,
            closeBtn : true,
            skin : 'demo-class',
            area : [ '1000px', '530px' ],
            shade : 0.8,
            id : 'LAY_layuipro' //设定一个id，防止重复弹出
            ,
            moveType : 1 //拖拽模式，0或者1
            ,
            content : '${ctx}/wjdtj/wjdtj_dx?yljgdm=' + data.yljgdm
                + '&zjhm=' + data.zjhm + '&xm=' + data.xm+'&cklx='+$("#cklx").val(),
            yes : function(index, layero) {
              location.reload();
              
            },
            end:function(){
              getData();
                }
          });
        }
      });
    });
  }

  $(document).ready(function() {
    getData();
  });

  function search() {
    getData();
  }
</script>
</head>
<body style="background: #F9F9F9; overflow: scroll; overflow-y: hidden">
  <div id="queryform" class="layui-form" style="background: #FFFFFF;">
    <table style="width: 100%">
      <tr>
        <td style="width: 33.3%">
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">机构名称</label>
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
        <td style="width: 33.3%">
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">姓名</label>
            <div class="layui-input-inline input3">
              <input type="text" id="xm" name="xm" autocomplete="off"
                class="layui-input .input2">
            </div>
          </div>
        </td>
        <td style="width: 33.3%">
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">身份证号</label>
            <div class="layui-input-inline input3">
              <input type="text" id="zjhm" name="zjhm" autocomplete="off"
                class="layui-input .input2">
            </div>
          </div>
        </td> 
      </tr>
      <tr>
        <td style="width: 33.3%">
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">查看类型:</label>
            <div class="layui-input-inline input3">
              <select id="cklx" name="cklx" lay-search>
                <option value="">查看类型</option>
                <c:forEach items="${ckList}" var="ck">
                  <option value="${ck.id}">${ck.mc}</option>
                </c:forEach>
               </select>
            </div>
          </div>

        </td>
        
        <td style="width: 33.3%">
          <div class="layui-form-item" style="margin-top: 20px;">
            <div class="layui-input-block">
              <button class="layui-btn" onclick="search();">查询</button>
            </div>
          </div>
        </td>
      </tr>



    </table>

  </div>
  <div style="width: 100%; background: #FFFFFF; margin: 25px auto;">
    <table id="querytable" class="layui-table" lay-filter="querytab"
      style="margin: -10px;"></table>
    <div id="laypage"></div>
  </div>

</body>
<script type="text/html" id="toolbar">
   <a class="layui-btn layui-btn-xs" lay-event="tx">未建档提醒</a>
</script>
</html>