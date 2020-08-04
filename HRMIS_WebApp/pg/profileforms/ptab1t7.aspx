<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t7.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t7" %>
<style type="text/css">
    .isYesOrNo {
        cursor:pointer;
    }
</style>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Гадаад хэлний мэдлэг </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T7Section1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T7Section1Modal" data-toggle="modal" onclick="showAddEditTab1T7Section1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T7Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T7Section1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Эзэмшсэн програм </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T7Section2AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T7Section2Modal" data-toggle="modal" onclick="showAddEditTab1T7Section2(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T7Section2" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T7Section2Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Оффис-ын тоног төхөөрөмж ашиглах </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T7Section3AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T7Section3Modal" data-toggle="modal" onclick="showAddEditTab1T7Section3(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T7Section3" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T7Section3Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1T7Section1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T7Section1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Гадаад хэлний мэдлэг&nbsp;<span id="pTab1T7Section1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T7Section1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Гадаад хэлний нэр</label>
                                    <select id="pTab1T7Section1ModalSelectLanguage" name="pTab1T7Section1ModalSelectLanguage" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Сонсож ойлгох</label>
                                    <select id="pTab1T7Section1ModalSelectListenGrade" name="pTab1T7Section1ModalSelectListenGrade" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Ярих</label>
                                    <select id="pTab1T7Section1ModalSelectSpeakGrade" name="pTab1T7Section1ModalSelectSpeakGrade" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Унших</label>
                                    <select id="pTab1T7Section1ModalSelectReadGrade" name="pTab1T7Section1ModalSelectReadGrade" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Бичих</label>
                                    <select id="pTab1T7Section1ModalSelectWriteGrade" name="pTab1T7Section1ModalSelectWriteGrade" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
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
<div id="pTab1T7Section2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="pTab1T7Section2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Эзэмшсэн програм&nbsp;<span id="pTab1T7Section2ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T7Section2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Эзэмшсэн програмын нэр</label>
                                    <select id="pTab1T7Section2ModalSelectSoftware" name="pTab1T7Section2ModalSelectSoftware" runat="server" class="form-control" style="padding: 5px;">
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
                                    <label class="control-label">*Түвшин</label>
                                    <select id="pTab1T7Section2ModalSelectGrade" name="pTab1T7Section2ModalSelectGrade" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
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
<div id="pTab1T7Section3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="pTab1T7Section3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Оффис-ын тоног төхөөрөмж&nbsp;<span id="pTab1T7Section3ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T7Section3ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Оффис-ын тоног төхөөрөмж</label>
                                    <select id="pTab1T7Section3ModalSelectOffice" name="pTab1T7Section3ModalSelectOffice" runat="server" class="form-control" style="padding: 5px;">
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
                                    <label class="control-label">*Түвшин</label>
                                    <select id="pTab1T7Section3ModalSelectGrade" name="pTab1T7Section3ModalSelectGrade" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
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
    dataBindTab1T7Section1Datatable();
    dataBindTab1T7Section2Datatable();
    dataBindTab1T7Section3Datatable();
    function dataBindTab1T7Section1Datatable() {
        showLoader('loaderTab1T7Section1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T7Datatable1",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T7Section1Table").html(msg.d);
                formTab1T7Percent();
                hideLoader('loaderTab1T7Section1');
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
    function dataBindTab1T7Section2Datatable() {
        showLoader('loaderTab1T7Section2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T7Datatable2",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T7Section2Table").html(msg.d);
                formTab1T7Percent();
                hideLoader('loaderTab1T7Section2');
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
    function dataBindTab1T7Section3Datatable() {
        showLoader('loaderTab1T7Section3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T7Datatable3",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T7Section3Table").html(msg.d);
                formTab1T7Percent();
                hideLoader('loaderTab1T7Section3');
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
    function showAddEditTab1T7Section1(el, isinsupt) {
        $('#pTab1T7Section1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T7Section1ID').html('');
            $('#pTab1T7Section1ModalSelectLanguage').val('');
            $('#pTab1T7Section1ModalSelectListenGrade').val('');
            $('#pTab1T7Section1ModalSelectSpeakGrade').val('');
            $('#pTab1T7Section1ModalSelectReadGrade').val('');
            $('#pTab1T7Section1ModalSelectWriteGrade').val('');
        }
        else {
            $('#pTab1T7Section1ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T7Section1ModalSelectLanguage').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1T7Section1ModalSelectListenGrade').val($(el).closest('tr').find('td:eq(8)').text());
            $('#pTab1T7Section1ModalSelectSpeakGrade').val($(el).closest('tr').find('td:eq(9)').text());
            $('#pTab1T7Section1ModalSelectReadGrade').val($(el).closest('tr').find('td:eq(10)').text());
            $('#pTab1T7Section1ModalSelectWriteGrade').val($(el).closest('tr').find('td:eq(11)').text());
        }
    }
    function showAddEditTab1T7Section2(el, isinsupt) {
        $('#pTab1T7Section2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T7Section2ID').html('');
            $('#pTab1T7Section2ModalSelectSoftware').val('');
            $('#pTab1T7Section2ModalSelectGrade').val('');
        }
        else {
            $('#pTab1T7Section2ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T7Section2ModalSelectSoftware').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1T7Section2ModalSelectGrade').val($(el).closest('tr').find('td:eq(5)').text());
        }
    }
    function showAddEditTab1T7Section3(el, isinsupt) {
        $('#pTab1T7Section3ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T7Section3ID').html('');
            $('#pTab1T7Section3ModalSelectOffice').val('');
            $('#pTab1T7Section3ModalSelectGrade').val('');
        }
        else {
            $('#pTab1T7Section3ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T7Section3ModalSelectOffice').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1T7Section3ModalSelectGrade').val($(el).closest('tr').find('td:eq(5)').text());
        }
    }
    function showDeleteTab1T7Section1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_LANGUAGESKILLS WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section1Datatable();
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
    function showDeleteTab1T7Section2(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_SOFTWARE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section2Datatable();
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
    function showDeleteTab1T7Section3(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_OFFICE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section3Datatable();
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
    $('#pTab1T7Section1ModalForm').bootstrapValidator({
        fields: {
            pTab1T7Section1ModalSelectLanguage: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T7Section1ModalSelectListenGrade: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T7Section1ModalSelectSpeakGrade: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T7Section1ModalSelectReadGrade: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T7Section1ModalSelectWriteGrade: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T7Section1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_LANGUAGESKILLS (ID, STAFFS_ID, LANGUAGE_ID, LISTEN_GRADE_ID, SPEAK_GRADE_ID, READ_GRADE_ID, WRITE_GRADE_ID, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_LANGUAGESKILLS\'), ' +<%=Request.QueryString["id"]%> +', \'' + $('#pTab1T7Section1ModalSelectLanguage option:selected').val() + '\', ' + $('#pTab1T7Section1ModalSelectListenGrade option:selected').val() + ', ' + $('#pTab1T7Section1ModalSelectSpeakGrade option:selected').val() + ', ' + $('#pTab1T7Section1ModalSelectReadGrade option:selected').val() + ', ' + $('#pTab1T7Section1ModalSelectWriteGrade option:selected').val() + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section1Datatable();
                        $('#pTab1T7Section1Modal').modal('hide');
                        smallBox('Гадаад хэлний мэдлэг', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_LANGUAGESKILLS SET LANGUAGE_ID=\'' + $('#pTab1T7Section1ModalSelectLanguage option:selected').val() + '\', LISTEN_GRADE_ID=' + $('#pTab1T7Section1ModalSelectListenGrade option:selected').val() + ', SPEAK_GRADE_ID=' + $('#pTab1T7Section1ModalSelectSpeakGrade option:selected').val() + ', READ_GRADE_ID=' + $('#pTab1T7Section1ModalSelectReadGrade option:selected').val() + ', WRITE_GRADE_ID=' + $('#pTab1T7Section1ModalSelectWriteGrade option:selected').val() + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T7Section1ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section1Datatable();
                        $('#pTab1T7Section1Modal').modal('hide');
                        smallBox('Гадаад хэлний мэдлэг', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
    $('#pTab1T7Section2ModalForm').bootstrapValidator({
        fields: {
            pTab1T7Section2ModalSelectSoftware: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T7Section2ModalSelectGrade: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T7Section2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_SOFTWARE (ID, STAFFS_ID, SOFTWARE_ID, GRADE_ID, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_SOFTWARE\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T7Section2ModalSelectSoftware option:selected').val() + ', ' + $('#pTab1T7Section2ModalSelectGrade option:selected').val() + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section2Datatable();
                        $('#pTab1T7Section2Modal').modal('hide');
                        smallBox('Эзэмшсэн програм', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_SOFTWARE SET SOFTWARE_ID=' + $('#pTab1T7Section2ModalSelectSoftware option:selected').val() + ', GRADE_ID=' + $('#pTab1T7Section2ModalSelectGrade option:selected').val() + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T7Section2ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section2Datatable();
                        $('#pTab1T7Section2Modal').modal('hide');
                        smallBox('Эзэмшсэн програм', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
    $('#pTab1T7Section3ModalForm').bootstrapValidator({
        fields: {
            pTab1T7Section3ModalSelectOffice: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T7Section3ModalSelectGrade: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T7Section3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_OFFICE (ID, STAFFS_ID, OFFICE_ID, GRADE_ID, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_OFFICE\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T7Section3ModalSelectOffice option:selected').val() + ', ' + $('#pTab1T7Section3ModalSelectGrade option:selected').val() + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section3Datatable();
                        $('#pTab1T7Section3Modal').modal('hide');
                        smallBox('Оффис-ын тоног төхөөрөмж ашиглах', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_OFFICE SET OFFICE_ID=' + $('#pTab1T7Section3ModalSelectOffice option:selected').val() + ', GRADE_ID=' + $('#pTab1T7Section3ModalSelectGrade option:selected').val() + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T7Section3ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T7Section3Datatable();
                        $('#pTab1T7Section3Modal').modal('hide');
                        smallBox('Оффис-ын тоног төхөөрөмж ашиглах', 'Амжилттай засварлагдлаа', '#659265', 4000);
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

</script>
