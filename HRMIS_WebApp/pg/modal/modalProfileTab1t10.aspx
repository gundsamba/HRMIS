<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab1t10.aspx.cs" Inherits="HRWebApp.pg.modal.modalProfileTab1t10" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Цэргийн алба хаасан мэдээлэл <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab1t10Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-12">
                            <label class="label">Цэргийн үүрэгтний үнэмлэхийн дугаар*</label>
							<label class="input">
								<input id="inputCertificateNo" name="inputCertificateNo" runat="server" type="text" placeholder="Цэргийн үүрэгтний үнэмлэхийн дугаар." maxlength="50">
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Цэргийн алба хаасан байдал*</label>
                            <label class="textarea textarea-resizable"> 										
								<textarea id="inputSituation" name="inputSituation" runat="server" rows="3" class="custom-scroll" maxlength="1000"></textarea> 
							</label>
                        </section>
                        <section class="col col-6">
                            <label class="label">Тайлбар</label>
                            <label class="textarea textarea-resizable"> 										
								<textarea id="inputDesc" name="inputDesc" runat="server" rows="3" class="custom-scroll" maxlength="1000"></textarea> 
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
    $("#formProfileTab1t10Modal1").validate({
        rules: {
            inputCertificateNo: {
                required: true,
                maxlength: 50
            },
            inputSituation: {
                required: true,
                maxlength: 1000
            },
            inputDesc: {
                maxlength: 1000
            }
        },
        messages: {
            inputCertificateNo: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 50 байна'
            },
            inputSituation: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 1000 байна'
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
            jsonData.pCertificateNo = $.trim($("#inputCertificateNo").val());
            jsonData.pSituation = $.trim($("#inputSituation").val());
            jsonData.pDesc = $.trim($("#inputDesc").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab1T10Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab1T10Section2Datatable();
                        $('#myModalProfileTab1t10').modal('hide');
                        $.smallBox({
                            title: "Амжилттай хадгалагдлаа",
                            content: "<i class='fa fa-clock-o'></i> <i>Цэргийн алба хаасан мэдээлэл амжилттай хадгалагдлаа...</i>",
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
        $('#myModalProfileTab1t10').modal('hide');
    });
</script>