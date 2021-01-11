<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>登陆管理</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript">
function getData(){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                elem:'#querytable',
                url: '${ctx}/platLogin/queryList',
                method:'post',
                where:{p_platlogname:$("#platlogname").val(),p_platname:$("#platname").val(),p_yljgdm:$("#yljgdm").val(),p_platform:$("#platform").val(),p_getdata:'1'},          
                cols: [[
                    {field: 'platloginname', title: '账户名', width: '150'},
                    {field: 'xm', title: '姓名', width: '150'},
                    {field: 'platform', title: '单点系统', width: '150'},
                    {field: 'operator', title: '单点账户', width: '150'},
                    {field: 'attestationtime', title: '认证时间', width: '150'},
                    {field: 'loginnumber', title: '单点次数', width: '150', sort: true},                   
                    {field: 'tabid', title: '操作',fixed: 'right', toolbar: '#toolbar'}
                     ]],
                height: 'auto',
                width:'auto',
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:5,
                    limits:[5,10,20]
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					layer.open({
						type : 2, //此处以iframe举例
						title : '登陆详情',
						area : [ '600px', '350px' ],
						shade : 0,
						content : ['${ctx}/platLogin/toqueryDetial?platloginname='+data.platloginname+'&platname='+data.platform,'no']
					});
				}else if(layEvent === 'del'){
					layer.confirm('确认删除与平台的账号绑定？', function(index) {
					var deleteurl = '${ctx}/platLogin/deletePlatLogin.json';
						$.ajax({
							url : deleteurl,
							method : "POST",
							data: {tabid:data.tabid},
							success : function(data) {
								if (data.code == 0) {
									layer.alert('删除成功', {
										icon : 1
									});
									getData();
								} else {
									layer.msg('删除失败' + data.msg, {
										icon : 3
									});
								}
							},
							error : function(e) {
								layer.msg('删除出错' + e.message, {
									icon : 7
								});
							}
						});
					});
				}
			});
        });
    }
    
	$(document).ready(function(){
		getData();
	});
		
	function search() {
        getData();
    }
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;overflow-y:hidden" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">单点账号</label>
						<div class="layui-input-inline input3">
							<input type="text" id="platlogname" name="platlogname" placeholder="请输入单点账号" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">姓名</label>
						<div class="layui-input-inline input3">
							<input type="text" id="platname" name="platname" placeholder="请输入单点人员" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">医疗机构</label>
						<div class="layui-input-inline input3"> 
						<select id="yljgdm" name="yljgdm" lay-search>
							<option value="">医疗机构</option>
							<c:forEach items="${jgList }" var="jg">
								<option value="${jg.JGDM }">${jg.JGMC }</option>
							</c:forEach>
						</select>
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td style="width: 33.3%">
					<div class="layui-form-item">
						<label class="layui-form-label label3">单点系统</label>
						<div class="layui-input-inline ">
							<select id="platform" name="platform" lay-search>
							<option value="">单点系统</option>
							<c:forEach items="${xtList }" var="xt">
								<option value="${xt.PKEY }">${xt.PNAME }</option>
							</c:forEach>
						</select>
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
	<div style="width:100%;background: #FFFFFF;margin:25px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">明细</a>
<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
</script>
</html>