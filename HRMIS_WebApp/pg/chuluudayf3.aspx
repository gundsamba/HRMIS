<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chuluudayf3.aspx.cs" Inherits="HRWebApp.pg.chuluudayf3" %>
<style>
    .stafflistimage {
        width: 25px;
        border-radius: 0;
    }
</style>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa-fw fa fa-home"></i>
    <span>> Чөлөө > 2 дээш өдрийн чөлөө</span>
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> 2 дээш өдрийн чөлөөний хүсэлтийн бүртгэл </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div id="pTab1AddBtnDiv" runat="server" class="Colvis TableTools" style="width:62px; right:810px; top:8px; z-index:5; margin-top:1px;">
                        <button class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Чөлөө нэмэх</button>
                    </div>
                    <div class="Colvis TableTools" style="width:200px; right:130px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectStaff" name="pTab1SelectStaff" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:335px; top:4px; z-index:5; margin-top:7px;"><label>Ажилтан:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:400px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectHeltes" name="pTab1SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:485px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:540px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectGazar" name="pTab1SelectGazar" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:625px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                    <div class="Colvis TableTools" style="width:70px; right:670px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectYear" name="pTab1SelectYear" runat="server" class="form-control" style="padding: 1px;"></select>
                    </div>
                    <div class="Colvis TableTools" style="right:743px; top:4px; z-index:5; margin-top:7px;"><label>Он:</label></div>
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
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">2 дээш өдрийн чөлөө&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Чөлөө хүсэгч</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Газар</label>
                                    <select id="pTab1ModalSelectGazar" name="pTab1ModalSelectGazar" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Хэлтэс</label>
                                    <select id="pTab1ModalSelectHeltes" name="pTab1ModalSelectHeltes" runat="server" class="form-control" style="padding: 5px;" disabled>
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Ажилтан</label>
                                    <select id="pTab1ModalSelectStaff" name="pTab1ModalSelectStaff" runat="server" class="form-control" style="padding: 5px;" disabled>
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
                                    <label class="control-label">*Эхлэх огноо</label>
                                    <input id="pTab1ModalInputBeginDt" name="pTab1ModalInputBeginDt" type="text" class="form-control" placeholder="Эхлэх огноо" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Дуусах огноо</label>
                                    <input id="pTab1ModalInputEndDt" name="pTab1ModalInputEndDt" type="text" class="form-control" placeholder="Дуусах огноо" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Чөлөө авах өдөр</label>
                                    <h4 id="pTab1ModalH4Chuluuday" class="no-margin">00 өдөр</h4>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Шалтгаан</label>
                                    <select id="pTab1ModalSelectReason" name="pTab1ModalSelectReason" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Цалинтай эсэх</label>
                                    <div class="checkbox">
										<label>
											<input id="pTab1ModalInputIssalary" name="pTab1ModalInputIssalary" type="checkbox" class="checkbox style-0">
											<span>Цалинтай</span>
										</label>
									</div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Тайлбар</label>
                                    <input id="pTab1ModalInputDescription" name="pTab1ModalInputDescription" type="text" class="form-control" placeholder="Тайлбар" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Хавсралт</label>
                                    <a id="pTab1ModalInputAttachDelete" class="btn btn-link btn-xs font-sm" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                </div>
                                <div class="col-md-9" style="padding-left: 0;">
                                    <a id="pTab1ModalInputAttachBtn" class="btn btn-link btn-xs font-sm" href="javascript:void(0);" style="padding:0px; border:none;" download="">Файл хавсаргаагүй байна...</a>
                                    <input id="pTab1ModalInputAttachInput" type="file" class="btn btn-default">
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
<div class="modal fade" id="pTab1AttachshowModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
	<div class="modal-dialog">  
		<div class="modal-content">
			
		</div>  
	</div>  
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valData = '', valOptGroup = '';
        var userGazarId = $('#indexUserGazarId').text();
        var userHeltesId = $('#indexUserHeltesId').text();
        var userPosId = $('#indexUserPosId').text();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/gazarListForDDL",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1SelectGazar").html(msg.d);
                $("#pTab1ModalSelectGazar").html(msg.d.replace('- Бүгд -', '- Сонго -'));
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/checkRoles",
                    data: '{stid:"' + $('#indexUserId').text() + '", roles:"1,6"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == '0') {
                            $('#pTab1SelectGazar').val(userGazarId);
                            $('#pTab1SelectGazar').prop('disabled', true);
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/heltesListForDDL",
                                data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    $("#pTab1SelectHeltes").html(msg.d);
                                    if (userPosId != '2010201') {
                                        $('#pTab1SelectHeltes').val(userHeltesId);
                                        $('#pTab1SelectHeltes').prop('disabled', true);
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "../webservice/ServiceMain.svc/StaffListForDDL",
                                            data: '{"gazarId":"' + $("#pTab1SelectGazar option:selected").val() + '", "heltesId":"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
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
                                                if (userPosId != '2010301') {
                                                    $('#pTab1SelectStaff').val($('#indexUserId').text());
                                                    $('#pTab1SelectStaff').prop('disabled', true);
                                                    dataBindTab1Datatable();
                                                }
                                                else {
                                                    $('#pTab1SelectStaff').prop('disabled', false);
                                                    dataBindTab1Datatable();
                                                }
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
                                    else dataBindTab1Datatable();
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
                        else dataBindTab1Datatable();
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
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    //tab1
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/chuluudayf3_chuluudayf3Tab1Datatable",
            data: '{year:"'+$('#pTab1SelectYear option:selected').val()+'", currstaffid:"' + $('#indexUserId').text() + '", gazar:"' + $('#pTab1SelectGazar option:selected').val() + '", heltes:"' + $('#pTab1SelectHeltes option:selected').val() + '", staffid:"' + $('#pTab1SelectStaff option:selected').val() + '"}',
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
        var valData = '', valOptGroup = '';
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').text('');
            $('#pTab1ModalInputBeginDt').val('');
            $('#pTab1ModalInputEndDt').val('');
            $('#pTab1ModalH4Chuluuday').html('0 өдөр');
            $('#pTab1ModalSelectReason').val('');
            $('#pTab1ModalInputIssalary').prop('checked', false);
            $('#pTab1ModalInputDescription').val('');
            $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
            $('#pTab1ModalInputAttachBtn').attr('href', 'javascript:void(0);');
            $('#pTab1ModalInputAttachInput').val('');
        }
        else {
            $('#pTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1ModalSelectGazar').val($(el).closest('tr').find('td:eq(8)').text());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/heltesListForDDL",
                data: '{gazarId:"' + $("#pTab1ModalSelectGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1ModalSelectHeltes").html(msg.d);
                    $('#pTab1ModalSelectHeltes').prop('disabled', false);
                    $("#pTab1ModalSelectHeltes").val($(el).closest('tr').find('td:eq(9)').text());
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/StaffListForDDL",
                        data: '{"gazarId":"' + $("#pTab1ModalSelectGazar option:selected").val() + '", "heltesId":"' + $("#pTab1ModalSelectHeltes option:selected").val() + '"}',
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
                            $("#pTab1ModalSelectStaff").html('<option value="">- Бүгд -</option>' + valData);
                            $('#pTab1ModalSelectStaff').val($(el).closest('tr').find('td:eq(10)').text());
                            $('#pTab1ModalSelectStaff').prop('disabled', false);
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
            $('#pTab1ModalInputBeginDt').val($(el).closest('tr').find('td:eq(2)').html().split('<br>')[0]);
            $('#pTab1ModalInputEndDt').val($(el).closest('tr').find('td:eq(2)').html().split('<br>')[1]);
            var dBeginDt = new Date(parseInt($(el).closest('tr').find('td:eq(2)').html().split('<br>')[0].split('-')[0]), parseInt($(el).closest('tr').find('td:eq(2)').html().split('<br>')[0].split('-')[1]) - 1, parseInt($(el).closest('tr').find('td:eq(2)').html().split('<br>')[0].split('-')[2]));
            var dEndDt = new Date(parseInt($(el).closest('tr').find('td:eq(2)').html().split('<br>')[1].split('-')[0]), parseInt($(el).closest('tr').find('td:eq(2)').html().split('<br>')[1].split('-')[1]) - 1, parseInt($(el).closest('tr').find('td:eq(2)').html().split('<br>')[1].split('-')[2]));
            $('#pTab1ModalH4Chuluuday').html(calcBusinessDays(dBeginDt, dEndDt) + ' өдөр');
            $('#pTab1ModalH4Chuluuday').removeClass('text-danger').addClass('text-success');
            $('#pTab1ModalSelectReason').val($(el).closest('tr').find('td:eq(11)').text());
            if ($.trim($(el).closest('tr').find('td:eq(4)').text()) == 'Цалинтай') $('#pTab1ModalInputIssalary').prop('checked', true);
            else $('#pTab1ModalInputIssalary').prop('checked', false);
            $('#pTab1ModalInputDescription').val($(el).closest('tr').find('td:eq(5)').text());
            if ($.trim($(el).closest('tr').find('td:eq(6)').html()) == '') {
                $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                $('#pTab1ModalInputAttachBtn').attr('href', 'javascript:void(0);');
                $('#pTab1ModalInputAttachInput').val('');
            }
            else {
                $('#pTab1ModalInputAttachBtn').html($(el).closest('tr').find('td:eq(12)').text());
                $('#pTab1ModalInputAttachBtn').attr('href', '../files/chuluuf3/' + $(el).closest('tr').find('td:eq(12)').text());
                $('#pTab1ModalInputAttachInput').val('');
            }
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
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_CHULUUDAYF3 WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        smallBox('Чөлөө', 'Амжилттай устгагдлаа', '#659265', 4000);
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
        });
    }
    $("#pTab1SelectGazar").change(function () {
        if ($("#pTab1SelectGazar option:selected").val() == "") {
            $("#pTab1SelectHeltes").html("<option selected value=\"\">- Бүгд -</option>");
            $("#pTab1SelectHeltes").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/heltesListForDDL",
                data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1SelectHeltes").html(msg.d);
                    $("#pTab1SelectHeltes").prop("disabled", false);
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
        }
    });
    $("#pTab1SelectHeltes").change(function () {
        var valData = '', valOptGroup = '';
        if ($("#pTab1SelectHeltes option:selected").val() == "") {
            $("#pTab1SelectStaff").html("<option selected value=\"\">- Бүгд -</option>");
            $("#pTab1SelectStaff").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/StaffListForDDL",
                data: '{"gazarId":"' + $("#pTab1SelectGazar option:selected").val() + '", "heltesId":"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
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
                    $("#pTab1SelectStaff").prop("disabled", false);
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
        }
    });
    $("#pTab1SelectStaff, #pTab1SelectYear").change(function () {
        dataBindTab1Datatable();
    });
    $("#pTab1ModalSelectGazar").change(function () {
        if ($("#pTab1ModalSelectGazar option:selected").val() == "") {
            $("#pTab1ModalSelectHeltes").html("<option selected value=\"\">- Сонго -</option>");
            $("#pTab1ModalSelectHeltes").prop("disabled", true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/heltesListForDDL",
                data: '{gazarId:"' + $("#pTab1ModalSelectGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1ModalSelectHeltes").html(msg.d.replace('- Бүгд -', '- Сонго -'));
                    $("#pTab1ModalSelectHeltes").prop("disabled", false);
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
    });
    $("#pTab1ModalSelectHeltes").change(function () {
        var valData = '', valOptGroup = '';
        if ($("#pTab1ModalSelectHeltes option:selected").val() == "") {
            $("#pTab1ModalSelectStaff").html("<option selected value=\"\">- Сонго -</option>");
            $("#pTab1ModalSelectStaff").prop("disabled", true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/StaffListForDDL",
                data: '{"gazarId":"' + $("#pTab1ModalSelectGazar option:selected").val() + '", "heltesId":"' + $("#pTab1ModalSelectHeltes option:selected").val() + '"}',
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
                    $("#pTab1ModalSelectStaff").html('<option value="">- Сонго -</option>' + valData);
                    $("#pTab1ModalSelectStaff").prop("disabled", false);
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
    });
    $("#pTab1ModalInputAttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 2971520) {
            errMsg += 'Файлын хэмжээ 20MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png' && valE != 'gif') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png, gif/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab1ModalInputAttachBtn').html($(this).val().split('\\').pop());
        }
        else alert(errMsg);
    });
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalSelectGazar: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectHeltes: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectStaff: {
                group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputBeginDt: {
                group: '.col-md-3',
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
            pTab1ModalInputEndDt: {
                group: '.col-md-3',
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
            pTab1ModalSelectReason: {
                group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
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
            var valIsSalary = '0';
            if ($('#pTab1ModalInputIssalary').is(':checked')) valIsSalary = '1';
            var filename = "";
            if ($('#pTab1ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
                filename = "Чөлөө" + $.trim($('#pTab1ModalSelectStaff option:selected').text().split(' | ')[0]) + $.trim($('#pTab1ModalInputBeginDt').val()) + "T" + $.trim($('#pTab1ModalInputBeginDt').val())+"." + $('#pTab1ModalInputAttachBtn').html().split('.')[$('#pTab1ModalInputAttachBtn').html().split('.').length - 1];
            }
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_CHULUUDAYF3 (ID, STAFFS_ID, BEGINDT, ENDDT, CHULUUREASON_ID, ISSALARY, DESCRIPTION, FILENAME, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_CHULUUDAYF3\'), ' + $('#pTab1ModalSelectStaff option:selected').val() + ', \'' + $.trim($('#pTab1ModalInputBeginDt').val()) + '\', \'' + $.trim($('#pTab1ModalInputEndDt').val()) + '\', ' + $('#pTab1ModalSelectReason option:selected').val() + ', ' + valIsSalary + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '\', ' + strQryIsNull('varchar', filename) + ', ' + $.trim($('#indexUserId').text()) + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if (filename != "") {
                            if ($("#pTab1ModalInputAttachInput").val() != '') {
                                var uploadfiles = $("#pTab1ModalInputAttachInput").get(0);
                                var uploadedfiles = uploadfiles.files;
                                var fromdata = new FormData();
                                fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "pg/UploadFile.ashx?folder=chuluuf3&filename=" + filename,
                                    data: fromdata,
                                    contentType: false,
                                    processData: false,
                                    success: function () {
                                        smallBox('Хавсралт', 'Амжилттай хадгалагдлаа', '#659265', 1000);
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
                        }
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('2 дээш өдрийн чөлөө', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_CHULUUDAYF3 SET STAFFS_ID=' + $('#pTab1ModalSelectStaff option:selected').val() + ', BEGINDT=\'' + $.trim($('#pTab1ModalInputBeginDt').val()) + '\', ENDDT=\'' + $.trim($('#pTab1ModalInputEndDt').val()) + '\', CHULUUREASON_ID=' + $('#pTab1ModalSelectReason option:selected').val() + ', ISSALARY=' + valIsSalary + ', DESCRIPTION=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '\', FILENAME=' + strQryIsNull('varchar', filename) + ', UPDATED_STAFFID=' + $.trim($('#indexUserId').text()) + ', UPDATED_DATE=sysdate WHERE ID=' + $('#pTab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if (filename != "") {
                            if ($("#pTab1ModalInputAttachInput").val() != '') {
                                var uploadfiles = $("#pTab1ModalInputAttachInput").get(0);
                                var uploadedfiles = uploadfiles.files;
                                var fromdata = new FormData();
                                fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "pg/UploadFile.ashx?folder=chuluuf3&filename=" + filename,
                                    data: fromdata,
                                    contentType: false,
                                    processData: false,
                                    success: function () {
                                        smallBox('Хавсралт', 'Амжилттай хадгалагдлаа', '#659265', 1000);
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
                        }
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('2 дээш өдрийн чөлөө', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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

    $('#pTab1ModalInputBeginDt').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        onSelect: function (selectedDate) {
            $('#pTab1ModalInputEndDt').datepicker('option', 'minDate', selectedDate);
            if ($.trim($('#pTab1ModalInputBeginDt').val()) != '' && $.trim($('#pTab1ModalInputEndDt').val()) != '') {
                var dBeginDt = new Date(parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0]), parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[1]) - 1, parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[2]));
                var dEndDt = new Date(parseInt($.trim($('#pTab1ModalInputEndDt').val()).split('-')[0]), parseInt($.trim($('#pTab1ModalInputEndDt').val()).split('-')[1]) - 1, parseInt($.trim($('#pTab1ModalInputEndDt').val()).split('-')[2]));
                $('#pTab1ModalH4Chuluuday').html(calcBusinessDays(dBeginDt, dEndDt) + ' өдөр');
                if (calcBusinessDays(dBeginDt, dEndDt) <= 30 && calcBusinessDays(dBeginDt, dEndDt) > 2) {
                    $('#pTab1ModalH4Chuluuday').removeClass('text-danger').addClass('text-success');
                }
                else {
                    alert('Ажлын 3-30 хүртэл өдөр чөлөө авах боломжтой!');
                    $('#pTab1ModalH4Chuluuday').removeClass('text-success').addClass('text-danger');
                    $('#pTab1ModalInputBeginDt').val('');
                }
            }
        }
    });
    $('#pTab1ModalInputEndDt').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        onSelect: function (selectedDate) {
            $('#pTab1ModalInputBeginDt').datepicker('option', 'maxDate', selectedDate);
            if ($.trim($('#pTab1ModalInputBeginDt').val()) != '' && $.trim($('#pTab1ModalInputEndDt').val()) != '') {
                var dBeginDt = new Date(parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0]), parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[1]) - 1, parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[2]));
                var dEndDt = new Date(parseInt($.trim($('#pTab1ModalInputEndDt').val()).split('-')[0]), parseInt($.trim($('#pTab1ModalInputEndDt').val()).split('-')[1]) - 1, parseInt($.trim($('#pTab1ModalInputEndDt').val()).split('-')[2]));
                $('#pTab1ModalH4Chuluuday').html(calcBusinessDays(dBeginDt, dEndDt) + ' өдөр');
                if (calcBusinessDays(dBeginDt, dEndDt) <= 30 && calcBusinessDays(dBeginDt, dEndDt) > 2) {
                    $('#pTab1ModalH4Chuluuday').removeClass('text-danger').addClass('text-success');
                }
                else {
                    alert('Ажлын 3-30 хүртэл өдөр чөлөө авах боломжтой!');
                    $('#pTab1ModalH4Chuluuday').removeClass('text-success').addClass('text-danger');
                    $('#pTab1ModalInputEndDt').val('');
                }
            }
        }
    });
    function calcBusinessDays(dDate1, dDate2) { // input given as Date objects
        var iWeeks, iDateDiff, iAdjust = 0;
        if (dDate2 < dDate1) return -1; // error code if dates transposed
        var iWeekday1 = dDate1.getDay(); // day of week
        var iWeekday2 = dDate2.getDay();
        iWeekday1 = (iWeekday1 == 0) ? 7 : iWeekday1; // change Sunday from 0 to 7
        iWeekday2 = (iWeekday2 == 0) ? 7 : iWeekday2;
        if ((iWeekday1 > 5) && (iWeekday2 > 5)) iAdjust = 1; // adjustment if both days on weekend
        iWeekday1 = (iWeekday1 > 5) ? 5 : iWeekday1; // only count weekdays
        iWeekday2 = (iWeekday2 > 5) ? 5 : iWeekday2;
        // calculate differnece in weeks (1000mS * 60sec * 60min * 24hrs * 7 days = 604800000)
        iWeeks = Math.floor((dDate2.getTime() - dDate1.getTime()) / 604800000)
        if (iWeekday1 <= iWeekday2) {
            iDateDiff = (iWeeks * 5) + (iWeekday2 - iWeekday1)
        } else {
            iDateDiff = ((iWeeks + 1) * 5) - (iWeekday1 - iWeekday2)
        }
        iDateDiff -= iAdjust // take into account both days on weekend
        return (iDateDiff + 1); // add 1 because dates are inclusive
    }
</script>
