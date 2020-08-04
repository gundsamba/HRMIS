<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab3t2.aspx.cs" Inherits="HRWebApp.pg.modal.modalProfileTab3t2" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Албан тушаалын томилгоо засах</h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab3t2Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <input id="inputTbl" name="inputTbl" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Томилогдсон албан тушаалын нэр*</label>
							<label class="input state-disabled">
								<input id="inputTitle" name="inputTitle" runat="server" type="text" placeholder="" disabled="disabled">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Томилогдсон огноо*</label>
							<label class="input state-disabled"> <i class="icon-append fa fa-calendar"></i>
								<input id="inputDt" name="inputDt" runat="server" type="text" placeholder="" class="datepicker" data-dateformat='yy-mm-dd' disabled="disabled">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Шийдвэрийн дугаар</label>
							<label class="input state-disabled">
								<input id="inputTushaalNo" name="inputTushaalNo" runat="server" type="text" placeholder="" disabled="disabled">
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Томилогдсон шийдвэрийн нэр</label>
                            <label class="input">
							    <input id="inputTushaalName" name="inputTushaalName" runat="server" type="text" placeholder="">
						    </label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Өөрчилсөн огноо</label>
							<label class="input"> <i class="icon-append fa fa-calendar"></i>
								<input id="inputChangedTushaalDate" name="inputChangedTushaalDate" runat="server" type="text" placeholder="" class="datepicker" data-dateformat='yy-mm-dd'>
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Өөрчилсөн шийдвэрийн дугаар</label>
                            <label class="input">
							    <input id="inputChangedTushaalNo" name="inputChangedTushaalNo" runat="server" type="text" placeholder="">
						    </label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Өөрчилсөн шийдвэрийн нэр</label>
                            <label class="input">
							    <input id="inputChangedTushaalName" name="inputChangedTushaalName" runat="server" type="text" placeholder="">
						    </label>
                        </section>
                        <section class="col col-6">
                            <label class="label">Өөрчилсөн шалтгаан</label>
                            <label class="input">
							    <input id="inputChangedReason" name="inputChangedReason" runat="server" type="text" placeholder="">
						    </label>
                        </section>
                    </div>
                </fieldset>
                <footer>
					<button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Хадгалах</button>
	                <button id="btnClose"  type="button" class="btn btn-default">Болих</button>
				</footer>
            </form>
        </div>
    </div>		
</div>
<script>
    $("#formProfileTab3t2Modal1").validate({
        rules: {
            inputTushaalName: {
                maxlength: 250
            },
            inputChangedTushaalDate: {
                maxlength: 10
            },
            inputChangedTushaalNo: {
                maxlength: 50
            },
            inputChangedTushaalName: {
                maxlength: 250
            },
            inputChangedReason: {
                maxlength: 1000
            }
        },
        messages: {
            inputTushaalName: {
                maxlength: 'Тэмдэгт уртдаа 250 байна'
            },
            inputChangedTushaalDate: {
                maxlength: 'Тэмдэгт уртдаа 10 байна'
            },
            inputChangedTushaalNo: {
                maxlength: 'Тэмдэгт уртдаа 50 байна'
            },
            inputChangedTushaalName: {
                maxlength: 'Тэмдэгт уртдаа 250 байна'
            },
            inputChangedReason: {
                maxlength: 'Тэмдэгт уртдаа 1000 байна'
            }
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler: function (form) {
            $("#btnSave").html('<i class="fa fa-refresh fa-spin"></i> Хадгалах');
            $("#btnSave").prop('disabled', true);
            var jsonData = {};
            jsonData.pId = $.trim($("#inputId").val());
            jsonData.pTbl = $.trim($("#inputTbl").val());
            jsonData.pTushaalName = $.trim($("#inputTushaalName").val());
            jsonData.pChangedTushaalDate = $.trim($("#inputChangedTushaalDate").val());
            jsonData.pChangedTushaalNo = $.trim($("#inputChangedTushaalNo").val());
            jsonData.pChangedTushaalName = $.trim($("#inputChangedTushaalName").val());
            jsonData.pChangedReason = $.trim($("#inputChangedReason").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab3T2Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab3T2Section1Datatable();
                        $('#myModalProfileTab3t2').modal('hide');
                        $.smallBox({
                            title: "Амжилттай хадгалагдлаа",
                            content: "<i class='fa fa-clock-o'></i> <i>Томилгоо амжилттай хадгалагдлаа...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                    }
                    else {
                        if (resData.d.RetDesc == 'SessionDied') window.location = '../login';
                        else {
                            alert(resData.d.RetDesc);
                            $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                            $("#btnSave").removeAttr('disabled');
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
    $("#btnClose").click(function () {
        $('#myModalProfileTab3t2').modal('hide');
    });
    $('#inputChangedTushaalDate, #inputDt').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        monthNames: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        monthNamesShort: ["1-р сар", "2-р сар", "3-р сар", "4-р сар", "5-р сар", "6-р сар", "7-р сар", "8-р сар", "9-р сар", "10-р сар", "11-р сар", "12-р сар"],
        dayNamesMin: ['Ня', 'Да', 'Мя', 'Лх', 'Пү', 'Ба', 'Бя']
    });