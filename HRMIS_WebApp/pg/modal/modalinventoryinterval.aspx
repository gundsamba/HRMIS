<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalinventoryinterval.aspx.cs" Inherits="HRWebApp.pg.modal.modalinventoryinterval" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Эд хөрөнгийн тооллого <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formInterval" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-12">
                            <label class="label">Бүртгэлийн нэр*</label>
							<label class="input">
								<input id="inputName" name="inputName" runat="server" type="text" placeholder="Бүртгэлийн нэр оруулна уу..." maxlength="150">
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Төлөв*</label>
							<div class="inline-group">
								<label class="radio">
									<input id="inputIsActive1" name="inputIsActive" runat="server" type="radio" value="1">
									<i></i>Идэвхтэй
								</label>
								<label class="radio">
									<input id="inputIsActive0" name="inputIsActive" runat="server" type="radio" value="0">
									<i></i>Идэвхгүй
								</label>
							</div>
                        </section>
                    </div>
                </fieldset>
                <footer>
					<button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Хадгалах</button>
	                <button id="btnRefresh"  type="button" class="btn btn-default">Болих</button>
				</footer>
            </form>
        </div>
    </div>		
</div>
<script>
    $("#formInterval").validate({
        rules: {
            inputName: {
                required: true,
                maxlength: 150
            },
            inputIsActive: {
                required: true
            }
        },
        messages: {
            inputName: {
                required: 'Нэр оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 150 байна'
            },
            inputIsActive: {
                required: 'Төлөв сонгоно уу'
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
            jsonData.pName = $.trim($("#inputName").val());
            jsonData.pIsActive = $.trim($("input[name='inputIsActive']:checked").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveInventoryIntervalData",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab1Datatable();
                        $('#myModal').modal('hide');
                        $.smallBox({
                            title: "Амжилттай хадгалагдлаа",
                            content: "<i class='fa fa-clock-o'></i> <i>Эд хөрөнгийн тооллого амжилттай хадгалагдлаа...</i>",
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
</script>