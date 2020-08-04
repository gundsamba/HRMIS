<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventorylist.aspx.cs" Inherits="HRWebApp.pg.inventorylist" %>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Тоологдох эд хөрөнгийн жагсаалт
        </h1>
    </div>
</div>
<div id="divContentInfo" runat="server" class="row hide">
	<div class="col-sm-12">
        <div id="divContentInfoContent" runat="server" class="alert alert-warning fade in">
			<i class="fa-fw fa fa-warning"></i>
			<strong>Анхааруулга</strong> Acolous системтэй холбогдож чадсангүй.
		</div>
    </div>
</div>
<section id="divContentContent" runat="server" class="">
	<div class="row">        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">                <header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2>Тоологдох эд хөрөнгийн жагсаалт</h2>
				</header>                <div>
                    <div class="jarviswidget-editbox">
                    </div>
                    <div class="widget-body">
                        <div id="divDatatableTab1" runat="server" class="widget-body no-padding">
                        </div>
                    </div>
                </div>            </div>        </article>    </div></section><div class="modal fade" id="myModalInventoryQRCode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
            <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		            &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">Хөрөнгийн QR Code</h4>
            </div>
            <div class="modal-body">
                <div class="row">
		            <div id="divQRCode" class="col-sm-12 text-center"></div>
                    <div id="divInvCode" class="col-sm-12 text-center"> </div>
                </div>
            </div>
		</div>
	</div>
</div><script src="../js/plugin/qrcode/qrcode.js"></script><script>    var dataTable1 = null;    var pagefunction = function () {        dataTable1 = $('#tableDatatableTab1').DataTable({
            "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                "t" +
                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
            "bDestroy": true,
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
                "sEmptyTable": "Хайсан илэрц олдсонгүй"
            },
            "order": [[0, 'asc']],
            "fnDrawCallback": function (oSettings) {
                runAllCharts();
            },
            "columns": [
                { "width": "30px" },
                { "width": "50px" },
                null,
                { "width": "80px" },
                { "width": "80px" },
                { "width": "80px" },
                { "width": "70px" }
            ],
            "autoWidth": true
        });    };    $("body").on("click", "button.btn-show-qrcode", function () {
        var elCurr = $(this);
        if (elCurr.closest('table').attr('id') == 'tableDatatableTab1') {
            $('#divQRCode').empty();
            var valQRCode = elCurr.closest('tr').attr('data-invid')+'~'+elCurr.closest('tr').find('td:eq(3)').attr('data-price');
            $('#divQRCode').qrcode({ width: 250, height: 250, text: valQRCode });
            $('#divInvCode').html(elCurr.closest('tr').find('td:eq(1)').text());
            $('#myModalInventoryQRCode').modal('show');
        }
    });    $(document).ready(function () {
        pageSetUp();
        pagefunction();
    });</script>