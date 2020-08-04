<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="celebday.aspx.cs" Inherits="HRWebApp.pg.profileforms.celebday" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i>
            <span>> Тэмдэглэлт өдөр</span>
        </h1>
    </div>
</div>
<section id="widget-grid">
    <div id="pIsRole" runat="server" class="row" style="display:none;">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            ТАНЬД ХАНДАХ ЭРХ БАЙХГҮЙ БАЙНА!
        </div>
    </div>
    <div id="pMainDiv" runat="server" class="row">
        <article class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"><i class="fa fa-table"></i></span>
                    <h2> Тогтмол амралтын өдрийн бүртгэл </h2>
                    <div class="widget-toolbar">  
                        <div class="btn-group options" style="margin-right:0px !important;">
                            <button id="pTab1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                        </div> 
                    </div>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div id="loaderTab1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1Table" class="widget-body no-padding">
                        
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> <i class="fa fa-table"></i></span>
                    <h2> Тогтмол бус амралтын өдрийн бүртгэл </h2>
                    <div class="widget-toolbar">  
                        <div class="btn-group options" style="margin-right:0px !important;">
                            <button id="pTab2AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab2Modal" data-toggle="modal" onclick="showAddEditTab2(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                        </div> 
                    </div>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:60px; right:120px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab2SelectYear" name="pTab2SelectYear" runat="server" class="form-control" style="padding: 1px;">
						</select>
                    </div>
                    <div id="loaderTab2" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab2Table" class="widget-body no-padding">
                        
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> <i class="fa fa-table"></i></span>
                    <h2> Амралтын өдрийг ажлын өдөрт тооцох бүртгэл </h2>
                    <div class="widget-toolbar">  
                        <div class="btn-group options" style="margin-right:0px !important;">
                            <button id="pTab3AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab3Modal" data-toggle="modal" onclick="showAddEditTab3(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                        </div> 
                    </div>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:60px; right:120px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab3SelectYear" name="pTab3SelectYear" runat="server" class="form-control" style="padding: 1px;">
						</select>
                    </div>
                    <div id="loaderTab3" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab3Table" class="widget-body no-padding">
                        
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Тогтмол амралтын өдөр&nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Сар</label>
                                    <select id="pTab1ModalSelectMonth" name="pTab1ModalSelectMonth" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Өдөр</label>
                                    <select id="pTab1ModalSelectDay" name="pTab1ModalSelectDay" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Нэр</label>
                                    <input id="pTab1ModalInputName" name="pTab1ModalInputName" type="text" class="form-control" placeholder="Нэр" />
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
<div id="pTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="pTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Тогтмол бус амралтын өдөр&nbsp;<span id="pTab2ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Огноо</label>
                                    <input id="pTab2ModalInputDate" name="pTab2ModalInputDate" type="text" class="form-control" placeholder="Огноо" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Нэр</label>
                                    <input id="pTab2ModalInputName" name="pTab2ModalInputName" type="text" class="form-control" placeholder="Нэр" />
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
<div id="pTab3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="pTab3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Амралтын өдрийг ажлын өдөрт тооцох&nbsp;<span id="pTab3ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Огноо</label>
                                    <input id="pTab3ModalInputDate" name="pTab3ModalInputDate" type="text" class="form-control" placeholder="Огноо" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Нэр</label>
                                    <input id="pTab3ModalInputName" name="pTab3ModalInputName" type="text" class="form-control" placeholder="Нэр" />
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
    var globalAjaxVar = null;
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
    pagefunction();

    //tab1
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/celebday_celebdayTab1Datatable",
            data: '{currstaffid:"' + $('#indexUserId').text() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1Table").html(msg.d);
                hideLoader('loaderTab1');
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
            $('#pTab1ModalSelectMonth').val('');
            $('#pTab1ModalSelectMonth').prop('disabled', false);
            $('#pTab1ModalSelectDay').val('');
            $('#pTab1ModalSelectDay').prop('disabled', false);
            $('#pTab1ModalInputName').val('');
        }
        else {
            $('#pTab1ModalSelectMonth').val($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1ModalSelectMonth').prop('disabled',true);
            $('#pTab1ModalSelectDay').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab1ModalSelectDay').prop('disabled', true);
            $('#pTab1ModalInputName').val($(el).closest('tr').find('td:eq(2)').text());
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
                    data: '{qry:"DELETE FROM ST_HOLIDAYOFFICIAL WHERE HOLMONTH=' + $(el).closest('tr').find('td:eq(0)').text() + ' AND HOLDAY=' + $(el).closest('tr').find('td:eq(1)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        smallBox('Тогтмол амралтын өдөр', 'Амжилттай устгагдлаа', '#659265', 4000);
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
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalSelectMonth: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectDay: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputName: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteScalar",
                    data: '{qry:"SELECT COUNT(1) FROM ST_HOLIDAYOFFICIAL WHERE HOLMONTH=' + $('#pTab1ModalSelectMonth option:selected').val() + ' AND HOLDAY=' + $('#pTab1ModalSelectDay option:selected').val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d != '0') alert($('#pTab1ModalSelectMonth option:selected').val() + ' сарын ' + $('#pTab1ModalSelectDay option:selected').val() + ' өдөр амралтын өдөр бүртгэгдсэн байна!');
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/WSOracleExecuteNonQuery",
                                data: '{qry:"INSERT INTO ST_HOLIDAYOFFICIAL (HOLMONTH, HOLDAY, NAME) VALUES (' + $('#pTab1ModalSelectMonth option:selected').val() + ', ' + $('#pTab1ModalSelectDay option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '\')"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab1Datatable();
                                    $('#pTab1Modal').modal('hide');
                                    smallBox('Тогтмол амралтын өдөр', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
            else if ($('#pTab1ModalHeaderLabel').text() == 'засах') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_HOLIDAYOFFICIAL SET NAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '\' WHERE HOLMONTH=' + $('#pTab1ModalSelectMonth option:selected').val() + ' AND HOLDAY=' + $('#pTab1ModalSelectDay option:selected').val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        $('#pTab1Modal').modal('hide');
                        smallBox('Тогтмол амралтын өдөр', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
    //tab2
    function dataBindTab2Datatable() {
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/celebday_celebdayTab2Datatable",
            data: '{currstaffid:"' + $('#indexUserId').text() + '", yr:"' + $('#pTab2SelectYear option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab2Table").html(msg.d);
                hideLoader('loaderTab2');
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
    function showAddEditTab2(el, isinsupt) {
        $('#pTab2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab2ModalInputDate').val('');
            $('#pTab2ModalInputDate').prop('disabled', false);
            $('#pTab2ModalInputName').val('');
        }
        else {
            $('#pTab2ModalInputDate').val($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab2ModalInputDate').prop('disabled', true);
            $('#pTab2ModalInputName').val($(el).closest('tr').find('td:eq(1)').text());
        }
    }
    function showDeleteTab2(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мэдээллийг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"DELETE FROM ST_HOLIDAYUNOFFICIAL WHERE HOLDATE=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    dataBindTab2Datatable();
                    smallBox('Тогтмол бус амралтын өдөр', 'Амжилттай устгагдлаа', '#659265', 4000);
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
        });
    }
    $("#pTab2SelectYear").change(function () {
        dataBindTab2Datatable();
    });
    $('#pTab2ModalForm').bootstrapValidator({
        fields: {
            pTab2ModalInputDate: {
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
            pTab2ModalInputName: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteScalar",
                    data: '{qry:"SELECT COUNT(1) FROM ST_HOLIDAYUNOFFICIAL WHERE HOLDATE=\'' + $.trim($('#pTab2ModalInputDate').val()) + '\'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d != '0') alert($.trim($('#pTab2ModalInputDate').val()) + ' өдөр амралтын өдөр бүртгэгдсэн байна!');
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/WSOracleExecuteNonQuery",
                                data: '{qry:"INSERT INTO ST_HOLIDAYUNOFFICIAL (HOLDATE, NAME) VALUES (\'' + $.trim($('#pTab2ModalInputDate').val()) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val())) + '\')"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab2Datatable();
                                    $('#pTab2Modal').modal('hide');
                                    smallBox('Тогтмол бус амралтын өдөр', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
            else if ($('#pTab2ModalHeaderLabel').text() == 'засах') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_HOLIDAYUNOFFICIAL SET NAME=\'' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputName').val())) + '\' WHERE HOLDATE=\'' + $.trim($('#pTab2ModalInputDate').val()) + '\'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Datatable();
                        $('#pTab2Modal').modal('hide');
                        smallBox('Тогтмол бус амралтын өдөр', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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

    //tab3
    function dataBindTab3Datatable() {
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/celebday_celebdayTab3Datatable",
            data: '{currstaffid:"' + $('#indexUserId').text() + '", yr:"' + $('#pTab3SelectYear option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab3Table").html(msg.d);
                hideLoader('loaderTab3');
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
    function showAddEditTab3(el, isinsupt) {
        $('#pTab3ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab3ModalInputDate').val('');
            $('#pTab3ModalInputDate').prop('disabled', false);
            $('#pTab3ModalInputName').val('');
        }
        else {
            $('#pTab3ModalInputDate').val($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab3ModalInputDate').prop('disabled', true);
            $('#pTab3ModalInputName').val($(el).closest('tr').find('td:eq(1)').text());
        }
    }
    function showDeleteTab3(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мэдээллийг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"DELETE FROM ST_HOLIDAYISWORK WHERE HOLDATE=\'' + $(el).closest('tr').find('td:eq(0)').text() + '\'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    dataBindTab3Datatable();
                    smallBox('Амралтын өдрийг ажлын өдөрт тооцох', 'Амжилттай устгагдлаа', '#659265', 4000);
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
        });
    }
    $("#pTab3SelectYear").change(function () {
        dataBindTab3Datatable();
    });
    $('#pTab3ModalForm').bootstrapValidator({
        fields: {
            pTab3ModalInputDate: {
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
            pTab3ModalInputName: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteScalar",
                    data: '{qry:"SELECT COUNT(1) FROM ST_HOLIDAYISWORK WHERE HOLDATE=\'' + $.trim($('#pTab3ModalInputDate').val()) + '\'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d != '0') alert($.trim($('#pTab3ModalInputDate').val()) + ' өдөр бүртгэгдсэн байна!');
                        else {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/WSOracleExecuteNonQuery",
                                data: '{qry:"INSERT INTO ST_HOLIDAYISWORK (HOLDATE, NAME) VALUES (\'' + $.trim($('#pTab3ModalInputDate').val()) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab3ModalInputName').val())) + '\')"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function () {
                                    dataBindTab3Datatable();
                                    $('#pTab3Modal').modal('hide');
                                    smallBox('Амралтын өдрийг ажлын өдөрт тооцох', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
            else if ($('#pTab3ModalHeaderLabel').text() == 'засах') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_HOLIDAYISWORK SET NAME=\'' + replaceDisplayToDatabase($.trim($('#pTab3ModalInputName').val())) + '\' WHERE HOLDATE=\'' + $.trim($('#pTab3ModalInputDate').val()) + '\'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab3Datatable();
                        $('#pTab3Modal').modal('hide');
                        smallBox('Амралтын өдрийг ажлын өдөрт тооцох', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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

    $('#pTab2ModalInputDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя']
    });
    $('#pTab3ModalInputDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя'],
        beforeShowDay:
         function (dt) {
             return [dt.getDay() == 0 || dt.getDay() == 6, ""];
         }
    });
</script>
