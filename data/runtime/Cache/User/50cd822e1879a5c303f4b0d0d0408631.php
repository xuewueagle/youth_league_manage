<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<title>共青团信息管理系统</title>
<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
<meta name="description" content="<?php echo ($site_seo_description); ?>">
	<?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
	<?php $portal_index_lastnews="1,2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.2.0发布啦！", "slide_pic"=>$tmpl."Public/assets/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta name="author" content="ThinkCMF">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

   	<!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	<link rel="icon" href="/youth_league_manage/themes/simplebootx/Public/assets/images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/youth_league_manage/themes/simplebootx/Public/assets/images/favicon.ico" type="image/x-icon">
    <link href="/youth_league_manage/themes/simplebootx/Public/assets/simpleboot/themes/simplebootx/theme.min.css" rel="stylesheet">
    <link href="/youth_league_manage/themes/simplebootx/Public/assets/simpleboot/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="/youth_league_manage/themes/simplebootx/Public/assets/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="/youth_league_manage/themes/simplebootx/Public/assets/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link href="/youth_league_manage/themes/simplebootx/Public/assets/css/style.css" rel="stylesheet">
	<style>
		/*html{filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);-webkit-filter: grayscale(1);}*/
		#backtotop{position: fixed;bottom: 50px;right:20px;display: none;cursor: pointer;font-size: 50px;z-index: 9999;}
		#backtotop:hover{color:#333}
		#main-menu-user li.user{display: none}
	</style>
	
</head>

<body class="body-white">
	

	<div class="container tc-main">
		<div class="row">
			<div class="span4 offset4">
				<h2 class="text-center">用户注册</h2>

				<div class="tab-content">
					<div class="tab-pane active" id="email">
						<form class="form-horizontal js-ajax-form" action="<?php echo U('user/register/doregister');?>" method="post">
		
							<div class="control-group">
								<input type="text" name="email" placeholder="邮箱" class="span4">
							</div>
		
							<div class="control-group">
								<input type="password" name="password" placeholder="密码" class="span4">
							</div>
							
							<div class="control-group">
								<input type="password" name="repassword" placeholder="重复密码" class="span4">
							</div>

							<div class="control-group">
								<select name="dept" style="width:368px;">
									<option value="0">--请选择所属院系--</option>
									<?php if(is_array($dept)): foreach($dept as $key=>$vo): ?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["name"]); ?></option><?php endforeach; endif; ?>
								</select>
							</div>
		
							<div class="control-group">
								<div class="span4" style="margin-left: 0px;">
									<input type="text" name="verify" placeholder="验证码" style="width:252px;">
									<?php echo sp_verifycode_img('length=4&font_size=14&width=100&height=34&charset=1234567890&use_noise=1&use_curve=0');?>
								</div>
								
							</div>
		
							<div class="control-group">
								<button class="btn btn-primary js-ajax-submit span4" type="submit" data-wait="1500" style="margin-left: 0px;">确定注册</button>
							</div>
		
							<div class="control-group" style="text-align: center;">
								<p>
									已有账号? <a href="<?php echo leuu('admin/public/login');?>">点击此处登录</a>
								</p>
							</div>
						</form>
					
					</div>
				</div>
				
			</div>
		</div>

		<br>
<br>
<br>
<!-- Footer ================================================== -->
<hr>
<?php echo hook('footer');?>
<div id="footer">
	<p>
		Made by 计算机科学与网络安全学院
	</p>
</div>



	</div>
	<!-- /container -->

	<script type="text/javascript">
//全局变量
var GV = {
    ROOT: "/youth_league_manage/",
    WEB_ROOT: "/youth_league_manage/",
    JS_ROOT: "public/js/"
};
</script>
   <!-- Placed at the end of the document so the pages load faster -->
   <script src="/youth_league_manage/public/js/jquery.js"></script>
   <script src="/youth_league_manage/public/js/wind.js"></script>
   <script src="/youth_league_manage/themes/simplebootx/Public/assets/simpleboot/bootstrap/js/bootstrap.min.js"></script>
   <script src="/youth_league_manage/public/js/frontend.js"></script>
<script>
$(function(){
	$('body').on('touchstart.dropdown', '.dropdown-menu', function (e) { e.stopPropagation(); });
	
	$("#main-menu li.dropdown").hover(function(){
		$(this).addClass("open");
	},function(){
		$(this).removeClass("open");
	});
	
	$.post("<?php echo U('user/index/is_login');?>",{},function(data){
		if(data.status==1){
			if(data.user.avatar){
				$("#main-menu-user .headicon").attr("src",data.user.avatar.indexOf("http")==0?data.user.avatar:"<?php echo sp_get_image_url('[AVATAR]','!avatar');?>".replace('[AVATAR]',data.user.avatar));
			}
			
			$("#main-menu-user .user-nicename").text(data.user.user_nicename!=""?data.user.user_nicename:data.user.user_login);
			$("#main-menu-user li.login").show();
			
		}
		if(data.status==0){
			$("#main-menu-user li.offline").show();
		}
		
		/* $.post("<?php echo U('user/notification/getLastNotifications');?>",{},function(data){
			$(".nav .notifactions .count").text(data.list.length);
		}); */
		
	});	
	;(function($){
		$.fn.totop=function(opt){
			var scrolling=false;
			return this.each(function(){
				var $this=$(this);
				$(window).scroll(function(){
					if(!scrolling){
						var sd=$(window).scrollTop();
						if(sd>100){
							$this.fadeIn();
						}else{
							$this.fadeOut();
						}
					}
				});
				
				$this.click(function(){
					scrolling=true;
					$('html, body').animate({
						scrollTop : 0
					}, 500,function(){
						scrolling=false;
						$this.fadeOut();
					});
				});
			});
		};
	})(jQuery); 
	
	$("#backtotop").totop();
	
	
});
</script>


</body>
</html>