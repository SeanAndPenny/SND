<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>医保信息列表展示</title>
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
			 url : '${ctx}/ybtable/ybtable',
			toolbar : '#toolbarDemo',
			method : 'post',
			where : {
				  p_jgdm : '${jgdm}',
	              p_jbdm : '${jbdm}',
	              p_jglx : '${jglx}',
	              
	              p_qylx : '${qylx}',
	              p_lx: '${lx}',
	              p_kssj : '${kssj}',
	              p_jssj : '${jssj}',
	              p_ywlx : '${ywlx}',
			},
			cols : [ [ 
				{ field : 'cbsj', title : '参保时间',align:'center', width : '140' }, 
				{ field : 'cblx', title : '参保类型', align:'center',width : '140' }, 
	              { field : 'qylxmc', title : '区域类型', align:'center',width : '140' }, 
	              { field : 'yljgjb', title : '参保级别', align:'center',width : '140' },
	              { field : 'jglxmc', title : '机构类型', align:'center',width : '140' },
	              { field : 'yljgmc', title : '机构名称', align:'center',width : '350' },
	              { field : 'yw', title : '业务类型', align:'center',width : '140' },
	              { field : 'rs', title : '人数', align:'center',width : '140' },
	            ] ],
			height : '600',
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
        
      });
    });
  }
  function getData2() {
		 
	    layui.use([ 'table', 'layer'], function() {
	      var table = layui.table;
	       
	      table
			.render({
				elem : '#querytable',
				 url : '${ctx}/ybtable/ybtable2',
				toolbar : '#toolbarDemo',
				method : 'post',
				where : {
					  p_jgdm : '${jgdm}',
		              p_jbdm : '${jbdm}',
		              p_jglx : '${jglx}',
		              
		              p_qylx : '${qylx}',
		              p_lx: '${lx}',
		              p_kssj : '${kssj}',
		              p_jssj : '${jssj}',
		              p_ywlx : '${ywlx}',
				},
				cols : [ [ 
					{ field : 'cbsj', title : '参保时间',align:'center', width : '140' }, 
					{ field : 'cblx', title : '参保类型', align:'center',width : '140' }, 
		              { field : 'qylxmc', title : '区域类型', align:'center',width : '140' }, 
		              { field : 'yljgjb', title : '参保级别', align:'center',width : '140' },
		              { field : 'jglxmc', title : '机构类型', align:'center',width : '140' },
		              { field : 'yljgmc', title : '机构名称', align:'center',width : '350' },
		              { field : 'yw', title : '业务类型', align:'center',width : '140' },
		              { field : 'ylje', title : '金额', align:'center',width : '140' },
		            ] ],
				height : '600',
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
	        
	      });
	    });
	  }
	   
  $(document).ready(function() {
	  var lx='${lx}';
	  
	  if( lx=='rs'){
		   getData();
		}else{
			getData2();
		}
 
  });

   
</script>
</head>
<body style="background: #F9F9F9; overflow: scroll;">
   
  <div style="width: 100%;hight：100%; background: #FFFFFF; margin: 15px auto;">
    <table id="querytable" class="layui-table" lay-filter="querytab"
      style="margin: -5px;"></table>
  </div>

</body>
</html>