<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>每日数据情况</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
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
                url: '${ctx}/mrsjqk/mrsjqk',
                method:'post',
                where:{p_yljgdm:$("#yljgdm").val(),p_startdate:$("#startdate").val(),p_enddate:$("#enddate").val(),p_bm:$("#bm").val()},          
                cols: [[
                	{field: 'yljgmc', title: '医疗机构名称', width: '300'},
                	{field: 'zwbm', title: '中文表名', width: '300'},
                    {field: 'ywbm', title: '英文表名', width: '300'},
                    {field: 'dksj', title: '到库时间', width: '300'},
                    {field: 'sl', title: '到库数量', width: '100'}
                    
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
                },done: function(res, curr, count){   
                	
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					
				} 
			});
        });
        
    }
    
	$(document).ready(function(){
		var myDate=new Date() 
		var month=myDate.getMonth()+1;
		var year=myDate.getFullYear();
		if (month<10)
		{
		month = "0" + month;
		}
		var startdate=year+"-"+month+"-01";
		var enddate=myDate.Format('yyyy-MM-dd');
		
		$("#enddate").val(enddate);
		$("#startdate").val(startdate);
		getData();
	});
	function sql(){
		window.open("${ctx}/sqlcx/sqlcx");
	}
	function search() {
        getData();
    }
	Date.prototype.Format = function (fmt) { //author: meizz 

        var o = {
            "M+": this.getMonth() + 1, //月份 
            "d+": this.getDate(), //日 
            "h+": this.getHours(), //小时 
            "m+": this.getMinutes(), //分 
            "s+": this.getSeconds(), //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
            "S": this.getMilliseconds() //毫秒 
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;

}
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>
			
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"  autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td> 
				<td style="width: 30%" >
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
				</tr>
				<tr>
				<td style="width: 30%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">表名查询</label>
						<div class="layui-input-inline input3">
							<select id="bm" name="bm" lay-search>
								<option value="">业务表名</option>
								<c:forEach items="${bmList}" var="bm">
									<option value="${bm.bm}">${bm.bmc}</option>
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
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="sql();">SQL</button>
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
	
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>
</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">明细</a>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
</script>
</html>