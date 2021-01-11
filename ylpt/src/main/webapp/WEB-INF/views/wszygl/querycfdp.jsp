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
            var laydate=layui.laydate;
            laydate.render({ 
            	  elem: '#startdate' 
            });
            laydate.render({ 
          	  elem: '#enddate' 
          });
            table.render({
                elem:'#querytable',
                url: '${ctx}/cfdp/queryCfdp',
                method:'post',
                where:{p_yljgdm:$("#yljgdm").val(),p_startdate:$("#startdate").val(),p_enddate:$("#enddate").val(),p_jzzdmc:$("#jzzdmc").val(),
                	   p_yplx:$("#yplx").val(),p_ksmc:$("#ksmc").val(),p_cfklysqm:$("#cfklysqm").val(),p_rownum:$("#rownum").val(),p_je:$("#je").val()},          
                cols: [[
                	{field: 'cfklrq', title: '开立日期', width: '110'},
                    {field: 'kh', title: '卡号', width: '120'},
                    {field: 'nls', title: '年龄', width: '60'},
                    {field: 'cfklksmc', title: '科室', width: '100'},
                    {field: 'jzzdmc', title: '诊断名称', width: '100'},
                    {field: 'sl', title: '药品品种', width: '90'},
                    {field: 'ksssl', title: '抗菌药', width: '75'},
                    {field: 'zssl', title: '注射剂', width: '75'},
                    {field: 'cfklysqm', title: '处方医生', width: '100'},
                    {field: 'cfdpyjsqm', title: '配药员', width: '80'},
                    {field: 'cffyyjsqm', title: '发药员', width: '80'},
                    {field: 'je', title: '金额', width: '80'},
                    {field: 'sfdp', title: '是否点评', width: '80'},
                    {field: 'tabid', title: '操作',width: '80', toolbar: '#toolbar'}
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
						title : '处方详细信息',
						area : [ '1000px', '580px' ],
						scrollbar:true,
						content : ['${ctx}/cfdp/cfdpDetial?yljgdm='
								+data.yljgdm+'&cfbh='+data.cfbh+'&jzlsh='+data.jzlsh+'&sfzh='+data.zjhm]
					});
				}else if (layEvent === 'edit') {
					layer.open({
						type : 2, //此处以iframe举例
						title : '处方点评',
						area : [ '800px', '600px' ],
						content : ['${ctx}/cfdp/cfdpEdit?yljgdm='+data.yljgdm+'&cfbh='+data.cfbh+'&cfmxh='+data.cfmxh,'no']
					});
				}
				else if(layEvent === 'del'){
					layer.confirm('确认删除该处方信息？', function(index) {
					var deleteurl = '${ctx}/cfdp/cfdpDel.json?yljgdm='+data.yljgdm+'&cfmxh='+data.cfmxh;
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
<body style="background: #F9F9F9; overflow:scroll;">
	<div class="layui-form">
	<table style="width: 100%">
			<tr>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"
						autocomplete="off" class="layui-input .input2" placeholder="开始时间">
						</div>
					</div>
				</td>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间：</label>
						<div class="layui-input-inline input3">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2" placeholder="结束时间">
						</div>
					</div>
				</td>
				<td style="width: 40%" colspan="2">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">医疗机构：</label>
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
			</tr>
			<tr>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">药品类型：</label>
						<div class="layui-input-inline input3">
							<select name="yplx" id="yplx" lay-filter="aihao">
						<option value="0" selected="">西药</option>
						<option value="1">中药</option>
					</select>
						</div>
					</div>
				</td>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">科室：</label>
						<div class="layui-input-inline input3">
							<input type="" id="ksmc" name="ksmc" class="layui-input .input2" placeholder="请输入关键字查询">
						</div>
					</div>
				</td>
				<td style="width: 40%" colspan="2">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">医生：</label>
						<div class="layui-input-inline input3">
							<input type="" id="cfklysqm" name="cfklysqm" class="layui-input .input2" placeholder="请输入关键字查询">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">处方抽取数：</label>
						<div class="layui-input-inline">
						<div class="layui-input-inline input3">
						<input type="text" id="rownum" name="rownum" class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">金额大于等于：</label>
				<div class="layui-input-inline">
						<div class="layui-input-inline input3">
							<input type="" id="je" name="je" class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">疾病名称：</label>
						<div class="layui-input-inline input3">
							<input type="" id="jzzdmc" name="jzzdmc"  class="layui-input" placeholder="请输入关键字查询">
						</div>
					</div>
				</td>
				<td style="width: 10%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<div class="layui-input-inline input3">
							<button type="button" class="btn btn-success" onclick="search();">搜索</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
		
		<div class="comment-table">
			<table class="layui-hide" id="test" lay-filter="test"></table>
			<script type="text/html" id="toolbar">
												<a class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
											</script>
		</div>
	</div>
	<div style="width: 100%; background: #FFFFFF; margin: 25px auto;">
		<table id="querytable" class="layui-table" lay-filter="querytab"
			style="margin: -10px;"></table>
		<div id="laypage"></div>
	</div>

</body>
<script type="text/javascript">
layui.use('laydate', function() {
	var laydate = layui.laydate;
	//日期范围
	laydate.render({
		elem: '#test6',
		range: true
	});
});
</script>
</html>