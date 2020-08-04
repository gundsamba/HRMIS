<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workingtimestaff.aspx.cs" Inherits="HRWebApp.pg.workingtimestaff" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">
        Ажилтаны цаг ашиглалтын байдал
	</h4>
</div>
<div class="modal-body" style="padding:5px;">
    <div>
        <div style="margin-bottom:5px; display:block; overflow:hidden;">
            <div style="text-align:right; width:100%; float:right;">
                <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Word татах" onclick="exportWord('#divworkingtimeTab3Staff', 'ИрцӨдрөөр')">
                    <i class="fa fa-file-word-o"></i>
                </a>
                <a href="javascript:void(0);" class="btn btn-default" rel="tooltip" data-placement="top" data-original-title="Хэвлэх" onclick="PrintElem('#divworkingtimeTab3Staff')">
                    <i class="fa fa-print"></i>
                </a>
                <button id="workingtimeTab3Print" class="btn btn-primary btn-sm" type="button" onclick="PrintElem('#divworkingtimeTab3Staff')"><span class="fa fa-print"></span> Хэвлэх </button>
            </div> 
        </div> 
        <div id="loaderTab3Staff" class="search-background">
            <label>
                <img width="64" height="" src="img/loading.gif"/>
                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color:#fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
            </label>
        </div>                  
        <div id="divworkingtimeTab3Staff" runat="server" class="reports" style="margin:0; width:100%;">                        
            <div style="text-align: center; font-weight: bold; font-size: 14px; padding-bottom: 10px; text-transform: uppercase; line-height: 20px;">
                <%=Request.QueryString["stname"].Replace("%"," ") %>-Н <%=Request.QueryString["yr"] %> ОНЫ <%=Request.QueryString["mnth"] %> ДУГААР САРЫН ЦАГ АШИГЛАЛТЫН БАЙДАЛ /ДЭЛГЭРЭНГҮЙ/
            </div>
            <div id="divworkingtimeTab3StaffDatatable" runat="server">
                <table style="border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;">
                    <thead>
                        <tr>
                            <%--<th style="border: 1px solid #DDD; padding:5px; text-align:center;">Нэгж</th>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Албан тушаал</th>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Нэр</th>--%>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Огноо</th>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Төлөв</th>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Ирсэн<br />(00:00 - 13:00)</th>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Явсан<br />(13:01 - 23:59)</th>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Хоцорсон</th>
                            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Эрт явсан</th>
                        </tr>
                    </thead>
                    <tbody id="divworkingtimeTab3StaffDatatableTbody" runat="server">

                    </tbody>
                </table>
            </div>                                
        </div>
    </div>
</div>
<script type="text/javascript">
    var strTable = '';
    showLoader('loaderTab3Staff');
    globalAjaxVar = $.ajax({
        type: "POST",
        url: "../webservice/ServiceMain.svc/WorkingtimeTab3Desc",
        data: '{"year":"' + <%= Request.QueryString["yr"]%> + '", "month":"' + <%= Request.QueryString["mnth"]%> + '", "month2":"' + <%= Request.QueryString["mnth2"]%> + '", "stid":"' + <%= Request.QueryString["stid"]%> + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var date = new Array(3);
            var time1 = new Array(3);
            var time2 = new Array(3);
            $($.parseJSON(data.d)).each(function (index, value) {
                date = new Array(3);
                date = value.DT.split('-');
                if (value.ISWORK == "0") {
                    strTable += "<tr>";
                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueDark\">Амралтын өдөр</span></td>";
                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.MINTM.replace("00:00:00", "--:--:--") + "</td>";
                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.MAXTM.replace("00:00:00", "--:--:--") + "</td>";
                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                    strTable += "</tr>";
                }
                else {
                    if (value.TP == "0") {
                        time1 = new Array(3);
                        time1 = value.MINTM.split(':');
                        time2 = new Array(3);
                        time2 = value.MAXTM.split(':');

                        var come = new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), parseInt(time1[0]), parseInt(time1[1]), parseInt(time1[2]));
                        var go = new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), parseInt(time2[0]), parseInt(time2[1]), parseInt(time2[2]));
                        var late = new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), 08, 40, 00);
                        var early = new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), 17, 30, 00);
                        if (value.MINTM != value.MAXTM) {                            
                            if (value.HOTSORSONMINUTE != '0')
                            {
                                if (value.ERTMINUTE != '0')
                                {
                                    strTable += "<tr>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-yellow\">Хоцорсон</span></td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (come.getHours().toString() + ':' + come.getMinutes().toString() + ':' + come.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (go.getHours().toString() + ':' + go.getMinutes().toString() + ':' + go.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.HOTSORSONMINUTE + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.ERTMINUTE + "</td>";
                                    strTable += "</tr>";
                                }
                                else
                                {
                                    strTable += "<tr>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-yellow\">Хоцорсон</span></td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (come.getHours().toString() + ':' + come.getMinutes().toString() + ':' + come.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (go.getHours().toString() + ':' + go.getMinutes().toString() + ':' + go.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.HOTSORSONMINUTE + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                    strTable += "</tr>";
                                }
                            }
                            else
                            {
                                if (value.ERTMINUTE != '0')
                                {
                                    strTable += "<tr>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueLight\">Цагтаа ирсэн</span></td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (come.getHours().toString() + ':' + come.getMinutes().toString() + ':' + come.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (go.getHours().toString() + ':' + go.getMinutes().toString() + ':' + go.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + value.ERTMINUTE + "</td>";
                                    strTable += "</tr>";
                                }
                                else
                                {
                                    strTable += "<tr>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                                    //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueLight\">Цагтаа ирсэн</span></td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (come.getHours().toString() + ':' + come.getMinutes().toString() + ':' + come.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (go.getHours().toString() + ':' + go.getMinutes().toString() + ':' + go.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                    strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                    strTable += "</tr>";
                                }
                            }
                        }
                        else {
                            strTable += "<tr>";
                            //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                            //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                            //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-redLight\">Тасалсан</span></td>";
                            if ((come.getHours().toString()+':'+come.getMinutes().toString()+':'+come.getSeconds().toString()).replace("0:0:0", "--:--:--") == "--:--:--") strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            else if (come >= new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), 00, 00, 00) && come <= new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), 13, 00, 00)) strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (come.getHours().toString() + ':' + come.getMinutes().toString() + ':' + come.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            else if (come > new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), 13, 00, 00) && come <= new Date(parseInt(date[0]), parseInt(date[1]), parseInt(date[2]), 23, 59, 59)) strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td><td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + (come.getHours().toString() + ':' + come.getMinutes().toString() + ':' + come.getSeconds().toString()).replace("0:0:0", "--:--:--") + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "</tr>";
                        }
                    }
                    else if (value.TP == "13") {
                        strTable += "<tr>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-pink\">Өвчтэй</span></td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "</tr>";
                    }
                    else if (value.TP == "21") {
                        strTable += "<tr>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-greenDark\">Ээлжийн амралттай</span></td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "</tr>";
                    }
                    else if (value.TP == "11" || value.TP == "12") {
                        strTable += "<tr>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-orangeDark\">Чөлөөтэй</span></td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "</tr>";
                    }
                    else if (value.TP == "31") {
                        strTable += "<tr>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blue\">Албан томилолт</span></td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "</tr>";
                    }
                    else if (value.TP == "91") {
                        strTable += "<tr>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.NEGJ + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.POSNAME + "</td>";
                        //strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.STNAME + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + value.DT + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-lighten\">Тэмдэглэлт өдөр</span></td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "</tr>";
                    }
                }
                $('#divworkingtimeTab3StaffDatatableTbody').append(strTable);
                strTable = '';
            });
            hideLoader('loaderTab3Staff');
        },
        failure: function (response) {
            alert('FAILURE: ' + response.d);
        },
        error: function (xhr, status, error) {
            window.location = '../#pg/error500.aspx';
        }
    });


</script>
