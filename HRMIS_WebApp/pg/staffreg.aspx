<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffreg.aspx.cs" Inherits="HRWebApp.pg.staffreg" %>
<style>
    .stafflistimage {
        width: 25px;
        border-radius: 0;
    }
</style>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
    <i class="fa-fw fa fa-home"></i>
    <span>> Ажилтаны бүртгэл</span>
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
                    <h2 id="pTab1H2Title" runat="server">Ажилтаны бүртгэл</h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <%--<button id="pTab1AddBtn" runat="server" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>--%>
                        <a id="pTab1AddBtn" runat="server" href="pg/modal/modalStaffReg.aspx" class="btn btn-primary btn-xs" data-target="#myModal" data-toggle="modal" data-backdrop="static"><i class="fa fa-plus"></i> Нэмэх</a>
                    </div>
                    <div class="Colvis TableTools" style="width:155px; right:195px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectType" name="pTab1SelectType" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:355px; top:4px; z-index:5; margin-top:7px;"><label>Төлөв:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:400px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectHeltes" name="pTab1SelectHeltes" runat="server" class="form-control" style="padding: 1px;" disabled="disabled">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:490px; top:4px; z-index:5; margin-top:7px;"><label>Хэлтэс:</label></div>
                    <div class="Colvis TableTools" style="width:80px; right:545px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectGazar" name="pTab1SelectGazar" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:635px; top:4px; z-index:5; margin-top:7px;"><label>Газар:</label></div>
                    <div class="Colvis TableTools" style="width:150px; right:685px; top:5px; z-index:5; margin-top:1px;">
                        <select id="pTab1SelectPos" name="pTab1SelectPos" runat="server" class="form-control" style="padding: 1px;">
							<option value="">- Бүгд -</option>
						</select>
                    </div>
                    <div class="Colvis TableTools" style="right:845px; top:4px; z-index:5; margin-top:7px;"><label>Албан тушаал:</label></div>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		</div>
	</div>
</div>
<div class="modal fade" id="dashboardStaffAnketPrint" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
	<div class="modal-dialog modal-lg" style="width:70%;">
        <div style="width:56%; display:block; height: 35px; margin:0 auto;">
            <div class="btn-group pull-right">
                <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="left" data-original-title="Word татах" onclick="exportWord('#dashboardStaffAnketPrintContent', 'Анкет')">
                    <i class="fa fa-file-word-o"></i>
                </a>
                <a href="javascript:void(0);" class="btn btn-default printBtn" rel="tooltip" data-placement="right" data-original-title="Хэвлэх" onclick="PrintElem('#dashboardStaffAnketPrintContent')">
                    <i class="fa fa-print"></i>
                </a>
            </div>
        </div>
		<%--<div id="dashboardStaffAnketPrintContent" class="modal-content reports" style="width:56%;">
			
		</div>--%>
        <div id="dashboardStaffAnketPrintContent" class="modal-content A4">
			
		</div>
	</div>  
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var table = null;
    var pagefunction = function () {
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
    $("#pTab1SelectPos, #pTab1SelectHeltes, #pTab1SelectType").change(function () {
        dataBindTab1Datatable();
    });
    $("#pTab1SelectGazar").change(function () {
        if ($("#pTab1SelectGazar option:selected").val() == "") {
            $("#pTab1SelectHeltes").html("<option selected value=\"\">- Бүгд -</option>");
            $("#pTab1SelectHeltes").prop("disabled", true);
            dataBindTab1Datatable();
        }
        else {
            var valData = '';
            var jsonData = {};
            jsonData.gazarId = $("#pTab1SelectGazar option:selected").val();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/HeltesListForDDL",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $(resData).each(function (index, value) {
                        valData += '<option value="' + value.ID + '">' + value.INITNAME + '</option>';
                    });
                    $("#pTab1SelectHeltes").html(valData);
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
        var valIsMove = '0';
        if ($.trim($('#pTab1H2Title').html()) == "Бүрэлдэхүүн хөдөлгөөн") valIsMove = '1';
        showLoader('loaderTab1');
        if (table != null) {
            table.destroy();
        }
        var valData = '';
        var jsonData = {};
        jsonData.pos = $("#pTab1SelectPos option:selected").val();
        jsonData.gazar = $("#pTab1SelectGazar option:selected").val();
        jsonData.heltes = $("#pTab1SelectHeltes option:selected").val();
        jsonData.tp = $("#pTab1SelectType option:selected").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/StaffsTable",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<table id=\"staffregTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>';
                valData += '<tr>';
                valData += "<th>&nbsp;</th>";
                valData += "<th>Регистер</th>";
                valData += "<th>Домайн нэр</th>";
                valData += "<th>Нэгж</th>";
                valData += "<th>Эцэг(эх)-н нэр</th>";
                valData += "<th>Өөрийн нэр</th>";
                valData += "<th>Албан тушаал</th>";
                valData += "<th>Хүйс</th>";
                valData += "<th>ТАХ анкет хэвлэх</th>";
                valData += "<th>А/Т/Т</th>";
                valData += "<th>Гар утас</th>";
                valData += "<th>Хур/хээ код</th>";
                valData += "<th>Төлөв</th>";
                valData += "<th>&nbsp;</th>";
                valData += '</tr>';
                valData += '</thead>';
                valData += '<tbody>';
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            valData += '<tr data-id="' + value.STAFFS_ID + '">';
                            valData += "<td class=\"no-padding\" style=\"padding-left:5px!important;\">";
                            if (value.IMAGE != "") valData += "<img src=\"../files/staffs/" + value.IMAGE + "\" class=\"stafflistimage\">";
                            else valData += "<img src=\"../img/avatars/male.png\" class=\"stafflistimage\">";
                            valData += "</td>";
                            if (valIsMove == "1") valData += "<td><a class=\"btn btn-link btn-xs no-padding\" href=\"../#pg/profile.aspx?id=" + value.STAFFS_ID + "&ismove=1\">" + value.REGNO + "</a></td>";
                            else valData += "<td><a class=\"btn btn-link btn-xs no-padding\" href=\"../#pg/profile.aspx?id=" + value.STAFFS_ID + "\">" + value.REGNO + "</a></td>";
                            valData += "<td>" + value.DOMAIN_USER + "</td>";
                            valData += "<td>" + value.NEGJ + "</td>";
                            valData += "<td>" + value.LNAME + "</td>";
                            valData += "<td>" + value.FNAME + "</td>";
                            valData += "<td>" + value.POS_NAME + "</td>";
                            valData += "<td>" + value.GENDER + "</td>";
                            valData += "<td><div class=\"btn-group\"><a href='../pg/modal/modalStaffAnketPrint.aspx?id=" + value.STAFFS_ID + "' class='btn btn-xs bg-color-teal txt-color-white' data-target='#dashboardStaffAnketPrint' data-toggle='modal'> <i class='fa fa-print'></i> 1</a><a href='../pg/modal/modalStaffAnketPrint2.aspx?id=" + value.STAFFS_ID + "' class='btn btn-xs bg-color-teal txt-color-white' data-target='#dashboardStaffAnketPrint' data-toggle='modal'> <i class='fa fa-print'></i> 2</a></div></td>";
                            valData += "<td>" + value.POSTYPE_NAME + "</td>";
                            valData += "<td>" + value.TEL + "</td>";
                            valData += "<td>" + value.FINGERID + "</td>";
                            valData += "<td><span class=\"label " + value.COLOR + "\">" + value.TP + "</span></td>";
                            valData += '<td>';
                            if (valIsMove == "0") valData += '<div class="btn-group"><a href="pg/modal/modalStaffReg.aspx?id=' + value.STAFFS_ID + '" class="btn btn-default btn-xs" data-target="#myModal" data-toggle="modal"><i class="fa fa-pencil"></i></a></div>';
                            valData += '</td>';
                            valData += "</tr>";
                        });
                    }
                }
                valData += '</tbody></table>';
                $("#divBindTab1Table").html(valData);
                table = $('#staffregTab1Datatable').DataTable({
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
                        //runAllCharts();
                    },
                    "columns": [
                        { "width": "10px" },
                        { "width": "80px" },
                        { "width": "80px" },
                        { "width": "100px" },
                        null,
                        null,
                        null,
                        null,
                        { "width": "65px" },
                        null,
                        null,
                        null,
                        { "width": "80px" },
                        { "width": "10px" }
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
    
    
</script>