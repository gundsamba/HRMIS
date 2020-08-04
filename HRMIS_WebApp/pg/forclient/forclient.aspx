<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forclient.aspx.cs" Inherits="HRWebApp.pg.forclient.forclient" %>

<!doctype html>  
<!--[if IE 6 ]><html lang="en-us" class="ie6"> <![endif]-->
<!--[if IE 7 ]><html lang="en-us" class="ie7"> <![endif]-->
<!--[if IE 8 ]><html lang="en-us" class="ie8"> <![endif]-->
<!--[if (gt IE 7)|!(IE)]><!-->
<html lang="en-us"><!--<![endif]-->
<head>
	<meta charset="utf-8">	
	<title>Сангийн Яам</title>	
	<meta name="description" content="">
	<meta name="author" content="MyOrange">
	<meta name="copyright" content="MyOrange">
	<meta name="generator" content="Documenter v2.0 http://rxa.li/documenter">
	<meta name="date" content="2014-11-24T00:00:00+01:00">	
	<link rel="stylesheet" href="assets/css/documenter_style.css" media="all">
	<link rel="stylesheet" href="assets/js/google-code-prettify/prettify.css" media="screen">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
	<script src="assets/js/google-code-prettify/prettify.js"></script>
	<%--<script src="assets/js/jquery.js"></script>--%>	
        <script src="../../js/libs/jquery-2.1.1.min.js"></script>
	    <script>
	        if (!window.jQuery) {
	            document.write('<script src="../../js/libs/jquery-2.1.1.min.js"><\/script>');
	        }
	    </script>
	<script src="assets/js/jquery.scrollTo.js"></script>
	<script src="assets/js/jquery.easing.js"></script>
	<script>document.createElement('section');var duration='500',easing='swing';</script>
	<script src="assets/js/script.js"></script>
	    <script src="../../js/bootstrap/bootstrap.min.js"></script>
	    <script src="../../js/plugin/fastclick/fastclick.min.js"></script>
	
	<style>
		html{background-color:#FFFFFF;color:#383838;}
		::-moz-selection{background:#444444;color:#DDDDDD;}
		::selection{background:#444444;color:#DDDDDD;}
		#documenter_sidebar #documenter_logo{background-image:url(assets/images/LogoMn.png);}
		a{color:#0000FF;}
		.btn {
			border-radius:3px;
		}
		.btn-primary {
			  background-image: -moz-linear-gradient(top, #0088CC, #0044CC);
			  background-image: -ms-linear-gradient(top, #0088CC, #0044CC);
			  background-image: -webkit-gradient(linear, 0 0, 0 0088CC%, from(#DDDDDD), to(#0044CC));
			  background-image: -webkit-linear-gradient(top, #0088CC, #0044CC);
			  background-image: -o-linear-gradient(top, #0088CC, #0044CC);
			  background-image: linear-gradient(top, #0088CC, #0044CC);
			  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088CC', endColorstr='#0044CC', GradientType=0);
			  border-color: #0044CC #0044CC #bfbfbf;
			  color:#FFFFFF;
		}
		.btn-primary:hover,
		.btn-primary:active,
		.btn-primary.active,
		.btn-primary.disabled,
		.btn-primary[disabled] {
		  border-color: #0088CC #0088CC #bfbfbf;
		  background-color: #0044CC;
		}
		hr{border-top:1px solid #EBEBEB;border-bottom:1px solid #FFFFFF;}
		#documenter_sidebar, #documenter_sidebar ul a{background-color:#DDDDDD;color:#222222;}
		#documenter_sidebar ul a{-webkit-text-shadow:1px 1px 0px #EEEEEE;-moz-text-shadow:1px 1px 0px #EEEEEE;text-shadow:1px 1px 0px #EEEEEE;}
		#documenter_sidebar ul{border-top:1px solid #AAAAAA;}
		#documenter_sidebar ul a{border-top:1px solid #EEEEEE;border-bottom:1px solid #AAAAAA;color:#444444;}
		#documenter_sidebar ul a:hover{background:#444444;color:#DDDDDD;border-top:1px solid #444444;}
		#documenter_sidebar ul a.current{background:#444444;color:#DDDDDD;border-top:1px solid #444444;}
		#documenter_copyright{display:block !important;visibility:visible !important;}

        /*#documenter_content section {
            padding-top: 700px;
        }*/
	</style>
	
</head>
<body class="documenter-project-smartadmin-v152">
	<div id="documenter_sidebar">
        <div>
            <div style="float:left; width:20%;">
                <img src="assets/images/LogoMn.png" style="width:170px; margin:40px 0 0 10px;"/>
            </div>
            <div style="float:left; width:40%;">
                <ul id="documenter_nav">
			        <li><a class="current" href="#s1">САНГИЙН ЯАМНЫ БҮТЭЦ</a></li>
			        <li><a href="#s2" title="ХҮЛЭЭГДЭЖ БУЙ ХӨРӨНГӨ ОРУУЛАЛТ">ХҮЛЭЭГДЭЖ БУЙ ХӨРӨНГӨ ОРУУЛАЛТ</a></li>
			        <%--<li><a href="#s3" title="САНГИЙН САЙДЫН БАГЦЫН БАТЛАГДСАН ТӨСӨВ">САНГИЙН САЙДЫН БАГЦЫН БАТЛАГДСАН ТӨСӨВ</a></li>--%>
			        <li><a href="#s4" title="САНГИЙН ЯАМНЫ БАТЛАГДСАН ТӨСӨВ">САНГИЙН ЯАМНЫ БАТЛАГДСАН ТӨСӨВ</a></li>
			        <li><a href="#s5" title="САНГИЙН ЯАМНЫ ТӨСВИЙН САРЫН ГҮЙЦЭТГЭЛ">САНГИЙН ЯАМНЫ ТӨСВИЙН САРЫН ГҮЙЦЭТГЭЛ</a></li>			    
		        </ul>
            </div>
		    <div style="float:left; width:40%;">
                <ul>
                    <li><a href="#s6" title="САНГИЙН ЯАМНЫ ҮЙЛ АЖИЛЛАГААНД ҮНЭЛГЭЭ ӨГӨХ">САНГИЙН ЯАМНЫ ҮЙЛ АЖИЛЛАГААНД ҮНЭЛГЭЭ ӨГӨХ</a></li>
			        <li><a href="#s7" title="САНГИЙН САЙДЫН ХЭРЭГЖҮҮЛЭХ ХӨТӨЛБӨР, ХӨТӨЛБӨРИЙН ХҮРЭХ ҮР ДҮН">САНГИЙН САЙДЫН ХЭРЭГЖҮҮЛЭХ ХӨТӨЛБӨР, ХӨТӨЛБӨРИЙН ХҮРЭХ ҮР ДҮН, ШАЛГУУР ҮЗҮҮЛЭЛТ</a></li>
			        <li><a href="#s8" title="САНГИЙН САЙДЫН БАГЦАД УЛСЫН ТӨСВИЙН ХӨРӨНГӨӨР ХЭРЭГЖҮҮЛЭХ ХӨРӨНГӨ ОРУУЛАЛТЫН ТӨСӨЛ, АРГА ХЭМЖЭЭ БАРИЛГА БАЙГУУЛАМЖЫН ЖАГСААЛТ" style="line-height: 12px;">САНГИЙН САЙДЫН БАГЦАД УЛСЫН ТӨСВИЙН ХӨРӨНГӨӨР ХЭРЭГЖҮҮЛЭХ ХӨРӨНГӨ ОРУУЛАЛТЫН ТӨСӨЛ, АРГА ХЭМЖЭЭ БАРИЛГА БАЙГУУЛАМЖЫН ЖАГСААЛТ</a></li>
			        <li><a href="#s9" title="ТУСГАЙ ЗӨВШӨӨРӨЛ">ТУСГАЙ ЗӨВШӨӨРӨЛ</a></li>
                </ul>
            </div>
        </div>
        <%--<div style="text-align:center; height:500px;">
            <img src="assets/images/Naadam2016.jpg" height="100%" />
        </div>--%>
	</div>
	<div id="documenter_content">
        <section id="s1">
            <div class="page-header">
	            <h1>САНГИЙН ЯАМНЫ БҮТЭЦ</h1>
            </div>
	        <p><img id="forclientSection1Img" runat="server" src="~/pg/forclient/assets/files/mof_organization_chart.png" style="width: 100%;" /></p>
	    </section>
        <section id="s2">
            <div class="page-header">
	            <h1>ЭРХ НЭЭГДЭЭД ХҮЛЭЭГДЭЖ БАЙГАА ХӨРӨНГӨ ОРУУЛАЛТЫН ЖАГСААЛТ</h1>
                <h2><span id="section2Year" runat="server">0000</span> оны <span id="section2Month" runat="server">00</span> сарын <span id="section2Day" runat="server">00</span> байдлаар</h2>
                <p>Та энэхүү жагсаалтыг <span style="text-decoration: underline; color: darkblue;">www.mof.gov.mn</span> вэб сайтын баруун талд байрлах <b>"Хүлээгдэж буй хөрөнгө оруулалт"</b> хэсгээс харах боломжтой.</p>
            </div>
            <div id="divsection2Content" runat="server" class="row"></div>
	    </section>
       <%-- <section id="s3">
            <div class="page-header">
	            <h1>САНГИЙН САЙДЫН БАГЦЫН БАТЛАГДСАН ТӨСӨВ</h1>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection3File" runat="server" src="assets/files/no_data.pdf" style="width:100%; min-height: 1184px;" /></p>
	    </section>--%>
        <section id="s4">
            <div class="page-header">
	            <h1>САНГИЙН ЯАМНЫ БАТЛАГДСАН ТӨСӨВ</h1>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection4File" runat="server" src="assets/files/no_data.pdf" style="width:100%; min-height: 1184px;" /></p>
	    </section>
        <section id="s5">
            <div class="page-header">
	            <h1>САНГИЙН ЯАМНЫ ТӨСВИЙН САРЫН ГҮЙЦЭТГЭЛ</h1>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection5File" runat="server" src="assets/files/no_data.pdf" style="width:100%; min-height: 1184px;" /></p>
	    </section>
        <section id="s6">
            <div class="page-header">
	            <h1>САНГИЙН ЯАМНЫ ҮЙЛ АЖИЛЛАГААНД ҮНЭЛГЭЭ ӨГӨХ</h1>
            </div>
            <p>
                Таньд энэ өдрийн мэндийг хүргэе...
                <br />
                <br />
                Таныг Сангийн яамны үйл ажиллагааны талаарх сэтгэл ханамжийн судалгаанд оролцож, биднийг цаашдын үйл ажиллагаагаа сайжруулахад хамтарч ажиллахыг хүсье.
                <br />
                <br />
                Та Сангийн яамны ямар газар хэлтсээр үйлчлүүлсэн бэ?
                <br />
                Газрын нэрэн дээр дарна уу
            </p>
            <div id="forclientSection6Div" runat="server" style="border: 1px solid #ddd; padding: 19px; border-radius: 2px;" class="row">
            
            </div>
	    </section>
        <section id="s7">
            <div class="page-header">
	            <h1>САНГИЙН САЙДЫН ХЭРЭГЖҮҮЛЭХ ХӨТӨЛБӨР, ХӨТӨЛБӨРИЙН ХҮРЭХ ҮР ДҮН, ШАЛГУУР ҮЗҮҮЛЭЛТ</h1>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection7File" runat="server" src="assets/files/no_data.pdf" style="width:100%; min-height: 1184px;" /></p>
	    </section>
        <section id="s8">
            <div class="page-header">
	            <h1>САНГИЙН САЙДЫН БАГЦАД УЛСЫН ТӨСВИЙН ХӨРӨНГӨӨР ХЭРЭГЖҮҮЛЭХ ХӨРӨНГӨ ОРУУЛАЛТЫН ТӨСӨЛ, АРГА ХЭМЖЭЭ БАРИЛГА БАЙГУУЛАМЖИЙН ЖАГСААЛТ</h1>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection8File" runat="server" src="assets/files/no_data.pdf" style="width:100%; min-height: 1184px;" /></p>
	    </section>
        <section id="s9">
            <div class="page-header">
	            <h1>ТУСГАЙ ЗӨВШӨӨРӨЛ</h1>
            </div>
            <div id="forclientSection9Div" runat="server" style="border: 1px solid #ddd; padding: 19px; border-radius: 2px;" class="row">
                <a class="btn" style="background-color: #3276b1; width: 100%; color: #FFF; margin-bottom: 10px;"" href="#s10">Аудитийн үйл ажиллагаа эрхлэх тусгай зөвшөөрөл</a>
                <a class="btn" style="background-color: #3276b1; width: 100%; color: #FFF; margin-bottom: 10px;"" href="#s11">Хөрөнгийн үнэлгээ хийх тусгай зөвшөөрөл</a>
                <a class="btn" style="background-color: #3276b1; width: 100%; color: #FFF; margin-bottom: 10px;"" href="#s12">Нягтлан бодох бүртгэлийн програм хангамжийн зөвшөөрөл</a>
                <a class="btn" style="background-color: #3276b1; width: 100%; color: #FFF; margin-bottom: 10px;"" href="#s13">Үнэт цаас үйлдвэрлэх тусгай зөвшөөрөл</a>
                <a class="btn" style="background-color: #3276b1; width: 100%; color: #FFF; margin-bottom: 10px;"" href="#s14">Татварын мэргэшсэн зөвлөх үйлчилгээ эрхлэх тусгай зөвшөөрөл</a>
                <a class="btn" style="background-color: #3276b1; width: 100%; color: #FFF; margin-bottom: 10px;"" href="#s15">Эд мөнгөний хонжворт сугалааны үйл ажиллагаа эрхлэх тусгай зөвшөөрөл</a>
            </div>
        </section>
        <section id="s10">
            <div class="page-header">
	            <h1>ТУСГАЙ ЗӨВШӨӨРӨЛ</h1>
                <h2>Аудитын үйл ажиллагаа эрхлэх тусгай зөвшөөрөл шинээр авахад бүрдүүлэх баримт бичгийн жагсаалт</h2>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection10File" runat="server" src="assets/files/1.1 Audit requirement.pdf" style="width:100%; min-height: 1184px;" /></p>
        </section>
        <section id="s11">
            <div class="page-header">
	            <h1>ТУСГАЙ ЗӨВШӨӨРӨЛ</h1>
                <h2>Хөрөнгийн үнэлгээний тухай хуулийн сонгон шалгаруулалтад оролцохыг хүсэгчийн бүрдүүлэх баримт бичиг</h2>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection11File" runat="server" src="assets/files/7.1 Property assessment.pdf" style="width:100%; min-height: 1184px;" /></p>
        </section>
        <section id="s12">
            <div class="page-header">
	            <h1>ТУСГАЙ ЗӨВШӨӨРӨЛ</h1>
                <h2>Нягтлан бодох бүртгэлийн програм хангамжийн зөвшөөрөл авахад шаардагдах материалууд</h2>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection12File" runat="server" src="assets/files/4.1 Accounting software requirement.pdf" style="width:100%; min-height: 1184px;" /></p>
        </section>
        <section id="s13">
            <div class="page-header">
	            <h1>ТУСГАЙ ЗӨВШӨӨРӨЛ</h1>
                <h2>Үнэт цаас үйлдвэрлэх тусгай зөвшөөрөл авахад бүрдүүлэх баримт бичиг</h2>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection13File" runat="server" src="assets/files/6.1 Үнэт цаас үйлдвэрлэх.pdf" style="width:100%; min-height: 1184px;" /></p>
        </section>
        <section id="s14">
            <div class="page-header">
	            <h1>ТУСГАЙ ЗӨВШӨӨРӨЛ</h1>
                <h2>Татварын мэргэшсэн зөвлөх үйлчилгээ эрхлэх тусгай зөвшөөрөл авахад бүрдүүлэх баримт бичиг</h2>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection140File" runat="server" src="assets/files/2.1 Tax requirement.pdf" style="width:100%; min-height: 1184px;" /></p>
        </section>
        <section id="s15">
            <div class="page-header">
	            <h1>ТУСГАЙ ЗӨВШӨӨРӨЛ</h1>
                <h2>Эд мөнгөний хонжворт сугалааны үйл ажиллагаа эрхлэх тусгай зөвшөөрөл олгох</h2>
            </div>
	        <p style="min-height: 1184px;"><embed id="forclientSection15File" runat="server" src="assets/files/3.1 Lotteries requirement.pdf" style="width:100%; min-height: 1184px;" /></p>
        </section>
	</div>
    <div id="forclientModal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="padding: 15px 15px;">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button">× </button>
                    <h4 class="modal-title" style="margin: 0px;">Үйлчлүүлэгчийн сэтгэл ханамжийн судалгаа</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="gazarID" class="form-group hide"></div>
                            <div id="srv1" style="display: block;">
                                <div class="form-group" style="margin-bottom: 15px; text-align: center; font-size: 18px;">
                                    <span id="gazarName"></span>-р үйлчлүүлээд та өөрийн хэрэгцээ, зорилгоо хангаж чадсан уу?
                                </div>
                                <div style="border: 1px solid #ddd; padding: 19px; border-radius: 2px;">
                                    <input type="button" value="ТИЙМ" class="btn" style="background-color: #71843f; width: 100%; color:#FFF; margin-bottom: 10px;" onclick="setSrv1(1, 1)" />
                                    <input type="button" value="ҮГҮЙ" class="btn" style="background-color: #a65858; width: 100%; color:#FFF; " onclick="setSrv1(1, 0)" />
                                </div>
                            </div>
                            <div id="srv2" style="display: none;">
                                <div class="form-group" style="margin-bottom: 15px; text-align: center; font-size: 18px;">
                                    Таны сэтгэл ханамжийн төвшин ямар байна?
                                </div>
                                <div style="border: 1px solid #ddd; padding: 19px; border-radius: 2px;">
                                    <input type="button" value="" style="background-color: #fff; border: none; width: 7%; height: 90px;" disabled />
                                    <input type="button" value="" style="background-color: #fff; background-image: url('assets/images/face-smile-icon.png'); background-repeat: no-repeat; border: none; width: 30%; height: 90px;" onclick="setSrv2(2, 1)" />
                                    <input type="button" value="" style="background-color: #fff; background-image: url('assets/images/face-plain-icon.png'); background-repeat: no-repeat; border: none; width: 30%; height: 90px;" onclick="setSrv2(2, 2)" />
                                    <input type="button" value="" style="background-color: #fff; background-image: url('assets/images/face-sad-icon.png'); background-repeat: no-repeat; border: none; width: 30%; height: 90px;" onclick="setSrv2(2, 3)" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="forclientTnxModal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" style="margin-bottom: 15px; text-align: center; font-size: 18px;">
                            Судалгаанд оролцсон таньд баярлалаа.<br />
                            <br />
                            Өдрийг сайхан өнгөрүүлээрэй!
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        //section2
        if ($('#divsection2Content').find('table').length > 0) {
            $('#divsection2Content').find('table').css('width','100%');
        }
        //section6
        function setGazarInModal(el, gazarId) {
            $('#gazarID').text(gazarId);
            $('#gazarName').text($(el).val());
            $('#srv1').css("display", "block");
            $('#srv2').css("display", "none");
        }
        function setSrv1(srvType, isSrv) {
            $.ajax({
                type: "POST",
                url: "../../ws.aspx/WSOracleExecuteNonQueryForClient",
                data: '{qry:"INSERT INTO ST_SRV_CLIENT (BR_ID, DT, SRV, TYPE) VALUES (' + $('#gazarID').text() + ', sysdate, ' + isSrv + ', ' + srvType + ')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $('#srv1').css("display", "none");
                    $('#srv2').css("display", "block");
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function setSrv2(srvType, isSrv) {
            $.ajax({
                type: "POST",
                url: "../../ws.aspx/WSOracleExecuteNonQueryForClient",
                data: '{qry:"INSERT INTO ST_SRV_CLIENT (BR_ID, DT, SRV, TYPE) VALUES (' + $('#gazarID').text() + ', sysdate, ' + isSrv + ', ' + srvType + ')"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $('#forclientModal').modal('hide');
                    $('#forclientTnxModal').modal('show');
                    setTimeout(function () { $('#forclientTnxModal').modal('hide'); }, 2000);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
    </script>
</body>
</html>
