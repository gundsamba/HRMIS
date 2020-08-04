<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab3t2.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab3t2" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Албан тушаалын томилгоо </h2>
                </header>
                <div>
                    <div id="loaderTab3T2Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab3T2Section1Table" class="widget-body no-padding">
                        <table id="tableBindTab3T2Section1Table" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%"></table>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div class="modal fade" id="myModalProfileTab3t2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		</div>
	</div>
</div>
<script type="text/javascript">
    var table;
    dataBindTab3T2Section1Datatable();
    function dataBindTab3T2Section1Datatable() {
        showLoader('loaderTab3T2Section1');
        if (table != null) {
            table.destroy();
        }
        var valData = '';
        var jsonData = {};
        jsonData.pStaffsId = <%=Request.QueryString["id"]%>;
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/profileTab3T2Datatable1",

            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<thead>';
                valData += '<tr>';
                valData += '<th rowspan="2">Д/д</th>';
                valData += '<th colspan="4">Томилогдсон</th>';
                valData += '<th colspan="4">Өөрчилсөн</th>';
                valData += '<th rowspan="2"></th>';
                valData += '</tr>';
                valData += '<tr>';
                valData += '<th>Албан тушаалын нэр</th>';
                valData += '<th>Огноо</th>';
                valData += '<th>Шийдвэрийн нэр</th>';
                valData += '<th>Дугаар</th>';
                valData += '<th>Огноо</th>';
                valData += '<th>Шийдвэрийн нэр</th>';
                valData += '<th>Дугаар</th>';
                valData += '<th>Шалтгаан</th>';
                valData += '</tr>';
                valData += '</thead>';
                valData += '<tbody>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += '<tr data-id="' + value.ID + '" data-table="' + value.TBL + '">';
                            valData += '<td>' + (index + 1) + '</td>';
                            valData += '<td>' + value.TITLE + '</td>';
                            valData += '<td>' + value.DT + '</td>';
                            valData += '<td>' + value.TUSHAALNAME + '</td>';
                            valData += '<td>' + value.TUSHAALNO + '</td>';
                            valData += '<td>' + value.CHANGEDTUSHAALDATE + '</td>';
                            valData += '<td>' + value.CHANGEDTUSHAALNAME + '</td>';
                            valData += '<td>' + value.CHANGEDTUSHAALNO + '</td>';
                            valData += '<td>' + value.CHANGEDREASON + '</td>';
                            valData += '<td><div class="btn-group">';
                            valData += '<a href="pg/modal/modalProfileTab3t2.aspx?id=' + value.ID + '&staffsid=<%=Request.QueryString["id"]%>&tbl=' + value.TBL +'" class="btn btn-default btn-xs" data-target="#myModalProfileTab3t2" data-toggle="modal"><i class="fa fa-pencil"></i></a>';
                            valData += '</div></td>';
                            valData += "</tr>";
                        });
                    }
                }
                valData += '</tbody>';
                $("#tableBindTab3T2Section1Table").html(valData);
                table = $('#tableBindTab3T2Section1Table').DataTable({
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
                        { "width": "63px" },
                        null,
                        null,
                        { "width": "63px" },
                        null,
                        null,
                        null,
                        { "width": "16px" }
                    ]
                });
                hideLoader('loaderTab3T2Section1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab3T2Section1');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
</script>