<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab2t7.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab2t7" %>
<div class="row" style="padding-top:10px;">
    <div class="col-sm-12">
        <div class="well well-sm">
            <fieldset>
                <legend>Албан хаагчийн ажлын хөдөлгөөний мэдээлэл</legend>
                <div class="row">
                    <div id="loaderTab2T7" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center" style="vertical-align:middle; width:35px;">#</th>
                                    <th class="text-center" style="vertical-align:middle; width:100px;">Томилогдсон огноо</th>
                                    <th class="text-center" style="vertical-align:middle;">А/Т-н төрөл</th>
                                    <th class="text-center" style="vertical-align:middle;">Албан тушаал</th>
                                    <th class="text-center" style="vertical-align:middle;">Зэрэглэл</th>
                                    <th class="text-center" style="vertical-align:middle;">Нэгж</th>
                                    <th class="text-center" style="vertical-align:middle;">Хөдөлгөөн</th>
                                    <th class="text-center" style="vertical-align:middle;">Тайлбар</th>
                                    <th class="text-center" style="vertical-align:middle; width:65px;">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody id="ptab2t7DivTableTbody" runat="server">
                            
                            </tbody>
                        </table>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<div id="pTab2t7Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="pTab2t7ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Ажилласан түүх засварлах</h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab2t7ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Харьяалагдах байгууллага</label>
                                    <select id="pTab2t7ModalSelectOrg" name="pTab2t7ModalSelectOrg" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Харьяалагдах нэгж</label>
                                    <select id="pTab2t7ModalSelectBranch" name="pTab2t7ModalSelectBranch" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Домайн нэр</label>
                                    <input id="pTab2t7ModalInputDomainname" name="pTab2t7ModalInputDomainname" runat="server" type="text" class="form-control" placeholder="Домайн нэр" disabled/>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">*Хөдөлгөөн</label>
                                    <select id="pTab2t7ModalSelectMove" name="pTab2t7ModalSelectMove" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Албан тушаал төрөл</label>
                                    <select id="pTab2t7ModalSelectPostype" name="pTab2t7ModalSelectPostype" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Албан тушаал</label>
                                    <select id="pTab2t7ModalSelectPos" name="pTab2t7ModalSelectPos" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Албаны ангилал зэрэглэл</label>
                                    <select id="pTab2t7ModalSelectRank" name="pTab2t7ModalSelectRank" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">*Томил/огноо</label>
                                    <input id="pTab2t7ModalInputSigndate" name="pTab2t7ModalInputSigndate" runat="server" type="text" class="form-control" placeholder="Томил/огноо" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Тушаалын огноо</label>
                                    <input id="pTab2t7ModalInputTushaaldate" name="pTab2t7ModalInputTushaaldate" runat="server" type="text" class="form-control" placeholder="Тушаалын огноо" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Тушаалын дугаар</label>
                                    <input id="pTab2t7ModalInputTushaalno" name="pTab2t7ModalInputTushaalno" runat="server" type="text" class="form-control" placeholder="Тушаалын дугаар" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Нэмэлт тайлбар</label>
                                    <input id="pTab2t7ModalInputDescription" name="pTab2t7ModalInputDescription" runat="server" type="text" class="form-control" placeholder="Нэмэлт тайлбар" />
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
    globalAjaxVar = $.ajax({
        type: "POST",
        url: "ws.aspx/staffreg_staffregTab1ModalBranchForDDL",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            $("#pTab2t7ModalSelectBranch").html('<option value="">- Сонго -</option>' + msg.d);
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/staffreg_staffregTab1ModalRankForDDL",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab2t7ModalSelectRank").html(msg.d);
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/staffreg_staffregTab1ModalMoveForDDL",
                        data: '{tp:""}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            $("#pTab2t7ModalSelectMove").html(msg.d);

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
    function dataBindTab2T7Datatable1() {
        showLoader('loaderTab2T7');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab2T7Datatable1",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#ptab2t7DivTableTbody").html(msg.d);
                hideLoader('loaderTab2T7');
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
    function showEditTab2t7(el) {
        $('#pTab2t7ID').html($(el).closest('tr').attr('data-id'));
        $('#pTab2t7ModalSelectBranch').val($(el).closest('tr').find('td:eq(5)').attr('data-id'));
        $('#pTab2t7ModalInputDomainname').val($(el).closest('tr').attr('data-domainuser'));
        $('#pTab2t7ModalSelectMove').val($(el).closest('tr').find('td:eq(6)').attr('data-id'));
        $('#pTab2t7ModalSelectPostype').val($(el).closest('tr').find('td:eq(2)').attr('data-id'));
        $('#pTab2t7ModalSelectPos').val($(el).closest('tr').find('td:eq(3)').attr('data-id'));
        $('#pTab2t7ModalSelectRank').val($(el).closest('tr').find('td:eq(4)').attr('data-id'));
        $('#pTab2t7ModalInputSigndate').val($(el).closest('tr').find('td:eq(1)').html());
        $('#pTab2t7ModalInputTushaaldate').val($(el).closest('tr').attr('data-tushaaldate'));
        $('#pTab2t7ModalInputTushaalno').val($(el).closest('tr').attr('data-tushaalno'));
        if ($(el).closest('tr').find('td:eq(7)').html() == '-') $('#pTab2t7ModalInputDescription').val('');
        else $('#pTab2t7ModalInputDescription').val($(el).closest('tr').find('td:eq(7)').html());
    }
    function showDeleteTab2t7(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон ХӨДӨЛГӨӨНИЙГ устгахад итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_STBR WHERE ID=' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2T7Datatable1();
                        $('#pTab2t7Modal').modal('hide');
                        smallBox('Хөдөлгөөн', 'Амжилттай устгагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert(response.d);
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
    $('#pTab2t7ModalForm').bootstrapValidator({
        fields: {
            pTab2t7ModalSelectOrg: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2t7ModalSelectBranch: {
                group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2t7ModalInputDomainname: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    }
                }
            },
            pTab2t7ModalSelectMove: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2t7ModalSelectPostype: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2t7ModalSelectPos: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2t7ModalInputSigndate: {
                group: '.col-md-2',
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
            pTab2t7ModalInputTushaaldate: {
                group: '.col-md-2',
                validators: {
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab2t7ModalInputTushaalno: {
                group: '.col-md-2',
                validators: {
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    }
                }
            },
            pTab2t7ModalInputDescription: {
                group: '.col-md-6',
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
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteScalar",
                data: '{qry:"SELECT COUNT(1) FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE c.ACTIVE=1 AND a.DOMAIN_USER=\'' + $.trim($('#pTab2t7ModalInputDomainname').val()) + '\' AND a.ID!=b.STAFFS_ID"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d != '0') alert($.trim($('#pTab2t7ModalInputDomainname').val()) + ' домайн нэртэй идэвхтэй хэрэглэгч бүртгэгдсэн байна!');
                    else {
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "ws.aspx/WSOracleExecuteNonQuery",
                            data: '{qry:"UPDATE ST_STBR SET DT=\'' + $.trim($('#pTab2t7ModalInputSigndate').val()) + '\', BRANCH_ID=' + $('#pTab2t7ModalSelectBranch option:selected').val() + ', POSTYPE_ID=' + $('#pTab2t7ModalSelectPostype option:selected').val() + ', POS_ID=' + $('#pTab2t7ModalSelectPos option:selected').val() + ', RANK_ID=' + strQryIsNull('varchar', $('#pTab2t7ModalSelectRank option:selected').val()) + ', TUSHAALDATE=' + strQryIsNull('varchar', $.trim($('#pTab2t7ModalInputTushaaldate').val())) + ', TUSHAALNO=' + strQryIsNull('varchar', $.trim($('#pTab2t7ModalInputTushaalno').val())) + ', MOVE_ID=' + $('#pTab2t7ModalSelectMove option:selected').val() + ', DESCRIPTION=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab2t7ModalInputDescription').val()))) + ', UPDATED_STAFFID=' + $.trim($('#indexUserId').html()) + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab2t7ID').html() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function () {
                                dataBindTab2T7Datatable1();
                                $('#pTab2t7Modal').modal('hide');
                                smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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

    $('#pTab2t7ModalInputSigndate, #pTab2t7ModalInputTushaaldate').datepicker({
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
