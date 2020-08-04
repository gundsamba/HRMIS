<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t9.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t9" %>
<section id="widget-grid">
    <div class="row" style="padding-top:10px;">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Гаргасан санаачлага </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T9Section1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T9Section1Modal" data-toggle="modal" onclick="showAddEditTab1T9Section1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T9Section1" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T9Section1Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Гадаад руу зорчсон мэдээлэл </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T9Section2AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T9Section2Modal" data-toggle="modal" onclick="showAddEditTab1T9Section2(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T9Section2" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T9Section2Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Орон цуусны нөхцөл </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T9Section3AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T9Section3Modal" data-toggle="modal" onclick="showAddEditTab1T9Section3(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T9Section3" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T9Section3Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Албан хаагч нь төрийн албатай холбоотой маргаан гаргаж байсан ба  түүнийг хэрхэн шийдвэрлэсэн эсэх </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T9Section4AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T9Section4Modal" data-toggle="modal" onclick="showAddEditTab1T9Section4(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T9Section4" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T9Section4Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
            <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> 
                        <i class="fa fa-table"></i> 
                    </span>
                    <h2> Шагналын талаар <small> / Улсын алдар цол, одон медаль, мөн гадаад орны шагнал зэрэг /</small> </h2>
                </header>
                <div>
                    <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                    <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                        <button id="pTab1T9Section5AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1T9Section5Modal" data-toggle="modal" onclick="showAddEditTab1T9Section5(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                    </div>
                    <div id="loaderTab1T9Section5" class="search-background">
                        <img width="64" height="" src="img/loading.gif"/>
                        <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                    </div>
                    <div id="divBindTab1T9Section5Table" class="widget-body no-padding">
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<div id="pTab1T9Section1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T9Section1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Гаргасан санаачлага&nbsp;<span id="pTab1T9Section1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T9Section1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Гаргасан санаачлага</label>
                                    <input id="pTab1T9Section1ModalInputName" name="pTab1T9Section1ModalInputName" type="text" class="form-control" placeholder="Гаргасан санаачлага" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Огноо</label>
                                    <input id="pTab1T9Section1ModalInputDate" name="pTab1T9Section1ModalInputDate" type="text" class="form-control" placeholder="Огноо" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Хэрэгжилт</label>
                                    <select id="pTab1T9Section1ModalSelectImpltype" name="pTab1T9Section1ModalSelectImpltype" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="pTab1T9Section2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T9Section2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Гадаад руу зорчсон мэдээлэл&nbsp;<span id="pTab1T9Section2ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T9Section2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Улс</label>
                                    <select id="pTab1T9Section2ModalSelectCountry" name="pTab1T9Section2ModalSelectCountry" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-8">
                                    <label class="control-label">*Хот</label>
                                    <input id="pTab1T9Section2ModalInputCityname" name="pTab1T9Section2ModalInputCityname" type="text" class="form-control" placeholder="Хот" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Явсан огноо</label>
                                    <input id="pTab1T9Section2ModalInputFromdate" name="pTab1T9Section2ModalInputFromdate" type="text" class="form-control" placeholder="Явсан огноо" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Ирсэн огноо</label>
                                    <input id="pTab1T9Section2ModalInputTodate" name="pTab1T9Section2ModalInputTodate" type="text" class="form-control" placeholder="Ирсэн огноо" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Зорилго</label>
                                    <input id="pTab1T9Section2ModalInputPurpose" name="pTab1T9Section2ModalInputPurpose" type="text" class="form-control" placeholder="Зорилго" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="pTab1T9Section3Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T9Section3ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Орон сууцны нөхцөл&nbsp;<span id="pTab1T9Section3ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T9Section3ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Гэрийн хаяг</label>
                                    <input id="pTab1T9Section3ModalInputAddress" name="pTab1T9Section3ModalInputAddress" type="text" class="form-control" placeholder="Гэрийн хаяг" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-9">
                                    <label class="control-label">*Орон сууц</label>
                                    <select id="pTab1T9Section3ModalSelectConditiontype" name="pTab1T9Section3ModalSelectConditiontype" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">*Хэдэн онд</label>
                                    <select id="pTab1T9Section3ModalSelectYear" name="pTab1T9Section3ModalSelectYear" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="pTab1T9Section4Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T9Section4ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Маргаан&nbsp;<span id="pTab1T9Section4ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T9Section4ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Маргааны шалтгаан</label>
                                    <select id="pTab1T9Section4ModalSelectCause" name="pTab1T9Section4ModalSelectCause" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Маргаан шийдвэрлэсэн байдал</label>
                                    <select id="pTab1T9Section4ModalSelectDecide" name="pTab1T9Section4ModalSelectDecide" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Маргаан гаргасан огноо</label>
                                    <input id="pTab1T9Section4ModalInputFromdate" name="pTab1T9Section4ModalInputFromdate" type="text" class="form-control" placeholder="Маргаан гаргасан огноо" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Маргаан шийдвэрлэсэн огноо</label>
                                    <input id="pTab1T9Section4ModalInputTodate" name="pTab1T9Section4ModalInputTodate" type="text" class="form-control" placeholder="Маргаан шийдвэрлэсэн огноо" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
    </div>
</div>
<div id="pTab1T9Section5Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="pTab1T9Section5ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Шагнал&nbsp;<span id="pTab1T9Section5ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1T9Section5ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Ямар шагнал, цолоор шагнагдсан</label>
                                    <input id="pTab1T9Section5ModalInputName" name="pTab1T9Section5ModalInputName" type="text" class="form-control" placeholder="Ямар шагнал, цолоор шагнагдсан" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Шагнагдсан огноо</label>
                                    <input id="pTab1T9Section5ModalInputDate" name="pTab1T9Section5ModalInputDate" type="text" class="form-control" placeholder="Шагнагдсан огноо" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Болих</button>
			        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Хадгалах</button>
		        </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    dataBindTab1T9Section1Datatable();
    dataBindTab1T9Section2Datatable();
    dataBindTab1T9Section3Datatable();
    dataBindTab1T9Section4Datatable();
    dataBindTab1T9Section5Datatable();
    function dataBindTab1T9Section1Datatable() {
        showLoader('loaderTab1T9Section1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T9Datatable1",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T9Section1Table").html(msg.d);
                //formTab1T9Percent();
                hideLoader('loaderTab1T9Section1');
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
    function dataBindTab1T9Section2Datatable() {
        showLoader('loaderTab1T9Section2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T9Datatable2",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T9Section2Table").html(msg.d);
                //formTab1T9Percent();
                hideLoader('loaderTab1T9Section2');
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
    function dataBindTab1T9Section3Datatable() {
        showLoader('loaderTab1T9Section3');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T9Datatable3",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T9Section3Table").html(msg.d);
                //formTab1T9Percent();
                hideLoader('loaderTab1T9Section3');
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
    function dataBindTab1T9Section4Datatable() {
        showLoader('loaderTab1T9Section4');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T9Datatable4",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T9Section4Table").html(msg.d);
                //formTab1T9Percent();
                hideLoader('loaderTab1T9Section4');
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
    function dataBindTab1T9Section5Datatable() {
        var valData = '';
        showLoader('loaderTab1T9Section5');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/ProfileTab1t9t1Datatable",
            data: '{"staffid":"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = "<table id=\"profileTab1T9Datatable5\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                valData += "<tr>";
                valData += "<th>Ямар шагнал, цолоор шагнагдсан</th>";
                valData += "<th>Шагнагдсан огноо</th>";
                valData += "<th>&nbsp;</th>";
                valData += "</tr></thead><tbody>";
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += "<tr data-id=\""+value.ID+"\">";
                    valData += "<td>" + replaceDatabaseToDisplay(value.NAME) + "</td>";
                    valData += "<td>" + value.DT + "</td>";
                    valData += '<td>';
                    if(value.ISEDIT == '1') valData += '<div class="btn-group"><a href="javascript:void(0);" class="btn btn-default btn-xs" style="cursor:pointer;" onclick="showAddEditTab1T9Section5(this,\'засах\');" data-target="#pTab1T9Section5Modal" data-toggle="modal"><i class="fa fa-pencil"></i></a><a href="javascript:void(0);" class="btn btn-default btn-xs" style="cursor:pointer;" onclick="showDeleteTab1T9Section5(this)"><i class="fa fa-trash-o"></i></a></div>';
                    valData += '</td>';
                    valData += "</tr>";
                });
                valData += "</tbody>";
                valData += "</table>";
                valData += "<script>";
                valData += "var responsiveHelper_profileTab1T9Datatable5 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T9Datatable5').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T9Datatable5) {responsiveHelper_profileTab1T9Datatable5 = new ResponsiveDatatablesHelper($('#profileTab1T9Datatable5'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T9Datatable5.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T9Datatable5.respond();}, \"aoColumns\": [null,{ \"sWidth\": \"130px\" },{ \"sWidth\": \"35px\" }]});";
                valData += "<\/script>";
                $("#divBindTab1T9Section5Table").html(valData);
                //formTab1T9Percent();
                hideLoader('loaderTab1T9Section5');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });



        globalAjaxVar = $.ajax({
            type: "POST",
            url: "ws.aspx/profile_profileTab1T9Datatable5",
            data: '{staffid:"' +<%=Request.QueryString["id"]%> +'"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#divBindTab1T9Section5Table").html(msg.d);
                //formTab1T9Percent();
                hideLoader('loaderTab1T9Section5');
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
    function showAddEditTab1T9Section1(el, isinsupt) {
        $('#pTab1T9Section1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T9Section1ID').html('');
            $('#pTab1T9Section1ModalInputName').val('');
            $('#pTab1T9Section1ModalInputDate').val('');
            $('#pTab1T9Section1ModalSelectImpltype').val('');
        }
        else {
            $('#pTab1T9Section1ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T9Section1ModalInputName').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab1T9Section1ModalInputDate').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1T9Section1ModalSelectImpltype').val($(el).closest('tr').find('td:eq(5)').text());
        }
    }
    function showAddEditTab1T9Section2(el, isinsupt) {
        $('#pTab1T9Section2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T9Section2ID').html('');
            $('#pTab1T9Section2ModalSelectCountry').val('');
            $('#pTab1T9Section2ModalInputCityname').val('');
            $('#pTab1T9Section2ModalInputFromdate').val('');
            $('#pTab1T9Section2ModalInputTodate').val('');
            $('#pTab1T9Section2ModalInputPurpose').val('');
        }
        else {
            $('#pTab1T9Section2ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T9Section2ModalSelectCountry').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1T9Section2ModalInputCityname').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1T9Section2ModalInputFromdate').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T9Section2ModalInputTodate').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1T9Section2ModalInputPurpose').val($(el).closest('tr').find('td:eq(5)').text());
        }
    }
    function showAddEditTab1T9Section3(el, isinsupt) {
        $('#pTab1T9Section3ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T9Section3ID').html('');
            $('#pTab1T9Section3ModalInputAddress').val('');
            $('#pTab1T9Section3ModalSelectConditiontype').val('');
            $('#pTab1T9Section3ModalSelectYear').val('');
        }
        else {
            $('#pTab1T9Section3ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T9Section3ModalInputAddress').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1T9Section3ModalSelectConditiontype').val($(el).closest('tr').find('td:eq(5)').text());
            $('#pTab1T9Section3ModalSelectYear').val($(el).closest('tr').find('td:eq(3)').text());
        }
    }
    function showAddEditTab1T9Section4(el, isinsupt) {
        $('#pTab1T9Section4ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T9Section4ID').html('');
            $('#pTab1T9Section4ModalSelectCause').val('');
            $('#pTab1T9Section4ModalSelectDecide').val('');
            $('#pTab1T9Section4ModalInputFromdate').val('');
            $('#pTab1T9Section4ModalInputTodate').val('');
        }
        else {
            $('#pTab1T9Section4ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T9Section4ModalSelectCause').val($(el).closest('tr').find('td:eq(6)').text());
            $('#pTab1T9Section4ModalSelectDecide').val($(el).closest('tr').find('td:eq(7)').text());
            $('#pTab1T9Section4ModalInputFromdate').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab1T9Section4ModalInputTodate').val($(el).closest('tr').find('td:eq(4)').text());
        }
    }
    function showAddEditTab1T9Section5(el, isinsupt) {
        $('#pTab1T9Section5ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1T9Section5ID').html('');
            $('#pTab1T9Section5ModalInputName').val('');
            $('#pTab1T9Section5ModalInputDate').val('');
        }
        else {
            $('#pTab1T9Section5ID').html($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1T9Section5ModalInputName').val($(el).closest('tr').find('td:eq(1)').text());
            $('#pTab1T9Section5ModalInputDate').val($(el).closest('tr').find('td:eq(2)').text());
        }
    }
    function showDeleteTab1T9Section1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_INNOVATION WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section1Datatable();
                        smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
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
    }
    function showDeleteTab1T9Section2(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_TOUR WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section2Datatable();
                        smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
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
    }
    function showDeleteTab1T9Section3(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_TOUR WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section3Datatable();
                        smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
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
    }
    function showDeleteTab1T9Section4(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_DISPUTE WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section4Datatable();
                        smallBox('Сонгосон мөр бичиглэл', 'Амжилттай устгагдлаа', '#659265', 4000);
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
    }
    function showDeleteTab1T9Section5(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мөр бичиглэлийг устгахдаа итгэлтэй байна уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"DELETE FROM ST_BONUS WHERE ID=' + $(el).closest('tr').find('td:eq(0)').text() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section5Datatable();
                        smallBox('Шагнал', 'Амжилттай устгагдлаа', '#659265', 4000);
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
    }
    $('#pTab1T9Section1ModalForm').bootstrapValidator({
        fields: {
            pTab1T9Section1ModalInputName: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1T9Section1ModalInputDate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1T9Section1ModalSelectImpltype: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T9Section1ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_INNOVATION (ID, STAFFS_ID, NAME, DT, INNOIMPLTYPE_ID, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_INNOVATION\'), ' +<%=Request.QueryString["id"]%> +', \'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section1ModalInputName').val())) + '\', \'' + $.trim($('#pTab1T9Section1ModalInputDate').val()) + '\', ' + $('#pTab1T9Section1ModalSelectImpltype option:selected').val() + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section1Datatable();
                        $('#pTab1T9Section1Modal').modal('hide');
                        smallBox('Гаргасан санаачлага', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_INNOVATION SET NAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section1ModalInputName').val())) + '\', DT=\'' + $.trim($('#pTab1T9Section1ModalInputDate').val()) + '\', INNOIMPLTYPE_ID=' + $('#pTab1T9Section1ModalSelectImpltype option:selected').val() + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T9Section1ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section1Datatable();
                        $('#pTab1T9Section1Modal').modal('hide');
                        smallBox('Гаргасан санаачлага', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
        }
    });
    $('#pTab1T9Section2ModalForm').bootstrapValidator({
        fields: {
            pTab1T9Section2ModalSelectCountry: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T9Section2ModalInputCityname: {
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
            pTab1T9Section2ModalInputFromdate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1T9Section2ModalInputTodate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1T9Section2ModalInputPurpose: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T9Section2ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_TOUR (ID, STAFFS_ID, COUNTRY_ID, CITYNAME, FROMDATE, TODATE, PURPOSE, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_TOUR\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T9Section2ModalSelectCountry option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section2ModalInputCityname').val())) + '\', \'' + $.trim($('#pTab1T9Section2ModalInputFromdate').val()) + '\', \'' + $.trim($('#pTab1T9Section2ModalInputTodate').val()) + '\', \'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section2ModalInputPurpose').val())) + '\', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section2Datatable();
                        $('#pTab1T9Section2Modal').modal('hide');
                        smallBox('Гадаад руу зорчсон мэдээлэл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_TOUR SET COUNTRY_ID=' + $('#pTab1T9Section2ModalSelectCountry option:selected').val() + ', CITYNAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section2ModalInputCityname').val())) + '\', FROMDATE=\'' + $.trim($('#pTab1T9Section2ModalInputFromdate').val()) + '\', TODATE=\'' + $.trim($('#pTab1T9Section2ModalInputTodate').val()) + '\', PURPOSE=\'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section2ModalInputPurpose').val())) + '\', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T9Section2ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section2Datatable();
                        $('#pTab1T9Section2Modal').modal('hide');
                        smallBox('Гадаад руу зорчсон мэдээлэл', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
        }
    });
    $('#pTab1T9Section3ModalForm').bootstrapValidator({
        fields: {
            pTab1T9Section3ModalInputAddress: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1T9Section3ModalSelectConditiontype: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T9Section3ModalSelectYear: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T9Section3ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_CONDITION (ID, STAFFS_ID, CONDITIONTYPE_ID, ADDRESS, YR, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_CONDITION\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T9Section3ModalSelectConditiontype option:selected').val() + ', \'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section3ModalInputAddress').val())) + '\', ' + $('#pTab1T9Section3ModalSelectYear option:selected').val() + ', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section3Datatable();
                        $('#pTab1T9Section3Modal').modal('hide');
                        smallBox('Орон сууцны нөхцөл', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_CONDITION SET CONDITIONTYPE_ID=' + $('#pTab1T9Section3ModalSelectConditiontype option:selected').val() + ', ADDRESS=\'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section3ModalInputAddress').val())) + '\', YR=' + $('#pTab1T9Section3ModalSelectYear option:selected').val() + ', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T9Section3ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section3Datatable();
                        $('#pTab1T9Section3Modal').modal('hide');
                        smallBox('Орон сууцны нөхцөл', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
        }
    });
    $('#pTab1T9Section4ModalForm').bootstrapValidator({
        fields: {
            pTab1T9Section4ModalSelectCause: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T9Section4ModalSelectDecide: {
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1T9Section4ModalInputFromdate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            },
            pTab1T9Section4ModalInputTodate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T9Section4ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_DISPUTE (ID, STAFFS_ID, CAUSE_ID, DECIDE_ID, FROMDATE, TODATE, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_DISPUTE\'), ' +<%=Request.QueryString["id"]%> +', ' + $('#pTab1T9Section4ModalSelectCause option:selected').val() + ', ' + $('#pTab1T9Section4ModalSelectDecide option:selected').val() + ', \'' + $.trim($('#pTab1T9Section4ModalInputFromdate').val()) + '\', \'' + $.trim($('#pTab1T9Section4ModalInputTodate').val()) + '\', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section4Datatable();
                        $('#pTab1T9Section4Modal').modal('hide');
                        smallBox('Маргаан', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_DISPUTE SET CAUSE_ID=' + $('#pTab1T9Section4ModalSelectDecide option:selected').val() + ', DECIDE_ID=' + $.trim($('#pTab1T9Section4ModalSelectDecide option:selected').val()) + ', FROMDATE=\'' + $.trim($('#pTab1T9Section4ModalInputFromdate').val()) + '\', TODATE=\'' + $.trim($('#pTab1T9Section4ModalInputTodate').val()) + '\', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T9Section4ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section4Datatable();
                        $('#pTab1T9Section4Modal').modal('hide');
                        smallBox('Маргаан', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
        }
    });
    $('#pTab1T9Section5ModalForm').bootstrapValidator({
        fields: {            
            pTab1T9Section5ModalInputName: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Уртдаа 100 тэмдэгт авна'
                    }
                }
            },
            pTab1T9Section5ModalInputDate: {
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'Огноо буруу орсон байна. /Жил-Сар-Өдөр/'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab1T9Section5ModalHeaderLabel').text() == 'нэмэх') {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/WSOracleExecuteNonQuery",
                    data: '{qry:"INSERT INTO ST_BONUS (ID, STAFFS_ID, NAME, DT, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID(\'ST_BONUS\'), ' +<%=Request.QueryString["id"]%> +', \'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section5ModalInputName').val())) + '\', \'' + $.trim($('#pTab1T9Section5ModalInputDate').val()) + '\', ' + $('#indexUserId').text() + ', sysdate)"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section5Datatable();
                        $('#pTab1T9Section5Modal').modal('hide');
                        smallBox('Шагнал', 'Амжилттай хадгалагдлаа', '#659265', 4000);
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
                    data: '{qry:"UPDATE ST_BONUS SET NAME=\'' + replaceDisplayToDatabase($.trim($('#pTab1T9Section5ModalInputName').val())) + '\', DT=\'' + $.trim($('#pTab1T9Section5ModalInputDate').val()) + '\', UPDATED_STAFFID=' + $('#indexUserId').text() + ', UPDATED_DATE=SYSDATE WHERE ID=' + $('#pTab1T9Section5ID').html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1T9Section5Datatable();
                        $('#pTab1T9Section5Modal').modal('hide');
                        smallBox('Шагнал', 'Амжилттай засварлагдлаа', '#659265', 4000);
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
        }
    });

    $('#pTab1T9Section1ModalInputDate, #pTab1T9Section2ModalInputFromdate, #pTab1T9Section2ModalInputTodate, #pTab1T9Section4ModalInputFromdate, #pTab1T9Section4ModalInputTodate, #pTab1T9Section5ModalInputDate').datepicker({
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