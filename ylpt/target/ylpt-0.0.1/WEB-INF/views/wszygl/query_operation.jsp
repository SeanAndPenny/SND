<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@ include file="/commons/meta.jsp"%>
<style type="text/css">
	.input1{
		height:34px;
	}
</style>
</head>
<body style="background: #F9F9F9;overflow:scroll;">
	<script>
	var auth = "${auth}";
		var pcode;
		var limitcount = 10;
	    var curnum = 1;
	    function  tree(){
		    $.ajax({
		    	url: "${ctx}/operation/tree.json",
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
		    	                  var tcode=item.id;
		    	       /*            var goon=true; 
		    	                  while(goon){
		    	                	  var a  = tcode.endWith("00");
		    	                	  if(a){
			    	                	  tcode=tcode.substring(0,tcode.length-2)
			    	                  }else{
			    	                	  goon=false; 
			    	                  }
			    	                  
		    	                  } */
		    	                  pcode=tcode;
		    	                  if(tcode!="11111111111111111111111111111111"
		    	                		  &&tcode!="750255906FCA4F95E053AA016F0A9540"
		    	                		  &&tcode!="750255906FD24F95E053AA016F0A9540"
		    	                		  &&tcode!="750255906FDF4F95E053AA016F0A9540"){
		    	                	  productsearch("1","10",tcode);
		    	                  }
		    	                	
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
            		append="&p_id="+code;
            	}else{
            		append="";
            	}
            	if(code!=null&&code!=''){
            	  if(code.length==32){
            		 	if(auth==1){
            		 		table.render({
                                elem: '#layui_table_id'
                                , url: "${ctx}/operation/check?page="+mypage+"&type=1"+"&p_ssmc="+$("#ssmc").val()+"&limit="+limit+append
                                /*, where:{pagename:start,pagelimit:limitsize} //传参*/
                                , cols: [[
                                    {field: 'name', title: '小目录', width: '150'}
                                    ,  {field: 'gradename', title: '手术名字', width: '200'}
                                    ,  {field: 'opecode', title: '手术操作编码', width: '200'}
                                    ,  {field: 'gopename', title: '手术操作名称', width: '200'}
                                    ,{field: 'poperation', title: '操作', width: '260', toolbar: '#barDemo'}
                                     ]]
                                , page: false
                                , height:'auto'
                                ,width:'auto'
                                ,done: function(res, curr, count){
                                    //如果是异步请求数据方式，res即为你接口返回的信息。
                                    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                                    laypage.render({
                                        elem:'laypage'
                                        ,count:count
                                        ,curr:curnum
                                        ,limit:limitcount,
                                        limits:[5,10,20]
                                        ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                                        ,jump:function (obj,first) {
                                            if(!first){
                                                curnum = obj.curr;
                                                limitcount = obj.limit;
                                                //console.log("curnum"+curnum);
                                                //console.log("limitcount"+limitcount);
                                                //layer.msg(curnum+"-"+limitcount);
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
                                , url: "${ctx}/operation/check?page="+mypage+"&type=1"+"&p_ssmc="+$("#ssmc").val()+"&limit="+limit+append
                                /*, where:{pagename:start,pagelimit:limitsize} //传参*/
                                , cols: [[
                                    {field: 'name', title: '小目录', width: '150'}
                                    ,  {field: 'gradename', title: '手术名字', width: '200'}
                                    ,  {field: 'opecode', title: '手术操作编码', width: '200'}
                                    ,  {field: 'gopename', title: '手术操作名称', width: '200'}
                                    ,{field: 'poperation', title: '操作', width: '260', toolbar: '#toolBar'}
                                     ]]
                                , page: false
                                , height:'auto'
                                ,width:'auto'
                                ,done: function(res, curr, count){
                                    //如果是异步请求数据方式，res即为你接口返回的信息。
                                    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                                    laypage.render({
                                        elem:'laypage'
                                        ,count:count
                                        ,curr:curnum
                                        ,limit:limitcount,
                                        limits:[5,10,20]
                                        ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                                        ,jump:function (obj,first) {
                                            if(!first){
                                                curnum = obj.curr;
                                                limitcount = obj.limit;
                                                //console.log("curnum"+curnum);
                                                //console.log("limitcount"+limitcount);
                                                //layer.msg(curnum+"-"+limitcount);
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
            		
            	}else if(code.length==5){
            		table.render({
                        elem: '#layui_table_id'
                        , url: "${ctx}/operation/check?page="+mypage+"&type=3"+"&limit="+limit+append
                        /*, where:{pagename:start,pagelimit:limitsize} //传参*/
                        , cols: [[
                            {field: 'xh', title: '序号', width: '280'}
                            ,  {field: 'jsxmmc', title: '技术项目名称', width: '200'}
                            ,  {field: 'zddjyq', title: '医院等级最低要求', width: '200'}
                            
                             ]]
                        , page: false
                        , height:'auto'
                        ,width:'auto'
                        ,done: function(res, curr, count){
                            //如果是异步请求数据方式，res即为你接口返回的信息。
                            //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                            laypage.render({
                                elem:'laypage'
                                ,count:count
                                ,curr:curnum
                                ,limit:limitcount,
                                limits:[5,10,20]
                                ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                                ,jump:function (obj,first) {
                                    if(!first){
                                        curnum = obj.curr;
                                        limitcount = obj.limit;
                                        //console.log("curnum"+curnum);
                                        //console.log("limitcount"+limitcount);
                                        //layer.msg(curnum+"-"+limitcount);
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
            	}else{
            		if(auth==1){
            			table.render({
                            elem: '#layui_table_id'
                            , url: "${ctx}/operation/check?page="+mypage+"&type=1"+"&p_ssmc="+$("#ssmc").val()+"&limit="+limit+append
                            /*, where:{pagename:start,pagelimit:limitsize} //传参*/
                            , cols: [[
                                {field: 'name', title: '小目录', width: '150'}
                                ,  {field: 'gradename', title: '手术名字', width: '200'}
                                ,  {field: 'opecode', title: '手术操作编码', width: '200'}
                                ,  {field: 'gopename', title: '手术操作名称', width: '200'}
                                ,{field: 'poperation', title: '操作', width: '260', toolbar: '#barDemo'}
                                 ]]
                            , page: false
                            , height:'auto'
                            ,width:'auto'
                            ,done: function(res, curr, count){
                                //如果是异步请求数据方式，res即为你接口返回的信息。
                                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                                laypage.render({
                                    elem:'laypage'
                                    ,count:count
                                    ,curr:curnum
                                    ,limit:limitcount,
                                    limits:[5,10,20]
                                    ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                                    ,jump:function (obj,first) {
                                        if(!first){
                                            curnum = obj.curr;
                                            limitcount = obj.limit;
                                            //console.log("curnum"+curnum);
                                            //console.log("limitcount"+limitcount);
                                            //layer.msg(curnum+"-"+limitcount);
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
                            , url: "${ctx}/operation/check?page="+mypage+"&type=1"+"&p_ssmc="+$("#ssmc").val()+"&limit="+limit+append
                            /*, where:{pagename:start,pagelimit:limitsize} //传参*/
                            , cols: [[
                                {field: 'name', title: '小目录', width: '150'}
                                ,  {field: 'gradename', title: '手术名字', width: '200'}
                                ,  {field: 'opecode', title: '手术操作编码', width: '200'}
                                ,  {field: 'gopename', title: '手术操作名称', width: '200'}
                                ,{field: 'poperation', title: '操作', width: '260', toolbar: '#toolBar'}
                                 ]]
                            , page: false
                            , height:'auto'
                            ,width:'auto'
                            ,done: function(res, curr, count){
                                //如果是异步请求数据方式，res即为你接口返回的信息。
                                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                                laypage.render({
                                    elem:'laypage'
                                    ,count:count
                                    ,curr:curnum
                                    ,limit:limitcount,
                                    limits:[5,10,20]
                                    ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                                    ,jump:function (obj,first) {
                                        if(!first){
                                            curnum = obj.curr;
                                            limitcount = obj.limit;
                                            //console.log("curnum"+curnum);
                                            //console.log("limitcount"+limitcount);
                                            //layer.msg(curnum+"-"+limitcount);
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
            		
            	}
 
            //监听工具条
            table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'detail'){
                	layer.open({
        		        type: 2
        		        ,title: false //不显示标题栏
        		        ,closeBtn: true
        		        ,skin: 'demo-class'
        		        ,area: ['1000px', '550px']
        		        ,shade: 0.8
        		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        		        ,btn: ['关闭']
        		        ,btnAlign: 'c'
        		        ,moveType: 1 //拖拽模式，0或者1
        		        ,content:'${ctx}/operation/showHospital?&p_gradeid='+data.gradeid
        		        ,yes: function(index, layero){
        				   layer.close(index);
          				}      
              		});
                } else if(layEvent === 'del'){
                 	layer.open({
    		        type: 2
    		        ,title: false //不显示标题栏
    		        ,closeBtn: true
    		        ,skin: 'demo-class'
    		        ,area: ['1000px', '550px']
    		        ,shade: 0.8
    		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
    		        ,btn: ['关闭']
    		        ,btnAlign: 'c'
    		        ,moveType: 1 //拖拽模式，0或者1
    		        ,content:'${ctx}/operation/shHospital?&p_gradeid='+data.gradeid
    		        ,yes: function(index, layero){
    				   layer.close(index);
      				}      
          		});
                } else if(layEvent === 'edit'){
                	layer.open({
        		        type: 2
        		        ,title: false //不显示标题栏
        		        ,closeBtn: true
        		        ,skin: 'demo-class'
        		        ,area: ['800px', '350px']
        		        ,shade: 0.8
        		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        		        
        		        ,moveType: 1 //拖拽模式，0或者1
        		        ,content:'${ctx}/operation/shOpe?&p_gradeid='+data.gradeid
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
			productsearch("1","10",'');
			curnum=1;
        	limitcount=10;
			tree();
		});
	</script>
	<div>
		<div class="left" style="float: left;width: 150px;margin-top: 10px">
		<div id="demo1" >
		</div>
		<div id="demo2" >
		</div>
		<div id="demo3" >
		</div>
		</div>
		<div id="pTable" class="right" style="margin-left: 180px;margin-right: 50px">
			<label>手术名称：</label>
			<input type="text" class="input1" id="ssmc" placeholder="请输入关键字查询"><button class="btn btn-success " onclick="productsearch('1','5','');">搜索</button>
	         <table class="layui-table" id="layui_table_id" lay-filter="test">
	         
	          </table>
	    <div id="laypage"></div>
    </div>
     <script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a> 
  		<a class="layui-btn layui-btn-xs" lay-event="edit">医院权限申请</a>
	</script>
	<script type="text/html" id="toolBar">
  		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a> 
  		<a class="layui-btn layui-btn-xs" lay-event="edit">医院权限申请</a>
	</script>
     </div>
</body>
</html>