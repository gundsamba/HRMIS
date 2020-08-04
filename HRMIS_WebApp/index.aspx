<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HRWebApp.index" %>
<!DOCTYPE html>
<html lang="en-us" class="hidden-menu-mobile-lock smart-style-4">	
    <head>
        <meta charset="utf-8">
        <title>HRMIS</title>
        <link rel="shortcut icon" href="../img/favicon.ico"/>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production-plugins.min.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> 

	    <link rel="stylesheet" type="text/css" media="screen" href="css/my_style.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/webticker.css">

        <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
	    <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

	    <!-- #GOOGLE FONT -->
	    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

	    <!-- #APP SCREEN / ICONS -->
	    <!-- Specifying a Webpage Icon for Web Clip 
			    Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
	    <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
	    <link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
	    <link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
	    <link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
		
	    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="apple-mobile-web-app-status-bar-style" content="black">
		
	    <!-- Startup image for web apps -->
	    <link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
	    <link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
	    <link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
    </head>
    <body class="smart-style-4">
        <header id="header">
            <div id="logo-group">
                <span id="logo">
                    <img src="img/logo.png" alt="Хүний нөөцийн систем">
                </span>
            </div>
            <div class="pull-left hidden-sm hidden-xs">
                <a href="http://mof.gov.mn" style="height: 100%; display: block;">
                    <img src="img/cover-logo-mof.png" style="margin: 5px 0 0 13px;">
                </a>
            </div>
            <div class="pull-right">
                 <div id="hide-menu" class="btn-header pull-right">
                    <span>
                         <a href="javascript:void(0);" data-action="toggleMenu" rel="tooltip" data-placement="bottom" data-original-title="Меню хураах/нээх">
                             <i class="fa fa-reorder"></i>
                         </a>
                    </span>
                </div>
                <div id="logout" class="btn-header transparent pull-right">
                    <span>
                        <a href="javascript:void(0);" title="Системээс гарах" data-action="userLogout" data-logout-msg="Та системээс гарахдаа итгэлтэй байна уу?" style="cursor:pointer;" rel="tooltip" data-placement="bottom" data-original-title="Системээс гарах">
                            <i class="fa fa-sign-out"></i>
                        </a>
                    </span>
                </div>
                <div id="fullscreen" class="btn-header transparent pull-right">
                    <span> 
                        <a href="javascript:void(0);" onclick="launchFullscreen(document.documentElement);"  rel="tooltip" data-placement="bottom" data-original-title="Бүтэн дэлгэцээр харах">
                            <i class="fa fa-arrows-alt"></i>
                        </a>
                    </span>
                </div>
                <div class="btn-header transparent pull-right margin-right-5 font-sm">
                    <span> 
                        <a href="javascript:void(0);" onclick="launchLM();"  rel="tooltip" data-placement="bottom" data-original-title="Цахим хяналт-шинжилгээ, үнэлгээ систем рүү шилжих">
                            &nbsp;LM&nbsp;
                        </a>
                    </span>
                </div>
                <div style="display:none;">
                    <input id="inputUserId" runat="server" type="hidden" />
                    <span id="indexUserId" runat="server"></span>
                    <span id="indexUserGazarId" runat="server"></span>
                    <span id="indexUserHeltesId" runat="server"></span>
                    <span id="indexUserPosId" runat="server"></span>
                    <span id="indexUserGazarName" runat="server"></span>
                    <span id="indexUserGazarInitName" runat="server"></span>
                    <span id="indexUserRoleListId" runat="server"></span>
                </div>
            </div>
        </header>
        <aside id="left-panel" style="z-index: 500;">
            <div class="login-info">
	            <span>
		            <a href="pg/myprofile.aspx" id="show-shortcut" data-action="toggleShortcut">
                        <img id="staffImage" runat="server" src="" alt="" class="online" style="height:30px;">
			            <span id="staffName" runat="server">
				            
			            </span>
                        <i class="fa fa-angle-down"></i>
                    </a>					
	            </span>
            </div>
            <nav>
                <ul>
                    <li class="active">
                        <a href="pg/dashboard.aspx" title="Хянах самбар">
                            <i class="fa fa-lg fa-fw fa-home"></i> 
                            <span class="menu-item-parent">Хянах самбар</span>
                        </a>
                    </li>
                    <li>
                        <a href="pg/staffreg.aspx">
                            <i class="fa fa-lg fa-fw fa-group"></i> 
                            <span class="menu-item-parent">Ажилтны бүртгэл</span>
                        </a>
                    </li>
                    <li>
                        <a href="pg/staffreg.aspx?ismove=1">
                            <i class="fa fa-lg fa-fw fa-exchange"></i> 
                            <span class="menu-item-parent">Бүрэлдэхүүн хөдөлгөөн</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-lg fa-fw fa-suitcase"></i> 
                            <span class="menu-item-parent">Томилолт</span>
                        </a>
                        <ul>
                            <li>
                                <a href="pg/tomilolt.aspx?id=1">Гадаад томилолт</a>
                            </li>
                            <li>
                                <a href="pg/tomilolt.aspx?id=2">Дотоод томилолт</a>
                            </li>
                            <li>
                                <a href="pg/trainingreq.aspx">Урьдчилсан мэдүүлэг</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-lg fa-fw fa-clock-o"></i> 
                            <span class="menu-item-parent">Чөлөө</span>
                        </a>
                        <ul>
                            <li>
                                <a href="pg/chuluutime.aspx">Цагийн чөлөө</a>
                            </li>
                            <li>
                                <a href="pg/chuluudayt2.aspx">2 хүртэл өдрийн чөлөө</a>
                            </li>
                            <li>
                                <a href="pg/chuluudayf3.aspx">2 дээш өдрийн чөлөө</a>
                            </li>
                            <li>
                                <a href="pg/chuluusick.aspx">Өвчтэй чөлөө</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="pg/amralt.aspx">
                            <i class="fa fa-lg fa-fw fa-plane"></i> 
                            <span class="menu-item-parent">Ээлжийн амралт</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-lg fa-fw fa-building"></i> 
                            <span class="menu-item-parent">Эд хөрөнгийн мэдээлэл</span>
                        </a>
                        <ul>
                            <li>
                                <a href="pg/inventory.aspx">Миний эд хөрөнгө</a>
                            </li>
                            <li>
                                <a href="pg/inventorylist.aspx">Тоологдох эд хөрөнгө</a>
                            </li>
                            <li>
                                <a href="pg/inventorycntinterval.aspx">Эд хөрөнгийн тооллого</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="pg/srv.aspx">
                            <i class="fa fa-lg fa-fw fa-comments"></i> 
                            <span class="menu-item-parent">Санал асуулга</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-lg fa-fw fa-trophy"></i> 
                            <span class="menu-item-parent">Шагнал, зэрэг дэв*</span>
                        </a>
                        <ul>
                            <li>
                                <a href="pg/myShagnal.aspx">Миний шагнал, зэрэг дэв</a>
                            </li>
                            <li>
                                <a href="pg/staffsdataadd.aspx">Шагнал, зэрэг дэв</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="pg/attendance.aspx">
                            <i class="fa fa-lg fa-fw fa-clock-o"></i> 
                            <span class="menu-item-parent">Ажлын цаг ашиглалт</span>
                        </a>
                    </li>
                    <li>
                        <a href="pg/salarystaff.aspx">
                            <i class="fa fa-lg fa-fw fa-money"></i> 
                            <span class="menu-item-parent">Цалингийн мэдээлэл</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-lg fa-fw fa-file-text-o"></i> 
                            <span class="menu-item-parent">Тайлан</span>
                        </a>
                        <ul>
                            <li>
                                <a href="#">Ажилтан</a>
                                <ul>
									<li>
										<a href="rprt/RprtStaffHousCond.aspx">Байршилаар</a>
									</li>
									<li>
										<a href="rprt/RprtStaffRewardMof.aspx">Зэрэг дэв, цол, шагнал</a>
									</li>
									<li>
										<a href="rprt/RprtStaffAgeGrp.aspx">Насны ангиллаар</a>
									</li>
									<li>
										<a href="rprt/rprtStaffEducation.aspx">Мэргэшил боловсролоор</a>
									</li>
									<li>
										<a href="rprt/RprtStaffMove.aspx">Шилжилт хөдөлгөөн</a>
									</li>
									<li>
										<a href="rprt/RprtStaffAttendance.aspx">Цаг ашиглалт</a>
									</li>
									<li>
										<a href="rprt/RprtStaffWorkedYear.aspx">Ажилласан жил</a>
									</li>
								</ul>
                            </li>
                            <li>
                                <a href="#">Томилолт</a>
                                <ul>
									<li>
										<a href="rprt/RprtTomiloltForeign.aspx">Гадаад томилолт</a>
									</li>
									<li>
										<a href="rprt/RprtTomiloltLocal.aspx">Дотоод томилолт</a>
									</li>
								</ul>
                            </li>
                            <li>
                                <a href="#">Чөлөө</a>
                                <ul>
									<li>
										<a href="rprt/ReportStaffChuluuTime.aspx">Цагийн чөлөө</a>
									</li>
									<li>
										<a href="rprt/RprtStaffChuluuDayT2.aspx">2 хүртэл өдрийн чөлөө</a>
									</li>
									<li>
										<a href="rprt/RprtStaffChuluuDayF3.aspx">2 дээш өдрийн чөлөө</a>
									</li>
									<li>
										<a href="rprt/RprtStaffChuluuSick.aspx">Өвчтэй чөлөө</a>
									</li>
								</ul>
                            </li>
                            <li>
                                <a href="rprt/RprtStaffAmralt.aspx">Ээлжийн амралт</a>
                            </li>
                            <li>
                                <a href="#">Хяналт, шинжилгээ</a>
                                <ul>
									<li>
										<a href="rprt/RprtMonitorFillData.aspx">Мэдээллийн бүрдүүлэлт</a>
									</li>
								</ul>
                            </li>
                            <li>
                                <a href="#">Эд хөрөнгө</a>
                                <ul>
									<li>
										<a href="rprt/RprtInventoryListWithQRCode.aspx">Тоологдох хөрөнгийн жагсаалт</a>
									</li>
									<li>
										<a href="rprt/RprtInventoryListStaff.aspx">Ажилтны хөрөнгийн жагсаалт</a>
									</li>
									<li>
										<a href="rprt/rprtInventoryCount.aspx">Тоологдсон/тоологдоогүй хөрөнгийн жагсаалт</a>
									</li>
								</ul>
                            </li>
                            <li>
                                <a href="rprt/RprtStaffSalary.aspx">Ажилтны цалин</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-lg fa-fw fa-gear"></i> 
                            <span class="menu-item-parent">Тохиргоо</span>
                        </a>
                        <ul>
                            <li>
                                <a href="pg/branchreg.aspx">Газар нэгж</a>
                            </li>
                            <li>
                                <a href="pg/setrole.aspx">Модулын эрх</a>
                            </li>
                            <li>
                                <a href="pg/celebday.aspx">Амралтын өдөр</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="pg/inputintractive.aspx">
                            <i class="fa fa-lg fa-fw fa-desktop"></i> 
                            <span class="menu-item-parent">Интрактив дэлгэц</span>
                        </a>
                    </li>
                    <li>
                        <a href="doc/index.aspx" target="_blank" class="text-warning">
                            <i class="fa fa-lg fa-fw fa-book"></i>
                            <span class="menu-item-parent">ГАРЫН АВЛАГА</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <span class="minifyme" data-action="minifyMenu">
                 <i class="fa fa-arrow-circle-left hit"></i>
            </span>
        </aside>
        <div id="main" role="main">
	        <div id="shortcut">
		        <ul>
			        <li>
				        <a href="#pg/myprofile.aspx" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>Миний хуудас</span> </span> </a>
			        </li>
		        </ul>
	        </div>
            <div id="ribbon">    
		        <span class="ribbon-button-alignment"> 
		        </span>
                <ol class="breadcrumb">
                    
                </ol>
             </div>
            <div id="content" >

            </div>
        </div>
        <%--<script src="js/libs/jquery-2.1.1.min.js"></script>--%>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	    <script>
	        if (!window.jQuery) {
	            document.write('<script src="js/libs/jquery-2.1.1.min.js"><\/script>');
	        }
	    </script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	    <%--<script src="js/libs/jquery-ui-1.10.3.min.js"></script>--%>
	    <script>
	        if (!window.jQuery.ui) {
	            document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
	        }
	    </script>

	    <!-- IMPORTANT: APP CONFIG -->
	    <script src="js/app.config.js"></script>

	    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
	    <script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

	    <!-- BOOTSTRAP JS -->
	    <script src="js/bootstrap/bootstrap.min.js"></script>

	    <!-- CUSTOM NOTIFICATION -->
	    <script src="js/notification/SmartNotification.min.js"></script>

	    <!-- JARVIS WIDGETS -->
	    <script src="js/smartwidgets/jarvis.widget.min.js"></script>

	    <!-- EASY PIE CHARTS -->
	    <script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

	    <!-- SPARKLINES -->
	    <script src="js/plugin/sparkline/jquery.sparkline.min.js"></script>

	    <!-- JQUERY VALIDATE -->
	    <script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

	    <!-- JQUERY MASKED INPUT -->
	    <script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>

	    <!-- JQUERY SELECT2 INPUT -->
	    <script src="js/plugin/select2/select2.min.js"></script>

	    <!-- JQUERY UI + Bootstrap Slider -->
	    <script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

	    <!-- browser msie issue fix -->
	    <script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

	    <!-- FastClick: For mobile devices: you can disable this in app.js -->
	    <script src="js/plugin/fastclick/fastclick.min.js"></script>

	    <!--[if IE 8]>
		    <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
	    <![endif]-->

	    <!-- Demo purpose only -->
	    <script src="js/demo.min.js"></script>

	    <!-- MAIN APP JS FILE -->
	    <script src="../js/app.min.js"></script>

	    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
	    <!-- Voice command : plugin -->
	    <script src="js/speech/voicecommand.min.js"></script>

	    <!-- SmartChat UI : plugin -->
	    <script src="js/smart-chat-ui/smart.chat.ui.min.js"></script>
	    <script src="js/smart-chat-ui/smart.chat.manager.min.js"></script>

        <!--jquery datatable-->
        <script type="text/javascript" src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script type="text/javascript" src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script type="text/javascript" src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript" src="../js/plugin/datatables/jquery.dataTables.rowGrouping.js"></script>
        <!--bootstrap validation-->
        <script type="text/javascript" src="../js/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>
        <script type="text/javascript" src="../js/plugin/timer/jquery.timer.js"></script>
        <script type="text/javascript" src="../js/plugin/moment/moment.min.js"></script>
        <script type="text/javascript" src="../js/plugin/fullcalendar/jquery.fullcalendar.min.js"></script>
        <script type="text/javascript" src="../js/plugin/webticker/jquery.webticker.js"></script>
        <script type="text/javascript" src="../js/plugin/multidatespicker/jquery-ui.multidatespicker.js"></script>
        <script src="../js/plugin/ckeditor/ckeditor.js"></script>
        <%--<script type="text/javascript" src="https://www.google.com/jsapi"></script>--%>
        <script>
            $(".js-status-update a").click(function () {
                var selText = $(this).text();
                var $this = $(this);
                $this.parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
                $this.parents('.dropdown-menu').find('li').removeClass('active');
                $this.parent().addClass('active');
            });
            function showLoader(el) {
                $('#' + el).css({ "display": "block", "background": "rgba(0, 0, 0, .3)" });
            }
            function hideLoader(el) {
                $('#' + el).css({ "display": "none" });
            };
            function ExportWord(divId, filename) {
                $(''+divId+'').wordExport(filename);
            }
            function ExportExcel(divId) {
                window.open('data:application/vnd.ms-excel,' + encodeURIComponent($(''+divId+'').html()));
            }
            //function exportPdfData(divId) {

            //    Popup($(divId).html());

            //    function Popup(data) {
            //        var mywindow = window.open('', 'my div', 'height=600,width=800');
            //        mywindow.document.write('<html><head><title></title>');
            //        mywindow.document.write('</head><body >');
            //        mywindow.document.write(data.replace(/class="perfcont_Tab3Circle"/g, 'style="display: inline-block; min-width: 20px; font-size: 12px; line-height: 1; vertical-align: baseline; white-space: nowrap; text-align: center; border-radius: 10px; background:none; color:#000; border:1px solid #808080; padding:2px; margin:2px;"').replace(/class="perfcont_Tab3CircleChecked"/g, 'style="display: inline-block; min-width: 20px; font-size: 12px; line-height: 1; vertical-align: baseline; white-space: nowrap; text-align: center; border-radius: 10px; background:#808080; color:#fff; border:1px solid #808080; padding:2px; margin:2px; -webkit-print-color-adjust:exact;"'));
            //        mywindow.document.write('</body></html>');
            //        return true;
            //    }
            //    //window.open('http://www.htm2pdf.co.uk/display?url=' + encodeURIComponent($(divId).html()));
            //}
            //function ExportPdf(divId, fileName) {
            //    var doc = new jsPDF('p', 'pt', 'letter');
            //    source = $(''+divId+'')[0];
            //    specialElementHandlers = {
            //        '#editor': function (element, renderer) {
            //            return true;
            //        }
            //    };
            //    margins = {
            //        top: 80,
            //        bottom: 60,
            //        left: 40,
            //        width: 522
            //    };
            //    fileName = typeof fileName !== 'undefined' ? fileName : "HR_PDF_File";
            //    doc.fromHTML(
            //        source, // HTML string or DOM elem ref.
            //        margins.left, // x coord
            //        margins.top, // y coord
            //        {
            //            'width': margins.width, // max width of content on PDF
            //            'elementHandlers': specialElementHandlers
            //        },
            //        //function (dispose) {
            //        //    doc.save(fileName+'.pdf');
            //        //},
            //        margins
            //    );
            //    doc.save(fileName+'.pdf');
            //}
            function PrintElem(elem) {
                Popup($(elem).html());
            }
            function Popup(data) {
                jQuery(".Header").hide();
                var mywindow = window.open('', '', 'left=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0,height=600,width=800');
                //mywindow.document.write('<html><head><title></title>');
                //mywindow.document.write('</head><body >');
                mywindow.document.write(data.replace(/class="perfcont_Tab3Circle"/g, 'style="display: inline-block; min-width: 20px; font-size: 12px; line-height: 1; vertical-align: baseline; white-space: nowrap; text-align: center; border-radius: 10px; background:none; color:#000; border:1px solid #808080; padding:2px; margin:2px;"').replace(/class="perfcont_Tab3CircleChecked"/g, 'style="display: inline-block; min-width: 20px; font-size: 12px; line-height: 1; vertical-align: baseline; white-space: nowrap; text-align: center; border-radius: 10px; background:#808080; color:#fff; border:1px solid #808080; padding:2px; margin:2px; -webkit-print-color-adjust:exact;"'));
                //mywindow.document.write('</body></html>');
                mywindow.print();
                mywindow.close();

                return true;
            }
            function replaceDisplayToDatabase(val) {
                return val.replace(/&quot;/g, "quot;").replace(/</g, 'lt;').replace(/>/g, 'gt;').replace(/"/g, 'quot;').replace(/'/g, "apos;").replace(/&/g, 'amp;').replace(/\\/g, "bsol;");
            }
            function replaceDatabaseToDisplay(val) {
                return val.replace(/lt;/g, '<').replace(/gt;/g, '>').replace(/quot;/g, '"').replace(/amp;/g, '&').replace(/apos;/g, "'").replace(/bsol;/g, "\\");
            }
            function getUrlVars() {
                var vars = [], hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < hashes.length; i++) {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];
                }
                return vars;
            }
            function smallBox(vartitle, varcontent, varcolor, vartimeout) {
                $.smallBox({
                    title: vartitle,
                    content: varcontent,
                    color: varcolor,
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: vartimeout
                });
            }
            function strConvertFirstCharUpper(str) {
                return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
            }
            function isValidEmailAddress(emailAddress) {
                var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
                return pattern.test(emailAddress);
            };
            function strQryIsNull(tp, str) {
                if (tp == 'varchar') {
                    if (str == "") str = "NULL";
                    else str = "'" + str + "'";
                }
                else if (tp == 'numeric') {
                    if (str == "") str = "NULL";
                    else str = str;
                }
                return str;
            }

            //function launchLM() {
            //    globalAjaxVar = $.ajax({
            //        type: "POST",
            //        url: "http://lm.mof.gov.mn/ws.aspx/gotoLM",
            //        data: '{stid:"' + $.trim($('#indexUserId').html()) + '"}',
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        crossDomain: true,
            //        success: function () {
            //            window.location = 'http://lm.mof.gov.mn';
            //        },
            //        failure: function (response) {
            //            alert('FAILURE: ' + response.d);
            //        },
            //        error: function (xhr, status, error) {
            //            var err = eval("(" + xhr.responseText + ")");
            //            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login';
            //            else window.location = '../#pg/error500.aspx';
            //        }
            //    });
            //}
            function launchLM() {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/gotoLM",
                    data: '{stid:"' + $.trim($('#indexUserId').html()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossDomain: true,
                    success: function () {
                        window.location = 'http://lm.mof.gov.mn';
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }

            function funcCheckRoles(val) {
                var valBoolData = false;
                if ($.trim($('#indexUserRoleListId').html()) != '') {
                    for (var i = 0; i < parseInt($('#indexUserRoleListId').html().split(',').length) ; i++) {
                        for (var y = 0; y < parseInt(val.split(',').length) ; y++) {
                            if ($('#indexUserRoleListId').html().split(',')[i] == val.split(',')[y]) {
                                valBoolData = true;
                                break;
                            }
                        }
                    }
                }
                return valBoolData;
            }
            Number.prototype.format = function(n, x) {
                var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
                return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
            };
        </script>
    </body>
</html>
