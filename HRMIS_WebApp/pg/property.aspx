<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="property.aspx.cs" Inherits="HRWebApp.pg.property" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa-fw fa fa-home"></i>
        <span>> Эд хөрөнгийн бүртгэл</span>
    </h1>
</div>
<section id="widget-grid">
    <div id="pIsRole" runat="server" class="row" style="display:none;">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            ТАНЬД ХАНДАХ ЭРХ БАЙХГҮЙ БАЙНА!
        </div>
    </div>
    <div id="pMainDiv" runat="server" class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" runat="server" class="active" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab1">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Эд хөрөнгийн бүртгэл
                    </a>
                </li>
                <li id="pTab2Li" runat="server" onclick="pDatabindTabs(this)" class="pull-right">
                    <a data-toggle="tab" href="#pTab2">
                        <i class="fa fa-fw fa-lg fa-wrench"></i>
                        Эд хогшил, техник хэрэгсэлийн нэр бүртгэх
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
                            <h2 id="pTab1H2Title" runat="server">Эд хөрөнгийн бүртгэл</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                <button id="pTab1AddBtn" runat="server" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                            </div>
                            <div class="Colvis TableTools" style="width:155px; right:195px; top:5px; z-index:5; margin-top:1px;">
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
                                <i class="fa fa-wrench"></i> 
                            </span>
                            <h2 id="pTab2H2Title" runat="server">Эд хөрөнгийн бүртгэл</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                <button id="pTab2AddBtn" runat="server" class="btn btn-primary btn-xs" type="button" data-target="#pTab2Modal" data-toggle="modal" onclick="showAddEditTab2(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                            </div>
                            <div id="loaderTab2" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab2Table" class="widget-body no-padding">
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
                    <h4 class="modal-title" >Эд хөрөнгө&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
                </div>
                <div class="modal-body">
                    <div id="pTab1ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label>*Хүлээн авсан огноо</label>
                                    <input id="pTab1ModalInputReceivedDate" name="pTab1ModalInputReceivedDate" type="text" class="form-control" placeholder="Хүлээн авсан огноо" />
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label">*Код</label>
									<input id="pTab1ModalInputCode" name="pTab1ModalInputCode" class="form-control" type="text" placeholder="Код"/>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Эд хогшил, техник хэрэгсэл</label>
									<select id="pTab1ModalSelectPropertyList" name="pTab1ModalSelectPropertyList" runat="server" class="form-control" style="padding: 5px;">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Хэмжих нэгж</label>
									<select id="pTab1ModalSelectUnitList" name="pTab1ModalSelectUnitList" runat="server" class="form-control" style="padding: 5px;">
								        <option value="">- Сонго -</option>
							        </select>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label">*Нэгж үнэ</label>
									<input id="pTab1ModalInputUnitPrice" name="pTab1ModalInputUnitPrice" class="form-control text-right" type="text" placeholder="Нэгж үнэ"/>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Тэмдэглэгээ</label>
									<textarea id="pTab1ModalInputDescription" name="pTab1ModalInputDescription" class="form-control" required="" placeholder="Тэмдэглэгээ" rows="3"></textarea>
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
<div id="pTab2Modal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab2ModalForm">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button"> ×</button>
                    <h4 class="modal-title" >Эд хогшил, техник хэрэгсэл&nbsp;<span id="pTab2ModalHeaderLabel"></span></h4>
                </div>
                <div class="modal-body">
                    <div id="pTab2ModalID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Нэр</label>
									<textarea id="pTab2ModalInputName" name="pTab2ModalInputName" class="form-control" required="" placeholder="Нэр" rows="3"></textarea>
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
    var pagefunction = function () {
        var valLiId = $('#pTab1Li').closest('ul').find('.active').attr('id');
        if (valLiId == 'pTab1Li') {
            dataBindTab1DataTableFirst();
        }
        else if (valLiId == 'pTab2Li') {
            dataBindTab2DataTable();
        }
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
                dataBindTab1DataTableFirst();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divBindTab2Table').html()) == "") {
                dataBindTab2DataTable();
            }
        }
    }
    function dataBindTab1DataTableFirst() {
        var userGazarId = $('#indexUserGazarId').text();
        var userHeltesId = $('#indexUserHeltesId').text();
        var valData = '', valOptGroup = '';
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
                $('#pTab1SelectGazar').html(valData);
                $('#pTab1SelectGazar').val(userGazarId);
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
                        $('#pTab1SelectHeltes').html(valData);
                        $('#pTab1SelectHeltes').val(userHeltesId);
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
                                $("#pTab1SelectStaff").html(valData);
                                $("#pTab1SelectStaff").val($('#indexUserId').html());
                                if (!funcCheckRoles('1,14')) {
                                    $('#pTab1SelectGazar').prop('disabled', true);
                                    if ($('#indexUserPosId').html() != '2010201') {
                                        if ($('#indexUserPosId').html() != '2010301') {
                                            $('#pTab1SelectStaff').prop('disabled', true);
                                        }
                                        else {
                                            $('#pTab1SelectStaff').prop('disabled', false);
                                        }
                                    }
                                    else {
                                        $('#pTab1SelectHeltes, #pTab1SelectStaff').prop('disabled', false);
                                    }
                                }
                                else {
                                    $('#pTab1SelectGazar, #pTab1SelectHeltes, #pTab1SelectStaff').prop('disabled', false);
                                }
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../webservice/ServiceMain.svc/PropertyTab1PropertyTypeListForDDL",
                                    data: '{}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        valData = '';
                                        $($.parseJSON(data.d)).each(function (index, value) {
                                            valData += '<option value="' + value.ID + '">' + value.NAME + '</option>';
                                        });
                                        $('#pTab1ModalSelectPropertyList').html('<option value="">- Сонго -</option>'+valData);
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "../webservice/ServiceMain.svc/PropertyTab1UnitListForDDL",
                                            data: '{}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (data) {
                                                valData = '';
                                                $($.parseJSON(data.d)).each(function (index, value) {
                                                    valData += '<option value="' + value.ID + '">' + value.NAME + '</option>';
                                                });
                                                $('#pTab1ModalSelectUnitList').html('<option value="">- Сонго -</option>' + valData);
                                                dataBindTab1DataTable();
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
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';;
            }
        });
    }
    function dataBindTab1DataTable() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/PropertyTab1Datatable",
            data: '{"staffid": "' + $('#pTab1SelectStaff option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += '<table id="pTab1Datatable" class="table table-striped table-bordered table-hover smart-form" width="100%"><thead>';
                valData += '<tr>';
                valData += '<th class="text-center" style="vertical-align:middle;">#</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Хүлээн авсан огноо</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Код</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Эд хогшил, техник хэрэгсэл</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Хэмжих нэгж</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Нэгж үнэ /₮/</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Тэмдэглэгээ / Онцлог шинж чанар</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Засварлах</th>';
                valData += '</tr>';
                valData += '</thead><tbody>';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += '<tr data-id="' + value.PROPERTYLIST_ID + '">';
                    valData += '<td>' + value.ROWNO + '</td>';
                    valData += '<td>' + value.RECEIVEDDT + '</td>';
                    valData += '<td>' + value.CODE + '</td>';
                    valData += '<td data-id="' + value.PROPERTYTYPELIST_ID + '">' + replaceDatabaseToDisplay(value.PROPERTYTYPELIST_NAME) + '</td>';
                    valData += '<td data-id="' + value.UNITLIST_ID + '">' + replaceDatabaseToDisplay(value.UNITLIST_NAME) + '</td>';
                    valData += '<td>' + value.UNITPRICE.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")+'.00' + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.DESCRIPTION) + '</td>';
                    valData += '<td>';
                    valData += '<div class="btn-group">';
                    valData += '<button type="button" class="btn btn-default btn-xs" onclick="showAddEditTab1(this,\'засах\');" data-target="#pTab1Modal" data-toggle="modal"><i class="fa fa-pencil"></i></button>';
                    valData += '<button type="button" class="btn btn-default btn-xs" onclick="showDeleteTab1(this);"><i class="fa fa-trash-o"></i></button>';
                    valData += '</div>';
                    valData += '</td>';
                    valData += '</tr>';
                });
                valData += '</tbody>';
                valData += '</table>';
                valData += '<script>';
                valData += "var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#pTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"20px\", \"className\":\"text-right\" },{ \"sWidth\": \"74px\", \"className\":\"text-center\" },{ \"sWidth\": \"74px\", \"className\":\"text-center\" }, null, { \"sWidth\": \"52px\" }, { \"sWidth\": \"76px\", \"className\":\"text-right\" }, null,{ \"sWidth\": \"45px\" }]});";
                valData += '<\/script>';
                $("#divBindTab1Table").html(valData);
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').html(isinsupt);
        $('#pTab1ModalID').html('');
        $('#pTab1ModalInputReceivedDate, #pTab1ModalInputCode, #pTab1ModalSelectPropertyList, #pTab1ModalSelectUnitList, #pTab1ModalInputUnitPrice, pTab1ModalInputDescription').val('');
        if (isinsupt == 'засах') {
            $('#pTab1ModalID').text($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalInputReceivedDate').val($.trim($(el).closest('tr').find('td:eq(1)').html()));
            $('#pTab1ModalInputCode').val($.trim($(el).closest('tr').find('td:eq(2)').html()));
            $('#pTab1ModalSelectPropertyList').val($.trim($(el).closest('tr').find('td:eq(3)').attr('data-id')));
            $('#pTab1ModalSelectUnitList').val($.trim($(el).closest('tr').find('td:eq(4)').attr('data-id')));
            $('#pTab1ModalInputUnitPrice').val($.trim($(el).closest('tr').find('td:eq(5)').html().split('.')[0].replace(/,/g,'')));
            $('#pTab1ModalInputDescription').val($.trim($(el).closest('tr').find('td:eq(6)').html()));
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мэдээллийг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
                    data: '{"qry": "DELETE FROM ST_PROPERTYUSE WHERE PROPERTYLIST_ID=' + $(el).closest('tr').attr('data-id') + ' AND STAFFS_ID=' + $('#pTab1SelectStaff option:selected').val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1DataTable();
                        smallBox('Сонгосон мэдээлэл', 'Амжилттай устлаа...', '#659265', 3000);
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
    }
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalInputReceivedDate: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Огноо оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1ModalInputCode: {
                group: '.col-md-8',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 20,
                        message: 'Уртдаа 20 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalSelectPropertyList: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectUnitList: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputUnitPrice: {
                group: '.col-md-8',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 15,
                        message: 'Уртдаа 15 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputDescription: {
                group: '.col-md-12',
                validators: {
                    stringLength: {
                        max: 500,
                        message: 'Уртдаа 500 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($("#pTab1ModalHeaderLabel").html() == "нэмэх") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
                    data: '{"qry": "SELECT COUNT(1) as CNT FROM ST_PROPERTYUSE WHERE PROPERTYLIST_ID = (SELECT ID FROM ST_PROPERTYLIST WHERE CODE=\'' + $.trim($('#pTab1ModalInputCode').val()) + '\') AND HANDADDATE is null"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != '0') {
                            alert($.trim($('#pTab1ModalInputCode').val()) +' кодтой эд хөрөнгийн бүртгэл идэвхтэй бүртгэгдсэн байна.');
                        }
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../webservice/ServiceMain.svc/PROPERTYUSE_INSERT",
                                data: '{"P_RECEIVEDDT": "' + $.trim($('#pTab1ModalInputReceivedDate').val()) + '", "P_CODE": "' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCode').val())) + '", "P_PROPERTYTYPELIST_ID": "' + $('#pTab1ModalSelectPropertyList option:selected').val() + '", "P_UNITLIST_ID": "' + $('#pTab1ModalSelectUnitList option:selected').val() + '", "P_UNITPRICE": "' + $.trim($('#pTab1ModalInputUnitPrice').val()) + '", "P_DESCRIPTION": "' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '", "P_STAFFS_ID": "' + $('#pTab1SelectStaff option:selected').val() + '", "P_MOD_STAFFS_ID": "' + $.trim($('#indexUserId').html()) + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1DataTable();
                                    $('#pTab1Modal').modal('hide');
                                    smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
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
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
                    data: '{"qry": "SELECT COUNT(1) as CNT FROM ST_PROPERTYLIST WHERE ID!=' + $.trim($('#pTab1ModalID').html()) + ' AND CODE=\'' + $.trim($('#pTab1ModalInputCode').val()) + '\'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != '0') {
                            alert($.trim($('#pTab1ModalInputCode').val()) + ' кодтой эд хөрөнгө бүртгэлтэй байна! Дахин шалгана уу!');
                        }
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
                                data: '{"qry": "SELECT COUNT(1) as CNT FROM ST_PROPERTYUSE WHERE PROPERTYLIST_ID = (SELECT ID FROM ST_PROPERTYLIST WHERE CODE=\'' + $.trim($('#pTab1ModalInputCode').val()) + '\') AND HANDADDATE is null AND STAFFS_ID != ' + $('#pTab1SelectStaff option:selected').val() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    if (data.d != '0') {
                                        alert($.trim($('#pTab1ModalInputCode').val()) + ' кодтой эд хөрөнгийн бүртгэл ондоо ажилтан дээр идэвхтэй бүртгэгдсэн байна.');
                                    }
                                    else {
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "../webservice/ServiceMain.svc/PROPERTYUSE_UPDATE",
                                            data: '{"P_PROPERTYLIST_ID": "' + $.trim($('#pTab1ModalID').html()) + '", "P_RECEIVEDDT": "' + $.trim($('#pTab1ModalInputReceivedDate').val()) + '", "P_CODE": "' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCode').val())) + '", "P_PROPERTYTYPELIST_ID": "' + $('#pTab1ModalSelectPropertyList option:selected').val() + '", "P_UNITLIST_ID": "' + $('#pTab1ModalSelectUnitList option:selected').val() + '", "P_UNITPRICE": "' + $.trim($('#pTab1ModalInputUnitPrice').val()) + '", "P_DESCRIPTION": "' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '", "P_STAFFS_ID": "' + $('#pTab1SelectStaff option:selected').val() + '", "P_MOD_STAFFS_ID": "' + $.trim($('#indexUserId').html()) + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function () {
                                                dataBindTab1DataTable();
                                                $('#pTab1Modal').modal('hide');
                                                smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                                            },
                                            failure: function (response) {
                                                alert('FAILURE: ' + response.d);
                                            },
                                            error: function (xhr, status, error) {
                                                window.location = '../#pg/error500.aspx';
                                            }
                                        });
                                    }
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });                
            }
        }
    });
    $("#pTab1SelectStaff").change(function () {
        dataBindTab1DataTable();
    });


    function dataBindTab2DataTable() {
        var valData = '';
        var valIsEdit = '0';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/PropertyTab2Datatable",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                if (funcCheckRoles('1,14')) {
                    valIsEdit = '1';
                }
                valData += '<table id="pTab2Datatable" class="table table-striped table-bordered table-hover smart-form" width="100%"><thead>';
                valData += '<tr>';
                valData += '<th class="text-center" style="vertical-align:middle;">#</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Нэр</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Засварлах</th>';
                valData += '</tr>';
                valData += '</thead><tbody>';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += '<tr data-id="' + value.ID + '">';
                    valData += '<td>' + value.ROWNO + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.NAME) + '</td>';
                    valData += '<td>';
                    valData += '<div class="btn-group">';
                    if (valIsEdit == '1') {
                        valData += '<button type="button" class="btn btn-default btn-xs" onclick="showAddEditTab2(this,\'засах\');" data-target="#pTab2Modal" data-toggle="modal"><i class="fa fa-pencil"></i></button>';
                        valData += '<button type="button" class="btn btn-default btn-xs" onclick="showDeleteTab2(this);"><i class="fa fa-trash-o"></i></button>';
                    }
                    else {
                        valData += '<button type="button" class="btn btn-default btn-xs" onclick="alert(\'Хандах эрх байхгүй байна.!\');"><i class="fa fa-pencil"></i></button>'
                        valData += '<button type="button" class="btn btn-default btn-xs" onclick="alert(\'Хандах эрх байхгүй байна.\');"><i class="fa fa-trash-o"></i></button>'
                    }
                    valData += '</div>';
                    valData += '</td>';
                    valData += '</tr>';
                });
                valData += '</tbody>';
                valData += '</table>';
                valData += '<script>';
                valData += "var responsiveHelper_pTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#pTab2Datatable').dataTable({\"bSort\":false, \"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab2Datatable) {responsiveHelper_pTab2Datatable = new ResponsiveDatatablesHelper($('#pTab2Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_pTab2Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_pTab2Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"20px\" },null,{ \"sWidth\": \"45px\" }]});";
                valData += '<\/script>';
                $("#divBindTab2Table").html(valData);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/PropertyTab1PropertyTypeListForDDL",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += '<option value="' + value.ID + '">' + value.NAME + '</option>';
                        });
                        $('#pTab1ModalSelectPropertyList').html('<option value="">- Сонго -</option>' + valData);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab2(el, isinsupt) {
        $('#pTab2ModalHeaderLabel').html(isinsupt);
        $('#pTab2ModalID').html('');
        $('#pTab2ModalInputName').val('');
        if (isinsupt == 'засах') {
            $('#pTab2ModalID').text($(el).closest('tr').attr('data-id'));
            $('#pTab2ModalInputName').val($.trim($(el).closest('tr').find('td:eq(1)').html()));
        }
    }
    function showDeleteTab2(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
            data: '{"qry": "SELECT COUNT(1) FROM ST_PROPERTYLIST WHERE PROPERTYTYPELIST_ID=' + $(el).closest('tr').attr('data-id') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d != '0') {
                    alert('Сонгосон эд хогшил, техник хэрэгсэлд хамааралтай мэдээлэл орсон тул устгах боломжгүй байна!');
                }
                else {
                    $.SmartMessageBox({
                        title: "Анхааруулга!",
                        content: "Сонгосон мэдээллийг устгах уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
                                data: '{"qry": "DELETE FROM STN_PROPERTYTYPELIST WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab2DataTable();
                                    smallBox('Сонгосон мэдээлэл', 'Амжилттай устлаа...', '#659265', 3000);
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
                }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#pTab2ModalForm').bootstrapValidator({
        fields: {
            pTab2ModalInputName: {
                group: '.col-md-9',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 125,
                        message: 'Уртдаа 125 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($("#pTab2ModalHeaderLabel").html() == "нэмэх") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
                    data: '{"qry": "INSERT INTO STN_PROPERTYTYPELIST (ID, NAME) VALUES (TBLLASTID(\'STN_PROPERTYTYPELIST\'), \'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val())) + '\')"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2DataTable();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
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
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
                    data: '{"qry": "UPDATE STN_PROPERTYTYPELIST SET NAME=\'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val())) + '\' WHERE ID=' + $('#pTab2ModalID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2DataTable();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });
    $('#pTab1ModalInputReceivedDate').datepicker({
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
