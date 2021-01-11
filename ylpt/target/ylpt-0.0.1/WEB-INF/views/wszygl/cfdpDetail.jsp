<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/commons/meta.jsp"%>
<title></title>
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
</head>

<body style="background: #F9F9F9;overflow:scroll;">
	<div class="details-content">
		<div class="layui-tab layui-tab-card">
			<ul class="layui-tab-title">
				<li class="layui-this">患者基本信息</li>
				<li>检验情况</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<table class="hzjbxx-table" cellpadding="0" cellspacing="0"
						border="1">
						<tr>
							<td>病人姓名</td>
							<td>${hzxx.hzxm}</td>
							<td>性别</td>
							<td>${hzxx.xb}</td>
							<td>年龄（岁）</td>
							<td>${hzxx.nls}</td>
							<td>卡号</td>
							<td>${hzxx.kh}</td>
						</tr>
						<tr>
							<td>就诊日期</td>
							<td>${hzxx.jzksrq }</td>
							<td>处方单号</td>
							<td>${hzxx.cfbh }</td>
							<td>处方金额</td>
							<td>${hzxx.cfypje }</td>
							<td>科室</td>
							<td>${hzxx.cfklksmc }</td>
						</tr>
						<tr>
							<td>配药员</td>
							<td>${hzxx.cfdpyjsqm }</td>
							<td>发药员</td>
							<td>${hzxx.cffyyjsqm }</td>
							<td>疾病诊断</td>
							<td>${hzxx.jzzdmc }</td>
							<td>医生</td>
							<td>${hzxx.zzysxm }</td>
						</tr>
					</table>
					<table class="hzjbxx-table2" cellpadding="0" cellspacing="0"
						border="1">
						<tr>
							<td>序号</td>
							<td>药品代码</td>
							<td>药品名称</td>
							<td>规格</td>
							<td>单价</td>
							<td>数量</td>
							<td>小计</td>
							<td>治疗方法</td>
							<td>时间安排</td>
							<td>用法数量</td>
						</tr>
							<c:forEach items="${cfxx}" var="item" varStatus="st">
						<tr>
								<td>${st.count}</td>
								<td>${item.ywbmyn}</td>
								<td>${item.ywmc}</td>
								<td>${item.ywgg}</td>
								<td>${item.ywdj}</td>
								<td>${item.ywsl}</td>
								<td>${item.ywje}</td>
								<td></td>
								<td>${item.fdmz}</td>
								<td>${item.zl}</td>
						</tr>
							</c:forEach>
					</table>
				</div>
				<div class="layui-tab-item">
					<div class="jyxx-table">
						<table class="layui-table">
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>检验报告单号</th>
									<th>项目名称</th>
									<th>样本类型</th>
									<th>采样时间</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="layui-tab-item"></div>
				<fieldset class="layui-elem-field site-demo-button"
					style="margin-top: 30px; height: 74px;">
					<legend>链接外部信息</legend>
					<div class="lj-buttom">
						<button class="layui-btn" onclick="jy('${jy.yljgdm}','${jy.checkserialnum}','${jy.bgry }')">检验</button>
						<button class="layui-btn layui-btn-normal">检查</button>
					</div>
				</fieldset>
				<fieldset class="layui-elem-field site-demo-button"
					style="margin-top: 30px; height: auto;">
					<legend>处方点评信息</legend>
					<div class="cfdpxx">
						<div class="layui-form">
							<div class="layui-form-item">
								<!-- <div class="layui-inline">
									<label class="layui-form-label">是否为合理处方</label>
									<div class="layui-input-block">
										<input type="radio" name="dpjg" value="1" title="是">
										<input type="radio" name="dpjg" value="2" title="否">
									</div>
								</div> -->
								<div class="layui-inline">
									<button class="layui-btn" onclick="xcwt()">点评处方</button>
								</div>
								<!-- <div class="layui-inline">
									<button class="layui-btn layui-btn-normal">保存点评</button>
								</div>
								<div class="layui-inline">
									<button class="layui-btn layui-btn-warm">重新点评</button>
								</div> -->
								<div class="a-right">
									<a class="" lay-event="edit" onclick="dpfx()">3条自动点评分析</a>
								</div>
							</div>
						</div>
					</div>
					<div class="cfdpxx-table">
						<table class="layui-table">
							<colgroup>
								<col width="60%">
								<col width="10%">
								<col width="20%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>点评内容</th>
									<th>问题类型</th>
									<th>修改</th>
									<th>删除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cfdp}" var="item" varStatus="st">
								<tr>
									<td>${item.cfdpnr }</td>
									<td>${item.type }</td>
									<td>
										<button class="layui-btn layui-btn-normal" onclick="cfdpUpdate('${item.id }')">修改</button></td>
									<td><button class="layui-btn layui-btn-danger" onclick="cfdpDel('${item.id }')">删除</button></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="hzjbxx-bottom">
						<button class="layui-btn">上一条</button>
						<button class="layui-btn layui-btn-normal">下一条</button>
					</div>
				</fieldset>
			</div>
		</div>
	</div>

	<script>
			layui.use('element', function() {
				var $ = layui.jquery,
					element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

				//触发事件
				var active = {
					tabAdd: function() {
						//新增一个Tab项
						element.tabAdd('demo', {
							title: '新选项' + (Math.random() * 1000 | 0) //用于演示
								,
							content: '内容' + (Math.random() * 1000 | 0),
							id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
						})
					},
					tabDelete: function(othis) {
						//删除指定Tab项
						element.tabDelete('demo', '44'); //删除：“商品管理”

						othis.addClass('layui-btn-disabled');
					},
					tabChange: function() {
						//切换到指定Tab项
						element.tabChange('demo', '22'); //切换到：用户管理
					}
				};

				$('.site-demo-active').on('click', function() {
					var othis = $(this),
						type = othis.data('type');
					active[type] ? active[type].call(this, othis) : '';
				});

				//Hash地址的定位
				var layid = location.hash.replace(/^#test=/, '');
				element.tabChange('test', layid);

				element.on('tab(test)', function(elem) {
					location.hash = 'test=' + $(this).attr('lay-id');
				});

			});

			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate;
			});
			
			function dpfx() {
				layui.use('layer', function() {
					var layer = layui.layer //获取layer模块
					var index = layer.open({
						title: '处方详细信息',
						type: 2,
						content: 'analyse.html',
						area: ['800px', '520px'],
					});
				});
			}
			function xcwt() {
					var yljgdm="${yljgdm}";
					var cfbh="${cfbh}";
					var sfzh="${sfzh}";
					var jzlsh="${jzlsh}";
				layui.use('layer', function() {
					var layer = layui.layer //获取layer模块
					var index = layer.open({
						type: 2,
						area: ['800px', '520px'],
						content: '${ctx}/cfdp/cfdpXcwt?yljgdm='+yljgdm+'&cfbh='+cfbh,
						success:function(layero,index){
				        },
				        end:function(){
				        	location.reload();
				        }
					});
				});
			}
			function cfdpUpdate(id) {
				layui.use('layer', function() {
					var layer = layui.layer //获取layer模块
					var index = layer.open({
					type: 2,
					area: ['800px', '520px'],
					content: '${ctx}/cfdp/cfdpFind?id='+id,
					success:function(layero,index){
			        },
			        end:function(){
			        	location.reload();
			        }
				});
			});
		}
			function cfdpDel(id){
				var url = "${ctx}/cfdp/cfdpDel?id="+id;
				$.ajax({
					url : url,
					dataType : "json",
					async : false,
					success : function(data) {
						if (data.code == 0) {
							layui.layer.msg("删除成功");
							location.reload();
						} else {
							layui.layer.msg("删除失败" + data.msg);
						}
					},
					error : function(e) {
						e;
						layui.layer.msg('操作异常，稍后请重试或联系管理员!');
						flag = false;
					}
				});
			}
			function queryUrl(yljgdm,jybgdbh,bgrq) {
				$.post(
						'encryUrl.action',
						{
							"url.ip" : "172.26.201.164",
							"url.appName" : "ehrview2",
							"url.port" : "80",
							"url.actionName" : "outerShowDetail",
							"url.params[0].paramName" : "yljgdm",
							"url.params[0].paramValue" : yljgdm,
							"url.params[1].paramName" : "bgdh",
							"url.params[1].paramValue" : jybgdbh,
							"url.params[2].paramName" : "type",
							"url.params[2].paramValue" : "jybg",
							"url.params[3].paramName" : "bgrq",
							"url.params[3].paramValue" : bgrq
						},
						function(data) {
							if(data.indexOf('http')!=-1) {
								window.open(data);
							}
						}
					);
			}
		</script>
</body>
</html>