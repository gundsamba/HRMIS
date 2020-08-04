<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="salarystaff.aspx.cs" Inherits="HRWebApp.pg.salarystaff" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Цалингийн мэдээлэл
        </h1>
    </div>
</div>
<div id="divContentInfo" runat="server" class="row hide">
	<div class="col-sm-12">
        <div id="divContentInfoContent" runat="server" class="alert alert-warning fade in">
			<i class="fa-fw fa fa-warning"></i>
			<strong>Анхааруулга</strong> Payroll системтэй холбогдож чадсангүй.
		</div>
    </div>
</div>
<div id="divContentContent" runat="server" class="well">
	<p>
		<span id="spanStaffInfo" runat="server">СБГ-ын ӨУХ-н төслийн зөвлөх Г.Гүндсамба</span>-н цалингийн карт <span class="pull-right"><code>Payroll 2019</code></span>
		<br>
	</p>
    <div class="row">
	    <div class="col-sm-12">
		    <div id="divTableData" runat="server" class="table-responsive"></div>
	    </div>
    </div>
</div>
