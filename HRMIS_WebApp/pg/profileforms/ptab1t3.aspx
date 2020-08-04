<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t3.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t3" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Боловсрол <small>/ Ерөнхий, тусгай, дээд боловсрол, дипломын, баклаврын болон магистрийн зэргийг оролцуулан /</small> </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T3Section1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T3Section1Modal" data-toggle="modal" onclick="showAddEditTab1T3Section1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T3Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T3Section1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Боловсролын докторын болон шинжлэх ухааны докторын зэрэг </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T3Section2AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T3Section2Modal" data-toggle="modal" onclick="showAddEditTab1T3Section2(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T3Section2" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T3Section2Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <%--<article class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
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
        </article>--%>
    </div>
</section>
<div id="pTab1T3Section1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T3Section1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Боловсрол&nbsp;<span id="pTab1T3Section1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T3Section1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">Хаана <small>/ Аймар, хот, Гадаадад /</small></label>
					                <select id="pTab1T3Section1ModalSelectCity" name="pTab1T3Section1ModalSelectCity" runat="server" class="form-control" style="padding: 5px;">
						                <option value="">- Сонго -</option>
					                </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Хаана <small>/ Сум, дүүрэг, Аль улсад /</small></label>
					                <select id="pTab1T3Section1ModalSelectDist" name="pTab1T3Section1ModalSelectDist" runat="server" class="form-control" style="padding: 5px;" disabled>
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
                                    <label class="control-label">*Сургуулийн нэр</label>
                                    <input id="pTab1T3Section1ModalInputInstitutename" name="pTab1T3Section1ModalInputInstitutename" type="text" class="form-control" placeholder="Сургуулийн нэр" />
                                    <div class="note">Сургуулийн нэрийг бүтэн бичнэ</div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Эзэмшсэн боловсрол, мэргэжил</label>
                                    <input id="pTab1T3Section1ModalInputProfessiondesc" name="pTab1T3Section1ModalInputProfessiondesc" type="text" class="form-control" placeholder="Эзэмшсэн боловсрол, мэргэжил" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Орсон он</label>
                                    <select id="pTab1T3Section1ModalSelectFromyear" name="pTab1T3Section1ModalSelectFromyear" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Орсон сар</label>
                                    <select id="pTab1T3Section1ModalSelectFrommonth" name="pTab1T3Section1ModalSelectFrommonth" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Төгссөн он</label>
                                    <select id="pTab1T3Section1ModalSelectToyear" name="pTab1T3Section1ModalSelectToyear" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Төгссөн сар</label>
                                    <select id="pTab1T3Section1ModalSelectTomonth" name="pTab1T3Section1ModalSelectTomonth" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Боловсрол, мэргэжлийн зэрэг</label>
                                    <select id="pTab1T3Section1ModalSelectEdutp" name="pTab1T3Section1ModalSelectEdutp" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Гэрчилгээ, Дипломын #</label>
                                    <input id="pTab1T3Section1ModalInputCertificateno" name="pTab1T3Section1ModalInputCertificateno" type="text" class="form-control" placeholder="Гэрчилгээ, Дипломын #" />
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
<div id="pTab1T3Section2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="pTab1T3Section2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Докторын зэрэг&nbsp;<span id="pTab1T3Section2ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T3Section2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Зэрэг</label>
                                    <select id="pTab1T3Section2ModalSelectEdutp" name="pTab1T3Section2ModalSelectEdutp" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label">*Хамгаалсан газар</label>
                                    <input id="pTab1T3Section2ModalInputInstitutename" name="pTab1T3Section2ModalInputInstitutename" type="text" class="form-control" placeholder="Хамгаалсан газар" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-8">
                                    <label class="control-label">*Хамгаалсан сэдэв</label>
                                    <input id="pTab1T3Section2ModalInputTitledesc" name="pTab1T3Section2ModalInputTitledesc" type="text" class="form-control" placeholder="Хамгаалсан сэдэв" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Он</label>
                                    <select id="pTab1T3Section2ModalSelectYear" name="pTab1T3Section2ModalSelectYear" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Сар</label>
                                    <select id="pTab1T3Section2ModalSelectMonth" name="pTab1T3Section2ModalSelectMonth" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">Гэрчилгээ, Дипломын #</label>
                                    <input id="pTab1T3Section2ModalInputCertificateno" name="pTab1T3Section2ModalInputCertificateno" type="text" class="form-control" placeholder="Гэрчилгээ, Дипломын #" />
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
<%--<div id="pTab1T3Section3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
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
                                    <label class="control-label">*Он</label>
                                    <select id="pTab1T3Section3ModalSelectYear" name="pTab1T3Section3ModalSelectYear" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
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
</div>--%>
<script type="text/javascript">
    dataBindTab1T3Section1Datatable();
    dataBindTab1T3Section2Datatable();
    //dataBindTab1T3Section3Datatable();
    function dataBindTab1T3Section1Datatable() {
        showLoader('loaderTab1T3Section1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T3Datatable1",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T3Section1Table").html(msg.d);
                hideLoader('loaderTab1T3Section1');
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
    function dataBindTab1T3Section2Datatable() {
        showLoader('loaderTab1T3Section2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T3Datatable2",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T3Section2Table").html(msg.d);
                hideLoader('loaderTab1T3Section2');
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
    <%--function dataBindTab1T3Section3Datatable() {
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
    }--%>
    $("#pTab1T3Section1ModalSelectCity").change(function () {
        if ($("#pTab1T3Section1ModalSelectCity option:selected").val() == "") {
            $("#pTab1T3Section1ModalSelectDist").html("<option selected value=\"\">- Сонго -</option>");
            $("#pTab1T3Section1ModalSelectDist").prop("disabled", true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/staffreg_staffregTab1ModalDistForDDL",
                data: '{city:"' + $("#pTab1T3Section1ModalSelectCity option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1T3Section1ModalSelectDist").html(msg.d);
                    $("#pTab1T3Section1ModalSelectDist").prop("disabled", false);
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
    });
    function showAddEditTab1T3Section1(el, isinsupt) {
        $('#pTab1T3Section1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T3Section1ID').html('');
            $('#pTab1T3Section1ModalSelectCity').val('');
            $('#pTab1T3Section1ModalSelectDist').val('');
            $('#pTab1T3Section1ModalInputInstitutename').val('');
            $('#pTab1T3Section1ModalSelectFromyear').val('');
            $('#pTab1T3Section1ModalSelectFrommonth').val('');
            $('#pTab1T3Section1ModalSelectToyear').val('');
            $('#pTab1T3Section1ModalSelectTomonth').val('');
            $('#pTab1T3Section1ModalInputProfessiondesc').val('');
            $('#pTab1T3Section1ModalSelectEdutp').val('');
            $('#pTab1T3Section1ModalInputCertificateno').val('');
        }
        else {
            $('#pTab1T3Section1ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T3Section1ModalSelectCity').val($(el).closest('tr').find('td:eq(10)').text());
            console.log('---------');
            console.log($(el).closest('tr').find('td:eq(10)').text());
            if ($.trim($(el).closest('tr').find('td:eq(10)').text()) != '') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/staffreg_staffregTab1ModalDistForDDL",
                    data: '{city:"' + $("#pTab1T3Section1ModalSelectCity option:selected").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        $("#pTab1T3Section1ModalSelectDist").html(msg.d);
                        $("#pTab1T3Section1ModalSelectDist").prop("disabled", false);
                        $('#pTab1T3Section1ModalSelectDist').val($(el).closest('tr').find('td:eq(11)').text());
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
            else {
                $("#pTab1T3Section1ModalSelectDist").prop("disabled", true);
                $('#pTab1T3Section1ModalSelectDist').val('');
            }
            $('#pTab1T3Section1ModalInputInstitutename').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T3Section1ModalSelectFromyear').val($(el).closest('tr').find('td:eq(4)').attr('data-yr'));
            $('#pTab1T3Section1ModalSelectFrommonth').val($(el).closest('tr').find('td:eq(4)').attr('data-mnth'));
            $('#pTab1T3Section1ModalSelectToyear').val($(el).closest('tr').find('td:eq(5)').attr('data-yr'));
            $('#pTab1T3Section1ModalSelectTomonth').val($(el).closest('tr').find('td:eq(5)').attr('data-mnth'));
            $('#pTab1T3Section1ModalInputProfessiondesc').val($(el).closest('tr').find('td:eq(6)').text());
            $('#pTab1T3Section1ModalSelectEdutp').val($(el).closest('tr').find('td:eq(12)').text());
            $('#pTab1T3Section1ModalInputCertificateno').val($(el).closest('tr').find('td:eq(8)').text());
        }
    }
    function showAddEditTab1T3Section2(el, isinsupt) {
        $('#pTab1T3Section2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T3Section2ID').html('');
            $('#pTab1T3Section2ModalSelectEdutp').val('');
            $('#pTab1T3Section2ModalInputInstitutename').val('');
            $('#pTab1T3Section2ModalInputTitledesc').val('');
            $('#pTab1T3Section2ModalSelectYear').val('');
            $('#pTab1T3Section2ModalSelectMonth').val('');
            $('#pTab1T3Section2ModalInputCertificateno').val('');
        }
        else {
            $('#pTab1T3Section2ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T3Section2ModalSelectEdutp').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1T3Section2ModalInputInstitutename').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1T3Section2ModalInputTitledesc').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T3Section2ModalSelectYear').val($(el).closest('tr').find('td:eq(4)').attr('data-yr'));
            $('#pTab1T3Section2ModalSelectMonth').val($(el).closest('tr').find('td:eq(4)').attr('data-mnth'));
            $('#pTab1T3Section2ModalInputCertificateno').val($(el).closest('tr').find('td:eq(5)').text());
        }
    }
    //function showAddEditTab1T3Section3(el, isinsupt) {
    //    $('#pTab1T3Section3ModalHeaderLabel').text(isinsupt);
    //    if (isinsupt == 'нэмэх') {
    //        $('#pTab1T3Section3ID').html('');
    //        $('#pTab1T3Section3ModalSelectSciencedegree').val('');
    //        $('#pTab1T3Section3ModalInputInstitutename').val('');
    //        $('#pTab1T3Section3ModalSelectYear').val('');
    //        $('#pTab1T3Section3ModalInputCertificateno').val('');
    //    }
    //    else {
    //        $('#pTab1T3Section2ID').html($(el).closest('tr').find('td:eq(0)').text());
    //        $('#pTab1T3Section3ModalSelectSciencedegree').val($(el).closest('tr').find('td:eq(6)').text());
    //        $('#pTab1T3Section3ModalInputInstitutename').val($(el).closest('tr').find('td:eq(2)').text());
    //        $('#pTab1T3Section3ModalSelectYear').val($(el).closest('tr').find('td:eq(3)').text());
    //        $('#pTab1T3Section3ModalInputCertificateno').val($(el).closest('tr').find('td:eq(4)').text());
    //    }
    //}
    function showDeleteTab1T3Section1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_EDUCATION WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section1Datatable();
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
    function showDeleteTab1T3Section2(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_PHD WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section2Datatable();
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
    //function showDeleteTab1T3Section3(el) {
    //    $.SmartMessageBox({
    //        title: "Анхааруулга!",
    //        content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
    //        buttons: '[Үгүй][Тийм]'
    //    }, function (ButtonPressed) {
    //        if (ButtonPressed === "Тийм") {
    //            globalAjaxVar = $.ajax({
    //                type: "POST",
    //                url: "ws.aspx/WSOracleExecuteNonQuery",
    //                data: '{qry:"DELETE FROM ST_SCIENCEDEGREE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function () {
    //                    dataBindTab1T3Section3Datatable();
    //                    smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
    //                },
    //                failure: function (response) {
    //                    alert('FAILURE: ' + response.d);
    //                },
    //                error: function (xhr, status, error) {
    //                    var err = eval("(" + xhr.responseText + ")");
    //                    if (err.Message == 'SessionDied') window.location = '../login.html';
    //                    else if (err.Message == 'NullReferenceException') {
    //                        //alert('NullReferenceException');
    //                    }
    //                    else window.location = '../#pg/error500.aspx';
    //                }
    //            });
    //        }
    //    });
    //}
    $('#pTab1T3Section1ModalForm').bootstrapValidator({
        fields: {
            pTab1T3Section1ModalSelectCity: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section1ModalSelectDist: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section1ModalInputInstitutename: {
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
            pTab1T3Section1ModalSelectFromyear: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section1ModalSelectFrommonth: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section1ModalSelectToyear: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section1ModalSelectTomonth: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section1ModalInputProfessiondesc: {
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
            pTab1T3Section1ModalSelectEdutp: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section1ModalInputCertificateno: {
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
            if ($('#pTab1T3Section1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_EDUCATION (ID, STAFFS_ID, CITY_ID, DIST_ID, INSTITUTENAME, FROMYR, FROMMNTH, TOYR, TOMNTH, PROFESSIONDESC, EDUTP_ID, CERTIFICATENO, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_EDUCATION\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T3Section1ModalSelectCity option:selected').val() + ', ' + $('#pTab1T3Section1ModalSelectDist option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section1ModalInputInstitutename').val())) + '\', ' + $('#pTab1T3Section1ModalSelectFromyear option:selected').val() + ', ' + $('#pTab1T3Section1ModalSelectFrommonth option:selected').val() + ', ' + $('#pTab1T3Section1ModalSelectToyear option:selected').val() + ', ' + $('#pTab1T3Section1ModalSelectTomonth option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section1ModalInputProfessiondesc').val())) + '\', ' + $('#pTab1T3Section1ModalSelectEdutp option:selected').val() + ', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section1ModalInputCertificateno').val()))) + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section1Datatable();
                        $('#pTab1T3Section1Modal').modal('hide');
                        smallBox('Боловсрол', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_EDUCATION SET CITY_ID=' + $('#pTab1T3Section1ModalSelectCity option:selected').val() + ', DIST_ID=' + $('#pTab1T3Section1ModalSelectDist option:selected').val() + ', INSTITUTENAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section1ModalInputInstitutename').val())) + '\', FROMYR=' + $('#pTab1T3Section1ModalSelectFromyear option:selected').val() + ', FROMMNTH=' + $('#pTab1T3Section1ModalSelectFrommonth option:selected').val() + ', TOYR=' + $('#pTab1T3Section1ModalSelectToyear option:selected').val() + ', TOMNTH=' + $('#pTab1T3Section1ModalSelectTomonth option:selected').val() + ', PROFESSIONDESC=\'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section1ModalInputProfessiondesc').val())) + '\', EDUTP_ID=' + $('#pTab1T3Section1ModalSelectEdutp option:selected').val() + ', CERTIFICATENO=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section1ModalInputCertificateno').val()))) + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T3Section1ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section1Datatable();
                        $('#pTab1T3Section1Modal').modal('hide');
                        smallBox('Боловсрол', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
    $('#pTab1T3Section2ModalForm').bootstrapValidator({
        fields: {
            pTab1T3Section2ModalSelectEdutp: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section2ModalInputInstitutename: {
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
            pTab1T3Section2ModalInputTitledesc: {
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
            pTab1T3Section2ModalSelectYear: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section2ModalSelectMonth: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T3Section2ModalInputCertificateno: {
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
            if ($('#pTab1T3Section2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_PHD (ID, STAFFS_ID, EDUTP_ID, INSTITUTENAME, TITLEDESC, DEGREEYR, DEGREEMNTH, CERTIFICATENO, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_PHD\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T3Section2ModalSelectEdutp option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section2ModalInputInstitutename').val())) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section2ModalInputTitledesc').val())) + '\', ' + $('#pTab1T3Section2ModalSelectYear option:selected').val() + ', ' + $('#pTab1T3Section2ModalSelectMonth option:selected').val() + ', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section2ModalInputCertificateno').val()))) + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section2Datatable();
                        $('#pTab1T3Section2Modal').modal('hide');
                        smallBox('Докторын зэрэг', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_PHD SET EDUTP_ID=' + $('#pTab1T3Section2ModalSelectEdutp option:selected').val() + ', INSTITUTENAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section2ModalInputInstitutename').val())) + '\', TITLEDESC=\'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section2ModalInputTitledesc').val())) + '\', DEGREEYR=' + $('#pTab1T3Section2ModalSelectYear option:selected').val() + ', DEGREEMNTH=' + $('#pTab1T3Section2ModalSelectMonth option:selected').val() + ', CERTIFICATENO=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section2ModalInputCertificateno').val()))) + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T3Section2ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T3Section2Datatable();
                        $('#pTab1T3Section2Modal').modal('hide');
                        smallBox('Докторын зэрэг', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
    <%--$('#pTab1T3Section3ModalForm').bootstrapValidator({
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
            pTab1T3Section3ModalSelectYear: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
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
                    data: '{qry:"INSERT INTO ST_SCIENCEDEGREE (ID, STAFFS_ID, SCIENCEDEGREE_ID, INSTITUTENAME, DEGREEYR, CERTIFICATENO, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_SCIENCEDEGREE\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T3Section3ModalSelectSciencedegree option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputInstitutename').val())) + '\', ' + $('#pTab1T3Section3ModalSelectYear option:selected').val() + ', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputCertificateno').val()))) + ', ' + $('#indexUserId').text() + ', sysdate)"}',
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
                    data: '{qry:"UPDATE ST_SCIENCEDEGREE SET SCIENCEDEGREE_ID=' + $('#pTab1T3Section3ModalSelectSciencedegree option:selected').val() + ', INSTITUTENAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputInstitutename').val())) + '\', DEGREEYR=' + $('#pTab1T3Section3ModalSelectYear option:selected').val() + ', CERTIFICATENO=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T3Section3ModalInputCertificateno').val()))) + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T3Section2ID').html() + '"}',
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
    });--%>
</script>
