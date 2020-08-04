<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="HRWebApp.pg.attendance" %>
<style type="text/css">
    .fc-header-title {
    margin: -18px 0 0 0;
    }
    .fc-event-time {
        display:none!important;
    }
</style>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa fa-home"></i> > Ажилтны ажлын цаг ашиглалт
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab0Li" class="active">
                    <a data-toggle="tab" href="#pTab0">
                        Миний цагийн бүртгэл
                    </a>
                </li>
                <li id="pTab1Li">
                    <a data-toggle="tab" href="#pTab1">
                        Цаг ашиглалт /дотоод нэгжээр/
                    </a>
                </li>
                <li id="pTab2Li">
                    <a data-toggle="tab" href="#pTab2">
                        Цаг ашиглалтын дэлгэрэнгүй /ажилтнаар/
                    </a>
                </li>
                <li id="pTab3Li">
                    <a data-toggle="tab" href="#pTab3">
                        Ажилтны ирцийн тайлан
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="background-color: #fff;">
                <div id="pTab0" class="tab-pane active" style="padding:10px 0;">
                    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-10 sortable-grid ui-sortable">
                        <div class="jarviswidget jarviswidget-sortable jarviswidget-color-blue" data-widget-editbutton="false" data-widget-deletebutton="false">
                            <header>
                                <span class="widget-icon">
                                    <i class="fa fa-table"></i>
                                </span>
                                <h2>Миний цагийн бүртгэл</h2>
                            </header>
                            <div>
                                <div id="loaderTab0" class="search-background">
                                    <label>
                                        <img width="64" height="" src="img/loading.gif"/>
                                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна...</h2>
                                    </label>
                                </div> 
                                <div class="widget-body no-padding">
                                    <div class="widget-body-toolbar">
                                        <div class="Colvis TableTools" style="right:125px; top:0px; z-index:5; margin-top:10px;">
                                            Сар:
                                        </div>
                                        <div class="Colvis TableTools" style="width:45px;right:75px; top:0px; z-index:5; margin-top:5px;">
                                            <select id="selectFilterTab0Month" name="selectFilterTab0Month" runat="server" class="form-control" style="padding:1px"><option value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
                                        </div>
                                        <div class="Colvis TableTools" style="width:60px;right:6px; top:0px; z-index:5; margin-top:5px;">
                                            <select id="selectFilterTab0Year" name="selectFilterTab0Year" runat="server" class="form-control" style="padding:1px"></select>
                                        </div>
                                    </div>
                                    <div id="workingtimeCalendar">

                                    </div>
                                </div>
                            </div> 
                        </div>
                    </article>
                </div>
                <div id="pTab1" class="tab-pane" style="padding:10px 0;">
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
                                            <div class="row no-margin">
                                                <div class="col-xs-6" style="padding:0 10px 0 0;">
                                                    <label>Он</label>
									                <select id="selectFilterTab1Year" name="selectFilterTab1Year" runat="server" style="width:100%" class="form-control"></select>
                                                </div>
                                                <div class="col-xs-6" style="padding:0 0 0 10px;">
                                                    <label>Сар</label>
									                <select id="selectFilterTab1Month" name="selectFilterTab1Month" runat="server" style="width:100%" class="form-control">
                                                        <option value="1">1 сар</option>
                                                        <option value="2">2 сар</option>
                                                        <option value="3">3 сар</option>
                                                        <option value="4">4 сар</option>
                                                        <option value="5">5 сар</option>
                                                        <option value="6">6 сар</option>
                                                        <option value="7">7 сар</option>
                                                        <option value="8">8 сар</option>
                                                        <option value="9">9 сар</option>
                                                        <option value="10">10 сар</option>
                                                        <option value="11">11 сар</option>
                                                        <option value="12">12 сар</option>
									                </select>
                                                </div>
                                            </div>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divpTab1', 'Шагнал')">
                                        <i class="fa fa-file-word-o"></i>
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
                                            ЦАГ АШИГЛАЛТ ДОТООД НЭГЖЭЭР
                                        </div>
                                        <div id="divpTab1Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажилтны тоо</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажиллавал зохих хоног</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажиллсан хоног</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Цаг ашиглалтын хувь</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
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
                <div id="pTab2" class="tab-pane" style="padding:10px 0;">
                    <div class="row no-margin">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="well">
                                <form>
                                    <fieldset>
                                        <legend>Тайлангийн шүүлт</legend>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab2Branch" name="selectFilterTab2Branch" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Ажилтан</label>
									        <select id="selectFilterTab2Staff" name="selectFilterTab2Staff" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                        <div class="form-group">
									        <label>Он</label>
									        <select id="selectFilterTab2Year" name="selectFilterTab2Year" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
                                            <div class="row no-margin">
                                                <div class="col-xs-6" style="padding:0 10px 0 0;">
                                                    <label>Эхлэх сар</label>
									                <select id="selectFilterTab2MonthBegin" name="selectFilterTab2MonthBegin" runat="server" style="width:100%" class="form-control">
                                                        <option value="1">1 сар</option>
                                                        <option value="2">2 сар</option>
                                                        <option value="3">3 сар</option>
                                                        <option value="4">4 сар</option>
                                                        <option value="5">5 сар</option>
                                                        <option value="6">6 сар</option>
                                                        <option value="7">7 сар</option>
                                                        <option value="8">8 сар</option>
                                                        <option value="9">9 сар</option>
                                                        <option value="10">10 сар</option>
                                                        <option value="11">11 сар</option>
                                                        <option value="12">12 сар</option>
									                </select>
                                                </div>
                                                <div class="col-xs-6" style="padding:0 0 0 10px;">
                                                    <label>Дуусах сар</label>
									                <select id="selectFilterTab2MonthEnd" name="selectFilterTab2MonthEnd" runat="server" style="width:100%" class="form-control">
                                                        <option value="1">1 сар</option>
                                                        <option value="2">2 сар</option>
                                                        <option value="3">3 сар</option>
                                                        <option value="4">4 сар</option>
                                                        <option value="5">5 сар</option>
                                                        <option value="6">6 сар</option>
                                                        <option value="7">7 сар</option>
                                                        <option value="8">8 сар</option>
                                                        <option value="9">9 сар</option>
                                                        <option value="10">10 сар</option>
                                                        <option value="11">11 сар</option>
                                                        <option value="12">12 сар</option>
									                </select>
                                                </div>
                                            </div>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab1')" style="margin-left:5px;">
                                        <i class="fa fa-print"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divpTab1', 'Шагнал')">
                                        <i class="fa fa-file-word-o"></i>
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
                                            ЦАГ АШИГЛАЛТ ДЭЛГЭРЭНГҮЙ ТАЙЛАН АЖИЛТНААР
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
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Огноо</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төлөв</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ирсэн цаг</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Явсан цаг</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хоцорсон хугацаа</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эрт явсан хугацаа</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
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
                <div id="pTab3" class="tab-pane" style="padding:10px 0;">
                    <div class="row no-margin">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="well">
                                <form>
                                    <fieldset>
                                        <legend>Тайлангийн шүүлт</legend>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab3Branch" name="selectFilterTab3Branch" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Ажилтан</label>
									        <select id="selectFilterTab3Staff" name="selectFilterTab3Staff" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
									        <label>Он</label>
									        <select id="selectFilterTab3Year" name="selectFilterTab3Year" runat="server" style="width:100%" class="form-control"></select>
								        </div>
                                        <div class="form-group">
                                            <div class="row no-margin">
                                                <div class="col-xs-6" style="padding:0 10px 0 0;">
                                                    <label>Эхлэх сар</label>
									                <select id="selectFilterTab3MonthBegin" name="selectFilterTab3MonthBegin" runat="server" style="width:100%" class="form-control">
                                                        <option value="1">1 сар</option>
                                                        <option value="2">2 сар</option>
                                                        <option value="3">3 сар</option>
                                                        <option value="4">4 сар</option>
                                                        <option value="5">5 сар</option>
                                                        <option value="6">6 сар</option>
                                                        <option value="7">7 сар</option>
                                                        <option value="8">8 сар</option>
                                                        <option value="9">9 сар</option>
                                                        <option value="10">10 сар</option>
                                                        <option value="11">11 сар</option>
                                                        <option value="12">12 сар</option>
									                </select>
                                                </div>
                                                <div class="col-xs-6" style="padding:0 0 0 10px;">
                                                    <label>Дуусах сар</label>
									                <select id="selectFilterTab3MonthEnd" name="selectFilterTab3MonthEnd" runat="server" style="width:100%" class="form-control">
                                                        <option value="1">1 сар</option>
                                                        <option value="2">2 сар</option>
                                                        <option value="3">3 сар</option>
                                                        <option value="4">4 сар</option>
                                                        <option value="5">5 сар</option>
                                                        <option value="6">6 сар</option>
                                                        <option value="7">7 сар</option>
                                                        <option value="8">8 сар</option>
                                                        <option value="9">9 сар</option>
                                                        <option value="10">10 сар</option>
                                                        <option value="11">11 сар</option>
                                                        <option value="12">12 сар</option>
									                </select>
                                                </div>
                                            </div>
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
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab1')" style="margin-left:5px;">
                                        <i class="fa fa-print"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divpTab1', 'Шагнал')">
                                        <i class="fa fa-file-word-o"></i>
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
                                            АЖИЛТНЫ ИРЦИЙН ТАЙЛАН
                                        </div>
                                        <div id="divpTab3Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab3Datatable">
                                                    
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
<script type="text/javascript">
    var globalAjaxVar = null;
    var varFilterTab1Branch = $("#selectFilterTab1Branch").select2('data');
    var varFilterTab1Year = $("#selectFilterTab1Year").val();
    var varFilterTab1Month = $("#selectFilterTab1Month").val();
    var varFilterTab2Branch = $("#selectFilterTab2Branch").val();
    var varFilterTab2Staff = $("#selectFilterTab2Staff").select2('data');
    var varFilterTab2Year = $("#selectFilterTab2Year").val();
    var varFilterTab2MonthBegin = $("#selectFilterTab2MonthBegin").val();
    var varFilterTab2MonthEnd = $("#selectFilterTab2MonthEnd").val();
    var varFilterTab3Branch = $("#selectFilterTab3Branch").val();
    var varFilterTab3Staff = $("#selectFilterTab3Staff").val();
    var varFilterTab3Year = $("#selectFilterTab3Year").val();
    var varFilterTab3MonthBegin = $("#selectFilterTab3MonthBegin").val();
    var varFilterTab3MonthEnd = $("#selectFilterTab3MonthEnd").val();

    var pagefunction = function () {
        dataBindworkingtimeTab1Calendar();
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
    $("#selectFilterTab2Staff").change(function (e) {
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
        if ($('#selectFilterTab1Branch').select2('data').length > 0) {
            dataBindTab1Datatable();
        }
        else {
            $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Дотоод нэгж" заавал сонгоно уу!</div>');
        }
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
        if ($('#selectFilterTab3Staff').val() != '') {
            dataBindTab3Datatable();
        }
        else {
            $('#divAlertTab3Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Ажилтан" заавал сонгоно уу!</div>');
        }
    });
    $("#btnRefreshTab1").click(function (e) {
        $("#selectFilterTab1Branch").select2('data', varFilterTab1Branch);
        $("#selectFilterTab1Year").val(varFilterTab1Year);
        $("#selectFilterTab1Month").val(varFilterTab1Month);
    });
    $("#btnRefreshTab2").click(function (e) {
        $("#selectFilterTab2Branch").val('data', varFilterTab2Branch);
        $("#selectFilterTab2Staff").select2('data', varFilterTab2Staff);
        $("#selectFilterTab2Year").val(varFilterTab2Year);
        $("#selectFilterTab2MonthBegin").val(varFilterTab2MonthBegin);
        $("#selectFilterTab2MonthEnd").val(varFilterTab2MonthEnd);
    });
    $("#btnRefreshTab3").click(function (e) {
        $("#selectFilterTab3Branch").val('data', varFilterTab3Branch);
        $("#selectFilterTab3Staff").select2('data', varFilterTab3Staff);
        $("#selectFilterTab3Year").val(varFilterTab3Year);
        $("#selectFilterTab3MonthBegin").val(varFilterTab3MonthBegin);
        $("#selectFilterTab3MonthEnd").val(varFilterTab3MonthEnd);
    });

    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        var valData = '';
        var jsonData = {};
        var percolor = '';
        jsonData.branch = $("#selectFilterTab1Branch").val();
        jsonData.year = $("#selectFilterTab1Year").val();
        jsonData.month = $("#selectFilterTab1Month").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtStaffAttendanceTab1Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажилтны тоо</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажиллавал зохих хоног</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Ажиллсан хоног</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Цаг ашиглалтын хувь</th>';
                valData += '</tr>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            if (parseFloat(value.PER) >= 0 && parseFloat(value.PER) <= 49) { percolor = "bg-color-red"; }
                            else if (parseFloat(value.PER) >= 50 && parseFloat(value.PER) <= 79) { percolor = "bg-color-orange"; }
                            else if (parseFloat(value.PER) >= 80 && parseFloat(value.PER) <= 100) { percolor = "bg-color-greenLight"; }
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.ROWNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.BR_NAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + value.STAFF_CNT + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + value.WORKDAY + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;">' + value.EVALWORKEDDAY + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px;"><span class="badge ' + percolor + '">' + value.PER + ' %</span></td>';
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
                    valData += "<tr>";
                    valData += '<td colspan="6" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
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
                            if(value.STAFFS_ID == '') valStaffData += '<option value="' + value.STAFFS_ID + '" selected="selected">' + value.ST_NAME + '</option>';
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
    function dataBindTab2Datatable() {
        showLoader('loaderTab2');
        var valData = '';
        var jsonData = {};
        var percolor = '';
        jsonData.branch = [$("#selectFilterTab2Branch").val()];
        jsonData.staff = $("#selectFilterTab2Staff").val();
        jsonData.year = $("#selectFilterTab2Year").val();
        jsonData.monthbegin = $("#selectFilterTab2MonthBegin").val();
        jsonData.monthend = $("#selectFilterTab2MonthEnd").val();
        console.log(JSON.stringify(jsonData));
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtStaffAttendanceTab2Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th rowspan=\"2\" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th rowspan=\"2\" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Албан тушаал</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Ажилтаны нэр</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Ажиллавал зохих хоног</th>";
                valData += "<th colspan=\"4\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Үүнээс</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Ажилласан хоног</th>";
                valData += "<th colspan=\"5\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Үүнээс</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Үнэлгээт ажилласан хоног</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Цаг ашиглалтын хувь</th>";
                valData += '</tr>';
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Чөлөө</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Өвчтэй</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Ээлжийн амралттай</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Албан томилолттой</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Тасалсан хоног</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Хоцорсон минут</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Хоцорсон өдөр</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Эрт гарсан минут</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; padding:5px 0; vertical-align: middle;text-align:center;\">Орой гарсан минут</th>";
                valData += '</tr>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            if (parseFloat(value.PER) >= 0 && parseFloat(value.PER) <= 49) { percolor = "bg-color-red"; }
                            else if (parseFloat(value.PER) >= 50 && parseFloat(value.PER) <= 79) { percolor = "bg-color-orange"; }
                            else if (parseFloat(value.PER) >= 80 && parseFloat(value.PER) <= 100) { percolor = "bg-color-greenLight"; }
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.ROWNO + '</td>';
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.NEGJ + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.POS_NAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.STAFFNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.WORKDAY + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.CHOLOODAYSUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.UWCHTEIDAYSUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.AMRALTDAYSUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.TOMILOLTDAYSUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.WORKEDAY + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.TASALSANDAYSUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.HOTSORSONMINUTESUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.HOTSORSONDAYSUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.ERTMINUTESUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.OROIMINUTESUM + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.EVALWORKEDDAY + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\"><span class=\"badge " + percolor + "\">" + value.PER + " %</span></td>";
                            valData += "</tr>";
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="17" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="17" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
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
                //window.location = '../#pg/error500.aspx';
            }
        });
        $('#divAlertTab2Content').html('');
    }
    $("#selectFilterTab3Branch").change(function (e) {
        var valData = '';
        var jsonData = {};
        var arrStaffData = [];
        var valStaffData = '';
        jsonData.branch = [$("#selectFilterTab3Branch").val()];
        jsonData.set1stIndexValue = '';
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
                            if(index == 0) valStaffData += '<option value="' + value.STAFFS_ID + '" selected="selected">' + value.ST_NAME + '</option>';
                            else valStaffData += '<option value="' + value.STAFFS_ID + '">' + value.ST_NAME + '</option>';
                        });
                    }
                }
                else {
                    alert(resData.d.RetDesc);
                }
                $("#selectFilterTab3Staff").html(valStaffData);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    });
    function dataBindTab3Datatable() {
        showLoader('loaderTab3');
        var valData = '';
        var jsonData = {};
        jsonData.staff = $("#selectFilterTab3Staff").val();
        jsonData.year = $("#selectFilterTab3Year").val();
        jsonData.monthbegin = $("#selectFilterTab3MonthBegin").val();
        jsonData.monthend = $("#selectFilterTab3MonthEnd").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtStaffAttendanceTab3Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Нэр</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Албан тушаал</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Огноо</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Төлөв</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Ирсэн</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Явсан</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Хоцорсон<br>(минут)</th>";
                valData += "<th style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;\">Эрт явсан<br>(минут)</th>";
                valData += '</tr>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.ROWNO + '</td>';
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.NEGJ + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.STNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;\">" + value.POSNAME + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.DT + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\"><span class=\"label bg-color-"+value.TP_COLOR+"\">"+value.TP_NAME+"</span></td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.MINTM.replace("00:00:00", "--:--:--") + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.MAXTM.replace("00:00:00", "--:--:--") + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.HOTSORSON.replace("00:00:00", "--:--:--") + "</td>";
                            valData += "<td style=\"border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;\">" + value.ERT.replace("00:00:00", "--:--:--") + "</td>";
                            valData += "</tr>";
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
                $("#contentTab3Datatable").html(valData);
                hideLoader('loaderTab3');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab3');
            },
            error: function (xhr, status, error) {
                //window.location = '../#pg/error500.aspx';
            }
        });
        $('#divAlertTab3Content').html('');
    }

    //tab0
    var calendarSource = '';
    function dataBindworkingtimeTab1Calendar() {
        $('#workingtimeCalendar').html('');
        showLoader('loaderTab1');
        calendarSource = '../pg/dashboardStaffWorkingtimeCalendar.aspx?yr=' + $('#selectFilterTab0Year option:selected').val() + '&mnth=' + $('#selectFilterTab0Month option:selected').val() + '&stid=' + '<%= Session["HRMIS_UserID"] %>';
        var hdr = {
            left: 'title',
            center: 'month,agendaWeek,agendaDay',
            right: 'prev,today,next'
        };
        var datas;
        var calendar = $('#workingtimeCalendar').fullCalendar({
            header: hdr,
            buttonText: {
                prev: '<i class="fa fa-chevron-left"></i>',
                next: '<i class="fa fa-chevron-right"></i>'
            },
            editable: false,
            selectable: false,
            selectHelper: true,
            droppable: false,
            //weekends: false,
            draggable: false,
            year: $('#selectFilterTab0Year option:selected').val(),
            month: $('#selectFilterTab0Month option:selected').val() - 1,
            date: 1,
            events: calendarSource,
            eventRender: function (event, element, icon) {
                element.find('.fc-event-title').append("<br/><span class='ultra-light'>" + event.description + "</span>");
                element.find('.fc-event-inner').append('<span class="air air-top-right font-xs" style="padding-right: 2px;"><i class="fa fa-clock-o"></i> ' + event.tm + '</span>');
            },
            windowResize: function (event, ui) {
                $('#workingtimeCalendar').fullCalendar('render');
            },
            drop: function (date, allDay) { // this function is called when something is dropped
                var originalEventObject = $(this).data('eventObject');
                var copiedEventObject = $.extend({}, originalEventObject);
                copiedEventObject.start = date;
                copiedEventObject.allDay = allDay;
                $('#workingtimeCalendar').fullCalendar('renderEvent', copiedEventObject, true);
                if ($('#drop-remove').is(':checked')) {
                    $(this).remove();
                }
            },
            loading: function (bool) {
                if (bool) showLoader('loaderTab1');
                else hideLoader('loaderTab1');
            }
        });
        /* hide default buttons */
        $('.fc-header-right, .fc-header-center').hide();
        hideLoader('loaderTab1');
    }
    function reloadCalendar() {
        var calendarNewSource = 'pg/workingtimecalendarjson.aspx?yr=' + $('#selectFilterTab0Year option:selected').val() + '&mnth=' + $('#selectFilterTab0Month option:selected').val() + '&stid=' + '<%= Session["LM_UserID"] %>';
        $('#workingtimeCalendar').fullCalendar('removeEvents');
        $('#workingtimeCalendar').fullCalendar('removeEventSource', calendarSource);
        $('#workingtimeCalendar').fullCalendar('addEventSource', calendarNewSource);
        $('#workingtimeCalendar').fullCalendar('refetchEvents');
        calendarSource = calendarNewSource;
    }
    $("#selectFilterTab0Year").change(function () {
        dataBindworkingtimeTab1Calendar();
    });
    $("#selectFilterTab0Month").change(function () {
        //dataBindworkingtimeTab1Calendar();
        $('#workingtimeCalendar').fullCalendar('gotoDate', $('#selectFilterTab0Year option:selected').val() + '-' + $('#selectFilterTab0Month option:selected').text() + '-01');
        reloadCalendar();
    });
</script>