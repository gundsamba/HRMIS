<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboardStaffWorkingtimeDescriptionModal.aspx.cs" Inherits="HRWebApp.pg.dashboardStaffWorkingtimeDescriptionModal" %>
<p style="font: 12pt 'Arial'; text-align:center;"><span id="spanStaffname" runat="server"></span>-Н <%=Request.QueryString["yr"] %> ОНЫ <%=Request.QueryString["mnth"] %> ДУГААР САРЫН ЦАГ АШИГЛАЛТЫН БАЙДАЛ</p>
<table style="border: 1px solid #DDD; border-collapse: collapse; font: 13px arial, sans-serif; width: 100%;">
    <thead>
        <tr>
            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Огноо</th>
            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Төлөв</th>
            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Ирсэн</th>
            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Явсан</th>
            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Хоцорсон</th>
            <th style="border: 1px solid #DDD; padding:5px; text-align:center;">Эрт явсан</th>
        </tr>
    </thead>
    <tbody id="divdashboardStaffWorkingtimeDescriptionTableTbody" runat="server">

    </tbody>
</table>