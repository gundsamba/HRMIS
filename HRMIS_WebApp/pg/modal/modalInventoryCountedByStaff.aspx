<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalInventoryCountedByStaff.aspx.cs" Inherits="HRWebApp.pg.modal.modalInventoryCountedByStaff" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel"><span id="spanStaffInfo" name="spanStaffInfo" runat="server"></span>-н тоологдсон хөрөнгө</h4>
</div>
<div class="modal-body no-padding">
    <div class="row">
		<div class="col-sm-12">
            <div id="divTableData" runat="server" class="table-responsive"></div>
        </div>
    </div>		
</div>
