<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="srv.aspx.cs" Inherits="HRWebApp.pg.srv" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa-fw fa fa-home"></i>
        <span>> Санал асуулга</span>
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" runat="server" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Санал асуулгын мэдээлэл
                    </a>
                </li>
                <li id="pTab2Li" runat="server" class="pull-right hide">
                    <a data-toggle="tab" href="#pTab2">
                        <i class="fa fa-fw fa-lg fa-table"></i>
                        Асуултын тохиргоо
                    </a>
                </li>
                <li id="pTab3Li" runat="server" class="pull-right hide">
                    <a data-toggle="tab" href="#pTab3">
                        <i class="fa fa-fw fa-lg fa-table "></i>
                        Хариултын тохиргоо 
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="pTab1" runat="server" class="tab-pane active">
                    <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"><i class="fa fa-table"></i></span>
                            <h2>Санал асуулгын мэдээлэл</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div id="loaderTab1" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div class="Colvis TableTools" style="width:150px; right:130px; top:6px; z-index:5;">
                                <select id="pTab1ModalSelectPlanList" name="pTab1ModalSelectPlanList" class="form-control" style="padding:1px;">
                                    <option value="">Бүгд</option>
                                    <option selected value="1">Идэвхтэй асуулга</option>
                                    <option value="2">Хугацаа дууссан</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:285px; top:4px; z-index:5; margin-top:7px;"><label>Харуулах төрөл: </label></div>
                            <div id="divBindTab1Table" class="widget-body no-padding">
                                        
                            </div>
                        </div>
                    </div>
                </div>
                <div id="pTab2" runat="server" class="tab-pane">

                </div>
                <div id="pTab3" runat="server" class="tab-pane">

                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1SubmitAnswerModal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" aria-hidden="true" data-dismiss="modal" type="button"> ×</button>
                <h4 id="pTab1SubmitAnswerModalTitle" class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <div id="pTab1SubmitAnswerModalQuestionID" class="hide"></div>
                <fieldset>
					<div class="form-group">
                        <div class="row">
                            <div id="pTab1SubmitAnswerModalAnswerList" class="col-md-12">
                                <div class="radio">
									<label>
										<input type="radio" class="radiobox style-0" name="pTab1SubmitAnswerModalInputAnswer">
										<span>Radiobox 1</span> 
									</label>
								</div>
                            </div>                                
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" type="button"> Болих </button>
                <button id="pTab1SubmitAnswerModalBtnSave" class="btn btn-success btn-sm" type="button"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах </button>
            </div>
        </div>
    </div>
</div>
<div id="pTabsAttachShowModal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            
        </div>
    </div>
</div>
<div id="pTab1ResultModal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            
        </div>
    </div>
</div>
<script type="text/javascript">
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valLiId = $('#pTab1Li').closest('ul').find('.active').attr('id');
        if (valLiId == 'pTab1Li') {
            dataBindTab1DataTable();
        }
        else if (valLiId == 'pTab2Li') {
            //dataBindTab2DataTable();
        }
        else if (valLiId == 'pTab3Li') {
            //dataBindTab3DataTable();
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
                dataBindTab1DataTable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divBindTab2Table').html()) == "") {
                //dataBindTab2DataTable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#divBindTab3Table').html()) == "") {
                //dataBindTab3DataTable();
            }
        }
    }

    //tab1
    function dataBindTab1DataTable() {
        var valData = '';
        var valAnswerSubmit = '';
        var valResult = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/SrvTab1Datatable",
            data: '{"tp": "' + $("#pTab1ModalSelectPlanList option:selected").val() + '", "staffid": "' + $("#indexUserId").html() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += '<table id="pTab1Datatable" class="table table-striped table-bordered table-hover smart-form" width="100%"><thead>';
                valData += '<tr>';
                valData += '<th class="text-center" style="vertical-align:middle;">#</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Асуулга</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Эхлэх хугацаа</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Дуусах хугацаа</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Хавсралт</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Санал өгөх</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Үр дүн</th>';
                valData += '</tr>';
                valData += '</thead><tbody>';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += '<tr data-questionid="' + value.ID + '">';
                    valData += '<td>' + value.ROWNO + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.TITLE) + '</td>';
                    valData += '<td>' + value.BEGINDT + '</td>';
                    valData += '<td>' + value.ENDDT + '</td>';
                    valData += "<td>";
                    if (value.FILENAME != "") {
                        valData += "<div class=\"btn-group\">";
                        valData += "<a href=\"../pg/srvTabsAttachShowModal.aspx?filename=" + value.FILENAME + "\" class=\"btn btn-default btn-xs\" data-target=\"#pTabsAttachShowModal\" data-toggle=\"modal\"><i class=\"fa fa-eye\"></i> Харах</a>";
                        valData += "</div>";
                    }
                    valData += "</td>";
                    if (value.ISANSWERED == "1") {
                        valAnswerSubmit = "<a href=\"javascript:void(0);\" class=\"btn btn-warning btn-xs\" disabled=\"disabled\">Санал өгсөн</a>";
                        valResult = "<a href=\"../pg/srvTab1ResultShowModal.aspx?id=" + value.ID + "\" class=\"btn btn-default btn-xs\" data-target=\"#pTab1ResultModal\" data-toggle=\"modal\"><i class=\"fa fa-eye\"></i> Үр дүн харах</a>";
                    }
                    else {
                        if (value.ISACTIVE == "1") {
                            valAnswerSubmit = "<a href=\"javascript:void(0);\" class=\"btn btn-success btn-xs\" data-target=\"#pTab1SubmitAnswerModal\" data-toggle=\"modal\" onclick=\"showAnswerListTab1(this);\">Санал өгөх</a>";
                            valResult = "<a href=\"javascript:void(0)\" class=\"btn btn-default btn-xs\" onclick=\"alert('Санал асуулга өгж байж үр дүн харна уу!');\"><i class=\"fa fa-eye\"></i> Үр дүн харах</a>";
                        }
                        else {
                            valAnswerSubmit = "";
                            valResult = "<a href=\"../pg/srvTab1ResultShowModal.aspx?id=" + value.ID + "\" class=\"btn btn-default btn-xs\" data-target=\"#pTab1ResultModal\" data-toggle=\"modal\"><i class=\"fa fa-eye\"></i> Үр дүн харах</a>";
                        }
                    }
                    valData += "<td>";
                    valData += "<div class=\"btn-group\">";
                    valData += valAnswerSubmit;
                    valData += "</div>";
                    valData += "</td>";
                    valData += "<td>";
                    valData += "<div class=\"btn-group\">";
                    valData += valResult;
                    valData += "</div>";
                    valData += "</td>";
                    valData += '</tr>';
                });
                valData += '</tbody>';
                valData += '</table>';
                valData += "<script>";
                valData += "var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#pTab1Datatable').dataTable({\"bSort\":false, \"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"20px\" }, null, { \"sWidth\": \"100px\" }, { \"sWidth\": \"100px\" },{ \"sWidth\": \"65px\" },{ \"sWidth\": \"79px\" },{ \"sWidth\": \"100px\" }]});";
                valData += "<\/script>";
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
    $("#pTab1ModalSelectPlanList").change(function () {
        dataBindTab1DataTable();
    });
    function showAnswerListTab1(el) {
        $('#pTab1SubmitAnswerModalQuestionID').html($(el).closest('tr').attr('data-questionid'));
        $('#pTab1SubmitAnswerModalTitle').html($(el).closest('tr').find('td:eq(1)').html());
        $("#pTab1SubmitAnswerModalAnswerList").html('');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/SrvTab1AnswerList",
            data: '{"questionid": "' + $(el).closest('tr').attr('data-questionid') + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<div class=\"radio\">";
                    valData += "<label>";
                    valData += "<input type=\"radio\" class=\"radiobox style-0\" name=\"pTab1SubmitAnswerModalInputAnswer\" value=\"" + value.ID + "\">";
                    valData += "<span>"+replaceDatabaseToDisplay(value.NAME)+"</span>";
                    valData += "</label>";
                    valData += '</div>';
                });
                $("#pTab1SubmitAnswerModalAnswerList").html(valData);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#pTab1SubmitAnswerModalBtnSave").click(function () {
        if ($("input[name='pTab1SubmitAnswerModalInputAnswer']").is(':checked')) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/OracleExecuteScalar",
                data: '{"qry":"SELECT COUNT(1) as CNT FROM ST_SRVRESULT WHERE SRVQUESTION_ID=' + $('#pTab1SubmitAnswerModalQuestionID').html() + ' AND STAFFS_ID=' + $('#indexUserId').html() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == '0') {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../webservice/ServiceMain.svc/OracleExecuteNonQuery",
                            data: '{"qry":"INSERT INTO ST_SRVRESULT (SRVQUESTION_ID, SRVANSWER_ID, STAFFS_ID) VALUES (' + $('#pTab1SubmitAnswerModalQuestionID').html() + ', ' + $("input[name='pTab1SubmitAnswerModalInputAnswer']:checked").val() + ', ' + $('#indexUserId').html() + ')"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                $('#pTab1Datatable > tbody  > tr').each(function () {
                                    if ($(this).attr('data-questionid') == $('#pTab1SubmitAnswerModalQuestionID').html()) {
                                        $('td:eq(5)', this).html("<a href=\"javascript:void(0);\" class=\"btn btn-warning btn-xs\" disabled=\"disabled\">Санал өгсөн</a>");
                                        $('td:eq(6)', this).html("<a href=\"../pg/srvTab1ResultShowModal.aspx?id=" + $('#pTab1SubmitAnswerModalQuestionID').html() + "\" class=\"btn btn-default btn-xs\" data-target=\"#pTab1ResultModal\" data-toggle=\"modal\"><i class=\"fa fa-eye\"></i> Үр дүн харах</a>");
                                        return false;
                                    }
                                });
                                $('#pTab1SubmitAnswerModal').modal('hide');
                                smallBox('Таны санал', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                window.location = '../#pg/error500.aspx';
                            }
                        });
                    }
                    else alert('Энэ асуулга дээр та санал оруулсан байна!');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
        else alert('Асуулгын хариу сонгоно уу!');
    });


    function showLoader(el) {
        $('#' + el).css({ "display": "block", "background": "rgba(0, 0, 0, .3)" });
    }
    function hideLoader(el) {
        $('#' + el).css({ "display": "none" });
    };
    function replaceDisplayToDatabase(val) {
        return val.replace(/&quot;/g, "quot;").replace(/</g, 'lt;').replace(/>/g, 'gt;').replace(/"/g, 'quot;').replace(/'/g, "apos;").replace(/&/g, 'amp;').replace(/\\/g, "bsol;");
    }
    function replaceDatabaseToDisplay(val) {
        return val.replace(/lt;/g, '<').replace(/gt;/g, '>').replace(/quot;/g, '"').replace(/amp;/g, '&').replace(/apos;/g, "'").replace(/bsol;/g, "\\");
    }
</script>
