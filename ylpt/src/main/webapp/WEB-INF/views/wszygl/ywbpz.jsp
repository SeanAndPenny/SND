<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>业务表展示</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
  function getData() {
	 
    layui.use([ 'table', 'layer'], function() {
      var table = layui.table;
       
      table
		.render({
			elem : '#querytable',
			 url : '${ctx}/ywbpz/ywbpz',
			toolbar : '#toolbarDemo',
			method : 'post',
			where : {
				p_ywbm : $("#ywbm").val(),
	              p_zwbm : $("#zwbm").val(),
			},
			cols :[ [ 
				   { align:'center',title:'高新区业务表',colspan:3}
				
			      ] ,[  
				  { field : 'ywbm', title : '英文表名',align:'center', width : '500' }, 
	              { field : 'zwbm', title : '中文表名', align:'center',width : '500' }, 
	              { field : 'right', title : '操作', align:'center',width : '350', toolbar : '#toolbar'},
	            ] ],
			height : '500',
			page : {
				layout : [ 'count', 'pre', 'page', 'next', 'skip', 'limit' ],
				groups : 5,
				first : '首页',
				last : '尾页',
				limit : 10,
				limits : [ 5, 10, 20 ]
			},
			done : function(res, curr, count) {
				//$(".layui-table-bool-self").append('<p>标题</p>');
				
				//$('div[title="打印"]').attr('lay-event','LOINS_PRINT');
			}
		});   
      //监听工具条
      table.on('tool(querytab)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
        , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {  
        	window.open("${ctx}/ywbjg/ywbjg?p_ywbm="+data.ywbm);
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
<body style="background: #F9F9F9; overflow: scroll;">
  <div id="queryform" class="layui-form" style="background: #FFFFFF">
    <table style="width: 100%">
      <tr>

         <td style="width: 33.3%">
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">中文表名</label>
            <div class="layui-input-inline input3">
              <input type="text" id="zwbm" name="zwbm" autocomplete="off"
                class="layui-input .input2">
            </div>
          </div>
        </td>  
        <td style="width: 33.3%">
          <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label label3">英文表名</label>
            <div class="layui-input-inline input3">
              <input type="text" id="ywbm" name="ywbm" autocomplete="off"
                class="layui-input .input2">
            </div>
          </div>
        </td>  
       
        <td>
          <div class="layui-form-item">
            <div class="layui-input-block">
              <button class="layui-btn" onclick="search();">查询</button>
            </div>
          </div>
        </td>
         

      </tr>
    </table>
  </div>

  <div style="width: 100%; background: #FFFFFF; margin: 35px auto;">
    <table id="querytable" class="layui-table" lay-filter="querytab"
      style="margin: -10px;"></table>
    
  </div>

</body>
<script type="text/html" id="toolbar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">表结构查看</a>
</script>

  
</html>