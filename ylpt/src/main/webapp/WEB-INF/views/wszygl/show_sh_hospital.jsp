<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>机构列表</title>
<%@ include file="/commons/meta.jsp"%>
<style type="text/css">
.top-buttom {
	width: 100%;
	text-align: center;
}

.condition {
	width: 100%;
}

.details-content {
	width: 98%;
	margin: 0 auto;
}

.hzjbxx-table {
	width: 100%;
	text-align: center;
	border: 1px solid #cccccc;
}

.hzjbxx-table td {
	height: 30px;
}

.hzjbxx-table tr td:nth-child(odd) {
	color: blue;
}

.hzjbxx-table2 {
	width: 100%;
	text-align: center;
	border: 1px solid #cccccc;
	margin-top: 10px;
}

.hzjbxx-table2 td {
	height: 30px;
}

.lj-buttom {
	padding-left: 50px;
}

.cfdpxx-table {
	width: 98%;
	margin: 0 auto;
}

.hzjbxx-bottom {
	width: 98%;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 10px;
}

.jyxx-table {
	width: 100%;
}

.a-right {
	float: right;
	padding-right: 10px;
}

.zddpfx-box {
	width: 98%;
	margin: 0 auto;
	text-align: center;
}

.zddpfx-bottom {
	width: 98%;
	margin: 0 auto;
	text-align: center;
}

.echarts {
	width: 98%;
	margin: 0 auto;
	height: 300px;
}
</style>
<script type="text/javascript">
function getData(){
        layui.use(['table','layer'] , function(){
            var table = layui.table;
//             var laydate=layui.laydate;
//             laydate.render({ 
//             	  elem: '#startdate' 
//             });
//             laydate.render({ 
//           	  elem: '#enddate' 
//           });
            table.render({
                elem:'#querytable',
                url: '${ctx}/operation/shHospital',
                method:'post',
                where:{p_yljgdm:$("#yljgdm").val(),p_gradename:$("#gradename").val()},          
                cols: [[
                	{field: 'gradename', title: '手术名称', width: '170'},
                	{field: 'gopename', title: '手术操作名称', width: '250'},
                    {field: 'yljgmc', title: '机构名称', width: '200'},                 
                    {field: 'sqr', title: '申请人',width: '100'},
                    {field: 'remark', title: '申请原因',width: '100'},
                    {field: 'poperation', title: '操作',width: '150',toolbar: '#toolbar'}
                     ]],
                height: '400',
                width:'auto',
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                },
                done:function(res, curr, count){    //res 接口返回的信息                 
                }
            });
            
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					var url = "${ctx}/operation/updateRequest.json?id="+data.id;
						$.ajax({
							url:url,
							type:"post",
							data:{'id':data.id},
							dataType:"json",	
							async:false,
							success:function(data){
								if (data.code==0) {
									layer.msg("操作成功");
									location.reload();
								}else{
									layer.msg("操作失败"+data.msg);
								}
							},
							error:function(){
								layer.msg('操作异常，稍后请重试或联系管理员!');
								flag = false;
							}
						});
				}else if(layEvent === 'del'){
					var url = "${ctx}/operation/updateRequest1.json?id="+data.id;
					$.ajax({
						url:url,
						type:"post",
						data:{'id':data.id},
						dataType:"json",	
						async:false,
						success:function(data){
							if (data.code==0) {
								layer.msg("操作成功");
								location.reload();
							}else{
								layer.msg("操作失败"+data.msg);
							}
						},
						error:function(){
							layer.msg('操作异常，稍后请重试或联系管理员!');
							flag = false;
						}
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
<body style="background: #F9F9F9;overflow:scroll;" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<td style="width: 33.3%" >
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
				<td>
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">手术名称:</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id="gradename" name="gradename" autocomplete="off"
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
		</table>
	</div> 
	<div style="width:100%;background: #FFFFFF;margin:25px auto;">
		
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
		 
		 
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-xs" lay-event="detail">通过</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">否决</a>
</script>
</html>