<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t5.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t5" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Зэрэг дэв, цол </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T5Section1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T5Section1Modal" data-toggle="modal" onclick="showAddEditTab1T5Section1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T5Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T5Section1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1T5Section1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T5Section1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Зэрэг дэв, цол&nbsp;<span id="pTab1T5Section1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T5Section1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Албан тушаалын зэрэг дэв</label>
                                    <select id="pTab1T5Section1ModalSelectPosdegreedtl" name="pTab1T5Section1ModalSelectPosdegreedtl" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Албан тушаалын ангилал</label>
                                    <select id="pTab1T5Section1ModalSelectRankposdegree" name="pTab1T5Section1ModalSelectRankposdegree" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Зарлиг, захирамж, тушаалын нэр</label>
                                    <input id="pTab1T5Section1ModalInputDecisiondesc" name="pTab1T5Section1ModalInputDecisiondesc" type="text" class="form-control" placeholder="Зарлиг, захирамж, тушаалын нэр" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Огноо</label>
                                    <input id="pTab1T5Section1ModalInputDecisiondate" name="pTab1T5Section1ModalInputDecisiondate" type="text" class="form-control" placeholder="Огноо" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Үнэмлэхний дугаар</label>
                                    <input id="pTab1T5Section1ModalInputCertificateno" name="pTab1T5Section1ModalInputCertificateno" type="text" class="form-control" placeholder="Үнэмлэхний дугаар" />
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
    dataBindTab1T5Section1Datatable();
    function dataBindTab1T5Section1Datatable() {
        showLoader('loaderTab1T5Section1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T5Datatable1",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T5Section1Table").html(msg.d);
                formTab1T5Percent();
                hideLoader('loaderTab1T5Section1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login.html';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab1T5Section1(el, isinsupt) {
        $('#pTab1T5Section1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T5Section1ID').html('');
            $('#pTab1T5Section1ModalSelectPosdegreedtl').val('');
            $('#pTab1T5Section1ModalSelectRankposdegree').val('');
            $('#pTab1T5Section1ModalInputDecisiondesc').val('');
            $('#pTab1T5Section1ModalInputDecisiondate').val('');
            $('#pTab1T5Section1ModalInputCertificateno').val('');
        }
        else {
            $('#pTab1T5Section1ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T5Section1ModalSelectPosdegreedtl').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1T5Section1ModalSelectRankposdegree').val($(el).closest('tr').find('td:eq(8)').text());
            $('#pTab1T5Section1ModalInputDecisiondesc').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T5Section1ModalInputDecisiondate').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1T5Section1ModalInputCertificateno').val($(el).closest('tr').find('td:eq(5)').text());
        }
    }
    function showDeleteTab1T5Section1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_JOBTITLEDEGREE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T5Section1Datatable();
                        smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $('#pTab1T5Section1ModalForm').bootstrapValidator({
        fields: {
            pTab1T5Section1ModalSelectPosdegreedtl: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T5Section1ModalSelectRankposdegree: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T5Section1ModalInputDecisiondesc: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1T5Section1ModalInputDecisiondate: {
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
            pTab1T5Section1ModalInputCertificateno: {
                validators: {
                    stringLength: {
                        max: 20,
                        message: 'Уртдаа 20 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T5Section1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_JOBTITLEDEGREE (ID, STAFFS_ID, POSDEGREEDTL_ID, RANKPOSDEGREE_ID, DECISIONDESC, DECISIONDATE, CERTIFICATENO, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_JOBTITLEDEGREE\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T5Section1ModalSelectPosdegreedtl option:selected').val() + ', ' + $('#pTab1T5Section1ModalSelectRankposdegree option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T5Section1ModalInputDecisiondesc').val())) + '\', \'' + $.trim($('#pTab1T5Section1ModalInputDecisiondate').val()) + '\', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T5Section1ModalInputCertificateno').val()))) + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T5Section1Datatable();
                        $('#pTab1T5Section1Modal').modal('hide');
                        smallBox('Зэрэг дэв, цол', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"UPDATE ST_JOBTITLEDEGREE SET POSDEGREEDTL_ID=' + $('#pTab1T5Section1ModalSelectPosdegreedtl option:selected').val() + ', RANKPOSDEGREE_ID=' + $('#pTab1T5Section1ModalSelectRankposdegree option:selected').val() + ', DECISIONDESC=\'' + replaceDisplayToDatabase($.trim($('#pTab1T5Section1ModalInputDecisiondesc').val())) + '\', DECISIONDATE=\'' + $.trim($('#pTab1T5Section1ModalInputDecisiondate').val()) + '\', CERTIFICATENO=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T5Section1ModalInputCertificateno').val()))) + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T5Section1ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T5Section1Datatable();
                        $('#pTab1T5Section1Modal').modal('hide');
                        smallBox('Зэрэг дэв, цол', 'Амжилттай засварлагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied') window.location = '../login.html';
                        else if (err.Message == 'NullReferenceException') {
                            //alert('NullReferenceException');
                        }
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        }
    });

    $('#pTab1T5Section1ModalInputDecisiondate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя']
    });
</script>
