<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t6_2.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t6_2" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="well well-sm">
                <h4 class="text-primary" style="margin-bottom:5px;">Төрийн албан хаагч</h4>
                <table class="table">
                    <tbody>
                        <tr>
                            <td style="width:500px;">Төрийн албан хаагчийн "Ерөнхий шалгалт" өгсөн эсэх:</td>
                            <td>
                                <label class="radio radio-inline no-margin" style="width:90px;">
							        <input id="ptab1t6_2IsgaveT1" name="ptab1t6_2Isgave" runat="server" type="radio" class="radiobox" value="1">
								    <span>Өгсөн</span> 
							    </label>
                                <label class="radio radio-inline" style="width:90px;">
							        <input id="ptab1t6_2IsgaveT0" name="ptab1t6_2Isgave" runat="server" type="radio" class="radiobox" value="0">
								    <span>Өгөөгүй</span> 
							    </label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:500px;">Төрийн албан хаагчийн "Тусгай шалгалт" өгсөн эсэх:</td>
                            <td>
                                <label class="radio radio-inline no-margin" style="width:90px;">
							        <input id="ptab1t6_2IsspecialT1" name="ptab1t6_2Isspecial" runat="server" type="radio" class="radiobox" value="1">
								    <span>Өгсөн</span> 
							    </label>
                                <label class="radio radio-inline" style="width:90px;">
							        <input id="ptab1t6_2IsspecialT0" name="ptab1t6_2Isspecial" runat="server" type="radio" class="radiobox" value="0">
								    <span>Өгөөгүй</span> 
							    </label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:500px;">Төрийн албан хаагчийн "Нөөцөд" байгаа эсэх:</td>
                            <td>
                                <label class="radio radio-inline no-margin" style="width:90px;">
							        <input id="ptab1t6_2IsreserveT1" name="ptab1t6_2Isreserve" runat="server" type="radio" class="radiobox" value="1">
								    <span>Байгаа</span> 
							    </label>
                                <label class="radio radio-inline" style="width:90px;">
							        <input id="ptab1t6_2IsreserveT0" name="ptab1t6_2Isreserve" runat="server" type="radio" class="radiobox" value="0">
								    <span>Байхгүй</span> 
							    </label>
                            </td>
                        </tr>
                        <tr>
                            <td>Төрийн албан хаагчийн "Төрийн жинхэнэ тангараг" өгсөн эсэх:</td>
                            <td>
                                <label class="radio radio-inline no-margin" style="width:90px;">
							        <input id="ptab1t6_2IsswearT1" name="ptab1t6_2Isswear" runat="server" type="radio" class="radiobox" value="1">
								    <span>Өргөсөн</span> 
							    </label>
                                <label class="radio radio-inline" style="width:90px;">
							        <input id="ptab1t6_2IsswearT0" name="ptab1t6_2Isswear" runat="server" type="radio" class="radiobox" value="0">
								    <span>Өргөөгүй</span> 
							    </label>
                            </td>
                        </tr>
                        <tr>
                            <td>Төрийн албан хаагчийн "Төрийн жинхэнэ тангараг" өгсөн огноо:</td>
                            <td class="smart-form">
                                <label class="input" style="width:120px;"> 
                                    <i class="icon-append glyphicon glyphicon-floppy-disk savebtn"></i>
									<input id="ptab1t6_2Testdate" name="ptab1t6_2Testdate" type="text" runat="server" placeholder="Огноо" maxlength="10">
								</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </article>
    </div>
</section>
<script type="text/javascript">
    $('.radiobox').change(function () {
        var myEl = $(this);
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteScalar",
            data: '{qry:"SELECT COUNT(1) FROM ST_STATES WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d == '0') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteNonQuery",
                        data: '{qry:"INSERT INTO ST_STATES (STAFFS_ID, ' + myEl.attr('name').split('ptab1t6_2')[1].toUpperCase() + ') VALUES (' +<%=Request.QueryString["id"]%> +', ' + myEl.attr('id').split('ptab1t6_2')[1].split('T')[1] + ')"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteNonQuery",
                        data: '{qry:"UPDATE ST_STATES SET ' + myEl.attr('name').split('ptab1t6_2')[1].toUpperCase() + '=' + myEl.attr('id').split('ptab1t6_2')[1].split('T')[1] + '  WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
    $('.savebtn').click(function (e) {
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/WSOracleExecuteScalar",
            data: '{qry:"SELECT COUNT(1) FROM ST_STATES WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                if (msg.d == '0') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteNonQuery",
                        data: '{qry:"INSERT INTO ST_STATES (STAFFS_ID, TESTDATE) VALUES (' +<%=Request.QueryString["id"]%> +', \'' + $.trim($('#ptab1t6_2Testdate').val()) + '\')"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                else {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/WSOracleExecuteNonQuery",
                        data: '{qry:"UPDATE ST_STATES SET TESTDATE=\'' + $.trim($('#ptab1t6_2Testdate').val()) + '\' WHERE STAFFS_ID=' +<%=Request.QueryString["id"]%> +'"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            smallBox('Мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
    $('#ptab1t6_2Testdate').datepicker({
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