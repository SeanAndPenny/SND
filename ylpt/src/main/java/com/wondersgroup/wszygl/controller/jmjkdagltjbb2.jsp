<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<title>城乡居民健康档案管理统计报表</title>
<script type="text/javascript">
//插入常驻居民数
function insertCzrk(){
	 if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) { 
		  window.open("${ctx}/gwdazb/insertCzrk?p_yljgdm="+'${yljgdm}');
		  
		} else {
		window.open("${ctx}/gwdazb/insertCzrk?p_yljgdm="+$("#yljgdm").val());
			 
		}
}
//导出 到excel
function toExcel() {
	 if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) { 
			location.href = "${ctx}/gwdazb/toExcel?enddate="
					+ $("#enddate").val() + "&yljgdm=" + '${yljgdm}';
		} else {
			location.href = "${ctx}/gwdazb/toExcel?enddate="
					+ $("#enddate").val() + "&yljgdm=" + $("#yljgdm").val();
		}

	}
	//查询
function search() {
	 
	  if ($("#yljgdm").val() == '' || $("#yljgdm").val() == null) {
		 
		  location.href ="${ctx}/gwdazb/gwdazb?p_yljgdm="+'${yljgdm}'+"&p_enddate="+$("#enddate").val();
	} else {
	 
		 location.href ="${ctx}/gwdazb/gwdazb?p_yljgdm="+$("#yljgdm").val()+"&p_enddate="+$("#enddate").val();
	}  
}
</script>
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
.hzjbxx-table2 {
	width: 100%;
	text-align: center;
	border: 1px solid #cccccc;
	margin-top: 10px;
}





</style>
</head>

<body style="background: #F9F9F9;overflow:scroll;">
	<div class="details-content">
	<table style="width:50%">
				<tr>
					 
 					<td >
 					<div style="position: absolute;margin-top: -8px;margin-left:110px;">
 					<span class="canter">统计时间：</span> <input type="text" 
						id="enddate" readonly="readonly"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${enddate }"
						class="Wdate" style="width: 150px;    height: 32px;" />
						</div>
					</td>
					<td style="width: 10%" >
					<div style="margin-left: 352px;">
						<label >机构名称</label>
						<div >
							<select id="yljgdm" name="yljgdm" lay-search style="height: 32px;">
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>	
						</div>
					</div>
					
				</td>
   					<td>
						<div class="layui-form-item" style="position: absolute;margin-top: -8px;margin-left: -60px;">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
					</td>
					<td> 
					<div class="layui-form-item"  style="position: absolute;margin-left: 77px;  margin-top:-8px">

						<div class="layui-input-block">
							<button class="layui-btn" onclick="toExcel();">导出</button>
						</div>
					</div>
					</td>
					<td >
					<div class="layui-form-item"  style="position: absolute;margin-left: 210px; margin-top: -8px">

						<div class="layui-input-block">
							<button class="layui-btn" onclick="insertCzrk();">插入常住居民数</button>
						</div>
					</div>
				</td>
				</tr>
			</table> 	
		<div class="layui-tab layui-tab-card">
			<ul class="layui-tab-title">
				<li class="layui-this"><h4>城乡居民健康档案管理统计报表</h4></li>
				 
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<table class="hzjbxx-table" cellpadding="0" cellspacing="0"
						border="1">
						<tr>
							<td style="width: 10%;">甲</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td style="font-size: 16px;width: 15%">${gw.yljgmc}</td>
							</c:forEach>
							</tr>
						<tr>
							<td>辖区内常住居民数</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td>${gw.czrks }</td>
							</c:forEach>
							 
						</tr>
						<tr>
							<td>建档人数</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td>${gw.jdrs }</td>
							</c:forEach>
							 
						</tr>
						<tr>
							<td>健康档案建档率</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td>${gw.jkdajdl }</td>
							</c:forEach>
							 
						</tr>
						<tr>
							<td>建立电子健康档案人数</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td>${gw.dzjds }</td>
							</c:forEach>
							 
						</tr>
						<tr>
							<td>电子健康档案建档率</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td>${gw.dzjdl }</td>
							</c:forEach>
							 
						</tr>
						<tr>
							<td>档案中有动态记录的档案份数</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td>${gw.dtjds }</td>
							</c:forEach>
							 
						</tr>
						<tr>
							<td>健康档案使用率</td>
							<c:forEach var="gw" items="${gwdazbList}">
							<td>${gw.jkdasyl }</td>
							</c:forEach>
							 
						</tr>
					</table>
					 
				</div>
				 
				<div class="layui-tab-item"></div>
				 
				 
			</div>
		</div>
	</div>

	 
</body>
</html>