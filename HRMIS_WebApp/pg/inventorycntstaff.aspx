<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventorycntstaff.aspx.cs" Inherits="HRWebApp.pg.inventorycntstaff" %>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Эд хөрөнгийн мэдээлэл <span>> Миний эд хөрөнгө > Тоологдсон хөрөнгө</span>
        </h1>
    </div>
</div>
<section>
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">            <input type="hidden" id="inputStaffId" runat="server" />            <div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">                <header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2><span id="spanStaffInfo" runat="server"></span>-д одоо харьяалагдаж байгаа эд хөрөнгийн тооллого.</h2>
                    <%--<div class="widget-toolbar">
						<a href="pg/modal/modalinventoryinterval.aspx" class="btn btn-primary" data-target="#myModal" data-toggle="modal" data-backdrop="static" data-keyboard="false"><i class="fa fa-plus"></i> Нэмэх</a>
					</div>--%>
				</header>                <div>
                    <div class="jarviswidget-editbox">
                    </div>
                    <div class="widget-body no-padding">
					    <div class="widget-head">
                            <label class="control-label" for="selectIntervalIsActive">Идэвхтэй эсэх</label>
                            <select class="form-control" id="selectInventory" runat="server" style="width:250px;">
						    </select>
                        </div>
                        <div id="loaderTab1" class="search-background" style="display: none; background: rgba(0, 0, 0, 0.3); margin: 0;">
                            <label>
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </label>
                        </div>
                        <table id="tableTab1Datatable" class="display projects-table table table-striped table-bordered table-hover" cellspacing="0" width="100%"></table>
                    </div>
                </div>            </div>        </article>
    </div>
</section><div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
		</div>
	</div>
</div>
<script type="text/javascript">
    var globalAjaxVar = null;
    var table = null;
    var pagefunction = function () {
        dataBindTab1Datatable();
    };
    $("#selectInventory").change(function () {
        dataBindTab1Datatable();
    });
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        if (table != null) {
            table.destroy();
        }
        var valData = '';
        var jsonData = {};
        jsonData.pIntervalId = $("#selectInventory option:selected").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/InventoryStaffCntTab1Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<thead>';
                valData += '<tr>';
                valData += '<th>#</th>';
                valData += '<th>Хөрөнгийн код</th>';
                valData += '<th>Хөрөнгийн нэр</th>';
                valData += '<th>Нэгж үнэ</th>';
                valData += '<th>Тоо/ш</th>';
                valData += '<th>Нийт үнэ</th>';
                valData += '<th>Тоологдсон тоо</th>';
                valData += '<th>Тоологдоогүй тайлбар</th>';
                valData += '<th></th>';
                valData += '</tr>';
                valData += '</thead>';
                valData += '<tbody>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += '<tr data-id="'+value.INV_ID+'">';
                            valData += '<td class="text-center">' + (index + 1) + '</td>';
                            valData += '<td>' + value.INV_CODE + '</td>';
                            valData += '<td>' + value.INV_NAME + '</td>';
                            valData += '<td class="text-right">' + (parseFloat(value.PRICE).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>';
                            valData += '<td class="text-center">' + value.END_QUANT + ' ' + value.INV_UNIT + '</td>';
                            valData += '<td class="text-right">' + (parseFloat(value.END_TOTAL).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>';
                            valData += '<td class="text-center">' + value.CNT + '</td>';
                            valData += '<td>' + value.DESC + '</td>';
                            valData += '<td>';
                            if (value.CNT == '') valData += '<div class="btn-group"><a href="pg/modal/modalinventorycntstaff.aspx?intervalid=' + $('#selectInventory option:selected').val()+'&invid=' + value.INV_ID + '&invprice=' + value.PRICE + '&staffid=' + $('#inputStaffId').val() +'" class="btn btn-default btn-xs" data-target="#myModal" data-toggle="modal">Тоологдоогүй тайлбар оруулах</a></div>';
                            valData += '</td>';
                            valData += "</tr>";
                        });
                    }
                }
                valData += '</tbody>';
                $("#tableTab1Datatable").html(valData);
                table = $('#tableTab1Datatable').DataTable( {
			        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>"+
				        "t"+
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
			        "fnDrawCallback": function( oSettings ) {
                        runAllCharts();
                    },
                    "columns": [
                        { "width": "20px" },
                        { "width": "100px" },
                        null,
                        { "width": "70px" },
                        { "width": "40px" },
                        { "width": "70px" },
                        { "width": "110px" },
                        null,
                        { "width": "150px" }
                    ]
                });
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab1');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $(document).ready(function () {
        pageSetUp();
        pagefunction();
    });
</script>