<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="amralt.aspx.cs" Inherits="HRWebApp.pg.amralt" %>
<style>
    .stafflistimage {
        width: 25px;
        border-radius: 0;
    }
</style>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa-fw fa fa-home"></i> > Ээлжийн амралт
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" runat="server" class="active" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab1">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Төлөвлөлт
                    </a>
                </li>
                <li id="pTab2Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab2">
                        <i class="fa fa-fw fa-lg fa-file-text"></i>
                        Тайлан 
                    </a>
                </li>
            </ul>
            <div id="pTabContent" class="tab-content">
                <div id="pTab1" runat="server" class="tab-pane active">
                    <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"> 
                                <i class="fa fa-table"></i> 
                            </span>
                            <h2> Ээлжийн амралтын хүсэлтийн бүртгэл </h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:205px; top:8px; z-index:5; margin-top:1px;">
                                <button id="pTab1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Амралт хүсэх</button>
                            </div>
                            <div class="Colvis TableTools" style="width:200px; right:280px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectStaff" name="pTab1SelectStaff" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:485px; top:4px; z-index:5; margin-top:7px;"><label>Ажилтан:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:550px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectHeltes" name="pTab1SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:635px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                            <div class="Colvis TableTools" style="width:80px; right:690px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectGazar" name="pTab1SelectGazar" runat="server" class="form-control" style="padding: 1px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:775px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                            <div class="Colvis TableTools" style="width:60px; right:825px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectYear" name="pTab1SelectYear" runat="server" class="form-control" style="padding: 1px;">
                                    <option value="">- Сонго -</option>
						        </select>
                            </div>
                            <div id="loaderTab1" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab1Table" class="widget-body no-padding">
                        
                            </div>
                        </div>
                    </div>
                </div>
                <div id="pTab2" runat="server" class="tab-pane">
                    <ul class="nav nav-tabs bordered">
                        <li id="pTab2t1Li" runat="server" onclick="pDatabindTabs(this)" class="active">
                            <a data-toggle="tab" href="#pTab2t1"><i class="fa fa-fw fa-lg fa-file-text"></i>Ерөнхий тайлан</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="pTab2t1" class="tab-pane active">
                            <div style="display: block; overflow: hidden;">
                                <div style="margin:10px 10px 10px 10px; display:block; overflow:hidden;">
                                    <div style="width:70%; float:left;">
                                        <div style="width:60px; float:left; margin-right:10px;">
                                            <select id="pTab2t1SelectYear" runat="server" class="form-control" style="padding:1px">
                                                <option>2014</option>
                                                <option>2015</option>
                                                <option>2016</option>
                                                <option>2017</option>
                                                <option>2018</option>
                                                <option>2019</option>
                                                <option>2020</option>
                                                <option>2021</option>
                                            </select>
                                        </div>
                                        <div style="width:67px; float:left; margin-right:10px; line-height: 15px; text-align: right;">Газар:</div>
                                        <div style="width:80px; float:left; margin-right:10px;">
                                            <select id="pTab2t1SelectGazar" runat="server" class="form-control" style="padding:1px">
                                                <option value="">Бүгд</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div style="text-align:right; width:30%; float:left;">
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="
                                                ('#divpTab2t1', 'ЭэлжинАмралт-ЕрөнхийТайлан')">
                                                <i class="fa fa-file-word-o"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab2t1')">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div id="loaderTab2t1" class="search-background">
                                    <img width="64" height="" src="img/loading.gif"/>
                                    <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                </div>
                                <div id="divpTab2t1" class="reports" style="margin:0 10px 10px 10px;">
                                    <div style="text-align: center; font-weight: bold; font: 11pt arial, sans-serif; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                        ЭЭЛЖИЙН АМРАЛТЫН ЕРӨНХИЙ ТАЙЛАН
                                    </div>
                                    <div style="text-align: right; font-weight: normal; font: 11pt arial, sans-serif; padding-bottom: 5px; text-transform: lowercase; line-height: 20px; font-style:italic;">
                                        (<label id="pTab2t1Year" runat="server">0000</label> он)
                                    </div>
                                    <div id="divBindTab2t1Table"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Ээлжийн амралтын хүсэлт&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" runat="server" class="hide"></div>
                    <div id="pTab2HolidayStr" runat="server" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Хүсэлт гаргагч</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-1">
                                    <img id="pTab1ModalImage" runat="server" src="../img/avatars/male.png" style="height:52px;">
                                </div>
                                <div id="pTab1ModalDivStaffDet" runat="server" class="col-md-10">
                                    
                                </div>
                            </div>
                            <div class="row">
                                <div id="pTab1ModalDaynumDiv" runat="server" class="col-md-12">
                                    
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Эхлэх огноо</label>
                                    <input id="pTab1ModalInputBeginDt" name="pTab1ModalInputBeginDt" type="text" class="form-control" placeholder="Эхлэх огноо" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Амрах хоног</label>
                                    <select id="pTab1ModalSelectDaynum" name="pTab1ModalSelectDaynum" runat="server" class="form-control" style="padding: 5px;" disabled="disabled">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Дуусах огноо</label>
                                    <input id="pTab1ModalInputEndDt" name="pTab1ModalInputEndDt" type="text" class="form-control" placeholder="Дуусах огноо" disabled="disabled" />
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Биеэр эдлэх</label>
                                    <div class="checkbox no-margin">
										<label>
											<input id="pTab1ModalInputIsbody" name="pTab1ModalInputIsbody" type="checkbox" class="checkbox style-0">
											<span>Биеэр эдлэх</span>
										</label>
									</div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Тайлбар</label>
                                    <input id="pTab1ModalInputDescription" name="pTab1ModalInputDescription" type="text" class="form-control" placeholder="Тайлбар" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
	</div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        //var enddate = new Date(2014, 9, 22);
        //alert(new Date(2014, 9, 22));
        //enddate.setDate(enddate.getDate() + (AddBusinessDays(22, new Date(2014, 9, 22)) - 1));
        //alert(enddate);

        //alert(enddate.getFullYear().toString() + '-' + ((enddate.getMonth() + 1).toString()[1] ? (enddate.getMonth() + 1).toString() : "0" + (enddate.getMonth() + 1).toString()[0]) + '-' + (enddate.getDate().toString()[1] ? enddate.getDate().toString() : "0" + enddate.getDate().toString()[0]));
        //alert(enddate);
        //alert((AddBusinessDays(15, enddate) - 3));
        //alert(enddate.getDate() + ' - ' + (AddBusinessDays(15, enddate) - 3));
        //enddate.setDate(enddate.getDate() + (AddBusinessDays(15, enddate)-3));
        //alert(enddate);
        var userGazarId = $('#indexUserGazarId').text();
        var userHeltesId = $('#indexUserHeltesId').text();
        var userPosId = $('#indexUserPosId').text();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/gazarListForDDL",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1SelectGazar").html(msg.d);
                $("#pTab2t1SelectGazar").html(msg.d);
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/checkRoles",
                    data: '{stid:"' + $('#indexUserId').text() + '", roles:"1,7"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d == '0') {
                            $('#pTab1SelectGazar').val(userGazarId);
                            $('#pTab1SelectGazar').prop('disabled', true);
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/heltesListForDDL",
                                data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    $("#pTab1SelectHeltes").html(msg.d);
                                    if (userPosId != '2010201') {
                                        $('#pTab1SelectHeltes').val(userHeltesId);
                                        $('#pTab1SelectHeltes').prop('disabled', true);
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "ws.aspx/staffListForDDL",
                                            data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '", heltesId:"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (msg) {
                                                $("#pTab1SelectStaff").html(msg.d);
                                                if (userPosId != '2010301') {
                                                    $('#pTab1SelectStaff').val($('#indexUserId').text());
                                                    $('#pTab1SelectStaff').prop('disabled', true);
                                                    dataBindTab1Datatable();
                                                }
                                                else {
                                                    $('#pTab1SelectStaff').prop('disabled', false);
                                                    dataBindTab1Datatable();
                                                }
                                            },
                                            failure: function (response) {
                                                alert('FAILURE: ' + response.d);
                                            },
                                            error: function (xhr, status, error) {
                                                var err = eval("(" + xhr.responseText + ")");
                                                if (err.Message == 'SessionDied') window.location = '../login';
                                                else window.location = '../#pg/error500.aspx';
                                            }
                                        });
                                    }
                                    else dataBindTab1Datatable();
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    if (err.Message == 'SessionDied') window.location = '../login';
                                    else window.location = '../#pg/error500.aspx';
                                }
                            });
                        }
                        else dataBindTab1Datatable();
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    };
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
                dataBindTab1Datatable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divBindTab2t1Table').html()) == "") {
                dataBindTab2t1Datatable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2t1Li') {
            if ($.trim($('#divBindTab2t1Table').html()) == "") {
                dataBindTab2t1Datatable();
            }
        }
    }
    //tab1
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/amralt_amraltTab1Datatable",
            data: '{currstaffid:"' + $('#indexUserId').text() + '", gazar:"' + $('#pTab1SelectGazar option:selected').val() + '", heltes:"' + $('#pTab1SelectHeltes option:selected').val() + '", staffid:"' + $('#pTab1SelectStaff option:selected').val() + '", yr:"' + $('#pTab1SelectYear option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                hideLoader('loaderTab1');
                $("#divBindTab1Table").html(msg.d);
               
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').text('');
            $('#pTab1ModalInputBeginDt').val('');
            $('#pTab1ModalSelectDaynum').val('');
            $('#pTab1ModalSelectDaynum').prop('disabled', true);
            $('#pTab1ModalInputEndDt').val('');
            $('#pTab1ModalInputIsbody').prop('checked', false);
            $('#pTab1ModalInputDescription').val('');
        }
        else {
            $('#pTab1ID').text($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1ModalInputBeginDt').val($(el).closest('tr').find('td:eq(4)').html().split('<br>')[0]);
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteScalar",
                data: '{qry:"SELECT (15+(SELECT CASE WHEN 6 > YRCNT THEN 0 WHEN 6 <= YRCNT AND 11 > YRCNT THEN 3 WHEN 11 <= YRCNT AND 16 > YRCNT THEN 5 WHEN 16 <= YRCNT AND 21 > YRCNT THEN 7 WHEN 21 <= YRCNT AND 26 > YRCNT THEN 9 WHEN 26 <= YRCNT AND 32 > YRCNT THEN 11 WHEN 32 <= YRCNT THEN 14 END as NEMEGDEL_DAY FROM ( SELECT SUM(YRCNT) as YRCNT FROM ( SELECT NVL(ROUND(SUM(ROUND(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\')+1))/365),0) as YRCNT FROM ST_EXPHISTORY a WHERE a.ISSOCINS=1 AND a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' UNION ALL SELECT NVL(ROUND(SUM(ROUND(NVL(TO_DATE(a.ENDDT,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.DT,\'YYYY-MM-DD\')+1))/365),0) as YRCNT FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID WHERE b.ACTIVE=1 AND a.POS_ID!=2020102 AND a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ')))) - NVL((SELECT SUM((TRUNC(TO_DATE(ENDDT,\'YYYY-MM-DD\')) - TRUNC(TO_DATE(BEGINDT,\'YYYY-MM-DD\')) ) +1 - ((((TRUNC(TO_DATE(ENDDT,\'YYYY-MM-DD\'),\'D\'))-(TRUNC(TO_DATE(BEGINDT,\'YYYY-MM-DD\'),\'D\')))/7)*2) - (CASE WHEN TO_CHAR(TO_DATE(BEGINDT,\'YYYY-MM-DD\'),\'DY\',\'nls_date_language=english\')=\'SUN\' THEN 1 ELSE 0 END) - (CASE WHEN TO_CHAR(TO_DATE(ENDDT,\'YYYY-MM-DD\'),\'DY\',\'nls_date_language=english\')=\'SAT\' THEN 1 ELSE 0 END)) as BUSDAYS FROM ST_AMRALT WHERE STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' AND TO_NUMBER(TO_CHAR(TO_DATE(ENDDT,\'YYYY-MM-DD\'),\'YYYY\'))=' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + ' AND ID!=' + $(el).closest('tr').find('td:eq(0)').text() + '),0) as ULDSEN_DAY FROM DUAL"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var valSelectItems = '<option value="">- Сонго -</option>';
                    for (var i = 1; i <= parseInt(msg.d) ; i++) {
                        valSelectItems += "<option>" + i + "</option>";
                    }
                    $('#pTab1ModalSelectDaynum').html(valSelectItems);
                    $('#pTab1ModalSelectDaynum').prop('disabled', false);
                    $('#pTab1ModalSelectDaynum').val($(el).closest('tr').find('td:eq(5)').text());
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login';
                    else window.location = '../#pg/error500.aspx';
                }
            });
            $('#pTab1ModalInputEndDt').val($(el).closest('tr').find('td:eq(4)').html().split('<br>')[1]);
            if ($.trim($(el).closest('tr').find('td:eq(6)').text()) == 'Биеэр эдлэнэ') $('#pTab1ModalInputIsbody').prop('checked', true);
            else $('#pTab1ModalInputIsbody').prop('checked', false);
            $('#pTab1ModalInputDescription').val($(el).closest('tr').find('td:eq(7)').text());
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мэдээллийг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_AMRALT WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        smallBox('Сонгосон ээлжийн амралт', 'Амжилттай устгагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $("#pTab1SelectGazar").change(function () {
        if ($("#pTab1SelectGazar option:selected").val() == "") {
            $("#pTab1SelectHeltes").html("<option selected value=\"\">- Бүгд -</option>");
            $("#pTab1SelectHeltes").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/heltesListForDDL",
                data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1SelectHeltes").html(msg.d);
                    $("#pTab1SelectHeltes").prop("disabled", false);
                    dataBindTab1Datatable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#pTab1SelectHeltes").change(function () {
        if ($("#pTab1SelectHeltes option:selected").val() == "") {
            $("#pTab1SelectStaff").html("<option selected value=\"\">- Бүгд -</option>");
            $("#pTab1SelectStaff").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/staffListForDDL",
                data: '{gazarId:"' + $("#pTab1SelectGazar option:selected").val() + '", heltesId:"' + $("#pTab1SelectHeltes option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1SelectStaff").html(msg.d);
                    $("#pTab1SelectStaff").prop("disabled", false);
                    dataBindTab1Datatable();
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#pTab1SelectStaff").change(function () {
        dataBindTab1Datatable();
    });
    $("#pTab1SelectYear").change(function () {
        dataBindTab1Datatable();
    });
    $("#pTab1ModalSelectDaynum").change(function () {
        if ($("#pTab1ModalSelectDaynum option:selected").val() == "") {
            $("#pTab1ModalInputEndDt").val('');
        }
        else {
            var enddate = new Date(parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0]), (parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[1]) - 1), parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[2]));
            enddate.setDate(enddate.getDate() + (AddBusinessDays(parseInt($("#pTab1ModalSelectDaynum option:selected").val()), new Date(parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0]), (parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[1]) - 1), parseInt($.trim($('#pTab1ModalInputBeginDt').val()).split('-')[2]))) - 1));
            $("#pTab1ModalInputEndDt").val(enddate.getFullYear().toString() + '-' + ((enddate.getMonth() + 1).toString()[1] ? (enddate.getMonth() + 1).toString() : "0" + (enddate.getMonth() + 1).toString()[0]) + '-' + (enddate.getDate().toString()[1] ? enddate.getDate().toString() : "0" + enddate.getDate().toString()[0]));
        }
    });
    $("#pTab1ModalInputBeginDt").change(function () {
        $("#pTab1ModalSelectDaynum").val('');
        $("#pTab1ModalInputEndDt").val('');
    });
    $('#pTab1ModalInputBeginDt').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        onSelect: function (selectedDate) {
            var valData = 0;
            $("#pTab1ModalInputEndDt").val('');
            if ($.trim($('#pTab1ModalInputBeginDt').val()) != '') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/AmraltTab1GetAmraltDays",
                    data: '{"yr":"' + $('#pTab2t1SelectYear option:selected').val() + '", "staffid":"' + $.trim($('#indexUserId').html()) + '"}',
                    //url: "ws.aspx/WSOracleExecuteScalar",
                    //data: '{qry:"SELECT ( 15+( SELECT CASE WHEN 6 > YRCNT THEN 0 WHEN 6 <= YRCNT AND 11 > YRCNT THEN 3 WHEN 11 <= YRCNT AND 16 > YRCNT THEN 5 WHEN 16 <= YRCNT AND 21 > YRCNT THEN 7 WHEN 21 <= YRCNT AND 26 > YRCNT THEN 9 WHEN 26 <= YRCNT AND 32 > YRCNT THEN 11 WHEN 32 <= YRCNT THEN 14 END as NEMEGDEL_DAY FROM( SELECT SUM(YRCNT) as YRCNT FROM( SELECT ROUND(SUM(TOTALTM)/365,1) as YRCNT FROM ( SELECT SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' + $.trim($('#indexUserId').html()) + ' ) UNION ALL SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' + $.trim($('#indexUserId').html()) + ' ) WHERE ISGOV=1 UNION ALL SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' + $.trim($('#indexUserId').html()) + ') WHERE ISMYORG=1))) ) ) - NVL((SELECT SUM((TRUNC(TO_DATE(ENDDT,\'YYYY-MM-DD\')) - TRUNC(TO_DATE(BEGINDT,\'YYYY-MM-DD\')) ) +1 - ((((TRUNC(TO_DATE(ENDDT,\'YYYY-MM-DD\'),\'D\'))-(TRUNC(TO_DATE(BEGINDT,\'YYYY-MM-DD\'),\'D\')))/7)*2) - (CASE WHEN TO_CHAR(TO_DATE(BEGINDT,\'YYYY-MM-DD\'),\'DY\',\'nls_date_language=english\')=\'SUN\' THEN 1 ELSE 0 END) - (CASE WHEN TO_CHAR(TO_DATE(ENDDT,\'YYYY-MM-DD\'),\'DY\',\'nls_date_language=english\')=\'SAT\' THEN 1 ELSE 0 END)) as BUSDAYS FROM ST_AMRALT WHERE STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' AND TO_NUMBER(TO_CHAR(TO_DATE(ENDDT,\'YYYY-MM-DD\'),\'YYYY\'))=' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + '),0) as ULDSEN_DAY FROM DUAL"}',
                    //data: '{qry:"SELECT ( 15+( SELECT CASE WHEN 6 > YRCNT THEN 0 WHEN 6 <= YRCNT AND 11 > YRCNT THEN 3 WHEN 11 <= YRCNT AND 16 > YRCNT THEN 5 WHEN 16 <= YRCNT AND 21 > YRCNT THEN 7 WHEN 21 <= YRCNT AND 26 > YRCNT THEN 9 WHEN 26 <= YRCNT AND 32 > YRCNT THEN 11 WHEN 32 <= YRCNT THEN 14 END as NEMEGDEL_DAY FROM( SELECT SUM(YRCNT) as YRCNT FROM( SELECT ROUND(SUM(TOTALTM)/365,1) as YRCNT FROM ( SELECT SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' + $.trim($('#indexUserId').html()) + ' ) UNION ALL SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' + $.trim($('#indexUserId').html()) + ' ) WHERE ISGOV=1 UNION ALL SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG FROM ( SELECT SUM(NVL(TO_DATE(a.TODATE,\'YYYY-MM-DD\'),SYSDATE)-TO_DATE(a.FROMDATE,\'YYYY-MM-DD\') + 1) as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' GROUP BY b.ISGOV UNION ALL SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, \'YYYY-MM-DD\'), SYSDATE) - TO_DATE(a.DT, \'YYYY-MM-DD\') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = ' + $.trim($('#indexUserId').html()) + ') WHERE ISMYORG=1))) ) ) - ( SELECT COUNT(a.STAFFS_ID) as AMRALTDAY FROM ( SELECT a.STAFFS_ID, a.BEGINDT||\' - \'||a.ENDDT as TM, b.DT FROM ST_AMRALT a INNER JOIN ( SELECT a.DT FROM ( SELECT DT FROM ( SELECT DT FROM( SELECT(TO_DATE(\'' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + '-01-01\', \'yyyy-mm-dd\') - 1) + ROWNUM DT FROM DUAL CONNECT BY LEVEL <= (LAST_DAY(TO_DATE(\'' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + '-12-01\', \'yyyy-mm-dd\')) + 1) - TO_DATE(\'' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + '-01-01\', \'yyyy-mm-dd\') ) WHERE MOD(TO_CHAR(DT, \'J\'), 7) + 1 IN(1, 2, 3, 4, 5) UNION ALL SELECT TO_DATE(HOLDATE, \'YYYY-MM-DD\') as DT FROM hrdbuser.ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, \'YYYY-MM-DD\'), \'YYYY\')) = ' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + ' ) GROUP BY DT ) a LEFT JOIN ( SELECT DT FROM ( SELECT TO_DATE(\'' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + '-\' || HOLMONTH || \'-\' || HOLDAY, \'YYYY-MM-DD\') as DT FROM hrdbuser.ST_HOLIDAYOFFICIAL UNION ALL SELECT TO_DATE(HOLDATE, \'YYYY-MM-DD\') as DT FROM hrdbuser.ST_HOLIDAYUNOFFICIAL WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, \'YYYY-MM-DD\'), \'YYYY\')) = ' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + ' ) GROUP BY DT ) b ON a.DT=b.DT WHERE b.DT IS NULL ) b ON TO_DATE(a.BEGINDT, \'yyyy-mm-dd\') <= b.DT AND TO_DATE(a.ENDDT, \'yyyy-mm-dd\') >= b.DT WHERE TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDT,\'YYYY-MM-DD\'),\'YYYY\'))=' + $.trim($('#pTab1ModalInputBeginDt').val()).split('-')[0] + ' AND a.STAFFS_ID=' + $.trim($('#indexUserId').html()) + ' ORDER BY a.STAFFS_ID, b.DT ) a GROUP BY a.STAFFS_ID ) as ULDSEN_DAY FROM DUAL"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $($.parseJSON(data.d)).each(function (index, value) {
                            valData = (parseInt(value.DEFAULT_DAY) + parseInt(value.NEMEGDEL_DAY) + parseInt(value.AMARSAN_DAY));
                        });
                        var valSelectItems = '<option value="">- Сонго -</option>';
                        for (var i = 1; i <= valData ; i++) {
                            valSelectItems += "<option>" + i + "</option>";
                        }
                        $('#pTab1ModalSelectDaynum').html(valSelectItems);
                        $('#pTab1ModalSelectDaynum').prop('disabled', false);
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
                $('#pTab1ModalSelectDaynum').html('<option value="">- Сонго -</option>');
                $('#pTab1ModalSelectDaynum').prop('disabled',true);
            }
        }
    });
    function saveReceiveHeltes(me) {
        var valIsReceived = 'null';
        var valId = $(me).closest('tr').find('td:eq(0)').text();
        if ($(me).val() != '') valIsReceived = $(me).val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteNonQuery",
            data: '{qry:"UPDATE ST_AMRALT SET HELTESISRECEIVED=' + valIsReceived + ', HELTESRECEIVEDATE=SYSDATE, HELTESRECEIVESTAFFID=' + $.trim($('#indexUserId').text()) + ' WHERE ID=' + valId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                if (valIsReceived == 'null') {
                    $('#amraltTab1Datatable > tbody  > tr').each(function () {
                        if ($.trim($('td:eq(0)', this).html()) == valId) {
                            $('td:eq(9)', this).html('');
                            return false;
                        }
                    });
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteScalar",
                        data: '{qry:"SELECT TO_CHAR(a.HELTESRECEIVEDATE,\'YYYY-MM-DD HH24:MM:SS\')||\'~\'||NVL(i.IMAGE,\'male.png\')||\'~\'||SUBSTR(i.LNAME,0,1)||\'.\'||i.FNAME||\'~\'||CASE WHEN k.ID=k.FATHER_ID THEN k.INITNAME ELSE l.INITNAME||\' - \'||k.INITNAME END||\'~\'||m.NAME FROM ST_AMRALT a LEFT JOIN ST_STAFFS i ON a.HELTESRECEIVESTAFFID=i.ID LEFT JOIN ST_STBR j ON i.ID=j.STAFFS_ID AND j.ISACTIVE=1 LEFT JOIN ST_BRANCH k ON j.BRANCH_ID=k.ID LEFT JOIN ST_BRANCH l ON k.FATHER_ID=l.ID LEFT JOIN STN_POS m ON j.POS_ID=m.ID WHERE a.ID=' + valId + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#amraltTab1Datatable > tbody  > tr').each(function () {
                                if ($.trim($('td:eq(0)', this).html()) == valId) {
                                    $('td:eq(9)', this).html('<div style="float:left;"><img src="../files/staffs/' + msg.d.split('~')[1] + '" class="stafflistimage"></div><div style="float:left; margin-left:10px;">' + msg.d.split('~')[2] + '  <small class="text-muted"><i>' + msg.d.split('~')[0] + '</i></small><br><small class="text-muted">' + msg.d.split('~')[4] + ' | ' + msg.d.split('~')[3] + '</small></div>');
                                    return false;
                                }
                            });
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login';
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                smallBox('Ээлжийн амралтын хүсэлт', 'Амжилттай баталгаажлаа', '#659265', 4000);
                if ($(me).val() == "") { $(me).removeClass('bg-color-greenLight').removeClass('bg-color-red'); $(me).css('border', '1px solid #DDD'); $(me).css('color', '#555'); }
                else if ($(me).val() == "1") { $(me).removeClass('bg-color-red'); $(me).addClass('bg-color-greenLight'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
                else if ($(me).val() == "0") { $(me).removeClass('bg-color-greenLight'); $(me).addClass('bg-color-red'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function saveReceiveGazar(me) {
        var valIsReceived = 'null';
        var valId = $(me).closest('tr').find('td:eq(0)').text();
        if ($(me).val() != '') valIsReceived = $(me).val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteNonQuery",
            data: '{qry:"UPDATE ST_AMRALT SET GAZARISRECEIVED=' + valIsReceived + ', GAZARRECEIVEDATE=SYSDATE, GAZARRECEIVESTAFFID=' + $.trim($('#indexUserId').text()) + ' WHERE ID=' + valId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                if (valIsReceived == 'null') {
                    $('#amraltTab1Datatable > tbody  > tr').each(function () {
                        if ($.trim($('td:eq(0)', this).html()) == valId) {
                            $('td:eq(11)', this).html('');
                            return false;
                        }
                    });
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteScalar",
                        data: '{qry:"SELECT TO_CHAR(a.GAZARRECEIVEDATE,\'YYYY-MM-DD HH24:MM:SS\')||\'~\'||NVL(i.IMAGE,\'male.png\')||\'~\'||SUBSTR(i.LNAME,0,1)||\'.\'||i.FNAME||\'~\'||CASE WHEN k.ID=k.FATHER_ID THEN k.INITNAME ELSE l.INITNAME||\' - \'||k.INITNAME END||\'~\'||m.NAME FROM ST_AMRALT a LEFT JOIN ST_STAFFS i ON a.GAZARRECEIVESTAFFID=i.ID LEFT JOIN ST_STBR j ON i.ID=j.STAFFS_ID AND j.ISACTIVE=1 LEFT JOIN ST_BRANCH k ON j.BRANCH_ID=k.ID LEFT JOIN ST_BRANCH l ON k.FATHER_ID=l.ID LEFT JOIN STN_POS m ON j.POS_ID=m.ID WHERE a.ID=' + valId + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#amraltTab1Datatable > tbody  > tr').each(function () {
                                if ($.trim($('td:eq(0)', this).html()) == valId) {
                                    $('td:eq(11)', this).html('<div style="float:left;"><img src="../files/staffs/' + msg.d.split('~')[1] + '" class="stafflistimage"></div><div style="float:left; margin-left:10px;">' + msg.d.split('~')[2] + '  <small class="text-muted"><i>' + msg.d.split('~')[0] + '</i></small><br><small class="text-muted">' + msg.d.split('~')[4] + ' | ' + msg.d.split('~')[3] + '</small></div>');
                                    return false;
                                }
                            });
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login';
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                smallBox('Ээлжийн амралтын хүсэлт', 'Амжилттай баталгаажлаа', '#659265', 4000);
                if ($(me).val() == "") { $(me).removeClass('bg-color-greenLight').removeClass('bg-color-red'); $(me).css('border', '1px solid #DDD'); $(me).css('color', '#555'); }
                else if ($(me).val() == "1") { $(me).removeClass('bg-color-red'); $(me).addClass('bg-color-greenLight'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
                else if ($(me).val() == "0") { $(me).removeClass('bg-color-greenLight'); $(me).addClass('bg-color-red'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function saveReceiveTz(me) {
        var valIsReceived = 'null';
        var valId = $(me).closest('tr').find('td:eq(0)').text();
        if ($(me).val() != '') valIsReceived = $(me).val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteNonQuery",
            data: '{qry:"UPDATE ST_AMRALT SET TZISRECEIVED=' + valIsReceived + ', TZRECEIVEDATE=SYSDATE, TZRECEIVESTAFFID=' + $.trim($('#indexUserId').text()) + ' WHERE ID=' + valId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                if (valIsReceived == 'null') {
                    $('#amraltTab1Datatable > tbody  > tr').each(function () {
                        if ($.trim($('td:eq(0)', this).html()) == valId) {
                            $('td:eq(13)', this).html('');
                            return false;
                        }
                    });
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteScalar",
                        data: '{qry:"SELECT TO_CHAR(a.TZRECEIVEDATE,\'YYYY-MM-DD HH24:MM:SS\')||\'~\'||NVL(i.IMAGE,\'male.png\')||\'~\'||SUBSTR(i.LNAME,0,1)||\'.\'||i.FNAME||\'~\'||CASE WHEN k.ID=k.FATHER_ID THEN k.INITNAME ELSE l.INITNAME||\' - \'||k.INITNAME END||\'~\'||m.NAME FROM ST_AMRALT a LEFT JOIN ST_STAFFS i ON a.TZRECEIVESTAFFID=i.ID LEFT JOIN ST_STBR j ON i.ID=j.STAFFS_ID AND j.ISACTIVE=1 LEFT JOIN ST_BRANCH k ON j.BRANCH_ID=k.ID LEFT JOIN ST_BRANCH l ON k.FATHER_ID=l.ID LEFT JOIN STN_POS m ON j.POS_ID=m.ID WHERE a.ID=' + valId + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $('#amraltTab1Datatable > tbody  > tr').each(function () {
                                if ($.trim($('td:eq(0)', this).html()) == valId) {
                                    $('td:eq(13)', this).html('<div style="float:left;"><img src="../files/staffs/' + msg.d.split('~')[1] + '" class="stafflistimage"></div><div style="float:left; margin-left:10px;">' + msg.d.split('~')[2] + '  <small class="text-muted"><i>' + msg.d.split('~')[0] + '</i></small><br><small class="text-muted">' + msg.d.split('~')[4] + ' | ' + msg.d.split('~')[3] + '</small></div>');
                                    return false;
                                }
                            });
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login';
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                smallBox('Ээлжийн амралтын хүсэлт', 'Амжилттай баталгаажлаа', '#659265', 4000);
                if ($(me).val() == "") { $(me).removeClass('bg-color-greenLight').removeClass('bg-color-red'); $(me).css('border', '1px solid #DDD'); $(me).css('color', '#555'); }
                else if ($(me).val() == "1") { $(me).removeClass('bg-color-red'); $(me).addClass('bg-color-greenLight'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
                else if ($(me).val() == "0") { $(me).removeClass('bg-color-greenLight'); $(me).addClass('bg-color-red'); $(me).css('border', 'none'); $(me).css('color', '#fff'); }
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalInputBeginDt: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1ModalSelectDaynum: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputEndDt: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1ModalInputDescription: {
                validators: {
                    stringLength: {
                        max: 500,
                        message: 'Уртдаа 500 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var valIsBody = '0';
            if ($('#pTab1ModalInputIsbody').is(':checked')) valIsBody = '1';
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_AMRALT (ID, STAFFS_ID, BEGINDT, ENDDT, ISBODY, DESCRIPTION, REQUESTDATE) VALUES (TBLLASTID(\'ST_AMRALT\'), ' + $.trim($('#indexUserId').text()) + ', \'' + $.trim($('#pTab1ModalInputBeginDt').val()) + '\', \'' + $.trim($('#pTab1ModalInputEndDt').val()) + '\', ' + valIsBody + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '\', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Ээлжийн амралтын хүсэлт', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else if ($('#pTab1ModalHeaderLabel').text() == 'засах') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_AMRALT SET STAFFS_ID=' + $.trim($('#indexUserId').text()) + ', BEGINDT=\'' + $.trim($('#pTab1ModalInputBeginDt').val()) + '\', ENDDT=\'' + $.trim($('#pTab1ModalInputEndDt').val()) + '\', ISBODY=' + valIsBody + ', DESCRIPTION=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '\', REQUESTDATE=sysdate WHERE ID=' + $('#pTab1ID').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Ээлжийн амралтын хүсэлт', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });

    //tab2t1
    function dataBindTab2t1Datatable() {
        var valData = '';
        showLoader('loaderTab2t1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/AmraltTab2t1Datatable",
            data: '{"yr":"' + $('#pTab2t1SelectYear option:selected').val() + '", "gazarid":"' + $('#pTab2t1SelectGazar option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData = "<table style=\"border: 1px solid #000; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\"><thead style=\"background-color:#C6D9F1; -webkit-print-color-adjust:exact;\"><tr>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; width:2%;\">#</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Газар нэгж</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Нэр</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Албан тушаал</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; width:4%;\">Амралтын хоног</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; width:4%;\">Амарсан хоног</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center;\">Хэднээс хэдэнд</th>";
                valData += "<th style=\"border: 1px solid #000; padding:5px; text-align:center; width:4%;\">Дутуу хоног</th>";
                valData += "</tr></thead><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; padding:5px;\">" + value.ROWNO + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:left; border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.NEGJ) + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:left; border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.STAFFNAME) + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:left; border: 1px solid #000; padding:5px;\">" + replaceDatabaseToDisplay(value.POS_NAME) + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; padding:5px;\">" + value.AMRAH_HONOG + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; padding:5px;\">" + value.AMARSAN_HONOG + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; padding:5px;\">" + value.TMLIST + "</td>";
                    valData += "<td style=\"vertical-align:top; text-align:center; border: 1px solid #000; padding:5px;\">" + value.DUTUU_HONOG + "</td>";
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                $("#divBindTab2t1Table").html(valData);
                $('#pTab2t1Year').html($('#pTab2t1SelectYear option:selected').val());
                hideLoader('loaderTab2t1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#pTab2t1SelectQuarter, #pTab2t1SelectGazar").change(function () {
        dataBindTab2t1Datatable();
    });

    function AddBusinessDays(weekDaysToAdd, curdate) {
        var realDaysToAdd = 0;
        while (weekDaysToAdd > 0) {
            realDaysToAdd++;
            if (noWeekendsOrHolidays(curdate)[0]) weekDaysToAdd--;
            curdate.setDate(curdate.getDate() + 1);
        }
        return realDaysToAdd;

    }
    function noWeekendsOrHolidays(date) {
        var noWeekend = $.datepicker.noWeekends(date);
        if (noWeekend[0]) return nationalDays(date);
        else return noWeekend;
    }
    function nationalDays(date) {
        //var natDays = JSON.parse('[[7, 11, "Naadam"], [7, 12, "Naadam"], [7, 13, "Naadam"], [11, 14, "Naadam"]]');
        var natDays = JSON.parse($.trim($('#pTab2HolidayStr').html()));
        for (i = 0; i < natDays.length; i++) {
            if (date.getMonth() == natDays[i][0] - 1 && date.getDate() == natDays[i][1]) return [false, natDays[i][2] + '_day'];
        }
        return [true, ''];
    }
    
</script>