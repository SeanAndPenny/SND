/**
 * 根据新首页获取新资源菜单
 */
/*获取根目录方法*/
var basePath=function () {
    var pathName = window.location.pathname.substring(1);
    var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
    if (webName == "") {
        return window.location.protocol + '//' + window.location.host;
    }
    else {
        return window.location.protocol + '//' + window.location.host + '/' + webName;
    }
};

/**
 * 删除tab选项卡上面的x
 */
var delTabBtn=function(currentShowResId){
	var tabList = $('.layui-tab-title li');
	for(var i=0;i<tabList.length;i++){
		var id = $(tabList[i]).attr("lay-id");
		if(id == currentShowResId){
			$(tabList[i]).find("i").remove();
		}
	}
}

$BASEPATH=basePath();
var newApp = function() {
		var url="getMenuResourceList.action";
		var userInfo = {};
		var resources = [];
		var curr_menu = "";
		//当前菜单资源ID
		var currMenuResId = "";
		var sysName = "";
		var systemId="";
		var resList=[];//资源数组列表
		var currentShowResId="";//当前显示资源ID
		/**
		 * 初始当前用户信息
		 */
		var initUser = function(){
			var user = null;
			var organ = null;
			if (userInfo!=null){
				user = userInfo.personName;
				organ = userInfo.organName;
			}
	    	$("#user_info").html(user);
	    	$("#organ_info").html(organ);
	    	$("#system_name").html(sysName);
	    	autoSystemName(sysName);
			document.title= sysName;
		};
		//初始化业务域
		var initDomain=function(currentResId){
			var left_tool_list = $("#left_tool_list_div");
			left_tool_list.empty();
			var html='<div class="green-arrow"></div>';
			html+='<ul>';
			for(var i=0;i<resources.length;i++){
				if(i==0){
					html+='<li class="active">';
				}else{
					html+='<li>';
				}
				//html+='<a>医疗服务<i class="icon-box icon1"></i></a>';
				html+='<a id="'+resources[i].resId+'" name="'+resources[i].resName+'" url="'+resources[i].resContent+'" href="javascript:void(0);">'+resources[i].resName+'<i class="icon-box icon1"></i></a>';
				html+='</li>';
				if(resources[i].resId==currentResId){
					$("#system_name").html(resources[i].resName);
					autoSystemName(resources[i].resName);
					if(resources[i].childRes){
						initNavbar(resources[i].childRes);
					}else{
						tabadd(resources[i].resId,resources[i].resName,resources[i].resContent,false);
					}
				}
				if(null != resources[i].childRes) {
                    for (var j = 0; j < resources[i].childRes.length; j++) {
                        if (resources[i].childRes[j].resId == currentResId) {
                            $("#system_name").html(resources[i].resName);
                            autoSystemName(resources[i].resName);
                            if (resources[i].childRes) {
                                initNavbar(resources[i].childRes);
                                tabadd(currentResId, resources[i].childRes[j].resName, resources[i].childRes[j].resContent, false);
                            } else {
                                tabadd(resources[i].resId, resources[i].resName, resources[i].resContent, false);
                            }
                        } else if (null != resources[i].childRes[j].childRes) {
                            for (var k = 0; k < resources[i].childRes[j].childRes.length; k++) {
                                if (resources[i].childRes[j].childRes[k].resId == currentResId) {
                                    $("#system_name").html(resources[i].resName);
                                    autoSystemName(resources[i].resName);
                                    if (resources[i].childRes) {
                                        initNavbar(resources[i].childRes);
                                        tabadd(currentResId, resources[i].childRes[j].childRes[k].resName, resources[i].childRes[j].childRes[k].resContent, false);
                                    } else {
                                        tabadd(resources[i].resId, resources[i].childRes[k].resName, resources[i].childRes[k].resContent, false);
                                    }
                                }
                            }
                        }
                    }
                }
			}
			if(currentResId==null||currentResId==undefined){
				$("#system_name").html(resources[0].resName);
				autoSystemName(resources[0].resName);
				initNavbar(resources[0].childRes);
			}
			html+="</ul>";
			html+='</div>';
			left_tool_list.append(html);
			initDomainClick();
		};
		//初始化导航栏及子菜单
		var initNavbar=function(resourcesList){
			var navmenu = $("#nav_menu");
			navmenu.empty();
			var html="";
			var i=0;
			if(resourcesList==""||resourcesList==null||resourcesList==undefined){
				return ;
			}
			initShowPage(resourcesList);
			var flag=false;
			while(i<resourcesList.length){//导航条
				if((i+1)%initAppParams.confPageNavCount==1){
					html+='<div class="swiper-slide">';
					html+='<div class="header-list-box">';
					html+='<ul>';
					flag=true;
				}
				var count = menuLevel(resourcesList[i]);
				if(count==3 && !isGdbb(resourcesList[i].resId)){
					if(resourcesList[i].isFirst){
						html+='<li class="header-li selected">';
					}else{
						html+='<li class="header-li">';
					}
					html+='<a class="title" id="'+resourcesList[i].resId+'" name="'+resourcesList[i].resName+'" url="'+resourcesList[i].resContent+'"  href="javascript:void(0);">'+resourcesList[i].resName+'<i class="arrow-white"></i></a>';
					html+='<div class="sub-nav">';
					html+='<ul>';
					var sj_res_list = resourcesList[i].childRes;//三级菜单
					for(var j=0;j<sj_res_list.length;j++){
						html+='<li>';
						html+='<a id="'+sj_res_list[j].resId+'" name="'+sj_res_list[j].resName+'" url="'+sj_res_list[j].resContent+'" href="javascript:void(0);">'+sj_res_list[j].resName+'</a>';//<i class="arrow-white"></i>
						html+='</li>';
					}
					html+='</ul>';
					html+='</div>';
					html+='</li>';
				}else if(count==4 && !isGdbb(resourcesList[i].resId)){
					if(resourcesList[i].isFirst){
						html+='<li class="header-li selected">';
					}else{
						html+='<li class="header-li">';
					}
					html+='<a class="title" id="'+resourcesList[i].resId+'" name="'+resourcesList[i].resName+'" url="'+resourcesList[i].resContent+'"  href="javascript:void(0);">'+resourcesList[i].resName+'<i class="arrow-white"></i></a>';
                    html+='<div class="sub-nav1 first">';
                    if(resourcesList[i].childRes){
                    	var sj_res_list = resourcesList[i].childRes;//三级菜单
                    	for(var j=0;j<sj_res_list.length;j++){
                    		html+='<div class="sub-content dashed-line">';
                    		if(sj_res_list[j].resName.length>=6){
                    			html+='<div class="sub-title"><a title="'+sj_res_list[j].resName+'" style="color:#FFF;" id="'+sj_res_list[j].resId+'" name="'+sj_res_list[j].resName+'" url="'+sj_res_list[j].resContent+'" href="javascript:void(0);">'+sj_res_list[j].resName.substring(0,6)+'...</a></div>';//
                    		}else{
                    			html+='<div class="sub-title"><a style="color:#FFF;" id="'+sj_res_list[j].resId+'" name="'+sj_res_list[j].resName+'" url="'+sj_res_list[j].resContent+'" href="javascript:void(0);">'+sj_res_list[j].resName+'</a></div>';//
                    		}
                    		html+='<ul>';
                    		if(sj_res_list[j].childRes){
                    			var siji_res_list=sj_res_list[j].childRes;
                    			for(var k=0;k<siji_res_list.length;k++){
                    				if(siji_res_list[k].resName.length>=6){
                    					html+='<li>';
                    					html+='<a title="'+siji_res_list[k].resName+'" id="'+siji_res_list[k].resId+'" name="'+siji_res_list[k].resName+'" url="'+siji_res_list[k].resContent+'" href="javascript:void(0);">'+siji_res_list[k].resName.substring(0,6)+'...</a>';//<i class="arrow-white"></i>
                    					html+='</li>';
                    				}else{
                    					html+='<li>';
                    					html+='<a id="'+siji_res_list[k].resId+'" name="'+siji_res_list[k].resName+'" url="'+siji_res_list[k].resContent+'" href="javascript:void(0);">'+siji_res_list[k].resName+'</a>';//<i class="arrow-white"></i>
                    					html+='</li>';
                    				}
                    				if((k+1)%16==0){
                    					html+='</ul>';
                                		html+='</div>';
                                		html+='<div class="sub-content dashed-line">';
                                		html+='<div class="sub-title"><a style="color:#FFF;" id="'+sj_res_list[j].resId+'" name="'+sj_res_list[j].resName+'" url="'+sj_res_list[j].resContent+'" href="javascript:void(0);">'+sj_res_list[j].resName+'</a></div>';//
                                		html+='<ul>';
                    				}
                    			}
                    		}
                    		html+='</ul>';
                    		//html+='</div>';
                    		html+='</div>';
                    	}
                    }
                    html+='</div>';
                    html+='</li>';
				}else{
                    var result = document.cookie.match(new RegExp("(^| )name=([^;]*)(;|$)"));
                    //顶部菜单
                    if(resourcesList[i].isFirst){
                        html+='<li class="header-li selected">';
                    }else{
                        html+='<li class="header-li">';
                    }
                    if(result) {
                    	var sid = result[2]
                        if(resourcesList[i].resId==sid ){
                    		html+='<li class="header-li selected">';
						}else {
                            html+='<li class="header-li">';
						}
                    }
					html+='<a class="title title_sub" id="'+resourcesList[i].resId+'" name="'+resourcesList[i].resName+'" url="'+resourcesList[i].resContent+'"  href="javascript:void(0);">'+resourcesList[i].resName+'</a>';
					html+='</li>';
				}
				if(((i+1)%initAppParams.confPageNavCount==0)||((i+1)==resourcesList.length)&&flag){
					html+='</ul>';
					html+='</div>';
					html+='</div>';
					flag=false;
				}
				i++
			}
			navmenu.append(html);
			initNavClick();
		};
		//导航栏事件初始化
		var initNavClick=function(){
			//导航栏事件添加
			$('.nav-box').find('li').on('click',function(){
		        $(this).addClass('active').siblings().removeClass('active');
		    });
		    $('.header-list-box').find('.header-li').hover(function(){
		        $(this).addClass('active').siblings().removeClass('active');
		        $('.swiper-box-out').css('height',570);

		    },function(){
		        $(this).removeClass('active');
		        $('.swiper-box-out').css('height','auto');
		    }
		    );
		    $(".header-li").find("a").click(function(e){
		    	
		    	var id = $(this).attr("id");
		    	var url = $(this).attr("url");
		    	var name = $(this).attr("name");
		    	if(url!=null&&url!=undefined&&url!=''&&url!='null'){
		    		//$(this).parent().parent().parent().parent().parent().find(".header-li").removeClass('selected');
		    		$("#nav_menu").find(".selected").removeClass('selected');
		    		$(this).parent().addClass('selected').siblings().removeClass('selected');
		    		//$("#nav_menu").find(".selected_ellipse").removeClass('selected_ellipse');//selected_ellipse
		    		//$(this).parent().addClass('selected_ellipse').siblings().removeClass('selected_ellipse');
                    document.cookie = "name" + "="+ escape(id)+ ";path=/";
		    		tabadd(id,name,url,false);//把tab添加到当前页面
		    	}
		    	if(urlStatic!=null){
					$('.title[name="指标统计"]').attr('url',urlStatic);
				}
		    });
		    
		}
		//要跳转到某个菜单栏
		var skipMenu=function(skipResId){
			var head_list = $(".header-list-box");
			for(var i=0;i<head_list.length;i++){
				var head_list_li = $(head_list[i]).find(".header-li a");
				for(var j=0;j<head_list_li.length;j++){
					var menuId = $(head_list_li[j]).attr("id");
					if(menuId==skipResId){
						$(head_list_li[j]).trigger("click");
					}
				}
			}
		}
		/**
		 * 添加tab并切换到当前页面
		 * isXz:true:下钻添加
		 * isXz:false:菜单添加
		 */
		var tabadd=function(id,name,url,isXz){
			var flag=true;//判断是否重复，如果已经存在，则定位到此tab项
			for(var i=0;i<resList.length;i++){
				if(resList[i]==id){
					flag=false;
					break;
				}
			}
			if(initAppParams.confPageIsxz=='1'){
				var height=$(window).height()-60-40;
				/*
				 * 判断是否是图片
				 * var p = url.lastIndexOf(".");
				var ext=url.substring(p,url.length).toUpperCase();
				if(ext==".BMP"||ext==".PNG"||ext==".GIF"||ext==".JPG"||ext==".JPEG"){
					var img = new Image();
					// 改变图片的src
					img.src = url;
					img.onload = function(){
						height=img.height;
					};
				}*/
				var html='<iframe name="content_frame" scrolling="no" frameborder="0" width=100% height='+height+' src="'+url+'"></iframe>';
				layui.use('element', function(){
					var element = layui.element;
					if(flag){
						if(isXz){
							element.tabAdd('theme_tabs', {
								title: name,
								content: html, //支持传入html
								id: id
							});
						}else{
							tabDeleteList();
							element.tabAdd('theme_tabs', {
								title: name,
								content: html, //支持传入html
								id: id
							});
							currentShowResId=id;
						}
						resList.push(id);
					}
					//delTabBtn(currentShowResId);
					//setTimeout("delTabBtn('"+currentShowResId+"')",20);
					setTimeout("delTabBtn('"+currentShowResId+"')",50);
					element.tabChange('theme_tabs', id);
				});
				$(".layui-tab-close").click(function(){
					var resid = $($(this).parent()[0]).attr("lay-id");//.attr("id")
					for(var i=0;i<resList.length;i++){
						if(resid==resList[i]){
							resList.splice(i,1);
							break;
						}
					}
					//delTabBtn(currentShowResId);
					//setTimeout("delTabBtn('"+currentShowResId+"')",20);
					setTimeout("delTabBtn('"+currentShowResId+"')",50);
				});
			}else{
				if(flag){
					$("#content_frame").attr("src",url);
					resList[0]=id;
					currentShowResId=id;
					$.ajax({
						url:$BASEPATH+"/accessMenuLog.action",
						data:{'resId':id},
						type:'post',
						success:function(data){
							
						},
						dataType:'json'
					});
				}
			}
		}
		/**
		 * 删除tab选项卡上面的x
		 */
		var delTabBtn=function(currentShowResId){
			var tabList = $('.layui-tab-title li');
			for(var i=0;i<tabList.length;i++){
				var id = $(tabList[i]).attr("lay-id");
				if(id == currentShowResId){
					$(tabList[i]).find("i").remove();
				}
			}
		}
		/**
		 * 删除tab选项
		 */
		var tabDelete=function(id){
			layui.use('element', function(){
				var element = layui.element;
				element.tabDelete('theme_tabs', id);
			});
			for(var i=0;i<resList.length;i++){
				if(id==resList[i]){
					resList.splice(i,1);
					break;
				}
			}
		}
		/**
		 * 删除tab列表
		 */
		var tabDeleteList=function(){
			for(var i=0;i<resList.length;i++){
				layui.use('element', function(){
					var element = layui.element;
					element.tabDelete('theme_tabs', resList[i]);
				});
			}
			resList=[];//重置资源菜单列表
		}
		//初始化显示首页
		var initShowPage=function(resourcesList){
			for(var i=0;i<resourcesList.length;i++){
				if(resourcesList[i].resContent!=null&&resourcesList[i].resContent!=undefined&&resourcesList[i].resContent!=''){
					resourcesList[i].isFirst=true;
					tabadd(resourcesList[i].resId,resourcesList[i].resName,resourcesList[i].resContent,false);
					return ;
				}else{
					if(resourcesList[i].childRes){
						initShowPage(resourcesList[i].childRes);
					}
				}
			}
		}
		//业务域切换事件添加
		var initDomainClick=function(){
		    var tool = $('.left-tool');
		    var list = $('.left-tool-list');
		    var li   = $('.left-tool-list li')

		    $(tool).hover(function(){
		        $(list).show();
		        $('.white-icon').hide();
		        $(tool).addClass('active');
		        $(li).addClass('hover').siblings().removeClass('active');
		    },function(){
		        $(list).hide();
		        $('.white-icon').show();
		        $(tool).removeClass('active');
		        $(li).removeClass('hover');
		    });
		    $('.left-tool-list li').find('a').click(function(e){
		    	var resid= $(this).attr("id");
		    	var name = $(this).attr("name");
		    	var url = $(this).attr("url");
		    	$("#system_name").text(name);
		    	autoSystemName(name);
                document.cookie = "name" + "="+ escape(resid)+ ";path=/";
		    	for(var i=0;i<resources.length;i++){
					if(resources[i].resId==resid){
						if(resources[i].childRes){
                            var key = "name";
                            var date = new Date();
                            date.setTime(date.getTime() - 10000);
                            var result = document.cookie.match(new RegExp("(^| )name=([^;]*)(;|$)"));
                            if(result){
                                var delValue = result[2];
                            }
                            if (!!delValue) {
                                document.cookie = key+'='+delValue+';expires='+date.toGMTString()+ ";path=/";
                            }
							initNavbar(resources[i].childRes);
						}else{
							tabadd(resid,name,url,false);
							initNavbar();
						}
					}
				}
		    	swiper.slideTo(0, 100, false);
		    });
		}
		/**
		 * 获取系统升级日志，升级后三天会提示，三天之后不会提示,
		 */
		var getSystemUpgradeLog=function(upgrade_hint_count){
			if(upgrade_hint_count!='1'){
				$.ajax({
				url:$BASEPATH+"/upgrade/getSystemUpgrade.action",
				type:'post',
				success:function(data){
					if(data==''||data==null||data==undefined){
						
					}else{
						var html="<div style='padding:5px;'>"+data.content+"</div>";
						layer.open({
							type: 1,
							title:'升级日志',
							maxmin: true,
							skin: 'layui-layer-rim', //加上边框
							area: ['500px', '320px'], //宽高
							content: html,
							btn: ['不再提示', '关闭'],
							btnAlign: 'c', //按钮居中
							yes: function(){
								$.ajax({
									url:$BASEPATH+"/upgrade/saveUserNotPrompt.action",
									data:{'upgradeId':data.id},
									type:'post',
									success:function(data){
										layer.closeAll();
										/*debugger;
										 var index = parent.layer.getFrameIndex(window.name); 
										 var index2 = layer.getFrameIndex(window.name); 
							             parent.layer.close(index); 
							             parent.layer.close(index2);*/
									},
									dataType:'json'
								});
								layer.closeAll();
							}
							,btn2: function(){
								layer.closeAll();
								//console.log("这里是：关闭按钮");
							}
						});
					}
				},
				dataType:'json'
			});
			}
		}
		/**
		 * 通过传入的二级菜单判断是否有三级菜单或者是四级菜单
		 */
		var menuLevel=function(resource){
			var level=2;
			if(resource.childRes){//三级菜单
				level=3;
				var reslist = resource.childRes;
				for(var i=0;i<reslist.length;i++){
					if(reslist[i].childRes){//四级菜单
						level=4;
						break;
					}
				}
			}
			return level;
		};
		/**
		 * 判断是否是固定报表下的菜单ID
		 * true：是
		 * false：否
		 */
		var isGdbb=function(resid){
			if(initAppParams.reportResId==''){
				return false;
			}
			var resList = newApp.getGdbbChildList();
			if(resList&&resList.length>0){
				for(var i=0;i<resList.length;i++){
					if(resid==resList[i].resId){
						return true;
					}
				}
			}
			return false;
		}
		//生成随机的四个字符
	    function S4() {
	        return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	    }
		return {
			init:function(params) {
				systemId=params.resId;
				//获取当前登陆人的基本信息和可以访问的资源集合
				$.post(url, {resId:params.resId}, function(result){
					if(result){
						resources = result.menuResource;
						userInfo = result.user;
						sysName = result.sysName;
						initAppParams.confPageIsxz=result.config.confPageIsxz;
						initAppParams.confPageNavCount=result.config.confPageNavCount;
					}
					//初始化登录人员信息
					initUser();
                    var result = document.cookie.match(new RegExp("(^| )name=([^;]*)(;|$)"));
					//顶部菜单
					if(null == params.currentResId){
                      	if(result){
                            var id = result[2];
                            initDomain(id);
						}else {
                            initDomain(params.currentResId);
						}
					}else {
						if(result){
                            var id = result[2];
                            initDomain(id);
						}else {
                            initDomain(params.currentResId);
                        }
                    }
                    //如果URL连接中指定URL则跳转到指定的URL连接中去
					skipMenu(params.skipResId);
					//获取系统升级日志
					getSystemUpgradeLog(params.upgrade_hint_count);
				}, "json");
			},
			addTab:function(id,name,url,isXz){
				tabadd(id,name,url,isXz);
			},
            //cookie失效
            delCookie:function(){
				var key = "name";
				var date = new Date();
				date.setTime(date.getTime() - 10000);
                var result = document.cookie.match(new RegExp("(^| )name=([^;]*)(;|$)"));
                if(result){
                	var delValue = result[2];
				}
				if (!!delValue) {
					document.cookie = key+'='+delValue+';expires='+date.toGMTString()+ ";path=/";
				}

			},
			//根据url地址获取导航栏菜单地址
			addTabClick:function(id,name,url,isXz){
				var flag=true;
				var head_list = $(".header-list-box");
				for(var i=0;i<head_list.length;i++){
					var head_list_li = $(head_list[i]).find(".header-li a");
					for(var j=0;j<head_list_li.length;j++){
						var menuUrl = $(head_list_li[j]).attr("url");
						//如果有参数则去掉参数
						if(menuUrl.indexOf("?")!=-1){
							menuUrl=menuUrl.substring(0,menuUrl.indexOf("?"));
						}
						if(url.indexOf(menuUrl)!=-1){
							$(head_list_li[j]).attr("url",url);
							//跳转到当前页面
							/*var currentNavPage = swiper.realIndex;//获取当前页码下标：从0开始
							var page =parseInt(index/initAppParams.confPageNavCount);
							if(currentNavPage!=page){
								swiper.slideTo(page);
							}*/
							var currentNavPage = swiper.realIndex;//获取当前页码下标：从0开始
							if(currentNavPage!=i){
								swiper.slideTo(i);
							}
							//模拟触发点击事件
							$(head_list_li[j]).trigger("click");
							$(head_list_li[j]).attr("url",menuUrl);
							flag=false;
							return ;
						}
					}
				}
				if(flag){
					tabadd(id,name,url,isXz);
				}
				/*$(".header-list-box").each(function(index){
					$(this).find(".header-li a").each(function(a_Index){
						var menuUrl =$(this).attr("url");
						//如果有参数则去掉参数
						if(menuUrl.indexOf("?")!=-1){
							menuUrl=menuUrl.substring(0,menuUrl.indexOf("?"));
						}
						if(url.indexOf(menuUrl)!=-1){
							$(this).attr("url",url);
							//跳转到当前页面
							var currentNavPage = swiper.realIndex;//获取当前页码下标：从0开始
							var page =parseInt(index/initAppParams.confPageNavCount);
							if(currentNavPage!=page){
								swiper.slideTo(page);
							}
							var currentNavPage = swiper.realIndex;//获取当前页码下标：从0开始
							if(currentNavPage!=index){
								swiper.slideTo(index);
							}
							//模拟触发点击事件
							$(this).trigger("click");
							$(this).attr("url",menuUrl);
							return ;
						}
					});
				});*/
				/*$(".header-li").each(function(index){
					var menuUrl = $(this).find("a").attr();
					//console.log(menuUrl);
					//如果有参数则去掉参数
					if(menuUrl.indexOf("?")!=-1){
						menuUrl=menuUrl.substring(0,menuUrl.indexOf("?"));
					}
					if(url.indexOf(menuUrl)!=-1){
						$(this).find("a").attr("url",url);
						//跳转到当前页面
						var currentNavPage = swiper.realIndex;//获取当前页码下标：从0开始
						var page =parseInt(index/initAppParams.confPageNavCount);
						if(currentNavPage!=page){
							swiper.slideTo(page);
						}
						//模拟触发点击事件
						$(this).find("a").trigger("click");
					}
				});*/
			},
			//生成UUID
			guid:function(){
				return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
			},
			//获取当前菜单ID
			getcurrMenuRes:function(){
				return currentShowResId;
			},
			//获取当前所有菜单
			getResources:function(){
				return resources;
			},//返回当前菜单的子菜单列表
			getcurrMenuResList:function(){
				var resid = this.getcurrMenuRes();
				var currentResObj = queryCurrentObj(resources,resid);
				var resList =[];
				return getchildResList(currentResObj,resList);
			},//获取固定报表下的子菜单列表
			getGdbbChildList:function(){
				var gdbbResId = initAppParams.reportResId;
				var currentResObj = queryCurrentObj(resources,gdbbResId);
				if(null==currentResObj){
					return null;
				}else{
					return currentResObj.childRes;
				}
			},//获取子菜单列表
			getChildList:function(){
				var resid = this.getcurrMenuRes();
				var currentResObj = queryCurrentObj(resources,resid);
				return currentResObj.childRes;
			}
		}

}();

//自动业务字体大小
function autoSystemName(value){
	$("#system_name").css("line-height","25px");
	$("#system_name").css("margin-top","5px");
	if(value.length>6&&value.length<=9){
		$("#system_name").css("font-size","20px");
	}else if(value.length>9){
		$("#system_name").css("font-size","15px");
	}else{
		$("#system_name").css("font-size","25px");
	}
}
/**
 * 寻找当前resid的对象
 * @param ResObj
 * @param resId
 */
function queryCurrentObj(ResObj,resId){
	var obj =null;
	for(var i=0;i<ResObj.length;i++){
		if(ResObj[i]!=null&&ResObj[i].resId==resId){
			obj= ResObj[i];
			break;
		}
		if(ResObj[i].childRes!=null){
			var value = queryCurrentObj(ResObj[i].childRes,resId);
			if(value!=null){
				return value;
			}
		}
	}
	return obj;
}
/**
 * 根据当前对象，获取子菜单列表
 * @param currentResObj
 */
function getchildResList(currentResObj,arrayRes){
	arrayRes.push(currentResObj.resId); 
	var childResList =currentResObj.childRes;
	if(childResList!=undefined&&childResList!=null&&childResList.length>0){
		for(var i=0;i<childResList.length;i++){
			if(childResList[i]!=null){
				getchildResList(childResList[i],arrayRes);
			}
		}
	}
	return arrayRes;
}
var urlStatic=null;
var indexCountEvent=function (url){
	urlStatic=url.split("?")[0];
	$('.title[name="指标统计"]').attr('url',url);
	$('.title[name="指标统计"]').trigger('click');
};
//修改密码
function showModifyPass(){
	var index2=layer.open({
        type: 1,
        skin: 'layui-layer-demo', //样式类名
        title:'修改密码',
        area: ['320px', '210px'], //宽高
        content: $('#module2')
    });
	$('#oldPass').val('');
	$('#newPass1').val('');
	$('#newPass2').val('');
}
function modifyPass(){
	$.ajax({
		url:$BASEPATH+"/modifyPass.action",
		method:'post',
		data:{'oldPass':$('#oldPass').val(),'newPass1':$('#newPass1').val(),'newPass2':$('#newPass2').val()},
		dataType:"json",
		success:function(data){
			if(data.flag){
				layer.closeAll();
			}
			window.top.layer.msg(data.message);
		},
		error:function(){
			$.messager.alert('错误','添加出错，请稍候再试！',"error");
			return;
		}
	});
} 	