<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error500.aspx.cs" Inherits="HRWebApp.pg.error500" %>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="row">
            <div class="col-sm-12">
                <div class="text-center error-box">
                    <input id="inputStackTrace" runat="server" type="hidden"/>
                    <input id="inputMessage" runat="server" type="hidden"/>
                    <h1 id="h1Title" runat="server" class="error-text tada animated">
                        <i class="fa fa-times-circle text-danger error-icon-shadow"></i> Алдаа
                    </h1>
                    <h2 class="font-xl">
                        <strong id="errorname" runat="server"></strong>
                    </h2>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    console.log($('#inputMessage').val());
    console.log($('#inputStackTrace').val());
</script>