<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inputintractive.aspx.cs" Inherits="HRWebApp.pg.inputintractive" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa-fw fa fa-home"></i>
    <span>> ИНТРАКТИВ ДЭЛГЭЦЭД МЭДЭЭЛЭЛ БАЙРШУУЛАХ</span>
    </h1>
</div>
<section id="widget-grid">
    <div id="pIsRole" runat="server" class="row" style="display:none;">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            ТАНЬД ХАНДАХ ЭРХ БАЙХГҮЙ БАЙНА!
        </div>
    </div>
    <div id="pMainDiv" runat="server" class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" runat="server" class="active" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab1">
                        Сангийн яамны бүтэц
                    </a>
                </li>
                <li id="pTab3Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab3">
                        Тавигдах файлан мэдээлэл
                    </a>
                </li>
                <%--<li id="pTab4Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab4">
                        Сангийн яамны батлагдсан төсөв
                    </a>
                </li>
                <li id="pTab5Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab5">
                        Сангийн яамны төсвийн сарын гүйцэтгэл
                    </a>
                </li>
                <li id="pTab7Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab7">
                        Сангийн сайдын хэрэгжүүлэх хөтөлбөр, хөтөлбөрийн хүрэх үр дүн, шалгуур үзүүлэлт
                    </a>
                </li>
                <li id="pTab8Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab8">
                        Сангийн сайдын багцад улсын төсвийн хөрөнгөөр хэрэгжүүлэх хөрөнгө оруулалтын төсөл, арга хэмжээ барилга байгууламжын жагсаалт
                    </a>
                </li>--%>
            </ul>
            <div id="pTabContent" class="tab-content">
                <div id="pTab1" class="tab-pane active">
                    <fieldset>
                        <div class="col-md-12">
                            <div class="form-group" style="margin:0; display:block; overflow:hidden;">
                                <div class="col-md-3" style="padding: 0;">
                                    <div class="col-md-12" style="padding: 0;">
                                        <a id="pTab1AttachBtn" class="btn btn-link btn-xs" href="javascript:void(0);" style="padding:0px; border:none;" download>Зураг хавсаргаагүй байна...</a>
                                        <br />
                                        <input id="pTab1AttachInput" type="file" class="btn btn-default">
                                    </div>
                                    <div class="col-md-12" style="padding: 10px 0 0 0;">
                                        <div class="col-md-6" style="padding: 0;">
                                            <a id="pTab1AttachDelete" class="btn btn-danger btn-xs" href="javascript:void(0);"><i class="fa fa-trash-o"></i> зураг устгах</a>
                                        </div>
                                        <div class="col-md-6 text-right" style="padding: 0;">
                                            <button id="pTab1AttachSave" class="btn btn-success btn-xs" type="button"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9" style="padding:13px;">
                                    <img id="pTab1Img" src="../pg/forclient/assets/files/mof_organization_chart.png" style="width:400px;" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div id="pTab3" class="tab-pane">
                    <div class="jarviswidget" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"> 
                                <i class="fa fa-table"></i> 
                            </span>
                            <h2> Тавигдах файлан мэдээлэл </h2>
                            <div class="widget-toolbar"> 
                                <div class="btn-group options" style="margin-right:0px !important;">
                                    <select id="pTab3SelectYear" name="pTab3SelectYear" runat="server" class="form-control" style="padding:0 0; height:26px;"><option value="">Бүгд</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option></select>
                                </div> 
                            </div>
                            <div class="widget-toolbar"> 
                                Жил:
                            </div>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                <button id="pTab3AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab3Modal" data-toggle="modal" onclick="showAddEditTab3(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                            </div>
                            <div class="Colvis TableTools" style="width:300px; right:195px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab3SelectType" name="pTab3SelectType" runat="server" class="form-control" style="padding:0 0;">
                                    <option value="">Бүгд</option>
                                    <option value="3" data-ismnth="0">Сангийн сайдын багцын батлагдсан төсөв</option>
                                    <option value="4" data-ismnth="0">Сангийн яамны батлагдсан төсөв</option>
                                    <option value="5" data-ismnth="1">Сангийн яамны төсвийн сарын гүйцэтгэл</option>
                                    <option value="7" data-ismnth="0">Сангийн сайдын хэрэгжүүлэх хөтөлбөр, хөтөлбөрийн хүрэх үр дүн, шалгуур үзүүлэлт</option>
                                    <option value="8" data-ismnth="0">Сангийн сайдын багцад улсын төсвийн хөрөнгөөр хэрэгжүүлэх хөрөнгө оруулалтын төсөл, арга хэмжээ барилга байгууламжын жагсаалт</option>
                                </select>
                            </div>
                            <div class="Colvis TableTools" style="right:500px; top:4px; z-index:5; margin-top:7px;"><label>Төрөл: </label></div>
                            <div id="loaderTab3" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab3Table" class="widget-body no-padding">
                                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab3Modal" class="modal fade in" aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab3ModalForm">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button"> ×</button>
                    <h4 class="modal-title" >Сангийн сайдын багцын батлагдсан төсөв&nbsp;<span id="pTab3ModalHeaderLabel"></span></h4>
                </div>
                <div class="modal-body" style="padding-bottom:0px;">
                    <div id="tab3ID" class="form-group hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Төрөл</label>
									<select id="pTab3ModalSelectType" name="pTab3ModalSelectType" runat="server" class="form-control" style="padding: 5px;">
								        <option value="">Бүгд</option>
                                        <option value="3" data-ismnth="0">Сангийн сайдын багцын батлагдсан төсөв</option>
                                        <option value="4" data-ismnth="0">Сангийн яамны батлагдсан төсөв</option>
                                        <option value="5" data-ismnth="1">Сангийн яамны төсвийн сарын гүйцэтгэл</option>
                                        <option value="7" data-ismnth="0">Сангийн сайдын хэрэгжүүлэх хөтөлбөр, хөтөлбөрийн хүрэх үр дүн, шалгуур үзүүлэлт</option>
                                        <option value="8" data-ismnth="0">Сангийн сайдын багцад улсын төсвийн хөрөнгөөр хэрэгжүүлэх хөрөнгө оруулалтын төсөл, арга хэмжээ барилга байгууламжын жагсаалт</option>
							        </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Он</label>
									<select id="pTab3ModalSelectYear" name="pTab3ModalSelectYear" runat="server" class="form-control" style="padding: 5px;">
								        <option value="">- Сонго -</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option>
							        </select>
                                </div>
                                <div id="pTab3ModalDivIsMnth" class="col-md-8">
                                    <label class="control-label">*Сар</label>
									<select id="pTab3ModalSelectMnth" name="pTab3ModalSelectMnth" runat="server" class="form-control" style="padding: 5px;">
								        <option value="">- Сонго -</option>
                                        <option value="1">1-р сар</option>
                                        <option value="2">2-р сар</option>
                                        <option value="3">3-р сар</option>
                                        <option value="4">4-р сар</option>
                                        <option value="5">5-р сар</option>
                                        <option value="6">6-р сар</option>
                                        <option value="7">7-р сар</option>
                                        <option value="8">8-р сар</option>
                                        <option value="9">9-р сар</option>
                                        <option value="10">10-р сар</option>
                                        <option value="11">11-р сар</option>
                                        <option value="12">12-р сар</option>
							        </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group" style="margin:10px 0 0 0; display:block; overflow:hidden; ">
                                    <div class="col-md-3" style="font-size:13px;padding:0;">
                                        Хавсралт файл:
                                    </div>
                                    <div class="col-md-9" style="font-style:italic; padding:0;">
                                        <a id="pTab3ModalAttachBtn" class="btn btn-link btn-xs" href="javascript:void(0);" style="padding:0px; border:none;" download="">Файл хавсаргаагүй байна...</a>
                                    </div>
                                </div>
                                <div class="form-group" style="margin:0; display:block; overflow:hidden;">
                                    <div class="col-md-3" style="padding:0;">
                                        <a id="pTab3ModalAttachDelete" class="btn btn-link btn-xs" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                    </div>
                                    <div class="col-md-9" style="padding:0;">
                                        <input id="pTab3ModalAttachInput" type="file" class="btn btn-default">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal" type="button"> Болих </button>
                    <button class="btn btn-success btn-sm" type="submit"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    var globalAjaxVar = null;
    var pagefunction = function () {
        var valLiId = $('#pTab1Li').closest('ul').find('.active').attr('id');
    }
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    function pDatabindTabs(el) {
        if ($.trim($(el).attr('id')) == 'pTab3Li') {
            if ($.trim($('#divBindTab3Table').html()) == "") {
                dataBindTab3DataTable();
            }
        }
    }

    //tab1
    $("#pTab1AttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 5242880) {
            errMsg += 'Файлын хэмжээ 5MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab1AttachBtn').html($(this).val().split('\\').pop());
            showImage(this);
        }
        else {
            alert(errMsg);
        }
    });
    function showImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#pTab1Img').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#pTab1AttachDelete").click(function () {
        if ($('#pTab1AttachBtn').html() != 'Зураг хавсаргаагүй байна...') {
            $.SmartMessageBox({
                title: "Анхааруулга!",
                content: "Та зураг устгахдаа итгэлтэй байна уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteNonQuery",
                        data: '{qry:"UPDATE ST_INTRACTIVEDATA SET FILE_NAME=null WHERE INTRACTIVEDATA_TYPE=1"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            globalAjaxVar = $.ajax({
                                type: "POST",
                                url: "ws.aspx/DeleteFile",
                                data: '{filename:"~/pg/forclient/assets/files/mof_organization_chart.png"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    $('#pTab1Img').attr('src', '');
                                    $('#pTab1AttachBtn').html('Зураг хавсаргаагүй байна...');
                                    $('#pTab1AttachInput').val('');
                                    smallBox('Зураг', 'Амжилттай устгагдлаа', '#659265', 4000);
                                },
                                failure: function (response) {
                                    alert('FAILURE: ' + response.d);
                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                                    else window.location = '../#pg/error500.aspx';
                                }
                            });
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            });
        }
    });
    $("#pTab1AttachSave").click(function () {
        if ($('#pTab1AttachBtn').html() != 'Зураг хавсаргаагүй байна...') {
            var filename = '';
            if ($('#pTab1AttachBtn').html() == 'Зураг хавсаргаагүй байна...') filename = "null";
            else filename = "mof_organization_chart.png";
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_INTRACTIVEDATA SET FILE_NAME=\'' + filename + '\' WHERE INTRACTIVEDATA_TYPE=1"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    if ($("#pTab1AttachInput").val() != '') {
                        var uploadfiles = $("#pTab1AttachInput").get(0);
                        var uploadedfiles = uploadfiles.files;
                        var fromdata = new FormData();
                        fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                        var choice = {};
                        choice.url = "pg/forclient/forClientUploadFile.ashx?filename=" + filename;
                        choice.type = "POST";
                        choice.data = fromdata;
                        choice.contentType = false;
                        choice.processData = false;
                        choice.success = function () {
                            smallBox('Зураг', 'Амжилттай хадгалагдлаа...', '#659265', 4000);
                            $("#pTab1AttachInput").val('');
                        };
                        choice.error = function (err) { alert('Файл хуулхад алдаа гарлаа: ' + err.statusText); };
                        $.ajax(choice);
                        event.preventDefault();
                    }
                    else {
                        smallBox('Зураг', 'Амжилттай хадгалагдлаа...', '#659265', 4000);
                    }
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
        else alert('Зураг оруулна уу!');
    });

    //tab3
    function dataBindTab3DataTable() {
        showLoader('loaderTab3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/inputintractive_inputintractiveTab3Datatable",
            data: '{yr:"' + $('#pTab3SelectYear option:selected').val() + '", tp:"' + $('#pTab3SelectType option:selected').val() + '"}',
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
                if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                else window.location = '../#pg/error500.aspx';
            }
        });
    }
    $("#pTab3SelectYear, #pTab3SelectType").change(function () {
        dataBindTab3DataTable();
    });
    function showAddEditTab3(el, isinsupt) {
        $('#pTab3ModalHeaderLabel').text(isinsupt);
        $('#tab3ID').text("");
        $('#pTab3ModalSelectType, #pTab3ModalSelectYear, #pTab3ModalSelectMnth').val('');
        $('#pTab3ModalDivIsMnth').css('display', 'block');
        $('#pTab3ModalAttachBtn').html('Файл хавсаргаагүй байна...');
        $('#pTab3ModalAttachInput').val('');

        if (isinsupt == 'засах') {
            $("#tab3ID").text($(el).closest('tr').attr('data-id'));
            $('#pTab3ModalSelectType').val($(el).closest('tr').find('td:eq(2)').attr('data-id'));
            $('#pTab3ModalSelectYear').val($(el).closest('tr').find('td:eq(0)').text());
            if ($(el).closest('tr').find('td:eq(1)').text() == '-') {
                $('#pTab3ModalDivIsMnth').css('display', 'none');
                $('#pTab3ModalSelectMnth').val('12');
            }
            else {
                $('#pTab3ModalDivIsMnth').css('display', 'block');
                $('#pTab3ModalSelectMnth').val($(el).closest('tr').find('td:eq(1)').text());
            }
            $('#pTab3ModalAttachBtn').html($(el).closest('tr').find('td:eq(3)').find('a').text());
            $('#pTab3ModalAttachInput').val('');
        }
        else {
            
        }
    }
    function showDeleteTab3(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: $(el).closest('tr').find('td:eq(0)').text() + " мэдээллийн файлыг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_INTRACTIVEDATA WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/DeleteFile",
                            data: '{filename:"~/pg/forclient/assets/files/' + $(el).closest('tr').find('td:eq(1)').find('a').text() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (msg) {
                                dataBindTab3DataTable();
                                smallBox('Мэдээллийн файл', 'Амжилттай устгагдлаа', '#659265', 4000);
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                                else window.location = '../#pg/error500.aspx';
                            }
                        });
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                        else window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $("#pTab3ModalAttachDelete").click(function () {
        $('#pTab3ModalAttachBtn').html('Файл хавсаргаагүй байна...');
        $('#pTab3ModalAttachInput').val('');
    });
    $("#pTab3ModalAttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 5242880) {
            errMsg += 'Файлын хэмжээ 5MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'pdf') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. Зөвхөн .pdf төрөлтэй файл хавсаргана!\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab3ModalAttachBtn').html($(this).val().split('\\').pop());
        }
        else alert(errMsg);
    });
    $("#pTab3ModalSelectType").change(function () {
        if ($('#pTab3ModalSelectType option:selected').val() == '') {
            $('#pTab3ModalDivIsMnth').css('display', 'block');
            $('#pTab3ModalSelectYear, #pTab3ModalSelectMnth').val('');
        }
        else {
            if ($('#pTab3ModalSelectType option:selected').attr('data-ismnth') == '1') {
                $('#pTab3ModalDivIsMnth').css('display', 'block');
                $('#pTab3ModalSelectMnth').val('');
            }
            else {
                $('#pTab3ModalDivIsMnth').css('display', 'none');
                $('#pTab3ModalSelectMnth').val('12');
            }
        }
    });
    $('#pTab3ModalForm').bootstrapValidator({
        fields: {
            pTab3ModalSelectType: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab3ModalSelectYear: {
                group: '.col-md-4',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab3ModalSelectMnth: {
                group: '.col-md-8',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab3ModalAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
                var filename = '';
                if ($('#pTab3ModalAttachBtn').html() == 'Файл хавсаргаагүй байна...') filename = "null";
                else filename = "File-" + $('#pTab3ModalSelectType option:selected').val() + "-" + $('#pTab3ModalSelectYear option:selected').val() + ".pdf";
                if ($("#pTab3ModalHeaderLabel").html() == "нэмэх") {
                    var valQry = '';
                    if ($('#pTab3ModalSelectType option:selected').attr('data-ismnth') == '1') {
                        valQry = 'SELECT COUNT(1) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=' + $('#pTab3ModalSelectType option:selected').val() + ' AND YR=' + $('#pTab3ModalSelectYear option:selected').val() + ' AND MNTH=' + $('#pTab3ModalSelectMnth option:selected').val() + '';
                    }
                    else {
                        valQry = 'SELECT COUNT(1) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=' + $('#pTab3ModalSelectType option:selected').val() + ' AND YR=' + $('#pTab3ModalSelectYear option:selected').val() + '';
                    }
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteScalar",
                        data: '{qry:"' + valQry + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            if (msg.d == '0') {
                                globalAjaxVar = $.ajax({
                                    type: "POST",
                                    url: "ws.aspx/WSOracleExecuteNonQuery",
                                    data: '{qry:"INSERT INTO ST_INTRACTIVEDATA (ID, INTRACTIVEDATA_TYPE, YR, MNTH, FILE_NAME) VALUES (TBLLASTID(\'ST_INTRACTIVEDATA\'), ' + $('#pTab3ModalSelectType option:selected').val() + ', ' + $('#pTab3ModalSelectYear option:selected').val() + ', ' + $('#pTab3ModalSelectMnth option:selected').val() + ', \'' + filename + '\')"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) {
                                        if ($("#pTab3ModalAttachInput").val() != '') {
                                            var uploadfiles = $("#pTab3ModalAttachInput").get(0);
                                            var uploadedfiles = uploadfiles.files;
                                            var fromdata = new FormData();
                                            fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                            var choice = {};
                                            choice.url = "pg/forclient/forClientUploadFile.ashx?filename=" + filename;
                                            choice.type = "POST";
                                            choice.data = fromdata;
                                            choice.contentType = false;
                                            choice.processData = false;
                                            choice.success = function () {
                                                dataBindTab3DataTable();
                                                smallBox('Мэдээллийн файл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                                                $('#pTab3Modal').modal('hide');
                                            };
                                            choice.error = function (err) { alert('Файл хуулхад алдаа гарлаа: ' + err.statusText); };
                                            $.ajax(choice);
                                            event.preventDefault();
                                        }
                                        else {
                                            dataBindTab3DataTable();
                                            smallBox('Мэдээллийн файл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                                            $('#pTab3Modal').modal('hide');
                                        }
                                    },
                                    failure: function (response) {
                                        alert('FAILURE: ' + response.d);
                                    },
                                    error: function (xhr, status, error) {
                                        var err = eval("(" + xhr.responseText + ")");
                                        if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                                        else window.location = '../#pg/error500.aspx';
                                    }
                                });
                            }
                            else {
                                alert('Сонгосон мэдээллийн төрлийн ' + $('#pTab3ModalSelectYear option:selected').val() + ' он-д хамааралтай мэдээлэл орсон байна!');
                            }
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteNonQuery",
                        data: '{qry:"UPDATE ST_INTRACTIVEDATA SET INTRACTIVEDATA_TYPE=' + $('#pTab3ModalSelectType option:selected').val() + ', YR=' + $('#pTab3ModalSelectYear option:selected').val() + ', MNTH=' + $('#pTab3ModalSelectMnth option:selected').val() + ' , FILE_NAME=\'' + filename + '\' WHERE ID=' + $('#tab3ID').text() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if ($("#pTab3ModalAttachInput").val() != '') {
                                var uploadfiles = $("#pTab3ModalAttachInput").get(0);
                                var uploadedfiles = uploadfiles.files;
                                var fromdata = new FormData();
                                fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                var choice = {};
                                choice.url = "pg/forclient/forClientUploadFile.ashx?filename=" + filename;
                                choice.type = "POST";
                                choice.data = fromdata;
                                choice.contentType = false;
                                choice.processData = false;
                                choice.success = function () {
                                    dataBindTab3DataTable();
                                    smallBox('Мэдээллийн файл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                                    $('#pTab3Modal').modal('hide');
                                };
                                choice.error = function (err) { alert('Файл хуулхад алдаа гарлаа: ' + err.statusText); };
                                $.ajax(choice);
                                event.preventDefault();
                            }
                            else {
                                dataBindTab3DataTable();
                                smallBox('Мэдээллийн файл', 'Амжилттай хадгалагдлаа...', '#659265', 3000);
                                $('#pTab3Modal').modal('hide');
                            }
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            var err = eval("(" + xhr.responseText + ")");
                            if (err.Message == 'SessionDied' || $.trim(err.Message) == 'Invalid operation. The connection is closed.') window.location = '../login.aspx';
                            else window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            }
            else alert('Хавсралт файл оруулна уу!');
        }
    });
</script>
