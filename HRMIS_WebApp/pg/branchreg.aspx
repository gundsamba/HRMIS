<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="branchreg.aspx.cs" Inherits="HRWebApp.pg.branchreg" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa-fw fa fa-home"></i>
    <span>> Тохиргоо > Газар нэгж</span>
    </h1>
</div>
<section id="widget-grid">
    <div id="pIsRole" runat="server" class="row" style="display:none;">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            ТАНЬД ХАНДАХ ЭРХ БАЙХГҮЙ БАЙНА!
        </div>
    </div>
    <div id="pMainDiv" runat="server" class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Газар нэгжийн бүртгэл </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div class="Colvis TableTools" style="width:95px; right:195px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectIsActive" name="pTab1SelectIsActive" runat="server" class="form-control" style="padding: 5px;">
							<option value="">- Бүгд -</option>
                            <option value="1">Идэвхтэй</option>
                            <option value="0">Идэвхгүй</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:300px; top:7px; z-index:5; line-height: 14px;text-align: right;"><label>Идэвхтэй<br />эсэх: </label></div>
                    <div class="Colvis TableTools" style="width:80px; right:370px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectType" name="pTab1SelectType" runat="server" class="form-control" style="padding: 5px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:455px; top:4px; z-index:5; margin-top:7px;"><label>Төрөл: </label></div>
                    <div id="loaderTab1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Газар нэгжийн бүртгэл&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Газар нэгжийн төрөл</label>
                                    <select id="pTab1ModalSelectType" name="pTab1ModalSelectType" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Төрөл сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Харьялагдах нэгж <small class="text-muted font-xs"><i>/Шаардлагатай бол/</i></small></label>
                                    <select id="pTab1ModalSelectFather" name="pTab1ModalSelectFather" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Нэгж сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">*Өөрчлөгдөх төрөл</label>
                                    <select id="pTab1ModalSelectChangeType" name="pTab1ModalSelectChangeType" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Өөрчлөгдөх төрөл сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Газрын нэр /Монгол/</label>
									<input id="pTab1ModalInputNameMon" name="pTab1ModalInputNameMon" type="text" class="form-control" placeholder="Газрын нэр /Монгол/" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Газрын нэр /Англи/</label>
									<input id="pTab1ModalInputNameEng" name="pTab1ModalInputNameEng" type="text" class="form-control" placeholder="Газрын нэр /Англи/" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Тэмдэглэл</label>
                                    <textarea class="form-control" id="pTab1ModalInputDescription" name="pTab1ModalInputDescription" placeholder="Тэмдэглэл" rows="2" maxlength="500"></textarea>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Дарааллын дугаар</label>
									<input id="pTab1ModalInputSort" name="pTab1ModalInputSort" type="text" class="form-control" placeholder="Дарааллын дугаар" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Тушаалын огноо /Жил-Сар-Өдөр/</label>
									<input id="pTab1ModalInputDate" name="pTab1ModalInputDate" type="text" class="form-control" placeholder="Тушаалын огноо" />
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
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/branchreg_branchregTab1ModalTypeForDDL",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1ModalSelectType").html(msg.d);
                $("#pTab1SelectType").html(msg.d.replace('- Төрөл сонго -', '- Бүгд -'));
                dataBindTab1Datatable();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
        dataBindTab1ModalSelectFather();
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    $("#pTab1SelectType, #pTab1SelectIsActive").click(function () {
        dataBindTab1Datatable();
    });
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/branchreg_branchregTab1DatatableTab1Datatable",
            data: '{tp:"' + $('#pTab1SelectType option:selected').val() + '", isactive:"' + $('#pTab1SelectIsActive option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1Table").html(msg.d);
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').text('');
            $('#pTab1ModalSelectType').val('');
            $('#pTab1ModalSelectFather').val('');
            dataBindTab1ModalSelectChangeType(1);
            $('#pTab1ModalInputNameMon').val('');
            $('#pTab1ModalInputNameEng').val('');
            $('#pTab1ModalInputDescription').val('');
            $('#pTab1ModalInputSort').val('');
            $('#pTab1ModalInputDate').val('');
        }
        else if (isinsupt == 'шинэчлэх') {
            $('#pTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteScalar",
                data: '{qry:"SELECT ID||\'~\'||FATHER_ID||\'~\'||NAME||\'~\'||NAME_ENG||\'~\'||BRANCH_TYPE_ID||\'~\'||BRANCH_CHANGETYPE_ID||\'~\'||DESCRIPTION||\'~\'||SORT||\'~\'||DT FROM ST_BRANCH WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $('#pTab1ModalSelectType').val(msg.d.split('~')[4]);
                    if (msg.d.split('~')[0] == msg.d.split('~')[1]) $('#pTab1ModalSelectFather').val('');
                    else $('#pTab1ModalSelectFather').val(msg.d.split('~')[1]);
                    dataBindTab1ModalSelectChangeType(0);
                    $('#pTab1ModalInputNameMon').val(msg.d.split('~')[2]);
                    $('#pTab1ModalInputNameEng').val(msg.d.split('~')[3]);
                    $('#pTab1ModalInputDescription').val(msg.d.split('~')[6]);
                    $('#pTab1ModalInputSort').val(msg.d.split('~')[7]);
                    $('#pTab1ModalInputDate').val(msg.d.split('~')[8]);
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
        else {
            $('#pTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/branchreg_branchregTab1ModalChangeTypeForDDL",
                data: '{isinsert:""}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1ModalSelectChangeType").html(msg.d);
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteScalar",
                        data: '{qry:"SELECT ID||\'~\'||FATHER_ID||\'~\'||NAME||\'~\'||NAME_ENG||\'~\'||BRANCH_TYPE_ID||\'~\'||BRANCH_CHANGETYPE_ID||\'~\'||DESCRIPTION||\'~\'||SORT||\'~\'||DT FROM ST_BRANCH WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#pTab1ModalSelectType').val(msg.d.split('~')[4]);
                            if (msg.d.split('~')[0] == msg.d.split('~')[1]) $('#pTab1ModalSelectFather').val('');
                            else $('#pTab1ModalSelectFather').val(msg.d.split('~')[1]);
                            $("#pTab1ModalSelectChangeType").val(msg.d.split('~')[5]);
                            $('#pTab1ModalInputNameMon').val(msg.d.split('~')[2]);
                            $('#pTab1ModalInputNameEng').val(msg.d.split('~')[3]);
                            $('#pTab1ModalInputDescription').val(msg.d.split('~')[6]);
                            $('#pTab1ModalInputSort').val(msg.d.split('~')[7]);
                            $('#pTab1ModalInputDate').val(msg.d.split('~')[8]);
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
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    }
    function dataBindTab1ModalSelectChangeType(isinsert) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/branchreg_branchregTab1ModalChangeTypeForDDL",
            data: '{isinsert:"' + isinsert + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1ModalSelectChangeType").html(msg.d);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dataBindTab1ModalSelectFather() {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/branchreg_branchregTab1ModalFatherForDDL",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1ModalSelectFather").html(msg.d);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalSelectType: {
                //group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Газар нэгжийн төрөл сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectChangeType: {
                //group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Өөрчлөгдөх төрөл сонгоно уу'
                    }
                }
            },
            pTab1ModalInputNameMon: {
                //group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Газрын нэр /Монгол/ оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Газрын нэр /Монгол/ уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputNameEng: {
                //group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Газрын нэр /Англи/ оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Газрын нэр /Англи/ уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputDescription: {
                //group: '.col-md-12',
                validators: {
                    stringLength: {
                        max: 500,
                        message: 'Тэмдэглэл уртдаа 500 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputSort: {
                //group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Дарааллын дугаар оруулна уу'
                    },
                    stringLength: {
                        max: 5,
                        message: 'Дарааллын дугаар уртдаа 5 тэмдэгт оруулна уу'
                    },
                    numeric: {
                        message: 'Дарааллын дугаар зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputDate: {
                //group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Тушаалын огноо оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var arrNameVal = $.trim($('#pTab1ModalInputNameMon').val()).split(' ');
            var arrNameEngVal = $.trim($('#pTab1ModalInputNameEng').val()).split(' ');
            var valInitName = '', valInitNameEng = '';
            for (var i = 0; i < arrNameVal.length; i++) valInitName += arrNameVal[i].charAt(0);
            for (var i = 0; i < arrNameEngVal.length; i++) valInitNameEng += arrNameEngVal[i].charAt(0);
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/BRANCH_INSERT",
                    data: '{P_FATHER_ID:"' + $('#pTab1ModalSelectFather option:selected').val() + '", P_INITNAME:"' + valInitName.toUpperCase() + '", P_NAME:"' + $.trim($('#pTab1ModalInputNameMon').val()) + '", P_INITNAME_ENG:"' + valInitNameEng.toUpperCase() + '", P_NAME_ENG:"' + $.trim($('#pTab1ModalInputNameEng').val()) + '", P_BRANCH_TYPE_ID:"' + $('#pTab1ModalSelectType option:selected').val() + '", P_BRANCH_CHANGETYPE_ID:"' + $('#pTab1ModalSelectChangeType option:selected').val() + '", P_DESCRIPTION:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '", P_SORT:"' + $.trim($('#pTab1ModalInputSort').val()) + '", P_STAFFID:"' + $.trim($('#indexUserId').html()) + '", P_DT:"' + $.trim($('#pTab1ModalInputDate').val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        dataBindTab1ModalSelectFather();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Газар нэгж', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else if ($('#pTab1ModalHeaderLabel').text() == 'шинэчлэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/BRANCH_UPDATE",
                    data: '{P_MAIN_ID:"' + $.trim($('#pTab1ID').html()) + '", P_FATHER_ID:"' + $('#pTab1ModalSelectFather option:selected').val() + '", P_INITNAME:"' + valInitName.toUpperCase() + '", P_NAME:"' + $.trim($('#pTab1ModalInputNameMon').val()) + '", P_INITNAME_ENG:"' + valInitNameEng.toUpperCase() + '", P_NAME_ENG:"' + $.trim($('#pTab1ModalInputNameEng').val()) + '", P_BRANCH_TYPE_ID:"' + $('#pTab1ModalSelectType option:selected').val() + '", P_BRANCH_CHANGETYPE_ID:"' + $('#pTab1ModalSelectChangeType option:selected').val() + '", P_DESCRIPTION:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '", P_SORT:"' + $.trim($('#pTab1ModalInputSort').val()) + '", P_STAFFID:"' + $.trim($('#indexUserId').html()) + '", P_DT:"' + $.trim($('#pTab1ModalInputDate').val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        dataBindTab1ModalSelectFather();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Газар нэгж', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else if ($('#pTab1ModalHeaderLabel').text() == 'засах') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/BRANCH_REPLACE",
                    data: '{P_ID:"' + $.trim($('#pTab1ID').html()) + '", P_FATHER_ID:"' + $('#pTab1ModalSelectFather option:selected').val() + '", P_INITNAME:"' + valInitName.toUpperCase() + '", P_NAME:"' + $.trim($('#pTab1ModalInputNameMon').val()) + '", P_INITNAME_ENG:"' + valInitNameEng.toUpperCase() + '", P_NAME_ENG:"' + $.trim($('#pTab1ModalInputNameEng').val()) + '", P_BRANCH_TYPE_ID:"' + $('#pTab1ModalSelectType option:selected').val() + '", P_BRANCH_CHANGETYPE_ID:"' + $('#pTab1ModalSelectChangeType option:selected').val() + '", P_DESCRIPTION:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '", P_SORT:"' + $.trim($('#pTab1ModalInputSort').val()) + '", P_STAFFID:"' + $.trim($('#indexUserId').html()) + '", P_DT:"' + $.trim($('#pTab1ModalInputDate').val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        dataBindTab1ModalSelectFather();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Газар нэгж', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
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
