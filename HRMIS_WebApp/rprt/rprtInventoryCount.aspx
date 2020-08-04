<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rprtInventoryCount.aspx.cs" Inherits="HRWebApp.rprt.rprtInventoryCount" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa fa-home fa-fw"></i> > Тайлан <span>> Эд хөрөнгө > Тоологдсон хөрөнгийн жагсаалт</span>
        </h1>
    </div>
</div>
<div id="divMainInfo" runat="server" class="row hide">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="alert alert-warning">
            <i class="fa-fw fa fa-info"></i> Acolous системтэй холбогдож чадсангүй! Дахин оролдоно уу.
        </div>
    </div>
</div>
<section id="divMainContent" runat="server">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        Тоологдсон хөрөнгийн жагсаалт
                    </a>
                </li>
                <li id="pTab2Li">
                    <a data-toggle="tab" href="#pTab2">
                        Ажилтны тоологдсон хөрөнгийн жагсаалт
                    </a>
                </li>
                <li id="pTab3Li">
                    <a data-toggle="tab" href="#pTab3">
                        Ажилтны тоологдоогүй хөрөнгийн тайлбар
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
									        <label>Хөрөнгө тоолох интервал</label>
									        <select id="selectFilterTab1InventoryInterval" name="selectFilterTab1InventoryInterval" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Хөрөнгийн төрөл</label>
									        <select id="selectFilterTab1AccountType" name="selectFilterTab1AccountType" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                        <div class="form-group">
									        <label>Тоологдсон төлөв</label>
									        <select id="selectFilterTab1CountType" name="selectFilterTab1CountType" runat="server" style="width:100%" class="form-control">
                                                <option value="">Бүгд</option>
                                                <option value="0">Тоолох дүн таарсан</option>
                                                <option value="+">Илүү тоолсон</option>
                                                <option value="-">Дутуу тоолсон</option>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab1', 'ТоологдсонХөрөнгийнЖагсаалт')">
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
                                            ТООЛОГДСОН ХӨРӨНГИЙН ЖАГСААЛТ /<span id="spanTitleInterval"></span>/
                                        </div>
                                        <div id="divpTab1Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төрөл</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоо/ш</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт үнэ</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон тоо</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 5px 0;"></td>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></th>
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
                <div id="pTab2" class="tab-pane" style="padding:10px 0;">
                    <div class="row no-margin">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="well">
                                <form>
                                    <fieldset>
                                        <legend>Тайлангийн шүүлт</legend>
                                        <div class="form-group">
									        <label>Хөрөнгө тоолох интервал</label>
									        <select id="selectFilterTab2InventoryInterval" name="selectFilterTab2InventoryInterval" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab2Branch" name="selectFilterTab2Branch" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Ажилтан</label>
									        <select id="selectFilterTab2Staff" name="selectFilterTab2Staff" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                    </fieldset>
                                    <button id="btnShowTab2" type="button" class="btn btn-primary btn-block">ТАЙЛАН ХАРАХ</button>
                                    <button id="btnRefreshTab2" type="button" class="btn btn-default btn-xs btn-block margin-bottom-10">ШИНЭЧЛЭХ</button>
                                    <div id="divAlertTab2Content"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding margin-bottom-10">
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab2')" style="margin-left:5px;">
                                        <i class="fa fa-print"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab2', 'АжилтныТоологдсонХөрөнгийнЖагсаалт')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right btn-export-excel" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="ExportExcel('#divpTab2')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding">
                                    <div id="loaderTab2" class="search-background-report">
                                        <label>
                                            <img width="64" height="" src="img/loading.gif"/>
                                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                        </label>
                                    </div>
                                    <div id="divpTab2" runat="server" class="reports" style="width: 100%;">
                                        <div style="border-bottom:1px solid #000; padding-bottom: 3px; margin-bottom: 10px;">
                                            <img src="../img/cover-logo-mof.png" style="height:40px;"/>
                                            <span id="spanReportHeaderDate2" runat="server" style="float:right; padding-top: 23px; font-style:italic;"></span>
                                        </div>
                                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                            АЖИЛТНЫ ТООЛОГДСОН ХӨРӨНГИЙН ЖАГСААЛТ /<span id="spanTitleIntervalTab2"></span>/
                                        </div>
                                        <div id="divpTab2Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab2Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th colspan="4" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажилтан</th>
                                                        <th colspan="7" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон эд хөрөнгө</th>
                                                    </tr>
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоолох нэгж</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоолох ёстой</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хэнээс шилжсэн</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тайлбар</th>
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
                <div id="pTab3" class="tab-pane" style="padding:10px 0;">
                    <div class="row no-margin">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="well">
                                <form>
                                    <fieldset>
                                        <legend>Тайлангийн шүүлт</legend>
                                        <div class="form-group">
									        <label>Хөрөнгө тоолох интервал</label>
									        <select id="selectFilterTab3InventoryInterval" name="selectFilterTab3InventoryInterval" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab3Branch" name="selectFilterTab3Branch" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Ажилтан</label>
									        <select id="selectFilterTab3Staff" name="selectFilterTab3Staff" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                    </fieldset>
                                    <button id="btnShowTab3" type="button" class="btn btn-primary btn-block">ТАЙЛАН ХАРАХ</button>
                                    <button id="btnRefreshTab3" type="button" class="btn btn-default btn-xs btn-block margin-bottom-10">ШИНЭЧЛЭХ</button>
                                    <div id="divAlertTab3Content"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding margin-bottom-10">
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab3')" style="margin-left:5px;">
                                        <i class="fa fa-print"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab3', 'АжилтныТоологдоогүйХөрөнгийнЖагсаалт')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right btn-export-excel" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="ExportExcel('#divpTab3')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding">
                                    <div id="loaderTab3" class="search-background-report">
                                        <label>
                                            <img width="64" height="" src="img/loading.gif"/>
                                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                        </label>
                                    </div>
                                    <div id="divpTab3" runat="server" class="reports" style="width: 100%;">
                                        <div style="border-bottom:1px solid #000; padding-bottom: 3px; margin-bottom: 10px;">
                                            <img src="../img/cover-logo-mof.png" style="height:40px;"/>
                                            <span id="spanReportHeaderDate3" runat="server" style="float:right; padding-top: 23px; font-style:italic;"></span>
                                        </div>
                                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                            АЖИЛТНЫ ТООЛОГДООГҮЙ ХӨРӨНГИЙН ТАЙЛБАР /<span id="spanTitleIntervalTab3"></span>/
                                        </div>
                                        <div id="divpTab3Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab3Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th rowspan="2" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th colspan="4" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажилтан</th>
                                                        <th colspan="4" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон эд хөрөнгө</th>
                                                    </tr>
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тайлбар</th>
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
    var varFilterTab1InventoryInterval = $("#selectFilterTab1InventoryInterval option:selected").val();
    var varFilterTab1AccountType = $("#selectFilterTab1AccountType").select2('data');
    var varFilterTab1CountType = $("#selectFilterTab1CountType option:selected").val();
    var varFilterTab2InventoryInterval = $("#selectFilterTab2InventoryInterval option:selected").val();
    var varFilterTab2Branch = $("#selectFilterTab2Branch option:selected").val();
    var varFilterTab2Staff = $("#selectFilterTab2Staff").select2('data');
    var varFilterTab3InventoryInterval = $("#selectFilterTab2InventoryInterval option:selected").val();
    var varFilterTab3Branch = $("#selectFilterTab2Branch option:selected").val();
    var varFilterTab3Staff = $("#selectFilterTab2Staff").select2('data');
    var pagefunction = function () {
        dataBindTab1Datatable();
        dataBindTab2Datatable();
        dataBindTab3Datatable();
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
    $("#selectFilterTab1AccountType").change(function (e) {
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
    $("#selectFilterTab2Staff").change(function (e) {
        var arrSelected = $(this).select2('data');
        lastEl = arrSelected[arrSelected.length - 1].id;
        if (lastEl == "") {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                return value.id == "";
            });
        }
        else {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                return value.id != "";
            });
        }
        $(this).select2('data', arrSelected);
    });
    $("#selectFilterTab3Staff").change(function (e) {
        var arrSelected = $(this).select2('data');
        lastEl = arrSelected[arrSelected.length - 1].id;
        if (lastEl == "") {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                return value.id == "";
            });
        }
        else {
            arrSelected = jQuery.grep(arrSelected, function (value) {
                return value.id != "";
            });
        }
        $(this).select2('data', arrSelected);
    });
    $("#btnShowTab1").click(function (e) {
        dataBindTab1Datatable();
    });
    $("#btnShowTab2").click(function (e) {
        if ($('#selectFilterTab2Staff').select2('data').length > 0) {
            dataBindTab2Datatable();
        }
        else {
            $('#divAlertTab2Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Ажилтан" заавал сонгоно уу!</div>');
        }
    });
    $("#btnShowTab3").click(function (e) {
        if ($('#selectFilterTab3Staff').select2('data').length > 0) {
            dataBindTab3Datatable();
        }
        else {
            $('#divAlertTab3Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Ажилтан" заавал сонгоно уу!</div>');
        }
    });
    $("#btnRefreshTab1").click(function (e) {
        $("#selectFilterTab1InventoryInterval").val(varFilterTab1InventoryInterval);
        $("#selectFilterTab1AccountType").select2('data', varFilterTab1AccountType);
        $("#selectFilterTab1CountType").val(varFilterTab1CountType);
    });
    $("#btnRefreshTab2").click(function (e) {
        $("#selectFilterTab2InventoryInterval").val(varFilterTab2InventoryInterval);
        $("#selectFilterTab2Branch").val('data', varFilterTab2Branch);
        $("#selectFilterTab2Staff").select2('data', varFilterTab2Staff);
    });
    $("#btnRefreshTab3").click(function (e) {
        $("#selectFilterTab3InventoryInterval").val(varFilterTab3InventoryInterval);
        $("#selectFilterTab3Branch").val('data', varFilterTab3Branch);
        $("#selectFilterTab3Staff").select2('data', varFilterTab3Staff);
    });
    function dataBindTab1Datatable() {
        var valData = '';
        $('#spanTitleBranchStaff').html('');
        if ($("#selectFilterTab1InventoryInterval option:selected").val() != '' && $('#selectFilterTab1AccountType').select2('data').length > 0) {
            showLoader('loaderTab1');
            $('#spanTitleInterval').html($("#selectFilterTab1InventoryInterval option:selected").text());
            var jsonData = {};
            var objCountedData = null;
            var resData = null;
            var iCounted = '0';
            var valSelectedCountType = $("#selectFilterTab1CountType option:selected").val();
            jsonData.intervalid = $("#selectFilterTab1InventoryInterval option:selected").val();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/RprtInventoryCountedData",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    resData = jQuery.parseJSON(data.d);
                    if (resData.d.RetType == "0") {
                        objCountedData = resData.d.RetData;
                        jsonData = {};
                        jsonData.accounttype = $("#selectFilterTab1AccountType").val();
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "../webservice/ServiceMain.svc/RprtInventoryListWithQRCode",
                            data: JSON.stringify(jsonData),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                var resData = jQuery.parseJSON(data.d);
                                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төрөл</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоо/ш</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт үнэ</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон тоо</th>';
                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Зөрүү</th>';
                                valData += '</tr>';
                                if (resData.d.RetType == "0") {
                                    if (resData.d.RetData.length > 0) {
                                        var isCountedTypeShow = false;
                                        $(resData.d.RetData).each(function (index, value) {
                                            iCounted = 0;
                                            $(objCountedData).each(function (index2, value2) {
                                                if (value.INV_ID == value2.INVENTORY_INV_ID && value.PRICE == value2.INVENTORY_PRICE) {
                                                    iCounted = value2.CNT;
                                                    return false;
                                                }
                                            });
                                            isCountedTypeShow = false;
                                            if (valSelectedCountType == '') isCountedTypeShow = true;
                                            else if (valSelectedCountType == '0') {
                                                if ((parseInt(value.END_QUANT) - iCounted) == 0) {
                                                    isCountedTypeShow = true; console.log("YEAH 0");
                                                }
                                            }
                                            else if (valSelectedCountType == '+') {
                                                console.log("NEMEH");
                                                if ((parseInt(value.END_QUANT) - parseInt(iCounted)) < 0) {
                                                    isCountedTypeShow = true;
                                                }
                                            }
                                            else if (valSelectedCountType == '-') {
                                                if ((parseInt(value.END_QUANT) - iCounted) > 0) {
                                                    isCountedTypeShow = true;
                                                }
                                            }
                                            if (isCountedTypeShow == true) {
                                                valData += '<tr data-invid="' + value.INV_ID + '" data-price="' + value.PRICE + '">';
                                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + (index + 1) + '</td>';
                                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.ACCOUNT_NAME + '</td>';
                                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.INV_CODE + '</td>';
                                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.INV_NAME + '</td>';
                                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + (parseFloat(value.PRICE).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>';
                                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.END_QUANT + ' ' + value.INV_UNIT + '</td>';
                                                valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + (parseFloat(value.END_TOTAL).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>';
                                                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px;">';
                                                valData += iCounted;
                                                valData += '</th>';
                                                if ((parseInt(value.END_QUANT) - iCounted) > 0) valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">-' + Math.abs(parseInt(value.END_QUANT) - iCounted) + '</th>';
                                                else if ((parseInt(value.END_QUANT) - iCounted) < 0) valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">+' + Math.abs(parseInt(value.END_QUANT) - iCounted) + '</th>';
                                                else valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">+' + Math.abs(parseInt(value.END_QUANT) - iCounted) + '</th>';
                                                valData += "</tr>";
                                            }
                                        });
                                    }
                                    else {
                                        valData += "<tr>";
                                        valData += '<td colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                                        valData += "</tr>";
                                    }
                                }
                                else {
                                    if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                                    else {
                                        valData += "<tr>";
                                        valData += '<td colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
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
                    }
                    else {
                        if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                        else {
                            valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төрөл</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоо/ш</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт үнэ</th>';
                            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон тоо</th>';
                            valData += '</tr>';
                            valData += "<tr>";
                            valData += '<td colspan="8" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                            valData += "</tr>";
                            $("#contentTab1Datatable").html(valData);
                            alert(resData.d.RetDesc);
                            hideLoader('loaderTab1');
                        }
                    }
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
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төрөл</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоо/ш</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нийт үнэ</th>';
            valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон тоо</th>';
            valData += '</tr>';
            valData += "<tr>";
            valData += '<td colspan="8" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
            valData += "</tr>";
            $("#contentTab1Datatable").html(valData);
            $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Хөрөнгө тоолох интервал", "Хөрөнгийн төрөл" заавал сонгоно уу!</div>');
        }
    }
    function dataBindTab2Datatable() {
        showLoader('loaderTab2');
        $('#spanTitleIntervalTab2').html($("#selectFilterTab2InventoryInterval option:selected").text());
        var valData = '';
        var jsonData = {};
        jsonData.pBranch = [$("#selectFilterTab2Branch option:selected").val()];
        jsonData.pStaff = $("#selectFilterTab2Staff").val();
        jsonData.pInterval = $("#selectFilterTab2InventoryInterval option:selected").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtInventoryCountTab2Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th rowspan="2" style = "border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;" >№</th >';
                valData += '<th colspan="4" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажилтан</th>';
                valData += '<th colspan="7" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон эд хөрөнгө</th>';
                valData += '</tr>';
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоолох нэгж</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоолох ёстой</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хэнээс шилжсэн</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тайлбар</th>';
                valData += '</tr>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + (index+1) + '</td>';
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.BRANCH_INITNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.POS_NAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.LNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.FNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.INVENTORY_INV_CODE + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.INVENTORY_INV_NAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;\">" + (parseFloat(value.INVENTORY_PRICE).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.INVENTORY_INV_UNIT + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.ISOWN + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.FROM_USERINFO + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.DESC + "</td>";
                            valData += "</tr>";
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="12" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="12" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                    valData += "</tr>";
                    alert(resData.d.RetDesc);
                }
                $("#contentTab2Datatable").html(valData);
                hideLoader('loaderTab2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab2');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        $('#divAlertTab2Content').html('');
    }
    function dataBindTab3Datatable() {
        showLoader('loaderTab3');
        $('#spanTitleIntervalTab3').html($("#selectFilterTab3InventoryInterval option:selected").text());
        var valData = '';
        var jsonData = {};
        jsonData.pBranch = [$("#selectFilterTab3Branch option:selected").val()];
        jsonData.pStaff = $("#selectFilterTab3Staff").val();
        jsonData.pInterval = $("#selectFilterTab3InventoryInterval option:selected").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtInventoryCountTab3Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th rowspan="2" style = "border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;" >№</th >';
                valData += '<th colspan="4" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажилтан</th>';
                valData += '<th colspan="4" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тоологдсон эд хөрөнгө</th>';
                valData += '</tr>';
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Код</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нэгж үнэ</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Тайлбар</th>';
                valData += '</tr>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + (index + 1) + '</td>';
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.BRANCH_INITNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.POS_NAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.LNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.FNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.INVENTORY_INV_CODE + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.INVENTORY_INV_NAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;\">" + (parseFloat(value.INVENTORY_PRICE).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.DESC + "</td>";
                            valData += "</tr>";
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                    valData += "</tr>";
                    alert(resData.d.RetDesc);
                }
                $("#contentTab3Datatable").html(valData);
                hideLoader('loaderTab3');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab3');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        $('#divAlertTab3Content').html('');
    }
    $("#selectFilterTab2Branch").change(function (e) {
        var valData = '';
        var jsonData = {};
        var arrStaffData = [];
        var valStaffData = '';
        jsonData.branch = [$("#selectFilterTab2Branch").val()];
        jsonData.set1stIndexValue = 'Бүгд';
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
                            arrStaffData.push([{ "id": value.STAFFS_ID, "text": value.ST_NAME }]);
                            if (value.STAFFS_ID == '') valStaffData += '<option value="' + value.STAFFS_ID + '" selected="selected">' + value.ST_NAME + '</option>';
                            else valStaffData += '<option value="' + value.STAFFS_ID + '">' + value.ST_NAME + '</option>';
                        });
                    }
                }
                else {
                    alert(resData.d.RetDesc);
                }
                $("#selectFilterTab2Staff").select2("destroy");
                $("#selectFilterTab2Staff").html(valStaffData);
                $('#selectFilterTab2Staff').select2();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    $("#selectFilterTab3Branch").change(function (e) {
        var valData = '';
        var jsonData = {};
        var arrStaffData = [];
        var valStaffData = '';
        jsonData.branch = [$("#selectFilterTab3Branch").val()];
        jsonData.set1stIndexValue = 'Бүгд';
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
                            arrStaffData.push([{ "id": value.STAFFS_ID, "text": value.ST_NAME }]);
                            if (value.STAFFS_ID == '') valStaffData += '<option value="' + value.STAFFS_ID + '" selected="selected">' + value.ST_NAME + '</option>';
                            else valStaffData += '<option value="' + value.STAFFS_ID + '">' + value.ST_NAME + '</option>';
                        });
                    }
                }
                else {
                    alert(resData.d.RetDesc);
                }
                $("#selectFilterTab3Staff").select2("destroy");
                $("#selectFilterTab3Staff").html(valStaffData);
                $('#selectFilterTab3Staff').select2();
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
</script>