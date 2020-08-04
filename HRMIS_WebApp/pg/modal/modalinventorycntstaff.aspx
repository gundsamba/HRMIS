<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalinventorycntstaff.aspx.cs" Inherits="HRWebApp.pg.modal.modalinventorycntstaff" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Тоологдоогүй хөрөнгийн тайлбар <span id="spanModifyType" runat="server"></span></h4>
</div>
<div class="modal-body">
    <div class="row">
		<div class="col-sm-12">
            <form id="formMyModal" class="smart-form">
                <input type="hidden" id="inputId" runat="server" />
                <input type="hidden" id="inputIntervalId" runat="server" />
                <input type="hidden" id="inputStaffId" runat="server" />
                <input type="hidden" id="inputInvId" runat="server" />
                <input type="hidden" id="inputInvPrice" runat="server" />
                <fieldset>
                    <div class="row">
                        <section>
                            <label class="label">Тайлбар*</label>
                            <label class="textarea textarea-resizable"> 										
							    <textarea id="inputMyModalDescription" runat="server" rows="2" class="custom-scroll"></textarea> 
						    </label>
                        </section>
                    </div>
                </fieldset>
                <footer>
                    <button id="btnSave" type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Хадгалах</button>
	                <button id="btnCancel" type="button" class="btn btn-default">Болих</button>
                </footer>
            </form>
        </div>
    </div>		
</div>
<script>
    $("#btnCancel").click(function () {
        $('#myModal').modal('hide');
    });
    $("#formMyModal").validate({
        rules: {
            inputMyModalDescription: {
                required: true,
                maxlength: 1000
            }
        },
        messages: {
            inputMyModalDescription: {
                required: 'Тайлбар оруулна уу',
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
            jsonData.pIntervalId = $.trim($("#inputIntervalId").val());
            jsonData.pStaffId = $.trim($("#inputStaffId").val());
            jsonData.pInvId = $.trim($("#inputInvId").val());
            jsonData.pInvPrice = $.trim($("#inputInvPrice").val());
            jsonData.pDesc = $.trim($("#inputMyModalDescription").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveInventiryCntStaffDesc",
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
                            content: "<i class='fa fa-clock-o'></i> <i>Хөрөнгийн тоологдоогүй тайлбар амжилттай хадгалагдлаа...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                    }
                    else {
                        alert(resData.d.RetDesc);
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