<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RprtMonitorFillData.aspx.cs" Inherits="HRWebApp.rprt.RprtMonitorFillData" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa fa-home fa-fw"></i> > Тайлан <span>> Хяналт, шинжилгээ > Мэдээллийн бүрдүүлэлт</span>
        </h1>
    </div>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        Ажилтаны мэдээллийн бүрдүүлэлт
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
									        <select id="selectFilterTab1Branch" name="selectFilterTab1Branch" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                        <div class="form-group">
									        <label>Мэдээлэл оруулсан төлөв</label>
									        <select id="selectFilterTab1DataType" name="selectFilterTab1DataType" runat="server" multiple style="width:100%" class="select2">
                                                <option value="" selected="selected">Бүгд</option>
                                                <option value="1">Бүх мэдээлэл бүрэн орсон</option>
                                                <option value="2">Бүх мэдээлэл дутуу орсон</option>
                                                <option value="101">Хувь хүний мэдээлэл бүрэн орсон</option>
                                                <option value="201">Хувь хүний мэдээлэл дутуу орсон</option>
                                                <option value="102">Гэр бүлийн мэдээлэл бүрэн орсон</option>
                                                <option value="202">Гэр бүлийн мэдээлэл дутуу орсон</option>
                                                <option value="103">Боловсролын мэдээлэл бүрэн орсон</option>
                                                <option value="203">Боловсролын мэдээлэл дутуу орсон</option>
                                                <option value="104">Мэргэшил сургалтын мэдээлэл бүрэн орсон</option>
                                                <option value="204">Мэргэшил сургалтын мэдээлэл дутуу орсон</option>
                                                <option value="105">Зэрэг дэв, цолын мэдээлэл бүрэн орсон</option>
                                                <option value="205">Зэрэг дэв, цолын мэдээлэл дутуу орсон</option>
                                                <option value="106">Ур чадварын мэдээлэл бүрэн орсон</option>
                                                <option value="206">Ур чадварын мэдээлэл дутуу орсон</option>
                                                <option value="107">Гадаад хэлний мэдээлэл бүрэн орсон</option>
                                                <option value="207">Гадаад хэлний мэдээлэл дутуу орсон</option>
                                                <option value="108">Туршлагын мэдээлэл бүрэн орсон</option>
                                                <option value="208">Туршлагын мэдээлэл дутуу орсон</option>
                                                <option value="109">Бусад мэдээлэл бүрэн орсон</option>
                                                <option value="209">Бусад мэдээлэл дутуу орсон</option>
									        </select>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab1', 'ХүнийНөөцийнМэдээлэлБүрдүүлэлт')">
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
                                            ХҮНИЙ НӨӨЦӨӨН МЭДЭЭЛЭЛ БҮРДҮҮЛЭЛТ
                                        </div>
                                        <div id="divpTab1Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>
                                                        <th colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэдээлэл оруулсан байдал</th>
                                                    </tr>
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хувь хүн</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Гэр бүл</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Боловсрол</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэшил сургалт</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Зэрэг дэв, цол</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ур чадвар</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Гадаад хэл</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Туршлага</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Бусад</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
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
    var varFilterTab1Branch = $("#selectFilterTab1Branch").select2('data');
    var varFilterTab1DataType = $("#selectFilterTab1DataType").select2('data');
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
    $("#selectFilterTab1Branch").change(function (e) {
        var arrSelected = $(this).select2('data');
        lastEl = arrSelected[arrSelected.length - 1].id;
        if (lastEl == "") {
            arrSelected = jQuery.grep(arrSelected, function(value) {
                return value.id == "";
            });
        }
        else {
            arrSelected = jQuery.grep(arrSelected, function(value) {
                return value.id != "";
            });
        }
        $(this).select2('data', arrSelected);
    });
    $("#selectFilterTab1DataType").change(function (e) {
        var arrSelected = $(this).select2('data');
        lastEl = arrSelected[arrSelected.length - 1].id;
        if (lastEl == "") {
            arrSelected = jQuery.grep(arrSelected, function(value) {
                return value.id == "";
            });
        }
        else if (lastEl == "1") {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                if (value.id.toString().substring(0, 2) == "10" || value.id.toString().substring(0, 2) == "") return false;
                else return true;
            });
        }
        else if (lastEl == "2") {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                if (value.id.toString().substring(0, 2) == "20" || value.id.toString().substring(0, 2) == "") return false;
                else return true;
            });
        }
        else if (lastEl.toString().substring(0, 2) == "10") {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                if (value.id == "1" || value.id == "") return false;
                else return true;
            });
        }
        else if (lastEl.toString().substring(0, 2) == "20") {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                if (value.id == "2" || value.id == "") return false;
                else return true;
            });
        }
        else {
            arrSelected = jQuery.grep(arrSelected, function(value) {
                return value.id != "";
            });
        }
        $(this).select2('data', arrSelected);
    });
    $("#btnShowTab1").click(function (e) {
        if ($('#selectFilterTab1Branch').select2('data').length > 0 && $('#selectFilterTab1DataType').select2('data').length > 0) {
            dataBindTab1Datatable();
        }
        else {
            $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Дотоод нэгж", "Мэдээлэл оруулсан төлөв" заавал сонгоно уу!</div>');
        }
    });
    $("#btnRefreshTab1").click(function (e) {
        $("#selectFilterTab1Branch").select2('data', varFilterTab1Branch);
        $("#selectFilterTab1DataType").select2('data', varFilterTab1DataType);
    });

    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        var valData = '';
        var jsonData = {};
        jsonData.branch = $("#selectFilterTab1Branch").val();
        jsonData.type = $("#selectFilterTab1DataType").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtMonitorFillDataTab1Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>';
                valData += '<th colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэдээлэл оруулсан байдал</th>';
                valData += '</tr>';
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хувь хүн</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Гэр бүл</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Боловсрол</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэшил сургалт</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Зэрэг дэв, цол</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ур чадвар</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Гадаад хэл</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Туршлага</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Бусад</th>';
                valData += '</tr>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        var strBranchId = "";
                        var strBGColor = "";
                        $(resData.d.RetData).each(function (index, value) {
                            if (value.BRANCH_ID.toString() != strBranchId.toString()) {
                            valData += "<tr>";
                            valData += '<td colspan="15" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.BRANCH_NAME + '</td>';
                            valData += "</tr>";
                            }
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.ROWNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.POS_NAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.LNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.FNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.REGNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.GENDER + '</td>';
                            if (parseInt(value.T1_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T1_AVGPER + '%</td>';
                            if (parseInt(value.T2_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T2_AVGPER + '%</td>';
                            if (parseInt(value.T3_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T3_AVGPER + '%</td>';
                            if (parseInt(value.T4_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T4_AVGPER + '%</td>';
                            if (parseInt(value.T5_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T5_AVGPER + '%</td>';
                            if (parseInt(value.T6_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T6_AVGPER + '%</td>';
                            if (parseInt(value.T7_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T7_AVGPER + '%</td>';
                            if (parseInt(value.T8_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T8_AVGPER + '%</td>';
                            if (parseInt(value.T9_AVGPER) == 0) strBGColor = ' background-color: #f9f2f4; color: #c7254e;';
                            else strBGColor = "";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;' + strBGColor + '">' + value.T9_AVGPER + '%</td>';
                            valData += "</tr>";

                            strBranchId = value.BRANCH_ID.toString();
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="15" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="15" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                    valData += "</tr>";
                    alert(resData.d.RetDesc);
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
</script>
