<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/layui/css/layui.css"/>" />
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/jquery-1.11.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/laydate/laydate.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/forweb-w.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"/>"></script>
<title></title>
<%@ include file="/commons/meta2.jsp"%>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/calendar/WdatePicker.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/layui/layui.js"/>"></script>
<script type="text/javascript">
	
</script>
<style>
.layui-form-radio{
	margin: 0px 0px 0 0;
    padding-right: 0px;
}
.layui-form-radio>i{
	margin-right: 0px;
}
</style>
</head>
<body>
	<div class="page-shouye">
		<div class="main">
			<ul class="wd-g">
				<li class="mode wd-u-3-4 mode01"></li>
				<li class="mode wd-u-1-1 mode08">
					<div class="itembg">
						<div class="mode-main">
							<div class="table-box"
								style="width: 100% !important; margin: 0 auto !important;">
								<div id="queryform" class="layui-form"
									style="background: #FFFFFF">
									<table style="width: 100%" id="form">
										<tr>
											<td style="width: 20%" >
					                            <div class="layui-form-item" style="margin-top: 20px;">
						                            <label class="layui-form-label label3">开始时间</label>
						                               <div class="layui-input-inline input3">
							                              <input type="text" id="startdate" name="startdate"  autocomplete="off"
							                                   value="${kssj }"	class="layui-input .input2">
						                               </div>
					                             </div>
				                            </td>
				                            <td style="width: 20%" >
					                            <div class="layui-form-item" style="margin-top: 20px;">
						                             <label class="layui-form-label label3">结束时间</label>
						                                <div class="layui-input-inline input3"> 
						                                    <input type="text" id="enddate" name="enddate" autocomplete="off"
							                                     value="${jssj }"	class="layui-input .input2">
						                               </div>
					                            </div>
				                            </td>
											<td style="width: 35%">
												<div class="layui-form-item">
													<div class="layui-input-block" style="margin-left: 119px;margin-top: 10px;">
														<button class="layui-btn" onclick="search();">查询</button>
													</div>
												</div>
											</td>
										</tr>
										<tr class="form-group">
											<td style="width: 28%">
												<div class="layui-form-item">
													<label class="layui-form-label label3">查询类型</label>
													<div class="layui-input-inline input3">
														<select id="id1" name="id1" lay-filter="test">
															<option value="">查询类型</option>
															<c:forEach items="${XxymZdList}" var="zdlist">
																<option value="${zdlist.mcdm}${zdlist.sfsjg}${zdlist.bz}">${zdlist.mc}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</td>
											<td style="width: 28%">
												<div class="layui-form-item">
													<label class="layui-form-label label3">查询法则</label>
													<div class="layui-input-inline input3">
														<select id="id2">
															<option value="=">等于</option>
															<option value=">=">大于等于</option>
															<option value="<=">小于等于</option>
															<option value="!=">不等于</option>
															<option value="like">类似</option>
														</select>
													</div>
												</div>
											</td>
											<td style="width: 28%">
												<div class="layui-form-item">
													<label class="layui-form-label label3">查询内容</label>

													<div class="layui-input-inline input3" id="wb">
														<input type="text" id="" name="wb" autocomplete="off"
															class="layui-input .input2">
													</div>
													<div class="layui-input-inline input3" id="xl">
														<select id="" name="xl">
														</select>
													</div>
												</div>
											</td>
											<td style="width: 16%">
												<div class="layui-form-item" style="margin-left: -62px">												
													<button class="layui-btn" onclick="add_div();">添加</button>
													<button class="layui-btn layui-btn-danger" onclick="del_div();">删除</button>
													 
												</div>
											</td>
										</tr>
									</table>
								</div>
									<div class="layui-form">
										<table id="jtystj" class="layui-table">
										</table>
									</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div style="margin-top: -21px;" id="page"></div>
</body>
</html>
<!-- 添加和删除的js代码 -->
<script type="text/javascript">
	var detail_div = 1;
	function add_div() {
		var len = $("#form tr").length;
		$("#form").append(
						"<tr  id="+"deta"+detail_div 
								+" class='form-group'>"

								+ " <td style='width: 28%'>"
								+ " <div class='layui-form-item'>"
								+ " <label class='layui-form-label label3'>查询类型</label>"
								+ " <div class='layui-input-inline input3'>"
								+ " <select id="+"deta2"+detail_div
             					+" lay-filter="+"test"+detail_div
             					+" name='id20' >"
								+ " <option value=''>查询类型</option>"
								+ " <c:forEach items='${XxymZdList}' var='zdlist'>"
								+ " <option value='${zdlist.mcdm}${zdlist.sfsjg}${zdlist.bz}'>${zdlist.mc}</option>"
								+ " </c:forEach>"
								+ " </select>"
								+ " </div>"
								+ " </div>"
								+ " </td>"

								+ " <td style='width: 28%'>"
								+ " <div  class='layui-form-item' style='margin-top: 20px;'>"
								+ " <label class='layui-form-label label3'>查询法则</label>"
								+ " <div class='layui-input-inline input3'>"
								+ " <select id="+"deta3"+detail_div
             					+" >"
								+ " <option value='='>等于</option>"
								+ " <option value='>='>大于等于</option>"
								+ " <option value='<='>小于等于</option>"
								+ " <option value='!='>不等于</option>"
								+ " <option value='like'>类似</option> "
								+ " </select>"
								+ " </div>"
								+ " </div>"
								+ " </td>"

								+ " <td style='width: 28%'>"
								+ " <div class='layui-form-item' style='margin-top: 20px;'>"
								+ " <label class='layui-form-label label3'>查询内容</label>"
								+ " <div class='layui-input-inline input3' id="+"wb"+detail_div
             					+" >"
								+ " <input type='text' id=''   name="+"wb"+detail_div
             					+" autocomplete='off' class='layui-input .input2'>"
								+ " </div>"
								+ " <div class='layui-input-inline input3' id="+"xl"+detail_div
             					+" >"
								+ " <select id=''  name="+"xl"+detail_div
             					+" >"
								+ " </select>"
								+ " </div>"
								+ " </div>"
								+ " </td>"

								+ " <td >"
								+ " <div  style='margin-left: -66px;'>"
								+ " <input type='radio' name="+"dxk"+detail_div
    		 					+" value='and' id="+"and"+detail_div
    		 					+" >并且"+ "&nbsp;&nbsp;"
								+ " <input type='radio' name="+"dxk"+detail_div
    		 					+" value='or' id="+"or"+detail_div
    		 					+" checked='checked' >或者"
								+ " </div>"
								+ " </td>" + " </tr>");
		document.getElementsByName('wb' + detail_div)[0].setAttribute("id", "zcd" + detail_div)
		document.getElementsByName('xl' + detail_div)[0].setAttribute("id", "")
		$("#wb" + detail_div).show();
		$("#xl" + detail_div).hide();
		bb(detail_div)
		detail_div++;
		renderForm();//不加则加的option不显示
	}
	function bb(detail_div) {
		var tests = 'test' + detail_div;
		layui.use("form", function() {
			var form = layui.form;
			form.render();
			layui.code
			$('#wb' + detail_div).show();//将文本框显示
			$("#xl" + detail_div).hide();//将下拉框隐藏
			form.on('select(' + tests + ')', function(data) {
				 
				
				
				if (data.value.substr(-1, 1) == '1') {
					document.getElementsByName('wb' + detail_div)[0]
							.setAttribute("id", "zcd" + detail_div);//将input 的id改为zcd1
					document.getElementsByName('xl' + detail_div)[0]
							.setAttribute("id", "");//将select 的 id改为空 
					$('#wb' + detail_div).show();//将文本框显示
					$("#xl" + detail_div).hide();//将下拉框隐藏
				} else if (data.value.substr(-1, 1) == '2') {
					document.getElementsByName('xl' + detail_div)[0].setAttribute("id", "zcd" + detail_div);//将select 的id改为
					document.getElementsByName('wb' + detail_div)[0].setAttribute("id", "");//将input 的id改为空
					$("#zcd" + detail_div).empty();//删除select的option,防止叠加
					//添加options
					optionnrs(data.value.substr(0, data.value.length - 2),detail_div,data.value.substr(-2, 1));
					$("#wb" + detail_div).hide(); //将文本框隐藏
					$("#xl" + detail_div).show();//将下拉框显示 
				} else {
					document.getElementsByName('wb' + detail_div)[0].setAttribute("id", "zcd" + detail_div)
					document.getElementsByName('xl' + detail_div)[0].setAttribute("id", "")
					$("#wb" + detail_div).show();
					$("#xl" + detail_div).hide();
				}
			});

		});
	}
	function optionnrs(zddm, detail_div,sjsjg) {
		 
		$.ajax({
			url : "${ctx}/ywxxXz/optionnr.json?p_ywbz=" + '${ywbz}' + "&p_lx="
					+ '${sl1}' + "&p_zddm=" + zddm + "&p_yljgdm=" + '${jgdm}'+'&p_sjsjg='+sjsjg,
			type : 'post',
			datatype : "json",
			context : document.body,
			success : function(res) {
				var nodes = eval(res);
				var hh = JSON.stringify(nodes);
				var xx = JSON.parse(hh);
				var fianl = xx.OptionList;
				for (var i = 0; i < fianl.length; i++) {

					$("#zcd" + detail_div).append(
							"<option value="+fianl[i].dm+">" + fianl[i].mc
									+ "</option>");
				}
				renderForm();//不加则加的option不显示
			}
		});
	}
	 
		function del_div() { //删除功能
			var id =   (detail_div - 1).toString();
			var e = document.getElementById(id);
			$("#deta" + id + "").remove();//删除当前行
			detail_div--;
		}
	 
</script>
<script>
	function renderForm() {
		layui.use("form", function() {
			var form = layui.form;
			form.render();
		});
	}

	function optionnr(zddm,sfsjg) {
		
		$.ajax({
			url : "${ctx}/ywxxXz/optionnr.json?p_ywbz=" + '${ywbz}' + "&p_lx="
					+ '${sl1}' + "&p_zddm=" + zddm + "&p_yljgdm=" + '${jgdm}'+'&p_sjsjg='+sfsjg,
			type : 'post',
			datatype : "json",
			context : document.body,
			success : function(res) {
				var nodes = eval(res);
				var hh = JSON.stringify(nodes);
				var xx = JSON.parse(hh);
				var fianl = xx.OptionList;
				for (var i = 0; i < fianl.length; i++) {

					$("#id3").append(
							"<option value="+fianl[i].dm+">" + fianl[i].mc
									+ "</option>");
				}
				renderForm();//不加则加的option不显示
			}
		});
	}
	layui.use("form", function() {
		var form = layui.form;
		form.render();
		layui.code
		form.on('select(test)', function(data) {
			 
			
			if (data.value.substr(-1, 1) == '1') {
				document.getElementsByName('wb')[0].setAttribute("id", "id3");//将input 的id改为id3
				document.getElementsByName('xl')[0].setAttribute("id", "");//将select 的 id改为空
				$("#wb").show();//将文本框显示
				$("#xl").hide();//将下拉框隐藏
			} else if (data.value.substr(-1, 1) == '2') {
				document.getElementsByName('xl')[0].setAttribute("id", "id3");//将select 的id改为id3
				document.getElementsByName('wb')[0].setAttribute("id", "");//将input 的id改为空
				$("#id3").empty();//删除select的option,防止叠加
				optionnr(data.value.substr(0, data.value.length - 2),data.value.substr(-2, 1));//添加option
				$("#wb").hide(); //将文本框隐藏
				$("#xl").show();//将下拉框显示 
			} else {
				document.getElementsByName('wb')[0].setAttribute("id", "id3")
				document.getElementsByName('xl')[0].setAttribute("id", "")
				$("#wb").show();
				$("#xl").hide();
			}
		});

	});

	//模块1头部tab
	$(".mode01 .mode-top li").click(
			function() {
				$(this).addClass("active").siblings(".mode01 .mode-top li")
						.removeClass("active")
			});
	//整体头部切换
	$("#top-tab li").click(
			function() {
				$(this).addClass("active").siblings("#top-tab li").removeClass(
						"active")
			})
	function search() {
		getData();

	}
	$(function() {
		$("#wb").show();
		$("#xl").hide();
		getData();

	})
	function getPageList(crr, count) {
		layui.use([ 'table', 'laypage' ], function() {
			var table = layui.table;
			var laypage = layui.laypage;
			laydate.render({ 
            	  elem: '#startdate' 
            });
            laydate.render({ 
          	  elem: '#enddate' 
          });
			laypage.render({
				elem : 'page',
				count : count,//总记录数
				
				limit : 15,////每页几个
				curr : crr,////当前页
				jump : function(obj, first) {
					//首次不执行
					if (!first) {
						getData(obj.curr)
					}
				},	 
			})
		});
	}
</script>
<script type="text/javascript">
	function getData(crr) {  
		var  detail_div=0
		var id4="";
		var id5="";
		var id6="";
		var len = $("#form tr").length;
		if($("#id1").val().length>0&&$("#id3").val().length==0){
			alert("请在第二行填写完整的数据");
			return false;
		}
		if(len>2){
			for(var i=2;i<len;i++){
				detail_div++; 
				if($("#id1").val().length==0||$("#id3").val().length==0 ){
					alert("请在第二行填写完整的数据")
					return false;
				}
				if($("#deta2"+detail_div).val().length==0
						&& $("#zcd"+detail_div).val().length>0){
					alert("请在第"+(detail_div+2)+"行填写完整的数据")
					return false;
				}
				 if( $("#deta2"+detail_div).val().length>0
						&&$("#zcd"+detail_div).val().length==0){
					
					alert("请在第"+(detail_div+2)+"行填写完整的数据")
					return false;
				}
				 if($("#deta2"+detail_div).val().length==0
						&&$("#zcd"+detail_div).val().length==0){
					alert("请在第"+(detail_div+2)+"行填写完整数据"
							+"或许删除第"+ (detail_div+2)+"行")
					return false;
				}
				if($("#deta3"+detail_div).val()=='like'){
					id4+=$("input[name=dxk"+detail_div+"]:checked").val()
						+' ('+$("#deta2"+detail_div).val().substr(0, 
							$("#deta2"+detail_div).val().length-2)
					+" "+$("#deta3"+detail_div).val()+" "+"'%25"+$("#zcd"+detail_div).val()+"%25'"
					+')'+' ';	
				}else{
					id4+=$("input[name=dxk"+detail_div+"]:checked").val()
						+' ('+$("#deta2"+detail_div).val().substr(0, 
							$("#deta2"+detail_div).val().length-2)
					+" "+$("#deta3"+detail_div).val()+" "+"'"+$("#zcd"+detail_div).val()+"'"
					+')'+' ';	
				};	
			}
		} 
		if($("#id1").val().length==0){
			id5="1=1";
		}else if($("#id2").val()=='like'){
			id5="("+$("#id1").val().substr(0, $("#id1").val().length-2)
			+" "+$("#id2").val()+" '%25"+$("#id3").val()+"%25') ";	
		}
		else{
			id5="("+$("#id1").val().substr(0, $("#id1").val().length-2)
			+" "+$("#id2").val()+"'"+$("#id3").val()+"')";	
		}  
		id6='('+id5+id4+')'; 
	    var kssj = $("#startdate").val();
		var jssj = $("#enddate").val();
		$.ajax({
					url : "${ctx}/ywxxXz/ywxxXz.json?p_ywbz=" + '${ywbz}'
							+ "&p_mcdm=" + '${mcdm}' + "&p_lx=" + '${sl1}'
							+ "&p_curr=" + crr 
							+ "&p_id6=" +id6
						    + "&p_kssj=" + kssj
							+ "&p_jssj=" + jssj 
							+ "&p_yljgdm=" + '${jgdm}',
					type : 'post',
					datatype : "json",
					context : document.body,
					success : function(res) {
						var nodes = eval(res);
						var hh = JSON.stringify(nodes);
						var xx = JSON.parse(hh);
						var list1 = xx.list1;
						var list2 = xx.list2;
						var count = xx.cc;
						var $tbl = $("#jtystj");
						$tbl.empty();
						for (var i = 0; i < list1.length; i++) {
							$tbl .append('<td  style="background: #7d9dc9;color:#FFFFFF;text-decoration: none;text-align:center">'
											+ list1[i].key + '</td>');
						}
						for (var j = 0; j < list2.length; j++) {
							if ((j) % list1.length == 0) {
								$tbl.append('<tbody> <tr>');
							}
							$tbl.append('<td style="text-decoration: none;text-align:center">'
									+ list2[j].value + '</td>');
							if ((j) % list1.length == 0) {
								$tbl.append('</tbody> </tr>');
							}
						}
						getPageList(crr, count)
					}
				});
	}
</script>