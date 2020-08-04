<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trainingreq.aspx.cs" Inherits="HRWebApp.pg.trainingreq" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa-fw fa fa-home"></i>
        <span>> СУРГАЛТАД НЭР ДЭВШҮҮЛЭХ ЗӨВШӨӨРЛИЙН ХУУДАС</span>
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Зөвшөөрлийн хуудасын бүртгэл </h2>
                    <div class="widget-toolbar">
                        <div class="btn-group options" style="margin-right:0px !important;">
                            <select id="pTab1SelectYear" name="pTab1SelectYear" runat="server" class="form-control" style="padding:0 0; height:26px;"><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option></select>
                        </div>
                    </div>
                    <div class="widget-toolbar">
                        <div class="btn-group options" style="margin-right:0px !important;">
                            <button class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                        </div>
                    </div>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:820px; top:4px; z-index:5; margin-top:7px;">Газар:</div>
                    <div class="Colvis TableTools" style="right:735px; width: 76px; top:4px; z-index:5;">
                        <select id="pTab1SelectGazar" runat="server" class="form-control" style="padding:1px;"><option value="">- Сонго -</option></select>
                    </div>
                    <div class="Colvis TableTools" style="right:685px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс: </label></div>
                    <div class="Colvis TableTools" style="right:605px; width: 76px; top:4px; z-index:5;">
                        <select id="pTab1SelectHeltes" runat="server" class="form-control" style="padding:1px;" disabled="disabled"><option value="">- Сонго -</option></select>
                    </div>
                    <div class="Colvis TableTools" style="right:540px; top:4px; z-index:5; margin-top:7px;"><label>Ажилтан: </label></div>
                    <div class="Colvis TableTools" style="right:325px; width:210px; top:4px; z-index:5;">
                        <select id="pTab1SelectStaff" runat="server" class="form-control" style="padding:1px;" disabled="disabled"><option value="">- Сонго -</option></select>
                    </div>
                    <div class="Colvis TableTools" style="right:275px; top:4px; z-index:5; margin-top:7px;"><label>Төрөл:</label></div>
                    <div class="Colvis TableTools" style="right:120px; width:150px; top:4px; z-index:5;">
                        <select id="pTab1SelectType" runat="server" class="form-control" style="padding:1px;"><option>Туршлага судлах аялал</option></select>
                    </div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
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
			        <h4 class="modal-title" >Зөвшөөрлийн хуудас&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row"><div class="col-md-12">Зөвшөөрөл хүсэгч</div></div>
                            <div class="row"><div id="pTab1ModalDivStaff" runat="server" class="col-md-12"></div></div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-6">
                                    <label class="control-label">*Төрөл</label>
									<select id="pTab1ModalSelectType" name="pTab1ModalSelectType" class="form-control" runat="server">
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
                                    <label class="control-label">*Зохион байгуулагч</label>
									<input id="pTab1ModalInputOrganizer" name="pTab1ModalInputOrganizer" type="text" class="form-control" placeholder="Зохион байгуулагч" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label">*Зардын талаар</label>
									<input id="pTab1ModalInputBudget" name="pTab1ModalInputBudget" type="text" class="form-control" placeholder="Зардын талаар" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-12">
                                    <label class="control-label">*Нэр</label>
									<input id="pTab1ModalInputTrainingname" name="pTab1ModalInputTrainingname" type="text" class="form-control" placeholder="Нэр" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-6">
                                    <label class="control-label">*Зохион байгуулагдах улс</label>
									<input id="pTab1ModalInputCountry" name="pTab1ModalInputCountry" type="text" class="form-control" placeholder="Улс" />
                                </div>
								<div class="col-md-6">
                                    <label class="control-label">*Зохион байгуулагдах хот</label>
									<input id="pTab1ModalInputCity" name="pTab1ModalInputCity" type="text" class="form-control" placeholder="Хот" />
                                </div>
                            </div>
						</div>
					</fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
								<div class="col-md-6">
                                    <label class="control-label">*Эхлэх хугацаа</label>
									<input id="pTab1ModalInputBegindate" name="pTab1ModalInputBegindate" type="text" class="form-control" placeholder="Эхлэх хугацаа" />
                                </div>
								<div class="col-md-6">
                                    <label class="control-label">*Дуусах хугацаа</label>
									<input id="pTab1ModalInputEnddate" name="pTab1ModalInputEnddate" type="text" class="form-control" placeholder="Дуусах хугацаа" />
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
<div id="pTab1ModalPrint" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
	<div class="modal-dialog modal-lg" style="width:70%;">
        <div style="width:56%; display:block; height: 35px; margin:0 auto;">
            <div class="btn-group pull-right">
                <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#pTab1ModalPrintContent', 'Анкет')">
                    <i class="fa fa-file-word-o"></i>
                </a>
                <a href="javascript:void(0);" class="btn btn-default printBtn" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#pTab1ModalPrintContent')">
                    <i class="fa fa-print"></i>
                </a>
            </div>
        </div>
		<div id="pTab1ModalPrintContent" class="modal-content reports" style="width:56%;margin: 0 auto;">
            <p style="font: 11pt 'Arial'; text-align:center;">Сургалтад нэр дэвшүүлэх зөвшөөрлийн хуудас</p>
            <p style="font: 11pt 'Arial'; text-align:right;">/<span id="pTab1ModalPrintLabelDate" runat="server"></span>/</p>
            <div id="pTab1ModalPrintTable3" style="width:100%; border: 2px solid #000; padding:5px;">
                <p style="font: bold 11pt 'Arial'; text-align:center;">СУРГАЛТАД НЭР ДЭВШҮҮЛЭХ ЗӨВШӨӨРЛИЙН ХУУДАС</p>
                <br />
                <p id="pTab1ModalPrintTable3Data1" style="font: 11pt 'Arial'; text-align:justify;"></p>
                <br />
                <br />
                <table id="pTab1ModalPrintTable3Table1" style="width: 100%; font:11pt 'Arial';border-collapse:collapse;">
                    <tbody>
                        <tr>
                            <td style="padding: 5px; width: 33%; text-align:center; vertical-align:middle;">ТЗУГ-ЫН ДАРГА</td>
                            <td style="padding: 5px; width: 33%; text-align:center; vertical-align:top;"><img src="../files/gazarsignatures/TZ_SIGNATURE.png" /></td>
                            <td id="pTab1ModalPrintTable3Table1TzBossName" style="padding: 5px; width: 33%; text-align:center; vertical-align:middle;">Х. ЭНХБААТАР</td>
                        </tr>
                    </tbody>
                </table>
            </div>
		</div>  
	</div>  
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        $('#pTab1ModalSelectType').html($('#pTab1ModalSelectType').html().replace('Бүгд', 'Сонго'));
        pTab1SetFirstControls();
    }
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();

    //tab1
    function pTab1SetFirstControls() {
        var userGazarId = $('#indexUserGazarId').text();
        var userHeltesId = $('#indexUserHeltesId').text();
        var userId = $('#indexUserId').text();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/gazarListForDDL",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1SelectGazar").html('<option value="">Бүгд</option>'+msg.d.replace('<option selected value="">- Бүгд -</option>',''));
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/checkRoles",
                    data: '{stid:"' + userId + '", roles:"1,9"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d != "1") {
                            $('#pTab1SelectGazar').val(userGazarId);
                            $('#pTab1SelectGazar').prop('disabled', true);
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/heltesListForDDL",
                                data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    $("#pTab1SelectHeltes").html('<option value="">Бүгд</option>' + msg.d.replace('<option selected value="">- Бүгд -</option>', ''));
                                    if ($('#indexUserPosId').text() != '2010201') {
                                        $('#pTab1SelectHeltes').val(userHeltesId);
                                        $('#pTab1SelectHeltes').prop('disabled', true);
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "ws.aspx/staffListForDDL",
                                            data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '", heltesId:"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (msg) {
                                                $("#pTab1SelectStaff").html('<option value="">Бүгд</option>' + msg.d.replace('<option value="">- Бүгд -</option>', ''));
                                                if ($('#indexUserPosId').text() != '2010301') {
                                                    $('#pTab1SelectStaff').val(userId);
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
                                                if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
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
                                    if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
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
                        if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/trainingreq_trainingreqTab1Datatable",
            data: '{currstid:"' + $('#indexUserId').text() + '", yr:"' + $('#pTab1SelectYear option:selected').val() + '", gazar:"' + $('#pTab1SelectGazar option:selected').val() + '", heltes:"' + $('#pTab1SelectHeltes option:selected').val() + '", stid:"' + $('#pTab1SelectStaff option:selected').val() + '", tp:"' + $('#pTab1SelectType option:selected').val() + '"}',
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
                if (err.Message == 'SessionDied') window.location = '../login.aspx';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').text('');
            $('#pTab1ModalSelectType').val('');
            $('#pTab1ModalInputOrganizer').val('');
            $('#pTab1ModalInputBudget').val('');
            $('#pTab1ModalInputTrainingname').val('');
            $('#pTab1ModalInputCountry').val('');
            $('#pTab1ModalInputCity').val('');
            $('#pTab1ModalInputBegindate').val('');
            $('#pTab1ModalInputEnddate').val('');
        }
        else {
            $('#pTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1ModalSelectType').val($(el).closest('tr').find('td:eq(16)').text());
            $('#pTab1ModalInputOrganizer').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1ModalInputBudget').val($(el).closest('tr').find('td:eq(5)').text());
            $('#pTab1ModalInputTrainingname').val($(el).closest('tr').find('td:eq(6)').text());
            $('#pTab1ModalInputCountry').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1ModalInputCity').val($(el).closest('tr').find('td:eq(8)').text());
            $('#pTab1ModalInputBegindate').val($(el).closest('tr').find('td:eq(9)').text().split(' - ')[0]);
            $('#pTab1ModalInputEnddate').val($(el).closest('tr').find('td:eq(9)').text().split(' - ')[1]);

        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мэдээллийг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"DELETE FROM ST_TRAININGREQ WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    dataBindTab1Datatable();
                    smallBox('Зөвшөөрлийн хуудас', 'Амжилттай устгагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        });
    }
    function showTab1ModalPrint(el) {
        if ($(el).closest('tr').find('td:eq(2)').html().split(' | ')[0].split('-').length != 1) pTab1ModalPrintTable3Data1.innerHTML = $(el).closest('tr').find('td:eq(7)').html() + " Улсын " + $(el).closest('tr').find('td:eq(8)').html() + " хотод зохион байгуулагдах ”" + $(el).closest('tr').find('td:eq(6)').html() + "” сэдэвт сургалтад " + $(el).closest('tr').find('td:eq(2)').html().split(' | ')[0].split('-')[0] + "-ын " + $(el).closest('tr').find('td:eq(2)').html().split(' | ')[0].split('-')[1] + "-ийн " + $(el).closest('tr').find('td:eq(2)').html().split(' | ')[1].replace('Хэлтсийн', '').replace('Газрын', '').toLowerCase() + ' ' + $(el).closest('tr').find('td:eq(2)').html().split(' | ')[2] + '-ыг нэр дэвшихийг зөвшөөрөв.';
        else pTab1ModalPrintTable3Data1.innerHTML = $(el).closest('tr').find('td:eq(7)').html() + " Улсын " + $(el).closest('tr').find('td:eq(8)').html() + " хотод зохион байгуулагдах ”" + $(el).closest('tr').find('td:eq(6)').html() + "” сэдэвт сургалтад " + $(el).closest('tr').find('td:eq(2)').html().split(' | ')[0].split('-')[0] + "-ын " + $(el).closest('tr').find('td:eq(2)').html().split(' | ')[1].replace('Хэлтсийн', '').replace('Газрын', '').toLowerCase() + ' ' + $(el).closest('tr').find('td:eq(2)').html().split(' | ')[2] + '-ыг нэр дэвшүүлэхийг зөвшөөрөв.';
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
                    $("#pTab1SelectHeltes").html('<option value="">Бүгд</option>' + msg.d.replace('<option selected value="">- Бүгд -</option>', ''));
                    $("#pTab1SelectHeltes").prop("disabled", false);
                    dataBindTab1Datatable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
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
                    $("#pTab1SelectStaff").html('<option selected value="">- Бүгд -</option>' + msg.d.replace('<option value="">- Бүгд -</option>', ''));
                    $("#pTab1SelectStaff").prop("disabled", false);
                    dataBindTab1Datatable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#pTab1SelectStaff, #pTab1SelectType").change(function () {
        dataBindTab1Datatable();
    });
    $("#pTab1SelectYear").change(function () {
        pTab1SetFirstControls();
    });
    function pTab1DatatableSubmitHeltes(el) {
        if ($(el).prop('checked')) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_TRAININGREQ SET ISSUBMITHELTES=1, SUBMITHELTES_STID=' + $.trim($('#indexUserId').text()) + ', SUBMITHELTES_DATE=SYSDATE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Зөвшөөрсөн эсэх', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_TRAININGREQ SET ISSUBMITHELTES=0, SUBMITHELTES_STID=' + $.trim($('#indexUserId').text()) + ', SUBMITHELTES_DATE=SYSDATE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Зөвшөөрсөн эсэх', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    }
    function pTab1DatatableSubmitGazar(el) {
        if ($(el).prop('checked')) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_TRAININGREQ SET ISSUBMITGAZAR=1, SUBMITGAZAR_STID=' + $.trim($('#indexUserId').text()) + ', SUBMITGAZAR_DATE=SYSDATE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Зөвшөөрсөн эсэх', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_TRAININGREQ SET ISSUBMITGAZAR=0, SUBMITGAZAR_STID=' + $.trim($('#indexUserId').text()) + ', SUBMITGAZAR_DATE=SYSDATE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Зөвшөөрсөн эсэх', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    }
    function pTab1DatatableSubmitTz(el) {
        if ($(el).prop('checked')) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_TRAININGREQ SET ISSUBMITTZ=1, SUBMITTZ_STID=' + $.trim($('#indexUserId').text()) + ', SUBMITTZ_DATE=SYSDATE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {

                   // $(el).closest('tr').find('td:eq(14)').html('<a class="btn btn-default btn-xs" href="javascript:void(0);" data-target="#pTab1ModalPrint" data-toggle="modal" onclick="showTab1ModalPrint(this);"><i class="fa fa-file-text-o"></i> Хэвлэх</a>');
                  //  smallBox('Зөвшөөрсөн эсэх', 'Амжилттай хадгалагдлаа', '#659265', 4000);

                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_TRAININGREQ SET ISSUBMITTZ=0, SUBMITTZ_STID=' + $.trim($('#indexUserId').text()) + ', SUBMITTZ_DATE=SYSDATE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $(el).closest('tr').find('td:eq(14)').html('');
                    smallBox('Зөвшөөрсөн эсэх', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    }
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            group: '.col-md-6',
            pTab1ModalSelectType: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            group: '.col-md-12',
            pTab1ModalInputOrganizer: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 500,
                        message: 'Уртдаа 500 тэмдэгт авна'
                    }
                }
            },
            group: '.col-md-12',
            pTab1ModalInputBudget: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 500,
                        message: 'Уртдаа 500 тэмдэгт авна'
                    }
                }
            },
            group: '.col-md-12',
            pTab1ModalInputTrainingname: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 500,
                        message: 'Уртдаа 500 тэмдэгт авна'
                    }
                }
            },
            group: '.col-md-6',
            pTab1ModalInputCountry: {
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
            group: '.col-md-6',
            pTab1ModalInputCity: {
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
            group: '.col-md-6',
            pTab1ModalInputBegindate: {
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
            group: '.col-md-6',
            pTab1ModalInputEnddate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
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
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_TRAININGREQ (ID, TRAININGREQTYPE_ID, STAFFS_ID, ORGANIZERNAME, BUDGETNAME, TRAININGNAME, COUNTRYNAME, CITYNAME, BEGINDATE, ENDDATE, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_TRAININGREQ\'), ' + $('#pTab1ModalSelectType option:selected').val() + ', ' + $.trim($('#indexUserId').text()) + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputOrganizer').val())) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputBudget').val())) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTrainingname').val())) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCountry').val())) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCity').val())) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputBegindate').val())) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputEnddate').val())) + '\', ' + $.trim($('#indexUserId').text()) + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Зөвшөөрлийн хуудас', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.aspx';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else if ($('#pTab1ModalHeaderLabel').text() == 'засах') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_TRAININGREQ SET TRAININGREQTYPE_ID=' + $('#pTab1ModalSelectType option:selected').val() + ', STAFFS_ID=' + $.trim($('#indexUserId').text()) + ', ORGANIZERNAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputOrganizer').val())) + '\', BUDGETNAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputBudget').val())) + '\', TRAININGNAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTrainingname').val())) + '\', COUNTRYNAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCountry').val())) + '\', CITYNAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCity').val())) + '\', BEGINDATE=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputBegindate').val())) + '\', ENDDATE=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputEnddate').val())) + '\', UPDATED_STAFFID=' + $.trim($('#indexUserId').text()) + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Зөвшөөрлийн хуудас', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.aspx';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });

    
    $('#pTab1ModalInputBegindate, #pTab1ModalInputEnddate').datepicker({
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
