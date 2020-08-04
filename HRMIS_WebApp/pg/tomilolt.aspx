<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tomilolt.aspx.cs" Inherits="HRWebApp.pg.tomilolt" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa-fw fa fa-home"></i>
        <span>> Томилолт > </span> <span id="tomiloltTypeSpan1" runat="server"></span>
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
                    <h2> <span id="tomiloltTypeSpan2" runat="server"></span> бүртгэл </h2>
                    <ul class="nav nav-tabs pull-right in">
						<li id="tomiloltTab1Li" class="active" onclick="tomiloltDatabindTabs(this)">
							<a data-toggle="tab" href="#divBindTab1Table"> <i class="fa fa-lg fa-table"></i> <span class="hidden-mobile hidden-tablet"> Бүртгэл </span> </a>
						</li>
						<li id="tomiloltTab2Li" onclick="tomiloltDatabindTabs(this)">
							<a data-toggle="tab" href="#divBindTab2Table"> <i class="fa fa-lg fa-file-text-o"></i> <span class="hidden-mobile hidden-tablet"> Тайлан өгсөн эсэх </span> </a>
						</li>
					</ul>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div class="Colvis TableTools" style="width:150px; right:195px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectDirection" name="pTab1SelectDirection" runat="server" class="form-control" style="padding: 5px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:355px; top:5px; z-index:5; margin-top:7px;"><label>Чиглэл:</label></div>
                    <div class="Colvis TableTools" style="width:150px; right:415px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectBudget" name="pTab1SelectBudget" runat="server" class="form-control" style="padding: 5px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:575px; top:4px; z-index:5; margin-top:7px;"><label>Зардал: </label></div>
                    <div class="Colvis TableTools" style="width:85px; right:635px; top:5px; z-index:5; margin-top:1px;">
                        <input id="pTab1SelectTodate" name="pTab1SelectTodate" runat="server" type="text" class="form-control" style="padding: 5px;" maxlength="10"/>
                    </div>
                    <div class="Colvis TableTools" style="right:728px; top:4px; z-index:5; margin-top:7px;"><label>-</label></div>
                    <div class="Colvis TableTools" style="width:85px; right:740px; top:5px; z-index:5; margin-top:1px;">
                        <input id="pTab1SelectFromdate" name="pTab1SelectFromdate" runat="server" type="text" class="form-control" style="padding: 5px;" maxlength="10"/>
                    </div>
                    <div class="Colvis TableTools" style="right:835px; top:4px; z-index:5; margin-top:7px;"><label>Огноо: </label></div>
                    <div class="Colvis TableTools" style="width:90px; right:885px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectMy" name="pTab1SelectMy" runat="server" class="form-control" style="padding: 5px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:980px; top:4px; z-index:5; margin-top:5px; line-height:13px;"><label>Миний<br />томилолт: </label></div>
                    <div class="Colvis TableTools" style="width:90px; right:1050px; top:5px; z-index:5; margin-top:1px; display:none;">
                        <select id="pTab1SelectIsReport" name="pTab1SelectIsReport" runat="server" class="form-control" style="padding: 5px;">
							<option value="">- Бүгд -</option>
                            <option value="1">Өгсөн</option>
                            <option value="0">Өгөөгүй</option>
						</select>
                    </div>
                    <div id="pTab1SelectIsReportTitleDiv" class="Colvis TableTools" style="right:1145px; top:4px; z-index:5; margin-top:7px; display:none;"><label>Тайлан өгсөн эсэх: </label></div>
                    <div id="loaderTab1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div class="widget-body no-padding">
                        <div class="tab-content">
                            <div id="divBindTab1Table" class="tab-pane active">

                            </div>
                            <div id="divBindTab2Table" class="tab-pane">

                            </div>
                        </div>
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
			        <h4 class="modal-title"><span id="tomiloltTypeSpan3" runat="server"></span> &nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Томилолтын төрөл</label>
                                    <select id="pTab1ModalSelectType" name="pTab1ModalSelectType" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Чиглэл</label>
                                    <select id="pTab1ModalSelectDirection" name="pTab1ModalSelectDirection" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Зардал</label>
                                    <select id="pTab1ModalSelectBudget" name="pTab1ModalSelectBudget" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div id="pTab1ModalDivBudgetOther" class="col-md-3 hide">
                                    <label class="control-label">Бусад зардал</label>
									<input id="pTab1ModalInputBudgetOther" name="pTab1ModalInputBudgetOther" type="text" class="form-control" placeholder="Бусад зардал" maxlength="250" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">*Эхлэх огноо</label>
									<input id="pTab1ModalInputFromdate" name="pTab1ModalInputFromdate" type="text" class="form-control" placeholder="Эхлэх огноо" maxlength="10" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Дуусах огноо</label>
									<input id="pTab1ModalInputTodate" name="pTab1ModalInputTodate" type="text" class="form-control" placeholder="Дуусах огноо" maxlength="10" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Хоног</label>
									<input id="pTab1ModalInputDaynum" name="pTab1ModalInputDaynum" type="text" class="form-control" placeholder="Хоног" maxlength="4" />
                                </div>
                                <div class="col-md-3">
                                    <label id="pTab1ModalLabelCountry" runat="server" class="control-label"></label>
									<input id="pTab1ModalInputCountry" name="pTab1ModalInputCountry" runat="server" type="text" class="form-control" placeholder="" />
                                </div>
                                <div class="col-md-3">
                                    <label id="pTab1ModalLabelCity" runat="server" class="control-label"></label>
									<input id="pTab1ModalInputCity" name="pTab1ModalInputCity" runat="server" type="text" class="form-control" placeholder="" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Сэдэв</label>
									<input id="pTab1ModalInputSubject" name="pTab1ModalInputSubject" type="text" class="form-control" placeholder="Сэдэв" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">*Тушаал дугаар</label>
									<input id="pTab1ModalInputTushaalno" name="pTab1ModalInputTushaalno" type="text" class="form-control" placeholder="Тушаал дугаар" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Тушаал огноо</label>
									<input id="pTab1ModalInputTushaaldate" name="pTab1ModalInputTushaaldate" type="text" class="form-control" placeholder="Тушаал огноо" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Хавсралт</label>
                                    <a id="pTab1ModalInputAttachDelete" class="btn btn-link btn-xs font-sm" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                </div>
                                <div class="col-md-6" style="padding-left: 0;">
                                    <a id="pTab1ModalInputAttachBtn" class="btn btn-link btn-xs font-sm" href="javascript:void(0);" style="padding:0px; border:none;" download="">Файл хавсаргаагүй байна...</a>
                                    <input id="pTab1ModalInputAttachInput" type="file" class="btn btn-default">
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-group" style="margin:0; display:block; overflow:hidden;">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Хамрагдах ажилтан</label>
                                    <div id="pTab1ModalDivStafflist">

                                    </div>
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
<div class="modal fade" id="pTab1StafflistModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
	<div class="modal-dialog">  
		<div class="modal-content">
			
		</div>  
	</div>  
</div>
<div class="modal fade" id="pTab1AttachshowModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
	<div class="modal-dialog">  
		<div class="modal-content">
			
		</div>  
	</div>  
</div>
<div id="pTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span id="tomiloltTypeSpan4" runat="server"></span> тайлан оруулах</h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab2TomiloltID" class="hide"></div>
                    <div id="pTab2StaffID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Өгсөн огноо</label>
									<input id="pTab2ModalInputReportdate" name="pTab2ModalInputReportdate" type="text" class="form-control" placeholder="Өгсөн огноо" maxlength="10" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Хавсралт</label>
                                    <a id="pTab2ModalInputAttachDelete" class="btn btn-link btn-xs font-sm" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                </div>
                                <div class="col-md-9" style="padding-left: 0;">
                                    <a id="pTab2ModalInputAttachBtn" class="btn btn-link btn-xs font-sm" href="javascript:void(0);" style="padding:0px; border:none;" download="">Файл хавсаргаагүй байна...</a>
                                    <input id="pTab2ModalInputAttachInput" type="file" class="btn btn-default">
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
        if ($('#tomiloltTab1Li').attr('class') == 'active') {
            dataBindTab1Datatable();
        }
        else if ($('#tomiloltTab2Li').attr('class') == 'active') {
            dataBindTab2Datatable();
        }
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    function tomiloltDatabindTabs(el) {
        if ($.trim($(el).attr('id')) == 'tomiloltTab1Li') {
            $('#pTab1AddBtn').parent().css('display', 'block');
            $('#pTab1SelectIsReport').parent().css('display', 'none');
            $('#pTab1SelectIsReportTitleDiv').css('display', 'none');
            if ($.trim($('#divBindTab1Table').html()) == "") {
                dataBindTab1Datatable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'tomiloltTab2Li') {
            $('#pTab1AddBtn').parent().css('display', 'none');
            $('#pTab1SelectIsReport').parent().css('display', 'block');
            $('#pTab1SelectIsReportTitleDiv').css('display', 'block');
            if ($.trim($('#divBindTab2Table').html()) == "") {
                dataBindTab2Datatable();
            }
        }
    }
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/tomilolt_tomiloltTab1Datatable",
            data: '{type:"' + <%=Request.QueryString["id"]%> + '", fromdate:"' + $.trim($('#pTab1SelectFromdate').val()) + '", todate:"' + $.trim($('#pTab1SelectTodate').val()) + '", budget:"' + $('#pTab1SelectBudget option:selected').val() + '", direction:"' + $('#pTab1SelectDirection option:selected').val() + '", currstaffid:"' + $('#pTab1SelectMy option:selected').val() + '"}',
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
    function dataBindTab2Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/tomilolt_tomiloltTab2Datatable",
            data: '{type:"' + <%=Request.QueryString["id"]%> + '", fromdate:"' + $.trim($('#pTab1SelectFromdate').val()) + '", todate:"' + $.trim($('#pTab1SelectTodate').val()) + '", budget:"' + $('#pTab1SelectBudget option:selected').val() + '", direction:"' + $('#pTab1SelectDirection option:selected').val() + '", isreport:"' + $('#pTab1SelectIsReport option:selected').val() + '", currstaffid:"' + $('#pTab1SelectMy option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab2Table").html(msg.d);
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
    $("#pTab1SelectBudget, #pTab1SelectDirection").change(function () {
        if ($('#divBindTab1Table').attr('class') == 'tab-pane active') dataBindTab1Datatable();
        else if ($('#divBindTab2Table').attr('class') == 'tab-pane active') dataBindTab2Datatable();
    });
    $("#pTab1SelectTodate, #pTab1SelectFromdate").change(function () {
        if ($('#divBindTab1Table').attr('class') == 'tab-pane active') dataBindTab1Datatable();
        else if ($('#divBindTab2Table').attr('class') == 'tab-pane active') dataBindTab2Datatable();
    });
    $("#pTab1SelectIsReport").change(function () {
        dataBindTab2Datatable();
    });
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').text('');
            $('#pTab1ModalSelectDirection').val('');
            $('#pTab1ModalSelectBudget').val('');
            $('#pTab1ModalDivBudgetOther').addClass('hide');
            $('#pTab1ModalInputBudgetOther').val('');
            $('#pTab1ModalInputFromdate').val('');
            $('#pTab1ModalInputTodate').val('');
            $('#pTab1ModalInputDaynum').val('');
            $('#pTab1ModalInputCountry').val('');
            $('#pTab1ModalInputCity').val('');
            $('#pTab1ModalInputSubject').val('');
            $('#pTab1ModalInputTushaalno').val('');
            $('#pTab1ModalInputTushaaldate').val('');
            $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
            $('#pTab1ModalInputAttachBtn').attr('href', 'javascript:void(0);');
            $('#pTab1ModalInputAttachInput').val('');
            dataBindpTab1ModalSelectStafflist('none');
        }
        else {
            $('#pTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1ModalSelectDirection').val($(el).closest('tr').find('td:eq(14)').text());
            $('#pTab1ModalSelectBudget').val($(el).closest('tr').find('td:eq(15)').text());
            if ($(el).closest('tr').find('td:eq(15)').text() == '3') {
                $('#pTab1ModalDivBudgetOther').removeClass('hide');
            }
            else {
                $('#pTab1ModalDivBudgetOther').addClass('hide');
            }
            $('#pTab1ModalInputBudgetOther').val($(el).closest('tr').find('td:eq(18)').text());
            $('#pTab1ModalInputFromdate').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1ModalInputTodate').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1ModalInputDaynum').val($(el).closest('tr').find('td:eq(5)').text());
            $('#pTab1ModalInputCountry').val($(el).closest('tr').find('td:eq(6)').text());
            $('#pTab1ModalInputCity').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1ModalInputSubject').val($(el).closest('tr').find('td:eq(8)').text());
            $('#pTab1ModalInputTushaalno').val($(el).closest('tr').find('td:eq(10)').text());
            $('#pTab1ModalInputTushaaldate').val($(el).closest('tr').find('td:eq(11)').text());
            if ($.trim($(el).closest('tr').find('td:eq(12)').html()) == '') {
                $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                $('#pTab1ModalInputAttachBtn').attr('href', 'javascript:void(0);');
                $('#pTab1ModalInputAttachInput').val('');
            }
            else {
                $('#pTab1ModalInputAttachBtn').html($(el).closest('tr').find('td:eq(17)').text());
                $('#pTab1ModalInputAttachBtn').attr('href', '../files/tomilolttushaal/' + $(el).closest('tr').find('td:eq(17)').text());
                $('#pTab1ModalInputAttachInput').val('');
            }
            dataBindpTab1ModalSelectStafflist($(el).closest('tr').find('td:eq(16)').text());
        }
    }
    function showDeleteTab1(el) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteScalar",
            data: '{qry:"SELECT COUNT(1) FROM ST_TOMILOLT_REPORT WHERE TOMILOLT_ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d != '0') alert('Сонгосон томилолтын тайлан орсон тул устгах боломжгүй байна!');
                else {
                    $.SmartMessageBox({
                        title: "Анхааруулга!",
                        content: "Сонгосон мэдээллийг устгах уу?",
                        buttons: '[Үгүй][Тийм]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Тийм") {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/TOMILOLT_DELETE",
                                data: '{P_TOMILOL_ID:"' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Datatable();
                                    smallBox($('#tomiloltTypeSpan3').text(), 'Амжилттай устгагдлаа', '#659265', 4000);
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
    $("#pTab1ModalInputAttachDelete").click(function () {
        if ($('#pTab1ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
            $.SmartMessageBox({
                title: "Анхааруулга!",
                content: "Та устгахдаа итгэлтэй байна уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/DeleteFile",
                        data: '{filename:"~/files/tomilolttushaal/' + $('#pTab1ModalInputAttachBtn').html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                            smallBox('Файл', 'Амжилттай устгагдлаа...', '#659265', 4000);
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
            });
        }
    });
    function dataBindpTab1ModalSelectStafflist(selectedList) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/tomilolt_tomiloltTab1ModalSelectstafflistForSelect2",
            data: '{selectedList:"' + selectedList + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1ModalDivStafflist").html("<select id=\"pTab1ModalSelectStafflist\" name=\"pTab1ModalSelectStafflist\" multiple=\"multiple\" style=\"width:100%\">" + msg.d + "</select><script>$(\"#pTab1ModalSelectStafflist\").select2();<\/script>");
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
            pTab1ModalSelectDirection: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectBudget: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputBudgetOther: {
                group: '.col-md-3',
                validators: {
                    stringLength: {
                        max: 250,
                        message: 'Уртдаа 250 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputFromdate: {
                group: '.col-md-2',
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
            pTab1ModalInputTodate: {
                group: '.col-md-2',
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
            pTab1ModalInputDaynum: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 4,
                        message: 'Уртдаа 4 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputCountry: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 250,
                        message: 'Уртдаа 250 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputCity: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 250,
                        message: 'Уртдаа 250 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputSubject: {
                group: '.col-md-12',
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
            pTab1ModalInputTushaalno: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputTushaaldate: {
                group: '.col-md-2',
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
            if ($('#pTab1ModalSelectStafflist').val() == null) alert('Хамрагдах ажилтан сонгоно уу');
            else {
                var filename = "none";
                if ($('#pTab1ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
                    filename = "ГадаадТомилолт" + $.trim($('#pTab1ModalInputTushaalno').val()) + "D" + $.trim($('#pTab1ModalInputTushaaldate').val()).replace(/-/g,'') + "." + $('#pTab1ModalInputAttachBtn').html().split('.')[$('#pTab1ModalInputAttachBtn').html().split('.').length - 1];
                }
                if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/TOMILOLT_INSERT",
                        data: '{P_TOMILOLTYPE_ID:"' + $('#pTab1ModalSelectType option:selected').val() + '", P_TOMILOLTDIRECTION_ID:"' + $('#pTab1ModalSelectDirection option:selected').val() + '", P_TOMILOLTBUDGET_ID:"' + $('#pTab1ModalSelectBudget option:selected').val() + '", P_FROMDATE:"' + $.trim($('#pTab1ModalInputFromdate').val()) + '", P_TODATE:"' + $.trim($('#pTab1ModalInputTodate').val()) + '", P_DAYNUM:"' + $.trim($('#pTab1ModalInputDaynum').val()) + '", P_COUNTRYNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCountry').val())) + '", P_CITYNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCity').val())) + '", P_SUBJECTNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputSubject').val())) + '", P_TUSHAALNO:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaalno').val())) + '", P_TUSHAALDATE:"' + $.trim($('#pTab1ModalInputTushaaldate').val()) + '", P_TUSHAALFILENAME:"' + filename + '", P_STAFFLIST:"' + $.trim($('#pTab1ModalSelectStafflist').val()) + '", P_STAFFID:"' + $.trim($('#indexUserId').text()) + '", P_TOMILOLT_BUDGET_OTHER:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputBudgetOther').val())) + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if (filename != "none") {
                                if ($("#pTab1ModalInputAttachInput").val() != '') {
                                    var uploadfiles = $("#pTab1ModalInputAttachInput").get(0);
                                    var uploadedfiles = uploadfiles.files;
                                    var fromdata = new FormData();
                                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "pg/UploadFile.ashx?folder=tomilolttushaal&filename=" + filename,
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
                            smallBox($('#tomiloltTypeSpan3').text(), 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                        url: "ws.aspx/TOMILOLT_UPDATE",
                        data: '{P_TOMILOL_ID:"' + $.trim($('#pTab1ID').text()) + '", P_TOMILOLTYPE_ID:"' + $('#pTab1ModalSelectType option:selected').val() + '", P_TOMILOLTDIRECTION_ID:"' + $('#pTab1ModalSelectDirection option:selected').val() + '", P_TOMILOLTBUDGET_ID:"' + $('#pTab1ModalSelectBudget option:selected').val() + '", P_FROMDATE:"' + $.trim($('#pTab1ModalInputFromdate').val()) + '", P_TODATE:"' + $.trim($('#pTab1ModalInputTodate').val()) + '", P_DAYNUM:"' + $.trim($('#pTab1ModalInputDaynum').val()) + '", P_COUNTRYNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCountry').val())) + '", P_CITYNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputCity').val())) + '", P_SUBJECTNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputSubject').val())) + '", P_TUSHAALNO:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaalno').val())) + '", P_TUSHAALDATE:"' + $.trim($('#pTab1ModalInputTushaaldate').val()) + '", P_TUSHAALFILENAME:"' + filename + '", P_STAFFLIST:"' + $.trim($('#pTab1ModalSelectStafflist').val()) + '", P_STAFFID:"' + $.trim($('#indexUserId').text()) + '", P_TOMILOLT_BUDGET_OTHER:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputBudgetOther').val())) + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if (filename != "none") {
                                if ($("#pTab1ModalInputAttachInput").val() != '') {
                                    var uploadfiles = $("#pTab1ModalInputAttachInput").get(0);
                                    var uploadedfiles = uploadfiles.files;
                                    var fromdata = new FormData();
                                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "pg/UploadFile.ashx?folder=tomilolttushaal&filename=" + filename,
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
                            smallBox($('#tomiloltTypeSpan3').text(), 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
        }
    });
    $("#pTab1ModalSelectBudget").change(function () {
        $('#pTab1ModalInputBudgetOther').val('');
        if ($("#pTab1ModalSelectBudget option:selected").val() == '3') $('#pTab1ModalDivBudgetOther').removeClass('hide');        
        else $('#pTab1ModalDivBudgetOther').addClass('hide');
    });

    //tab2
    function showAddEditTab2(el) {
        if ($.trim($(el).closest('tr').find('td:eq(11)').html()) == '') $('#pTab2ModalHeaderLabel').text('нэмэх');
        else $('#pTab2ModalHeaderLabel').text('засах');
        $('#pTab2TomiloltID').text($.trim($(el).closest('tr').find('td:eq(0)').html()));
        $('#pTab2StaffID').text($.trim($(el).closest('tr').find('td:eq(1)').html()));
        if ($.trim($(el).closest('tr').find('td:eq(11)').html()) == '') {
            $('#pTab2ModalInputReportdate').val('');
            $('#pTab2ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
            $('#pTab2ModalInputAttachBtn').attr('href', 'javascript:void(0);');
            $('#pTab2ModalInputAttachInput').val('');
        }
        else {
            $('#pTab2ModalInputReportdate').val($.trim($(el).closest('tr').find('td:eq(11)').text().replace(/Татах/g,'')));
            $('#pTab2ModalInputAttachBtn').html($(el).closest('tr').find('td:eq(11)').find('a').attr('href').split('/')[$(el).closest('tr').find('td:eq(11)').find('a').attr('href').split('/').length - 1]);
            $('#pTab2ModalInputAttachBtn').attr('href', $(el).closest('tr').find('td:eq(11)').find('a').attr('href'));
            $('#pTab2ModalInputAttachInput').val('');
        }
    }
    $("#pTab2ModalInputAttachDelete").click(function () {
        if ($('#pTab2ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
            $.SmartMessageBox({
                title: "Анхааруулга!",
                content: "Та устгахдаа итгэлтэй байна уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/DeleteFile",
                        data: '{filename:"~/files/tomilolttushaal/' + $('#pTab2ModalInputAttachBtn').html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            $('#pTab2ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                            smallBox('Файл', 'Амжилттай устгагдлаа...', '#659265', 4000);
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
            });
        }
    });
    $("#pTab2ModalInputAttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 52428800) {
            errMsg += 'Файлын хэмжээ 50MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png' && valE != 'gif' && valE != 'pdf' && valE != 'doc' && valE != 'docx' && valE != 'xls' && valE != 'xlsx' && valE != 'xlsm') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png, gif, pdf, doc, docx, xls, xlsx, xlsm/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab2ModalInputAttachBtn').html($(this).val().split('\\').pop());
        }
        else alert(errMsg);
    });
    $('#pTab2ModalForm').bootstrapValidator({
        fields: {
            pTab2ModalInputReportdate: {
                group: '.col-md-12',
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
            var filename = "none";
            if ($('#pTab2ModalInputAttachBtn').html() == 'Файл хавсаргаагүй байна...') alert('Хавсралт файл оруулна уу!');
            else {
                filename = "ГадаадТомилолтТайланT" + $.trim($('#pTab2TomiloltID').text()) + "S" + $.trim($('#pTab2StaffID').text()) + "." + $('#pTab2ModalInputAttachBtn').html().split('.')[$('#pTab2ModalInputAttachBtn').html().split('.').length - 1];
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteScalar",
                    data: '{qry:"SELECT COUNT(1) FROM ST_TOMILOLT_REPORT WHERE TOMILOLT_ID=' + $.trim($('#pTab2TomiloltID').text()) + ' AND STAFFS_ID=' + $.trim($('#pTab2StaffID').text()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == '0') {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/WSOracleExecuteNonQuery",
                                data: '{qry:"INSERT INTO ST_TOMILOLT_REPORT (TOMILOLT_ID, STAFFS_ID, REPORTDATE, REPORTFILENAME, CREATED_STAFFID, CREATED_DATE) VALUES (' + $.trim($('#pTab2TomiloltID').text()) + ', ' + $.trim($('#pTab2StaffID').text()) + ', \'' + $.trim($('#pTab2ModalInputReportdate').val()) + '\', \'' + filename + '\', ' + $.trim($('#indexUserId').text()) + ', sysdate)"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    if (filename != "none") {
                                        if ($("#pTab2ModalInputAttachInput").val() != '') {
                                            var uploadfiles = $("#pTab2ModalInputAttachInput").get(0);
                                            var uploadedfiles = uploadfiles.files;
                                            var fromdata = new FormData();
                                            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                            globalAjaxVar = $.ajax({
                                                type: "POST",
                                                url: "pg/UploadFile.ashx?folder=tomilolttushaal&filename=" + filename,
                                                data: fromdata,
                                                contentType: false,
                                                processData: false,
                                                success: function () {
                                                    smallBox('Хавсралт файл', 'Амжилттай хадгалагдлаа', '#659265', 1000);
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
                                    $('#tomiloltTab2Datatable > tbody  > tr').each(function () {
                                        if ($.trim($('td:eq(0)', this).html()) == $.trim($('#pTab2TomiloltID').html()) && $.trim($('td:eq(1)', this).html()) == $.trim($('#pTab2StaffID').html())) {
                                            $('td:eq(11)', this).html($.trim($('#pTab2ModalInputReportdate').val()) + ' <a class="btn btn-info btn-xs" href="../files/tomilolttushaal/' + filename + '" download><i class="fa fa-paperclip"></i> Татах</a>');
                                            return false;
                                        }
                                    });
                                    $('#pTab2Modal').modal('hide');
                                    smallBox('Томилолтын тайлан', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/WSOracleExecuteNonQuery",
                                data: '{qry:"UPDATE ST_TOMILOLT_REPORT SET REPORTDATE=\'' + $.trim($('#pTab2ModalInputReportdate').val()) + '\', REPORTFILENAME=\'' + filename + '\', UPDATED_STAFFID=' + $.trim($('#indexUserId').text()) + ', UPDATED_DATE=sysdate WHERE TOMILOLT_ID=' + $.trim($('#pTab2TomiloltID').text()) + ' AND STAFFS_ID=' + $.trim($('#pTab2StaffID').text()) + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    if (filename != "none") {
                                        if ($("#pTab2ModalInputAttachInput").val() != '') {
                                            var uploadfiles = $("#pTab2ModalInputAttachInput").get(0);
                                            var uploadedfiles = uploadfiles.files;
                                            var fromdata = new FormData();
                                            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                            globalAjaxVar = $.ajax({
                                                type: "POST",
                                                url: "pg/UploadFile.ashx?folder=tomilolttushaal&filename=" + filename,
                                                data: fromdata,
                                                contentType: false,
                                                processData: false,
                                                success: function () {
                                                    smallBox('Хавсралт файл', 'Амжилттай хадгалагдлаа', '#659265', 1000);
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
                                    $('#tomiloltTab2Datatable > tbody  > tr').each(function () {
                                        if ($.trim($('td:eq(0)', this).html()) == $.trim($('#pTab2TomiloltID').html()) && $.trim($('td:eq(1)', this).html()) == $.trim($('#pTab2StaffID').html())) {
                                            $('td:eq(11)', this).html($.trim($('#pTab2ModalInputReportdate').val()) + ' <a class="btn btn-info btn-xs" href="../files/tomilolttushaal/' + filename + '" download><i class="fa fa-paperclip"></i> Татах</a>');
                                            return false;
                                        }
                                    });
                                    $('#pTab2Modal').modal('hide');
                                    smallBox('Томилолтын тайлан', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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

    $('#pTab1ModalInputFromdate, #pTab1ModalInputTodate, #pTab1ModalInputTushaaldate, #pTab1SelectFromdate, #pTab1SelectTodate, #pTab2ModalInputReportdate').datepicker({
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