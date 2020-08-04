<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="HRWebApp.pg.profile" %>
<style>
    .savebtn {
        cursor:pointer;
    }
    .savebtn:hover {
        color:#000;
    }
</style>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark">
			<!-- PAGE HEADER -->
			<i class="fa-fw fa fa-home"></i> 
				Ажилтаны бүртгэл 
			<span>>  
				Ажилтаны мэдээлэл
			</span>
		</h1>
	</div>
</div>
<div class="row">
	<div class="col-sm-12">
	    <div class="well well-sm">
		    <div class="row">
			    <div class="col-sm-12 col-md-12 col-lg-12">
				    <div class="well well-light well-sm no-margin no-padding">
					    <div class="row">
						    <div class="col-sm-12">
							    <div class="row">
								    <div class="col-sm-2 profile-pic">
									    <img id="profileMainImage" runat="server" src="../img/avatars/male.png">
                                        <div>
                                            <a class="btn btn-primary btn-xs" href="javascript:void(0);" data-target="#pChangeImageModal" data-toggle="modal" onclick="$('#pChangeImageModalImg').attr('src', $('#profileMainImage').attr('src'));"><i class="fa fa-file-image-o"></i> Зураг оруулах</a>
                                        </div>
									    <div id="profileMainDivStafftype" runat="server" style="padding: 5px 0 0 5px;">
                                            
									    </div>
								    </div>
								    <div class="col-sm-4">
									    <h1 id="profileMainH1Names" runat="server" style="text-transform:uppercase;">
                                            
									    </h1>
									    <ul class="list-unstyled">
										    <li>
											    <p class="text-muted">
												    <i class="fa fa-phone"></i>&nbsp;&nbsp;<span id="profileMainSpanTels" runat="server" class="txt-color-darken">-</span>
											    </p>
										    </li>
										    <li>
											    <p class="text-muted">
												    <i class="fa fa-envelope"></i>&nbsp;&nbsp;<a id="profileMainSpanEmail" runat="server" href="#">-</a>
											    </p>
										    </li>
										    <li>
											    <p class="text-muted">
												    <i class="fa fa-home"></i>&nbsp;&nbsp;<span id="profileMainSpanAddress" runat="server" class="txt-color-darken">-</span>
											    </p>
										    </li>
									    </ul>
                                        <br />
                                        <p class="font-md margin-bottom-0"><i>Нийт ажилласан</i></p>
                                        <div id="profileMainWorkedTime" runat="server"></div>
								    </div>
                                    <div class="col-sm-2 smart-form">
                                        <fieldset style="padding-top: 10px;">
                                            <section style="margin-bottom: 5px;">
                                                <label class="control-label">*Регистрийн дугаар</label>
									            <label class="input"> 
                                                    <i class="icon-append glyphicon glyphicon-floppy-disk savebtn"></i>
										            <input id="profileMainInputRegno" name="pTab1ModalInputRegno" runat="server" type="text" placeholder="Регистрийн дугаар" maxlength="10" data-colname="REGNO">
									            </label>
								            </section>
                                            <section style="margin-bottom: 5px;">
                                                <label class="control-label">ИҮ-н дугаар</label>
									            <label class="input"> 
                                                    <i class="icon-append glyphicon glyphicon-floppy-disk savebtn"></i>
										            <input id="profileMainInputCitno" name="pTab1ModalInputCitno" runat="server" type="text" placeholder="ИҮ-н дугаар" maxlength="9" data-colname="CITNO">
									            </label>
								            </section>
                                            <section style="margin-bottom: 5px;">
                                                <label class="control-label">НДД-н дугаар</label>
									            <label class="input"> 
                                                    <i class="icon-append glyphicon glyphicon-floppy-disk savebtn"></i>
										            <input id="profileMainInputSocno" name="pTab1ModalInputSocno" runat="server" type="text" placeholder="НДД-н дугаар" maxlength="10" data-colname="SOCNO">
									            </label>
								            </section>
                                            <section style="margin-bottom: 5px;">
                                                <label class="control-label">ЭМДД-н дугаар</label>
									            <label class="input"> 
                                                    <i class="icon-append glyphicon glyphicon-floppy-disk savebtn"></i>
										            <input id="profileMainInputHealno" name="pTab1ModalInputHealno" runat="server" type="text" placeholder="ЭМДД-н дугаар" maxlength="8" data-colname="HEALNO">
									            </label>
								            </section>
                                            <section style="margin-bottom: 5px;">
                                                <label class="control-label">Бичиг хэргийн эрх</label>
                                                <select id="profileMainSelectDocRole" name="profileMainSelectDocRole" runat="server" class="form-control">
                                                    <option value="0">Идэвхигүй</option>
                                                    <option value="5">Идэвхитэй</option>
                                                    <option value="1">Админ</option>
                                                    <option value="2">Хэлтсийн бичиг хэргийн ажилтан</option>
                                                    <option value="3">Газрын бичиг хэргийн ажилтан</option>
                                                    <option value="4">Сайд/Төрийн нарийн бичгийн туслах</option>
                                                    <option value="6">Хүний нөөц</option>
                                                    <option value="7">Хүний нөөц/Газрын бичиг хэрэг</option>
                                                </select>
                                            </section>
                                        </fieldset>
                                    </div>
								    <div class="col-sm-4">
                                        <div style="margin:5px 5px 0 0;">
                                            <div style="display:block; overflow:hidden;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Хувь хүний талаарх мэдээлэл</i></p>
                                                <div id="profileAnket1-1Per" class="progress-bar bg-color-greenLight" aria-valuetransitiongoal="100"></div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Ур чадварын талаарх мэдээлэл</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket1-2Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Боловсролын талаарх мэдээлэл</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket1-3Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Мэргэшлийн талаарх мэдээлэл</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket1-4Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Цэргийн алба хаасан эсэх</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket1-5Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Шагналын талаарх мэдээлэл</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket1-6Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Туршлагын талаарх мэдээлэл</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket1-7Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Бүтээлийн жагсаалт</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket1-8Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                            <div style="display:block; overflow:hidden; margin-top:5px;">
                                                <p class="text-right font-sm text-muted no-margin"><i>Бусад мэдээлэл</i></p>
                                                <div class="progress progress-micro" style="margin-bottom: 5px;">
									                <div id="profileAnket2-0Per" class="progress-bar progress-bar-primary" role="progressbar" style="width: 44%;"></div>
								                </div>
                                            </div>
                                        </div>
                                    </div>
							    </div>
						    </div>
					    </div>
					    <div class="row">
						    <div class="col-sm-12">
							    <hr>
							    <div class="padding-10">
								    <ul class="nav nav-tabs tabs-pull-right">
									    <li id="pTab3Li" runat="server">
										    <a href="#pTab3" data-toggle="tab">Анкет 2-р маягт</a>
									    </li>
									    <li id="pTab1Li" runat="server" class="active">
										    <a href="#pTab1" data-toggle="tab">Анкет 1-р маягт</a>
									    </li>
									    <li id="pTab2Li" runat="server">
										    <a href="#pTab2" data-toggle="tab">Бүрэлдэхүүн хөдөлгөөн</a>
									    </li>
									    <li class="pull-left">
										    <span class="margin-top-10 display-inline"><i class="fa fa-rss text-success"></i> Дэлгэрэнгүй мэдээлэл</span>
									    </li>
								    </ul>
								    <div class="tab-content padding-top-10">
									    <div class="tab-pane fade in active" id="pTab1" runat="server">
										    <ul class="nav nav-tabs tabs-left ">
											    <li class="active" data-formname="ptab1t1">
												    <a href="#pTab1Main" data-toggle="tab">1.1. Хувь хүн</a>
											    </li>
											    <li data-formname="ptab1t2">
												    <a href="#pTab1Main" data-toggle="tab">1.2. Гэр бүл</a>
											    </li>
											    <li data-formname="ptab1t6_2">
												    <a href="#pTab1Main" data-toggle="tab">2. Ур чадвар</a>
											    </li>
											    <li data-formname="ptab1t3">
												    <a href="#pTab1Main" data-toggle="tab">3. Боловсрол</a>
											    </li>
											    <li data-formname="ptab1t4">
												    <a href="#pTab1Main" data-toggle="tab">4. Мэргэшил сургалт</a>
											    </li>
                                                <li data-formname="ptab1t10">
												    <a href="#pTab1Main" data-toggle="tab">5. Цэргийн алба</a>
											    </li>
                                                <li data-formname="ptab1t11">
												    <a href="#pTab1Main" data-toggle="tab">6. Шагнал</a>
											    </li>
											    <li data-formname="ptab1t8">
												    <a href="#pTab1Main" data-toggle="tab">7. Туршлага</a>
											    </li>
											    <li data-formname="ptab1t12">
												    <a href="#pTab1Main" data-toggle="tab">8. Бүтээл</a>
											    </li>
											    <%--<li data-formname="ptab1t7">
												    <a href="#pTab1Main" data-toggle="tab">Гадаад хэл</a>
											    </li>
											    <li data-formname="ptab1t9">
												    <a href="#pTab1Main" data-toggle="tab">Бусад</a>
											    </li>--%>
										    </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="pTab1Main">

											    </div>
                                            </div>
									    </div>
									    <div class="tab-pane fade" id="pTab2" runat="server">
                                            <ul class="nav nav-tabs tabs-left ">
											    <li class="active" data-formname="ptab2t1">
												    <a href="#pTab2Main" data-toggle="tab"><i class="fa fa-user"></i> Одоогийн албан тушаал</a>
											    </li>
											    <li data-formname="ptab2t2">
												    <a href="#pTab2Main" data-toggle="tab"><i class="fa fa-exchange"></i> Дотоод шилжилт хөдөлгөөн</a>
											    </li>
											    <li data-formname="ptab2t3">
												    <a href="#pTab2Main" data-toggle="tab">Түр чөлөөлөх</a>
											    </li>
											    <li data-formname="ptab2t4">
												    <a href="#pTab2Main" data-toggle="tab">Чөлөөлөх</a>
											    </li>
											    <li data-formname="ptab2t5">
												    <a href="#pTab2Main" data-toggle="tab"><i class="fa fa-sign-out"></i> Албанаас халах</a>
											    </li>
											    <li data-formname="ptab2t6">
												    <a href="#pTab2Main" data-toggle="tab"><i class="fa fa-sign-in"></i> Буцаан томилох</a>
											    </li>
											    <li data-formname="ptab2t7">
												    <a href="#pTab2Main" data-toggle="tab"><i class="fa fa-archive"></i> Ажилласан түүх</a>
											    </li>
										    </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="pTab2Main">

											    </div>
                                            </div>
									    </div>
                                        <div class="tab-pane fade in" id="pTab3" runat="server">
                                            <ul class="nav nav-tabs tabs-left">
											    <li class="active" data-formname="ptab3t2">
												    <a href="#pTab3Main" data-toggle="tab">2. Томилгоо</a>
											    </li>
											    <li data-formname="ptab3t3">
												    <a href="#pTab3Main" data-toggle="tab">3. Зэрэг дэв, Цол</a>
											    </li>
											    <li data-formname="ptab3t4">
												    <a href="#pTab3Main" data-toggle="tab">4. Цалин хөлс</a>
											    </li>
											    <li data-formname="ptab3t5">
												    <a href="#pTab3Main" data-toggle="tab">5. Урамшуулал</a>
											    </li>
											    <li data-formname="ptab3t6">
												    <a href="#pTab3Main" data-toggle="tab">6. Нөхөх төлбөр</a>
											    </li>
											    <li data-formname="ptab3t7">
												    <a href="#pTab3Main" data-toggle="tab">7. Шийтгэл</a>
											    </li>
											    <li data-formname="ptab3t8">
												    <a href="#pTab3Main" data-toggle="tab">8. Хувийн хэрэг баяжилт</a>
											    </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="pTab3Main">

											    </div>
                                            </div>
                                        </div>
								    </div>
							    </div>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
	</div>
</div>
<div id="pChangeImageModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h4 class="modal-title">Ажилтаны зураг оруулах</h4>
		    </div>
            <div class="modal-body">
                <div class="row profile-pic text-center">
                    <img id="pChangeImageModalImg" src="../img/avatars/male.png" style="position:static;">
                </div>
                <div class="row" style="margin-top: 50px;">
                    <fieldset>
                        <div class="form-group">
                            <input id="pChangeImageModalInputImageUpload" type="file" class="btn btn-default">
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="modal-footer">
			    <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			    <button id="pChangeImageModalButtonSave" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		    </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    pageSetUp();
    var pagefunction = function () {
        $('#pTab1Main').load('../pg/profileforms/' + $('#pTab1').find('ul').find('li.active').attr('data-formname') + '.aspx?id=' +<%=Request.QueryString["id"]%> +'');
        $('#pTab2Main').load('../pg/profileforms/' + $('#pTab2').find('ul').find('li.active').attr('data-formname') + '.aspx?id=' +<%=Request.QueryString["id"]%> +'');
        $('#pTab3Main').load('../pg/profileforms/' + $('#pTab3').find('ul').find('li.active').attr('data-formname') + '.aspx?id=' +<%=Request.QueryString["id"]%> +'');
        //profileAjillasanJil();
        funcFilledPerAnket1_1();
        funcFilledPerAnket1_2();
        funcFilledPerAnket1_3();
        funcFilledPerAnket1_4();
        funcFilledPerAnket1_5();
        funcFilledPerAnket1_6();
        funcFilledPerAnket1_7();
        funcFilledPerAnket1_8();
        funcFilledPerAnket2_0();
        //formTab1T5Percent();
        //formTab1T6Percent();
        //formTab1T7Percent();
        //formTab1T8Percent();
        //formTab1T9Percent();
        //formTab1T10Percent();
    };
    loadScript("js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js", pagefunction);
    $('#pTab1 > ul li').click(function (e) {
        $('#pTab1Main').load('../pg/profileforms/' + $(this).closest('ul').find('li:eq(' + $(this).index() + ')').attr('data-formname') + '.aspx?id=' +<%=Request.QueryString["id"]%> +'');
    });
    $('#pTab2 > ul li').click(function (e) {
        $('#pTab2Main').load('../pg/profileforms/' + $(this).closest('ul').find('li:eq(' + $(this).index() + ')').attr('data-formname') + '.aspx?id=' +<%=Request.QueryString["id"]%> +'');
    });
    $('#pTab3 > ul li').click(function (e) {
        $('#pTab3Main').load('../pg/profileforms/' + $(this).closest('ul').find('li:eq(' + $(this).index() + ')').attr('data-formname') + '.aspx?id=' +<%=Request.QueryString["id"]%> +'');
    });
    function funcFilledPerAnket1_1() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_1",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-1Per').html(value.PER + '%');
                            $('#profileAnket1-1Per').css('width', value.PER + '%');
                            $('#profileAnket1-1Per').attr('aria-valuenow', value.PER);
                            $('#profileAnket1-1Per').attr('aria-valuetransitiongoal', value.PER);
                            $('#profileAnket1-1Per').removeAttr('class');
                            if (parseInt(value.PER) < 51) $('#profileAnket1-1Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(value.PER) < 100) $('#profileAnket1-1Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket1-1Per').attr('class', 'progress-bar bg-color-greenLight');
                            $('.progress-bar').progressbar({
                                display_text: 'fill'
                            });
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-1Per').html('0%');
                $('#profileAnket1-1Per').css('width', '0%');
                $('#profileAnket1-1Per').attr('aria-valuenow', '0');
                $('#profileAnket1-1Per').attr('aria-valuetransitiongoal', '0');
                $('#profileAnket1-1Per').removeAttr('class');
                $('#profileAnket1-1Per').attr('class', 'progress-bar bg-color-redLight');
                $('.progress-bar').progressbar({
                    display_text: 'fill'
                });
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        <%--globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND(((NVL2(DOMAIN_USER,1,0)+NVL2(MNAME,1,0)+NVL2(LNAME,1,0)+NVL2(FNAME,1,0)+NVL2(BDATE,1,0)+NVL2(BDIST_ID,1,0)+NVL2(NAT_ID,1,0)+NVL2(EDUTP_ID,1,0)+NVL2(SOCPOS_ID,1,0)+NVL2(OCCTYPE_ID,1,0)+NVL2(OCCNAME,1,0)+NVL2(BCITY_ID,1,0)+NVL2(GENDER,1,0)+NVL2(REGNO,1,0)+NVL2(CITNO,1,0)+NVL2(SOCNO,1,0)+NVL2(HEALNO,1,0)+NVL2(ADDRCITY_ID,1,0)+NVL2(ADDRDIST_ID,1,0)+NVL2(ADDRESSNAME,1,0)+NVL2(TEL,1,0)+NVL2(TEL2,1,0)+NVL2(EMAIL,1,0)+NVL2(IMAGE,1,0)+NVL2(RELNAME,1,0)+NVL2(RELATION_ID,1,0)+NVL2(RELADDRESSNAME,1,0)+NVL2(RELTEL,1,0)+NVL2(RELTEL2,1,0)+NVL2(RELEMAIL,1,0))/30)*100) FROM ST_STAFFS WHERE ID=' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileAnket1-1Per').html(data.d + '%');
                $('#profileAnket1-1Per').css('width', data.d + '%');
                $('#profileAnket1-1Per').attr('aria-valuenow', data.d);
                $('#profileAnket1-1Per').attr('aria-valuetransitiongoal', data.d);
                $('#profileAnket1-1Per').removeAttr('class');
                if (parseInt(data.d) < 51) $('#profileAnket1-1Per').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileAnket1-1Per').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileAnket1-1Per').attr('class', 'progress-bar bg-color-greenLight');
                $('.progress-bar').progressbar({
                    display_text: 'fill'
                });
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });--%>
    }

    function funcFilledPerAnket1_2() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_2",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-2Per').css('width', value.PER + '%');
                            if (parseInt(value.PER ) < 51) $('#profileAnket1-2Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER ) > 50 && parseInt(data.d) < 100) $('#profileAnket1-2Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER ) == 100) $('#profileAnket1-2Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-2Per').css('width', '0%');
                $('#profileAnket1-2Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        <%--globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((SUM(CNT)/2)*100) FROM ( SELECT TP, CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFSFAMILY WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +' GROUP BY TP )"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T2Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T2Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T2Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T2Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });--%>
    }
    function funcFilledPerAnket1_3() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_3",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-3Per').css('width', value.PER + '%');
                            if (parseInt(value.PER) < 51) $('#profileAnket1-3Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(data.d) < 100) $('#profileAnket1-3Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket1-3Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-3Per').css('width', '0%');
                $('#profileAnket1-3Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        <%--globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_EDUCATION WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_PHD WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_SCIENCEDEGREE WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/3)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T3Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T3Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T3Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T3Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });--%>
    }
    function funcFilledPerAnket1_4() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_4",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-4Per').css('width', value.PER + '%');
                            if (parseInt(value.PER) < 51) $('#profileAnket1-4Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(data.d) < 100) $('#profileAnket1-4Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket1-4Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-4Per').css('width', '0%');
                $('#profileAnket1-4Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        <%--globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_TRAINING WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/1)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T4Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T4Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T4Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T4Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });--%>
    }
    function funcFilledPerAnket1_5() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_5",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-5Per').css('width', value.PER + '%');
                            if (parseInt(value.PER) < 51) $('#profileAnket1-5Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(data.d) < 100) $('#profileAnket1-5Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket1-5Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-5Per').css('width', '0%');
                $('#profileAnket1-5Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        <%--globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_TRAINING WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/1)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T4Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T4Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T4Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T4Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });--%>
    }
    function funcFilledPerAnket1_6() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_6",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-6Per').css('width', value.PER + '%');
                            if (parseInt(value.PER) < 51) $('#profileAnket1-6Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(data.d) < 100) $('#profileAnket1-6Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket1-6Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-6Per').css('width', '0%');
                $('#profileAnket1-6Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function funcFilledPerAnket1_7() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_7",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-7Per').css('width', value.PER + '%');
                            if (parseInt(value.PER) < 51) $('#profileAnket1-7Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(data.d) < 100) $('#profileAnket1-6Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket1-7Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-7Per').css('width', '0%');
                $('#profileAnket1-7Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function funcFilledPerAnket1_8() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket1_8",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket1-8Per').css('width', value.PER + '%');
                            if (parseInt(value.PER) < 51) $('#profileAnket1-8Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(data.d) < 100) $('#profileAnket1-8Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket1-8Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket1-8Per').css('width', '0%');
                $('#profileAnket1-8Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function funcFilledPerAnket2_0() {
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/GetPerFilledAnket2_0",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            $('#profileAnket2-0Per').css('width', value.PER + '%');
                            if (parseInt(value.PER) < 51) $('#profileAnket2-0Per').attr('class', 'progress-bar bg-color-redLight');
                            else if (parseInt(value.PER) > 50 && parseInt(data.d) < 100) $('#profileAnket2-0Per').attr('class', 'progress-bar bg-color-yellow');
                            else if (parseInt(value.PER) == 100) $('#profileAnket2-0Per').attr('class', 'progress-bar bg-color-greenLight');
                        });
                    }
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                $('#profileAnket2-0Per').css('width', '0%');
                $('#profileAnket2-0Per').attr('class', 'progress-bar bg-color-redLight');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function formTab1T5Percent() {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_JOBTITLEDEGREE WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/1)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T5Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T5Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T5Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T5Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function formTab1T6Percent() {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT COUNT(1) FROM ST_SKILLS WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT COUNT(1) FROM ST_ANOTHERSKILLS WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/33)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T6Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T6Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T6Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T6Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function formTab1T7Percent() {
       // alert("bna");
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_LANGUAGESKILLS WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_SOFTWARE WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_OFFICE WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/3)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T7Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T7Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T7Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T7Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function formTab1T8Percent() {


      
        <%--globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_EXPHISTORY WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT COUNT(1) FROM ST_STATES WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/2)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T8Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T8Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T8Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T8Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });--%>
    }
    function formTab1T9Percent() {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_INNOVATION WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_TOUR WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_CONDITION WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_DISPUTE WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +')+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_BONUS WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'))/5)*100) FROM DUAL"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#profileMainTab1T9Percent').css('width', data.d + '%');
                if (parseInt(data.d) < 51) $('#profileMainTab1T9Percent').attr('class', 'progress-bar bg-color-redLight');
                else if (parseInt(data.d) > 50 && parseInt(data.d) < 100) $('#profileMainTab1T9Percent').attr('class', 'progress-bar bg-color-yellow');
                else if (parseInt(data.d) == 100) $('#profileMainTab1T9Percent').attr('class', 'progress-bar bg-color-greenLight');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function formTab1T10Percent() {

    }
    <%--function profileAjillasanJil() {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"SELECT ROUND(SUM(TOTALTM)/365,1)||\'~\'||ROUND(SUM(ISGOVTM)/365,1)||\'~\'||ROUND(SUM(ISMYORG)/365,1) as TMS FROM ( SELECT SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' +<%=Request.QueryString["id"]%> +' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' +<%=Request.QueryString["id"]%> +' ) UNION ALL SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' +<%=Request.QueryString["id"]%> +' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' +<%=Request.QueryString["id"]%> +' ) WHERE ISGOV=1 UNION ALL SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' +<%=Request.QueryString["id"]%> +' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' +<%=Request.QueryString["id"]%> +' ) WHERE ISMYORG=1 )"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var valTotalYear = 0, valTotalMonth = 0;
                var valISGOVYear = 0, valISGOVMonth = 0;
                var valISMYORGYear = 0, valISMYORGMonth = 0;
                if (data.d.split('~')[0].split('.')[0] != undefined) valTotalYear = data.d.split('~')[0].split('.')[0];
                if (data.d.split('~')[0].split('.')[1] != undefined) valTotalMonth = data.d.split('~')[0].split('.')[1];
                if (data.d.split('~')[1].split('.')[0] != undefined) valISGOVYear = data.d.split('~')[1].split('.')[0];
                if (data.d.split('~')[1].split('.')[1] != undefined) valISGOVMonth = data.d.split('~')[1].split('.')[1];
                if (data.d.split('~')[2].split('.')[0] != undefined) valISMYORGYear = data.d.split('~')[2].split('.')[0];
                if (data.d.split('~')[2].split('.')[1] != undefined) valISMYORGMonth = data.d.split('~')[2].split('.')[1];
                $('#profileMainPWorkedTime').html('Нийт - <strong> ' + valTotalYear + ' жил ' + valTotalMonth + ' сар</strong>, Төрд - <strong>' + valISGOVYear + ' жил ' + valISGOVMonth + ' сар</strong>, Сангийн яам - <strong>' + valISMYORGYear + ' жил ' + valISMYORGMonth + ' сар</strong>');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });
    }--%>


    $('.savebtn').click(function (e) {
        var qryCount='SELECT COUNT(1) FROM ST_STAFFS a WHERE ' + $(this).closest('label').find('input').attr('data-colname') + '=\'' + $.trim($(this).closest('label').find('input').val()) + '\'  AND ID!=' +<%=Request.QueryString["id"]%> +'', qryUpdate = '';
        if ($.trim($(this).closest('label').find('input').attr('data-colname')) == 'REGNO') {
            if ($.trim($(this).closest('label').find('input').val()) == '') alert($(this).closest('label').find('input').attr('placeholder') + ' заавал оруулна уу!');
            else {
                qryUpdate = 'UPDATE ST_STAFFS SET ' + $(this).closest('label').find('input').attr('data-colname') + '=\'' + $.trim($(this).closest('label').find('input').val()) + '\' WHERE ID=' + <%=Request.QueryString["id"]%> + '';
                profileDocumentNosUpdate(qryCount, qryUpdate);
            }
        }
        else {
            if ($.trim($(this).closest('label').find('input')) == '') {
                qryCount = 'SELECT 0 FROM DUAL';
                qryUpdate = 'UPDATE ST_STAFFS SET ' + $(this).closest('label').find('input').attr('data-colname') + '=null WHERE ID=' + <%=Request.QueryString["id"]%> + '';
                profileDocumentNosUpdate(qryCount, qryUpdate);
            }
            else {
                qryUpdate = 'UPDATE ST_STAFFS SET ' + $(this).closest('label').find('input').attr('data-colname') + '=\'' + $.trim($(this).closest('label').find('input').val()) + '\' WHERE ID=' + <%=Request.QueryString["id"]%> + '';
                profileDocumentNosUpdate(qryCount, qryUpdate);
            }
        }
    });
    function profileDocumentNosUpdate(qryCount, qryUpdate) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry":"' + qryCount + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') alert($(this).closest('label').find('input').attr('placeholder') + '-тай ажилтан бүртгэгдсэн байна!');
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
                        data: '{"qry":"' + qryUpdate + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            funcFilledPerAnket1_1();
                            smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied') window.location = '../login';
                            else if (err.Message == 'NullReferenceException') {
                                //alert('NullReferenceException');
                            }
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else if (err.Message == 'NullReferenceException') {
                    //alert('NullReferenceException');
                }
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#pChangeImageModalInputImageUpload").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 2097152) {
            errMsg += 'Файлын хэмжээ 2MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            showImageModal(this);
        }
        else alert(errMsg);
    });
    function showImageModal(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#pChangeImageModalImg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $('#pChangeImageModalButtonSave').click(function (e) {
        if ($.trim($('#pChangeImageModalInputImageUpload').val()) != '') {
            var uploadfiles = $("#pChangeImageModalInputImageUpload").get(0);
            var uploadedfiles = uploadfiles.files;
            var fromdata = new FormData();
            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "pg/UploadFile.ashx?folder=staffs&filename=" + $.trim($('#profileMainInputRegno').val() + "." + $('#pChangeImageModalInputImageUpload').val().split('.').pop()),
                data: fromdata,
                contentType: false,
                processData: false,
                success: function () {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
                        data: '{"qry":"UPDATE ST_STAFFS SET IMAGE=\'' + $.trim($('#profileMainInputRegno').val()) + '.' + $('#pChangeImageModalInputImageUpload').val().split('.').pop() + '\' WHERE ID=' + $('#indexUserId').html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            $('#profileMainImage').attr('src', $('#pChangeImageModalImg').attr('src'));
                            $('#pChangeImageModal').modal('hide');
                            smallBox('Зураг', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login';
                    else alert('Зураг хадгалахад алдаа гарлаа: ' + err.Message);
                }
            });
        }
    });
    $("#profileMainSelectDocRole").change(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
            data: '{"qry":"UPDATE ST_STAFFS SET DOCPERMISSIONID=' + $('#profileMainSelectDocRole option:selected').val() + ' WHERE ID='+$('#indexUserId').html()+'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                smallBox('Бичиг хэргийн эрх', 'Амжилттай хадгалагдлаа', '#659265', 4000);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    function getAge(dateString) {
        if (dateString != '') {
            var today = new Date();
            var birthDate = new Date(dateString);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            return age;
        }
        else return '-';
    }
</script>
