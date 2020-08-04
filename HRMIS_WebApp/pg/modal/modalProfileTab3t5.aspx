<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab3t5.aspx.cs" Inherits="HRWebApp.pg.modal.modalProfileTab3t5" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Урамшуулал <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab3t5Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-3">
                            <label class="label">Урамшуулал авсан огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputDt" name="inputDt" runat="server" type="text" placeholder="" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                        <section class="col col-6">
                            <label class="label">Урамшууллын нэр*</label>
							<label class="input">
								<input id="inputName" name="inputName" runat="server" type="text" placeholder="" maxlength="250">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Мөнгөн дүн*</label>
							<label class="input">
								<input id="inputAmt" name="inputAmt" runat="server" type="text" placeholder="" maxlength="15">
							</label>
                            <div class="note">мян.төг</div>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Шийдвэрийн нэр*</label>
							<label class="input">
								<input id="inputTushaalName" name="inputTushaalName" runat="server" type="text" placeholder="" maxlength="250">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Шийдвэрийн огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputTushaalDate" name="inputTushaalDate" runat="server" type="text" placeholder="" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Шийдвэрийн дугаар*</label>
							<label class="input">
								<input id="inputTushaalNo" name="inputTushaalNo" runat="server" type="text" placeholder="Тайлбар" maxlength="50">
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-12">
                            <label class="label">Урамшуулсан үндэслэл*</label>
                            <label class="textarea textarea-resizable"> 										
								<textarea id="inputDesc" name="inputDesc" runat="server" rows="2" class="custom-scroll" maxlength="1000"></textarea> 
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
    jQuery.validator.addMethod(
        "money",
        function (value, element) {
            var isValidMoney = /^\d{0,4}(\.\d{0,2})?$/.test(value);
            return this.optional(element) || isValidMoney;
        },
        "Insert "
    );
    $("#formProfileTab3t5Modal1").validate({
        rules: {
            inputDt: {
                required: true,
                maxlength: 10
            },
            inputName: {
                required: true,
                maxlength: 250
            },
            inputAmt: {
                required: true,
                maxlength: 15,
                money: true
            },
            inputTushaalName: {
                required: true,
                maxlength: 250
            },
            inputTushaalDate: {
                required: true,
                maxlength: 10
            },
            inputTushaalNo: {
                required: true,
                maxlength: 50
            },
            inputDesc: {
                required: true,
                maxlength: 1000
            }
        },
        messages: {
            inputDt: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 10 байна'
            },
            inputName: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 250 байна'
            },
            inputAmt: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 15 байна',
                money: 'Зөвхөн мөнгөн тэмдэгт оруулна уу'
            },
            inputTushaalName: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 250 байна'
            },
            inputTushaalDate: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 10 байна'
            },
            inputTushaalNo: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 50 байна'
            },
            inputDesc: {
                required: 'Оруулна уу',
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
            jsonData.pStaffsId = <%=Request.QueryString["staffsid"]%>;
            jsonData.pDt = $.trim($("#inputDt").val());
            jsonData.pName = $.trim($("#inputName").val());
            jsonData.pAmt = $.trim($("#inputAmt").val().replace(',',''));
            jsonData.pTushaalName = $.trim($("#inputTushaalName").val());
            jsonData.pTushaalNo = $.trim($("#inputTushaalNo").val());
            jsonData.pTushaalDt = $.trim($("#inputTushaalDate").val());
            jsonData.pDesc = $.trim($("#inputDesc").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab3T5Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab3T5Section1Datatable();
                        $('#myModalProfileTab3t5').modal('hide');
                        $.smallBox({
                            title: "Амжилттай хадгалагдлаа",
                            content: "<i class='fa fa-clock-o'></i> <i>Мэдээлэл амжилттай хадгалагдлаа...</i>",
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
        $('#myModalProfileTab3t5').modal('hide');
    });
    $('#inputDt, #inputTushaalDate').datepicker({
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