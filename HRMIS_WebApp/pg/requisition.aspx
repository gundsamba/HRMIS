<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requisition.aspx.cs" Inherits="HRWebApp.pg.requisition" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa-fw fa fa-home"></i> > Шаардах хуудас
    </h1>
</div>
<section id="widget-grid">
    <div class="row margin-bottom-10">
        <div class="col-md-12">
            <button id="pTab1AddBtn" runat="server" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Шаардах хуудас бүртгэх</button>
        </div>
    </div>
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" runat="server" class="active" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab1">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Шийдвэрлээгүй шаардах хуудас
                    </a>
                </li>
                <li id="pTab2Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab2">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Бүрэн зөвшөөрсөн шаардах хуудас
                    </a>
                </li>
                <li id="pTab3Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab3">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Бүрэн олгосон шаардах хуудас
                    </a>
                </li>
                <li id="pTab4Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab4">
                        <i class="fa fa-fw fa-lg fa-file-text"></i>
                        Тайлан
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="pTab1" runat="server" class="tab-pane active">
                    <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"> 
                                <i class="fa fa-list-ul"></i> 
                            </span>
                            <h2>Шийдвэрлээгүй шаардах хуудас</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                
                            </div>
                            <div class="Colvis TableTools" style="width:225px; right:125px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectStaff" name="pTab1SelectStaff" runat="server" class="form-control" style="padding: 1px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:355px; top:4px; z-index:5; margin-top:7px;"><label>Ажилтан:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:420px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectHeltes" name="pTab1SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:510px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:565px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectGazar" name="pTab1SelectGazar" runat="server" class="form-control" style="padding: 1px;" disabled>
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:655px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                            <div id="loaderTab1" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab1Table" class="widget-body no-padding">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="pTab2" runat="server" class="tab-pane">
                    <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"> 
                                <i class="fa fa-list-ul"></i> 
                            </span>
                            <h2>Бүрэн зөвшөөрсөн шаардах хуудас</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                
                            </div>
                            <div class="Colvis TableTools" style="width:225px; right:125px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab2SelectStaff" name="pTab2SelectStaff" runat="server" class="form-control" style="padding: 1px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:355px; top:4px; z-index:5; margin-top:7px;"><label>Ажилтан:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:420px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab2SelectHeltes" name="pTab2SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:510px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:565px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab2SelectGazar" name="pTab2SelectGazar" runat="server" class="form-control" style="padding: 1px;" disabled>
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:655px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                            <div id="loaderTab2" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab2Table" class="widget-body no-padding">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="pTab3" runat="server" class="tab-pane">
                    <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"> 
                                <i class="fa fa-list-ul"></i> 
                            </span>
                            <h2>Бүрэн олгосон шаардах хуудас</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                
                            </div>
                            <div class="Colvis TableTools" style="width:225px; right:125px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab3SelectStaff" name="pTab3SelectStaff" runat="server" class="form-control" style="padding: 1px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:355px; top:4px; z-index:5; margin-top:7px;"><label>Ажилтан:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:420px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab3SelectHeltes" name="pTab3SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:510px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:565px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab3SelectGazar" name="pTab3SelectGazar" runat="server" class="form-control" style="padding: 1px;" disabled>
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:655px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                            <div id="loaderTab3" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab3Table" class="widget-body no-padding">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1Modal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button"> ×</button>
                    <h4 class="modal-title" >Шаардах хуудас&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
                </div>
                <div class="modal-body">
                    <div id="pTab1ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Хэнээс</label>
									<select id="pTab1ModalSelectFromStaff" name="pTab1ModalSelectFromStaff" runat="server" class="form-control" style="padding: 1px;">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Хаана</label>
									<select id="pTab1ModalSelectToNegj" name="pTab1ModalSelectToNegj" runat="server" class="form-control" style="padding: 1px;">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
                        </div>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Зориулалт</label>
									<input id="pTab1ModalInputPurposename" name="pTab1ModalInputPurposename" class="form-control" type="text" placeholder="Зориулалт"/>
                                </div>
                            </div>
                        </div>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Тайлбар</label>
									<textarea id="pTab1ModalInputDescription" name="pTab1ModalInputDescription" class="form-control" required="" placeholder="Тайлбар" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Огноо</label>
									<input id="pTab1ModalInputDate" name="pTab1ModalInputDate" class="form-control" type="text" placeholder="Огноо"/>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label">*Бичсэн</label>
									<select id="pTab1ModalSelectModifiedStaff" name="pTab1ModalSelectModifiedStaff" runat="server" class="form-control" style="padding: 1px;">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal" type="button"> Болих </button>
                    <button class="btn btn-success btn-sm" type="submit"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    var globalAjaxVar = null;
    var userGazarId = $('#indexUserGazarId').text();
    var userHeltesId = $('#indexUserHeltesId').text();
    var valData = '', valOptGroup = '';
    var pagefunction = function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/StaffListForSelect2",
            data: '{"selectedList": ""}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valOptGroup = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (value.BRANCH_ID != valOptGroup) {
                        if (valOptGroup != '') valData += '</optgroup>';
                        valData += '<optgroup label="' + value.NEGJNAME + '">';
                    }
                    valData += '<option value="' + value.STAFFS_ID + '" title="' + value.STAFFS_NAME + ' | ' + value.POS_NAME + '">' + value.STAFFS_NAME + '</option>';
                    valOptGroup = value.BRANCH_ID;
                });
                $("#pTab1ModalSelectFromStaff").html('<option value="">- Сонго -</option>' + valData);
                $("#pTab1ModalSelectModifiedStaff").html('<option value="">- Сонго -</option>' + valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/GazarListForDDL",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                        });
                        $('#pTab1ModalSelectToNegj').html('<option value="">- Сонго -</option>' + valData);
                        $('#pTab1SelectGazar').html('<option value="">- Бүгд -</option>' + valData);
                        if (!funcCheckRoles('1,16,17')) {
                            $("#pTab1ModalSelectFromStaff").val($('#indexUserId').html());
                            $('#pTab1ModalSelectFromStaff').prop('disabled', true);
                            $("#pTab1ModalSelectModifiedStaff").val($('#indexUserId').html());
                            $('#pTab1ModalSelectModifiedStaff').prop('disabled', true);
                            $('#pTab1SelectGazar').val(userGazarId);
                            $('#pTab1SelectGazar').prop('disabled', true);
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                                data: '{"gazarId": "' + $("#pTab1SelectGazar option:selected").val() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    valData = '';
                                    $($.parseJSON(data.d)).each(function (index, value) {
                                        valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                                    });
                                    $('#pTab1SelectHeltes').html('<option value="">- Бүгд -</option>' + valData);
                                    $('#pTab1SelectHeltes').val(userHeltesId);
                                    $('#pTab1SelectHeltes').prop('disabled', true);
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "../webservice/ServiceMain.svc/StaffListForDDL",
                                        data: '{"gazarId": "' + $("#pTab1SelectGazar option:selected").val() + '", "heltesId":"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (data) {
                                            valData = '';
                                            valOptGroup = '';
                                            $($.parseJSON(data.d)).each(function (index, value) {
                                                if (value.BR_ID != valOptGroup) {
                                                    if (valOptGroup != '') valData += '</optgroup>';
                                                    valData += '<optgroup label="' + value.DOMAIN_ORG + '">';
                                                }
                                                valData += '<option value="' + value.ST_ID + '" title="' + value.ST_NAME + ' | ' + value.POS_NAME + '">' + value.ST_NAME + '</option>';
                                                valOptGroup = value.BR_ID;
                                            });
                                            $("#pTab1SelectStaff").html('<option value="">- Бүгд -</option>' + valData);
                                            $("#pTab1SelectStaff").val($('#indexUserId').html());
                                            $('#pTab1SelectStaff').prop('disabled', true);
                                            dataBindTab1DataTable();

                                            var valLiId = $('#pTab1Li').closest('ul').find('.active').attr('id');
                                            if (valLiId == 'pTab1Li') {
                                                dataBindTab1DataTable();
                                            }
                                            else if (valLiId == 'pTab2Li') {
                                                dataBindTab2DataTable();
                                            }
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
                                    window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
                        else {
                            $('#pTab1SelectGazar').prop('disabled', false);
                            $('#pTab1SelectHeltes').prop('disabled', true);
                            $('#pTab1SelectStaff').html('<option value="">- Бүгд -</option>');
                            $('#pTab1SelectStaff').prop('disabled', true);
                            dataBindTab1DataTable();

                            var valLiId = $('#pTab1Li').closest('ul').find('.active').attr('id');
                            if (valLiId == 'pTab1Li') {
                                dataBindTab1DataTable();
                            }
                            else if (valLiId == 'pTab2Li') {
                                dataBindTab2DataTable();
                            }
                        }
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';;
                    }
                });
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    function pDatabindTabs(el) {
        if ($.trim($(el).attr('id')) == 'pTab1Li') {
            if ($.trim($('#divBindTab1Table').html()) == "") {
                dataBindTab1DataTable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divBindTab2Table').html()) == "") {
                dataBindTab2DataTable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divBindTab2Table').html()) == "") {
                dataBindTab2DataTable();
            }
        }
    }
    function dataBindTab1DataTable() {
        valData = '';
    }


    $("#pTab1SelectGazar").change(function () {
        if ($("#pTab1SelectGazar option:selected").val() == "") {
            $("#pTab1SelectHeltes").html("<option selected value=\"\">- Бүгд -</option>");
            $("#pTab1SelectHeltes").prop("disabled", true);
            $('#pTab1SelectStaff').html('<option value="">- Бүгд -</option>');
            $('#pTab1SelectStaff').prop('disabled', true);
            dataBindTab1DataTable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                data: '{"gazarId": "' + $("#pTab1SelectGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                    });
                    $("#pTab1SelectHeltes").html('<option value="">- Бүгд -</option>' + valData);
                    $("#pTab1SelectHeltes").prop("disabled", false);
                    $('#pTab1SelectStaff').html('<option value="">- Бүгд -</option>');
                    $('#pTab1SelectStaff').prop('disabled', true);
                    dataBindTab1DataTable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#pTab1SelectHeltes").change(function () {
        if ($("#pTab1SelectHeltes option:selected").val() == "") {
            $('#pTab1SelectStaff').html('<option value="">- Бүгд -</option>');
            $('#pTab1SelectStaff').prop('disabled', true);
            dataBindTab1DataTable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/StaffListForDDL",
                data: '{"gazarId": "' + $("#pTab1SelectGazar option:selected").val() + '", "heltesId":"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    valOptGroup = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        if (value.BR_ID != valOptGroup) {
                            if (valOptGroup != '') valData += '</optgroup>';
                            valData += '<optgroup label="' + value.DOMAIN_ORG + '">';
                        }
                        valData += '<option value="' + value.ST_ID + '" title="' + value.ST_NAME + ' | ' + value.POS_NAME + '">' + value.ST_NAME + '</option>';
                        valOptGroup = value.BR_ID;
                    });
                    $('#pTab1SelectStaff').html('<option value="">- Бүгд -</option>' + valData);
                    $('#pTab1SelectStaff').prop('disabled', true);
                    dataBindTab1DataTable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#pTab1SelectHeltes").change(function () {
        dataBindTab1DataTable();
    });
    $('#pTab1ModalInputDate').datepicker({
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