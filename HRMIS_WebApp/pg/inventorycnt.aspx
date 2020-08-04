<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventorycnt.aspx.cs" Inherits="HRWebApp.pg.inventorycnt" %>
<style type="text/css">
    #v{
    width:320px;
    height:240px;
}
#qr-canvas{
    display:none;
}
#outdiv
{
    width:326px;
    height:246px;
	border: solid;
	border-width: 3px 3px 3px 3px;
    margin:0 auto;
}
</style>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Эд хөрөнгийн мэдээлэл <span>> Эд хөрөнгийн тооллого > Эд хөрөнгө тоолох</span>
        </h1>
    </div>
</div>
<div class="row">
    <div id="loaderContent" class="search-background" style="display: none; background: rgba(0, 0, 0, 0.3); margin: -10px -14px;">
        <label>
            <img width="32" height="" src="img/loading.gif"/>
            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна...</h2>
        </label>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-4 col-lg-offset-4">
        <div id="divIntervalInfo" runat="server" class="alert alert-info margin-bottom-5">
			<i class="fa-fw fa fa-info"></i> 
		</div>
        <form action="#" class="smart-form">
            <fieldset style="padding: 0; background:none;">
                <section>
					<label class="label">Дотоод нэгж</label>
					<label class="select">
						<select id="selectBranch" runat="server" class="input-lg">
							<option value="">Сонго...</option>
						</select> <i></i> </label>
				</section>
                <section>
					<label class="label">Ажилтан</label>
					<label class="select state-disabled">
						<select id="selectStaff" runat="server" class="input-lg" disabled="disabled">
							<option value="" selected="selected">Сонго...</option>
						</select> <i></i> </label>
				</section>
            </fieldset>
        </form>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-4 col-lg-offset-4">
        <a class="btn btn-link btn-sm pull-right disabled" href="javascript:void(0);" id="btnShowCountedInventory" data-target="#myModalCounted" data-toggle="modal" data-backdrop="static" data-keyboard="false">Нийт (<span id="spanShowCountedInventory">0</span>) хөрөнгө бүртгэгдсэн</a>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-4 col-lg-offset-4 text-center">
        <div class="note no-margin">Доорх камерт хөрөнгийн QR Code уншуулна уу</div>
        <video id="qr-video" style="width:100%;"></video>
        <%--<div id="outdiv"></div>--%>
    </div>
</div>
<canvas id="qr-canvas" width="800" height="600"></canvas>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
            <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		            &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">Эд хариуцагч дээр бүртгэх</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="inputMyModalInvIntervalId" runat="server"/>
                <input type="hidden" id="inputMyModalStaffId"/>
                <input type="hidden" id="inputMyModalInvId"/>
                <input type="hidden" id="inputMyModalInvPrice"/>
                <div class="row">
		            <div class="col-sm-12">
                        <strong>Эд хариуцагч</strong>
                        <p id="pMyModalStaffInfo"></p>
                        <strong>Хөрөнгө</strong>
                        <table id="tableMyModalInventoryInfo" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">Код</th>
                                    <th class="text-center">Нэр</th>
                                    <th class="text-center">Тоо/ш</th>
                                    <th class="text-center">Нэгж үнэ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center"></td>
                                    <td class="text-left"></td>
                                    <td class="text-center"></td>
                                    <td class="text-right"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="divUnregisterInventory" class="row hide">
		            <div class="col-sm-12 smart-form">
                        <h5>Хэрэглэгчийн бүртгэлгүй хөрөнгө</h5>
                        <section>
					        <label class="label">Хэнээс ирсэн</label>
					        <label class="select">
						        <select id="selectMyModalFromStaff" runat="server" class="input-lg">
							        <option value="" selected="selected">Сонго...</option>
						        </select> <i></i>
					        </label>
				        </section>
                        <section>
					        <label class="label">Тайлбар</label>
                            <label class="textarea textarea-resizable"> 										
							    <textarea id="inputMyModalDescription" rows="2" class="custom-scroll"></textarea> 
						    </label>
                        </section>
		            </div>
                </div>
                <div class="row">
		            <div class="col-sm-12">
                        <button id="btnMyModalSave" type="button" class="btn btn-success btn-lg btn-block">ТООЛЛОГОД БҮРТГЭХ</button>
                        <button id="btnMyModalCancel" type="button" class="btn btn-default btn-sm btn-block">БОЛИХ</button>
                    </div>
                </div>
            </div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModalCounted" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
		</div>
	</div>
</div>
<script src="../js/plugin/instascan/instascan.min.js"></script>
<%--<script src="../js/plugin/webqr/llqrcode.js"></script>
<script src="../js/plugin/webqr/plusone.js"></script>
<script src="../js/plugin/webqr/webqr.js"></script>--%>
<script type="text/javascript">
    var globalAjaxVar = null;
    var table = null;
    var f = document.createElement("audio");
    function funcQRCodeRead(content) {
        if ($('#selectStaff option:selected').val() != '') {
            showLoader('loaderContent');
            var elSelectStaff = $('#selectStaff option:selected');
            var valContent = content;
            var valContentInvId = valContent.split('~')[0];
            var valContentInvPrice = valContent.split('~')[1];
            var jsonData = {};
            jsonData.invid = valContentInvId;
            jsonData.price = valContentInvPrice;
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/GetInventoryData",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    if (resData.d.RetType == "0") {
                        if (resData.d.RetData.length > 0) {
                            $('#pMyModalStaffInfo').html($('#selectBranch option:selected').text() + '-н ' + elSelectStaff.text());
                            $(resData.d.RetData).each(function (index, value) {
                                if (index == 0) {
                                    $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(0)').html(value.INV_CODE);
                                    $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(1)').html(value.INV_NAME);
                                    $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(2)').html(value.END_QUANT + ' ' + value.INV_UNIT);
                                    $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(2)').attr('data-invunit', value.INV_UNIT);
                                    $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(3)').html((parseFloat(value.PRICE).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                                    $('#inputMyModalStaffId').val(elSelectStaff.val());
                                    $('#inputMyModalInvId').val(valContentInvId);
                                    $('#inputMyModalInvPrice').val(valContentInvPrice);

                                    $('#divUnregisterInventory').addClass('hide');
                                    $('#selectMyModalFromStaff, #inputMyModalDescription').val('');
                                    var jsonData2 = {};
                                    jsonData2.pStaffId = elSelectStaff.val();
                                    jsonData2.pPrice = valContentInvPrice;
                                    jsonData2.pId = valContentInvId;
                                    console.log(JSON.stringify(jsonData2));
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "../webservice/ServiceMain.svc/IsMyInv",
                                        data: JSON.stringify(jsonData2),
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (data) {
                                            console.log(data);
                                            resData = jQuery.parseJSON(data.d);
                                            if (resData.d.RetType == "0") {
                                                if (resData.d.RetData.length == 0) $('#divUnregisterInventory').removeClass('hide');
                                                $('#myModal').modal('show');
                                                hideLoader('loaderContent');
                                                f.setAttribute("src", "../sound/voice_on.mp3"), f.addEventListener("load", function () {
                                                    f.play()
                                                }, !0), f.pause(), f.play();
                                            }
                                            else {
                                                if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                                                else {
                                                    hideLoader('loaderContent');
                                                    alert(resData.d.RetDesc);
                                                }
                                            }
                                        },
                                        failure: function (response) {
                                            hideLoader('loaderContent');
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                }
                            });
                        }
                        else {
                            hideLoader('loaderContent');
                            alert('Уншуулсан хөрөнгө олдсонгүй! Тухайн хөрөнгө ямар нэгэн эд хариуцагч буюу ажилтан дээр оноогдсон актлагдаагүй хөрөнгө байх ёстой.');
                        }
                    }
                    else {
                        if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                        else {
                            hideLoader('loaderContent');
                            alert(resData.d.RetDesc);
                        }
                    }
                },
                failure: function (response) {
                    hideLoader('loaderContent');
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
        else alert('Ажилтан заавал сонгоно уу!');
    }
    var pagefunction = function () {
        //load();
        
        let scanner = new Instascan.Scanner({ video: document.getElementById('qr-video'), scanPeriod: 5 });
        scanner.addListener('scan', function (content) {
            console.log(content);
            if ($('#selectStaff option:selected').val() != '') {
                showLoader('loaderContent');
                var elSelectStaff = $('#selectStaff option:selected');
                var valContent = content;
                var valContentInvId = valContent.split('~')[0];
                var valContentInvPrice = valContent.split('~')[1];
                var jsonData = {};
                jsonData.invid = valContentInvId;
                jsonData.price = valContentInvPrice;
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/GetInventoryData",
                    data: JSON.stringify(jsonData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var resData = jQuery.parseJSON(data.d);
                        if (resData.d.RetType == "0") {
                            if (resData.d.RetData.length > 0) {
                                $('#pMyModalStaffInfo').html($('#selectBranch option:selected').text() + '-н ' + elSelectStaff.text());
                                $(resData.d.RetData).each(function (index, value) {
                                    if (index == 0) {
                                        $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(0)').html(value.INV_CODE);
                                        $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(1)').html(value.INV_NAME);
                                        $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(2)').html(value.END_QUANT + ' ' + value.INV_UNIT);
                                        $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(2)').attr('data-invunit',value.INV_UNIT);
                                        $('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(3)').html((parseFloat(value.PRICE).toFixed(2)).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                                        $('#inputMyModalStaffId').val(elSelectStaff.val());
                                        $('#inputMyModalInvId').val(valContentInvId);
                                        $('#inputMyModalInvPrice').val(valContentInvPrice);

                                        $('#divUnregisterInventory').addClass('hide');
                                        $('#selectMyModalFromStaff, #inputMyModalDescription').val('');
                                        var jsonData2 = {};
                                        jsonData2.pStaffId = elSelectStaff.val();
                                        jsonData2.pPrice = valContentInvPrice;
                                        jsonData2.pId = valContentInvId;
                                        console.log(JSON.stringify(jsonData2));
                                        globalAjaxVar = $.ajax({
                                            type: "POST",
                                            url: "../webservice/ServiceMain.svc/IsMyInv",
                                            data: JSON.stringify(jsonData2),
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (data) {
                                                console.log(data);
                                                resData = jQuery.parseJSON(data.d);
                                                if (resData.d.RetType == "0") {
                                                    if (resData.d.RetData.length == 0) $('#divUnregisterInventory').removeClass('hide');
                                                    $('#myModal').modal('show');
                                                    hideLoader('loaderContent');
                                                    f.setAttribute("src", "../sound/voice_on.mp3"), f.addEventListener("load", function () {
                                                        f.play()
                                                    }, !0), f.pause(), f.play();
                                                }
                                                else {
                                                    if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                                                    else {
                                                        hideLoader('loaderContent');
                                                        alert(resData.d.RetDesc);
                                                    }
                                                }
                                            },
                                            failure: function (response) {
                                                hideLoader('loaderContent');
                                                alert('FAILURE: ' + response.d);
                                            },
                                            error: function (xhr, status, error) {
                                                window.location = '../#pg/error500.aspx';
                                            }
                                        });
                                    }
                                });
                            }
                            else {
                                hideLoader('loaderContent');
                                alert('Уншуулсан хөрөнгө олдсонгүй! Тухайн хөрөнгө ямар нэгэн эд хариуцагч буюу ажилтан дээр оноогдсон актлагдаагүй хөрөнгө байх ёстой.');
                            }
                        }
                        else {
                            if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                            else {
                                hideLoader('loaderContent');
                                alert(resData.d.RetDesc);
                            }
                        }
                    },
                    failure: function (response) {
                        hideLoader('loaderContent');
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
            else alert('Ажилтан заавал сонгоно уу!');
        });
        Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
            scanner.start(cameras[0]);
        }
        else {
            alert('QR Code унших камер олдсонгүй!');
        }
        }).catch(function (e) {
            alert(e);
        });
    };
    $("#selectBranch").change(function () {
        if ($('#selectBranch option:selected').val() == '') {
            $('#selectStaff').html('<option value="" selected="selected">Сонго...</option>');
            $('#selectStaff').prop('disabled');
            $('#selectStaff').closest('label.select').addClass('state-disabled');
        }
        else {
            var valData = '';
            var jsonData = {};
            var jsonDataBranch = [];
            jsonDataBranch.push($('#selectBranch option:selected').val());
            jsonData.branch = jsonDataBranch;
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/GetStaffListWithBranchPos",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    if (resData.d.RetType == "0") {
                        if (resData.d.RetData.length > 0) {
                            var valBranchId = '';
                            $(resData.d.RetData).each(function (index, value) {
                                if (valBranchId != value.BRANCH_ID) {
                                    if (valBranchId != '') valData += '</optgroup>';
                                    valData += '<optgroup label="' + value.BRANCH_INITNAME + '">';
                                }
                                valData += '<option value="' + value.STAFFS_ID + '">' + value.ST_NAME + '</option>';
                                valBranchId = value.BRANCH_ID;
                            });
                            valData += '</optgroup>';
                        }
                        else {
                            valData = '<option value="" selected="selected">Сонго...</option>';
                        }
                        $('#selectStaff').html(valData);
                        $('#selectStaff').removeAttr('disabled');
                        $('#selectStaff').closest('label.select').removeClass('state-disabled');
                    }
                    else {
                        if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                        else {
                            $('#selectStaff').html('<option value="" selected="selected">Сонго...</option>');
                            $('#selectStaff').prop('disabled');
                            $('#selectStaff').closest('label.select').addClass('state-disabled');
                            alert(resData.d.RetDesc);
                        }
                    }
                },
                failure: function (response) {
                    $('#selectStaff').html('<option value="" selected="selected">Сонго...</option>');
                    $('#selectStaff').prop('disabled');
                    $('#selectStaff').closest('label.select').addClass('state-disabled');
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#selectStaff").change(function () {
        if ($('#selectStaff option:selected').val() == '') {
            $('#spanShowCountedInventory').html('0');
            $('#btnShowCountedInventory').attr('href', 'javascript:void(0);');
            $('#btnShowCountedInventory').addClass('disabled');
        }
        else {
            var jsonData = {};
            jsonData.pInvIntervalId = $.trim($("#inputMyModalInvIntervalId").val());
            jsonData.pStaffsId = $("#selectStaff option:selected").val();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/GetCountedInventoryCount",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    if (resData.d.RetType == "0") {
                        $('#spanShowCountedInventory').html(resData.d.RetDesc);
                        $('#btnShowCountedInventory').attr('href', 'pg/modal/modalInventoryCountedByStaff.aspx?pStaffId=' + $("#selectStaff option:selected").val()+'&pIntervalId=' + $('#inputMyModalInvIntervalId').val());
                        $('#btnShowCountedInventory').removeClass('disabled');
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
    $("#btnMyModalSave").click(function () {
        $.SmartMessageBox({
                title: "Хөрөнгө тооллого!",
                content: "Хөрөнгийг тооллогод бүртгэх үү?",
                buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                $("#btnMyModalSave").html('<i class="fa fa-refresh fa-spin"></i> ТООЛЛОГОД БҮРТГЭХ');
                $("#btnMyModalSave").prop('disabled', true);
                var jsonData = {};
                jsonData.pInvIntervalId = $.trim($("#inputMyModalInvIntervalId").val());
                jsonData.pStaffsId = $.trim($("#inputMyModalStaffId").val());
                jsonData.pInvId = $.trim($("#inputMyModalInvId").val());
                jsonData.pInvCode = $.trim($('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(0)').text());
                jsonData.pInvName = $.trim($('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(1)').text());
                jsonData.pInvUnit = $.trim($('#tableMyModalInventoryInfo tbody tr:eq(0) td:eq(2)').attr('data-invunit'));
                jsonData.pInvPrice = $.trim($("#inputMyModalInvPrice").val());
                jsonData.pFromUserId = $.trim($("#selectMyModalFromStaff option:selected").val());
                jsonData.pDesc = $.trim($("#inputMyModalDescription").val());
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/SaveInventoryCountData",
                    data: JSON.stringify(jsonData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var resData = jQuery.parseJSON(data.d);
                        $("#btnMyModalSave").html('ТООЛЛОГОД БҮРТГЭХ');
                        $("#btnMyModalSave").removeAttr('disabled');
                        if (resData.d.RetType == "0") {
                            $('#spanShowCountedInventory').html((parseInt($('#spanShowCountedInventory').text())+1));
                            $('#myModal').modal('hide');
                            $.smallBox({
                                title: "Амжилттай хадгалагдлаа",
                                content: "<i class='fa fa-clock-o'></i> <i>Эд хөрөнгийн тооллогын эд хариуцагч амжилттай хадгалагдлаа...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                        }
                        else {
                            if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                            else {
                                alert(resData.d.RetDesc);
                            }
                        }
                    },
                    failure: function (response) {
                        alert(response.d);
                        $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                        $("#btnSave").removeAttr('disabled');
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    });
    $("#btnMyModalCancel").click(function () {
        $('#myModal').modal('hide');
    });
    $(document).ready(function () {
        pageSetUp();
        pagefunction();
    });
</script>