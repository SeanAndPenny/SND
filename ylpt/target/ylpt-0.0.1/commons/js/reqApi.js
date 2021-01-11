(function($) {
	$.fn.reqApp = {
		//该插件的基本信息
		/*Info: {
			baseUrl: "http://localhost:8080/api/",
			authorization: "authorization"
		},*/
		Info: {
			baseUrl: "http://192.168.153.57:7001/bzgl/",
			authorization: "authorization"
		},
		ajaxReq:function(paramObj){
			//this.refresh();
			this.ajaxReqa(paramObj);
		},
		//具有参数的函数对象，这里参数是一个对象，具有属性
		ajaxReqa: function(paramObj) {
			//使用参数，是否使用默认值
		
			var params = paramObj ? paramObj : null;
			if(params == null) {
				window.alert("请求参数不能为空！");
				return;
			};
			var thisUrl = this.getAuthorizationUrl(paramObj);
			if(paramObj.iscurl) {
				thisUrl = paramObj.url;
			}

			if (thisUrl.indexOf("?") > 0)
				thisUrl = thisUrl+"&_dc="+ (new Date()).valueOf();
			else thisUrl=thisUrl+"?_dc="+ (new Date()).valueOf();


			if(paramObj.async==undefined) paramObj.async=true;
			if(paramObj.iscurl==undefined) paramObj.iscurl=false;
			if(paramObj.method==undefined) paramObj.method="GET";
			if(paramObj.contentType==undefined) paramObj.contentType="application/json;charset=UTF-8";
			if(paramObj.isConvert == undefined || paramObj.isConvert) paramObj.data = JSON.stringify(paramObj.data);
			if(paramObj.processData==undefined) paramObj.processData=true;

			$.ajax({
				url: thisUrl,
				type: paramObj.method,
				contentType: paramObj.contentType, //关键是要加上这行
				traditional: true, //这使json格式的字符不会被转码
				headers: {
					"authorization": sessionStorage.getItem('TOKEN') //$.session.get("TOKEN")
				},
				data: paramObj.data,
				async: paramObj.async,
				processData:paramObj.processData,
				cache: false,
				//timeout: 30000,
				xhrFields: {
					withCredentials: true
				},
				crossDomain: true,
				success: function(data) {
					if(data["code"] == 1) {
						if(paramObj.success){
							paramObj.success(data["data"]);
						}
					} else if(data["code"] == 401) {
						//window.parent.parent.location.href = "login.html";
						$(this).reqApp.gotoLogin();
					}					
					else {
						if(paramObj.error) {
							paramObj.error(data);
						} else {
							Console.log("失败,:" + data["error"]);
						}
					}

				},
				error: function(textStatus, errorThrown) {
					if(textStatus.status==401 || textStatus.status==0){
						$(this).reqApp.gotoLogin();
						return;
					}
					if(paramObj.error) {
						paramObj.error($.parseJSON(textStatus.responseText));
					} else {
						Console.log(textStatus.responseText);
					}
				},
				beforeSend: function() {
					if(paramObj.beforeSend) {
						paramObj.beforeSend();
					}
				},
				complete: function() {
					if(paramObj.complete) {
						paramObj.complete();
					}
				}
			});
		},

		signIn: function(accountCode, passward, successFun, errorFun) {
			paramObj = {
				url: "login/signIn",
				iscurl: false,
				method: "POST",
				data: {
					"userid": accountCode,
					"password": passward
				},
				success: function(data) {
					sessionStorage.setItem("TOKEN", data['userId'] + '_' + data['token']);
					sessionStorage.setItem("USERNAME", data['userName']);
					//sessionStorage.setItem("RESOURCES", data['resourceList']);	
					sessionStorage.setItem("LOGINNAME", data.user.loginname);	
					successFun(data);
					window.location.href = "./index.html";
				},
				error: function(e) {

					errorFun(e);
				},
				beforeSend: null,
				complete: null
			};

			this.ajaxReqa(paramObj);
		},
		gotoLogin:function(){
			//window.parent.parent.location.href = $(this).reqApp.Info.baseUrl+"login/oosouth";
			window.parent.parent.location.href = "/login.html";
		},
		signUp: function() {

			var successFun = function(data) {
				//$.session.clear();
				sessionStorage.clear();
				$(this).reqApp.gotoLogin();
			};
			paramObj = {
				url: "login/signUp",
				iscurl: false,
				method: "POST",
				success: successFun,
				error: null,
				beforeSend: null,
				complete: null
			};
			this.ajaxReqa(paramObj);
		},
		
		refresh:function(){
			var t = sessionStorage.getItem("TOKEN");

			if(t=="" || t==undefined){
				$(this).reqApp.gotoLogin();
				return;
			}
			var errorFun = function(e) {
				//$.session.clear();
				sessionStorage.clear();
				$(this).reqApp.gotoLogin();
			};
			paramObj = {
				url: "login/refresh",
				iscurl: false,
				method: "POST",
				success: null,
				error: errorFun,
				beforeSend: null,
				complete: null
			};
			this.ajaxReqa(paramObj);
		},
		
		/*
		 * {"url":"",
		 * ptype:"0",
		 * "params":[{name:"",value:""},{name:"",value:""}]
		 * }
		 * {"url":"",
		 * ptype:"1",
		 * "params":["",""]
		 * }
		 */
		getFile:function(paramObj){
			 window.location.href = this.getAuthorizationUrl(paramObj) ;
		},
		getAuthorizationParams:function(){
			
			return this.Info.authorization+"="+sessionStorage.getItem('TOKEN');
		},
		getAuthorizationUrl:function(paramObj){
			var params = paramObj ? paramObj : null;
			if(params == null) {
				window.alert("请求参数不能为空！");
				return;
			};
			var thisUrl = this.Info.baseUrl + params.url;
			if(params.ptype==undefined) params.ptype="0";
			var ps="";
			//传统方式拼接参数
			var p = params.params;
			if(p==undefined||p==""||p==null) p =[];
			
			if(params.ptype=="0"){
				for(var i=0;i<p.length;i++){
					ps = ps +"&"+p[i]["name"]+"="+ (p[i]["value"]);
				}

				if(thisUrl.indexOf("?")>0){
					thisUrl =thisUrl+"&"+this.getAuthorizationParams()+ps;

				}else
					thisUrl =thisUrl+"?"+this.getAuthorizationParams()+ps;
			}
			//REST方式传参
			else{
				for(var i=0;i<p.length;i++){
					ps = ps +"/"+ (p[i]);
				}	
				thisUrl =thisUrl+ps+";"+this.getAuthorizationParams();
			}
			return thisUrl;
		},
		OosOuthLogin:function(jsid){
			sessionStorage.setItem("TOKEN",jsid);
			window.location.href = "web/index.html";
		}

	};
})(jQuery);