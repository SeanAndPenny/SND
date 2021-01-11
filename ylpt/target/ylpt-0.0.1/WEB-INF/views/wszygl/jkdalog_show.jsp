<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>心电数据</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript">
var days="${days}";
function getData(){
        layui.use(['table','layer'] , function(){
            var table = layui.table;

           
            table.render({
                elem:'#querytable',
                url: '${ctx}/jkdlLog/showOne',
                method:'post',
                where:{p_yljg:$("#yljgdm").val(),p_days:days},          
                cols: [[
                    {field: 'lnam', title: '机构名称', width: '40%'},
                    {field: 'loginname', title: '查询人', width: '30%'},
                    {field: 'bdyz', title: '调阅人', width: '30%'}
                     ]],
                height: '400',
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					if(yljg==""||yljg==undefined){
						alert(yljg);
					}
					
				}
			});
        });
    }
    
	$(document).ready(function(){
		getData();
		$("#yljgdm").val("${yljg}")
	});
		
	function search() {
        getData();
    }
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;overflow-y:hidden" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF;">
		<table style="width: 100%">			
			<tr>
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
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:90%;background: #FFFFFF;margin:25px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">明细</a>
</script>
</html>