<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>相城技术</title>
<%@ include file="/commons/meta.jsp"%>

<script type="text/javascript">
function getData(){
        layui.use(['table','layer','laydate'] , function(){
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
                url: '${ctx}/operation/showjs',
                method:'post',
                where:{p_yljgdm:$("#yljgdm").val(),p_ssmc:$("#ssmc").val()},          
                cols: [[
                    {field: 'xh', title: '序号', width: '300'},
                    {field: 'jsxmmc', title: '技术项目名称', width: '350'},
                    {field: 'zddjyq', title: '医院等级最低要求', width: '350'}
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
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					window.open("http://172.26.201.154/HisReportList.aspx?repguid="+data.jcjllsh);
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
		<%-- <table style="width: 100%">
			
			
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
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">手术名称:</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id="ssmc" name="ssmc" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
<!-- 				<td style="width: 33.3%"> -->
<!-- 					<div class="layui-form-item"> -->
<!-- 						<label class="layui-form-label label3">单点系统</label> -->
<!-- 						<div class="layui-input-inline "> -->
<!-- 							<select id="platform" name="platform" lay-search> -->
<!-- 							<option value="">单点系统</option> -->
							<c:forEach items="${xtList }" var="xt">
								<option value="${xt.PKEY }">${xt.PNAME }</option>
							</c:forEach>
<!-- 						</select> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</td> -->
			
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
		</table> --%>
	</div>
	<div style="width:100%;background: #FFFFFF;margin:25px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">明细</a>
</script>
</html>