<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HRWebApp.login" %>
<html lang="en-us" id="lock-page">
    <head>
		<meta charset="utf-8">
		<title>Хүний нөөцийн удирдлагын мэдээллийн систем</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> 
		<link rel="stylesheet" type="text/css" media="screen" href="css/lockscreen.min.css">
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
		<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
	</head>
    <body>
		<div id="main" role="main">
			<form id="login-form" class="lockscreen animated fadeInDown smart-form" action="#">
				<div class="logo">
					<h1 class="semi-bold"><img src="img/logo-o.png" alt="Хүний нөөцийн удирдлагын мэдээллийн систем" /> HRMIS</h1>
				</div>
				<div class="row no-padding">
                    <div class="col-sm-8">
                        <fieldset style="padding: 25px 35px;">									
							<section>
								<label class="label font-lg margin-bottom-10">Нэвтрэх нэр</label>
								<label class="input"> <i class="icon-append fa fa-user"></i>
									<input type="text" id="loginUsername" name="loginUsername" style="border-radius: 10px;">
									<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Нэвтрэх домайн нэр оруулна уу</b>
								</label>
							</section>
							<section>
								<label class="label">Нууц үг</label>
								<label class="input">
                                    <i class="icon-append fa fa-lock"></i>
									<input type="password" id="loginPassword" name="loginPassword" style="border-radius: 10px;">
									<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Нууц үг оруулна уу</b>
								</label>
							</section>
                            <section id="errSection" style="margin: 5px 0 0 0;"></section>
						</fieldset>
                        <footer>
							<button id="login-btn" type="submit" class="btn btn-primary" style="border-radius: 10px;">
								Нэвтрэх
							</button>
						</footer>
                    </div>
                    <div class="col-sm-4 hidden-xs text-align-center" style="background-color:#1f38a2; height: 105%;">
                        <img src="img/mof_white.png" alt="Сангийн яам" style="height:40px; margin-top: 99px;"/>
                    </div>
				</div>
				<p class="font-xs margin-top-5">
					Хүний нөөцийн удирдлагын мэдээллийн систем | Монгол Улсын Сангийн яам © 2019
				</p>
			</form>
		</div>
		<script src="js/plugin/pace/pace.min.js"></script>
	    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script> if (!window.jQuery) { document.write('<script src="js/libs/jquery-2.1.1.min.js"><\/script>');} </script>
	    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script> if (!window.jQuery.ui) { document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');} </script>
		<script src="js/app.config.js"></script>
		<script src="js/bootstrap/bootstrap.min.js"></script>
		<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>
		<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>
		<script src="js/app.min.js"></script>
        <script type="text/javascript">
			$(function() {
				$("#login-form").validate({
				    rules: {
				        loginUsername: {
				            required: true
				        },
				        loginPassword: {
				            required: true
				        }
				    },
				    messages: {
				        loginUsername: {
				            required: 'Нэвтрэх домайн нэр оруулна уу'
				        },
				        loginPassword: {
				            required: 'Нууц үг оруулна уу'
				        }
				    },
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent());
					},
					submitHandler: function (form) {
					    $("#login-btn").html('<i class="fa fa-refresh fa-spin"></i> Нэвтрэх');
                        $("#login-btn").prop('disabled', true);
                        var jsonData = {};
                        jsonData.pUsername = $.trim($('#loginUsername').val());
                        jsonData.pPass = $.trim($('#loginPassword').val());
					    $.ajax({
					        type: "POST",
					        //url: "../ws.aspx/CheckLogin",
                            url: "../webservice/ServiceMain.svc/CheckLogin",
					        data: JSON.stringify(jsonData),
					        contentType: "application/json; charset=utf-8",
					        dataType: "json",
					        success: function (msg) {
					            $('#errSection').html('');
					            $("#login-btn").html('Нэвтрэх');
					            $("#login-btn").prop('disabled', false);
					            if (window.location.hash != '') window.location = '../' + window.location.hash;
					            else window.location = '../#pg/dashboard.aspx?t=f';
					        },
					        failure: function (response) {
					            alert(response.d);
					        },
					        error: function (xhr, status, error) {
					            var err = eval("(" + xhr.responseText + ")");
					            $('#errSection').html('<div class="alert alert-danger fade in" style="margin:0; padding:5px;"><button class="close" data-dismiss="alert">×</button>' + err.Message + '</div>');
					            $("#login-btn").html('Нэвтрэх');
					            $("#login-btn").prop('disabled', false);
					        }
					    });
					}
				});
			});
		</script>
	</body>
</html>