<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RprtInventoryListStaff.aspx.cs" Inherits="HRWebApp.rprt.RprtInventoryListStaff" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa fa-home fa-fw"></i> > Тайлан <span>> Эд хөрөнгө > Ажилтны хөрөнгийн жагсаалт</span>
        </h1>
    </div>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        Ажилтны хөрөнгийн жагсаалт
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="background-color: #fff;">
                <div id="pTab1" class="tab-pane active" style="padding:10px 0;">
                    <div class="row no-margin">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="well">
                                <form>
                                    <fieldset>
                                        <legend>Тайлангийн шүүлт</legend>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab1Branch" name="selectFilterTab1Branch" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Ажилтан</label>
									        <select id="selectFilterTab1Staff" name="selectFilterTab1Staff" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                    </fieldset>
                                    <button id="btnShowTab1" type="button" class="btn btn-primary btn-block">ТАЙЛАН ХАРАХ</button>
                                    <button id="btnRefreshTab1" type="button" class="btn btn-default btn-xs btn-block margin-bottom-10">ШИНЭЧЛЭХ</button>
                                    <div id="divAlertTab1Content"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding margin-bottom-10">
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab1')" style="margin-left:5px;">
                                        <i class="fa fa-print"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab1', 'АжилтныХөрөнгийнЖагсаалт')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right btn-export-excel" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="ExportExcel('#divpTab1')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding">
                                    <div id="loaderTab1" class="search-background-report">
                                        <label>
                                            <img width="64" height="" src="img/loading.gif"/>
                                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                        </label>
                                    </div> 
                                    <div id="divpTab1" runat="server" class="reports" style="width: 100%;">
                                        <div style="border-bottom:1px solid #000; padding-bottom: 3px; margin-bottom: 10px;">
                                            <img src="../img/cover-logo-mof.png" style="height:40px;"/>
                                            <span id="spanReportHeaderDate" runat="server" style="float:right; padding-top: 23px; font-style:italic;"></span>
                                        </div>
                                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                            АЖИЛТНЫ ХӨРӨНГИЙН ЖАГСААЛТ <span id="spanTitleBranchStaff"></span>
                                        </div>
                                        <div id="divpTab1Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоо/ш</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт үнэ</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 5px 0;"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<script src="../js/plugin/htmltoword/FileSaver.js"></script> 
<script src="../js/plugin/htmltoword/jquery.wordexport.js"></script>
<script type="text/javascript">
    var globalAjaxVar = null;
    var varFilterTab1Branch = $("#selectFilterTab1Branch option:selected").val();
    var varFilterTab1Staff = $("#selectFilterTab1Staff option:selected").val();
    var pagefunction = function () {
        dataBindTab1Datatable();
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    $(document).ready(function () {
        pageSetUp();
        pagefunction();
    });
    $("#btnShowTab1").click(function (e) {
        dataBindTab1Datatable();
    });
    $("#btnRefreshTab1").click(function (e) {
        $("#selectFilterTab1Branch").val(varFilterTab1Branch);
        $("#selectFilterTab1Staff").val(varFilterTab1Staff);
    });
    $("#selectFilterTab1Branch").change(function (e) {
        var valData = '';
        var jsonData = {};
        var valStaffData = '';
        jsonData.branch = [$("#selectFilterTab1Branch option:selected").val()];
        jsonData.set1stIndexValue = 'Сонго...';
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/ListStaffsWithPos",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            if(value.STAFFS_ID == '') valStaffData += '<option value="' + value.STAFFS_ID + '" selected="selected">' + value.ST_NAME + '</option>';
                            else valStaffData += '<option value="' + value.STAFFS_ID + '">' + value.ST_NAME + '</option>';
                        });
                    }
                }
                else {
                    if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                    else {
                        alert(resData.d.RetDesc);
                    }
                }
                $("#selectFilterTab1Staff").html(valStaffData);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    function dataBindTab1Datatable() {
        var valData = '';
        $('#spanTitleBranchStaff').html('');
        if ($("#selectFilterTab1Branch option:selected").val() != '' && $('#selectFilterTab1Staff option:selected').val() != '') {
            showLoader('loaderTab1');
            $('#spanTitleBranchStaff').html($("#selectFilterTab1Branch option:selected").text() + '-Н ' + $('#selectFilterTab1Staff option:selected').text());
            var jsonData = {};
            jsonData.staffid = $("#selectFilterTab1Staff option:selected").val();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/RprtInventoryListStaff",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                    valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                    valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>';
                    valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>';
                    valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>';
                    valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоо/ш</th>';
                    valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт үнэ</th>';
                    valData += '</tr>';
                    if (resData.d.RetType == "0") {
                        if (resData.d.RetData.length != 0) {
                            $(resData.d.RetData).each(function (index, value) {
                                valData += "<tr>";
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + (index+1) + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.INV_CODE + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.INV_NAME + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + (parseFloat(value.PRICE).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.END_QUANT + ' ' + value.INV_UNIT + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + (parseFloat(value.END_TOTAL).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>';
                                valData += "</tr>";
                            });
                        }
                        else {
                            valData += "<tr>";
                            valData += '<td colspan="6" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                            valData += "</tr>";
                        }
                    }
                    else {
                        if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                        else {
                            valData += "<tr>";
                            valData += '<td colspan="8" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                            valData += "</tr>";
                            alert(resData.d.RetDesc);
                        }
                    }
                    $("#contentTab1Datatable").html(valData);
                    hideLoader('loaderTab1');
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                    hideLoader('loaderTab1');
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
            $('#divAlertTab1Content').html('');
        }
        else {
            valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоо/ш</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт үнэ</th>';
            valData += '</tr>';
            valData += "<tr>";
            valData += '<td colspan="6" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
            valData += "</tr>";
            $("#contentTab1Datatable").html(valData);
            $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Дотоод нэгж", "Ажилтан" заавал сонгоно уу!</div>');
        }
    }
</script>
