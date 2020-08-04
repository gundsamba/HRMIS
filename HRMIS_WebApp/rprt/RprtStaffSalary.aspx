<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RprtStaffSalary.aspx.cs" Inherits="HRWebApp.rprt.RprtStaffSalary" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa fa-home fa-fw"></i> > Тайлан <span>> ажилтны цалин</span>
        </h1>
    </div>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        Ажилтны цалингийн карт
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
									        <label>Он</label>
									         <select id="selectFilterTab1Year" name="selectFilterTab1Year" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab1Branch" name="selectFilterTab1Branch" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Албан хаагч</label>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab1', 'АжилтныЦагийнЧөлөө')">
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
                                        <div style="text-align: center; font-weight: bold; font-size: 13px; padding-bottom: 5px; text-transform: uppercase; line-height: 1;">
                                            Ажилтны цалингийн карт
                                        </div>
                                        <div id="divStaffTitle" style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; line-height: 1;"></div>
                                        <div id="divpTab1Datatable">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable"></tbody>
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
    <script src="../js/plugin/htmltoword/FileSaver.js"></script> 
    <script src="../js/plugin/htmltoword/jquery.wordexport.js"></script>
    <script type="text/javascript">
        var globalAjaxVar = null;
        var varFilterTab1Year = $("#selectFilterTab1Year option:selected").val();
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
            if ($("#selectFilterTab1Year option:selected").val() != '' && $("#selectFilterTab1Branch option:selected").val() != '' && $("#selectFilterTab1Staff option:selected").val() != '') {
                dataBindTab1Datatable();
            }
            else {
                $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Он", "Дотоод нэгж", "Ажилтан" заавал сонгоно уу!</div>');
            }
        });
        $("#btnRefreshTab1").click(function (e) {
            $("#selectFilterTab1Year").val(varFilterTab1Year);
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
                url: "../webservice/ServiceMain.svc/GetStaffListWithBranchPos",
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
            showLoader('loaderTab1');
            $('#divStaffTitle').html($('#selectFilterTab1Branch option:selected').text() + ' - '+$('#selectFilterTab1Staff option:selected').text());
            var valData = '';
            var arrSalNemegdel = new Array("TOTAL_A1", "TOTAL_A2", "TOTAL_A3", "TOTAL_A4", "TOTAL_A5", "TOTAL_A6", "TOTAL_A7", "TOTAL_A8", "TOTAL_A9", "TOTAL_A10", "TOTAL_A11", "TOTAL_A12", "TOTAL_A13", "TOTAL_A14", "TOTAL_A15", "TOTAL_A16", "TOTAL_A17", "TOTAL_A18", "TOTAL_A19", "TOTAL_A20", "TOTAL_A21", "TOTAL_A22", "TOTAL_A23", "TOTAL_A24", "TOTAL_A25", "TOTAL_A26", "TOTAL_A27", "TOTAL_A28", "TOTAL_A29", "TOTAL_A30", "TOTAL_A31", "TOTAL_A32", "TOTAL_A33", "TOTAL_A34", "TOTAL_A35");
            var arrSalSuutgal = new Array("TOTAL_L1", "TOTAL_L2", "TOTAL_L3", "TOTAL_L4", "TOTAL_L5", "TOTAL_L6", "TOTAL_L7", "TOTAL_L8", "TOTAL_L9", "TOTAL_L10", "TOTAL_L11", "TOTAL_L12", "TOTAL_L13", "TOTAL_L14", "TOTAL_L15", "TOTAL_L16", "TOTAL_L17", "TOTAL_L18", "TOTAL_L19", "TOTAL_L20", "TOTAL_L21", "TOTAL_L22", "TOTAL_L23", "TOTAL_L24", "TOTAL_L25", "TOTAL_L26", "TOTAL_L27", "TOTAL_L28", "TOTAL_L29", "TOTAL_L30", "TOTAL_L31", "TOTAL_L32", "TOTAL_L33", "TOTAL_L34", "TOTAL_L35");
            var arrSalNemegdelName = new Array("Хоол", "Тээврийн хөлс", "Тогтмол нэмэгдэл", "Хүнд хортой", "Хавсран ажилласан", "Нэг өдрийн цалин", "Удаан жил", "Урамшуулал", "Цалингийн зөрүү", "Илүү цаг", "ТХоол", "Баярын илүү цаг", "Шөнийн илүү цаг", "Тасаг нэгжийн нэмэгдэл", "Ашгийн зөрүү", "Цолны нэмэгдэл", "Шагналт нэмэгдэл", "Профессорын нэмэгдэл", "Ур чадварын нэмэгдэл", "Зэргийн нэмэгдэл", "Ахлахын нэмэгдэл", "Зөвлөхийн нэмэгдэл", "ТАХ нэмэгдэл", "нэмэгдэл", "ХАОАТ-н зөрүү", "Тусгай албаны нэмэгдэл", "Онцгойн албаны нэмэгдэл", "Эх барихын нэмэгдэл", "Эд хариуцагчийн нэмэгдэл", "Балансын шагнал", "Клиникин эрхлэгчийн нэмэгдэл", "Анги даалт", "Дэвтэр засалт", "Үр дүнгийн шагнал", "Утасны нэмэгдэл");
            var arrSalSuutgalName = new Array("НДШ", "Ашиг", "Шүүхийн шийдвэрлийн гүйцэтгэл", "ҮЭ-н татвар", "Цалингийн зөрүү", "Хадгаламж", "Гэнэтийн осол", "Урьдчилгаа", "Хоолны талон", "Тушаалаар хасагдсан", "Шийтгэл", "Нэг өдрийн цалин", "Даатгалын хураамж", "Орон сууц", "Түлээ", "TOTAL_L16", "TOTAL_L17", "TOTAL_L18", "TOTAL_L19", "TOTAL_L20", "TOTAL_L21", "TOTAL_L22", "TOTAL_L23", "TOTAL_L24", "TOTAL_L25", "TOTAL_L26", "TOTAL_L27", "TOTAL_L28", "TOTAL_L29", "TOTAL_L30", "TOTAL_L31", "TOTAL_L32", "TOTAL_L33", "TOTAL_L34", "TOTAL_L35");
            var arrSalNemegdelSum = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            var arrSalSuutgalSum = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            var jsonData = {};
            jsonData.pYear = $("#selectFilterTab1Year option:selected").val();
            jsonData.pStaffId = $("#selectFilterTab1Staff option:selected").val();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/RprtStaffSalaryData",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    if (resData.d.RetType == "0") {
                        if (resData.d.RetData.length > 0) {
                            console.log(resData.d.RetData);
                            $(resData.d.RetData).each(function (index, value) {
                                //nemegdel
                                if (parseFloat(value.TOTAL_A1) > 0) arrSalNemegdelSum[0] += parseFloat(value.TOTAL_A1);
                                if (parseFloat(value.TOTAL_A2) > 0) arrSalNemegdelSum[1] += parseFloat(value.TOTAL_A2);
                                if (parseFloat(value.TOTAL_A3) > 0) arrSalNemegdelSum[2] += parseFloat(value.TOTAL_A3);
                                if (parseFloat(value.TOTAL_A4) > 0) arrSalNemegdelSum[3] += parseFloat(value.TOTAL_A4);
                                if (parseFloat(value.TOTAL_A5) > 0) arrSalNemegdelSum[4] += parseFloat(value.TOTAL_A5);
                                if (parseFloat(value.TOTAL_A6) > 0) arrSalNemegdelSum[5] += parseFloat(value.TOTAL_A6);
                                if (parseFloat(value.TOTAL_A7) > 0) arrSalNemegdelSum[6] += parseFloat(value.TOTAL_A7);
                                if (parseFloat(value.TOTAL_A8) > 0) arrSalNemegdelSum[7] += parseFloat(value.TOTAL_A8);
                                if (parseFloat(value.TOTAL_A9) > 0) arrSalNemegdelSum[8] += parseFloat(value.TOTAL_A9);
                                if (parseFloat(value.TOTAL_A10) > 0) arrSalNemegdelSum[9] += parseFloat(value.TOTAL_A10);
                                if (parseFloat(value.TOTAL_A11) > 0) arrSalNemegdelSum[10] += parseFloat(value.TOTAL_A11);
                                if (parseFloat(value.TOTAL_A12) > 0) arrSalNemegdelSum[11] += parseFloat(value.TOTAL_A12);
                                if (parseFloat(value.TOTAL_A13) > 0) arrSalNemegdelSum[12] += parseFloat(value.TOTAL_A13);
                                if (parseFloat(value.TOTAL_A14) > 0) arrSalNemegdelSum[13] += parseFloat(value.TOTAL_A14);
                                if (parseFloat(value.TOTAL_A15) > 0) arrSalNemegdelSum[14] += parseFloat(value.TOTAL_A15);
                                if (parseFloat(value.TOTAL_A16) > 0) arrSalNemegdelSum[15] += parseFloat(value.TOTAL_A16);
                                if (parseFloat(value.TOTAL_A17) > 0) arrSalNemegdelSum[16] += parseFloat(value.TOTAL_A17);
                                if (parseFloat(value.TOTAL_A18) > 0) arrSalNemegdelSum[17] += parseFloat(value.TOTAL_A18);
                                if (parseFloat(value.TOTAL_A19) > 0) arrSalNemegdelSum[18] += parseFloat(value.TOTAL_A19);
                                if (parseFloat(value.TOTAL_A20) > 0) arrSalNemegdelSum[19] += parseFloat(value.TOTAL_A20);
                                if (parseFloat(value.TOTAL_A21) > 0) arrSalNemegdelSum[20] += parseFloat(value.TOTAL_A21);
                                if (parseFloat(value.TOTAL_A22) > 0) arrSalNemegdelSum[21] += parseFloat(value.TOTAL_A22);
                                if (parseFloat(value.TOTAL_A23) > 0) arrSalNemegdelSum[22] += parseFloat(value.TOTAL_A23);
                                if (parseFloat(value.TOTAL_A24) > 0) arrSalNemegdelSum[23] += parseFloat(value.TOTAL_A24);
                                if (parseFloat(value.TOTAL_A25) > 0) arrSalNemegdelSum[24] += parseFloat(value.TOTAL_A25);
                                if (parseFloat(value.TOTAL_A26) > 0) arrSalNemegdelSum[25] += parseFloat(value.TOTAL_A26);
                                if (parseFloat(value.TOTAL_A27) > 0) arrSalNemegdelSum[26] += parseFloat(value.TOTAL_A27);
                                if (parseFloat(value.TOTAL_A28) > 0) arrSalNemegdelSum[27] += parseFloat(value.TOTAL_A28);
                                if (parseFloat(value.TOTAL_A29) > 0) arrSalNemegdelSum[28] += parseFloat(value.TOTAL_A29);
                                if (parseFloat(value.TOTAL_A30) > 0) arrSalNemegdelSum[29] += parseFloat(value.TOTAL_A30);
                                if (parseFloat(value.TOTAL_A31) > 0) arrSalNemegdelSum[30] += parseFloat(value.TOTAL_A31);
                                if (parseFloat(value.TOTAL_A32) > 0) arrSalNemegdelSum[31] += parseFloat(value.TOTAL_A32);
                                if (parseFloat(value.TOTAL_A33) > 0) arrSalNemegdelSum[32] += parseFloat(value.TOTAL_A33);
                                if (parseFloat(value.TOTAL_A34) > 0) arrSalNemegdelSum[33] += parseFloat(value.TOTAL_A34);
                                if (parseFloat(value.TOTAL_A35) > 0) arrSalNemegdelSum[34] += parseFloat(value.TOTAL_A35);
                                //suutgal
                                if (parseFloat(value.TOTAL_L1) > 0) arrSalSuutgalSum[0] += parseFloat(value.TOTAL_L1);
                                if (parseFloat(value.TOTAL_L2) > 0) arrSalSuutgalSum[1] += parseFloat(value.TOTAL_L2);
                                if (parseFloat(value.TOTAL_L3) > 0) arrSalSuutgalSum[2] += parseFloat(value.TOTAL_L3);
                                if (parseFloat(value.TOTAL_L4) > 0) arrSalSuutgalSum[3] += parseFloat(value.TOTAL_L4);
                                if (parseFloat(value.TOTAL_L5) > 0) arrSalSuutgalSum[4] += parseFloat(value.TOTAL_L5);
                                if (parseFloat(value.TOTAL_L6) > 0) arrSalSuutgalSum[5] += parseFloat(value.TOTAL_L6);
                                if (parseFloat(value.TOTAL_L7) > 0) arrSalSuutgalSum[6] += parseFloat(value.TOTAL_L7);
                                if (parseFloat(value.TOTAL_L8) > 0) arrSalSuutgalSum[7] += parseFloat(value.TOTAL_L8);
                                if (parseFloat(value.TOTAL_L9) > 0) arrSalSuutgalSum[8] += parseFloat(value.TOTAL_L9);
                                if (parseFloat(value.TOTAL_L10) > 0) arrSalSuutgalSum[9] += parseFloat(value.TOTAL_L10);
                                if (parseFloat(value.TOTAL_L11) > 0) arrSalSuutgalSum[10] += parseFloat(value.TOTAL_L11);
                                if (parseFloat(value.TOTAL_L12) > 0) arrSalSuutgalSum[11] += parseFloat(value.TOTAL_L12);
                                if (parseFloat(value.TOTAL_L13) > 0) arrSalSuutgalSum[12] += parseFloat(value.TOTAL_L13);
                                if (parseFloat(value.TOTAL_L14) > 0) arrSalSuutgalSum[13] += parseFloat(value.TOTAL_L14);
                                if (parseFloat(value.TOTAL_L15) > 0) arrSalSuutgalSum[14] += parseFloat(value.TOTAL_L15);
                                if (parseFloat(value.TOTAL_L16) > 0) arrSalSuutgalSum[15] += parseFloat(value.TOTAL_L16);
                                if (parseFloat(value.TOTAL_L17) > 0) arrSalSuutgalSum[16] += parseFloat(value.TOTAL_L17);
                                if (parseFloat(value.TOTAL_L18) > 0) arrSalSuutgalSum[17] += parseFloat(value.TOTAL_L18);
                                if (parseFloat(value.TOTAL_L19) > 0) arrSalSuutgalSum[18] += parseFloat(value.TOTAL_L19);
                                if (parseFloat(value.TOTAL_L20) > 0) arrSalSuutgalSum[19] += parseFloat(value.TOTAL_L20);
                                if (parseFloat(value.TOTAL_L21) > 0) arrSalSuutgalSum[20] += parseFloat(value.TOTAL_L21);
                                if (parseFloat(value.TOTAL_L22) > 0) arrSalSuutgalSum[21] += parseFloat(value.TOTAL_L22);
                                if (parseFloat(value.TOTAL_L23) > 0) arrSalSuutgalSum[22] += parseFloat(value.TOTAL_L23);
                                if (parseFloat(value.TOTAL_L24) > 0) arrSalSuutgalSum[23] += parseFloat(value.TOTAL_L24);
                                if (parseFloat(value.TOTAL_L25) > 0) arrSalSuutgalSum[24] += parseFloat(value.TOTAL_L25);
                                if (parseFloat(value.TOTAL_L26) > 0) arrSalSuutgalSum[25] += parseFloat(value.TOTAL_L26);
                                if (parseFloat(value.TOTAL_L27) > 0) arrSalSuutgalSum[26] += parseFloat(value.TOTAL_L27);
                                if (parseFloat(value.TOTAL_L28) > 0) arrSalSuutgalSum[27] += parseFloat(value.TOTAL_L28);
                                if (parseFloat(value.TOTAL_L29) > 0) arrSalSuutgalSum[28] += parseFloat(value.TOTAL_L29);
                                if (parseFloat(value.TOTAL_L30) > 0) arrSalSuutgalSum[29] += parseFloat(value.TOTAL_L30);
                                if (parseFloat(value.TOTAL_L31) > 0) arrSalSuutgalSum[30] += parseFloat(value.TOTAL_L31);
                                if (parseFloat(value.TOTAL_L32) > 0) arrSalSuutgalSum[31] += parseFloat(value.TOTAL_L32);
                                if (parseFloat(value.TOTAL_L33) > 0) arrSalSuutgalSum[32] += parseFloat(value.TOTAL_L33);
                                if (parseFloat(value.TOTAL_L34) > 0) arrSalSuutgalSum[33] += parseFloat(value.TOTAL_L34);
                                if (parseFloat(value.TOTAL_L35) > 0) arrSalSuutgalSum[34] += parseFloat(value.TOTAL_L35);
                            });
                            var iNemegdelCnt = 0, iSuutgalCnt = 0;
                            for (var i = 0; i < arrSalNemegdel.length; i++) {
                                if (arrSalNemegdelSum[i] > 0) iNemegdelCnt++;
                                if (arrSalSuutgalSum[i] > 0) iSuutgalCnt++;
                            }
                            iNemegdelCnt++;
                            iSuutgalCnt++;
                            valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                            valData += '<th colspan="3" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ерөнхий мэдээлэл</th>';
                            valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Бодогдсон цалин</th>';
                            valData += '<th colspan="' + iNemegdelCnt.toString() + '" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Бодогдсон цалин болон нэмэгдлүүд</th>';
                            valData += '<th colspan="' + iSuutgalCnt.toString() + '" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Суутгал болон суутгалын дүн</th>';
                            valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Урьдчилгаа</th>';
                            valData += '<th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Гарт олгох</th>';
                            valData += '<th rowspan="2"  style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт олгох</th>';
                            valData += '</tr>';
                            valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Сар</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хоног</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Үндсэн цалин</th>';
                            for (var i = 0; i < arrSalNemegdelSum.length; i++) if (arrSalNemegdelSum[i] > 0) valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">' + arrSalNemegdelName[i] + '</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Бүгд дүн</th>';
                            for (var i = 0; i < arrSalSuutgalSum.length; i++) if (arrSalSuutgalSum[i] > 0) valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">' + arrSalSuutgalName[i] + '</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Суутгалын дүн</th>';
                            valData += '</tr>';
                            var valTemp = 0;
                            $(resData.d.RetData).each(function (index, value) {
                                valData += '<tr>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">'+value.MONTH_VALUE+'</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.WORK_DAY + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + parseFloat(value.TSALIN).format(3) + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + parseFloat(value.BUILD_TSALIN).format(3) + '</td>';
                                for (var i = 0; i < arrSalNemegdelSum.length; i++) {
                                    if (arrSalNemegdelSum[i] > 0) {
                                        if (i == 0) valTemp = parseFloat(value.TOTAL_A1).format(3);
                                        if (i == 1) valTemp = parseFloat(value.TOTAL_A2).format(3);
                                        if (i == 2) valTemp = parseFloat(value.TOTAL_A3).format(3);
                                        if (i == 3) valTemp = parseFloat(value.TOTAL_A4).format(3);
                                        if (i == 4) valTemp = parseFloat(value.TOTAL_A5).format(3);
                                        if (i == 5) valTemp = parseFloat(value.TOTAL_A6).format(3);
                                        if (i == 6) valTemp = parseFloat(value.TOTAL_A7).format(3);
                                        if (i == 7) valTemp = parseFloat(value.TOTAL_A8).format(3);
                                        if (i == 8) valTemp = parseFloat(value.TOTAL_A9).format(3);
                                        if (i == 9) valTemp = parseFloat(value.TOTAL_A10).format(3);
                                        if (i == 10) valTemp = parseFloat(value.TOTAL_A11).format(3);
                                        if (i == 11) valTemp = parseFloat(value.TOTAL_A12).format(3);
                                        if (i == 12) valTemp = parseFloat(value.TOTAL_A13).format(3);
                                        if (i == 13) valTemp = parseFloat(value.TOTAL_A14).format(3);
                                        if (i == 14) valTemp = parseFloat(value.TOTAL_A15).format(3);
                                        if (i == 15) valTemp = parseFloat(value.TOTAL_A16).format(3);
                                        if (i == 16) valTemp = parseFloat(value.TOTAL_A17).format(3);
                                        if (i == 17) valTemp = parseFloat(value.TOTAL_A18).format(3);
                                        if (i == 18) valTemp = parseFloat(value.TOTAL_A19).format(3);
                                        if (i == 19) valTemp = parseFloat(value.TOTAL_A20).format(3);
                                        if (i == 20) valTemp = parseFloat(value.TOTAL_A21).format(3);
                                        if (i == 21) valTemp = parseFloat(value.TOTAL_A22).format(3);
                                        if (i == 22) valTemp = parseFloat(value.TOTAL_A23).format(3);
                                        if (i == 23) valTemp = parseFloat(value.TOTAL_A24).format(3);
                                        if (i == 24) valTemp = parseFloat(value.TOTAL_A25).format(3);
                                        if (i == 25) valTemp = parseFloat(value.TOTAL_A26).format(3);
                                        if (i == 26) valTemp = parseFloat(value.TOTAL_A27).format(3);
                                        if (i == 27) valTemp = parseFloat(value.TOTAL_A28).format(3);
                                        if (i == 28) valTemp = parseFloat(value.TOTAL_A29).format(3);
                                        if (i == 29) valTemp = parseFloat(value.TOTAL_A30).format(3);
                                        if (i == 30) valTemp = parseFloat(value.TOTAL_A31).format(3);
                                        if (i == 31) valTemp = parseFloat(value.TOTAL_A32).format(3);
                                        if (i == 32) valTemp = parseFloat(value.TOTAL_A33).format(3);
                                        if (i == 33) valTemp = parseFloat(value.TOTAL_A34).format(3);
                                        if (i == 34) valTemp = parseFloat(value.TOTAL_A35).format(3);
                                        valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + valTemp + '</td>';
                                    }
                                }
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + parseFloat(value.SUM_TSALIN).format(3) + '</td>';
                                for (var i = 0; i < arrSalSuutgalSum.length; i++) {
                                    if (arrSalSuutgalSum[i] > 0) {
                                        if (i == 0) valTemp = parseFloat(value.TOTAL_L1).format(3);
                                        if (i == 1) valTemp = parseFloat(value.TOTAL_L2).format(3);
                                        if (i == 2) valTemp = parseFloat(value.TOTAL_L3).format(3);
                                        if (i == 3) valTemp = parseFloat(value.TOTAL_L4).format(3);
                                        if (i == 4) valTemp = parseFloat(value.TOTAL_L5).format(3);
                                        if (i == 5) valTemp = parseFloat(value.TOTAL_L6).format(3);
                                        if (i == 6) valTemp = parseFloat(value.TOTAL_L7).format(3);
                                        if (i == 7) valTemp = parseFloat(value.TOTAL_L8).format(3);
                                        if (i == 8) valTemp = parseFloat(value.TOTAL_L9).format(3);
                                        if (i == 9) valTemp = parseFloat(value.TOTAL_L10).format(3);
                                        if (i == 10) valTemp = parseFloat(value.TOTAL_L11).format(3);
                                        if (i == 11) valTemp = parseFloat(value.TOTAL_L12).format(3);
                                        if (i == 12) valTemp = parseFloat(value.TOTAL_L13).format(3);
                                        if (i == 13) valTemp = parseFloat(value.TOTAL_L14).format(3);
                                        if (i == 14) valTemp = parseFloat(value.TOTAL_L15).format(3);
                                        if (i == 15) valTemp = parseFloat(value.TOTAL_L16).format(3);
                                        if (i == 16) valTemp = parseFloat(value.TOTAL_L17).format(3);
                                        if (i == 17) valTemp = parseFloat(value.TOTAL_L18).format(3);
                                        if (i == 18) valTemp = parseFloat(value.TOTAL_L19).format(3);
                                        if (i == 19) valTemp = parseFloat(value.TOTAL_L20).format(3);
                                        if (i == 20) valTemp = parseFloat(value.TOTAL_L21).format(3);
                                        if (i == 21) valTemp = parseFloat(value.TOTAL_L22).format(3);
                                        if (i == 22) valTemp = parseFloat(value.TOTAL_L23).format(3);
                                        if (i == 23) valTemp = parseFloat(value.TOTAL_L24).format(3);
                                        if (i == 24) valTemp = parseFloat(value.TOTAL_L25).format(3);
                                        if (i == 25) valTemp = parseFloat(value.TOTAL_L26).format(3);
                                        if (i == 26) valTemp = parseFloat(value.TOTAL_L27).format(3);
                                        if (i == 27) valTemp = parseFloat(value.TOTAL_L28).format(3);
                                        if (i == 28) valTemp = parseFloat(value.TOTAL_L29).format(3);
                                        if (i == 29) valTemp = parseFloat(value.TOTAL_L30).format(3);
                                        if (i == 30) valTemp = parseFloat(value.TOTAL_L31).format(3);
                                        if (i == 31) valTemp = parseFloat(value.TOTAL_L32).format(3);
                                        if (i == 32) valTemp = parseFloat(value.TOTAL_L33).format(3);
                                        if (i == 33) valTemp = parseFloat(value.TOTAL_L34).format(3);
                                        if (i == 34) valTemp = parseFloat(value.TOTAL_L35).format(3);
                                        valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + valTemp + '</td>';
                                    }
                                }
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + parseFloat(value.FIRST_LESS).format(3) + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + parseFloat(value.SUB_TSALIN).format(3) + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + parseFloat(value.END_TSALIN).format(3) + '</td>';
                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + parseFloat(value.LESS_TSALIN).format(3) + '</td>';
                            });
                        }
                        else {
                            valData += "<tr>";
                            valData += '<td colspan="'+(iNemegdelCnt+iSuutgalCnt+9)+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                            valData += "</tr>";
                        }
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="'+(iNemegdelCnt+iSuutgalCnt+9)+'" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
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
</section> 