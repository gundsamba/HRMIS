<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RprtStaffEducation.aspx.cs" Inherits="HRWebApp.rprt.RprtStaffEducation" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa fa-home fa-fw"></i> > Тайлан <span>> Ажилтан > Мэргэшил боловсрол</span>
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        Боловсролын түвшингээр
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
									        <label>Боловсрол</label>
									        <select id="selectFilterTab1EduType" name="selectFilterTab1EduType" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                        <div class="form-group">
									        <label>Мэргэжлийн ангилал</label>
									        <select id="selectFilterTab1OccType" name="selectFilterTab1OccType" runat="server" multiple style="width:100%" class="select2"></select>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab1', 'БоловсролынТүвшингээр')">
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
                                            БОЛОВСРОЛЫН ТҮВШИНГЭЭР
                                        </div>
                                        <div id="divpTab1Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Боловсрол</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэжлийн ангилал</th>
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэжлийн нэр</th>
                                                        <th colspan="5" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төгссөн сургууль</th>
                                                    </tr>
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Сургууль</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Боловсролын зэрэг</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэжлийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Элссэн он</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төгссөн он</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="margin-top: 25px;">
                                            <table style="border-collapse:collapse; width: 75%; font-size:8pt; float:right;">
                                                <tbody id="contentTab1Datatable2">
                                                    <tr>
                                                        <td></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Ажилтаны тоо</td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Идэвхтэй</td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Түр чөлөөлсөн</td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Дикрет авсан</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Нийт ажилтан:</td>
                                                        <td id="contentTab1Datatable2TdCntStaff" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffActive" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffChuluu" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffDekrit" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эрэгтэй ажилтан:</td>
                                                        <td id="contentTab1Datatable2TdCntStaffMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffActiveMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffChuluuMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffDekritMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эмэгтэй ажилтан:</td>
                                                        <td id="contentTab1Datatable2TdCntStaffFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffActiveFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffChuluuFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdCntStaffDekritFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
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
    var varFilterTab1EduType = $("#selectFilterTab1EduType").select2('data');
    var varFilterTab1OccType = $("#selectFilterTab1OccType").select2('data');
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
    $("#selectFilterTab1Branch, #selectFilterTab1EduType, #selectFilterTab1OccType").change(function (e) {
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
    $("#btnShowTab1").click(function (e) {
        if ($('#selectFilterTab1Branch').select2('data').length > 0 && $('#selectFilterTab1EduType').select2('data').length > 0 && $('#selectFilterTab1OccType').select2('data').length > 0) {
            dataBindTab1Datatable();
        }
        else {
            $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Дотоод нэгж", "Боловсрол", "Мэргэжлийн ангилал" заавал сонгоно уу!</div>');
        }
    });
    $("#btnRefreshTab1").click(function (e) {
        $("#selectFilterTab1Branch").select2('data', varFilterTab1Branch);
        $("#selectFilterTab1EduType").select2('data', varFilterTab1EduType);
        $("#selectFilterTab1OccType").select2('data', varFilterTab1OccType);
    });

    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        var valData = '';
        var jsonData = {};
        jsonData.branch = $("#selectFilterTab1Branch").val();
        jsonData.edutype = $("#selectFilterTab1EduType").val();
        jsonData.occtype = $("#selectFilterTab1OccType").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtStaffEducationTab1Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Боловсрол</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэжлийн ангилал</th>';
                valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэжлийн нэр</th>';
                valData += '<th colspan="5" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төгссөн сургууль</th>';
                valData += '</tr>';
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Сургууль</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Боловсролын зэрэг</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Мэргэжлийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Элссэн он</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төгссөн он</th>';
                valData += '</tr>';
                var iCntRw = 1;
                var valLastStaffId = 0;
                var arrEduTpList = {
                    male: {},
                    female: {},
                    all: {},
                    name: {}
                };
                $("#selectFilterTab1EduType").find('option').each(function (index) {
                    if ($(this).attr('value') != '') {
                        arrEduTpList.male[$(this).attr('value')] = 0;
                        arrEduTpList.female[$(this).attr('value')] = 0;
                        arrEduTpList.all[$(this).attr('value')] = 0;
                        arrEduTpList.name[$(this).attr('value')] = $(this).text();
                    }
                });
                console.log(arrEduTpList);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            if (parseInt(valLastStaffId) != parseInt(value.ID)) {
                                valData += "<tr>";
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + iCntRw + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.BRANCH_INITNAME + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.POS_NAME + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.LNAME + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.FNAME + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.GENDER + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.EDUTP_NAME + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.OCCTYPE_NAME + '</td>';
                                valData += '<td rowspan="'+value.CNT+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.OCCNAME + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.SCHL_INSTITUTENAME + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.SCHL_EDUTP_NAME + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.SCHL_PROFESSIONDESC + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.SCHL_FROMYR + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.SCHL_TOYR + '</td>';
                                valData += "</tr>";
                                if (value.EDUTP_ID != '') {
                                    if (value.GENDER == 'Эрэгтэй') {
                                        arrEduTpList.male[value.EDUTP_ID] = parseInt(arrEduTpList.male[value.EDUTP_ID]) + 1;
                                    }
                                    else if (value.GENDER == 'Эмэгтэй') {
                                        arrEduTpList.female[value.EDUTP_ID] = parseInt(arrEduTpList.female[value.EDUTP_ID]) + 1;
                                    }
                                    arrEduTpList.all[value.EDUTP_ID] = parseInt(arrEduTpList.all[value.EDUTP_ID]) + 1;
                                }
                                iCntRw++;
                            }
                            else {
                                valData += "<tr>";
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.SCHL_INSTITUTENAME + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.SCHL_EDUTP_NAME + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.SCHL_PROFESSIONDESC + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.SCHL_FROMYR + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.SCHL_TOYR + '</td>';
                                valData += "</tr>";
                            }
                            valLastStaffId = value.ID;
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="14" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="14" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                    valData += "</tr>";
                    alert(resData.d.RetDesc);
                }
                $("#contentTab1Datatable").html(valData);
                var valData2 = '';
                valData2 += '<tr>';
                valData2 += '<td></td>';
                valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Ажилтаны тоо</td>';
                $.each(arrEduTpList.name, function (index, value) {
                    valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">'+value+'</td>';
                });
                valData2 += '</tr>';
                valData2 += '<tr>';
                valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Нийт ажилтан:</td>';
                var iSumCnt = 0;
                $.each(arrEduTpList.all, function (index, value) {
                    iSumCnt += parseInt(value);
                });
                valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">'+iSumCnt+'</td>';
                $.each(arrEduTpList.all, function (index, value) {
                    valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">'+value+'</td>';
                });
                valData2 + '</tr>';
                valData2 += '<tr>';
                valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эрэгтэй ажилтан:</td>';
                iSumCnt = 0;
                $.each(arrEduTpList.male, function (index, value) {
                    iSumCnt += parseInt(value);
                });
                valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">'+iSumCnt+'</td>';
                $.each(arrEduTpList.male, function (index, value) {
                    valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">'+value+'</td>';
                });
                valData2 + '</tr>';
                valData2 += '<tr>';
                valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эмэгтэй ажилтан:</td>';
                iSumCnt = 0;
                $.each(arrEduTpList.female, function (index, value) {
                    iSumCnt += parseInt(value);
                });
                valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">'+iSumCnt+'</td>';
                $.each(arrEduTpList.female, function (index, value) {
                    valData2 += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">'+value+'</td>';
                });
                valData2 + '</tr>';
                $("#contentTab1Datatable2").html(valData2);
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