<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="HRWebApp.pg.inventory" %>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Эд хөрөнгийн мэдээлэл <span>> Миний эд хөрөнгө</span>
        </h1>
    </div>
</div>
<div id="divContentInfo" runat="server" class="row hide">
	<div class="col-sm-12">
        <div id="divContentInfoContent" runat="server" class="alert alert-warning fade in">
			<i class="fa-fw fa fa-warning"></i>
			<strong>Анхааруулга</strong> Acolous системтэй холбогдож чадсангүй.
		</div>
    </div>
</div>
<div class="row margin-bottom-5">
    <div class="col-sm-12">
        <a class="btn btn-default" href="#pg/inventorycntstaff.aspx">Өөрийн тоологдсон хөрөнгө</a>
    </div>
</div>
<div id="divContentContent" runat="server" class="well">
	<p>
		<span id="spanStaffInfo" runat="server">СБГ-ын ӨУХ-н төслийн зөвлөх Г.Гүндсамба</span>-д одоо харьяалагдаж байгаа эд хөрөнгийн бүртгэлийн жагсаалт. <span class="pull-right"><code>Acolous 2020</code></span>
		<br>
	</p>
    <div class="row">
	    <div class="col-sm-12">
		    <div id="divTableData" runat="server" class="table-responsive"></div>
	    </div>
	
    </div>
</div>