<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab3t4.aspx.cs" Inherits="HRMIS_WebApp.pg.modal.modalProfileTab3t4" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Цалин хөлс <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab3t4Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <fieldset>
                     <div class="row">
                        <section class="col col-3">
                            <label class="label">Он*</label>
                            <label class="select">
								<select id="selectYr" name="selectYr" runat="server"><option selected="selected">Сонго...</option></select> <i></i>
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Албан тушаалын хөлс*</label>
							<label class="input">
								<input id="inputD1" name="inputD1" runat="server" type="text" placeholder="" maxlength="15">
							</label>
                            <div class="note">мян.төг</div>
                        </section>
                        <section class="col col-3">
                            <label class="label">Онцгой нөхцөлийн нэмэгдэл хөлс*</label>
							<label class="input">
								<input id="inputD2" name="inputD2" runat="server" type="text" placeholder="" maxlength="15">
							</label>
                            <div class="note">мян.төг</div>
                        </section>
                        <section class="col col-3">
                            <label class="label">Төрийн алба хаасан хугацааны нэмэгдэл хөлс*</label>
							<label class="input">
								<input id="inputD3" name="inputD3" runat="server" type="text" placeholder="" maxlength="15">
							</label>
                            <div class="note">мян.төг</div>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-3">
                            <label class="label">Зэрэг дэвийн нэмэгдэл хөлс*</label>
							<label class="input">
								<input id="inputD4" name="inputD4" runat="server" type="text" placeholder="" maxlength="15">
							</label>
                            <div class="note">мян.төг</div>
                        </section>
                        <section class="col col-3">
                            <label class="label">Цолны нэмэгдэл хөлс*</label>
							<label class="input">
								<input id="inputD5" name="inputD5" runat="server" type="text" placeholder="" maxlength="15">
							</label>
                            <div class="note">мян.төг</div>
                        </section>
                        <section class="col col-3">
                            <label class="label">Бусад хөлс</label>
							<label class="input">
								<input id="inputD6" name="inputD6" runat="server" type="text" placeholder="" maxlength="15">
							</label>
                            <div class="note">мян.төг</div>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-12">
                            <label class="label">Тайлбар</label>
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
            var isValidMoney = /^\d{0,15}(\.\d{0,3})?$/.test(value);
            return this.optional(element) || isValidMoney;
        },
        "Insert "
    );
    $("#formProfileTab3t4Modal1").validate({
        rules: {
            selectYr: {
                required: true
            },
            inputD1: {
                required: true,
                maxlength: 15,
                money: true
            },
            inputD2: {
                required: true,
                maxlength: 15,
                money: true
            },
            inputD3: {
                required: true,
                maxlength: 15,
                money: true
            },
            inputD4: {
                required: true,
                maxlength: 15,
                money: true
            },
            inputD5: {
                required: true,
                maxlength: 15,
                money: true
            },
            inputD6: {
                maxlength: 15,
                money: true
            },
            inputDesc: {
                maxlength: 1000
            }
        },
        messages: {
            selectYr: {
                required: 'Сонгоно уу'
            },
            inputD1: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 15 байна',
                money: 'Зөвхөн мөнгөн тэмдэгт оруулна уу'
            },
            inputD2: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 15 байна',
                money: 'Зөвхөн мөнгөн тэмдэгт оруулна уу'
            },
            inputD3: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 15 байна',
                money: 'Зөвхөн мөнгөн тэмдэгт оруулна уу'
            },
            inputD4: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 15 байна',
                money: 'Зөвхөн мөнгөн тэмдэгт оруулна уу'
            },
            inputD5: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 15 байна',
                money: 'Зөвхөн мөнгөн тэмдэгт оруулна уу'
            },
            inputD6: {
                maxlength: 'Тэмдэгт уртдаа 15 байна',
                money: 'Зөвхөн мөнгөн тэмдэгт оруулна уу'
            },
            inputDesc: {
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
            jsonData.pYr = $.trim($("#selectYr option:selected").val());
            jsonData.pD1 = $.trim($("#inputD1").val().replace(',', ''));
            jsonData.pD2 = $.trim($("#inputD2").val().replace(',', ''));
            jsonData.pD3 = $.trim($("#inputD3").val().replace(',', ''));
            jsonData.pD4 = $.trim($("#inputD4").val().replace(',', ''));
            jsonData.pD5 = $.trim($("#inputD5").val().replace(',', ''));
            jsonData.pD6 = $.trim($("#inputD6").val().replace(',', ''));
            jsonData.pDesc = $.trim($("#inputDesc").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab3T4Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab3T4Section1Datatable();
                        $('#myModalProfileTab3t4').modal('hide');
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
        $('#myModalProfileTab3t4').modal('hide');
    });
</script>