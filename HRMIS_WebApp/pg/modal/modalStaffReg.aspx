<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalStaffReg.aspx.cs" Inherits="HRWebApp.pg.modal.modalStaffReg" %>
<form id="pTab1ModalForm">
    <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		    &times;
	    </button>
	    <h4 class="modal-title">Ажилтны бүртгэл&nbsp;<span id="spanModifyType" runat="server"></span></h4>
    </div>
    <div class="modal-body">
        <input type="hidden" id="pTab1ID" runat="server" />
        <fieldset>
            <legend>Албан тушаал</legend>
		    <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <label class="control-label">*Харьяалагдах байгууллага</label>
                        <select id="pTab1ModalSelectOrg" name="pTab1ModalSelectOrg" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="col-md-6">
                        <label class="control-label">*Харьяалагдах нэгж</label>
                        <select id="pTab1ModalSelectBranch" name="pTab1ModalSelectBranch" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="col-md-3">
                        <label class="control-label">*Домайн хаяг</label>
                        <input id="pTab1ModalInputDomainname" name="pTab1ModalInputDomainname" runat="server" type="text" class="form-control" placeholder="Домайн хаяг" />
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset>
		    <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <input id="pTab1ModalHiddenMove" runat="server" type="hidden" />
                        <label class="control-label">*Хөдөлгөөн</label>
                        <select id="pTab1ModalSelectMove" name="pTab1ModalSelectMove" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="col-md-3">
                        <label class="control-label">*Албан тушаал төрөл</label>
                        <select id="pTab1ModalSelectPostype" name="pTab1ModalSelectPostype" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="col-md-3">
                        <label class="control-label">*Албан тушаал</label>
                        <select id="pTab1ModalSelectPos" name="pTab1ModalSelectPos" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="col-md-3">
                        <label class="control-label">Албаны ангилал зэрэглэл</label>
                        <select id="pTab1ModalSelectRank" name="pTab1ModalSelectRank" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                </div>
            </div>
		    <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label class="control-label">*Томил/огноо</label>
                        <input id="pTab1ModalInputSigndate" name="pTab1ModalInputSigndate" runat="server" type="text" class="form-control" placeholder="Томилогдсон огноо" />
                    </div>
                    <div class="col-md-2">
                        <label class="control-label">Тушаалын огноо</label>
                        <input id="pTab1ModalInputTushaaldate" name="pTab1ModalInputTushaaldate" runat="server" type="text" class="form-control" placeholder="Тушаалын огноо" />
                    </div>
                    <div class="col-md-2">
                        <label class="control-label">Тушаалын дугаар</label>
                        <input id="pTab1ModalInputTushaalno" name="pTab1ModalInputTushaalno" runat="server" type="text" class="form-control" placeholder="Тушаалын дугаар" />
                    </div>
                    <div class="col-md-6">
                        <label class="control-label">Нэмэлт тайлбар</label>
                        <input id="pTab1ModalInputDescription" name="pTab1ModalInputDescription" runat="server" type="text" class="form-control" placeholder="Нэмэлт тайлбар" />
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="row">
            <div class="col-md-4">
                <fieldset>
                    <legend>Хувийн мэдээлэл</legend>
                    <div class="form-group">
                        <label class="control-label">*Иргэншил</label>
					    <input id="pTab1ModalInputNationality" name="pTab1ModalInputNationality" runat="server" type="text" class="form-control" placeholder="Иргэншил" maxlength="50" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Ургийн овог</label>
                        <input id="pTab1ModalInputMName" name="pTab1ModalInputMName" runat="server" type="text" class="form-control" placeholder="Ургийн овог" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">*Эцэг(эх)-н нэр</label>
                        <input id="pTab1ModalInputLName" name="pTab1ModalInputLName" runat="server" type="text" class="form-control" placeholder="Эцэг(эх)-н нэр" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">*Өөрийн нэр</label>
                        <input id="pTab1ModalInputFName" name="pTab1ModalInputFName" runat="server" type="text" class="form-control" placeholder="Өөрийн нэр" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">*Хүйс</label>
                        <div class="radio no-margin">
                            <label class="radio radio-inline no-margin">
							    <input id="pTab1ModalSelectGenderMale" runat="server" type="radio" class="radiobox" name="pTab1ModalSelectGender" value="1">
							    <span>Эрэгтэй</span>
						    </label>
						    <label class="radio radio-inline">
							    <input id="pTab1ModalSelectGenderFemale" runat="server" type="radio" class="radiobox" name="pTab1ModalSelectGender" value="0">
							    <span>Эмэгтэй</span>  
						    </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Төрсөн огноо</label>
					    <input id="pTab1ModalInputBdate" name="pTab1ModalInputBdate" runat="server" type="text" class="form-control" placeholder="Төрсөн огноо" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Боловсрол</label>
					    <select id="pTab1ModalSelectEdutp" name="pTab1ModalSelectEdutp" runat="server" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Мэргэжлийн ангилал</label>
					    <select id="pTab1ModalSelectOcctp" name="pTab1ModalSelectOcctp" runat="server" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Мэргэжлийн нэр</label>
					    <input id="pTab1ModalInputOccname" name="pTab1ModalInputOccname" runat="server" type="text" class="form-control" placeholder="Мэргэжлийн нэр" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Төрсөн газар, Үндэс угсаа</legend>
                    <div class="form-group">
                        <label class="control-label">Төрсөн аймаг, хот</label>
					    <select id="pTab1ModalSelectBcity" name="pTab1ModalSelectBcity" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Төрсөн сум, дүүрэг</label>
					    <select id="pTab1ModalSelectBdist" name="pTab1ModalSelectBdist" runat="server" class="form-control" style="padding: 5px;" disabled="disabled">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Үндэс угсаа</label>
					    <select id="pTab1ModalSelectNat" name="pTab1ModalSelectNat" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Нийгмийн гарал</label>
					    <select id="pTab1ModalSelectSocpos" name="pTab1ModalSelectSocpos" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-4">
                <fieldset>
                    <legend>Зураг</legend>
                    <div class="form-group friends-list">
                        <img id="pTab1ModalImgStaffImage" runat="server" src="../img/avatars/male.png" alt="friend-1" style="height:100px; width:auto;">
                    </div>
                    <div class="form-group">
                        <input id="pTab1ModalInputImageUpload" runat="server" type="file" class="btn btn-default">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Хурууний хээний код</label>
                        <label class="control-label pull-right"><a id="pTab1ModalBtnNewFingerid" href="javascript:void(0);" class="btn btn-link btn-xs font-sm"><i>Шинэ код авах</i></a></label>
                        <input id="pTab1ModalInputFingerid" name="pTab1ModalInputFingerid" runat="server" type="text" class="form-control" placeholder="Хурууний хээний код" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Оршин суугаа хаяг</legend>
                    <div class="form-group">
                        <label class="control-label">Аймаг, хот</label>
                        <select id="pTab1ModalSelectAddresscity" name="pTab1ModalSelectAddresscity" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Сум, дүүрэг</label>
                        <select id="pTab1ModalSelectAddressdist" name="pTab1ModalSelectAddressdist" runat="server" class="form-control" style="padding: 5px;" disabled="disabled">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Гэрийн хаяг</label>
                        <textarea id="pTab1ModalInputAddressname" name="pTab1ModalInputAddressname" runat="server" class="form-control" placeholder="Гэрийн хаяг" cols="2"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Утас</label>
                        <input id="pTab1ModalInputTel" name="pTab1ModalInputTel" runat="server" type="text" class="form-control" placeholder="Гар утас" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Утас 2</label>
                        <input id="pTab1ModalInputTel2" name="pTab1ModalInputTel2" runat="server" type="text" class="form-control" placeholder="Гар утас 2" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Имэйл</label>
                        <input id="pTab1ModalInputEmail" name="pTab1ModalInputEmail" runat="server" type="email" class="form-control" placeholder="Имэйл" />
                    </div>
                </fieldset>
            </div>
            <div class="col-md-4">
                <fieldset>
                    <legend>Бичиг баримтууд</legend>
                    <div class="form-group">
                        <label class="control-label">*Регистрийн дугаар</label>
                        <input id="pTab1ModalInputRegno" name="pTab1ModalInputRegno" runat="server" type="text" class="form-control" placeholder="Регистрийн дугаар" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">ИҮ-н дугаар</label>
                        <input id="pTab1ModalInputCitno" name="pTab1ModalInputCitno" runat="server" type="text" class="form-control" placeholder="ИҮ-н дугаар" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">НДД-н дугаар</label>
                        <input id="pTab1ModalInputSocno" name="pTab1ModalInputSocno" runat="server" type="text" class="form-control" placeholder="НДД-н дугаар" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">ЭМДД-н дугаар</label>
                        <input id="pTab1ModalInputHealno" name="pTab1ModalInputHealno" runat="server" type="text" class="form-control" placeholder="ЭМДД-н дугаар" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Холбоо барих ойр дотны хүн</legend>
                    <div class="form-group">
                        <label class="control-label">Нэр</label>
                        <input id="pTab1ModalInputRelName" name="pTab1ModalInputRelName" runat="server" type="text" class="form-control" placeholder="Нэр" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Таны юу болох</label>
                        <select id="pTab1ModalSelectRelRelation" name="pTab1ModalSelectRelRelation" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Гэрийн хаяг</label>
                        <textarea id="pTab1ModalInputRelAddress" name="pTab1ModalInputRelAddress" runat="server" class="form-control" placeholder="Гэрийн хаяг" cols="2"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Утас</label>
                        <input id="pTab1ModalInputRelTel" name="pTab1ModalInputRelTel" runat="server" type="text" class="form-control" placeholder="Гар утас" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Утас 2</label>
                        <input id="pTab1ModalInputRelTel2" name="pTab1ModalInputRelTel2" runat="server" type="text" class="form-control" placeholder="Гар утас 2" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Имэйл</label>
                        <input id="pTab1ModalInputRelEmail" name="pTab1ModalInputRelEmail" runat="server" type="email" class="form-control" placeholder="Имэйл" />
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="modal-footer">
	    <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
	    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
    </div>
</form>
<script>
    $(document).ready(function () {
        pageSetUp();
        var valData = '';
        var jsonData = {};
        jsonData.set1stIndexValue = '- Сонго -';
        if ($.trim($('#pTab1ID').val()) == '') {
            jsonData.tp = ['1'];
        }
        else {
            jsonData.tp = [];
        }
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/ListMove",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                if (resData.d.RetType == "0") {
                    if (resData.d.RetData.length > 0) {
                        var stroptgroup = '';
                        $(resData.d.RetData).each(function (index, value) {
                            if (stroptgroup != value.TYPE_ID) {
                                if (stroptgroup == "") valData += "<optgroup label=\"" + value.TYPE_NAME + "\">";
                                else {
                                    valData += "</optgroup>";
                                    valData += "<optgroup label=\"" + value.TYPE_NAME + "\">";
                                }
                            }
                            valData += '<option value="' + value.ID + '">' + value.NAME + '</option>';
                            stroptgroup = value.TYPE_ID;
                        });
                        valData += "</optgroup>";
                    }
                }
                else {
                    alert(resData.d.RetDesc);
                }
                $("#pTab1ModalSelectMove").html(valData);
                $("#pTab1ModalSelectMove").val($('#pTab1ModalHiddenMove').val());
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                //window.location = '../#pg/error500.aspx';
            }
        });
    });

    $("#pTab1ModalSelectBcity").change(function () {
        if ($("#pTab1ModalSelectBcity option:selected").val() == "") {
            $("#pTab1ModalSelectBdist").html("<option selected value=\"\">- Сонго -</option>");
            $("#pTab1ModalSelectBdist").prop("disabled", true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/staffreg_staffregTab1ModalDistForDDL",
                data: '{city:"' + $("#pTab1ModalSelectBcity option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1ModalSelectBdist").html(msg.d);
                    $("#pTab1ModalSelectBdist").prop("disabled", false);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $("#pTab1ModalSelectAddresscity").change(function () {
        if ($("#pTab1ModalSelectAddresscity option:selected").val() == "") {
            $("#pTab1ModalSelectAddressdist").html("<option selected value=\"\">- Сонго -</option>");
            $("#pTab1ModalSelectAddressdist").prop("disabled", true);
        }
        else {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/staffreg_staffregTab1ModalDistForDDL",
                data: '{city:"' + $("#pTab1ModalSelectAddresscity option:selected").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#pTab1ModalSelectAddressdist").html(msg.d);
                    $("#pTab1ModalSelectAddressdist").prop("disabled", false);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });

    $("#pTab1ModalInputImageUpload").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 2097152) {
            errMsg += 'Файлын хэмжээ 2MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            showImage(this);
        }
        else alert(errMsg);
    });
    function showImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#pTab1ModalImgStaffImage').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $('#pTab1ModalBtnNewFingerid').click(function () {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteScalar",
            data: '{qry:"SELECT MAX(TO_NUMBER(NVL(FINGERID,0)))+1 FROM ST_STAFFS"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $('#pTab1ModalInputFingerid').val(msg.d);
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                if (err.Message == 'SessionDied') window.location = '../login';
                else window.location = '../#pg/error500.aspx';
            }
        });
    });
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalSelectOrg: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectBranch: {
                group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputDomainname: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalSelectMove: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectPostype: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectPos: {
                group: '.col-md-3',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputSigndate: {
                group: '.col-md-2',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1ModalInputTushaaldate: {
                group: '.col-md-2',
                validators: {
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1ModalInputTushaalno: {
                group: '.col-md-2',
                validators: {
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputNationality: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputMName: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputLName: {
                group: '.form-group',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputFName: {
                group: '.form-group',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalSelectGender: {
                group: '.form-group',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputDate: {
                group: '.form-group',
                validators: {
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1ModalInputOccname: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 75,
                        message: 'Уртдаа 75 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputRegno: {
                group: '.form-group',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        min: 10,
                        max: 10,
                        message: 'Зөвхөн 10 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputCitno: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 9,
                        message: 'Уртдаа 9 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputSocno: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 10,
                        message: 'Уртдаа 10 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputHealno: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputAddressname: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 200,
                        message: 'Уртдаа 200 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputTel: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputTel2: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputEmail: {
                group: '.form-group',
                validators: {
                    emailAddress: {
                        message: 'И-мэйл зөв оруулна уу'
                    }
                }
            },
            pTab1ModalInputRelName: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 50,
                        message: 'Уртдаа 50 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputRelAddress: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 200,
                        message: 'Уртдаа 200 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputRelTel: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputRelTel2: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputRelEmail: {
                group: '.form-group',
                validators: {
                    emailAddress: {
                        message: 'И-мэйл зөв оруулна уу'
                    }
                }
            },
            pTab1ModalInputFingerid: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 8,
                        message: 'Уртдаа 8 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            //var isUpdate = "";
            //if ($("#pTab1ModalHeaderLabel").html() == "засах") isUpdate = " AND a.ID!=" + $("#pTab1ID").text();
            //globalAjaxVar = $.ajax({
            //    type: "POST",
            //    url: "ws.aspx/WSOracleExecuteScalar",
            //    data: '{qry:"SELECT COUNT(1) FROM ST_STAFFS a WHERE a.REGNO=N\'' + $.trim($('#pTab1ModalInputRegno').val()) + '\'' + isUpdate + '"}',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (msg) {
            //        if (msg.d != '0') alert($.trim($('#pTab1ModalInputRegno').val()) + ' регистерийн дугаартай хэрэглэгч бүртгэгдсэн байна!');
            //        else {
            //            globalAjaxVar = $.ajax({
            //                type: "POST",
            //                url: "ws.aspx/WSOracleExecuteScalar",
            //                data: '{qry:"SELECT COUNT(1) FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE c.ACTIVE=1 AND a.DOMAIN_USER=\'' + $.trim($('#pTab1ModalInputDomainname').val()) + '\'' + isUpdate + '"}',
            //                contentType: "application/json; charset=utf-8",
            //                dataType: "json",
            //                success: function (msg) {
            //                    if (msg.d != '0') alert($.trim($('#pTab1ModalInputDomainname').val()) + ' домайн нэртэй идэвхтэй хэрэглэгч бүртгэгдсэн байна!');
            //                    else {
            //                        var valIsMarried = '0', valIsDavy = '0', valImage = '';
            //                        if ($('#pTab1ModalInputImageUpload').val() != '') valImage = $.trim($('#pTab1ModalInputRegno').val()) + "." + $('#pTab1ModalInputImageUpload').val().split('\\').pop().split('.')[$('#pTab1ModalInputImageUpload').val().split('\\').pop().split('.').length - 1];
            //                        else {
            //                            if ($('#pTab1ModalImgStaffImage').attr('src') == '../img/avatars/male.png') valImage = '';
            //                            else valImage = $('#pTab1ModalImgStaffImage').attr('src').split('/').pop();
            //                        }
            //                        if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
            //                            globalAjaxVar = $.ajax({
            //                                type: "POST",
            //                                url: "ws.aspx/STAFF_INSERT",
            //                                data: '{P_MNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputMName').val())).toUpperCase() + '", P_LNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputLName').val())).toUpperCase() + '", P_FNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputFName').val())).toUpperCase() + '", P_BDATE:"' + $.trim($('#pTab1ModalInputBdate').val()) + '", P_BCITY_ID:"' + $('#pTab1ModalSelectBcity option:selected').val() + '", P_BDIST_ID:"' + $('#pTab1ModalSelectBdist option:selected').val() + '", P_NAT_ID:"' + $('#pTab1ModalSelectNat option:selected').val() + '", P_EDUTP_ID:"' + $('#pTab1ModalSelectEdutp option:selected').val() + '", P_SOCPOS_ID:"' + $('#pTab1ModalSelectSocpos option:selected').val() + '", P_OCCTYPE_ID:"' + $('#pTab1ModalSelectOcctp option:selected').val() + '", P_OCCNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputOccname').val())) + '", P_GENDER:"' + $('input[name = "pTab1ModalSelectGender"]:checked').val() + '", P_REGNO:"' + $.trim($('#pTab1ModalInputRegno').val()).toUpperCase() + '", P_CITNO:"' + $.trim($('#pTab1ModalInputCitno').val()).toUpperCase() + '", P_SOCNO:"' + $.trim($('#pTab1ModalInputSocno').val()).toUpperCase() + '", P_HEALNO:"' + $.trim($('#pTab1ModalInputHealno').val()).toUpperCase() + '", P_ADDRCITY_ID:"' + $('#pTab1ModalSelectAddresscity option:selected').val() + '", P_ADDRDIST_ID:"' + $('#pTab1ModalSelectAddressdist option:selected').val() + '", P_ADDRESSNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputAddressname').val())) + '", P_TEL:"' + $.trim($('#pTab1ModalInputTel').val()) + '", P_TEL2:"' + $.trim($('#pTab1ModalInputTel2').val()) + '", P_EMAIL:"' + $.trim($('#pTab1ModalInputEmail').val()) + '", P_IMAGE:"' + valImage + '", P_DT:"' + $.trim($('#pTab1ModalInputSigndate').val()) + '", P_BRANCH_ID:"' + $('#pTab1ModalSelectBranch option:selected').val() + '", P_POSTYPE_ID:"' + $('#pTab1ModalSelectPostype option:selected').val() + '", P_POS_ID:"' + $('#pTab1ModalSelectPos option:selected').val() + '", P_RANK_ID:"' + $('#pTab1ModalSelectRank option:selected').val() + '", P_TUSHAALDATE:"' + $.trim($('#pTab1ModalInputTushaaldate').val()) + '", P_TUSHAALNO:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaalno').val())) + '", P_MOVE_ID:"' + $('#pTab1ModalSelectMove option:selected').val() + '", P_DESCRIPTION:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val())) + '", P_STAFFID:"' + $.trim($('#indexUserId').html()) + '", P_DOMAIN_USER:"' + $.trim($('#pTab1ModalInputDomainname').val()) + '", P_RELNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputRelName').val())) + '", P_RELATION_ID:"' + $('#pTab1ModalSelectRelRelation option:selected').val() + '", P_RELADDRESSNAME:"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputRelAddress').val())) + '", P_RELTEL:"' + $.trim($('#pTab1ModalInputRelTel').val()) + '", P_RELTEL2:"' + $.trim($('#pTab1ModalInputRelTel2').val()) + '", P_RELEMAIL:"' + $.trim($('#pTab1ModalInputRelEmail').val()) + '", P_FINGERID:"' + $.trim($('#pTab1ModalInputFingerid').val()) + '"}',
            //                                contentType: "application/json; charset=utf-8",
            //                                dataType: "json",
            //                                success: function () {
            //                                    if ($.trim($('#pTab1ModalInputImageUpload').val()) != '') {
            //                                        var uploadfiles = $("#pTab1ModalInputImageUpload").get(0);
            //                                        var uploadedfiles = uploadfiles.files;
            //                                        var fromdata = new FormData();
            //                                        globalAjaxVar = $.ajax({
            //                                            type: "POST",
            //                                            url: "pg/UploadFile.ashx?folder=staffs&filename=" + valImage,
            //                                            data: fromdata,
            //                                            contentType: false,
            //                                            processData: false,
            //                                            success: function () {
            //                                                smallBox('Ажилтаны зураг', 'Амжилттай хадгалагдлаа', '#659265', 2000);
            //                                            },
            //                                            failure: function (response) {
            //                                                alert('FAILURE: ' + response.d);
            //                                            },
            //                                            error: function (xhr, status, error) {
            //                                                var err = eval("(" + xhr.responseText + ")");
            //                                                if (err.Message == 'SessionDied') window.location = '../login';
            //                                                else alert('Зураг хадгалахад алдаа гарлаа: ' + err.Message);
            //                                            }
            //                                        });
            //                                    }
            //                                    dataBindTab1Datatable();
            //                                    $('#pTab1Modal').modal('hide');
            //                                    smallBox('Ажилтан', 'Амжилттай хадгалагдлаа', '#659265', 4000);
            //                                },
            //                                failure: function (response) {
            //                                    alert('FAILURE: ' + response.d);
            //                                },
            //                                error: function (xhr, status, error) {
            //                                    var err = eval("(" + xhr.responseText + ")");
            //                                    if (err.Message == 'SessionDied') window.location = '../login';
            //                                    else window.location = '../#pg/error500.aspx';
            //                                }
            //                            });
            //                        }
            //                        else {
            //                            var jsonData = {};
            //                            jsonData.P_ID = $('#pTab1ID').text();
            //                            jsonData.P_MNAME = replaceDisplayToDatabase($.trim($('#pTab1ModalInputMName').val())).toUpperCase();
            //                            jsonData.P_LNAME = replaceDisplayToDatabase($.trim($('#pTab1ModalInputLName').val())).toUpperCase();
            //                            jsonData.P_FNAME = replaceDisplayToDatabase($.trim($('#pTab1ModalInputFName').val())).toUpperCase();
            //                            jsonData.P_BDATE = $.trim($('#pTab1ModalInputBdate').val());
            //                            jsonData.P_BCITY_ID = $('#pTab1ModalSelectBcity option:selected').val();
            //                            jsonData.P_BDIST_ID = $('#pTab1ModalSelectBdist option:selected').val();
            //                            jsonData.P_NAT_ID = $('#pTab1ModalSelectNat option:selected').val();
            //                            jsonData.P_EDUTP_ID = $('#pTab1ModalSelectEdutp option:selected').val();
            //                            jsonData.P_SOCPOS_ID = $('#pTab1ModalSelectSocpos option:selected').val();
            //                            jsonData.P_OCCTYPE_ID = $('#pTab1ModalSelectOcctp option:selected').val();
            //                            jsonData.P_OCCNAME = replaceDisplayToDatabase($.trim($('#pTab1ModalInputOccname').val()));
            //                            jsonData.P_GENDER = $('input[name = "pTab1ModalSelectGender"]:checked').val();
            //                            jsonData.P_REGNO = $.trim($('#pTab1ModalInputRegno').val()).toUpperCase();
            //                            jsonData.P_CITNO = $.trim($('#pTab1ModalInputCitno').val()).toUpperCase();
            //                            jsonData.P_SOCNO = $.trim($('#pTab1ModalInputSocno').val()).toUpperCase();
            //                            jsonData.P_HEALNO = $.trim($('#pTab1ModalInputHealno').val()).toUpperCase();
            //                            jsonData.P_ADDRCITY_ID = $('#pTab1ModalSelectAddresscity option:selected').val();
            //                            jsonData.P_ADDRDIST_ID = $('#pTab1ModalSelectAddressdist option:selected').val();
            //                            jsonData.P_ADDRESSNAME = replaceDisplayToDatabase($.trim($('#pTab1ModalInputAddressname').val()));
            //                            jsonData.P_TEL = $.trim($('#pTab1ModalInputTel').val());
            //                            jsonData.P_TEL2 = $.trim($('#pTab1ModalInputTel2').val());
            //                            jsonData.P_EMAIL = $.trim($('#pTab1ModalInputEmail').val());
            //                            jsonData.P_IMAGE = valImage;
            //                            jsonData.P_DT = $.trim($('#pTab1ModalInputSigndate').val());
            //                            jsonData.P_BRANCH_ID = $('#pTab1ModalSelectBranch option:selected').val();
            //                            jsonData.P_POSTYPE_ID = $('#pTab1ModalSelectPostype option:selected').val();
            //                            jsonData.P_POS_ID = $('#pTab1ModalSelectPos option:selected').val();
            //                            jsonData.P_RANK_ID = $('#pTab1ModalSelectRank option:selected').val();
            //                            jsonData.P_TUSHAALDATE = $.trim($('#pTab1ModalInputTushaaldate').val());
            //                            jsonData.P_TUSHAALNO = replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaalno').val()));
            //                            jsonData.P_MOVE_ID = $('#pTab1ModalSelectMove option:selected').val();
            //                            jsonData.P_DESCRIPTION = replaceDisplayToDatabase($.trim($('#pTab1ModalInputDescription').val()));
            //                            jsonData.P_STAFFID = $.trim($('#indexUserId').html());
            //                            jsonData.P_DOMAIN_USER = $.trim($('#pTab1ModalInputDomainname').val());
            //                            jsonData.P_RELNAME = replaceDisplayToDatabase($.trim($('#pTab1ModalInputRelName').val()));
            //                            jsonData.P_RELATION_ID = $('#pTab1ModalSelectRelRelation option:selected').val();
            //                            jsonData.P_RELADDRESSNAME = replaceDisplayToDatabase($.trim($('#pTab1ModalInputRelAddress').val()));
            //                            jsonData.P_RELTEL = $.trim($('#pTab1ModalInputRelTel').val());
            //                            jsonData.P_RELTEL2 = $.trim($('#pTab1ModalInputRelTel2').val());
            //                            jsonData.P_RELEMAIL = $.trim($('#pTab1ModalInputRelEmail').val());
            //                            jsonData.P_FINGERID = $.trim($('#pTab1ModalInputFingerid').val());
            //                            //jsonData.MACID = '';
            //                            globalAjaxVar = $.ajax({
            //                                type: "POST",
            //                                url: "ws.aspx/STAFF_UPDATE",
            //                                data: JSON.stringify(jsonData),
            //                                contentType: "application/json; charset=utf-8",
            //                                dataType: "json",
            //                                success: function () {
            //                                    if ($.trim($('#pTab1ModalInputImageUpload').val()) != '') {
            //                                        var uploadfiles = $("#pTab1ModalInputImageUpload").get(0);
            //                                        var uploadedfiles = uploadfiles.files;
            //                                        var fromdata = new FormData();
            //                                        globalAjaxVar = $.ajax({
            //                                            type: "POST",
            //                                            url: "pg/UploadFile.ashx?folder=staffs&filename=" + valImage,
            //                                            data: fromdata,
            //                                            contentType: false,
            //                                            processData: false,
            //                                            success: function () {
            //                                                smallBox('Ажилтаны зураг', 'Амжилттай хадгалагдлаа', '#659265', 2000);
            //                                            },
            //                                            failure: function (response) {
            //                                                alert('FAILURE: ' + response.d);
            //                                            },
            //                                            error: function (xhr, status, error) {
            //                                                var err = eval("(" + xhr.responseText + ")");
            //                                                if (err.Message == 'SessionDied') window.location = '../login';
            //                                                else alert('Зураг хадгалахад алдаа гарлаа: ' + err.Message);
            //                                            }
            //                                        });
            //                                    }
            //                                    dataBindTab1Datatable();
            //                                    $('#pTab1Modal').modal('hide');
            //                                    smallBox('Ажилтан', 'Амжилттай хадгалагдлаа', '#659265', 4000);
            //                                },
            //                                failure: function (response) {
            //                                    alert('FAILURE: ' + response.d);
            //                                },
            //                                error: function (xhr, status, error) {
            //                                    var err = eval("(" + xhr.responseText + ")");
            //                                    if (err.Message == 'SessionDied') window.location = '../login';
            //                                    else window.location = '../#pg/error500.aspx';
            //                                }
            //                            });
            //                        }
            //                    }
            //                },
            //                failure: function (response) {
            //                    alert('FAILURE: ' + response.d);
            //                },
            //                error: function (xhr, status, error) {
            //                    var err = eval("(" + xhr.responseText + ")");
            //                    if (err.Message == 'SessionDied') window.location = '../login';
            //                    else window.location = '../#pg/error500.aspx';
            //                }
            //            });
            //        }
            //    },
            //    failure: function (response) {
            //        alert('FAILURE: ' + response.d);
            //    },
            //    error: function (xhr, status, error) {
            //        var err = eval("(" + xhr.responseText + ")");
            //        if (err.Message == 'SessionDied') window.location = '../login';
            //        else window.location = '../#pg/error500.aspx';
            //    }
            //});
            var valImage = '';
            if ($('#pTab1ModalInputImageUpload').val() != '') valImage = $.trim($('#pTab1ModalInputRegno').val()) + "." + $('#pTab1ModalInputImageUpload').val().split('\\').pop().split('.')[$('#pTab1ModalInputImageUpload').val().split('\\').pop().split('.').length - 1];
            else {
                if ($('#pTab1ModalImgStaffImage').attr('src') == '../img/avatars/male.png') valImage = '';
                else valImage = $('#pTab1ModalImgStaffImage').attr('src').split('/').pop();
            }
            var jsonData = {};
            jsonData.P_ID = $('#pTab1ID').val();
            jsonData.P_NATIONALITY = $.trim($('#pTab1ModalInputNationality').val());
            jsonData.P_MNAME = $.trim($('#pTab1ModalInputMName').val()).toUpperCase();
            jsonData.P_LNAME = $.trim($('#pTab1ModalInputLName').val()).toUpperCase();
            jsonData.P_FNAME = $.trim($('#pTab1ModalInputFName').val()).toUpperCase();
            jsonData.P_BDATE = $.trim($('#pTab1ModalInputBdate').val());
            jsonData.P_BCITY_ID = $('#pTab1ModalSelectBcity option:selected').val();
            jsonData.P_BDIST_ID = $('#pTab1ModalSelectBdist option:selected').val();
            jsonData.P_NAT_ID = $('#pTab1ModalSelectNat option:selected').val();
            jsonData.P_EDUTP_ID = $('#pTab1ModalSelectEdutp option:selected').val();
            jsonData.P_SOCPOS_ID = $('#pTab1ModalSelectSocpos option:selected').val();
            jsonData.P_OCCTYPE_ID = $('#pTab1ModalSelectOcctp option:selected').val();
            jsonData.P_OCCNAME = $.trim($('#pTab1ModalInputOccname').val());
            jsonData.P_GENDER = $('input[name = "pTab1ModalSelectGender"]:checked').val();
            jsonData.P_REGNO = $.trim($('#pTab1ModalInputRegno').val()).toUpperCase();
            jsonData.P_CITNO = $.trim($('#pTab1ModalInputCitno').val()).toUpperCase();
            jsonData.P_SOCNO = $.trim($('#pTab1ModalInputSocno').val()).toUpperCase();
            jsonData.P_HEALNO = $.trim($('#pTab1ModalInputHealno').val()).toUpperCase();
            jsonData.P_ADDRCITY_ID = $('#pTab1ModalSelectAddresscity option:selected').val();
            jsonData.P_ADDRDIST_ID = $('#pTab1ModalSelectAddressdist option:selected').val();
            jsonData.P_ADDRESSNAME = $.trim($('#pTab1ModalInputAddressname').val());
            jsonData.P_TEL = $.trim($('#pTab1ModalInputTel').val());
            jsonData.P_TEL2 = $.trim($('#pTab1ModalInputTel2').val());
            jsonData.P_EMAIL = $.trim($('#pTab1ModalInputEmail').val());
            jsonData.P_IMAGE = valImage;
            jsonData.P_DT = $.trim($('#pTab1ModalInputSigndate').val());
            jsonData.P_BRANCH_ID = $('#pTab1ModalSelectBranch option:selected').val();
            jsonData.P_POSTYPE_ID = $('#pTab1ModalSelectPostype option:selected').val();
            jsonData.P_POS_ID = $('#pTab1ModalSelectPos option:selected').val();
            jsonData.P_RANK_ID = $('#pTab1ModalSelectRank option:selected').val();
            jsonData.P_TUSHAALDATE = $.trim($('#pTab1ModalInputTushaaldate').val());
            jsonData.P_TUSHAALNO = $.trim($('#pTab1ModalInputTushaalno').val());
            jsonData.P_MOVE_ID = $('#pTab1ModalSelectMove option:selected').val();
            jsonData.P_DESCRIPTION = $.trim($('#pTab1ModalInputDescription').val());
            jsonData.P_STAFFID = $.trim($('#indexUserId').html());
            jsonData.P_DOMAIN_USER = $.trim($('#pTab1ModalInputDomainname').val());
            jsonData.P_RELNAME = $.trim($('#pTab1ModalInputRelName').val());
            jsonData.P_RELATION_ID = $('#pTab1ModalSelectRelRelation option:selected').val();
            jsonData.P_RELADDRESSNAME = $.trim($('#pTab1ModalInputRelAddress').val());
            jsonData.P_RELTEL = $.trim($('#pTab1ModalInputRelTel').val());
            jsonData.P_RELTEL2 = $.trim($('#pTab1ModalInputRelTel2').val());
            jsonData.P_RELEMAIL = $.trim($('#pTab1ModalInputRelEmail').val());
            jsonData.P_FINGERID = $.trim($('#pTab1ModalInputFingerid').val());
            //jsonData.MACID = '';
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "../webservice/ServiceMain.svc/SaveStaff",
                data: JSON.stringify(jsonData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    if ($.trim($('#pTab1ModalInputImageUpload').val()) != '') {
                        var uploadfiles = $("#pTab1ModalInputImageUpload").get(0);
                        var uploadedfiles = uploadfiles.files;
                        var fromdata = new FormData();
                        globalAjaxVar = $.ajax({
                            type: "POST",
                            url: "pg/UploadFile.ashx?folder=staffs&filename=" + valImage,
                            data: fromdata,
                            contentType: false,
                            processData: false,
                            success: function () {

                                smallBox('Ажилтаны зураг', 'Амжилттай хадгалагдлаа', '#659265', 2000);
                            },
                            failure: function (response) {
                                alert('FAILURE: ' + response.d);
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                if (err.Message == 'SessionDied') window.location = '../login';
                                else alert('Зураг хадгалахад алдаа гарлаа: ' + err.Message);
                            }
                        });
                    }
                    dataBindTab1Datatable();
                    $('#myModal').modal('hide');
                    smallBox('Ажилтан', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });

    $('#pTab1ModalInputBdate, #pTab1ModalInputSigndate, #pTab1ModalInputTushaaldate').datepicker({
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