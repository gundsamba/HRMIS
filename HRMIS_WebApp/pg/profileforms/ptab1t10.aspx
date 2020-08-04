<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t10.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t10" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="well well-sm">
                <h4 class="text-primary" style="margin-bottom:5px;">Цэргийн алба хаасан эсэх</h4>
                <table class="table">
                    <tbody>
                        <tr>
                            <td style="width:50%;">Цэргийн алба хаасан эсэх:</td>
                            <td>
                                <label class="radio radio-inline no-margin" style="width:90px;">
							        <input id="ptab1t10IsCloseT1" name="ptab1t10IsClose" runat="server" type="radio" class="radiobox" value="1">
								    <span>Хаасан</span> 
							    </label>
                                <label class="radio radio-inline" style="width:90px;">
							        <input id="ptab1t10IsCloseT0" name="ptab1t10IsClose" runat="server" type="radio" class="radiobox" value="0">
								    <span>Хаагаагүй</span> 
							    </label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Цэргийн алба хаасан мэдээлэл <small>/ Цэргийн алба хаасан бол доорх мэдээллийг бөглөнө /</small> </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <a href="pg/modal/modalProfileTab1t10.aspx?staffsid=<%=Request.QueryString["id"]%>" class="btn btn-primary btn-xs" data-target="#myModalProfileTab1t10" data-toggle="modal"><i class="fa fa-plus"></i> Нэмэх</a>
                    </div>
                    <div id="loaderTab1T10Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T10Section2Table" class="widget-body no-padding">
                        <table id="tableBindTab1T10Section2Table" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%"></table>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div class="modal fade" id="myModalProfileTab1t10" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		</div>
	</div>
</div>
<script type="text/javascript">
    var table;
    dataBindTab1T10Section2Datatable();
    $('.radiobox').change(function () {
        var myEl = $(this);
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteNonQuery",
            data: '{qry:"UPDATE MILITARY_ISCLOSED SET MILITARY_ISCLOSED=' + myEl.val() + '  WHERE ID=' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                formTab1T10Percent();
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
    });
    $("body").on("click", "button.btn-delete-ptab1t10", function () {
        var elCurr = $(this);
        if (elCurr.closest('table').attr('id') == 'tableBindTab1T10Section2Table') {
            $.SmartMessageBox({
                title: "Мэдээлэл устгах устгах!",
                content: "Сонгосон цэргийн алба хаасан мэдээллийг устгах уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    var jsonData = {};
                    jsonData.pId = elCurr.closest('tr').attr('data-id');
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/DeleteProfileTab1T10Datatable1",
                        data: JSON.stringify(jsonData),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            var resData = jQuery.parseJSON(data.d);
                            if (resData.d.RetType == "0") {
                                $.smallBox({
                                    title: "Амжилттай устгагдлаа",
                                    content: "<i class='fa fa-clock-o'></i> <i>Цэргийн алба хаасан мэдээлэл амжилттай устгагдлаа...</i>",
                                    color: "#659265",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 3000
                                });
                                dataBindTab1T10Section2Datatable();
                            }
                            else {
                                if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                                else {
                                    alert(resData.d.RetDesc);
                                }
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
            });
        }
    });
    function dataBindTab1T10Section2Datatable() {
        showLoader('loaderTab1T10Section1');
        if (table != null) {
            table.destroy();
        }
        var valData = '';
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/profileTab1T10Datatable1",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<thead>';
                valData += '<tr>';
                valData += '<th>Д/д</th>';
                valData += '<th>Цэргийн үүрэгтний үнэмлэхийн дугаар</th>';
                valData += '<th>Цэргийн алба хаасан байдал</th>';
                valData += '<th>Тайлбар</th>';
                valData += '<th></th>';
                valData += '</tr>';
                valData += '</thead>';
                valData += '<tbody>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += '<tr data-id="' + value.ID + '">';
                            valData += '<td>' + (index + 1) + '</td>';
                            valData += '<td>' + value.CERTIFICATENO + '</td>';
                            valData += '<td>' + value.SITUATION + '</td>';
                            valData += '<td>' + value.DESC + '</td>';
                            valData += '<td><div class="btn-group">';
                            valData += '<a href="pg/modal/modalProfileTab1t10.aspx?id=' + value.ID + '&staffsid=<%=Request.QueryString["id"]%>" class="btn btn-default btn-xs" data-target="#myModalProfileTab1t10" data-toggle="modal"><i class="fa fa-pencil"></i></a>';
                            valData += '<button type="button" class="btn btn-default btn-xs btn-delete-ptab1t10"><i class="fa fa-trash-o"></i></button>';
                            valData += '</div></td>';
                            valData += "</tr>";
                        });
                    }
                }
                valData += '</tbody>';
                $("#tableBindTab1T10Section2Table").html(valData);
                table = $('#tableBindTab1T10Section2Table').DataTable({
                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                        "t" +
                        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                    "bDestroy": true,
                    aLengthMenu: [
                        [25, 50, 100, 200, -1],
                        [25, 50, 100, 200, "All"]
                    ],
                    "iDisplayLength": 100,
                    "oLanguage": {
                        "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>',
                        "sInfo": "Нийт _TOTAL_ -аас _START_ - _END_",
                        "sEmptyTable": "Илэрц олдсонгүй",
                        "sLengthMenu": "Илэрц _MENU_",
                        "oPaginate": {
                            "sNext": "Дараах",
                            "sPrevious": "Өмнөх"
                        },
                        "sEmptyTable": "Илэрц олдсонгүй"
                    },
                    "order": [[0, 'asc']],
                    "fnDrawCallback": function (oSettings) {
                        runAllCharts();
                    },
                    "columns": [
                        { "width": "30px" },
                        null,
                        null,
                        null,
                        { "width": "40px" }
                    ]
                });
                hideLoader('loaderTab1T10Section1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab1T10Section1');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }

</script>