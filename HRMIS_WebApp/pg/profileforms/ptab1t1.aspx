<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t1.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t1" %>
<div class="row" style="padding-top:10px;">
    <div class="col-sm-3">
        <div class="well well-sm">
            <form id="ptab1t1Section1Form" method="post">
                <fieldset>
                    <legend>Хувийн мэдээлэл</legend>
                    <div class="form-group">
                        <label class="control-label">Иргэншил</label>
                        <input id="pTab1ModalInputNationality" name="pTab1ModalInputNationality" runat="server" type="text" class="form-control" placeholder="Иргэншил" />
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
					    <select id="pTab1ModalSelectEdutp" name="pTab1ModalSelectEdutp" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Мэргэжлийн ангилал</label>
					    <select id="pTab1ModalSelectOcctp" name="pTab1ModalSelectOcctp" runat="server" class="form-control" style="padding: 5px;">
						    <option value="">- Сонго -</option>
					    </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Мэргэжлийн нэр</label>
					    <input id="pTab1ModalInputOccname" name="pTab1ModalInputOccname" runat="server" type="text" class="form-control" placeholder="Мэргэжлийн нэр" />
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-xs btn-block">
						    <span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах
					    </button>
                    </div>
                </fieldset>
            </form>
         </div>
    </div>
    <div class="col-sm-3">
        <div class="well well-sm">
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
                        <label class="control-label">Төрсөн газар</label>
					    <input id="pTab1ModalInputBplace" name="pTab1ModalInputBplace" runat="server" type="text" class="form-control" placeholder="Төрсөн газар" />
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
                <div class="form-group">
                    <button id="ptabt1Section2BtnSave" type="button" class="btn btn-primary btn-xs btn-block">
						<span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах
					</button>
                </div>
            </fieldset>
         </div>
    </div>
    <div class="col-sm-3">
        <div class="well well-sm">
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
                <div class="form-group">
                    <label class="control-label">МАC ID</label>
                    <input id="MacID" name="MacID" runat="server" type="text" class="form-control" placeholder="MacID" />
                </div>
                <div class="form-group">
                    <button id="ptabt1Section3BtnSave" type="button" class="btn btn-primary btn-xs btn-block">
						<span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах
					</button>
                </div>
            </fieldset>
         </div>
    </div>
    <div class="col-sm-3">
        <div class="well well-sm">
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
                <div class="form-group">
                    <button id="ptabt1Section4BtnSave" type="button" class="btn btn-primary btn-xs btn-block">
						<span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах
					</button>
                </div>
            </fieldset>
         </div>
    </div>
</div>
<script type="text/javascript">
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
                    if (err.Message == 'SessionDied') window.location = '../login.html';
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
                    if (err.Message == 'SessionDied') window.location = '../login.html';
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $('#ptab1t1Section1Form').bootstrapValidator({
        fields: {
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
            pTab1ModalInputOccname: {
                group: '.form-group',
                validators: {
                    stringLength: {
                        max: 75,
                        message: 'Уртдаа 75 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_STAFFS SET NATIONALITY=' + strQryIsNull('varchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1ModalInputNationality').val()))))+', MNAME=' + strQryIsNull('varchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1ModalInputMName').val())))) + ', LNAME=' + strQryIsNull('varchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1ModalInputLName').val())))) + ', FNAME=' + strQryIsNull('varchar', strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1ModalInputFName').val())))) + ', GENDER=' + $('input[name = "pTab1ModalSelectGender"]:checked').val() + ', BDATE=' + strQryIsNull('varchar', $.trim($('#pTab1ModalInputBdate').val())) + ', EDUTP_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectEdutp option:selected').val()) + ', OCCTYPE_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectOcctp option:selected').val()) + ', OCCNAME=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputOccname').val()))) + ' WHERE ID=' + <%=Request.QueryString["id"]%> + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    var valReplaceType = '', valReplaceGender = '', valReplaceName = '';
                    valReplaceType = $('#profileMainDivStafftype').html().split('<br>')[0];
                    if ($('input[name = "pTab1ModalSelectGender"]:checked').val() == '1') valReplaceGender = '<i class="fa fa-male"></i> Эрэгтэй';
                    else valReplaceGender = '<i class="fa fa-female"></i> Эмэгтэй';
                    $('#profileMainDivStafftype').html(valReplaceType + '<br><br>' + valReplaceGender + '<br><span>' + getAge($.trim($('#pTab1ModalInputBdate').val())) + ' нас<span>');
                    valReplaceName = '<span class="semi-bold">' + strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1ModalInputFName').val()))) + '</span> ' + strConvertFirstCharUpper(replaceDisplayToDatabase($.trim($('#pTab1ModalInputLName').val())));
                    $('#profileMainH1Names').html(valReplaceName + '<br>' + $('#profileMainH1Names').html().split('<br>')[1]);
                    smallBox('Хувийн мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.html';
                    else if (err.Message == 'NullReferenceException') {
                        //alert('NullReferenceException');
                    }
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $('#ptabt1Section2BtnSave').click(function (e) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteNonQuery",
            data: '{qry:"UPDATE ST_STAFFS SET BCITY_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectBcity option:selected').val()) + ', BDIST_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectBdist option:selected').val()) + ', BPLACE=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputBplace').val()))) + ', NAT_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectNat option:selected').val()) + ', SOCPOS_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectSocpos option:selected').val()) + ' WHERE ID=' + <%=Request.QueryString["id"]%> + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Төрсөн газар, Үндэс угсаа', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.html';
                    else if (err.Message == 'NullReferenceException') {
                        //alert('NullReferenceException');
                    }
                    else window.location = '../#pg/error500.aspx';
                }
        });
    });
    $('#ptabt1Section3BtnSave').click(function (e) {
        var errMsg = "0";
        if ($.trim($('#pTab1ModalInputAddressname').val()).length > 200) alert($('#pTab1ModalInputAddressname').attr('placeholder') + ' уртдаа 200 тэмдэгт авна');
        else {
            if ($.trim($('#pTab1ModalInputTel').val()).length > 8) alert($('#pTab1ModalInputTel').attr('placeholder') + ' уртдаа 8 тэмдэгт авна');
            else {
                if ($.trim($('#pTab1ModalInputTel').val()) == '') {
                    if ($.trim($('#pTab1ModalInputTel2').val()).length > 8) alert($('#pTab1ModalInputTel2').attr('placeholder') + ' уртдаа 8 тэмдэгт авна');
                    else {
                        if ($.trim($('#pTab1ModalInputTel2').val()) == '') {
                            if ($.trim($('#pTab1ModalInputEmail').val()) != '') {
                                if (!isValidEmailAddress($.trim($('#pTab1ModalInputEmail').val()))) alert($('#pTab1ModalInputEmail').attr('placeholder') + ' зөв оруулна уу');
                                else errMsg = "1";
                            }
                            else errMsg = "1";
                        }
                        else {
                            if (!$.isNumeric($.trim($('#pTab1ModalInputTel2').val()))) alert($('#pTab1ModalInputTel2').attr('placeholder') + ' зөвхөн тоон тэмдэгт авна');
                            else {
                                if ($.trim($('#pTab1ModalInputEmail').val()) != '') {
                                    if (!isValidEmailAddress($.trim($('#pTab1ModalInputEmail').val()))) alert($('#pTab1ModalInputEmail').attr('placeholder') + ' зөв оруулна уу');
                                    else errMsg = "1";
                                }
                                else errMsg = "1";
                            }
                        }
                    }
                }
                else {
                    if (!$.isNumeric($.trim($('#pTab1ModalInputTel').val()))) alert($('#pTab1ModalInputTel').attr('placeholder') + ' зөвхөн тоон тэмдэгт авна');
                    else {
                        if ($.trim($('#pTab1ModalInputTel2').val()).length > 8) alert($('#pTab1ModalInputTel2').attr('placeholder') + ' уртдаа 8 тэмдэгт авна');
                        else {
                            if ($.trim($('#pTab1ModalInputTel2').val()) == '') {
                                if ($.trim($('#pTab1ModalInputEmail').val()) != '') {
                                    if (!isValidEmailAddress($.trim($('#pTab1ModalInputEmail').val()))) alert($('#pTab1ModalInputEmail').attr('placeholder') + ' зөв оруулна уу');
                                    else errMsg = "1";
                                }
                                else errMsg = "1";
                            }
                            else {
                                if (!$.isNumeric($.trim($('#pTab1ModalInputTel2').val()))) alert($('#pTab1ModalInputTel2').attr('placeholder') + ' зөвхөн тоон тэмдэгт авна');
                                else {
                                    if ($.trim($('#pTab1ModalInputEmail').val()) != '') {
                                        if (!isValidEmailAddress($.trim($('#pTab1ModalInputEmail').val()))) alert($('#pTab1ModalInputEmail').attr('placeholder') + ' зөв оруулна уу');
                                        else errMsg = "1";
                                    }
                                    else errMsg = "1";
                                }
                            }
                        }
                    }
                }
            }
        }
        if (errMsg == '1') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_STAFFS SET ADDRCITY_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectAddresscity option:selected').val()) + ', ADDRDIST_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectAddressdist option:selected').val()) + ', ADDRESSNAME=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputAddressname').val()))) + ', TEL=' + strQryIsNull('numeric', $.trim($('#pTab1ModalInputTel').val())) + ', TEL2=' + strQryIsNull('numeric', $.trim($('#pTab1ModalInputTel2').val())) + ', EMAIL=' + strQryIsNull('varchar', $.trim($('#pTab1ModalInputEmail').val())) + ', MACID=' + strQryIsNull('varchar', $.trim($('#MacID').val())) + ' WHERE ID=' + <%=Request.QueryString["id"]%> + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    var valReplaceAddressDist = '', valReplaceTel2 = '';;
                    if ($('#pTab1ModalSelectAddressdist option:selected').val() != '') valReplaceAddressDist = ', ' + $('#pTab1ModalSelectAddressdist option:selected').text();
                    if ($.trim($('#pTab1ModalInputTel2').val()) != '') valReplaceTel2 = ', ' + $.trim($('#pTab1ModalInputTel2').val());

                    if ($('#pTab1ModalSelectAddresscity option:selected').val() != '' && $('#pTab1ModalSelectAddressdist option:selected').val() != '' && $.trim($('#pTab1ModalInputAddressname').val()) != '') $('#profileMainSpanAddress').html($('#pTab1ModalSelectAddresscity option:selected').text() + ', ' + $('#pTab1ModalSelectAddressdist option:selected').text() + ', ' + $.trim($('#pTab1ModalInputAddressname').val()));
                    else $('#profileMainSpanAddress').html('-');
                    if ($.trim($('#pTab1ModalInputTel').val()) == '' && $.trim($('#pTab1ModalInputTel2').val()) == '') $('#profileMainSpanTels').html('-');
                    else $('#profileMainSpanTels').html($.trim($('#pTab1ModalInputTel').val()) + valReplaceTel2);
                    if ($.trim($('#pTab1ModalInputEmail').val()) != '') $('#profileMainSpanEmail').html($.trim($('#pTab1ModalInputEmail').val()));
                    else $('#profileMainSpanEmail').html('-');
                    smallBox('Оршин суугаа хаяг', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.html';
                    else if (err.Message == 'NullReferenceException') {
                        //alert('NullReferenceException');
                    }
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    $('#ptabt1Section4BtnSave').click(function (e) {
        var errMsg = "0";
        if ($.trim($('#pTab1ModalInputRelName').val()).length > 50) alert($('#pTab1ModalInputRelName').attr('placeholder') + ' уртдаа 50 тэмдэгт авна');
        else {
            if ($.trim($('#pTab1ModalInputRelAddress').val()).length > 200) alert($('#pTab1ModalInputRelAddress').attr('placeholder') + ' уртдаа 200 тэмдэгт авна');
            else {
                if ($.trim($('#pTab1ModalInputRelTel').val()).length > 8) alert($('#pTab1ModalInputRelTel').attr('placeholder') + ' уртдаа 8 тэмдэгт авна');
                else {
                    if ($.trim($('#pTab1ModalInputRelTel').val()) == '') {
                        if ($.trim($('#pTab1ModalInputRelTel2').val()).length > 8) alert($('#pTab1ModalInputRelTel2').attr('placeholder') + ' уртдаа 8 тэмдэгт авна');
                        else {
                            if ($.trim($('#pTab1ModalInputRelTel2').val()) == '') {
                                if ($.trim($('#pTab1ModalInputRelEmail').val()) != '') {
                                    if (!isValidEmailAddress($.trim($('#pTab1ModalInputRelEmail').val()))) alert($('#pTab1ModalInputRelEmail').attr('placeholder') + ' зөв оруулна уу');
                                    else errMsg = "1";
                                }
                                else errMsg = "1";
                            }
                            else {
                                if (!$.isNumeric($.trim($('#pTab1ModalInputRelTel2').val()))) alert($('#pTab1ModalInputRelTel2').attr('placeholder') + ' зөвхөн тоон тэмдэгт авна');
                                else {
                                    if ($.trim($('#pTab1ModalInputRelEmail').val()) != '') {
                                        if (!isValidEmailAddress($.trim($('#pTab1ModalInputRelEmail').val()))) alert($('#pTab1ModalInputRelEmail').attr('placeholder') + ' зөв оруулна уу');
                                        else errMsg = "1";
                                    }
                                    else errMsg = "1";
                                }
                            }
                        }
                    }
                    else {
                        if (!$.isNumeric($.trim($('#pTab1ModalInputRelTel').val()))) alert($('#pTab1ModalInputRelTel').attr('placeholder') + ' зөвхөн тоон тэмдэгт авна');
                        else {
                            if ($.trim($('#pTab1ModalInputRelTel2').val()).length > 8) alert($('#pTab1ModalInputRelTel2').attr('placeholder') + ' уртдаа 8 тэмдэгт авна');
                            else {
                                if ($.trim($('#pTab1ModalInputRelTel2').val()) == '') {
                                    if ($.trim($('#pTab1ModalInputRelEmail').val()) != '') {
                                        if (!isValidEmailAddress($.trim($('#pTab1ModalInputRelEmail').val()))) alert($('#pTab1ModalInputRelEmail').attr('placeholder') + ' зөв оруулна уу');
                                        else errMsg = "1";
                                    }
                                    else errMsg = "1";
                                }
                                else {
                                    if (!$.isNumeric($.trim($('#pTab1ModalInputRelTel2').val()))) alert($('#pTab1ModalInputRelTel2').attr('placeholder') + ' зөвхөн тоон тэмдэгт авна');
                                    else {
                                        if ($.trim($('#pTab1ModalInputRelEmail').val()) != '') {
                                            if (!isValidEmailAddress($.trim($('#pTab1ModalInputRelEmail').val()))) alert($('#pTab1ModalInputRelEmail').attr('placeholder') + ' зөв оруулна уу');
                                            else errMsg = "1";
                                        }
                                        else errMsg = "1";
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (errMsg == '1') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/WSOracleExecuteNonQuery",
                data: '{qry:"UPDATE ST_STAFFS SET RELNAME=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputRelName').val()))) + ', RELATION_ID=' + strQryIsNull('numeric', $('#pTab1ModalSelectRelRelation option:selected').val()) + ', RELADDRESSNAME=' + strQryIsNull('varchar', replaceDisplayToDatabase($.trim($('#pTab1ModalInputRelAddress').val()))) + ', RELTEL=' + strQryIsNull('numeric', $.trim($('#pTab1ModalInputRelTel').val())) + ', RELTEL2=' + strQryIsNull('numeric', $.trim($('#pTab1ModalInputRelTel2').val())) + ', RELEMAIL=' + strQryIsNull('varchar', $.trim($('#pTab1ModalInputRelEmail').val())) + ' WHERE ID=' + <%=Request.QueryString["id"]%> + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    smallBox('Холбоо барих ойр дотны хүн', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                },
                failure: function (response) {
                    alert('FAILURE: ' + response.d);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    if (err.Message == 'SessionDied') window.location = '../login.html';
                    else if (err.Message == 'NullReferenceException') {
                        //alert('NullReferenceException');
                    }
                    else window.location = '../#pg/error500.aspx';
                }
            });
        }
    });
    
    $('#pTab1ModalInputBdate').datepicker({
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
