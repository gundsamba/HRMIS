<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab1t12.aspx.cs" Inherits="HRWebApp.pg.modal.modalProfileTab1t12" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Бүтээлийн мэдээлэл <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab1t12Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-9">
                            <label class="label">Бүтээлийн нэр*</label>
							<label class="input">
								<input id="inputName" name="inputName" runat="server" type="text" placeholder="Бүтээлийн нэр" maxlength="250">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Бүтэлийн төрөл*</label>
                            <label class="select">
								<select id="selectType" name="selectType" runat="server"><option selected="selected" disabled="disabled">Сонго...</option></select> <i></i>
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-3">
                            <label class="label">Бүтээл гаргасан огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputDt" name="inputDt" runat="server" type="text" placeholder="Бүтээл гаргасан огноо" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                        <section class="col col-9">
                            <label class="label">Тайлбар*</label>
							<label class="input">
								<input id="inputDesc" name="inputDesc" runat="server" type="text" placeholder="Тайлбар" maxlength="1000">
							</label>
                            <div class="note">
                                <strong>"Тайлбар"</strong> хэсэгт гадаад хэлнээс орчуулсан болон хамтран зохиогчийн тухай тэмдэглэнэ.
                            </div>
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
    $("#formProfileTab1t12Modal1").validate({
        rules: {
            inputName: {
                required: true,
                maxlength: 250
            },
            selectType: {
                required: true
            },
            inputDt: {
                required: true,
                maxlength: 10
            },
            inputDesc: {
                maxlength: 1000
            }
        },
        messages: {
            inputName: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 250 байна'
            },
            selectType: {
                required: 'Сонгоно уу'
            },
            inputDt: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 10 байна'
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
            jsonData.pName = $.trim($("#inputName").val());
            jsonData.pTypeId = $.trim($("#selectType").val());
            jsonData.pDt = $.trim($("#inputDt").val());
            jsonData.pDesc = $.trim($("#inputDesc").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab1T12Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab1T12Section1Datatable();
                        $('#myModalProfileTab1t12').modal('hide');
                        $.smallBox({
                            title: "Амжилттай хадгалагдлаа",
                            content: "<i class='fa fa-clock-o'></i> <i>Бүтээл амжилттай хадгалагдлаа...</i>",
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
        $('#myModalProfileTab1t12').modal('hide');
    });
    $('#inputDt').datepicker({
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