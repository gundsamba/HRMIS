<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab1t11.aspx.cs" Inherits="HRWebApp.pg.modal.modalProfileTab1t11" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Шагналын талаарх мэдээлэл <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab1t11Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-3">
                            <label class="label">Шагнагдсан огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputDt" name="inputDt" runat="server" type="text" placeholder="Шагнагдсан огноо" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                        <section class="col col-9">
                            <label class="label">Шагналын нэр*</label>
							<label class="input">
								<input id="inputName" name="inputName" runat="server" type="text" placeholder="Шагналын нэр" maxlength="150">
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-9">
                            <label class="label">Шийдвэрийн нэр*</label>
							<label class="input">
								<input id="inputOrgdescription" name="inputOrgdescription" runat="server" type="text" placeholder="Шийдвэрийн нэр" maxlength="1000">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Шийдвэрийн огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputTushaalDt" name="inputTushaalDt" runat="server" type="text" placeholder="Шийдвэрийн огноо" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-3">
                            <label class="label">Шийдвэрийн дугаар*</label>
							<label class="input">
								<input id="inputTushaalNo" name="inputTushaalNo" runat="server" type="text" placeholder="Шийдвэрийн дугаар" maxlength="50">
							</label>
                        </section>
                        <section class="col col-9">
                            <label class="label">Шагнуулсан үндэслэл*</label>
							<label class="input">
								<input id="inputGround" name="inputGround" runat="server" type="text" placeholder="Шагнуулсан үндэслэл" maxlength="1000">
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
    $("#formProfileTab1t11Modal1").validate({
        rules: {
            inputDt: {
                required: true,
                maxlength: 10
            },
            inputName: {
                required: true,
                maxlength: 150
            },
            inputOrgdescription: {
                required: true,
                maxlength: 1000
            },
            inputTushaalDt: {
                required: true,
                maxlength: 10
            },
            inputTushaalNo: {
                required: true,
                maxlength: 50
            },
            inputGround: {
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
                maxlength: 'Тэмдэгт уртдаа 150 байна'
            },
            inputOrgdescription: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 1000 байна'
            },
            inputTushaalDt: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 10 байна'
            },
            inputTushaalNo: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 50 байна'
            },
            inputGround: {
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
            jsonData.pOrgdescription = $.trim($("#inputOrgdescription").val());
            jsonData.TushaalNo = $.trim($("#inputTushaalDt").val());
            jsonData.TushaalDt = $.trim($("#inputTushaalNo").val());
            jsonData.pGround = $.trim($("#inputGround").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab1T11Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab1T11Section1Datatable();
                        $('#myModalProfileTab1t11').modal('hide');
                        $.smallBox({
                            title: "Амжилттай хадгалагдлаа",
                            content: "<i class='fa fa-clock-o'></i> <i>Шагналын мэдээлэл амжилттай хадгалагдлаа...</i>",
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
        $('#myModalProfileTab1t11').modal('hide');
    });
    $('#inputDt, #inputTushaalDt').datepicker({
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