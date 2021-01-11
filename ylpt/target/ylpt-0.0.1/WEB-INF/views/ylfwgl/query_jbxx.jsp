<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>基本信息不全校验</title>
<%@ include file="/commons/meta.jsp"%>

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
                url: '${ctx}/jbxx/queryJbxx',
                method:'post',
                where:{p_xm:$("#xm").val(),p_sfz:$("#sfzh").val(),p_yljgdm:$("#yljgdm").val()},          
                cols: [[
                    {field: 'jbxx_xm', title: '姓名', width: '100'},
                    {field: 'jbxx_xb', title: '性别', width: '100'},
                    {field: 'jbxx_csrq', title: '出生日期', width: '150'},
                    {field: 'jbxx_sfzh', title: '身份证', width: '200'},
                    {field: 'jbxx_gzdw', title: '工作单位', width: '100'},
                    {field: 'etlbzxx', title: '验证失效信息', width: '600'},                  
                    {field: 'tabid', title: '操作',fixed: 'right', toolbar: '#toolbar'}
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

                    $("[data-field = 'jbxx_xb']").children().each(function(){

                        if($(this).text() == '1'){

                            $(this).text("男");

                        }else if($(this).text() == '2'){

                             $(this).text("女");

                        }

                    })
                     $("[data-field = 'jbxx_csrq']").children().each(function(){

                    	 $(this).text($(this).text().substring(0,10))
                      

                    })
                    
                    
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					window.self.location="http://172.26.201.164/ehrview/showPersonDetial.action?zjlx=01&zjhm="+data.jbxx_sfzh
				}else if(layEvent === 'del'){
			
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
		<table style="width: 100%">
			<tr>
			
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">身份证</label>
						<div class="layui-input-inline input3">
							<input type="text" id="sfzh" name="sfzh"  autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">姓名</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id="xm" name="xm" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">医疗机构</label>
						<div class="layui-input-inline input3"> 
								<select id="yljgdm" name="yljgdm" lay-search lay-verify="required">
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
	<div style="width:100%;background: #FFFFFF;margin:25px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">明细</a>
</script>
</html>