<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workingtime.aspx.cs" Inherits="HRWebApp.pg.workingtime" %>
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
                <li id="workingtimeTab1Li" class="active" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#workingtimeTab1">
                        Цагийн бүртгэл
                    </a>
                </li>
                <li id="workingtimeTab2Li" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#workingtimeTab2">
                        <i class="fa fa-fw fa-lg fa-file-text "></i>
                        Цаг ашиглалтын байдал
                    </a>
                </li>
                <li id="workingtimeTab3Li" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#workingtimeTab3">
                        <i class="fa fa-fw fa-lg fa-file-text "></i>
                        Цаг ашиглалтын байдал /дэлгэрэнгүй/
                    </a>
                </li>
                <li id="workingtimeTab4Li" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#workingtimeTab4">
                        <i class="fa fa-fw fa-lg fa-file-text "></i>
                        Тайлан
                    </a>
                </li>
            </ul>
            <div id="workingtimeTabContent" class="tab-content">
                <div id="workingtimeTab1" class="tab-pane active">
                    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-10 sortable-grid ui-sortable">
                        <div class="jarviswidget jarviswidget-sortable jarviswidget-color-blue" data-widget-editbutton="false" data-widget-deletebutton="false">
                            <header>
                                <span class="widget-icon">
                                    <i class="fa fa-table"></i>
                                </span>
                                <h2>Цагийн бүртгэл</h2>
                            </header>
                            <div>
                                <div id="loaderTab1" class="search-background">
                                    <label>
                                        <img width="64" height="" src="img/loading.gif"/>
                                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                    </label>
                                </div> 
                                <div class="widget-body no-padding">
                                    <div class="widget-body-toolbar">
                                        <div class="Colvis TableTools" style="right:125px; top:0px; z-index:5; margin-top:10px;">
                                            Сар:
                                        </div>
                                        <div class="Colvis TableTools" style="width:45px;right:75px; top:0px; z-index:5; margin-top:5px;">
                                            <select id="workingtimeTab1SelectMonth" name="workingtimeTab1SelectMonth" runat="server" class="form-control" style="padding:1px"><option value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
                                        </div>
                                        <div class="Colvis TableTools" style="width:60px;right:6px; top:0px; z-index:5; margin-top:5px;">
                                            <select id="workingtimeTab1SelectYear" name="workingtimeTab1SelectYear" runat="server" class="form-control" style="padding:1px"><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option></select>
                                        </div>
                                    </div>
                                    <div id="workingtimeCalendar">

                                    </div>
                                </div>
                            </div> 
                        </div>
                    </article>                    
                </div>
                <div id="workingtimeTab2" class="tab-pane fade">
                    <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                        <div style="width:70%; float:left;">
                            <div style="width:50px; float:left; padding-top:5px;">Газар: </div>
                            <div style="width:100px; float:left; margin-right:10px;"><select id="workingtimeTab2SelectBranchGazar" name="workingtimeTab2SelectBranchGazar" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:50px; float:left; padding-top:5px;">Хэлтэс: </div>
                            <div style="width:100px; float:left; margin-right:10px;"><select disabled="disabled" id="workingtimeTab2SelectBranchHeltes" name="workingtimeTab2SelectBranchHeltes" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:60px; float:left; padding-top:5px;">Ажилтан: </div>
                            <div style="width:200px; float:left; margin-right:10px;"><select disabled="disabled" id="workingtimeTab2SelectStaff" name="workingtimeTab2SelectStaff" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:70px; float:left; margin-right:10px;"><select id="workingtimeTab2SelectMonth" name="workingtimeTab2SelectMonth" runat="server" class="form-control" style="padding:1px"><option value="1">1 сар</option><option value="2">2 сар</option><option value="3">3 сар</option><option value="4">4 сар</option><option value="5">5 сар</option><option value="6">6 сар</option><option value="7">7 сар</option><option value="8">8 сар</option><option value="9">9 сар</option><option value="10">10 сар</option><option value="11">11 сар</option><option value="12">12 сар</option></select></div>
                            <div style="width:5px; float:left; margin-right:10px; text-align:center; margin-top: 7px;">-</div>
                            <div style="width:70px; float:left; margin-right:10px;"><select id="workingtimeTab2SelectMonth2" name="workingtimeTab2SelectMonth2" runat="server" class="form-control" style="padding:1px"><option value="1">1 сар</option><option value="2">2 сар</option><option value="3">3 сар</option><option value="4">4 сар</option><option value="5">5 сар</option><option value="6">6 сар</option><option value="7">7 сар</option><option value="8">8 сар</option><option value="9">9 сар</option><option value="10">10 сар</option><option value="11">11 сар</option><option value="12">12 сар</option></select></div>
                            <div style="width:60px; float:left; margin-right:10px;"><select id="workingtimeTab2SelectYear" name="workingtimeTab2SelectYear" runat="server" class="form-control" style="padding:1px"><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option></select></div>
                        </div>
                        <div style="text-align:right; width:30%; float:left;">
                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divworkingtimeTab2', 'ЦагАшиглалтынБайдал')">
                                <i class="fa fa-file-word-o"></i>
                            </a>
                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divworkingtimeTab2')">
                                <i class="fa fa-print"></i>
                            </a>
                        </div> 
                    </div>   
                    <div id="loaderTab2" class="search-background">
                        <label>
                            <img width="64" height="" src="img/loading.gif"/>
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                        </label>
                    </div>                  
                    <div id="divworkingtimeTab2" runat="server" class="reports" style="margin:0 10px 10px 10px; width: 100%;">                        
                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                            <label id="divworkingtimeTab2Level" runat="server" style="font-weight:bold;">Level</label> АЖИЛТАНУУДЫН <label id="divworkingtimeTab2Year" runat="server" style="font-weight:bold;">0000</label> ОНЫ <label id="divworkingtimeTab2Month" runat="server" style="font-weight:bold;">00</label> ДУГААР САРЫН ЦАГ АШИГЛАЛТЫН БАЙДАЛ
                        </div>
                        <div id="divworkingtimeTab2Datatable" runat="server"></div>                                
                    </div>
                </div>
                <div id="workingtimeTab3" class="tab-pane fade">
                    <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                        <div style="width:70%; float:left;">
                            <div style="width:50px; float:left; padding-top:5px;">Газар: </div>
                            <div style="width:100px; float:left; margin-right:10px;"><select id="workingtimeTab3SelectBranchGazar" name="workingtimeTab3SelectBranchGazar" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:50px; float:left; padding-top:5px;">Хэлтэс: </div>
                            <div style="width:100px; float:left; margin-right:10px;"><select disabled="disabled" id="workingtimeTab3SelectBranchHeltes" name="workingtimeTab3SelectBranchHeltes" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:60px; float:left; padding-top:5px;">Ажилтан: </div>
                            <div style="width:200px; float:left; margin-right:10px;"><select disabled="disabled" id="workingtimeTab3SelectStaff" name="workingtimeTab3SelectStaff" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                            <div style="width:60px; float:left; margin-right:10px;"><select id="workingtimeTab3SelectYear" name="workingtimeTab3SelectYear" runat="server" class="form-control" style="padding:1px"><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option></select></div>
                            <div style="width:70px; float:left; margin-right:10px;"><select id="workingtimeTab3SelectMonth" name="workingtimeTab3SelectMonth" runat="server" class="form-control" style="padding:1px"><option value="1">1 сар</option><option value="2">2 сар</option><option value="3">3 сар</option><option value="4">4 сар</option><option value="5">5 сар</option><option value="6">6 сар</option><option value="7">7 сар</option><option value="8">8 сар</option><option value="9">9 сар</option><option value="10">10 сар</option><option value="11">11 сар</option><option value="12">12 сар</option></select></div>
                            <div style="width:5px; float:left; margin-right:10px; text-align:center; margin-top: 7px;">-</div>
                            <div style="width:70px; float:left; margin-right:10px;"><select id="workingtimeTab3SelectMonth2" name="workingtimeTab3SelectMonth2" runat="server" class="form-control" style="padding:1px"><option value="1">1 сар</option><option value="2">2 сар</option><option value="3">3 сар</option><option value="4">4 сар</option><option value="5">5 сар</option><option value="6">6 сар</option><option value="7">7 сар</option><option value="8">8 сар</option><option value="9">9 сар</option><option value="10">10 сар</option><option value="11">11 сар</option><option value="12">12 сар</option></select></div>
                        </div>
                        <div style="text-align:right; width:30%; float:left;">
                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divworkingtimeTab3', 'ЦагАшиглалтынБайдалДэлгэрэнгүй')">
                                <i class="fa fa-file-word-o"></i>
                            </a>
                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divworkingtimeTab3')">
                                <i class="fa fa-print"></i>
                            </a>
                        </div> 
                    </div> 
                    <div id="loaderTab3" class="search-background">
                        <label>
                            <img width="64" height="" src="img/loading.gif"/>
                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                        </label>
                    </div>                  
                    <div id="divworkingtimeTab3" runat="server" class="reports" style="margin:0 10px 10px 10px; width: 100%;">                        
                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                            <label id="divworkingtimeTab3Level" runat="server" style="font-weight:bold;">Level</label> АЖИЛТАНУУДЫН <label id="divworkingtimeTab3Year" runat="server" style="font-weight:bold;">0000</label> ОНЫ <label id="divworkingtimeTab3Month" runat="server" style="font-weight:bold;">00</label> ДУГААР САРЫН ЦАГ АШИГЛАЛТЫН БАЙДАЛ /ДЭЛГЭРЭНГҮЙ/
                        </div>
                        <div id="divworkingtimeTab3Datatable" runat="server"></div>                                
                    </div>
                </div>
                <div id="workingtimeTab4" class="tab-pane fade">
                    <ul class="nav nav-tabs bordered">
                        <li id="workingtimeTab4t1Li" runat="server" onclick="pDatabindTabs(this)">
                            <a data-toggle="tab" href="#workingtimeTab4t1"><i class="fa fa-fw fa-lg fa-table"></i>Ирцийн тайлан /газраар/</a>
                        </li>
                        <li id="workingtimeTab4t2Li" runat="server" onclick="pDatabindTabs(this)" class="active">
                            <a data-toggle="tab" href="#workingtimeTab4t2"><i class="fa fa-fw fa-lg fa-table"></i>Ирцийн тайлан /ажилтанаар/</a>
                        </li>
                        <li id="workingtimeTab4t3Li" runat="server" onclick="pDatabindTabs(this)">
                            <a data-toggle="tab" href="#workingtimeTab4t3"><i class="fa fa-fw fa-lg fa-table"></i>Яамны ирцийн тайлан</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="workingtimeTab4t1" class="tab-pane">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div style="width:70%; float:left;">
                                        <div style="width:70px; float:left; margin-right:10px;"><select id="workingtimeTab4SelectMonth" name="workingtimeTab4SelectMonth" runat="server" class="form-control" style="padding:1px"><option value="1">1 сар</option><option value="2">2 сар</option><option value="3">3 сар</option><option value="4">4 сар</option><option value="5">5 сар</option><option value="6">6 сар</option><option value="7">7 сар</option><option value="8">8 сар</option><option value="9">9 сар</option><option value="10">10 сар</option><option value="11">11 сар</option><option value="12">12 сар</option></select></div>
                                        <div style="width:60px; float:left; margin-right:10px;"><select id="workingtimeTab4SelectYear" name="workingtimeTab4SelectYear" runat="server" class="form-control" style="padding:1px"><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option></select></div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divworkingtimeTab4', 'ИрцийнҮнэлгээГазар')">
                                            <i class="fa fa-file-word-o"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divworkingtimeTab4')">
                                            <i class="fa fa-print"></i>
                                        </a>
                                    </div> 
                                </div> 
                                <div id="loaderTab4" class="search-background">
                                    <label>
                                        <img width="64" height="" src="img/loading.gif"/>
                                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                    </label>
                                </div>                  
                                <div id="divworkingtimeTab4" runat="server" class="reports" style="margin:0 10px 10px 10px; width:100%;">                        
                                    <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        Яамны газруудын <label id="divworkingtimeTab4Year" runat="server" style="font-weight:bold;">0000</label> оны <label id="divworkingtimeTab4Month" runat="server" style="font-weight:bold;">00</label> -р сарын цаг ашиглалтын мэдээ
                                    </div>
                                    <div id="divworkingtimeTab4Datatable" runat="server" style="display:block;"></div>
                                    <div id="divworkingtimeTab4Chart" style="display:block;"></div>                              
                                </div>
                            </div>
                        </div>
                        <div id="workingtimeTab4t2" class="tab-pane active">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div style="width:70%; float:left;">
                                        <div style="width:50px; float:left; padding-top:5px;">Газар: </div>
                                        <div style="width:100px; float:left; margin-right:10px;"><select id="workingtimeTab4t2SelectBranchGazar" name="workingtimeTab4t2SelectBranchGazar" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                                        <div style="width:50px; float:left; padding-top:5px;">Хэлтэс: </div>
                                        <div style="width:100px; float:left; margin-right:10px;"><select disabled="disabled" id="workingtimeTab4t2SelectBranchHeltes" name="workingtimeTab4t2SelectBranchHeltes" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                                        <div style="width:60px; float:left; padding-top:5px;">Ажилтан: </div>
                                        <div style="width:200px; float:left; margin-right:10px;"><select disabled="disabled" id="workingtimeTab4t2SelectStaff" name="workingtimeTab4t2SelectStaff" runat="server" class="form-control" style="padding:1px"><option value="">Бүгд</option></select></div>
                                        <div style="width:60px; float:left; margin-right:10px;"><select id="workingtimeTab4t2SelectYear" name="workingtimeTab4t2SelectYear" runat="server" class="form-control" style="padding:1px"><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option></select></div>
                                        <div style="width:70px; float:left; margin-right:10px;"><select id="workingtimeTab4t2SelectMonth" name="workingtimeTab4t2SelectMonth" runat="server" class="form-control" style="padding:1px"><option value="1">1 сар</option><option value="2">2 сар</option><option value="3">3 сар</option><option value="4">4 сар</option><option value="5">5 сар</option><option value="6">6 сар</option><option value="7">7 сар</option><option value="8">8 сар</option><option value="9">9 сар</option><option value="10">10 сар</option><option value="11">11 сар</option><option value="12">12 сар</option></select></div>
                                        <div style="width:5px; float:left; margin-right:10px; text-align:center; margin-top: 7px;">-</div>
                                        <div style="width:70px; float:left; margin-right:10px;"><select id="workingtimeTab4t2SelectMonth2" name="workingtimeTab4t2SelectMonth2" runat="server" class="form-control" style="padding:1px"><option value="1">1 сар</option><option value="2">2 сар</option><option value="3">3 сар</option><option value="4">4 сар</option><option value="5">5 сар</option><option value="6">6 сар</option><option value="7">7 сар</option><option value="8">8 сар</option><option value="9">9 сар</option><option value="10">10 сар</option><option value="11">11 сар</option><option value="12">12 сар</option></select></div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divworkingtimeTab4t2', 'ИрцийнҮнэлгээАжилтан')">
                                            <i class="fa fa-file-word-o"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divworkingtimeTab4t2')">
                                            <i class="fa fa-print"></i>
                                        </a>
                                    </div> 
                                </div> 
                                <div id="loaderTab4t2" class="search-background">
                                    <label>
                                        <img width="64" height="" src="img/loading.gif"/>
                                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                    </label>
                                </div>                  
                                <div id="divworkingtimeTab4t2" runat="server" class="reports" style="margin:0 10px 10px 10px; width:100%;">           
                                    <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        <label id="divworkingtimeTab4t2Negj" runat="server" style="font-weight:bold;">0000</label> -Н ЦАГ АШИГЛАЛТЫН ДЭЛГЭРЭНГҮЙ
                                    </div>
                                    <div id="divworkingtimeTab4t2Datatable" runat="server"></div>                                
                                </div>
                            </div>
                        </div>
                        <div id="workingtimeTab4t3" class="tab-pane">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div style="width:70%; float:left;">
                                        <div style="width:60px; float:left; margin-right:10px;"><select id="workingtimeTab4t3SelectYear" name="workingtimeTab4t3SelectYear" runat="server" class="form-control" style="padding:1px"><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option></select></div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divworkingtimeTab4t3', 'ЯамныИрцийнТайлан')">
                                            <i class="fa fa-file-word-o"></i>
                                        </a>
                                        <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divworkingtimeTab4t3')">
                                            <i class="fa fa-print"></i>
                                        </a>
                                    </div> 
                                </div> 
                                <div id="loaderTab4t3" class="search-background">
                                    <label>
                                        <img width="64" height="" src="img/loading.gif"/>
                                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                    </label>
                                </div>                  
                                <div id="divworkingtimeTab4t3" runat="server" class="reports" style="margin:0 10px 10px 10px; width:100%;">                        
                                    <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        <label id="divworkingtimeTab4t3Year" runat="server" style="font-weight:bold;">0000</label> ОНЫ ЯАМНЫ ИРЦИЙН ТАЙЛАН
                                    </div>
                                    <div id="divworkingtimeTab4t3Datatable" runat="server" style="display:block;"></div>                            
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="workingtimeTab3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            
        </div>
    </div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        dataBindworkingtimeTab1Calendar();
    }
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    function pDatabindTabs(el) {
        if ($.trim($(el).attr('id')) == 'workingtimeTab1Li') {
            if (calendarSource == "") {
                dataBindworkingtimeTab1Calendar();
            }
        }
        else if ($.trim($(el).attr('id')) == 'workingtimeTab2Li') {
            if ($.trim($('#divworkingtimeTab2Datatable').html()) == "") {
                workingtimeTab2SetFirstControls();
            }
        }
        else if ($.trim($(el).attr('id')) == 'workingtimeTab3Li') {
            if ($.trim($('#divworkingtimeTab3Datatable').html()) == "") {
                workingtimeTab3SetFirstControls();
            }
        }
        else if ($.trim($(el).attr('id')) == 'workingtimeTab4Li') {
            if ($.trim($('#divworkingtimeTab4t2Datatable').html()) == "") {
                workingtimeTab4t2SetFirstControls();
            }
        }
        else if ($.trim($(el).attr('id')) == 'workingtimeTab4t1Li') {
            if ($.trim($('#divworkingtimeTab4Datatable').html()) == "") {
                dataBindTab4Datatable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'workingtimeTab4t2Li') {
            if ($.trim($('#divworkingtimeTab4t2Datatable').html()) == "") {
                workingtimeTab4t2SetFirstControls();
            }
        }
        else if ($.trim($(el).attr('id')) == 'workingtimeTab4t3Li') {
            if ($.trim($('#divworkingtimeTab4t3Datatable').html()) == "") {
                dataBindTab4t3Datatable();
            }
        }
    }
    //tab1
    var calendarSource = '';
    function dataBindworkingtimeTab1Calendar() {
        $('#workingtimeCalendar').html('');
        showLoader('loaderTab1');
        calendarSource = '../pg/dashboardStaffWorkingtimeCalendar.aspx?yr=' + $('#workingtimeTab1SelectYear').val() + '&mnth=' + $('#workingtimeTab1SelectMonth').val() + '&stid=' + '<%= Session["HRMIS_UserID"] %>';
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
            year: $('#workingtimeTab1SelectYear').val(),
            month: $('#workingtimeTab1SelectMonth').val() - 1,
            date: 1,
            events: calendarSource,
            eventRender: function (event, element, icon) {
                element.find('.fc-event-title').append("<br/><span class='ultra-light'>" + event.description + "</span>");
            },
            windowResize: function (event, ui) {
                $('#calendar').fullCalendar('render');
            },
            drop: function (date, allDay) { // this function is called when something is dropped
                var originalEventObject = $(this).data('eventObject');
                var copiedEventObject = $.extend({}, originalEventObject);
                copiedEventObject.start = date;
                copiedEventObject.allDay = allDay;
                $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
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
        var calendarNewSource = 'pg/workingtimecalendarjson.aspx?yr=' + $('#workingtimeTab1SelectYear').val() + '&mnth=' + $('#workingtimeTab1SelectMonth').val() + '&stid=' + '<%= Session["LM_UserID"] %>';
        $('#workingtimeCalendar').fullCalendar('removeEvents');
        $('#workingtimeCalendar').fullCalendar('removeEventSource', calendarSource);
        $('#workingtimeCalendar').fullCalendar('addEventSource', calendarNewSource);
        $('#workingtimeCalendar').fullCalendar('refetchEvents');
        calendarSource = calendarNewSource;
    }
    $("#workingtimeTab1SelectYear").change(function () {
        dataBindworkingtimeTab1Calendar();
    });
    $("#workingtimeTab1SelectMonth").change(function () {
        //dataBindworkingtimeTab1Calendar();
        $('#workingtimeCalendar').fullCalendar('gotoDate', $('#workingtimeTab1SelectYear option:selected').val() + '-' + $('#workingtimeTab1SelectMonth option:selected').text() + '-01');
        reloadCalendar();
    });

    //tab2
    function getURLParameter(url, name) {
        return (RegExp(name + '=' + '(.+?)(&|$)').exec(url) || [, null])[1];
    }
    function workingtimeTab2SetFirstControls() {
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
                $("#workingtimeTab2SelectBranchGazar").html(valData);
                $("#workingtimeTab2SelectBranchGazar").val(userGazarId);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                    data: '{"gazarId": "' + $("#workingtimeTab2SelectBranchGazar option:selected").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                        });
                        $("#workingtimeTab2SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);

                        if (!funcCheckRoles('1,5')) {
                            $('#workingtimeTab2SelectBranchGazar').prop('disabled', true);
                            if ($('#indexUserPosId').html() != '2010201' && $('#indexUserPosId').html() != '2010301') {
                                $('#workingtimeTab2SelectBranchHeltes').val(userHeltesId);
                                $('#workingtimeTab2SelectBranchHeltes').prop('disabled', true);
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../webservice/ServiceMain.svc/StaffListForDDL",
                                    data: '{"gazarId": "' + $("#workingtimeTab2SelectBranchGazar option:selected").val() + '", "heltesId":"' + $("#workingtimeTab2SelectBranchHeltes option:selected").val() + '"}',
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
                                        $("#workingtimeTab2SelectStaff").html('<option value="">Бүгд</option>' + valData);
                                        if (getURLParameter(window.location.href, 't') == 'staff') {
                                            $('#workingtimeTab2SelectStaff').val(userId);
                                            $('#workingtimeTab2SelectStaff').prop('disabled', false);
                                            dataBindTab2Datatable();
                                        }
                                        else {
                                            $('#workingtimeTab2SelectStaff').prop('disabled', false);
                                            dataBindTab2Datatable();
                                        }
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
                                $('#workingtimeTab2SelectStaff').html('<option value="">Бүгд</option>');
                                $('#workingtimeTab2SelectStaff').prop('disabled', true);
                                dataBindTab2Datatable();
                            }
                        }
                        else {
                            $('#workingtimeTab2SelectBranchGazar').prop('disabled', false);
                            $('#workingtimeTab2SelectBranchHeltes').prop('disabled', true);
                            $('#workingtimeTab2SelectStaff').html('<option value="">Бүгд</option>');
                            $('#workingtimeTab2SelectStaff').prop('disabled', true);
                            dataBindTab2Datatable();
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
    $("#workingtimeTab2SelectBranchGazar").change(function () {
        dataBindWorkingtimeTab2SelectBranchHeltes();
    });
    $("#workingtimeTab2SelectBranchHeltes").change(function () {
        dataBindWorkingtimeTab2SelectStaff();
    });
    $("#workingtimeTab2SelectStaff").change(function () {
        dataBindTab2Datatable();
    });
    $("#workingtimeTab2SelectYear").change(function () {
        workingtimeTab2SetFirstControls();
        $("#divworkingtimeTab2Year").text($("#workingtimeTab2SelectYear option:selected").val());
    });
    $("#workingtimeTab2SelectMonth, #workingtimeTab2SelectMonth2").change(function () {
        if (parseInt($('#workingtimeTab2SelectMonth option:selected').val()) > parseInt($('#workingtimeTab2SelectMonth2 option:selected').val())) alert('Эхлэх сар дуусах сараас бага буюу тэнцүү байна!');
        else {
            dataBindTab2Datatable();
        }
    });
    $("#workingtimeTab2Refresh").click(function () {
        dataBindTab2Datatable();
    });
    function dataBindWorkingtimeTab2SelectBranchHeltes() {
        var valData = '';
        if ($("#workingtimeTab2SelectBranchGazar option:selected").val() == "") {
            $("#workingtimeTab2SelectBranchHeltes").html("<option selected value=\"\">Бүгд</option>");
            $("#workingtimeTab2SelectBranchHeltes").prop("disabled", true);
            $("#workingtimeTab2SelectStaff").html("<option selected value=\"\">Бүгд</option>");
            $("#workingtimeTab2SelectStaff").prop("disabled", true);
            dataBindTab2Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                data: '{"gazarId": "' + $("#workingtimeTab2SelectBranchGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                    });
                    $("#workingtimeTab2SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);
                    $("#workingtimeTab2SelectBranchHeltes").prop("disabled", false);
                    dataBindTab2Datatable();
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
    function dataBindWorkingtimeTab2SelectStaff() {
        var valData = '', valOptGroup = '';
        if ($("#workingtimeTab2SelectBranchHeltes").val() == "") {
            $("#workingtimeTab2SelectStaff").html("<option selected value=\"\">Бүгд</option>");
            $("#workingtimeTab2SelectStaff").prop("disabled", true);
            dataBindTab2Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/StaffListForDDL",
                data: '{"gazarId": "' + $("#workingtimeTab2SelectBranchGazar option:selected").val() + '", "heltesId":"' + $("#workingtimeTab2SelectBranchHeltes option:selected").val() + '"}',
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
                    $("#workingtimeTab2SelectStaff").html('<option value="">Бүгд</option>' + valData);
                    $("#workingtimeTab2SelectStaff").prop("disabled", false);
                    dataBindTab2Datatable();
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
    function dataBindTab2Datatable() {
        var valData = '';
        var percolor = "", rowcolor = "";
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/WorkingtimeTab2Datatable",
            data: '{"yr":"' + $("#workingtimeTab2SelectYear option:selected").val() + '", "month":"' + $("#workingtimeTab2SelectMonth option:selected").val() + '", "month2":"' + $("#workingtimeTab2SelectMonth2 option:selected").val() + '", "gazar":"' + $("#workingtimeTab2SelectBranchGazar option:selected").val() + '", "heltes":"' + $("#workingtimeTab2SelectBranchHeltes option:selected").val() + '", "stid":"' + $("#workingtimeTab2SelectStaff option:selected").val() + '"}',
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
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажиллавал зохих хоног</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажилласан хоног</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Цаг ашиглалтын хувь</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (parseFloat(value.PER) >= 0 && parseFloat(value.PER) <= 49) { percolor = "bg-color-red"; rowcolor = " class=\"danger\""; }
                    else if (parseFloat(value.PER) >= 50 && parseFloat(value.PER) <= 79) { percolor = "bg-color-orange"; rowcolor = " class=\"warning\""; }
                    else if (parseFloat(value.PER) >= 80 && parseFloat(value.PER) <= 100) { percolor = "bg-color-greenLight"; rowcolor = " class=\"success\""; }
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.ROWNO + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.NEGJ + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.POS_NAME + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.STAFFNAME + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.WORKDAY + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.EVALWORKEDDAY + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\"><span class=\"badge " + percolor + "\">" + value.PER + " %</span></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                $("#divworkingtimeTab2Datatable").html(valData);
                if ($('#workingtimeTab2SelectMonth option:selected').val() == $('#workingtimeTab2SelectMonth2 option:selected').val()) $("#divworkingtimeTab2Month").text($("#workingtimeTab2SelectMonth option:selected").val());
                else $("#divworkingtimeTab2Month").text($("#workingtimeTab2SelectMonth option:selected").val() + ' - ' + $("#workingtimeTab2SelectMonth2 option:selected").val());
                if ($("#workingtimeTab2SelectStaff option:selected").val() == '') {
                    if ($("#workingtimeTab2SelectBranchHeltes option:selected").val() == '') {
                        if ($("#workingtimeTab2SelectBranchGazar option:selected").val() == '') $("#divworkingtimeTab2Level").text("СЯ-НЫ");
                        else $('#divworkingtimeTab2Level').html($('#workingtimeTab2SelectBranchGazar option:selected').text() + '-Н');
                    }
                    else $('#divworkingtimeTab2Level').html($('#workingtimeTab2SelectBranchGazar option:selected').text() + '-Н ' + $('#workingtimeTab2SelectBranchHeltes option:selected').text() + '-Н ');
                }
                else $('#divworkingtimeTab2Level').html($('#workingtimeTab2SelectBranchGazar option:selected').text() + '-Н ' + $('#workingtimeTab2SelectBranchHeltes option:selected').text() + '-Н ' + $('#workingtimeTab2SelectStaff option:selected').text() + '-Н ');
                hideLoader('loaderTab2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }

    //tab3
    function workingtimeTab3SetFirstControls() {
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
                $("#workingtimeTab3SelectBranchGazar").html(valData);
                $("#workingtimeTab3SelectBranchGazar").val(userGazarId);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                    data: '{"gazarId": "' + $("#workingtimeTab3SelectBranchGazar option:selected").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                        });
                        $("#workingtimeTab3SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);
                        if (!funcCheckRoles('1,5')) {
                            $('#workingtimeTab3SelectBranchGazar').prop('disabled', true);
                            if ($('#indexUserPosId').html() != '2010201' && $('#indexUserPosId').html() != '2010301') {
                                $('#workingtimeTab3SelectBranchHeltes').val(userHeltesId);
                                $('#workingtimeTab3SelectBranchHeltes').prop('disabled', true);
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../webservice/ServiceMain.svc/StaffListForDDL",
                                    data: '{"gazarId": "' + $("#workingtimeTab3SelectBranchGazar option:selected").val() + '", "heltesId":"' + $("#workingtimeTab3SelectBranchHeltes option:selected").val() + '"}',
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
                                        $("#workingtimeTab3SelectStaff").html('<option value="">Бүгд</option>' + valData);
                                        if (getURLParameter(window.location.href, 't') == 'staff') {
                                            $('#workingtimeTab3SelectStaff').val(userId);
                                            $('#workingtimeTab3SelectStaff').prop('disabled', false);
                                            dataBindTab3Datatable();
                                        }
                                        else {
                                            $('#workingtimeTab3SelectStaff').prop('disabled', false);
                                            dataBindTab3Datatable();
                                        }
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
                                $('#workingtimeTab3SelectStaff').html('<option value="">Бүгд</option>');
                                $('#workingtimeTab3SelectStaff').prop('disabled', true);
                                dataBindTab3Datatable();
                            }
                        }
                        else {
                            $('#workingtimeTab3SelectBranchGazar').prop('disabled', false);
                            $('#workingtimeTab3SelectBranchHeltes').prop('disabled', true);
                            $('#workingtimeTab3SelectStaff').html('<option value="">Бүгд</option>');
                            $('#workingtimeTab3SelectStaff').prop('disabled', true);
                            dataBindTab3Datatable();
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
    $("#workingtimeTab3SelectBranchGazar").change(function () {
        dataBindWorkingtimeTab3SelectBranchHeltes();
    });
    $("#workingtimeTab3SelectBranchHeltes").change(function () {
        dataBindWorkingtimeTab3SelectStaff();
    });
    $("#workingtimeTab3SelectStaff").change(function () {
        dataBindTab3Datatable();
    });
    $("#workingtimeTab3SelectYear").change(function () {
        workingtimeTab3SetFirstControls();
        $("#divworkingtimeTab3Year").text($("#workingtimeTab3SelectYear option:selected").val());
    });
    $("#workingtimeTab3SelectMonth, #workingtimeTab3SelectMonth2").change(function () {
        if (parseInt($('#workingtimeTab3SelectMonth option:selected').val()) > parseInt($('#workingtimeTab3SelectMonth2 option:selected').val())) alert('Эхлэх сар дуусах сараас бага буюу тэнцүү байна!');
        else {
            dataBindTab3Datatable();
        }
    });
    $("#workingtimeTab3Refresh").click(function () {
        dataBindTab3Datatable();
    });
    function dataBindWorkingtimeTab3SelectBranchHeltes() {
        var valData = '';
        if ($("#workingtimeTab3SelectBranchGazar option:selected").val() == "") {
            $("#workingtimeTab3SelectBranchHeltes").html("<option selected value=\"\">Бүгд</option>");
            $("#workingtimeTab3SelectBranchHeltes").prop("disabled", true);
            $("#workingtimeTab3SelectStaff").html("<option selected value=\"\">Бүгд</option>");
            $("#workingtimeTab3SelectStaff").prop("disabled", true);
            dataBindTab3Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                data: '{"gazarId":"' + $("#workingtimeTab3SelectBranchGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                    });
                    $("#workingtimeTab3SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);
                    $("#workingtimeTab3SelectBranchHeltes").prop("disabled", false);
                    dataBindTab3Datatable();
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
    function dataBindWorkingtimeTab3SelectStaff() {
        var valData = '', valOptGroup = '';
        if ($("#workingtimeTab3SelectBranchHeltes").val() == "") {
            $("#workingtimeTab3SelectStaff").html("<option selected value=\"\">Бүгд</option>");
            $("#workingtimeTab3SelectStaff").prop("disabled", true);
            dataBindTab3Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/StaffListForDDL",
                data: '{"gazarId":"' + $("#workingtimeTab3SelectBranchGazar option:selected").val() + '", "heltesId":"' + $('#workingtimeTab3SelectBranchHeltes option:selected').val() + '"}',
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
                    $("#workingtimeTab3SelectStaff").html('<option value="">Бүгд</option>' + valData);
                    $("#workingtimeTab3SelectStaff").prop("disabled", false);
                    dataBindTab3Datatable();
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
    function dataBindTab3Datatable() {
        var valData = '';
        var percolor = "", rowcolor = "";
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/WorkingtimeTab3Datatable",
            data: '{"yr":"' + $("#workingtimeTab3SelectYear option:selected").val() + '", "month":"' + $("#workingtimeTab3SelectMonth option:selected").val() + '", "month2":"' + $("#workingtimeTab3SelectMonth2 option:selected").val() + '", "gazar":"' + $("#workingtimeTab3SelectBranchGazar option:selected").val() + '", "heltes":"' + $("#workingtimeTab3SelectBranchHeltes option:selected").val() + '", "stid":"' + $("#workingtimeTab3SelectStaff option:selected").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table style=\"border: 1px solid #000; border-collapse: collapse; font: 10pt arial, sans-serif; width: 100%;\">";
                valData += "<thead style=\"background-color:C6D9F1;\">";
                valData += "<tr style=\"font-size:8pt;\">";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">#</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Газар нэгж</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Албан тушаал</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажилтаны нэр</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажиллавал зохих хоног</th>";
                valData += "<th colspan=\"4\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Үүнээс</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажилласан хоног</th>";
                valData += "<th colspan=\"5\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Үүнээс</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Үнэлгээт ажилласан хоног</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Цаг ашиглалтын хувь</th>";
                valData += "<th rowspan=\"2\" style=\"border: 1px solid #000; padding:5px; text-align:center;\">Дэлгэрэнгүй харах</th>";
                valData += "</tr>";
                valData += "<tr style=\"font-size:8pt;\">";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Чөлөө</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Өвчтэй</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ээлжийн амралттай</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Албан томилолттой</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Тасалсан хоног</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Хоцорсон минут</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Хоцорсон өдөр</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Эрт гарсан минут</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Орой гарсан минут</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (parseFloat(value.PER) >= 0 && parseFloat(value.PER) <= 49) { percolor = "bg-color-red"; rowcolor = " class=\"danger\""; }
                    else if (parseFloat(value.PER) >= 50 && parseFloat(value.PER) <= 79) { percolor = "bg-color-orange"; rowcolor = " class=\"warning\""; }
                    else if (parseFloat(value.PER) >= 80 && parseFloat(value.PER) <= 100) { percolor = "bg-color-greenLight"; rowcolor = " class=\"success\""; }
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.ROWNO + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.NEGJ + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.POS_NAME + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.STAFFNAME + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.WORKDAY + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.CHOLOODAYSUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.UWCHTEIDAYSUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.AMRALTDAYSUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.TOMILOLTDAYSUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.WORKEDAY + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.TASALSANDAYSUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.HOTSORSONMINUTESUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.HOTSORSONDAYSUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.ERTMINUTESUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.OROIMINUTESUM + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.EVALWORKEDDAY + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\"><span class=\"badge " + percolor + "\">" + value.PER + " %</span></td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\"><a href=\"../pg/workingtimestaff.aspx?yr=" + $("#workingtimeTab3SelectYear option:selected").val() + "&mnth=" + $("#workingtimeTab3SelectMonth option:selected").val() + "&mnth2=" + $("#workingtimeTab3SelectMonth2 option:selected").val() + "&stid=" + value.ST_ID + "&stname=" + value.POS_NAME.replace(' ', '%') + "%" + value.STAFFNAME + "\" class=\"btn btn-link btn-xs\" data-toggle=\"modal\" data-target=\"#workingtimeTab3Modal\" style=\"font-size:11px;\">Дэлгэрэнгүй харах</a></td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                $("#divworkingtimeTab3Datatable").html(valData);
                if ($('#workingtimeTab3SelectMonth option:selected').val() == $('#workingtimeTab3SelectMonth2 option:selected').val()) $("#divworkingtimeTab3Month").text($("#workingtimeTab3SelectMonth option:selected").val());
                else $("#divworkingtimeTab3Month").text($("#workingtimeTab3SelectMonth option:selected").val() + ' - ' + $("#workingtimeTab3SelectMonth2 option:selected").val());
                if ($("#workingtimeTab3SelectStaff option:selected").val() == '') {
                    if ($("#workingtimeTab3SelectBranchHeltes option:selected").val() == '') {
                        if ($("#workingtimeTab3SelectBranchGazar option:selected").val() == '') $("#divworkingtimeTab3Level").text("СЯ-НЫ");
                        else $('#divworkingtimeTab3Level').html($('#workingtimeTab3SelectBranchGazar option:selected').text() + '-Н');
                    }
                    else $('#divworkingtimeTab3Level').html($('#workingtimeTab3SelectBranchGazar option:selected').text() + '-Н ' + $('#workingtimeTab3SelectBranchHeltes option:selected').text() + '-Н ');
                }
                else $('#divworkingtimeTab3Level').html($('#workingtimeTab3SelectBranchGazar option:selected').text() + '-Н ' + $('#workingtimeTab3SelectBranchHeltes option:selected').text() + '-Н ' + $('#workingtimeTab3SelectStaff option:selected').text() + '-Н ');
                hideLoader('loaderTab3');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }

    //tab4
    $("#workingtimeTab4SelectYear").change(function () {
        dataBindTab4Datatable();
        $("#divworkingtimeTab4Year").text($("#workingtimeTab4SelectYear option:selected").val());
        $('#divworkingtimeTab4Chart').css("display", "none");
        $('#divworkingtimeTab4Datatable').css("display", "block");
    });
    $("#workingtimeTab4SelectMonth").change(function () {
        dataBindTab4Datatable();
        $("#divworkingtimeTab4Month").text($("#workingtimeTab4SelectMonth option:selected").val());
        $('#divworkingtimeTab4Chart').css("display", "none");
        $('#divworkingtimeTab4Datatable').css("display", "block");
    });
    function dataBindTab4Datatable() {
        var valData = '';
        var percolor = "", rowcolor = "";
        var workday = 0, cnt = 0;
        var workedday = 0, per = 0, point = 0;
        showLoader('loaderTab4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/WorkingtimeTab4Datatable",
            data: '{"yr":"' + $("#workingtimeTab4SelectYear option:selected").val() + '", "month":"' + $("#workingtimeTab4SelectMonth option:selected").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += "<table id=\"workingtimeTab4DatatableReal\" style=\"border: 1px solid #000; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                valData += "<thead style=\"background-color:C6D9F1;\">";
                valData += "<tr>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">#</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Газруудын нэр</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажиллавал зохих хоног</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Ажилласан хоног</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Цаг ашиглалтын хувь</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Оноо</th>";
                valData += "</tr>";
                valData += "</thead>";
                valData += "<tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (parseFloat(value.PER) >= 0 && parseFloat(value.PER) <= 49) { percolor = "bg-color-red"; rowcolor = " class=\"danger\""; }
                    else if (parseFloat(value.PER) >= 50 && parseFloat(value.PER) <= 79) { percolor = "bg-color-orange"; rowcolor = " class=\"warning\""; }
                    else if (parseFloat(value.PER) >= 80 && parseFloat(value.PER) <= 100) { percolor = "bg-color-greenLight"; rowcolor = " class=\"success\""; }
                    valData += "<tr>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.ROWNO + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px;\">" + value.BR_NAME + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.WORKDAY + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.EVALWORKEDDAY + "</td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\"><span class=\"badge " + percolor + "\">" + value.PER + " %</span></td>";
                    valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + value.PNT + "</td>";
                    valData += "</tr>";
                    workday += parseInt(value.WORKDAY);
                    workedday += parseFloat(value.EVALWORKEDDAY);
                    cnt++;
                    per += parseFloat(value.PER);
                    point += parseFloat(value.PNT);
                });
                if ((parseFloat(per) / parseFloat(cnt)).toFixed(2) >= 0 && (parseFloat(per) / parseFloat(cnt)).toFixed(2) <= 49) { percolor = "bg-color-red"; rowcolor = " class=\"danger\""; }
                else if ((parseFloat(per) / parseFloat(cnt)).toFixed(2) >= 50 && (parseFloat(per) / parseFloat(cnt)).toFixed(2) <= 79) { percolor = "bg-color-orange"; rowcolor = " class=\"warning\""; }
                else if ((parseFloat(per) / parseFloat(cnt)).toFixed(2) >= 80 && (parseFloat(per) / parseFloat(cnt)).toFixed(2) <= 100) { percolor = "bg-color-greenLight"; rowcolor = " class=\"success\""; }
                valData += "</tbody>";
                valData += "<tfoot style=\"background-color:C6D9F1;\">";
                valData += "<tr>";
                valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">&nbsp;</td>";
                valData += "<td style=\"border: 1px solid #000; padding:5px; font-weight:bold;\">Нийт</td>";
                valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + workday + "</td>";
                valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + workedday + "</td>";
                valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\"><span class=\"badge " + percolor + "\">" + (parseFloat(per) / parseFloat(cnt)).toFixed(2) + " %</span></td>";
                valData += "<td style=\"border: 1px solid #000; padding:5px; text-align:center;\">" + (parseFloat(per) / parseFloat(cnt)).toFixed(2) + "</td>";
                valData += "</tr>";
                valData += "</tfoot>";
                valData += "</table>";
                $("#divworkingtimeTab4Datatable").html(valData);
                dataBindTab4Datas();
                hideLoader('loaderTab4');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function dataBindTab4Datas() {

    }

    //tab4t2
    function workingtimeTab4t2SetFirstControls() {
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
                $("#workingtimeTab4t2SelectBranchGazar").html(valData);
                $("#workingtimeTab4t2SelectBranchGazar").val(userGazarId);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                    data: '{"gazarId": "' + $("#workingtimeTab4t2SelectBranchGazar option:selected").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        valData = '';
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                        });
                        $("#workingtimeTab4t2SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);
                        if (!funcCheckRoles('1,5')) {
                            $('#workingtimeTab4t2SelectBranchGazar').prop('disabled', true);
                            if ($('#indexUserPosId').html() != '2010201' && $('#indexUserPosId').html() != '2010301') {
                                $('#workingtimeTab4t2SelectBranchHeltes').val(userHeltesId);
                                $('#workingtimeTab4t2SelectBranchHeltes').prop('disabled', true);
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "../webservice/ServiceMain.svc/StaffListForDDL",
                                    data: '{"gazarId": "' + $("#workingtimeTab4t2SelectBranchGazar option:selected").val() + '", "heltesId":"' + $("#workingtimeTab4t2SelectBranchHeltes option:selected").val() + '"}',
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
                                        $("#workingtimeTab4t2SelectStaff").html('<option value="">Бүгд</option>' + valData);
                                        if (getURLParameter(window.location.href, 't') == 'staff') {
                                            $('#workingtimeTab4t2SelectStaff').val(userId);
                                            $('#workingtimeTab4t2SelectStaff').prop('disabled', false);
                                            dataBindTab4t2Datatable();
                                        }
                                        else {
                                            $('#workingtimeTab4t2SelectStaff').prop('disabled', false);
                                            dataBindTab4t2Datatable();
                                        }
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
                                $('#workingtimeTab4t2SelectStaff').html('<option value="">Бүгд</option>');
                                $('#workingtimeTab4t2SelectStaff').prop('disabled', true);
                                dataBindTab4t2Datatable();
                            }
                        }
                        else {
                            $('#workingtimeTab4t2SelectBranchGazar').prop('disabled', false);
                            $('#workingtimeTab4t2SelectBranchHeltes').prop('disabled', true);
                            $('#workingtimeTab4t2SelectStaff').html('<option value="">Бүгд</option>');
                            $('#workingtimeTab4t2SelectStaff').prop('disabled', true);
                            dataBindTab4t2Datatable();
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
    $("#workingtimeTab4t2SelectBranchGazar").change(function () {
        var valData = '';
        if ($("#workingtimeTab4t2SelectBranchGazar option:selected").val() == "") {
            $("#workingtimeTab4t2SelectBranchHeltes").html("<option value=\"\">Бүгд</option>");
            $("#workingtimeTab4t2SelectBranchHeltes").prop("disabled", true);
            $("#workingtimeTab4t2SelectStaff").html("<option value=\"\">Бүгд</option>");
            $("#workingtimeTab4t2SelectStaff").prop("disabled", true);
            dataBindTab4t2Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                data: '{"gazarId":"' + $("#workingtimeTab4t2SelectBranchGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    valData = '';
                    $($.parseJSON(data.d)).each(function (index, value) {
                        valData += '<option value="' + value.ID + '" title="' + value.NAME + '">' + value.INITNAME + '</option>';
                    });
                    $("#workingtimeTab4t2SelectBranchHeltes").html('<option value="">Бүгд</option>' + valData);
                    $("#workingtimeTab4t2SelectBranchHeltes").prop("disabled", false);
                    dataBindTab4t2Datatable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#workingtimeTab4t2SelectBranchHeltes").change(function () {
        var valData = '', valOptGroup = '';
        if ($("#workingtimeTab4t2SelectBranchHeltes").val() == "") {
            $("#workingtimeTab4t2SelectStaff").html("<option value=\"\">Бүгд</option>");
            $("#workingtimeTab4t2SelectStaff").prop("disabled", true);
            dataBindTab4t2Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/StaffListForDDL",
                data: '{"gazarId": "' + $("#workingtimeTab4t2SelectBranchGazar option:selected").val() + '", "heltesId":"' + $("#workingtimeTab4t2SelectBranchHeltes option:selected").val() + '"}',
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
                    $("#workingtimeTab4t2SelectStaff").html('<option value="">Бүгд</option>' + valData);
                    $("#workingtimeTab4t2SelectStaff").prop("disabled", false);
                    dataBindTab4t2Datatable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#workingtimeTab4t2SelectStaff, #workingtimeTab4t2SelectMonth, #workingtimeTab4t2SelectMonth2").change(function () {
        dataBindTab4t2Datatable();
    });
    $("#workingtimeTab4t2SelectYear").change(function () {
        workingtimeTab4t2SetFirstControls();
    });
    function dataBindTab4t2Datatable() {
        var valData = '';
        showLoader('loaderTab4t2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/WorkingtimeTab4t2Datatable",
            data: '{"yr":"' + $("#workingtimeTab4t2SelectYear option:selected").val() + '", "month":"' + $("#workingtimeTab4t2SelectMonth option:selected").val() + '", "month2":"' + $("#workingtimeTab4t2SelectMonth2 option:selected").val() + '", "gazar":"' + $("#workingtimeTab4t2SelectBranchGazar option:selected").val() + '", "heltes":"' + $("#workingtimeTab4t2SelectBranchHeltes option:selected").val() + '", "stid":"' + $("#workingtimeTab4t2SelectStaff option:selected").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#divworkingtimeTab4t2Datatable").html(data.d);
                if ($('#workingtimeTab4t2SelectStaff option:selected').val() != '') {
                    if ($('#workingtimeTab4t2SelectBranchGazar option:selected').val() == $('#workingtimeTab4t2SelectBranchHeltes option:selected').val()) {
                        $('#divworkingtimeTab4t2Negj').html($('#workingtimeTab4t2SelectBranchGazar option:selected').text() + '-Н АЖИЛТАН ' + $('#workingtimeTab4t2SelectStaff option:selected').text());
                    }
                    else {
                        $('#divworkingtimeTab4t2Negj').html($('#workingtimeTab4t2SelectBranchGazar option:selected').text() + '-' + $('#workingtimeTab4t2SelectBranchHeltes option:selected').text() + ' -Н АЖИЛТАН ' + $('#workingtimeTab4t2SelectStaff option:selected').text());
                    }
                }
                else if ($('#workingtimeTab4t2SelectBranchHeltes option:selected').val() != '') {
                    if ($('#workingtimeTab4t2SelectBranchGazar option:selected').val() == $('#workingtimeTab4t2SelectBranchHeltes option:selected').val()) {
                        $('#divworkingtimeTab4t2Negj').html($('#workingtimeTab4t2SelectBranchGazar option:selected').text());
                    }
                    else {
                        $('#divworkingtimeTab4t2Negj').html($('#workingtimeTab4t2SelectBranchGazar option:selected').text() + '-' + $('#workingtimeTab4t2SelectBranchHeltes option:selected').text());
                    }
                }
                else {
                    $('#divworkingtimeTab4t2Negj').html($('#workingtimeTab4t2SelectBranchGazar option:selected').text());
                }
                hideLoader('loaderTab4t2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }

    //tab4t3
    $("#workingtimeTab4t3SelectYear").change(function () {
        dataBindTab4t3Datatable();
        $("#divworkingtimeTab4t3Year").text($("#workingtimeTab4t3SelectYear option:selected").val());
        $('#divworkingtimeTab4t3Datatable').css("display", "block");
    });
    function dataBindTab4t3Datatable() {
        var valData = '', iCnt = 1;
        var valSumMonthPer = 0, valCntMonthPer = 0;
        showLoader('loaderTab4t3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/WorkingtimeTab4t3Datatable",
            data: '{"yr":"' + $("#workingtimeTab4t3SelectYear option:selected").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                iCnt = 1;
                valSumMonthPer = 0, valCntMonthPer = 0;
                valData = "<table style=\"border: 1px solid #000; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\"><thead style=\"background-color:C6D9F1;\"><tr>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; width:1%;\">#</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; width:25%;\">Газар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">1 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">2 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">3 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">4 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">5 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">6 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">7 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">8 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">9 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">10 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">11 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">12 сар</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Жилийн дундаж</th>";
                valData += "</tr></thead><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + iCnt + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:left; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.GAZAR_NAME + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Jan + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Feb + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Mar + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Apr + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.May + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Jun + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Jul + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Aug + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Sep + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Oct + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Nov + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">" + value.Dec + "</td>";
                    if (value.Jan != '') {
                        valSumMonthPer += parseFloat(value.Jan);
                        valCntMonthPer++;
                    }
                    if (value.Feb != '') {
                        valSumMonthPer += parseFloat(value.Feb);
                        valCntMonthPer++;
                    }
                    if (value.Mar != '') {
                        valSumMonthPer += parseFloat(value.Mar);
                        valCntMonthPer++;
                    }
                    if (value.Apr != '') {
                        valSumMonthPer += parseFloat(value.Apr);
                        valCntMonthPer++;
                    }
                    if (value.May != '') {
                        valSumMonthPer += parseFloat(value.May);
                        valCntMonthPer++;
                    }
                    if (value.Jun != '') {
                        valSumMonthPer += parseFloat(value.Jun);
                        valCntMonthPer++;
                    }
                    if (value.Jul != '') {
                        valSumMonthPer += parseFloat(value.Jul);
                        valCntMonthPer++;
                    }
                    if (value.Aug != '') {
                        valSumMonthPer += parseFloat(value.Aug);
                        valCntMonthPer++;
                    }
                    if (value.Sep != '') {
                        valSumMonthPer += parseFloat(value.Sep);
                        valCntMonthPer++;
                    }
                    if (value.Oct != '') {
                        valSumMonthPer += parseFloat(value.Oct);
                        valCntMonthPer++;
                    }
                    if (value.Nov != '') {
                        valSumMonthPer += parseFloat(value.Nov);
                        valCntMonthPer++;
                    }
                    if (value.Dec != '') {
                        valSumMonthPer += parseFloat(value.Dec);
                        valCntMonthPer++;
                    }
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; font-size:12px !important;  padding:5px;\">";
                    if (valCntMonthPer != 0) valData += (valSumMonthPer / valCntMonthPer).toFixed(2);;
                    valData += "</td>";
                    valData += "</tr>";
                    iCnt++;
                    valSumMonthPer = 0, valCntMonthPer = 0;
                });
                valData += "</tbody>";
                valData += "</table>";
                $("#divworkingtimeTab4t3Datatable").html(valData);
                hideLoader('loaderTab4t3');
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


