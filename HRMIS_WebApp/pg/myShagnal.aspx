<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myShagnal.aspx.cs" Inherits="HRWebApp.pg.myShagnal" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Шагнал, зэрэг дэв <span>> Миний шагнал, зэрэг дэв</span>
        </h1>
    </div>
</div>
<div id="divContentContent" runat="server" class="well">
	<p>
		<span id="spanStaffInfo" runat="server">СБГ-ын ӨУХ-н төслийн зөвлөх Г.Гүндсамба</span> - ын Шагнал, зэрэг дэвийн мэдээлэл
		<br>
	</p>
    <div class="row">
	    <div class="col-sm-12">
            <ul class="nav nav-tabs bordered">
                <li class="active">
                    <a data-toggle="tab" href="#pTab1">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Шагнал
                    </a>
                </li>
                <li>
                    <a data-toggle="tab" href="#pTab2">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Зэрэг дэв
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="pTab1" class="tab-pane active">
		            <div id="divTab1TableData" runat="server" class="table-responsive"></div>
                </div>
                <div id="pTab2" class="tab-pane">
		            <div id="divTab2TableData" runat="server" class="table-responsive"></div>
                </div>
            </div>
	    </div>
	
    </div>
</div>