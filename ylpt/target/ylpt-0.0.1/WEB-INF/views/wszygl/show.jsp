<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
    <title>数据上传情况</title>
    <%@ include file="/commons/meta.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .mycss{
            height: 27px;
            padding-left: 8px;
            margin-top: 0px;
            border-top-width: 0px;
            border-bottom-width: 0px;
            border-right-width: 0px;
            border-left-width: 0px;
            padding-top: 4px;
            padding-right: 8px;
            color: blue;
        }
        .label4{
        	width: 7em;
        }
    </style>
    <style>
        .cardDiv {
            display: inline-block;
            max-width: 90px;
            min-width: 50px;
            word-wrap: break-word;
            margin: 10px;
            text-align: center;
            font-weight: bold;
            padding-left: 2px;
            padding-right: 2px;
            padding-top: 5px;
            padding-bottom: 1px;
        }
    </style>
    
</head>

<body class="flat-blue">
	<div id="queryform" class="layui-form" style="background: #FFFFFF">
				<table style="width: 100%">
			<tr>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startDate" name="startDate" readonly="readonly"  autocomplete="off" class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="endDate"  readonly="readonly" autocomplete="off" class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">医疗机构</label>
						<div class="layui-input-inline input3">
					        <select id="jgdm" lay-search>
					        	 <option value="">输入或选择医疗机构</option>
					        	 <c:forEach items="${jgList }" var="jg">
					        	 <option value="${jg.JGDM }">${jg.JGMC }</option>
					        	 </c:forEach>
					        </select>
					    </div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td style="width: 33.3%">
					<div class="layui-form-item">
						<label class="layui-form-label label3">上传表单</label>
						<div class="layui-input-inline input3" >
					      	<select id="tabname" lay-search>
					        	 <option value="">输入或选择上传表单</option>
					        	 <c:forEach items="${tableList }" var="tab">
					        	 <option value="${tab.TABLENAME }">${tab.CHINANAME }</option>
					        	 </c:forEach>
					        </select>
				      	</div>
					</div>
				</td>
			
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="query();">查询</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style="width:100%;background: #FFFFFF">
		<div class="layui-tab layui-tab-card" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title">
			    <li lay-id="shi" class="layui-this">市上传</li>
			    <li lay-id="sheng">省上传</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<div class="card-body">
                              <table class="table table-striped table-hover" cellspacing="0" width="100%" id="inforTab_0" >
                              </table>
                          </div>
                      </div>    
                      <div class="layui-tab-item">
					<div class="card-body">
                              <table class="table table-striped table-hover" cellspacing="0" width="100%" id="inforTab_1" >
                              </table>
                          </div>
                         </div>
			</div>
			
		</div>
	</div>
  <%--   <div class="row content-container">
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                	<div class="layui-form">
									  <div class="layui-form-item">
									    <div class="layui-inline" style="margin-right: 0px;">
									      <label class="layui-form-label label4" >开始时间</label>
									      <div class="layui-input-inline" style="margin-right: 0px;">
									        <input type="text" class="layui-input" id="startDate" readonly="readonly" placeholder="开始时间">
									      </div>
									    </div>
									    <div class="layui-inline" style="margin-right: 0px;">
									      <label class="layui-form-label label4">结束时间</label>
									      <div class="layui-input-inline" style="margin-right: 0px;">
									        <input type="text" class="layui-input" id="endDate"  readonly="readonly" placeholder="结束时间">
									      </div>
									    </div>
									    <div class="layui-inline" style="margin-right: 0px;">
									      <label class="layui-form-label label4">医疗机构</label>
									      <div class="layui-input-inline" style="margin-right: 0px;">
									        <select id="jgdm" lay-search>
									        	 <option value="">输入或选择医疗机构</option>
									        	 <c:forEach items="${jgList }" var="jg">
									        	 <option value="${jg.JGDM }">${jg.JGMC }</option>
									        	 </c:forEach>
									        </select>
									      </div>
									    </div>
									    <br/>
									    <div class="layui-inline" style="margin-right: 0px;">
									      <label class="layui-form-label label4">上传表单</label>
									      <div class="layui-input-inline" style="margin-right: 0px;">
									      	<select id="tabname" lay-search>
									        	 <option value="">输入或选择上传表单</option>
									        	 <c:forEach items="${tableList }" var="tab">
									        	 <option value="${tab.TABLENAME }">${tab.CHINANAME }</option>
									        	 </c:forEach>
									        </select>
									      </div>
									    </div>
									    <div class="layui-inline" style="margin-right: 0px;">
									    	<label class="layui-form-label label4"></label>
										    <div class="layui-input-inline" >
										      <button class="layui-btn" onclick="query()">查找</button>
										    </div>
									    </div>
									  </div>
									</div>
                                </div>
                            </div>
							<div class="layui-tab layui-tab-card" lay-filter="docDemoTabBrief">
								<ul class="layui-tab-title">
								    <li lay-id="shi" class="layui-this">市上传</li>
								    <li lay-id="sheng">省上传</li>
								</ul>
								<div class="layui-tab-content">
									<div class="layui-tab-item layui-show">
										<div class="card-body">
			                                <table class="table table-striped table-hover" cellspacing="0" width="100%" id="inforTab_0" >
			                                </table>
			                            </div>
			                        </div>    
			                        <div class="layui-tab-item">
										<div class="card-body">
			                                <table class="table table-striped table-hover" cellspacing="0" width="100%" id="inforTab_1" >
			                                </table>
			                            </div>
		                            </div>
								</div>
								
							</div>
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --%>
<script type="text/javascript">
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#startDate',//指定元素
	    btns: ['now','confirm']
	  });
	  laydate.render({
		elem: '#endDate', //指定元素
		btns: ['now','confirm']
	  });
	});
	layui.use('element', function(){
		var element = layui.element;
		element.on('tab(docDemoTabBrief)', function(data){
		    getData('#inforTab_'+data.index,data.index==0?"shi":"sheng");
		});
	});
    function getData(elem,index){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                id:'inforData',
                elem: elem,
                url:'${ctx}/sjscjl/getData',
                method:'post',
                where:{p_who:index,p_startDate:$("#startDate").val(),p_endDate:$("#endDate").val(),p_tabname:$("#tabname").val(),p_jgdm:$("#jgdm").val()},
                height: 300,
                cols: [[
                    {field:'dataTime', width:'25%', title: '上传时间', sort: true, fixed: 'left'},
                    {field:'jgmc', width:'25%', title: '医疗机构'},
                    {field:'tabname', width:'25%', title: '上传表单'},
                    {field:'scl', width:'25%', title: '上传数量', sort: true}
                    

                ]],
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:5,
                    limits:[5,10,20]
                },

            });
           
        });
    }
    function query() {
    	layui.use('element', function(){
    		var element = layui.element;
    		element.tabChange("docDemoTabBrief", "shi");
    	});
        getData('#inforTab_0',"shi");
    }
</script>
<script type="text/javascript">
	var date = "${yesterdayStr}";
	$("#startDate").val(date);
	$("#endDate").val(date);
    getData('#inforTab_0',"shi");
</script>
<script>
    function showTips(id,content,place,color,time) {
        layer.tips(content,id,{
            tips:[2,color],
            time:time
        });
    }
</script>
</body>

</html>