<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>健康档案更新情况</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
function getData(yljgdm,startdate,enddate){
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
                url: '${ctx}/jkdagx/jkdagx',
                method:'post',
                where:{p_yljgdm:yljgdm,p_startdate:startdate,p_enddate:enddate},              
                cols: [[
                	 {field: 'yljgmc', title: '调阅机构名称', width: '300',templet: '#jgdagxxx'},
                     {field: 'dtdas', title: '动态档案数', width: '300'},
                     {field: 'jdzs', title: '建档总数', width: '300'},
                     {field: 'bl', title: '档案更新率', width: '300'},
                    {field: 'right', title: '操作',width: '100', toolbar: '#toolbar'},
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
           
	table.on('tool(querytab)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'ckxx') {

					layer.open({
						type : 2,
						title : '健康档案更新详细信息' //不显示标题栏
						,
						//closeBtn : true,
						//skin : 'demo-class',
						area : [ '800px', '480px' ],
						shade : 0.8,
						id : 'LAY_layuipro' //设定一个id，防止重复弹出
						,
						moveType : 1 //拖拽模式，0或者1
						,
						scrollbar : true,
						content : '${ctx}/jkdagx/jkdagxxx?p_yljgdm=' + data.yljgdm+'&p_startdate='+$("#startdate").val()+'&p_enddate='+$("#enddate").val(),
						yes : function(index, layero) {

						}
					});
				} else if (layEvent === 'del') {

				}
			});
		});
	}

	$(document).ready(function() {

	    
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
	    
	    if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {

			getData('${yljgdm}', $("#startdate").val(),$("#enddate").val());
		} else {
			getData($("#yljgdm").val(),$("#startdate").val(), $("#enddate").val());
		}
	    
		 
	});

	function search() {
		 if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {

				getData('${yljgdm}', $("#startdate").val(),$("#enddate").val());
			} else {
				getData($("#yljgdm").val(),$("#startdate").val(), $("#enddate").val());
			}
	}
	Date.prototype.Format = function (fmt) { //author: meizz 

        var o = {
            "M+": this.getMonth() + 1, //月份 
            "d+": this.getDate(), //日 
            "h+": this.getHours(), //小时 
            "m+": this.getMinutes(), //分 
            "s+": this.getSeconds(), //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3),  
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
	<div id="queryform" class="layui-form" style="background: #FFFFFF" >
		<table style="width: 100%">
			<tr>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 35px auto;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"  autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td> 
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
	 
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>
	
</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="ckxx">明细</a>
</script>
<script type="text/html" id="jgdagxxx">
	  <a href="${ctx}/jgdagxxx/jgdagxxx?p_yljgdm={{d.yljgdm}}&p_startdate={{d.kssj}}&p_enddate={{d.jssj}}" target="_blank" class="layui-table-link" >{{d.yljgmc}}<a>
	</script>
</html>