<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>糖尿病患者健康管理报表</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
 
<script type="text/javascript">
//填报2型糖尿病患者人数
function insertCzrk(){
	 if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) { 
		  window.open("${ctx}/gwtnbglbb/insertTnbsl?p_yljgdm="+'${yljgdm}');
		  
		} else {
		window.open("${ctx}/gwtnbglbb/insertTnbsl?p_yljgdm="+$("#yljgdm").val());
			 
		}
}
//导出 到excel
function toExcel() {
	 if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) { 
			location.href = "${ctx}/gwtnbglbb/toExcel?yljgdm=" + '${yljgdm}'
					+'&enddate2='+$("#enddate").val()+$("#jdpz").val();
		} else {
			location.href = "${ctx}/gwtnbglbb/toExcelyljgdm=" + $("#yljgdm").val() 
					+'&enddate2='+$("#enddate").val()+$("#jdpz").val();
		}

	}


function getData(yljgdm,enddate){
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
            laydate.render({ 
          	  elem: '#enddate',
          	type: 'year'
          });
            table.render({
                elem:'#querytable',
                url : '${ctx}/gwtnbglbb/gwtnbglbb',
				method : 'post',
				where : {
					p_yljgdm : yljgdm,
					p_enddate : enddate,
					p_jdpz:$("#jdpz").val(),
					p_enddate2 : enddate+$("#jdpz").val()
					
				},
				cols : [ [ 
					{ field : 'yljgmc', title : '管辖机构', width : '300' }, 
					{ field : 'rs1', title : '年内辖区内已管理的2型糖尿病患者人数', width : '300' },
					{ field : 'rs2', title : '按照规范要求进行2型糖尿病患者健康管理的人数（人）', width : '300' }, 
					{ field : 'bl1', title : '2型糖尿病患者规范管理率（%）', width : '150' }, 
					{ field : 'rs3', title : '最近一次随访空腹血糖达标人数（人）', width : '170' },
					{ field : 'bl2', title : '管理人群血糖控制率（%）', width : '170' }
					 

				] ],
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
        
        });
    }
    
	$(document).ready(function(){
		  var myDate = new Date()
		var month = myDate.getMonth() + 1;
		var year = myDate.getFullYear();
		var enddate = myDate.Format('yyyy');

		$("#enddate").val(enddate);  
		if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {

			getData('${yljgdm}', $("#enddate").val());
		} else {
			getData($("#yljgdm").val(), $("#enddate").val());
		}
		
	});
		
	function search() {
		
		
		if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {
			getData('${yljgdm}', $("#enddate").val());
		} else {
			getData($("#yljgdm").val(), $("#enddate").val());
		}
    }
	  Date.prototype.Format = function(fmt) { //author: meizz 

		var o = {
			"M+" : this.getMonth() + 1, //月份 
			"d+" : this.getDate(), //日 
			"h+" : this.getHours(), //小时 
			"m+" : this.getMinutes(), //分 
			"s+" : this.getSeconds(), //秒 
			"q+" : Math.floor((this.getMonth() + 3) / 3),
			"S" : this.getMilliseconds()
		//毫秒 
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;

	}  
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
		<table style="width: 100%">
			<tr>
				<td style="width: 33%">
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">查询时间</label>
						<div class="layui-input-inline ">
							<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input ">
						</div>
					</div>
				</td>

				<td style="width: 33%">
					<div class="layui-form-item" style="margin-top: 20px;margin-left: -117px">
						<label class="layui-form-label label3">季度选择</label>
						<div class="layui-input-inline input3">
							<select id="jdpz" name="jdpz" lay-search>

								<c:forEach items="${jdpzList}" var="jdpz">
									<option value="${jdpz.id}">${jdpz.mc}</option>
								</c:forEach>
							</select>
						</div>
					</div>

				</td>


				<td style="width: 33%">
					<div class="layui-form-item" style="margin-top: 20px;margin-left: -230px;">
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
					<div class="layui-form-item" style="margin-left: -409px;    margin-top: 11px;">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>
				<td style="width: 25%">
					<div class="layui-form-item"
						style="margin-left: -312px; margin-top: 10px">

						<div class="layui-input-block">
							<button class="layui-btn" onclick="toExcel();">导出</button>
						</div>
					</div>
				</td>
				
				<td style="width: 25%">
					<div class="layui-form-item"
						style="margin-left: -230px; margin-top: 10px">

						<div class="layui-input-block">
							<button class="layui-btn"  onclick="insertCzrk();">填报2型糖尿病患者人数</button>
						</div>
					</div>
				</td>
				 
				
			</tr>
		</table>
	</div>
	 
	<div style="width:100%;background: #FFFFFF;margin:35px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
 
</html>