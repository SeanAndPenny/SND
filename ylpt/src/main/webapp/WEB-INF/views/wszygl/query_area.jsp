<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@ include file="/commons/meta.jsp"%>
</head>
<body >
	<script>
		var pcode='320507';
		var limitcount = 10;
	    var curnum = 1;
	    function  tree(){
		    $.ajax({
		    	url: "${ctx}/area/tree.json",
		    	 datatype:"json",
		    	context: document.body, 
		    	success: function(data){
		    		 var nodes=eval(data);
		    		var hh= JSON.stringify(nodes);
		    		 var xx=JSON.parse(hh);
		    		 var fianl=xx.treeList;
		    		layui.use(['tree','layer'], function(){
		    			 var layer = layui.layer
		    	           
		    	            layui.tree({
		    	                elem: '#demo1' //指定元素
		    	                ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
		    	                ,click: function(item){ //点击节点回调
// 		    	                  layer.msg('当前节名称：'+ item.name + '<br>全部参数：'+ JSON.stringify(item));
		    	                  var tcode=item.code;
		    	                  var goon=true; 
		    	                  while(goon){
		    	                	  var a  = tcode.endWith("000");
		    	                	  if(a){
			    	                	  tcode=tcode.substring(0,tcode.length-3)
			    	                  }else{
			    	                	  goon=false; 
			    	                  }
			    	                  
		    	                  }
		    	                  pcode=tcode;
		    	                	productsearch("1","10",tcode);
		    	                	curnum=1;
		    	                	limitcount=10;
		    	                	console.log(item);
		    	                }
		    	                ,nodes: fianl
		    	                 
		    	              });
		    		})
		      	}
		    });
	   }
	    String.prototype.endWith=function (s){
	    	  if(s==null||s==""||this.length==0||s.length>this.length)
	    	     return false;
	    	  if(this.substring(this.length-s.length)==s)
	    	     return true;
	    	  else
	    	     return false;
	    	  return true;
	    	 }
    	//列表查询方法
	function productsearch(mypage,limit,code) {
        layui.use(['table','laypage','laydate'], function(){
            var table = layui.table,
                laydate=layui.laydate,
                laypage = layui.laypage;
            	var  append='';
            	if(code!=null&&code!=''){
            		append="&p_code="+code;
            	}else{
            		append="";
            	}
            	if(pcode.length!=6){
            	    table.render({
                        elem: '#layui_table_id'
                        , url: "${ctx}/area/check?page="+mypage+"&limit="+limit+append
                        /*, where:{pagename:start,pagelimit:limitsize} //传参*/
                        , cols: [[          
                   
                            {field: 'name', title: '名称', width: '15%'}
                            ,  {field: 'lelevel', title: '级别', width: '15%'}
                            ,  {field: 'code', title: '行政区划编码', width: '20%'}
                            ,  {field: 'version', title: '版本号', width: '10%'}
                            ,  {field: 'updatetime', title: '更新时间', width: '10%'}
                            ,{field: 'poperation', title: '操作', width: '30%', toolbar: '#barDemo'}
                             ]]
                        , page: false
                        ,done: function(res, curr, count){
                            //如果是异步请求数据方式，res即为你接口返回的信息。
                            //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                            $("[data-field = 'childs']").children().each(function(){
                            	if($(this).text() == '0'){
                            		$("[data-field='childs']").css('display','none');
                                              		
                            		
                            	}
                            })
        					if(pcode.length!=6){
        						$("a[name='sqzjzjd']").css('display','none');
        					}
                            laypage.render({
                                elem:'laypage'
                                ,count:count
                                ,curr:curnum
                                ,limit:limitcount
                                ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                                ,jump:function (obj,first) {
                                    if(!first){
                                        curnum = obj.curr;
                                        limitcount = obj.limit;
                                        if(pcode!=undefined&&undefined!=''){
                                        	productsearch(curnum,limitcount,pcode);
                                        }else{
                                        	productsearch(curnum,limitcount,null);
                                        }
                                        
                                    }
                                }
                            })
                        }
                    })
            	}else{
            	    table.render({
                        elem: '#layui_table_id'
                        , url: "${ctx}/area/check?page="+mypage+"&limit="+limit+append
                        /*, where:{pagename:start,pagelimit:limitsize} //传参*/
                        , cols: [[          
                   
                            {field: 'name', title: '名称', width: '15%'}
                            ,  {field: 'lelevel', title: '级别', width: '10%'}
                            ,  {field: 'code', title: '行政区划编码', width: '15%'}
                            ,  {field: 'version', title: '版本号', width: '10%'}
                            ,  {field: 'updatetime', title: '更新时间', width: '10%'}
                            ,  {field: 'childs', title: '下属区划数', width: '10%'}
                            ,{field: 'poperation', title: '操作', width: '30%', toolbar: '#barDemo'}
                             ]]
                        , page: false
                        ,done: function(res, curr, count){
                            //如果是异步请求数据方式，res即为你接口返回的信息。
                            //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                            $("[data-field = 'childs']").children().each(function(){
                            	if($(this).text() == '0'){
                            		$("[data-field='childs']").css('display','none');
                                              		
                            		
                            	}
                            })
        					if(pcode.length!=6){
        						$("a[name='sqzjzjd']").css('display','none');
        					}
                            laypage.render({
                                elem:'laypage'
                                ,count:count
                                ,curr:curnum
                                ,limit:limitcount
                                ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                                ,jump:function (obj,first) {
                                    if(!first){
                                        curnum = obj.curr;
                                        limitcount = obj.limit;
                                        if(pcode!=undefined&&undefined!=''){
                                        	productsearch(curnum,limitcount,pcode);
                                        }else{
                                        	productsearch(curnum,limitcount,null);
                                        }
                                        
                                    }
                                }
                            })
                        }
                    })
            	}
        
 
            //监听工具条
            table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'new'){
                	layer.open({
        		        type: 2
        		        ,title: false //不显示标题栏
        		        ,closeBtn: true
        		        ,skin: 'demo-class'
        		        ,area: ['700px', '350px']
        		        ,shade: 0.8
        		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        		        ,moveType: 1 //拖拽模式，0或者1
        		        ,content:'${ctx}/area/newOne?code='+data.code
        		        ,yes: function(index, layero){
        				   layer.close(index);
          				}      
              		});
                
                } else if(layEvent === 'del'){
                	layer.confirm('确认要申请删除？', {icon: 3, title:'提示'}, 
            				function(index){
            					var url = "${ctx}/area/saveAreaOne.json";
            						$.ajax({
            							url:url,
            							type:"post",
            							data:{'oldcode':obj.data.code,'type':'del','oldname':obj.data.name},
            							dataType:"json",	
            							async:false,
            							success:function(data){
            								if (data.code==0) {
            									layer.msg("申请删除成功");
            								}else{
            									layer.msg("申请删除失败"+data.msg);
            								}
            							},
            							error:function(){
            								layer.msg('操作异常，稍后请重试或联系管理员!');
            								flag = false;
            							}
            						}); 
            				});
                } else if(layEvent === 'edit'){
                	layer.open({
        		        type: 2
        		        ,title: false //不显示标题栏
        		        ,closeBtn: true
        		        ,skin: 'demo-class'
        		        ,area: ['700px', '350px']
        		        ,shade: 0.8
        		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        		        ,moveType: 1 //拖拽模式，0或者1
        		        ,content:'${ctx}/area/showOne?type=edit&code='+data.code
        		        ,yes: function(index, layero){
        				   layer.close(index);
          				}      
              		});
                }
            });
            //常规用法
            laydate.render({
                elem: '#createDate'
            });
            //常规用法
            laydate.render({
                elem: '#processingTime'
            });
 
        });

    	}
		$(document).ready(function(){
			productsearch("1","10",'320507');
			curnum=1;
        	limitcount=10;
			tree();
		});
	</script>
	<div>
		<div id="demo1" class="left" style="float: left;width: 200px;margin-top: 10px">
		</div>
		<div id="pTable" class="right" style="margin-left: 201px;margin-right: 50px">
	         <table class="layui-table" id="layui_table_id" lay-filter="test">
	         
	          </table>
	    <div id="laypage"></div>
    </div>
     <script type="text/html" id="barDemo">
 		
  		<a class="layui-btn layui-btn-xs" lay-event="edit">申请变更</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">申请删除</a>
		<a name="sqzjzjd" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="new">申请增加子节点</a> 
	</script>
     </div>
</body>
</html>