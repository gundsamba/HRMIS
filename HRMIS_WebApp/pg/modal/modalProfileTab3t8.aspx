<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab3t8.aspx.cs" Inherits="HRWebApp.pg.modal.modalProfileTab3t8" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Хувийн хэргийн баяжилт <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab3t8Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-9">
                            <label class="label">Мэдээллийн агуулга*</label>
							<label class="input">
								<input id="inputContentName" name="inputContentName" runat="server" type="text" placeholder="" maxlength="250">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Баяжуулалт хийсэн огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputUpdatedDate1" name="inputUpdatedDate1" runat="server" type="text" placeholder="" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-9">
                            <label class="label">Хянаж байжуулалт хийсэн албан тушаалтны нэр*</label>
							<label class="input">
								<input id="inputUpdatedPersonName" name="inputUpdatedPersonName" runat="server" type="text" placeholder="" maxlength="250">
							</label>
                        </section>
                        <section class="col col-3">
                            <label class="label">Баяжилт хийсэн огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputUpdatedDate2" name="inputUpdatedDate2" runat="server" type="text" placeholder="" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-12">
                            <label class="label">Тайлбар*</label>
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
    $("#formProfileTab3t8Modal1").validate({
        rules: {
            inputContentName: {
                required: true,
                maxlength: 250
            },
            inputUpdatedDate1: {
                required: true,
                maxlength: 10
            },
            inputUpdatedPersonName: {
                required: true,
                maxlength: 250
            },
            inputUpdatedDate2: {
                required: true,
                maxlength: 10
            },
            inputDesc: {
                required: true,
                maxlength: 1000
            }
        },
        messages: {
            inputContentName: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 250 байна'
            },
            inputUpdatedDate1: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 10 байна'
            },
            inputUpdatedPersonName: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 250 байна'
            },
            inputUpdatedDate2: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 10 байна'
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
            jsonData.pContentName = $.trim($("#inputContentName").val());
            jsonData.pUpdatedDt1 = $.trim($("#inputUpdatedDate1").val());
            jsonData.pUpdatedPersonName = $.trim($("#inputUpdatedPersonName").val());
            jsonData.pUpdatedDt2 = $.trim($("#inputUpdatedDate2").val());
            jsonData.pDesc = $.trim($("#inputDesc").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab3T8Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab3t8Section1Datatable();
                        $('#myModalProfileTab3t8').modal('hide');
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
        $('#myModalProfileTab3t8').modal('hide');
    });
    $('#inputUpdatedDate1, #inputUpdatedDate2').datepicker({
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