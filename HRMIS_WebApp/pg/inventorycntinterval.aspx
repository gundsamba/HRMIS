<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventorycntinterval.aspx.cs" Inherits="HRWebApp.pg.inventorycntinterval" %>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Эд хөрөнгийн мэдээлэл <span>> Эд хөрөнгийн тооллого</span>
        </h1>
    </div>
</div>
<section class="">
	<div class="row">        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">            <div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">                <header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2>Эд хөрөнгийг тоолох интервал бүртгэл</h2>
                    <div class="widget-toolbar">
						<a href="pg/modal/modalinventoryinterval.aspx" class="btn btn-primary" data-target="#myModal" data-toggle="modal" data-backdrop="static" data-keyboard="false"><i class="fa fa-plus"></i> Нэмэх</a>
					</div>
				</header>                <div>
                    <div class="jarviswidget-editbox">
                    </div>
                    <div class="widget-body no-padding">
					    <div class="widget-head">
                            <label class="control-label" for="selectIntervalIsActive">Идэвхтэй эсэх</label>
                            <select class="form-control" id="selectIsActive" style="width:100px;">
							    <option value="" selected="">Бүгд</option>
							    <option value="1">Идэвхтэй</option>
							    <option value="0">Идэвхгүй</option>
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
                </div>            </div>        </article>    </div></section><div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
		</div>
	</div>
</div><script type="text/javascript">
    var globalAjaxVar = null;
    var table = null;
    var pagefunction = function () {
        dataBindTab1Datatable();
    };
    $("#selectIsActive").change(function () {
        dataBindTab1Datatable();
    });
    $("body").on("click", "button.btn-delete-inventoryinterval", function () {
        var elCurr = $(this);
        if (elCurr.closest('table').attr('id') == 'tableTab1Datatable') {
            $.SmartMessageBox({
                title: "Эд хөрөнгийн тооллого устгах!",
                content: "Сонгосон эд хөрөнгийн тооллогыг устгах уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    var jsonData = {};
                    jsonData.pId = elCurr.closest('tr').attr('data-id');
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/DeleteInventoryIntervalData",
                        data: JSON.stringify(jsonData),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            var resData = jQuery.parseJSON(data.d);
                            if (resData.d.RetType == "0") {
                                $.smallBox({
                                    title: "Амжилттай устгагдлаа",
                                    content: "<i class='fa fa-clock-o'></i> <i>Эд хөрөнгийн тооллого амжилттай устгагдлаа...</i>",
                                    color: "#659265",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 3000
                                });
                                dataBindTab1Datatable();
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
    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        if (table != null) {
            table.destroy();
        }
        var valData = '';
        var jsonData = {};
        jsonData.isactive = $("#selectIsActive option:selected").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/InventoryIntervalTab1Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<thead>';
                valData += '<tr>';
                valData += '<th>#</th>';
                valData += '<th>Нэр</th>';
                valData += '<th>Идэвхтэй эсэх</th>';
                valData += '<th></th>';
                valData += '<th></th>';
                valData += '</tr>';
                valData += '</thead>';
                valData += '<tbody>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += '<tr data-id="'+value.ID+'">';
                            valData += '<td>' + (index+1)+ '</td>';
                            valData += '<td>' + value.NAME + '</td>';
                            if (value.ISACTIVE == '1') valData += '<td><span class="label label-success">Идэвхтэй</span></td>';
                            else valData += '<td><span class="label label-default">Идэвхгүй</span></td>';
                            valData += '<td>';
                            if (value.ISACTIVE == '1') valData += '<div class="btn-group"><a href="#pg/inventorycnt.aspx?id=' + value.ID + '" class="btn btn-primary btn-xs">Тооллого эхлүүлэх</a></div>';
                            valData += '</td>';
                            valData += '<td><div class="btn-group">';
                            valData += '<a href="pg/modal/modalinventoryinterval.aspx?id=' + value.ID + '" class="btn btn-default btn-xs" data-target="#myModal" data-toggle="modal"><i class="fa fa-pencil"></i></a>';
                            valData += '<button type="button" class="btn btn-default btn-xs btn-delete-inventoryinterval"><i class="fa fa-trash-o"></i></button>';
                            valData += '</div></td>';
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
                        null,
                        { "width": "100px" },
                        { "width": "95px" },
                        { "width": "40px" }
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