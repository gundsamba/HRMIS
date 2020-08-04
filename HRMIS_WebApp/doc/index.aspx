<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HRWebApp.doc.index" %>

<!DOCTYPE html>
<!--[if IE 6 ]><html lang="en-us" class="ie6"> <![endif]-->
<!--[if IE 7 ]><html lang="en-us" class="ie7"> <![endif]-->
<!--[if IE 8 ]><html lang="en-us" class="ie8"> <![endif]-->
<!--[if (gt IE 7)|!(IE)]><!-->
<html lang="en-us"><!--<![endif]-->
<head>
	<meta charset="utf-8">
	<title>Гарын авлага | Хүний нөөцийн удирдлагын мэдээллийн систем</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="copyright" content="MoF">
	<link rel="stylesheet" href="assets/css/documenter_style.css" media="all">
	<link rel="stylesheet" href="assets/js/google-code-prettify/prettify.css" media="screen">
	<script src="assets/js/google-code-prettify/prettify.js"></script>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/jquery.scrollTo.js"></script>
	<script src="assets/js/jquery.easing.js"></script>
	<script>document.createElement('section');var duration='500',easing='swing';</script>
	<script src="assets/js/script.js"></script>
	<style>
		html{background-color:#FFFFFF;color:#383838;}
		::-moz-selection{background:#444444;color:#DDDDDD;}
		::selection{background:#444444;color:#DDDDDD;}
		#documenter_sidebar #documenter_logo{background-image:url(../img/logo.png);}
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
	</style>
	
</head>
<body class="documenter-project-smartadmin-v18x">
	<div id="documenter_sidebar">
		<a href="#documenter_cover" id="documenter_logo"></a>
		<ul id="documenter_nav">
			<li><a class="current" href="#documenter_cover">Эхлэл</a></li>
			<li><a href="#login" title="Системд нэвтрэх">Системд нэвтрэх</a></li>
			<li><a href="#inventoryStaff" title="Миний эд хөрөнгө">Миний эд хөрөнгө</a></li>
			<li><a href="#inventoryList" title="Тоологдох эд хөрөнгө">Тоологдох эд хөрөнгө</a></li>
			<li><a href="#inventoryCount" title="Эд хөрөнгийн тооллого">Эд хөрөнгийн тооллого</a></li>
			<li><a href="#salaryStaff" title="Цалингийн мэдээлэл">Цалингийн мэдээлэл</a></li>
			<li><a href="#shagnalZeregDevStaff" title="Миний шагнал, зэрэг дэв">Миний шагнал, зэрэг дэв</a></li>
			<li><a href="#report" title="Тайлан">Тайлан</a></li>
			<li><a href="#" title="Анкет хэвлэх">Анкет хэвлэх</a></li>
			<li><a href="#" title="Анкет хэвлэх">Хувь хүний анкетын 1-р маягтын мэдээлэл оруулах, засварлах</a></li>
			<li><a href="#" title="Анкет хэвлэх">Хувь хүний анкетын 2-р маягтын мэдээлэл оруулах, засварлах</a></li>
		</ul>
		<div id="documenter_copyright">Монгол Улсын Сангийн яам © 2019</div>
	</div>
	<div id="documenter_content">
	    <section id="documenter_cover">
	        <h1>HRMIS - Хэрэглэгчийн цахим гарын авлага</h1>
	        <h2>Хүний нөөцийн удирдлагын мэдээллийн систем</h2>
	        <div id="documenter_buttons">
		
	        </div>
	        <hr>
	        <p>HRMIS програм нь тухайн байгууллагын хүний нөөцийн мэдээллийг дэлгэрэнгүй байдлаар хөтлөх, мэдээллийн сангаас төрөл бүрийн тайлан судалгааг гаргаж авах, зорилго тодорхойлох, төлөвлөх, хянах зэрэг үндсэн үйл ажиллагаанд шаардлагатай мэдээллийг илүү цэгцтэй, бага хугацаанд бэлэн болгож гараар хийгддэг механик асуудлыг автоматжуулах, хүний нөөцийн мэргэжилтэн ба дээд шатны удирдлагуудад зөв шийдвэр гаргахад нь туслахад програмын гол зорилго оршино.</p>
	    </section>
        <section id="login">
            <div class="page-header"><h3>Системд нэвтрэх</h3><hr class="notop"></div>
            <p>Сангийн яамны өөрийн дотоод домайн эрхийн <b>нэр/имэйл</b> болон <b>нууц үг</b> оруулан системд нэвтэрнэ.</p>
            <p><img src="assets/images/login01.png" width="597" style="border-radius:10px;"/></p>
            <p>Холбоос: <a href="http://hr/login">http://hr/login</a></p>
        </section>
        <section id="inventoryStaff">
            <div class="page-header"><h3>Миний эд хөрөнгө</h3><hr class="notop"></div>
            <p>Меню: <u><strong>Эд хөрөнгийн мэдээлэл</strong></u> -> <a href="http://hr/#pg/inventory.aspx"><b>Миний эд хөрөнгө</b></a></p>
            <p>Системд нэвтэрсэн тухайн байгууллагын ажилтан дээр бүртгэлтэй эд хөрөнгийн мэдээлэл <i>ACOLOUS</i> системээс татан хүснэгтэн хэлбэрээр харагдана.</p>
            <h5>Харагдах багана</h5>
            <p><i># | Хөрөнгийн код | Хөрөнгийн нэр | Тоо/ширхэг | Нэгж үнэ | Нийт үнэ</i></p>
            <p>Холбоос: <a href="http://hr/#pg/inventory.aspx">http://hr/#pg/inventory.aspx</a></p>
        </section>
        <section id="inventoryList">
            <div class="page-header"><h3>Тоологдох эд хөрөнгө</h3><hr class="notop"></div>
            <p>Меню: <u><strong>Эд хөрөнгийн мэдээлэл</strong></u> -> <a href="http://hr/#pg/inventorylist.aspx"><b>Тоологдох эд хөрөнгө</b></a></p>
            <p>ACOLOUS систем дээр бүртгэлтэй, ажилтан дээр харъяалагдаж байгаа нийт эд хөрөнгийн мэдээллийг <i>ACOLOUS</i> системээс татан хүснэгтэн хэлбэрээр харагдана.</p>
            <h5>Харагдах багана</h5>
            <p><i># | Хөрөнгийн код | Хөрөнгийн нэр | Нэгж үнэ | Тоо/ширхэг | Нийт үнэ | QR Code</i></p>
            <p>Холбоос: <a href="http://hr/#pg/inventorylist.aspx">http://hr/#pg/inventorylist.aspx</a></p>
        </section>
        <section id="inventoryCount">
            <div class="page-header"><h3>Эд хөрөнгийн тооллого</h3><hr class="notop"></div>
            <p>Меню: <u><strong>Эд хөрөнгийн мэдээлэл</strong></u> -> <a href="http://hr/#pg/inventorycntinterval.aspx"><b>Эд хөрөнгийн тооллого</b></a></p>
            <p>ACOLOUS систем дээр бүртгэлтэй, ажилтан дээр харъяалагдаж байгаа нийт эд хөрөнгийг оноогдсон QR Code-оор эд хөрөнгийг тоолох интервал бүртгэлд хамааруулан тоолох.</p>
            <div class="alert">Эд хөрөнгийн тооллогын бүртгэлийг эхлүүлэхийн тулд эд хөрөнгийг тоолох интервал бүртгэл нээн түүнд харгалзуулсан <strong>Тооллого эхлүүлэх</strong> товч даран тооллого эхлүүлнэ.</div>
            <h5><strong>1. Эд хөрөнгийг тоолох интервал бүртгэх</strong></h5>
            <p>1.1. Эд хөрөнгийн тооллого цонхны <strong>нэмэх</strong> товч дээр дарна</p>
            <img src="assets/images/inventoryCount01.png" width="597" style="border-radius:10px;"/>
            <p>1.2. Эд хөрөнгийн тооллого нэмэх цонх гарж ирэх ба <strong>Бүртгэлийн нэр</strong> оруулан мөн <strong>Төлөв</strong> сонгон Хадгалах товч дарна.</p>
            <ul style="margin: 18px 0px; padding-right: 0px; padding-left: 0px; border: 0px; outline: 0px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);">
	            <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
		            Бүртгэлийн нэр: Эд хөрөнгийг тоолох интервалын нэрших нэр.
	            </li>
                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
		            Идэвхтэй эсэх: Эд хөрөнгийг тоолох интервалын идэвхтэй эсэх сонголт. <strong>Идэвхтэй</strong> - системд ашиглагдана, <strong>Идэвхгүй</strong> - системд ашиглагдахгүй
	            </li>
            </ul>
            <img src="assets/images/inventoryCount02.png" width="397" style="border-radius:10px;"/>
            <p>1.3. Бүртгэсэн эд хөрөнгийг тоолох интервалын хүснэгтээс харгалзах мөрийн <strong>Тооллого эхлүүлэх</strong> товч дээр даран <u>Эд хөрөнгө тоолох</u> цонх руу шилжинэ.</p>
            <img src="assets/images/inventoryCount03.png" width="597" style="border-radius:10px;"/>
            <p>1.4. Эд хөрөнгө тоолход тухайн эд хөрөнгийн QR Code-оор ажилтан дээр харгалзуулж тоолох ба доорх Эд хөрөнгө тоолох цонхноос <strong>Дотоод нэгж</strong> болон <strong>Ажилтан</strong>ыг сонгон камераар QR Code-оо уншуулна.</p>
            <img src="assets/images/inventoryCount04.png" width="250" style="border-radius:10px;"/>
            <p>1.5. QR Code амжилттай уншсан тохиолдолд Эд хариуцагч дээр бүртгэх цонх гарж ирэх ба <strong>ТООЛЛОГОД БҮРТГЭХ</strong> товч дээр даран тухайн сонгосон ажилтан дээр уншуулсан эд хөрөнгийг тоолон бүртгэнэ.</p>
            <img src="assets/images/inventoryCount05.png" width="397" style="border-radius:10px;"/>
            <p>Хэрэв тухайн ажилтан дээр эд хөрөнгө ажилттай бүртгэгдсэн бол доорх зурган дээрх <strong>Нийт (Х) хөрөнгө бүртгэгдсэн</strong> гэж бүртгэлтэй хөрөнгийн тоо нэмэгдэж харагдах болно.</p>
            <img src="assets/images/inventoryCount06.png" width="250" style="border-radius:10px;"/>
            <p>Дараагийн ажилтан дээр эд хөрөнгө бүртгэх бол ажилтанаа сонгон дээрх 1.4 болон 1.5-ын дарааллаар бүртгэнэ.</p>
            <p>Холбоос: <a href="http://hr/#pg/inventorycntinterval.aspx">http://hr/#pg/inventorycntinterval.aspx</a></p>
        </section>
        <section id="salaryStaff">
            <div class="page-header"><h3>Цалингийн мэдээлэл</h3><hr class="notop"></div>
            <p>Меню: <a href="http://hr/#pg/salarystaff.aspx"><b>Цалингийн мэдээлэл</b></a></p>
            <p>Системд нэвтэрсэн тухайн байгууллагын ажилтангийн цалингийн карт <i>PAYROLL</i> системээс татан хүснэгтэн хэлбэрээр харагдана.</p>
            <h5>Харагдах багана</h5>
            <p><i>сар | Хоног | Үндсэн цалин | Бодогдсон цалин | Хоол | Цалингийн зөрүү | Зэргийн нэмэгдэл | ТАХ нэмэгдэл | Онцгойн албаны нэмэгдэл | Бүгд дүн | НДШ | Ашиг | ҮЭ-н татвар | Суудталын дүн | Урьдчилгаа | Гарт олгох | Нийт олгох</i></p>
            <p>Холбоос: <a href="http://hr/#pg/salarystaff.aspx">http://hr/#pg/salarystaff.aspx</a></p>
        </section>
        <section id="shagnalZeregDevStaff">
            <div class="page-header"><h3>Миний шагнал, зэрэг дэв</h3><hr class="notop"></div>
            <p>Меню: <u><strong>Шагнал, зэрэг дэв</strong></u> -> <a href="http://hr/#pg/myShagnal.aspx"><b>Миний шагнал, зэрэг дэв</b></a></p>
            <p>Системд нэвтэрсэн тухайн байгууллагын ажилтангийн <strong>Шагнал</strong> болон <strong>Зэрэг дэв</strong>ийн мэдээлэл хүснэгтэн хэлбэрээр харагдана.</p>
            <h5>Харагдах багана <strong>Шагнал</strong></h5>
            <p><i># | Шагналын нэр | Огноо | Шагналын төрөл | Шийдвэр | Тодорхойлолт | Мөнгөн дүн | Үндэслэл | Тушаалын дугаар | Тушаалын огноо</i></p>
            <h5>Харагдах багана <strong>Зэрэг дэв</strong></h5>
            <p><i># | Албан тушаалын зэрэг дэв | Албан тушаалын ангилал |Шийдвэрийн нэр | Шийдвэрийн дугаар | Шийдвэрийн огноо | Нэмэгдэл хувь</i></p>
            <p>Холбоос: <a href="http://hr/#pg/myShagnal.aspx">http://hr/#pg/myShagnal.aspx</a></p>
        </section>
        <section id="report">
            <div class="page-header"><h3>Тайлан</h3><hr class="notop"></div>
            <p>Системийн модулиуд дахь хэрэгцээт тайлан лавлагааг шүүлтүүрээр харах түүнээс экспорт хийх, хэвлэх боломж бүхий тайлангийн модулиуд.</p>
            <h5>Ерөнхий контрол</h5>
            <p>1. Тайлангийн шүүлт талбар</p>
            <table>
                <tbody>
                    <tr>
                        <td><img src="assets/images/report001.png" width="347" style="border-radius:10px;"/></td>
                        <td style="vertical-align:top;">
                            - "<b>ТАЙЛАН ХАРАХ</b>" товч даран тухайн сонгосон шүүлтүүрээр тайлангаа харна.
                            <br />
                            - "<b>ШИНЭЧЛЭХ</b>" товч даран тухайн тайлангийн шүүлтүүрийн сонгосон өгөгдлийг анхны төлөвт оруулна.
                        </td>
                    </tr>
                </tbody>
            </table>
            <p>2. Тайлангийг илэрцийг хэвлэх/экспорт хийх</p>
            <table>
                <tbody>
                    <tr>
                        <td><img src="assets/images/report002.png" width="145"/></td>
                        <td><img src="assets/images/report003.png" width="145"/></td>
                        <td><img src="assets/images/report004.png" width="145"/></td>
                    </tr>
                    <tr>
                        <td >Хэвлэх</td>
                        <td>Word-оор татах</td>
                        <td>Excel-ээр татах</td>
                    </tr>
                </tbody>
            </table>
            <p>Систем дээр байршиж буй тайлангийн жагсаалт болон төрлийн бүтцийг доорх бүтэцээс харна уу.</p>
            <ul style="margin: 18px 0px; padding-right: 0px; padding-left: 0px; border: 0px; outline: 0px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);">
	            <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
		            Тайлан:
		            <ul style="margin:0;">
                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
				            Ажилтан:
                            <ul style="margin:0;">
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Байршилаар:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffHousCond.aspx">Амьдрах нөхцөл</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Зэрэг дэв, цол шагнал:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffRewardMof.aspx">Шагнал</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Насны ангиллаар:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffAgeGrp.aspx">Насны ангилал</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Мэргэжил боловсролоор:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/rprtStaffEducation.aspx">Боловсролын түвшингээр</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Шилжилт хөдөлгөөн:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffMove.aspx">Албан хаагчдын тоо төлвөөр</a>
                                        </li>
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffMove.aspx">Чөлөөлөгдсөн албан хаагч шалтгаанаар</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Цаг ашиглалт:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffAttendance.aspx">Цаг ашиглалт /дотоод нэгжээр/</a>
                                        </li>
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffAttendance.aspx">Цаг ашиглалтын дэлгэрэнгүй /ажилтнаар/</a>
                                        </li>
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffAttendance.aspx">Ажилтны ирцийн тайлан</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Ажилласан жил:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffWorkedYear.aspx">Ажилласан жил</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
			            </li>
			            <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
				            Томилолт:
                            <ul style="margin:0;">
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Гадаад томилолт:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtTomiloltForeign.aspx">Томилолтын мэдээлэл</a>
                                        </li>
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtTomiloltForeign.aspx">Ажилтны томилолтын мэдээлэл</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Дотоод томилолт:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtTomiloltLocal.aspx">Томилолтын мэдээлэл</a>
                                        </li>
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtTomiloltLocal.aspx">Ажилтны томилолтын мэдээлэл</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
			            </li>
			            <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
				            Чөлөө:
                            <ul style="margin:0;">
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Цагийн чөлөө:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/ReportStaffChuluuTime.aspx">Ажилтны цагийн чөлөөний тайлан</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    2 хүртэл өдрийн чөлөө:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffChuluuDayT2.aspx">Ажилтны 2 хүртэл өдрийн чөлөөний тайлан</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    2 дээш өдрийн чөлөө:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffChuluuDayF3.aspx">Ажилтны 2-оос дээш өдрийн чөлөөний тайлан</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Өвчтэй чөлөө:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffChuluuSick.aspx">Ажилтны өвчтэй өдрийн чөлөөний тайлан</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
			            </li>
                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
				            Ээлжийн амралт
                            <ul style="margin:0;">
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    <a href="">Ээлжийн амралтын ерөнхий тайлан</a>
                                </li>
                            </ul>
                        </li>
                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
				            Хяналт, шинжилгээ:
                            <ul style="margin:0;">
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Мэдээллийн бүрдүүлэлт:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtStaffAmralt.aspx">Ажилтны мэдээллийн бүрдүүлэлт</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
			            </li>
                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
				            Эд хөрөнгө:
                            <ul style="margin:0;">
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Тоологдох эд хөрөнгийн жагсаалт:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtInventoryListWithQRCode.aspx">Тоологдох эд хөрөнгийн жагсаалт /QR Code-той/</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Ажилтны хөрөнгийн жагсаалт:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/RprtInventoryListStaff.aspx">Ажилтны хөрөнгийн жагсаалт</a>
                                        </li>
                                    </ul>
                                </li>
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    Тоологдсон хөрөнгийн жагсаалт:
                                    <ul style="margin:0;">
                                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                            <a href="http://hr/#rprt/rprtInventoryCount.aspx">Тоологдсон хөрөнгийн жагсаалт</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
			            </li>
                        <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
				            Ажилтны цалин
                            <ul style="margin:0;">
                                <li style="margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: square;">
                                    <a href="http://hr/#rprt/RprtStaffSalary.aspx">Ажилтны цалингийн карт</a>
                                </li>
                            </ul>
                        </li>
		            </ul>
	            </li>
            </ul>
        </section>
	</div>
</body>
</html>
