<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalProfileTab3t3.aspx.cs" Inherits="HRWebApp.pg.modal.modalProfileTab3t3" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">Зэрэг дэв, цол <span id="spanEditType" name="spanEditType" runat="server"></span></h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <form id="formProfileTab3t3Modal1" class="smart-form no-padding">
                <input id="inputId" name="inputId" runat="server" type="hidden" />
                <input id="inputTbl" name="inputTbl" runat="server" type="hidden" />
                <fieldset>
                    <div class="row">
                        <section class="col col-4">
                            <label class="label">А/Т ангилал*</label>
                            <label class="select">
								<select id="selectPosDegree" name="selectPosDegree" runat="server"><option selected="selected">Сонго...</option></select> <i></i>
							</label>
                        </section>
                        <section class="col col-4">
                            <label class="label">А/Т зэрэглэл*</label>
                            <label class="select">
								<select id="selectRank" name="selectRank" runat="server"><option selected="selected">Сонго...</option></select> <i></i>
							</label>
                        </section>
                        <section class="col col-4">
                            <label class="label">A/T зэрэг дэв*</label>
                            <label class="select">
								<select id="selectPosDegreedtl" name="selectPosDegreedtl" runat="server"><option selected="selected">Сонго...</option></select> <i></i>
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-4">
                            <label class="label">Цолны нэр*</label>
							<label class="input">
								<input id="inputTsolName" name="inputTsolName" runat="server" type="text" placeholder="" maxlength="150">
							</label>
                        </section>
                        <section class="col col-4">
                            <label class="label">Шийдвэрийн огноо*</label>
                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
							    <input id="inputDecisionDate" name="inputDecisionDate" runat="server" type="text" placeholder="" class="datepicker" data-dateformat='yy-mm-dd'>
						    </label>
                        </section>
                        <section class="col col-4">
                            <label class="label">Шийдвэрийн дугаар*</label>
							<label class="input">
								<input id="inputCertificateNo" name="inputCertificateNo" runat="server" type="text" placeholder="Тайлбар" maxlength="50">
							</label>
                        </section>
                    </div>
                    <div class="row">
                        <section class="col col-4">
                            <label class="label">Үнэмлэхийн дугаар</label>
							<label class="input">
								<input id="inputUnemlehNo" name="inputUnemlehNo" runat="server" type="text" placeholder="" maxlength="50">
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
    if ($('#inputTbl').val() == 'ST_ZEREGDEV_STAFFS') {
        $('#selectPosDegree').attr('disabled', 'disabled');
        $('#selectPosDegree').closest('label.select').addClass('state-disabled');
        $('#selectPosDegreedtl').attr('disabled', 'disabled');
        $('#selectPosDegreedtl').closest('label.select').addClass('state-disabled');
        $('#inputDecisionDate').attr('disabled', 'disabled');
        $('#inputDecisionDate').closest('label.input').addClass('state-disabled');
        $('#inputCertificateNo').attr('disabled', 'disabled');
        $('#inputCertificateNo').closest('label.input').addClass('state-disabled');
    }
    else {
        $('#selectPosDegree').removeAttr('disabled');
        $('#selectPosDegree').closest('label.select').removeClass('state-disabled');
        $('#selectPosDegreedtl').removeAttr('disabled');
        $('#selectPosDegreedtl').closest('label.select').removeClass('state-disabled');
        $('#inputDecisionDate').removeAttr('disabled');
        $('#inputDecisionDate').closest('label.input').removeClass('state-disabled');
        $('#inputCertificateNo').removeAttr('disabled');
        $('#inputCertificateNo').closest('label.input').removeClass('state-disabled');
    }
    $("#formProfileTab3t3Modal1").validate({
        rules: {
            selectPosDegree: {
                required: function (element) {
                    return $('#inputTbl').val() != 'ST_ZEREGDEV_STAFFS';
                }
            },
            selectRank: {
                required: function (element) {
                    return $('#inputTbl').val() != 'ST_ZEREGDEV_STAFFS';
                }
            },
            selectPosDegreedtl: {
                required: function (element) {
                    return $('#inputTbl').val() != 'ST_ZEREGDEV_STAFFS';
                }
            },
            inputTsolName: {
                required: true,
                maxlength: 150
            },
            inputDecisionDate: {
                required: true,
                maxlength: 10
            },
            inputCertificateNo: {
                required: function (element) {
                    return $('#inputTbl').val() != 'ST_ZEREGDEV_STAFFS';
                },
                maxlength: 50
            },
            inputUnemlehNo: {
                maxlength: 50
            }
        },
        messages: {
            selectPosDegree: {
                required: 'Сонгоно уу'
            },
            selectRank: {
                required: 'Сонгоно уу'
            },
            selectPosDegreedtl: {
                required: 'Сонгоно уу'
            },
            inputTsolName: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 150 байна'
            },
            inputDecisionDate: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 10 байна'
            },
            inputCertificateNo: {
                required: 'Оруулна уу',
                maxlength: 'Тэмдэгт уртдаа 50 байна'
            },
            inputUnemlehNo: {
                maxlength: 'Тэмдэгт уртдаа 50 байна'
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
            jsonData.pTbl = $.trim($("#inputTbl").val());
            jsonData.pRankPosDegree = $.trim($("#selectPosDegree").val());
            jsonData.pRank = $.trim($("#selectRank").val());
            jsonData.pPosDegreeDtl = $.trim($("#selectPosDegreedtl").val());
            jsonData.pTsolName = $.trim($("#inputTsolName").val());
            jsonData.pDecisionDate = $.trim($("#inputDecisionDate").val());
            jsonData.pCertificateNo = $.trim($("#inputCertificateNo").val());
            jsonData.pUnemlehNo = $.trim($("#inputUnemlehNo").val());
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveProfileTab3T3Datatable1",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resData = jQuery.parseJSON(data.d);
                    $("#btnSave").html('<i class="fa fa-save"></i> Хадгалах');
                    $("#btnSave").removeAttr('disabled');
                    if (resData.d.RetType == "0") {
                        dataBindTab3T3Section1Datatable();
                        $('#myModalProfileTab3t3').modal('hide');
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
        $('#myModalProfileTab3t3').modal('hide');
    });
    $('#inputDecisionDate').datepicker({
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