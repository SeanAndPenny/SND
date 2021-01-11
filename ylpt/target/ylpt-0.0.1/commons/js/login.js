/**
 * 登录页js
 */

//如果登录页面在框架中,则跳出框架
if(window.parent.length>0) window.parent.location=location;

$(function(){
	var $btn = $("#btn");
	var $name = $("[name=name]");
	var $pass = $("[name=pass]");
	//绑定用户名称
	
	$btn.click(function(){
		if($name.val() ==''){
			$("#notice").html("请输入用户名");
			return;
		}
		
		if($pass.val() ==''){
			$("#notice").html("请输入密码");
			return;
		}
		
		$("#notice").html("<img src='../common/images/gif-wait.gif'/>  正在登录...");
			
		$(this).reqApp.signIn(
			$name.val(),
			$pass.val(),
			function(data){
				$("#notice").html("登陆成功，正在跳转！");		
			},
			function(e){
				$("#notice").html(e.error);	
			}
		);
	});
});

function onEnterDown(){
	if (event.keyCode == 13) {
          event.returnValue=false;
          document.getElementById("btn").click();
      }
}
