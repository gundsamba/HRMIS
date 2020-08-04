<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chuluutime.aspx.cs" Inherits="HRWebApp.pg.chuluutime" %>
<style>
    .stafflistimage {
        width: 25px;
        border-radius: 0;
    }
</style>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa-fw fa fa-home"></i>
    <span>> Чөлөө > Цагийн чөлөө</span>
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
                    <h2> Цагийн чөлөөний хүсэлтийн бүртгэл </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:205px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Цагийн чөлөө хүсэх</button>
                    </div>
                    <div class="Colvis TableTools" style="width:200px; right:280px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectStaff" name="pTab1SelectStaff" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:485px; top:4px; z-index:5; margin-top:7px;"><label>Ажилтан:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:550px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectHeltes" name="pTab1SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:635px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:690px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectGazar" name="pTab1SelectGazar" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:775px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                    <div class="Colvis TableTools" style="width:70px; right:820px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectYear" name="pTab1SelectYear" runat="server" class="form-control" style="padding: 1px;"></select>
                    </div>
                    <div class="Colvis TableTools" style="right:893px; top:4px; z-index:5; margin-top:7px;"><label>Он:</label></div>
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
			        <h4 class="modal-title">Цагийн чөлөөний хүсэлт&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Хүсэлт гаргагч</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-1">
                                    <img id="pTab1ModalImage" runat="server" src="../img/avatars/male.png" style="height:52px;">
                                </div>
                                <div id="pTab1ModalDivStaffDet" runat="server" class="col-md-10">
                                    
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Огноо</label>
                                    <input id="pTab1ModalInputDt" name="pTab1ModalInputDt" type="text" class="form-control" placeholder="Огноо" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Эхлэх цаг</label>
                                    <select id="pTab1ModalSelectBegintm" name="pTab1ModalSelectBegintm" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Дуусах цаг</label>
                                    <select id="pTab1ModalSelectEndtm" name="pTab1ModalSelectEndtm" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Чөлөө авах цаг</label>
                                    <h4 id="pTab1ModalH4Chuluutime" class="no-margin">00 цаг 00 мин</h4>
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
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/checkRoles",
                    data: '{stid:"' + $('#indexUserId').text() + '", roles:"1"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == '0') {
                            $('#pTab1SelectGazar').val(userGazarId);
                            $('#pTab1SelectGazar').prop('disabled',true);
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
                                            url: "ws.aspx/staffListForDDL",
                                            data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '", heltesId:"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (msg) {
                                                $("#pTab1SelectStaff").html(msg.d);
                                                if (userPosId != '2010301') {
                                                    $('#pTab1SelectStaff').val($('#indexUserId').text());
                                                    $('#pTab1SelectStaff').prop('disabled', true);
                                                    dataBindTab1Datatable();
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
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/timeListForDDL",
            data: '{begintime:"08:30", endtime:"17:30", intervalmin:"30"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1ModalSelectBegintm").html(msg.d);
                $("#pTab1ModalSelectEndtm").html(msg.d);
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
            url: "ws.aspx/chuluutime_chuluutimeTab1Datatable",
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
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').text('');
            $('#pTab1ModalInputDt').val('');
            $('#pTab1ModalSelectBegintm').val('');
            $('#pTab1ModalSelectEndtm').val('');
            $('#pTab1ModalH4Chuluutime').val('00 цаг 00 мин');
            $('#pTab1ModalH4Chuluutime').removeClass('text-danger').removeClass('text-success');
            $('#pTab1ModalSelectReason').val('');
            $('#pTab1ModalInputIssalary').prop('checked',false);
            $('#pTab1ModalInputDescription').val('');
        }
        else {
            $('#pTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1ModalInputDt').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1ModalSelectBegintm').val($(el).closest('tr').find('td:eq(3)').text().split('-')[0]);
            $('#pTab1ModalSelectEndtm').val($(el).closest('tr').find('td:eq(3)').text().split('-')[1]);
            $('#pTab1ModalH4Chuluutime').html(toHHMMSS(timeToSeconds($(el).closest('tr').find('td:eq(3)').text().split('-')[1] + ':00') - timeToSeconds($(el).closest('tr').find('td:eq(3)').text().split('-')[0] + ':00')));
            $('#pTab1ModalH4Chuluutime').removeClass('text-danger').addClass('text-success');
            $('#pTab1ModalSelectReason').val($(el).closest('tr').find('td:eq(10)').text());
            if ($.trim($(el).closest('tr').find('td:eq(5)').text()) == 'Цалинтай') $('#pTab1ModalInputIssalary').prop('checked', true);
            else $('#pTab1ModalInputIssalary').prop('checked', false);
            $('#pTab1ModalInputDescription').val($(el).closest('tr').find('td:eq(6)').text());
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
                    data: '{qry:"DELETE FROM ST_CHULUUTIME WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
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
        if ($("#pTab1SelectHeltes option:selected").val() == "") {
            $("#pTab1SelectStaff").html("<option selected value=\"\">- Бүгд -</option>");
            $("#pTab1SelectStaff").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/staffListForDDL",
                data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '", heltesId:"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1SelectStaff").html(msg.d);
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
    $("#pTab1ModalSelectBegintm, #pTab1ModalSelectEndtm").change(function () {
        if ($("#pTab1ModalSelectBegintm option:selected").val() != "" && $("#pTab1ModalSelectEndtm option:selected").val()) {
            if (timeToSeconds($("#pTab1ModalSelectBegintm option:selected").val() + ':00') >= timeToSeconds($("#pTab1ModalSelectEndtm option:selected").val() + ':00')) {
                $('#pTab1ModalH4Chuluutime').html(toHHMMSS(timeToSeconds($("#pTab1ModalSelectEndtm option:selected").val() + ':00') - timeToSeconds($("#pTab1ModalSelectBegintm option:selected").val() + ':00')));
                $('#pTab1ModalH4Chuluutime').removeClass('text-success').addClass('text-danger');
                alert('Дуусах цаг эхлэх цагаас их байна!');
                $("#pTab1ModalSelectEndtm").val('');
            }
            else {
                if (timeToSeconds($("#pTab1ModalSelectEndtm option:selected").val() + ':00') - timeToSeconds($("#pTab1ModalSelectBegintm option:selected").val() + ':00') >= 3600 && timeToSeconds($("#pTab1ModalSelectEndtm option:selected").val() + ':00') - timeToSeconds($("#pTab1ModalSelectBegintm option:selected").val() + ':00') <= 21600) {
                    $('#pTab1ModalH4Chuluutime').html(toHHMMSS(timeToSeconds($("#pTab1ModalSelectEndtm option:selected").val() + ':00') - timeToSeconds($("#pTab1ModalSelectBegintm option:selected").val() + ':00')));
                    $('#pTab1ModalH4Chuluutime').removeClass('text-danger').addClass('text-success');
                }
                else {
                    $('#pTab1ModalH4Chuluutime').html(toHHMMSS(timeToSeconds($("#pTab1ModalSelectEndtm option:selected").val() + ':00') - timeToSeconds($("#pTab1ModalSelectBegintm option:selected").val() + ':00')));
                    $('#pTab1ModalH4Chuluutime').removeClass('text-success').addClass('text-danger');
                    alert('1-6 цагийн чөлөө авах боломжтой...');
                    $("#pTab1ModalSelectEndtm").val('');
                }
            }
        }
    });
    function saveReceive(me) {
        var valIsReceived = 'null';
        var valId = $(me).closest('tr').find('td:eq(0)').text();
        var DT = $(me).closest('tr').find('td:eq(2)').text();
        var FINGERID = $(me).closest('tr').find('td:eq(11)').text();
        var BEGINTM = $(me).closest('tr').find('td:eq(12)').text();
        var ENDTM = $(me).closest('tr').find('td:eq(13)').text();

        var DT_year = DT.split('-')[0];
        var DT_month = DT.split('-')[1];
        var DT_day = DT.split('-')[2];
        var start_hours = BEGINTM.split(/:/)[0];
        var start_min = BEGINTM.split(/:/)[1];

        var end_hours = ENDTM.split(/:/)[0];
        var end_min = ENDTM.split(/:/)[1];

       // alert(end_min);
       // start_hours = start_hours.toLocaleString('en-US', { hour: 'numeric', hour12: true });
        var start_hours = start_hours % 12 || 12;

        var x = 12; //or whatever offset
        var CurrentDate = new Date();
     //   DT_month = CurrentDate.setMonth(DT_month + x);


       // DT_month =("0" + DT_month).slice(-2)
        DT_month = Number(DT_month);
        DT_day = Number(DT_day);
       // var end_min = end_min % 12 || 12;
     //   alert(DT_month);

       // alert(start_hours);
        if($(me).val() != '') valIsReceived = $(me).val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteNonQuery",
            data: '{qry:"UPDATE ST_CHULUUTIME SET ISRECEIVED=' + valIsReceived + ', RECEIVEDDATE=SYSDATE, RECEIVED_STAFFS_ID=' + $.trim($('#indexUserId').text()) + ' WHERE ID=' + valId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                if (valIsReceived == 'null') {



                    $('#chuluutimeTab1Datatable > tbody  > tr').each(function () {
                        if ($.trim($('td:eq(0)', this).html()) == valId) {
                            $('td:eq(8)', this).html('');
                            return false;
                        }
                    });
                    if (start_hours == 8 && start_min == 30) {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/WSOracleExecuteNonQuery",
                            data: '{qry:"DELETE FROM  HR_MOF.STN_TRCDLOG WHERE YEAR=' + DT_year + ' AND  MONTH=' + DT_month + ' AND  DAY=' + DT_day + ' AND HOUR=' + start_hours + ' AND MINUTE=' + start_min + ' AND ENO=' + FINGERID + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {

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
                    if (end_hours == 17 && end_min == 30) {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/WSOracleExecuteNonQuery",
                            data: '{qry:"DELETE FROM  HR_MOF.STN_TRCDLOG WHERE YEAR=' + DT_year + ' AND  MONTH=' + DT_month + ' AND  DAY=' + DT_day + ' AND HOUR=' + end_hours + ' AND MINUTE=' + end_min + ' AND ENO=' + FINGERID + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {

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
                }
                else {

                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteScalar",
                        data: '{qry:"SELECT TO_CHAR(a.RECEIVEDDATE,\'YYYY-MM-DD HH24:MM:SS\')||\'~\'||NVL(i.IMAGE,\'male.png\')||\'~\'||SUBSTR(i.LNAME,0,1)||\'.\'||i.FNAME||\'~\'||CASE WHEN k.ID=k.FATHER_ID THEN k.INITNAME ELSE l.INITNAME||\' - \'||k.INITNAME END||\'~\'||m.NAME FROM ST_CHULUUTIME a LEFT JOIN ST_STAFFS i ON a.RECEIVED_STAFFS_ID=i.ID LEFT JOIN ST_STBR j ON i.ID=j.STAFFS_ID AND j.ISACTIVE=1 LEFT JOIN ST_BRANCH k ON j.BRANCH_ID=k.ID LEFT JOIN ST_BRANCH l ON k.FATHER_ID=l.ID LEFT JOIN STN_POS m ON j.POS_ID=m.ID WHERE a.ID=' + valId + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#chuluutimeTab1Datatable > tbody  > tr').each(function () {
                                if ($.trim($('td:eq(0)', this).html()) == valId) {
                                    $('td:eq(8)', this).html('<div style="float:left;"><img src="../files/staffs/' + msg.d.split('~')[1] + '" class="stafflistimage"></div><div style="float:left; margin-left:10px;">' + msg.d.split('~')[2] + '  <small class="text-muted"><i>' + msg.d.split('~')[0] + '</i></small><br><small class="text-muted">' + msg.d.split('~')[4] + ' | ' + msg.d.split('~')[3] + '</small></div>');
                                    return false;
                                }
                            });
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


                    if (start_hours == 8 && start_min==30) {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/WSOracleExecuteNonQuery",
                            data: '{qry:"INSERT INTO  HR_MOF.STN_TRCDLOG (YEAR, MONTH, DAY, HOUR,MINUTE,SECOND,VERIFYMODE,INOUT, WORKCODE,TAILBAR, CHOLOO, ENO,TINOUT,IP) VALUES(' + DT_year + ',' + DT_month + ',' + DT_day + ',' + start_hours + ',30,28,1,0,0,\'HR-чөлөө\',0,' + FINGERID + ',0,\'10.11.11.44\')"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {

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
                    if (end_hours == 17 && end_min == 30) {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/WSOracleExecuteNonQuery",
                            data: '{qry:"INSERT INTO  HR_MOF.STN_TRCDLOG (YEAR, MONTH, DAY, HOUR,MINUTE,SECOND,VERIFYMODE,INOUT, WORKCODE,TAILBAR, CHOLOO, ENO,TINOUT,IP) VALUES(' + DT_year + ',' + DT_month + ',' + DT_day + ',' + end_hours + ',30,28,1,0,0,\'HR-чөлөө\',0,' + FINGERID + ',0,\'10.11.11.44\')"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {

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
                   
                }
                smallBox('Цагийн чөлөө', 'Амжилттай баталгаажлаа', '#659265', 4000);
                if ($(me).val() == "") { $(me).removeClass('bg-color-greenLight').removeClass('bg-color-red'); $(me).css('border', '1px solid #DDD'); $(me).css('color', '#555'); }
                else if ($(me).val() == "1") { $(me).removeClass('bg-color-red'); $(me).addClass('bg-color-greenLight'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
                else if ($(me).val() == "0") { $(me).removeClass('bg-color-greenLight'); $(me).addClass('bg-color-red'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
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
            pTab1ModalInputDt: {
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
            pTab1ModalSelectBegintm: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectEndtm: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
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
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_CHULUUTIME (ID, STAFFS_ID, DT, BEGINTM, ENDTM, CHULUUREASON_ID, ISSALARY, DESCRIPTION, REQUESTDATE) VALUES (TBLLASTID(\'ST_CHULUUTIME\'), ' + $.trim($('#indexUserId').text()) + ', \'' + $.trim($('#pTab1ModalInputDt').val()) + '\', \'' + $('#pTab1ModalSelectBegintm option:selected').val() + '\', \'' + $('#pTab1ModalSelectEndtm option:selected').val() + '\', ' + $('#pTab1ModalSelectReason option:selected').val() + ', ' + valIsSalary + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '\', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Цагийн чөлөө', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_CHULUUTIME SET STAFFS_ID=' + $.trim($('#indexUserId').text()) + ', DT=\'' + $.trim($('#pTab1ModalInputDt').val()) + '\', BEGINTM=\'' + $('#pTab1ModalSelectBegintm option:selected').val() + '\', ENDTM=\'' + $('#pTab1ModalSelectEndtm option:selected').val() + '\', CHULUUREASON_ID=' + $('#pTab1ModalSelectReason option:selected').val() + ', ISSALARY=' + valIsSalary + ', DESCRIPTION=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '\', REQUESTDATE=sysdate WHERE ID=' + $('#pTab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Цагийн чөлөө', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
    
    function toHHMMSS(myVal) {
        var sec_num = parseInt(myVal, 10); // don't forget the second param
        var hours   = Math.floor(sec_num / 3600);
        var minutes = Math.floor((sec_num - (hours * 3600)) / 60);

        if (hours   < 10) {hours   = "0"+hours;}
        if (minutes < 10) {minutes = "0"+minutes;}
        var time    = hours+' цаг '+minutes+' мин';
        return time;
    }
    function timeToSeconds(time) {
        time = time.split(/:/);
        return ((parseInt(time[0]) * 3600) + (parseInt(time[1]) * 60) + parseInt(time[2]));
    }
    $('#pTab1ModalInputDt').datepicker({
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