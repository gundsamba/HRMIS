<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t2.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t2" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Гэр бүлийн байдал <small>/ Зөвхөн гэр бүлийн бүртгэлд байгаа хүмүүсийг бичнэ /</small> </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T2Section1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T2SectionsModal" data-toggle="modal" onclick="showAddEditTab1T2Sections(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T2Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T2Section1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Садан төрлийн байдал <small>/ Таны эцэг, эх төрсөн ах, эгч дүү өрх тусгаарласан хүүхэд болон таны эхнэрм нөхрийн эцэг, эхийг оруулна /</small> </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T2Section2AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T2SectionsModal" data-toggle="modal" onclick="showAddEditTab1T2Sections(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T2Section2" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T2Section2Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1T2SectionsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="pTab1T2SectionsModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title"><span id="pTab1T2SectionsModalHeaderLabel1"></span>&nbsp;<span id="pTab1T2SectionsModalHeaderLabel2"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">*Таны юу болох</label>
                                    <select id="pTab1T2SectionsModalSelectRelation" name="pTab1T2SectionsModalSelectRelation" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-5">
                                    <label class="control-label">*Эцэг/эх-н нэр</label>
                                    <input id="pTab1T2SectionsModalInputLname" name="pTab1T2SectionsModalInputLname" type="text" class="form-control" placeholder="Эцэг/эх-н нэр" />
                                </div>
                                <div class="col-md-5">
                                    <label class="control-label">*Өөрийн нэр</label>
                                    <input id="pTab1T2SectionsModalInputFname" name="pTab1T2SectionsModalInputFname" type="text" class="form-control" placeholder="Өөрийн нэр" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">*Төрсөн он</label>
                                    <select id="pTab1T2SectionsModalSelectByear" name="pTab1T2SectionsModalSelectByear" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-5">
                                    <label class="control-label">*Төрсөн аймаг, хот</label>
                                    <select id="pTab1T2SectionsModalSelectBcity" name="pTab1T2SectionsModalSelectBcity" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-5">
                                    <label class="control-label">Төрсөн сум, дүүрэг</label>
                                    <select id="pTab1T2SectionsModalSelectBdist" name="pTab1T2SectionsModalSelectBdist" runat="server" class="form-control" style="padding: 5px;" disabled="disabled">
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
                                    <label class="control-label">Одоо эрхэлж буй ажил</label>
                                    <input id="pTab1T2SectionsModalInputWork" name="pTab1T2SectionsModalInputWork" type="text" class="form-control" placeholder="Одоо эрхэлж буй ажил" />
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
    dataBindTab1T2Section1Datatable();
    dataBindTab1T2Section2Datatable();
    function dataBindTab1T2Section1Datatable() {
        showLoader('loaderTab1T2Section1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T2Datatable",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'", tp:"1"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T2Section1Table").html(msg.d);
                hideLoader('loaderTab1T2Section1');
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
    function dataBindTab1T2Section2Datatable() {
        showLoader('loaderTab1T2Section2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T2Datatable",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'", tp:"2"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T2Section2Table").html(msg.d);
                hideLoader('loaderTab1T2Section2');
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
    $("#pTab1T2SectionsModalSelectBcity").change(function () {
        if ($("#pTab1T2SectionsModalSelectBcity option:selected").val() == "") {
            $("#pTab1T2SectionsModalSelectBdist").html("<option selected value=\"\">- Сонго -</option>");
            $("#pTab1T2SectionsModalSelectBdist").prop("disabled", true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/staffreg_staffregTab1ModalDistForDDL",
                data: '{city:"' + $("#pTab1T2SectionsModalSelectBcity option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1T2SectionsModalSelectBdist").html(msg.d);
                    $("#pTab1T2SectionsModalSelectBdist").prop("disabled", false);
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
    });
    function showAddEditTab1T2Sections(el, isinsupt) {
        $('#pTab1T2SectionsModalHeaderLabel2').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            if ($(el).attr('id') == 'pTab1T2Section1AddBtn') $('#pTab1T2SectionsModalHeaderLabel1').html('Гэр бүлийн байдал');
            else $('#pTab1T2SectionsModalHeaderLabel1').html('Садан төрлийн байдал');
            $('#pTab1T2ID').html('');
            $('#pTab1T2SectionsModalSelectRelation').val('');
            $('#pTab1T2SectionsModalInputLname').val('');
            $('#pTab1T2SectionsModalInputFname').val('');
            $('#pTab1T2SectionsModalSelectByear').val('');
            $('#pTab1T2SectionsModalSelectBcity').val('');
            $("#pTab1T2SectionsModalSelectBdist").html("<option selected value=\"\">- Сонго -</option>");
            $("#pTab1T2SectionsModalSelectBdist").prop("disabled", true);
            $('#pTab1T2SectionsModalInputWork').val('');
        }
        else {
            if ($(el).closest('table').attr('id') == 'profileTab1T2Datatable1') $('#pTab1T2SectionsModalHeaderLabel1').html('Гэр бүлийн байдал');
            else $('#pTab1T2SectionsModalHeaderLabel1').html('Садан төрлийн байдал');
            $('#pTab1T2ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T2SectionsModalInputLname').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1T2SectionsModalInputFname').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T2SectionsModalSelectByear').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1T2SectionsModalInputWork').val($(el).closest('tr').find('td:eq(7)').text());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteScalar",
                data: '{qry:"SELECT RELATION_ID||\'~\'||BCITY_ID||\'~\'||BDIST_ID FROM ST_STAFFSFAMILY WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $('#pTab1T2SectionsModalSelectRelation').val(msg.d.split('~')[0]);
                    $('#pTab1T2SectionsModalSelectBcity').val(msg.d.split('~')[1]);
                    var valBdist = msg.d.split('~')[2];
                    if ($("#pTab1T2SectionsModalSelectBcity option:selected").val() == "") {
                        $("#pTab1T2SectionsModalSelectBdist").html("<option selected value=\"\">- Сонго -</option>");
                        $("#pTab1T2SectionsModalSelectBdist").prop("disabled", true);
                    }
                    else {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/staffreg_staffregTab1ModalDistForDDL",
                            data: '{city:"' + $("#pTab1T2SectionsModalSelectBcity option:selected").val() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                $("#pTab1T2SectionsModalSelectBdist").html(msg.d);
                                $("#pTab1T2SectionsModalSelectBdist").prop("disabled", false);
                                $('#pTab1T2SectionsModalSelectBdist').val(valBdist);
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
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.html';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    }
    function showDeleteTab1T2Sections(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_STAFFSFAMILY WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($(el).closest('table').attr('id') == 'profileTab1T2Datatable1') dataBindTab1T2Section1Datatable();
                        else dataBindTab1T2Section2Datatable();
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
    $('#pTab1T2SectionsModalForm').bootstrapValidator({
        fields: {
            pTab1T2SectionsModalSelectRelation: {
                //group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T2SectionsModalInputLname: {
                //group: '.col-md-5',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1T2SectionsModalInputFname: {
                //group: '.col-md-5',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1T2SectionsModalSelectByear: {
                //group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T2SectionsModalSelectBcity: {
                //group: '.col-md-5',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T2SectionsModalInputWork: {
                //group: '.col-md-12',
                validators: {
                    stringLength: {
                        max: 200,
                        message: 'Уртдаа 200 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            var valTp = '2';
            if ($('#pTab1T2SectionsModalHeaderLabel1').text() == 'Гэр бүлийн байдал') valTp = '1';
            if ($('#pTab1T2SectionsModalHeaderLabel2').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_STAFFSFAMILY (ID, STAFFS_ID, TP, RELATION_ID, LNAME, FNAME, BYEAR, BCITY_ID, BDIST_ID, CURRENTWORK, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_STAFFSFAMILY\'), ' +<%=Request.QueryString["id"]%> +', ' + valTp + ', ' + $('#pTab1T2SectionsModalSelectRelation option:selected').val() + ', \'' + strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1T2SectionsModalInputLname').val()))) + '\', \'' + strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1T2SectionsModalInputFname').val()))) + '\', ' + $('#pTab1T2SectionsModalSelectByear option:selected').val() + ', ' + $('#pTab1T2SectionsModalSelectBcity option:selected').val() + ', ' + strQryIsNull('numeric', $('#pTab1T2SectionsModalSelectBdist option:selected').val()) + ', ' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T2SectionsModalInputWork').val()))) + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if (valTp == '1') dataBindTab1T2Section1Datatable();
                        else dataBindTab1T2Section2Datatable();
                        $('#pTab1T2SectionsModal').modal('hide');
                        smallBox($('#pTab1T2SectionsModalHeaderLabel1').text(), 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_STAFFSFAMILY SET RELATION_ID=' + $('#pTab1T2SectionsModalSelectRelation option:selected').val() + ', LNAME=\'' + strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1T2SectionsModalInputLname').val()))) + '\', FNAME=\'' + strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1T2SectionsModalInputFname').val()))) + '\', BYEAR=' + $('#pTab1T2SectionsModalSelectByear option:selected').val() + ', BCITY_ID=' + $('#pTab1T2SectionsModalSelectBcity option:selected').val() + ', BDIST_ID=' + strQryIsNull('numeric', $('#pTab1T2SectionsModalSelectBdist option:selected').val()) + ', CURRENTWORK=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1T2SectionsModalInputWork').val()))) + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T2ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if (valTp == '1') dataBindTab1T2Section1Datatable();
                        else dataBindTab1T2Section2Datatable();
                        $('#pTab1T2SectionsModal').modal('hide');
                        smallBox($('#pTab1T2SectionsModalHeaderLabel1').text(), 'Амжилттай засварлагдлаа', '#659265', 4000);
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
</script>
