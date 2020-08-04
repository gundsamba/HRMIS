<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t4.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t4" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Мэргэшил сургалт <small>/ Мэргэжлээрээ болон бусад чиглэлээр нарийн мэргэшүүлэх багц сургалтанд хамрагдсан байдлыг бичнэ /</small></h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T4Section1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T4Section1Modal" data-toggle="modal" onclick="showAddEditTab1T4Section1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T4Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T4Section1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Эрдмийн цол <small>/ Дэд профессор, академийн гишүүдийг оролцуулан /</small> </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T3Section3AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T3Section3Modal" data-toggle="modal" onclick="showAddEditTab1T3Section3(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T3Section3" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T3Section3Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1T4Section1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T4Section1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Мэргэшил сургалт&nbsp;<span id="pTab1T4Section1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T4Section1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Хаана</label>
                                    <select id="pTab1T4Section1ModalSelectStudylocation" name="pTab1T4Section1ModalSelectStudylocation" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label">*Ямар байгууллагад</label>
                                    <input id="pTab1T4Section1ModalInputOrgname" name="pTab1T4Section1ModalInputOrgname" type="text" class="form-control" placeholder="Ямар байгууллагад" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Эхэлсэн огноо</label>
                                    <input id="pTab1T4Section1ModalInputFromdate" name="pTab1T4Section1ModalInputFromdate" type="text" class="form-control" placeholder="Эхэлсэн огноо" />
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">*Дууссан огноо</label>
                                    <input id="pTab1T4Section1ModalInputTodate" name="pTab1T4Section1ModalInputTodate" type="text" class="form-control" placeholder="Дууссан огноо" />
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">*Хугацаа</label>
                                    <select id="pTab1T4Section1ModalSelectStudytime" name="pTab1T4Section1ModalSelectStudytime" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Ямар чиглэлээр</label>
                                    <input id="pTab1T4Section1ModalInputSubjectdesc" name="pTab1T4Section1ModalInputSubjectdesc" type="text" class="form-control" placeholder="Ямар чиглэлээр" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">Үнэмлэх гэрчилгээний #</label>
                                    <input id="pTab1T4Section1ModalInputCertificateno" name="pTab1T4Section1ModalInputCertificateno" type="text" class="form-control" placeholder="Үнэмлэх гэрчилгээний #" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Олгосон огноо</label>
                                    <input id="pTab1T4Section1ModalInputCertificatedate" name="pTab1T4Section1ModalInputCertificatedate" type="text" class="form-control" placeholder="Олгосон огноо" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="pTab1T3Section3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T3Section3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Эрдмийн цол&nbsp;<span id="pTab1T3Section3ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T3Section3ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Цол</label>
                                    <select id="pTab1T3Section3ModalSelectSciencedegree" name="pTab1T3Section3ModalSelectSciencedegree" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Цол олгосон байгууллага</label>
                                    <input id="pTab1T3Section3ModalInputInstitutename" name="pTab1T3Section3ModalInputInstitutename" type="text" class="form-control" placeholder="Цол олгосон байгууллага" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Огноо</label>
                                    <input id="pTab1T3Section3ModalSelectDate" name="pTab1T3Section3ModalSelectDate" type="text" class="form-control" placeholder="Огноо" />
                                </div>
                                <div class="col-md-9">
                                    <label class="control-label">Гэрчилгээ, Дипломын #</label>
                                    <input id="pTab1T3Section3ModalInputCertificateno" name="pTab1T3Section3ModalInputCertificateno" type="text" class="form-control" placeholder="Гэрчилгээ, Дипломын #" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    dataBindTab1T4Section1Datatable();
    dataBindTab1T3Section3Datatable();
    function dataBindTab1T4Section1Datatable() {
        showLoader('loaderTab1T4Section1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T4Datatable1",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T4Section1Table").html(msg.d);
                hideLoader('loaderTab1T4Section1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dataBindTab1T3Section3Datatable() {
        showLoader('loaderTab1T3Section3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T3Datatable3",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T3Section3Table").html(msg.d);
                hideLoader('loaderTab1T3Section3');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab1T4Section1(el, isinsupt) {
        $('#pTab1T4Section1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T4Section1ID').html('');
            $('#pTab1T4Section1ModalSelectStudylocation').val('');
            $('#pTab1T4Section1ModalInputOrgname').val('');
            $('#pTab1T4Section1ModalInputFromdate').val('');
            $('#pTab1T4Section1ModalInputTodate').val('');
            $('#pTab1T4Section1ModalSelectStudytime').val('');
            $('#pTab1T4Section1ModalInputSubjectdesc').val('');
            $('#pTab1T4Section1ModalInputCertificateno').val('');
            $('#pTab1T4Section1ModalInputCertificatedate').val('');
        }
        else {
            $('#pTab1T4Section1ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T4Section1ModalSelectStudylocation').val($(el).closest('tr').find('td:eq(10)').text());
            $('#pTab1T4Section1ModalInputOrgname').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1T4Section1ModalInputFromdate').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T4Section1ModalInputTodate').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1T4Section1ModalSelectStudytime').val($(el).closest('tr').find('td:eq(11)').text());
            $('#pTab1T4Section1ModalInputSubjectdesc').val($(el).closest('tr').find('td:eq(6)').text());
            $('#pTab1T4Section1ModalInputCertificateno').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1T4Section1ModalInputCertificatedate').val($(el).closest('tr').find('td:eq(8)').text());
        }
    }
    function showAddEditTab1T3Section3(el, isinsupt) {
        $('#pTab1T3Section3ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T3Section3ID').html('');
            $('#pTab1T3Section3ModalSelectSciencedegree').val('');
            $('#pTab1T3Section3ModalInputInstitutename').val('');
            $('#pTab1T3Section3ModalSelectDate').val('');
            $('#pTab1T3Section3ModalInputCertificateno').val('');
        }
        else {
            $('#pTab1T3Section2ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T3Section3ModalSelectSciencedegree').val($(el).closest('tr').find('td:eq(6)').text());
            $('#pTab1T3Section3ModalInputInstitutename').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1T3Section3ModalSelectDate').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T3Section3ModalInputCertificateno').val($(el).closest('tr').find('td:eq(4)').text());
        }
    }
    function showDeleteTab1T4Section1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_TRAINING WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T4Section1Datatable();
                        smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    function showDeleteTab1T3Section3(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_SCIENCEDEGREE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section3Datatable();
                        smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $('#pTab1T4Section1ModalForm').bootstrapValidator({
        fields: {
            pTab1T4Section1ModalSelectStudylocation: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T4Section1ModalInputOrgname: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1T4Section1ModalInputFromdate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1T4Section1ModalInputTodate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1T4Section1ModalSelectStudytime: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },

            pTab1T4Section1ModalInputSubjectdesc: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1T4Section1ModalInputCertificateno: {
                validators: {
                    stringLength: {
                        max: 20,
                        message: 'Уртдаа 20 тэмдэгт авна'
                    }
                }
            },
            pTab1T4Section1ModalInputCertificatedate: {
                validators: {
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T4Section1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_TRAINING (ID, STAFFS_ID, STUDYLOCATION_ID, ORGNAME, FROMDATE, TODATE, STUDYTIME_ID, SUBJECTDESC, CERTIFICATENO, CERTIFICATEDATE, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_TRAINING\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T4Section1ModalSelectStudylocation option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T4Section1ModalInputOrgname').val())) + '\', \'' + $.trim($('#pTab1T4Section1ModalInputFromdate').val()) + '\', \'' + $.trim($('#pTab1T4Section1ModalInputTodate').val()) + '\', ' + $('#pTab1T4Section1ModalSelectStudytime option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T4Section1ModalInputSubjectdesc').val())) + '\', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T4Section1ModalInputCertificateno').val()))) + ', ' + strQryIsNull('varchar', $.trim($('#pTab1T4Section1ModalInputCertificatedate').val())) + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T4Section1Datatable();
                        $('#pTab1T4Section1Modal').modal('hide');
                        smallBox('Мэргэшил сургалт', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_TRAINING SET STUDYLOCATION_ID=' + $('#pTab1T4Section1ModalSelectStudylocation option:selected').val() + ', ORGNAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T4Section1ModalInputOrgname').val())) + '\', FROMDATE=\'' + $.trim($('#pTab1T4Section1ModalInputFromdate').val()) + '\', TODATE=\'' + $.trim($('#pTab1T4Section1ModalInputTodate').val()) + '\', STUDYTIME_ID=' + $('#pTab1T4Section1ModalSelectStudytime option:selected').val() + ', SUBJECTDESC=\'' + replaceDisplayToDatabase($.trim($('#pTab1T4Section1ModalInputSubjectdesc').val())) + '\', CERTIFICATENO=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T4Section1ModalInputCertificateno').val()))) + ', CERTIFICATEDATE=' + strQryIsNull('varchar', $.trim($('#pTab1T4Section1ModalInputCertificatedate').val())) + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T4Section1ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T4Section1Datatable();
                        $('#pTab1T4Section1Modal').modal('hide');
                        smallBox('Мэргэшил сургалт', 'Амжилттай засварлагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });
    $('#pTab1T3Section3ModalForm').bootstrapValidator({
        fields: {
            pTab1T3Section3ModalSelectSciencedegree: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section3ModalInputInstitutename: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1T3Section3ModalSelectDate: {
                validators: {
                    validators: {
                        date: {
                            format: 'YYYY-MM-DD',
                            message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                        }
                    }
                }
            },
            pTab1T3Section3ModalInputCertificateno: {
                validators: {
                    stringLength: {
                        max: 20,
                        message: 'Уртдаа 20 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T3Section3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_SCIENCEDEGREE (ID, STAFFS_ID, SCIENCEDEGREE_ID, INSTITUTENAME, DEGREEDATE, CERTIFICATENO, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_SCIENCEDEGREE\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T3Section3ModalSelectSciencedegree option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputInstitutename').val())) + '\', \'' + $.trim($('#pTab1T3Section3ModalSelectDate').val()) + '\', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputCertificateno').val()))) + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section3Datatable();
                        $('#pTab1T3Section3Modal').modal('hide');
                        smallBox('Эрдмийн цол', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_SCIENCEDEGREE SET SCIENCEDEGREE_ID=' + $('#pTab1T3Section3ModalSelectSciencedegree option:selected').val() + ', INSTITUTENAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputInstitutename').val())) + '\', DEGREEDATE=\'' + $.trim($('#pTab1T3Section3ModalSelectDate').val()) + '\', CERTIFICATENO=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputCertificateno').val()))) + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T3Section2ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section3Datatable();
                        $('#pTab1T3Section3Modal').modal('hide');
                        smallBox('Эрдмийн цол', 'Амжилттай засварлагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });

    $('#pTab1T4Section1ModalInputFromdate, #pTab1T4Section1ModalInputTodate, #pTab1T4Section1ModalInputCertificatedate, #pTab1T3Section3ModalSelectDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя']
    });
</script>
