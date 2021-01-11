<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/commons/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/layui/layui.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/layui/css/layui.css"/>" />
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
.layui-form-label{
	width:120px;
}
</style>
</head>

<body style="background: #F9F9F9;overflow:scroll;">
	<form  id="form2">
		<label style="display:none;">医疗机构代码<input type="text" readonly="readonly" name="yljgdm" value="${yljgdm }"></label>
		<label style="display:none;">处方编号<input type="text" readonly="readonly" name="cfbh" value="${cfbh }"></label>
		<div class="layui-inline">
		<label class="layui-form-label">用药分析：</label>
				<div class="layui-input-inline">
					<div class="layui-input-inline"><input type="text" id="cfdpnr" name="cfdpnr" value="" class="layui-input">
					</div></div></div>
		<label>处方是否合格 <select name="hgbz">
			<option value="1">是</option>
			<option value="0">否</option>
		</select></label>
		<div class="details-content">
		<div class="layui-tab layui-tab-card">
			<ul class="layui-tab-title">
				<li class="layui-this">不规范处方</li>
				<li>用药不适宜处方</li>
				<li>超常规处方</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<ul>
						<li><input type="radio" value="1-1" name="type" title="1-1"/>1-1 处方的前记、正文、后记内容缺项，书写不规范或者字迹难以辨认的；</li>
						<li><input type="radio" value="1-2" name="type" title="1-2"/>1-2 医师签名、签章不规范或者与签名、签章的留样不一致的；</li>
						<li><input type="radio" value="1-3" name="type" title="1-3"/>1-3 药师未对处方进行适宜性审核的（处方后记的审核、调配、核对、发药栏目无审核调配药师及核对发药药师签名、或者单人值班调剂未执行双签名规定）；</li>
						<li><input type="radio" value="1-4" name="type" title="1-4"/>1-4 新生儿、婴幼儿处方未写明日、月龄的；</li>
						<li><input type="radio" value="1-5" name="type" title="1-5"/>1-5 西药、中成药与中药饮片未分别开具处方的；</li>
						<li><input type="radio" value="1-6" name="type" title="1-6"/>1-6 未使用药品规范名称开具处方的；</li>
						<li><input type="radio" value="1-7" name="type" title="1-7"/>1-7 药品的剂量、规格、数量、单位等书写不规范或不清楚的；</li>
						<li><input type="radio" value="1-8" name="type" title="1-8"/>1-8 用法、用量使用“遵医嘱”、“自用”等含糊不清字句的；</li>
						<li><input type="radio" value="1-9" name="type" title="1-9"/>1-9 处方修改未签名并注明修改日期，或药品超剂量使用未注明原因和再次签名的；</li>
						<li><input type="radio" value="1-10" name="type" title="1-10"/>1-10 开具处方威胁临床诊断或临床诊断书写不全的；</li>
						<li><input type="radio" value="1-11" name="type" title="1-11"/>1-11 单张门急诊处方超过五种药品的；</li>
						<li><input type="radio" value="1-12" name="type" title="1-12"/>1-12 无特殊情况下，门诊处方超过7日用量，急诊处方超过3日用量，慢性病、老年病或特殊情况下需要适当延长处方用量未注明理由的；</li>
						<li><input type="radio" value="1-13" name="type" title="1-13"/>1-13 开具麻醉药品、精神药品、医疗用毒性药品、放射性药品等特殊 管理药品处方未执行国家有关规定的；</li>
						<li><input type="radio" value="1-14" name="type" title="1-14"/>1-14 医师未按照抗菌药物临床应用管理规定开具抗菌药物处方的；</li>
						<li><input type="radio" value="1-15" name="type" title="1-15"/>1-15 中药饮片处方药物为按照“君、臣、佐、使”的顺序排列，或未按要求标注药物调剂，煎煮等特殊要求的；</li>
					</ul>
				</div>
				<div class="layui-tab-item">
					<ul>
						<li><input type="radio" value="2-1" name="type" title="2-2"/>2-1 适应症不适宜的；</li>
						<li><input type="radio" value="2-2" name="type" title="2-2"/>2-2 遴选的药品不适宜的；</li>
						<li><input type="radio" value="2-3" name="type" title="2-3"/>2-3 药品剂型或给药途径不适宜的；</li>
						<li><input type="radio" value="2-4" name="type" title="2-4"/>2-4 无正当理由不首选国家基本药物的；</li>
						<li><input type="radio" value="2-5" name="type" title="2-5"/>2-5 用法、用量不适宜的；</li>
						<li><input type="radio" value="2-6" name="type" title="2-6"/>2-6 联合用药不适宜的；</li>
						<li><input type="radio" value="2-7" name="type" title="2-7"/>2-7 重复给药的；</li>
						<li><input type="radio" value="2-8" name="type" title="2-8"/>2-8 有配伍禁忌或者不良相互作用的；</li>
						<li><input type="radio" value="2-9" name="type" title="2-9"/>2-9 其他用药不适宜情况的。</li>
					</ul>
				</div>
				<div class="layui-tab-item">
					<ul>
						<li><input type="radio" value="3-1" name="type" title="3-1"/>3-1 无适应症用药；</li>
						<li><input type="radio" value="3-2" name="type" title="3-2"/>3-2 无正当理由开具高价药的；</li>
						<li><input type="radio" value="3-3" name="type" title="3-3"/>3-3 无正当理由超说明书用药的；</li>
						<li><input type="radio" value="3-4" name="type" title="3-4"/>3-4 无正当理由为同一患者同时开具2种以上药物作用相同药物的；</li>
						<li><input type="radio" value="3-5" name="type" title="3-5"/>3-5 越级使用抗菌药物。</li>
					</ul>
				</div>
				<fieldset class="layui-elem-field site-demo-button"
					style="margin-top: 30px; height: auto;">
					<div class="hzjbxx-bottom">
						<button button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
	</form>
</body>
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
			
			
			
			
		</script>
<script type="text/javascript">
function close(){
	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	parent.layer.close(index); //再执行关闭
}
		function sumbit() {
			var url = "${ctx}/cfdp/saveCfdp";
			
				$.ajax({
					url : url,
					data:$('#form2').serialize(),
					type : "post",
					dataType : "json",
					async : false,
					success : function(data) {
						if (data.code == 0) {
							layui.layer.msg("点评成功");
							setTimeout("close()",1000);
						} else {
							layui.layer.msg("点评失败" + data.msg);
						}
					},
					error : function(e) {
						e;
						layui.layer.msg('操作异常，稍后请重试或联系管理员!');
						flag = false;
					}
				});
			
			
		}
		
		layui.use('form', function(){
			  var form = layui.form;
			//监听提交
				form.on('submit(formDemo)', function(data) {
					sumbit();
					 return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					 
				});

			});
</script>
</html>