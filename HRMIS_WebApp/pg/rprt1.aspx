<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rprt1.aspx.cs" Inherits="HRWebApp.pg.rprt1" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa fa-home"></i> > Тайлан 01
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab1">
                        Шагналын тайлан
                    </a>
                </li>
            </ul>
            <div id="workingtimeTabContent" class="tab-content">
                <div id="pTab1" class="tab-pane active">
                    <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                        <div style="width:70%; float:left;">
                            <div style="width:50px; float:left; padding-top:5px;">Газар: </div>
                            <div style="width:100px; float:left; margin-right:10px;"><select id="pTab1SelectBranchGazar" name="pTab1SelectBranchGazar" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:50px; float:left; padding-top:5px;">Хэлтэс: </div>
                            <div style="width:100px; float:left; margin-right:10px;"><select disabled="disabled" id="pTab1SelectBranchHeltes" name="pTab1SelectBranchHeltes" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:60px; float:left; padding-top:5px;">Ажилтан: </div>
                            <div style="width:200px; float:left; margin-right:10px;"><select disabled="disabled" id="pTab1SelectStaff" name="pTab1SelectStaff" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                             <div style="width:60px; float:left; padding-top:5px;">Төлөв: </div>
                            <div style="width:250px; float:left;margin-right:10px;" >
                            <select name="pTab1SelectType" id="pTab1SelectType" class="form-control" style="padding: 1px;">
	                            <option value="">- Бүгд -</option>
	                            <option selected="selected" value="1-0">Идэвхтэй</option>
	                            <option value="0-2">Түр чөлөөлөх</option>
	                            <option value="0-4">Албанаас халах</option>
	                            <option value="0-5">Дотоод шилжилт хөдөлгөөн</option>
	                            <option value="0-3">Чөлөөлөх</option>
                            </select>
                    </div>
                        </div>
                        <div style="text-align:right; width:30%; float:left;">
                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divpTab1', 'ЦагАшиглалтынБайдал')">
                                <i class="fa fa-file-word-o"></i>
                            </a>
                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab1')">
                                <i class="fa fa-print"></i>
                            </a>
                        </div> 
                    </div>   
                    <div id="loaderTab1" class="search-background">
                        <label>
                            <img width="64" height="" src="img/loading.gif"/>
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                        </label>
                    </div>                  
                    <div id="divpTab1" runat="server" class="reports" style="margin:0 10px 10px 10px; width: 100%;">                        
                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                            <label id="divpTab1Level" runat="server" style="font-weight:bold;">Level</label> ШАГНАЛЫН ТАЙЛАН
                        </div>
                        <div id="divpTab1Datatable" runat="server"></div>                                
                    </div>                
                </div>
            </div>
        </article>
    </div>
</section>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        pTab1SetFirstControls();
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
            if ($.trim($('#divpTab1Datatable').html()) == "") {
                pTab1SetFirstControls();
            }
        }
    }
    //tab1
    function pTab1SetFirstControls() {
        var userId = $('#indexUserId').text();
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
                $("#pTab1SelectBranchGazar").html('<option value="">Бүгд</option>' + valData);
                $("#pTab1SelectBranchGazar").val(userGazarId);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                    data: '{"gazarId": "' + $("#pTab1SelectBranchGazar option:selected").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                        });
                        $("#pTab1SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);

                        if (!funcCheckRoles('1,5')) {
                            $('#pTab1SelectBranchGazar').prop('disabled', true);
                            if ($('#indexUserPosId').html() != '2010201' && $('#indexUserPosId').html() != '2010301') {
                                $('#pTab1SelectBranchHeltes').val(userHeltesId);
                                $('#pTab1SelectBranchHeltes').prop('disabled', true);
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../webservice/ServiceMain.svc/StaffListForDDL",
                                    data: '{"gazarId": "' + $("#pTab1SelectBranchGazar option:selected").val() + '", "heltesId":"' + $("#pTab1SelectBranchHeltes option:selected").val() + '"}',
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
                                        $("#pTab1SelectStaff").html('<option value="">Бүгд</option>' + valData);
                                        $('#pTab1SelectStaff').prop('disabled', false);
                                        dataBindTab1Datatable();
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
                                $('#pTab1SelectStaff').html('<option value="">Бүгд</option>');
                                $('#pTab1SelectStaff').prop('disabled', true);
                                dataBindTab1Datatable();
                            }
                        }
                        else {
                            $('#pTab1SelectBranchGazar').prop('disabled', false);
                            $('#pTab1SelectBranchHeltes').prop('disabled', true);
                            $('#pTab1SelectStaff').html('<option value="">Бүгд</option>');
                            $('#pTab1SelectStaff').prop('disabled', true);
                            dataBindTab1Datatable();
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
                window.location = '../#pg/error500.aspx';;
            }
        });
    }
    $("#pTab1SelectBranchGazar").change(function () {
        dataBindpTab1SelectBranchHeltes();
    });
    $("#pTab1SelectBranchHeltes").change(function () {
        dataBindpTab1SelectStaff();
    });
    $("#pTab1SelectStaff").change(function () {
        dataBindTab1Datatable();
    });
    $("#pTab1SelectType").change(function () {
        dataBindTab1Datatable();
    });
    function dataBindpTab1SelectBranchHeltes() {
        var valData = '';
        if ($("#pTab1SelectBranchGazar option:selected").val() == "") {
            $("#pTab1SelectBranchHeltes").html("<option selected value=\"\">Бүгд</option>");
            $("#pTab1SelectBranchHeltes").prop("disabled", true);
            $("#pTab1SelectStaff").html("<option selected value=\"\">Бүгд</option>");
            $("#pTab1SelectStaff").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                data: '{"gazarId": "' + $("#pTab1SelectBranchGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                    });
                    $("#pTab1SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);
                    $("#pTab1SelectBranchHeltes").prop("disabled", false);
                    dataBindTab1Datatable();
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
    function dataBindpTab1SelectStaff() {
        var valData = '', valOptGroup = '';
        if ($("#pTab1SelectBranchHeltes").val() == "") {
            $("#pTab1SelectStaff").html("<option selected value=\"\">Бүгд</option>");
            $("#pTab1SelectStaff").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/StaffListForDDL",
                data: '{"gazarId": "' + $("#pTab1SelectBranchGazar option:selected").val() + '", "heltesId":"' + $("#pTab1SelectBranchHeltes option:selected").val() + '"}',
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
                    $("#pTab1SelectStaff").html('<option value="">Бүгд</option>' + valData);
                    $("#pTab1SelectStaff").prop("disabled", false);
                    dataBindTab1Datatable();
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
    function dataBindTab1Datatable() {
        var valData = '';
        var valStid = "";
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/Rprt1Tab1Datatable",
            data: '{"gazar":"' + $("#pTab1SelectBranchGazar option:selected").val() + '", "heltes":"' + $("#pTab1SelectBranchHeltes option:selected").val() + '", "stid":"' + $("#pTab1SelectStaff option:selected").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table style=\"border: 1px solid #000; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                valData += "<thead style=\"background-color:C6D9F1;\">";
                valData += "<tr style=\"font-size:8pt;\">";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">#</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Газар нэгж</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Албан тушаал</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажилтаны нэр</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Шагналын нэр</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Тушаал, шийдвэр</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Огноо</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Дугаар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Мөнгөн дүн</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) 
                {
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.ROWNO + "</td>";
                    if (valStid != value.STAFFS_ID) {
                        valData += "<td rowspan=\""+value.CNT+"\" style=\"border: 1px solid #000; padding:5px;\">" + value.NEGJ + "</td>";
                        valData += "<td rowspan=\""+value.CNT+"\" style=\"border: 1px solid #000; padding:5px;\">" + value.POSNAME + "</td>";
                        valData += "<td rowspan=\""+value.CNT+"\" style=\"border: 1px solid #000; padding:5px;\">" + value.STAFFNAME + "</td>";
                    }
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.NAME + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.SHAGNALDECISION_NAME + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.DT + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.TUSHAALNO + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:right;\">" + value.PRICE + "</td>";
                    valData += "</tr>";
                    valStid = value.STAFFS_ID;
                });
                valData += "</tbody>";
                valData += "</table>";
                $("#divpTab1Datatable").html(valData);
                if ($("#pTab1SelectStaff option:selected").val() == '') {
                    if ($("#pTab1SelectBranchHeltes option:selected").val() == '') {
                        if ($("#pTab1SelectBranchGazar option:selected").val() == '') $("#divpTab1Level").text("СЯ-НЫ");
                        else $('#divpTab1Level').html($('#pTab1SelectBranchGazar option:selected').text() + '-Н');
                    }
                    else $('#divpTab1Level').html($('#pTab1SelectBranchGazar option:selected').text() + '-Н ' + $('#pTab1SelectBranchHeltes option:selected').text() + '-Н ');
                }
                else $('#divpTab1Level').html($('#pTab1SelectBranchGazar option:selected').text() + '-Н ' + $('#pTab1SelectBranchHeltes option:selected').text() + '-Н ' + $('#pTab1SelectStaff option:selected').text() + '-Н ');
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


</script>
