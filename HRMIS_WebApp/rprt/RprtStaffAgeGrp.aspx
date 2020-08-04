<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RprtStaffAgeGrp.aspx.cs" Inherits="HRWebApp.rprt.RprtStaffAgeGrp" %>
<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
    <h1 class="page-title txt-color-blueDark">
        <i class="fa fa-home fa-fw"></i> > Тайлан <span>> Ажилтан > Насны ангиллаар</span>
    </h1>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" class="active">
                    <a data-toggle="tab" href="#pTab1">
                        Насны ангиллаар
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="background-color: #fff;">
                <div id="pTab1" class="tab-pane active" style="padding:10px 0;">
                    <div class="row no-margin">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                            <div class="well">
                                <form>
                                    <fieldset>
                                        <legend>Тайлангийн шүүлт</legend>
                                        <div class="form-group">
									        <label>Дотоод нэгж</label>
									        <select id="selectFilterTab1Branch" name="selectFilterTab1Branch" runat="server" multiple style="width:100%" class="select2"></select>
								        </div>
                                        <div class="form-group">
									        <label>Төлөв</label>
									        <select id="selectFilterTab1Type" name="selectFilterTab1Type" runat="server" multiple style="width:100%" class="select2">
                                                <option value="" selected="selected">Бүгд</option>
                                                <option value="1">Идэвхтэй</option>
                                                <option value="2">Түр чөлөөлсөн</option>
                                                <option value="3">Чөлөөлсөн</option>
                                                <option value="4">Албанаас халсан</option>
									        </select>
								        </div>
                                        <div class="form-group">
									        <label>Насны хязгаар</label>
									        <select id="selectFilterTab1Ages" name="selectFilterTab1Ages" runat="server" multiple style="width:100%" class="select2">
                                                <option value="" selected="selected">Бүгд</option>
                                                <option value="0-20">20 хүртэл</option>
                                                <option value="21-25">21-25</option>
                                                <option value="26-30">26-30</option>
                                                <option value="31-35">31-35</option>
                                                <option value="36-40">36-40</option>
                                                <option value="41-45">41-45</option>
                                                <option value="46-50">46-50</option>
                                                <option value="51-55">51-55</option>
                                                <option value="56-60">56-60</option>
                                                <option value="61-200">60-с дээш</option>
									        </select>
								        </div>
                                    </fieldset>
                                    <button id="btnShowTab1" type="button" class="btn btn-primary btn-block">ТАЙЛАН ХАРАХ</button>
                                    <button id="btnRefreshTab1" type="button" class="btn btn-default btn-xs btn-block margin-bottom-10">ШИНЭЧЛЭХ</button>
                                    <div id="divAlertTab1Content"></div>
                                </form>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding margin-bottom-10">
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divpTab1')" style="margin-left:5px;">
                                        <i class="fa fa-print"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="ExportWord('#divpTab1', 'АлбанХаагчдынТооНасныАнгилалаар')">
                                        <i class="fa fa-file-word-o"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default pull-right btn-export-excel" rel="tooltip" data-placement="top" data-original-title="Excel татах" onclick="ExportExcel('#divpTab1')">
                                        <i class="fa fa-file-excel-o"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row no-margin">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding">
                                    <div id="loaderTab1" class="search-background-report">
                                        <label>
                                            <img width="64" height="" src="img/loading.gif"/>
                                            <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                                        </label>
                                    </div> 
                                    <div id="divpTab1" runat="server" class="reports" style="width: 100%;">
                                        <div style="border-bottom:1px solid #000; padding-bottom: 3px; margin-bottom: 10px;">
                                            <img src="../img/cover-logo-mof.png" style="height:40px;"/>
                                            <span id="spanReportHeaderDate" runat="server" style="float:right; padding-top: 23px; font-style:italic;"></span>
                                        </div>
                                        <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                                            АЛБАН ХААГЧДЫН ТОО НАСНЫ АНГИЛЛААР
                                        </div>
                                        <div id="contentTab1BarChart" class="chart no-padding"></div>
                                        <div id="divpTab1Datatable" runat="server">
                                            <table style="border: 1px solid #95B3D7; border-collapse:collapse; width: 100%; font-size:8pt;">
                                                <tbody id="contentTab1Datatable">
                                                    <tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нас</th>
                                                        <th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төлөв</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;"></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 5px 0;"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="margin-top: 25px;">
                                            <table style="border-collapse:collapse; width: 300px; font-size:8pt; float:right;">
                                                <tbody>
                                                    <tr>
                                                        <td></td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Ажилтаны тоо</td>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Дундаж наслалт</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Нийт ажилтан:</td>
                                                        <td id="contentTab1Datatable2TdCntStaff" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdAvgStaffAge" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эрэгтэй ажилтан:</td>
                                                        <td id="contentTab1Datatable2TdCntStaffMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdAvgStaffAgeMale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">Эмэгтэй ажилтан:</td>
                                                        <td id="contentTab1Datatable2TdCntStaffFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                        <td id="contentTab1Datatable2TdAvgStaffAgeFemale" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: right; padding: 0 5px; background-color: #DBE5F1; font-weight:bold;">0</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>       
                </div>
            </div>
        </article>
    </div>
</section>
<script src="../js/plugin/htmltoword/FileSaver.js"></script> 
<script src="../js/plugin/htmltoword/jquery.wordexport.js"></script>
<script src="../js/plugin/morris/raphael.min.js"></script>
<script src="../js/plugin/morris/morris.min.js"></script>
<script type="text/javascript">
    var globalAjaxVar = null;
    var varFilterTab1Branch = $("#selectFilterTab1Branch").select2('data');
    var varFilterTab1Type = $("#selectFilterTab1Type").select2('data');
    var varFilterTab1Ages = $("#selectFilterTab1Ages").select2('data');
    var pagefunction = function () {
        dataBindTab1Datatable();
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    $(document).ready(function () {
        pageSetUp();
        pagefunction();
    });
    $("#selectFilterTab1Branch, #selectFilterTab1Type, #selectFilterTab1Ages").change(function (e) {
        var arrSelected = $(this).select2('data');
        lastEl = arrSelected[arrSelected.length - 1].id;
        if (lastEl == "") {
            arrSelected = jQuery.grep(arrSelected, function(value) {
                return value.id == "";
            });
        }
        else {
            arrSelected = jQuery.grep(arrSelected, function(value) {
                return value.id != "";
            });
        }
        $(this).select2('data', arrSelected);
    });
    $("#btnShowTab1").click(function (e) {
        if ($('#selectFilterTab1Branch').select2('data').length > 0 && $('#selectFilterTab1Type').select2('data').length > 0 && $('#selectFilterTab1Ages').select2('data').length > 0) {
            dataBindTab1Datatable();
        }
        else {
            $('#divAlertTab1Content').html('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-warning"></i><strong>Анхааруулга</strong> "Дотоод нэгж", "Төлөв" болон "Насны хязгаар" заавал сонгоно уу!</div>');
        }
    });
    $("#btnRefreshTab1").click(function (e) {
        $("#selectFilterTab1Branch").select2('data', varFilterTab1Branch);
        $("#selectFilterTab1Type").select2('data', varFilterTab1Type);
        $("#selectFilterTab1Ages").select2('data', varFilterTab1Ages);
    });

    function dataBindTab1Datatable() {
        showLoader('loaderTab1');
        var valData = '';
        var jsonData = {};
        jsonData.branch = $("#selectFilterTab1Branch").val();
        jsonData.type = $("#selectFilterTab1Type").val();
        jsonData.ages = $("#selectFilterTab1Ages").val();
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/RprtStaffAgeGrpTab1Table",
            data: JSON.stringify(jsonData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var resData = jQuery.parseJSON(data.d);
                valData += '<tr style="background-color: #DBE5F1; -webkit-print-color-adjust:exact;">';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">№</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Дотоод нэгж</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Албан тушаал</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Эцэг/эхийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Өөрийн нэр</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Регистер</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Хүйс</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Нас</th>';
                valData += '<th style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 5px 0;">Төлөв</th>';
                valData += '</tr>';
                if (resData.d.RetType == "0") {
                    var arrAgeGroupCounted = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                    var valCntMale = 0;
                    var valCntFemale = 0;
                    var valSumAgeMale = 0;
                    var valSumAgeFemale = 0;
                    if (resData.d.RetData.length != 0) {
                        $(resData.d.RetData).each(function (index, value) {
                            if (parseInt(value.AGE) <= 20) arrAgeGroupCounted[0] += 1;
                            else if(parseInt(value.AGE) > 20 && parseInt(value.AGE) <= 25) arrAgeGroupCounted[1] += 1;
                            else if(parseInt(value.AGE) > 25 && parseInt(value.AGE) <= 30) arrAgeGroupCounted[2] += 1;
                            else if(parseInt(value.AGE) > 30 && parseInt(value.AGE) <= 35) arrAgeGroupCounted[3] += 1;
                            else if(parseInt(value.AGE) > 35 && parseInt(value.AGE) <= 40) arrAgeGroupCounted[4] += 1;
                            else if(parseInt(value.AGE) > 40 && parseInt(value.AGE) <= 45) arrAgeGroupCounted[5] += 1;
                            else if(parseInt(value.AGE) > 45 && parseInt(value.AGE) <= 50) arrAgeGroupCounted[6] += 1;
                            else if(parseInt(value.AGE) > 50 && parseInt(value.AGE) <= 55) arrAgeGroupCounted[7] += 1;
                            else if(parseInt(value.AGE) > 55 && parseInt(value.AGE) <= 60) arrAgeGroupCounted[8] += 1;
                            else if (parseInt(value.AGE) > 60) arrAgeGroupCounted[9] += 1;
                            if (value.GENDER == 'Эрэгтэй') {
                                valCntMale++;
                                valSumAgeMale += parseFloat(value.AGE);
                            }
                            else if (value.GENDER == 'Эмэгтэй') {
                                valCntFemale++;
                                valSumAgeFemale += parseFloat(value.AGE);
                            }
                            $('#contentTab1Datatable2TdCntStaff').html((valCntMale+valCntFemale));
                            $('#contentTab1Datatable2TdCntStaffMale').html(valCntMale);
                            $('#contentTab1Datatable2TdCntStaffFemale').html(valCntFemale);
                            $('#contentTab1Datatable2TdAvgStaffAge').html((parseFloat(valSumAgeMale+valSumAgeFemale)/parseFloat(valCntMale+valCntFemale)).toFixed(2));
                            $('#contentTab1Datatable2TdAvgStaffAgeMale').html((parseFloat(valSumAgeMale)/parseFloat(valCntMale)).toFixed(2));
                            $('#contentTab1Datatable2TdAvgStaffAgeFemale').html((parseFloat(valSumAgeFemale)/parseFloat(valCntFemale)).toFixed(2));
                            valData += "<tr>";
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.ROWNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.BRANCH_INITNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.POS_NAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.LNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.FNAME + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.REGNO + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.GENDER + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;">' + value.AGE + '</td>';
                            valData += '<td style="border: 1px solid #95B3D7; vertical-align: middle;text-align: left; padding: 0 5px;">' + value.TP + '</td>';
                            valData += "</tr>";
                        });
                    }
                    else {
                        valData += "<tr>";
                        valData += '<td colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                        valData += "</tr>";
                    }
                    // bind bar chart
                    var varBarChartData = [{
                        x: '20 хүртэлх',
                        y: arrAgeGroupCounted[0]
                    }, {
                        x: '21-25',
                        y: arrAgeGroupCounted[1]
                    }, {
                        x: '26-30',
                        y: arrAgeGroupCounted[2]
                    }, {
                        x: '31-35',
                        y: arrAgeGroupCounted[3]
                    }, {
                        x: '36-40',
                        y: arrAgeGroupCounted[4]
                    }, {
                        x: '41-45',
                        y: arrAgeGroupCounted[5]
                    }, {
                        x: '46-50',
                        y: arrAgeGroupCounted[6]
                    }, {
                        x: '51-55',
                        y: arrAgeGroupCounted[7]
                    }, {
                        x: '56-60',
                        y: arrAgeGroupCounted[8]
                    }, {
                        x: '60-с дээш',
                        y: arrAgeGroupCounted[9]
                    }];
                    Morris.Bar({
				        element : 'contentTab1BarChart',
                        data: varBarChartData,
				        xkey : 'x',
				        ykeys : ['y'],
				        labels : ['Ажилтаны тоо'],
                        barRatio: 100,
                        xLabelAngle: 35,
                        hideHover: 'always',
                        labelTop: true
                    });
                    var items = $("#contentTab1BarChart").find( "svg" ).find("rect");
                    $.each(items, function (index, v) {
                        var value = arrAgeGroupCounted[index];
                        var newY = parseFloat( $(this).attr('y') - 20 );
                        var halfWidth = parseFloat( $(this).attr('width') / 2 );
                        var newX = parseFloat( $(this).attr('x') ) +  halfWidth;
                        var output = '<text style="text-anchor: middle; font: 12px sans-serif;" x="'+newX+'" y="'+newY+'" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#000000" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.875)"><tspan dy="3.75">'+value+'</tspan></text>';
                        $("#contentTab1BarChart").find( "svg" ).append(parseSVG(output));
                    });
                }
                else {
                    valData += "<tr>";
                    valData += '<td colspan="9" style="border: 1px solid #95B3D7; vertical-align: middle;text-align: center; padding: 0 5px;"><em>Илэрц олдсонгүй...</em></td>';
                    valData += "</tr>";
                    alert(resData.d.RetDesc);
                }
                $("#contentTab1Datatable").html(valData);
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
                hideLoader('loaderTab1');
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
        $('#divAlertTab1Content').html('');
    }
    function parseSVG(s) {
        var div= document.createElementNS('http://www.w3.org/1999/xhtml', 'div');
        div.innerHTML= '<svg xmlns="http://www.w3.org/2000/svg">'+s+'</svg>';
        var frag= document.createDocumentFragment();
        while (div.firstChild.firstChild)
            frag.appendChild(div.firstChild.firstChild);
        return frag;
    }
</script>