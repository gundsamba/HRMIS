<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="salarysettingsModal2.aspx.cs" Inherits="HRWebApp.pg.modal.salarysettingsModal2" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Цалин бодолтын багана <span id="spanModifyType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formSalarySettingsTab2" class="smart-form">
                <input type="hidden" id="inputId" runat="server" />
                <fieldset>
                    <div class="row">
                        <section class="col col-12">
                            <a href="#" class="dropdown-toggle pull-right" data-toggle="dropdown"><i class="fa fa-eye"></i> <span> Баганан код харах </span> <i class="fa fa-angle-down"></i> </a>
						    <ul id="dropdownTab2List" runat="server" class="dropdown-menu pull-right">
							    <li style="padding:5px 10px;"><strong>$Y1$</strong> Үндсэн цалин</li>
                                <li style="padding:5px 10px;"><strong>$A1$</strong> Сарын ажлын хоног</li>
                                <li style="padding:5px 10px;"><strong>$A2$</strong> Ажиллах хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A3$</strong> Ажиллавал зохих хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A4$</strong> Цалинтай чөлөөтэй хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A5$</strong> Ээлжийн амралттай хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A6$</strong> Томилолттой хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A7$</strong> Ажилласан хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A8$</strong> Тасалсан хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A9$</strong> Төрд ажилласан хоног</li>
                                <li style="padding:5px 10px;"><strong>$A10$</strong> СЯ ажилласан хоног</li>
                                <li style="padding:5px 10px;"><strong>$A11$</strong> Ээлжийн амралттай хоног /сар/</li>
                                <li style="padding:5px 10px;"><strong>$A12$</strong> Томилолттой хоног /сар/</li>
						    </ul>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Төрөл*</label>
							<label class="select state-disabled">
								<select id="selectColType" name="selectColType" runat="server" disabled="disabled">
									<option value="1">Нэмэгдэл</option>
									<option value="2">Суутгал</option>
								</select> <i></i>
							</label>
                        </section>
                        <section class="col col-6">
                            <label class="label">Баганан код*</label>
                            <label class="input state-disabled">
								<input id="inputColName" name="inputColName" runat="server" type="text" placeholder="">
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-12">
                            <label class="label">Бодолтын томъёо*</label>
                            <label class="input">
								<input id="inputCalculate" name="inputCalculate" runat="server" type="text" placeholder="Бодолтын томъёо оруулна уу...">
							</label>
                            <div class="note">Жишээлбэл: Бодогдсон цалин <strong><em>(($Y1$/$A1$)*$A2$)</em></strong> /Баганан бичиглэлээ сайтар хягтална уу!/</div>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-6">
                            <label class="label">Нэр*</label>
							<label class="input">
								<input id="inputName" name="inputName" runat="server" type="text" placeholder="Нэр оруулна уу...">
							</label>
                        </section>
                        <section class="col col-6">
                            <label class="label">Идэвхтэй эсэх*</label>
                            <div class="inline-group">
								<label class="radio">
									<input id="radioIsActive1" name="radioIsActive" runat="server" type="radio" value="1">
									<i></i>Идэвхтэй</label>
								<label class="radio">
									<input id="radioIsActive0" name="radioIsActive" runat="server" type="radio" value="0">
									<i></i>Идэвхгүй</label>
							</div>
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
$("#formSalarySettingsTab2").validate({
    rules: {
        selectColType: {
            required: true
        },
        inputColName: {
            //required: true,
            maxlength: 10
        },
        inputCalculate: {
            required: true,
            maxlength: 1000
        },
        inputName: {
            required: true,
            maxlength: 150
        },
        radioIsActive: {
            required: true
        }
    },
    messages: {
        selectColType: {
            required: 'Төрөл сонгоно уу',
            maxlength: 'Тэмдэгт уртдаа 10 байна'
        },
        inputColName: {
            //required: 'Баганан код оруулна уу',
            maxlength: 'Тэмдэгт уртдаа 10 байна'
        },
        inputCalculate: {
            required: 'Бодолтын томъёо оруулна уу',
            maxlength: 'Тэмдэгт уртдаа 1000 байна'
        },
        inputName: {
            required: 'Нэр оруулна уу',
            maxlength: 'Тэмдэгт уртдаа 150 байна'
        },
        radioIsActive: {
            required: 'Идэвхтэй эсэх сонгоно уу'
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
        jsonData.pColType = $.trim($("#selectColType option:selected").val());
        jsonData.pColName = $.trim($("#inputColName").val());
        jsonData.pCalculate = $.trim($("#inputCalculate").val());
        jsonData.pName = $.trim($("#inputName").val());
        jsonData.pIsActive = $.trim($("input[name='radioIsActive']:checked").val());
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/SaveSalaryCol",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                $("#btnSave").removeAttr('disabled');
                if (resData.d.RetType == "0") {
                    if ($.trim($("#selectColType option:selected").val()) == '1') dataBindTab2Datatable();
                    else if ($.trim($("#selectColType option:selected").val()) == '2') dataBindTab3Datatable();
                    $('#myModal').modal('hide');
                    $.smallBox({
                        title: "Амжилттай хадгалагдлаа",
                        content: "<i class='fa fa-clock-o'></i> <i>Цалин бодолтын багана амжилттай хадгалагдлаа...</i>",
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
