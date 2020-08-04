<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setrole.aspx.cs" Inherits="HRWebApp.pg.setrole" %>
<style>
    .stafflistimage {
        width: 25px;
        border-radius: 0;
    }
</style>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa-fw fa fa-home"></i>
    <span>> Модулын эрх олгох</span>
    </h1>
</div>
<section id="widget-grid">
    <div id="pIsRole" runat="server" class="row" style="display:none;">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            ТАНЬД ХАНДАХ ЭРХ БАЙХГҮЙ БАЙНА!
        </div>
    </div>
    <div id="pMainDiv" runat="server" class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Ажилтаны бүртгэл </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:155px; right:125px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectType" name="pTab1SelectType" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:285px; top:4px; z-index:5; margin-top:7px;"><label>Төлөв:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:330px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectHeltes" name="pTab1SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:420px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:475px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectGazar" name="pTab1SelectGazar" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:565px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                    <div class="Colvis TableTools" style="width:150px; right:615px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectPos" name="pTab1SelectPos" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:775px; top:4px; z-index:5; margin-top:7px;"><label>Албан тушаал:</label></div>
                    <div class="Colvis TableTools" style="width:150px; right:875px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectRole" name="pTab1SelectRole" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:1030px; top:4px; z-index:5; margin-top:7px;"><label>Эрх:</label></div>
                    <div id="loaderTab1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1Modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display:none;z-index:99999;">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" aria-hidden="true" data-dismiss="modal" type="button"> × </button>
                <h4 class="modal-title" >Системийн эрх</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div id="tab1ID" class="hide"></div>
                    <div id="setroleTab1ModalInputRoles" runat="server" class="col-md-12">
                        <div class="checkbox">
							<label>
								<input type="checkbox" class="checkbox style-0 classCheckedRole" value="1">
								<span>Checkbox 1</span>
							</label>
						</div>
                    </div>
                </div>                
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" type="button"> Болих </button>
                <button id="setroleTab1ModalBtnSave" class="btn btn-success btn-sm" type="button"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/gazarListForDDL",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#pTab1SelectGazar").html(msg.d);
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
        dataBindTab1Datatable();
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();

    //таб1
    $("#pTab1SelectPos, #pTab1SelectHeltes, #pTab1SelectType, #pTab1SelectRole").change(function () {
        dataBindTab1Datatable();
    });
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
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/setrole_setroleTab1Datatable",
            data: '{pos:"' + $("#pTab1SelectPos option:selected").val() + '", gazar:"' + $("#pTab1SelectGazar option:selected").val() + '", heltes:"' + $("#pTab1SelectHeltes option:selected").val() + '", tp:"' + $("#pTab1SelectType option:selected").val() + '", role:"' + $("#pTab1SelectRole option:selected").val() + '"}',
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
    $("#setroleTab1ModalBtnSave").click(function () {
        var valCheckedRolesValue = '', valCheckedRolesName='';
        $('.classCheckedRole').each(function (index) {
            if ($(this).is(':checked')) {
                if (valCheckedRolesValue == '') {
                    valCheckedRolesValue += $(this).val();
                    valCheckedRolesName += $(this).parent().find('span').text();
                }
                else {
                    valCheckedRolesValue += ',' + $(this).val();
                    valCheckedRolesName += ', ' + $(this).parent().find('span').text();
                }
            }
        });
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/STAFFS_ROLE",
            data: '{P_STAFFS_ID:"' + $('#tab1ID').html() + '", P_ROLELIST:"' + valCheckedRolesValue + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d == "0") window.location = "../#pg/error500.aspx";
                else {
                    $('#setroleTab1Datatable > tbody > tr').each(function (index) {
                        if ($('td:eq(0)', this).html() == $('#tab1ID').html()) {
                            $('td:eq(13)', this).html(valCheckedRolesValue);
                            $('td:eq(11)', this).html(valCheckedRolesName);
                            return false;
                        }
                    });
                    smallBox('Модулын эрх', 'Амжилттай хадгалагдлаа', '#659265', 2000);
                    $('#pTab1Modal').modal('hide');
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
    });
    function showAddEditTab1(el) {
        $('#tab1ID').html($(el).closest('tr').find('td:eq(0)').text());
        $('.classCheckedRole').prop('checked', false);
        if ($(el).closest('tr').find('td:eq(13)').text() != 'none') {
            $('.classCheckedRole').each(function (index) {
                for (var i = 0; i < $(el).closest('tr').find('td:eq(13)').text().split(',').length; i++) {
                    if ($(this).val() == $(el).closest('tr').find('td:eq(13)').text().split(',')[i]) {
                        $(this).prop('checked', true);
                    }
                }
            });
        }
    }
</script>