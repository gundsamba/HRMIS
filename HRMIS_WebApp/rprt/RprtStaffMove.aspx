<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RprtStaffMove.aspx.cs" Inherits="HRWebApp.rprt.RprtStaffMove" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa fa-home fa-fw"></i> > Тайлан <span>> Ажилтан > Шилжилт хөдөлгөөн</span>
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        Албан хаагчдийн тоо төлвөөр
                    </a>
                </li>
                <li id="pTab2Li">
                    <a data-toggle="tab" href="#pTab2">
                        Чөлөөлөгдсөн албан хаагч шалтгаанаар
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
									        <label>Төлөв</label>
									        <select id="selectFilterTab1MoveType" name="selectFilterTab1MoveType" runat="server" multiple style="width:100%" class="select2">
                                                <option value="" selected="selected">Бүгд</option>
                                                <option value="1">Идэвхтэй</option>
                                                <option value="2">Түр чөлөөлсөн</option>
                                                <option value="3">Дикрет авсан</option>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab1', 'АлбанХаагчдынТооТөлвөөр')">
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
                                            АЛБАН ХААГЧДЫН ТОО ТӨЛВӨӨР
                                        </div>
                                        <div id="divpTab1Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төлөв</th>
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
                                            <table style="border-collapse:collapse; width: 300px; font-size:8pt; float:right;">
                                                <tbody>
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
                <div id="pTab2" class="tab-pane" style="padding:10px 0;">
                    <div class="row no-margin">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="well">
                                <form>
                                    <fieldset>
                                        <legend>Тайлангийн шүүлт</legend>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab2Branch" name="selectFilterTab2Branch" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                        <div class="form-group">
									        <label>Төлөв</label>
									        <select id="selectFilterTab2MoveType" name="selectFilterTab2MoveType" runat="server" multiple style="width:100%" class="select2">
                                                <option value="" selected="selected">Бүгд</option>
                                                <option value="3">Чөлөөлөгдсөн</option>
                                                <option value="4">Албанаас халагдсан</option>
									        </select>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab2', 'ЧөлөөлөгдсөнАлбанХаагчШалтгаанаар')">
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
                                    <div id="div1" runat="server" class="reports" style="width: 100%;">
                                        <div style="border-bottom:1px solid #000; padding-bottom: 3px; margin-bottom: 10px;">
                                            <img src="../img/cover-logo-mof.png" style="height:40px;"/>
                                            <span id="spanReportHeaderDate2" runat="server" style="float:right; padding-top: 23px; font-style:italic;"></span>
                                        </div>
                                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                            ЧӨЛӨӨЛӨГДСӨН АЛБАН ХААГЧ ШАЛТГААНААР
                                        </div>
                                        <div id="divpTab2Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab2Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Үйлдэл</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Шалтгаан</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Огноо</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
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
                                            <table style="border-collapse:collapse; width: 300px; font-size:8pt; float:right;">
                                                <tbody>
                                                    <tr>
                                                        <td></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Ажилтаны тоо</td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Чөлөөлөгдсөн</td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Албанаас халагдсан</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Нийт ажилтан:</td>
                                                        <td id="contentTab2Datatable2TdCntStaff" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab2Datatable2TdCntStaffChuluu" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab2Datatable2TdCntStaffHalagdsan" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эрэгтэй ажилтан:</td>
                                                        <td id="contentTab2Datatable2TdCntStaffMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab2Datatable2TdCntStaffChuluuMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab2Datatable2TdCntStaffHalagdsanMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эмэгтэй ажилтан:</td>
                                                        <td id="contentTab2Datatable2TdCntStaffFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab2Datatable2TdCntStaffChuluuFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab2Datatable2TdCntStaffHalagdsanFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
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
    var varFilterTab1MoveType = $("#selectFilterTab1MoveType").select2('data');
    var varFilterTab2Branch = $("#selectFilterTab2Branch").select2('data');
    var varFilterTab2MoveType = $("#selectFilterTab2MoveType").select2('data');
    var pagefunction = function () {
        dataBindTab1Datatable();
        dataBindTab2Datatable();
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
    $("#selectFilterTab1Branch, #selectFilterTab1MoveType, #selectFilterTab2Branch, #selectFilterTab2MoveType").change(function (e) {
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
        if ($('#selectFilterTab1Branch').select2('data').length > 0 && $('#selectFilterTab1MoveType').select2('data').length > 0) {
            dataBindTab1Datatable();
        }
        else {
            $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Дотоод нэгж", "Төлөв" заавал сонгоно уу!</div>');
        }
    });
    $("#btnShowTab2").click(function (e) {
        if ($('#selectFilterTab2Branch').select2('data').length > 0 && $('#selectFilterTab2MoveType').select2('data').length > 0) {
            dataBindTab2Datatable();
        }
        else {
            $('#divAlertTab2Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Дотоод нэгж", "Төлөв" заавал сонгоно уу!</div>');
        }
    });
    $("#btnRefreshTab1").click(function (e) {
        $("#selectFilterTab1Branch").select2('data', varFilterTab1Branch);
        $("#selectFilterTab1MoveType").select2('data', varFilterTab1MoveType);
    });
    $("#btnRefreshTab2").click(function (e) {
        $("#selectFilterTab2Branch").select2('data', varFilterTab2Branch);
        $("#selectFilterTab2MoveType").select2('data', varFilterTab2MoveType);
    });

    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        var valData = '';
        var jsonData = {};
        jsonData.branch = $("#selectFilterTab1Branch").val();
        jsonData.type = $("#selectFilterTab1MoveType").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtStaffMoveTab1Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төлөв</th>';
                valData += '</tr>';
                var arrTypeCountedMale = [0, 0, 0];
                var arrTypeCountedFemale = [0, 0, 0];
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.ROWNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.BRANCH_INITNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.POS_NAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.LNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.FNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.REGNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.GENDER + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.MOVETYPE_NAME + '</td>';
                            valData += "</tr>";
                            if (value.GENDER == 'Эрэгтэй') {
                                if (value.MOVETYPE_NAME == 'Идэвхтэй') arrTypeCountedMale[0] += 1;
                                else if (value.MOVETYPE_NAME == 'Түр чөлөөлөгдсөн') arrTypeCountedMale[1] += 1;
                                else if (value.MOVETYPE_NAME == 'Дикрет авсан') arrTypeCountedMale[2] += 1;
                            }
                            else if (value.GENDER == 'Эмэгтэй') {
                                if (value.MOVETYPE_NAME == 'Идэвхтэй') arrTypeCountedFemale[0] += 1;
                                else if (value.MOVETYPE_NAME == 'Түр чөлөөлөгдсөн') arrTypeCountedFemale[1] += 1;
                                else if (value.MOVETYPE_NAME == 'Дикрет авсан') arrTypeCountedFemale[2] += 1;
                            }
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="8" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="8" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                    valData += "</tr>";
                    alert(resData.d.RetDesc);
                }
                $("#contentTab1Datatable").html(valData);
                $('#contentTab1Datatable2TdCntStaff').html((parseInt(arrTypeCountedMale[0]) + parseInt(arrTypeCountedFemale[0]) + parseInt(arrTypeCountedMale[1]) + parseInt(arrTypeCountedFemale[1]) + parseInt(arrTypeCountedMale[2]) + parseInt(arrTypeCountedFemale[2])));
                $('#contentTab1Datatable2TdCntStaffActive').html((parseInt(arrTypeCountedMale[0]) + parseInt(arrTypeCountedFemale[0])));
                $('#contentTab1Datatable2TdCntStaffChuluu').html((parseInt(arrTypeCountedMale[1]) + parseInt(arrTypeCountedFemale[1])));
                $('#contentTab1Datatable2TdCntStaffDekrit').html((parseInt(arrTypeCountedMale[2]) + parseInt(arrTypeCountedFemale[2])));
                $('#contentTab1Datatable2TdCntStaffMale').html((parseInt(arrTypeCountedMale[0]) + parseInt(arrTypeCountedMale[1]) + parseInt(arrTypeCountedMale[2])));
                $('#contentTab1Datatable2TdCntStaffActiveMale').html((parseInt(arrTypeCountedMale[0])));
                $('#contentTab1Datatable2TdCntStaffChuluuMale').html((parseInt(arrTypeCountedMale[1])));
                $('#contentTab1Datatable2TdCntStaffDekritMale').html((parseInt(arrTypeCountedMale[2])));
                $('#contentTab1Datatable2TdCntStaffFemale').html((parseInt(arrTypeCountedFemale[0]) + parseInt(arrTypeCountedFemale[1]) + parseInt(arrTypeCountedFemale[2])));
                $('#contentTab1Datatable2TdCntStaffActiveFemale').html((parseInt(arrTypeCountedFemale[0])));
                $('#contentTab1Datatable2TdCntStaffChuluuFemale').html((parseInt(arrTypeCountedFemale[1])));
                $('#contentTab1Datatable2TdCntStaffDekritFemale').html((parseInt(arrTypeCountedFemale[2])));
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

    function dataBindTab2Datatable() {
        showLoader('loaderTab2');
        var valData = '';
        var jsonData = {};
        jsonData.branch = $("#selectFilterTab2Branch").val();
        jsonData.type = $("#selectFilterTab2MoveType").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtStaffMoveTab2Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Үйлдэл</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Шалтгаан</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0; width: 65px;">Огноо</th>';
                valData += '</tr>';
                var arrTypeCountedMale = [0, 0];
                var arrTypeCountedFemale = [0, 0];
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.ROWNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.BRANCH_INITNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.POS_NAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.LNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.FNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.REGNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.GENDER + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.MOVETYPE_NAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.MOVE_NAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.DT + '</td>';
                            valData += "</tr>";
                            if (value.GENDER == 'Эрэгтэй') {
                                if (value.MOVETYPE_NAME == 'Чөлөөлөгдсөн') arrTypeCountedMale[0] += 1;
                                else if (value.MOVETYPE_NAME == 'Албанаас халагдсан') arrTypeCountedMale[1] += 1;
                            }
                            else if (value.GENDER == 'Эмэгтэй') {
                                if (value.MOVETYPE_NAME == 'Чөлөөлөгдсөн') arrTypeCountedFemale[0] += 1;
                                else if (value.MOVETYPE_NAME == 'Албанаас халагдсан') arrTypeCountedFemale[1] += 1;
                            }
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="10" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="10" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                    valData += "</tr>";
                    alert(resData.d.RetDesc);
                }
                $("#contentTab2Datatable").html(valData);
                $('#contentTab2Datatable2TdCntStaff').html((parseInt(arrTypeCountedMale[0]) + parseInt(arrTypeCountedFemale[0]) + parseInt(arrTypeCountedMale[1]) + parseInt(arrTypeCountedFemale[1])));
                $('#contentTab2Datatable2TdCntStaffChuluu').html((parseInt(arrTypeCountedMale[0]) + parseInt(arrTypeCountedFemale[0])));
                $('#contentTab2Datatable2TdCntStaffHalagdsan').html((parseInt(arrTypeCountedMale[1]) + parseInt(arrTypeCountedFemale[1])));
                $('#contentTab2Datatable2TdCntStaffMale').html((parseInt(arrTypeCountedMale[0]) + parseInt(arrTypeCountedMale[1])));
                $('#contentTab2Datatable2TdCntStaffChuluuMale').html((parseInt(arrTypeCountedMale[0])));
                $('#contentTab2Datatable2TdCntStaffHalagdsanMale').html((parseInt(arrTypeCountedMale[1])));
                $('#contentTab2Datatable2TdCntStaffFemale').html((parseInt(arrTypeCountedFemale[0]) + parseInt(arrTypeCountedFemale[1])));
                $('#contentTab2Datatable2TdCntStaffChuluuFemale').html((parseInt(arrTypeCountedFemale[0])));
                $('#contentTab2Datatable2TdCntStaffHalagdsanFemale').html((parseInt(arrTypeCountedFemale[1])));
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
</script>