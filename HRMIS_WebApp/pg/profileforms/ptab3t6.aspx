<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab3t6.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab3t6" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Нөхөх төлбөрийн талаарх мэдээлэл <small>/ Төрийн албаны тухай хуулийн 59 дүгээр зүйлийн 59.1, 59.8-д заасан нөхөх төлбөрийг бичнэ /</small></h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <a href="pg/modal/modalProfileTab3t6.aspx?staffsid=<%=Request.QueryString["id"]%>" class="btn btn-primary btn-xs" data-target="#myModalProfileTab3t6" data-toggle="modal"><i class="fa fa-plus"></i> Нэмэх</a>
                    </div>
                    <div id="loaderTab3t6Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab3t6Section1Table" class="widget-body no-padding">
                        <table id="tableBindTab3t6Section1Table" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%"></table>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div class="modal fade" id="myModalProfileTab3t6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		</div>
	</div>
</div>
<script type="text/javascript">
    var table;
    dataBindTab3t6Section1Datatable();
    $("body").on("click", "button.btn-delete-ptab3t6", function () {
        var elCurr = $(this);
        if (elCurr.closest('table').attr('id') == 'tableBindTab3t6Section1Table') {
            $.SmartMessageBox({
                title: "Мэдээлэл устгах устгах!",
                content: "Сонгосон мэдээллийг устгах уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    var jsonData = {};
                    jsonData.pId = elCurr.closest('tr').attr('data-id');
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/DeleteProfileTab3t6Datatable1",
                        data: JSON.stringify(jsonData),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            var resData = jQuery.parseJSON(data.d);
                            if (resData.d.RetType == "0") {
                                $.smallBox({
                                    title: "Амжилттай устгагдлаа",
                                    content: "<i class='fa fa-clock-o'></i> <i>Мэдээлэл амжилттай устгагдлаа...</i>",
                                    color: "#659265",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 3000
                                });
                                dataBindTab3t6Section1Datatable();
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
    function dataBindTab3t6Section1Datatable() {
        showLoader('loaderTab3t6Section1');
        if (table != null) {
            table.destroy();
        }
        var valData = '';
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/profileTab3t6Datatable1",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<thead>';
                valData += '<tr>';
                valData += '<th rowspan="2">#</th>';
                valData += '<th colspan="3">Нөхөх төлбөр</th>';
                valData += '<th colspan="3">Шийдвэр</th>';
                valData += '<th rowspan="2">Олгосон үндэслэл</th>';
                valData += '<th rowspan="2"></th>';
                valData += '</tr>';
                valData += '<tr>';
                valData += '<th>Олгосон огноо</th>';
                valData += '<th>Нэр</th>';
                valData += '<th>Мөнгөн дүн /мян.төг/</th>';
                valData += '<th>Нэр</th>';
                valData += '<th>Огноо</th>';
                valData += '<th>Дугаар</th>';
                valData += '</tr>';
                valData += '</thead>';
                valData += '<tbody>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += '<tr data-id="' + value.ID + '" data-staffsid="' + value.STAFFS_ID+'">';
                            valData += '<td>' + (index + 1) + '</td>';
                            valData += '<td>' + value.DT + '</td>';
                            valData += '<td>' + value.NAME + '</td>';
                            valData += '<td>' + value.AMT + '</td>';
                            valData += '<td>' + value.TUSHAALNAME + '</td>';
                            valData += '<td>' + value.TUSHAALDT + '</td>';
                            valData += '<td>' + value.TUSHAALNO + '</td>';
                            valData += '<td>' + value.DESC + '</td>';
                            valData += '<td><div class="btn-group">';
                            valData += '<a href="pg/modal/modalProfileTab3t6.aspx?id=' + value.ID + '&staffsid=<%=Request.QueryString["id"]%>" class="btn btn-default btn-xs" data-target="#myModalProfileTab3t6" data-toggle="modal"><i class="fa fa-pencil"></i></a>';
                            valData += '<button type="button" class="btn btn-default btn-xs btn-delete-ptab3t6"><i class="fa fa-trash-o"></i></button>';
                            valData += '</div></td>';
                            valData += "</tr>";
                        });
                    }
                }
                valData += '</tbody>';
                $("#tableBindTab3t6Section1Table").html(valData);
                table = $('#tableBindTab3t6Section1Table').DataTable({
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
                        { "width": "20px" },
                        { "width": "63px" },
                        null,
                        { "width": "125px" },
                        null,
                        { "width": "63px" },
                        null,
                        null,
                        { "width": "40px" }
                    ]
                });
                hideLoader('loaderTab3t6Section1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab3t6Section1');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
</script>