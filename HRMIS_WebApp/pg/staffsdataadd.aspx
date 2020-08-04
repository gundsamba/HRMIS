<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffsdataadd.aspx.cs" Inherits="HRWebApp.pg.staffsdataadd" %>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark">
            <i class="fa-fw fa fa-home"></i> > Шагнал, зэрэг дэв бүртгэх
        </h1>
    </div>
</div>
<section id="widget-grid">
    <div class="row">
         <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs bordered">
                <li id="pTab1Li" runat="server" class="active" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab1">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Шагнал
                    </a>
                </li>
                <li id="pTab2Li" runat="server" onclick="pDatabindTabs(this)">
                    <a data-toggle="tab" href="#pTab2">
                        <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        Зэрэг дэв
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="pTab1" runat="server" class="tab-pane active">
                    <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"><i class="fa fa-table"></i></span>
                            <h2>Шагнал урамшуулал</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                <button id="pTab1AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab1Modal" data-toggle="modal" onclick="showAddEditTab1(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                            </div>
                            <div class="Colvis TableTools" style="width:150px; right:195px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectShagnaltype" name="pTab1SelectShagnaltype" runat="server" class="form-control" style="padding: 5px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:350px; top:5px; z-index:5; margin-top:7px;"><label>Хэлбэр:</label></div>
                            <div class="Colvis TableTools" style="width:150px; right:415px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab1SelectShagnalDecision" name="pTab1SelectShagnalDecision" runat="server" class="form-control" style="padding: 5px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:570px; top:4px; z-index:5; margin-top:7px;"><label>Шийдвэр: </label></div>
                            <div class="Colvis TableTools" style="width:85px; right:635px; top:5px; z-index:5; margin-top:1px;">
                                <input id="pTab1SelectTodate" name="pTab1SelectTodate" runat="server" type="text" class="form-control" style="padding: 5px;" maxlength="10"/>
                            </div>
                            <div class="Colvis TableTools" style="right:728px; top:4px; z-index:5; margin-top:7px;"><label>-</label></div>
                            <div class="Colvis TableTools" style="width:85px; right:740px; top:5px; z-index:5; margin-top:1px;">
                                <input id="pTab1SelectFromdate" name="pTab1SelectFromdate" runat="server" type="text" class="form-control" style="padding: 5px;" maxlength="10"/>
                            </div>
                            <div class="Colvis TableTools" style="right:835px; top:4px; z-index:5; margin-top:7px;"><label>Огноо: </label></div>
                            <div id="loaderTab1" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab1Table" class="widget-body no-padding">
                                        
                            </div>
                        </div>
                    </div>
                </div>
                <div id="pTab2" runat="server" class="tab-pane">
                    <div class="jarviswidget" data-widget-sortable="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"><i class="fa fa-table"></i></span>
                            <h2>Цэрэг дэв, цол</h2>
                        </header>
                        <div>
                            <div class="Colvis TableTools" style="right:75px; top:4px; z-index:5; margin-top:7px;"><label>Илэрц: </label></div>
                            <div class="Colvis TableTools" style="width:62px; right:120px; top:8px; z-index:5; margin-top:1px;">
                                <button id="pTab2AddBtn" class="btn btn-primary btn-xs" type="button" data-target="#pTab2Modal" data-toggle="modal" onclick="showAddEditTab2(this,'нэмэх')"><i class="fa fa-plus"></i> Нэмэх</button>
                            </div>
                            <div class="Colvis TableTools" style="width:150px; right:195px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab2SelectPosdegreedtl" name="pTab2SelectPosdegreedtl" runat="server" class="form-control" style="padding: 5px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:350px; top:5px; z-index:5; margin-top:7px;"><label>Зэрэг дэв:</label></div>
                            <div class="Colvis TableTools" style="width:150px; right:415px; top:5px; z-index:5; margin-top:1px;">
                                <select id="pTab2SelectRankposdegree" name="pTab2SelectRankposdegree" runat="server" class="form-control" style="padding: 5px;">
							        <option value="">- Бүгд -</option>
						        </select>
                            </div>
                            <div class="Colvis TableTools" style="right:570px; top:4px; z-index:5; margin-top:7px;"><label>Ангилал: </label></div>
                            <div class="Colvis TableTools" style="width:85px; right:635px; top:5px; z-index:5; margin-top:1px;">
                                <input id="pTab2SelectTodate" name="pTab2SelectTodate" runat="server" type="text" class="form-control" style="padding: 5px;" maxlength="10"/>
                            </div>
                            <div class="Colvis TableTools" style="right:728px; top:4px; z-index:5; margin-top:7px;"><label>-</label></div>
                            <div class="Colvis TableTools" style="width:85px; right:740px; top:5px; z-index:5; margin-top:1px;">
                                <input id="pTab2SelectFromdate" name="pTab2SelectFromdate" runat="server" type="text" class="form-control" style="padding: 5px;" maxlength="10"/>
                            </div>
                            <div class="Colvis TableTools" style="right:835px; top:4px; z-index:5; margin-top:7px;"><label>Огноо: </label></div>
                            <div id="loaderTab2" class="search-background">
                                <img width="64" height="" src="img/loading.gif"/>
                                <h2 style="width:100%; display:block; overflow:hidden; padding:20px 0 0 0; color: #fff; padding-top:0px; margin-top:0px;">Уншиж байна !</h2>
                            </div>
                            <div id="divBindTab2Table" class="widget-body no-padding">
                                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </article>
    </div>
</section>
<div id="pTab1Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="pTab1ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Гавъяа шагнал &nbsp;<span id="pTab1ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab1ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Шагналын нэр</label>
									<input id="pTab1ModalInputName" name="pTab1ModalInputName" type="text" class="form-control" placeholder="Шагналын нэр" maxlength="250" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-5">
                                    <label class="control-label">*Шагналын хэлбэр</label>
                                    <select id="pTab1ModalSelectShagnaltype" name="pTab1ModalSelectShagnaltype" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Шагнагдсан огноо</label>
									<input id="pTab1ModalInputDt" name="pTab1ModalInputDt" type="text" class="form-control" placeholder="Шагнагдсан огноо" maxlength="10" />
                                </div>
                                <div class="col-md-5">
                                    <label class="control-label">*Ямар байгууллагын шийдвэрээр</label>
                                    <select id="pTab1ModalSelectShagnaldecision" name="pTab1ModalSelectShagnaldecision" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Ямар байгууллагын тодорхойлолтоор</label>
									<input id="pTab1ModalInputOrgdescription" name="pTab1ModalInputOrgdescription" type="text" class="form-control" placeholder="Ямар байгууллагын тодорхойлолтоор" maxlength="250" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">Мөнгөн дүн</label>
									<input id="pTab1ModalInputPrice" name="pTab1ModalInputPrice" type="text" class="form-control" placeholder="Мөнгөн дүн" maxlength="15" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Үндэслэл</label>
									<input id="pTab1ModalInputGround" name="pTab1ModalInputGround" type="text" class="form-control" placeholder="Үндэслэл" maxlength="250" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Тушаал дугаар</label>
									<input id="pTab1ModalInputTushaalno" name="pTab1ModalInputTushaalno" type="text" class="form-control" placeholder="Тушаал дугаар" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">*Тушаал огноо</label>
									<input id="pTab1ModalInputTushaaldt" name="pTab1ModalInputTushaaldt" type="text" class="form-control" placeholder="Тушаал огноо" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">Хавсралт</label>
                                    <a id="pTab1ModalInputAttachDelete" class="btn btn-link btn-xs font-sm" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                </div>
                                <div class="col-md-6" style="padding-left: 0;">
                                    <a id="pTab1ModalInputAttachBtn" class="btn btn-link btn-xs font-sm" href="javascript:void(0);" style="padding:0px; border:none;" download="">Файл хавсаргаагүй байна...</a>
                                    <input id="pTab1ModalInputAttachInput" type="file" class="btn btn-default">
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-group" style="margin:0; display:block; overflow:hidden;">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Шагнагдсан ажилтан</label>
                                    <div id="pTab1ModalDivStafflist">

                                    </div>
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
<div id="pTab2Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="pTab2ModalForm">
                <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h4 class="modal-title">Зэрэг дэв, цол&nbsp;<span id="pTab2ModalHeaderLabel"></span></h4>
		        </div>
		        <div class="modal-body">
                    <div id="pTab2ID" class="hide"></div>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">*Албан тушаалын зэрэг дэв</label>
                                    <select id="pTab2ModalSelectPosdegreedtl" name="pTab2ModalSelectPosdegreedtl" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">*Албан тушаалын ангилал</label>
                                    <select id="pTab2ModalSelectRankposdegree" name="pTab2ModalSelectRankposdegree" runat="server" class="form-control" style="padding: 5px;">
							            <option value="">- Сонго -</option>
						            </select>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Шийдвэрийн нэр</label>
                                    <input id="pTab2ModalInputDecisiondesc" name="pTab2ModalInputDecisiondesc" type="text" class="form-control" placeholder="Зарлиг, захирамж, тушаалын нэр" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="control-label">*Шийдвэрийн огноо</label>
                                    <input id="pTab2ModalInputDt" name="pTab2ModalInputDt" type="text" class="form-control" placeholder="Шийдвэрийн огноо" />
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Шийдвэрийн дугаар</label>
                                    <input id="pTab2ModalInputCertificateno" name="pTab2ModalInputCertificateno" type="text" class="form-control" placeholder="Шийдвэрийн дугаар" />
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Нэмэгдлийн хувь</label>
                                    <input id="pTab2ModalInputUpper" name="pTab2ModalInputUpper" type="text" class="form-control" placeholder="Нэмэгдлийн хувь" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
						<div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">Хавсралт</label>
                                    <a id="pTab2ModalInputAttachDelete" class="btn btn-link btn-xs font-sm" href="javascript:void(0);"><i class="fa fa-trash-o"></i> файл устгах</a>
                                </div>
                                <div class="col-md-6" style="padding-left: 0;">
                                    <a id="pTab2ModalInputAttachBtn" class="btn btn-link btn-xs font-sm" href="javascript:void(0);" style="padding:0px; border:none;" download="">Файл хавсаргаагүй байна...</a>
                                    <input id="pTab2ModalInputAttachInput" type="file" class="btn btn-default">
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-group" style="margin:0; display:block; overflow:hidden;">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">*Шагнагдсан ажилтан</label>
                                    <div id="pTab2ModalDivStafflist">

                                    </div>
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
<div class="modal fade" id="pTab1StafflistModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
	<div class="modal-dialog">  
		<div class="modal-content">
			
		</div>  
	</div>  
</div>
<div class="modal fade" id="pTab1AttachshowModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
	<div class="modal-dialog">  
		<div class="modal-content">
			
		</div>  
	</div>  
</div>
<script type="text/javascript">
    pageSetUp();
    var globalAjaxVar = null;
    var pagefunction = function () {
        $('#pTab1ModalSelectShagnaltype').html($('#pTab1ModalSelectShagnaltype').html().replace(/- Бүгд -/g, '- Сонго -'));
        $('#pTab1ModalSelectShagnaldecision').html($('#pTab1ModalSelectShagnaldecision').html().replace(/- Бүгд -/g, '- Сонго -'));
        $('#pTab2ModalSelectPosdegreedtl').html($('#pTab2ModalSelectPosdegreedtl').html().replace(/- Бүгд -/g, '- Сонго -'));
        $('#pTab2ModalSelectRankposdegree').html($('#pTab2ModalSelectRankposdegree').html().replace(/- Бүгд -/g, '- Сонго -'));
        if ($('#pTab1Li').attr('class') == 'active') {
            dataBindTab1Datatable();
        }
        else if ($('#pTab2Li').attr('class') == 'active') {
            dataBindTab2Datatable();
        }
    };
    var pagedestroy = function () {
        if (globalAjaxVar != null) {
            globalAjaxVar.abort();
            globalAjaxVar = null;
        }
    }
    pagefunction();
    function pDatabindTabs(el) {
        if ($.trim($(el).attr('id')) == 'pTab1Li') {
            if ($.trim($('#divBindTab1Table').html()) == "") {
                dataBindTab1Datatable();
            }
        }
        else if ($.trim($(el).attr('id')) == 'pTab2Li') {
            if ($.trim($('#divBindTab2Table').html()) == "") {
                dataBindTab2Datatable();
            }
        }
    }
    //tab1
    function dataBindTab1Datatable() {
        var valData = '';
        showLoader('loaderTab1');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/StaffsdataaddTab1Datatable",
            data: '{"fromdate": "' + $.trim($('#pTab1SelectFromdate').val()) + '", "todate": "' + $.trim($('#pTab1SelectTodate').val()) + '", "decision":"' + $('#pTab1SelectShagnalDecision option:selected').val() + '", "type":"' + $('#pTab1SelectShagnaltype option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += '<table id="pTab1Datatable" class="table table-striped table-bordered table-hover smart-form" width="100%"><thead>';
                valData += '<tr>';
                valData += '<th class="text-center" style="vertical-align:middle;">Нэр</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Хэлбэр</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Огноо</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Шийдвэр</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Ямар тодорхойлолтоор</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Мөнгөн дүн</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Үндэслэл</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Нэрс</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Тушаал №</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Тушаал огноо</th>';
                valData += '<th class="text-center" style="vertical-align:middle;"><i class="fa fa-fw fa-paperclip text-muted hidden-md hidden-sm hidden-xs"></i> Тушаал</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">&nbsp;</th>';
                valData += '</tr>';
                valData += '</thead><tbody>';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += '<tr data-id="' + value.SHAGNAL_ID + '">';
                    valData += '<td>' + replaceDatabaseToDisplay(value.NAME) + '</td>';
                    valData += '<td data-id="' + value.SHAGNALTYPE_ID + '">' + replaceDatabaseToDisplay(value.SHAGNALTYPE_NAME) + '</td>';
                    valData += '<td>' + value.DT + '</td>';
                    valData += '<td data-id="' + value.SHAGNALDECISION_ID + '">' + replaceDatabaseToDisplay(value.SHAGNALDECISION_NAME) + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.ORGDESCRIPTION) + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.PRICE) + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.GROUND) + '</td>';
                    valData += '<td data-id="' + value.STAFFLISTID + '"><a class="btn btn-info btn-xs" href="../pg/staffsdataaddStafflistModal.aspx?id=' + value.SHAGNAL_ID + '" data-toggle="modal" data-target="#pTab1StafflistModal"><i class="fa fa-group"></i> Харах</a></td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.TUSHAALNO) + '</td>';
                    valData += '<td>' + value.TUSHAALDT + '</td>';
                    valData += '<td>';
                    if (value.FILENAME != '') valData += '<a data-filename="' + value.FILENAME + '" class="btn btn-info btn-xs" href="../pg/staffsdataaddAttachshowModal.aspx?id=' + value.SHAGNAL_ID + '" data-toggle="modal" data-target="#pTab1AttachshowModal"><i class="fa fa-paperclip"></i> Харах</a></td>';
                    valData += '</td>';
                    valData += '<td><div class="btn-group"><a href="javascript:void(0);" class="btn btn-default btn-xs" style="cursor:pointer;" onclick="showAddEditTab1(this,\'засах\');" data-target="#pTab1Modal" data-toggle="modal"><i class="fa fa-pencil"></i></a><a href="javascript:void(0);" class="btn btn-default btn-xs" style="cursor:pointer;" onclick="showDeleteTab1(this)"><i class="fa fa-trash-o"></i></a></div></td>';
                    valData += '</tr>';
                });
                valData += '</tbody>';
                valData += '</table>';
                valData += "<script>";
                valData += "var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#pTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [null, null, { \"sWidth\": \"58px\" }, null, null, { \"sWidth\": \"65px\" }, null, { \"sWidth\": \"56px\" }, { \"sWidth\": \"68px\" }, { \"sWidth\": \"79px\" }, { \"sWidth\": \"45px\" },{ \"sWidth\": \"37px\" }]});";
                valData += "<\/script>";
                $("#divBindTab1Table").html(valData);
                hideLoader('loaderTab1');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab1(el, isinsupt) {
        $('#pTab1ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab1ID').text('');
            $('#pTab1ModalInputName').val('');
            $('#pTab1ModalSelectShagnaltype').val('');
            $('#pTab1ModalInputDt').val('');
            $('#pTab1ModalSelectShagnaldecision').val('');
            $('#pTab1ModalInputOrgdescription').val('');
            $('#pTab1ModalInputPrice').val('');
            $('#pTab1ModalInputGround').val('');
            $('#pTab1ModalInputTushaalno').val('');
            $('#pTab1ModalInputTushaaldt').val('');
            $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
            $('#pTab1ModalInputAttachBtn').attr('href', 'javascript:void(0);');
            $('#pTab1ModalInputAttachInput').val('');
            dataBindpTab1ModalSelectStafflist('');
        }
        else {
            $('#pTab1ID').text($(el).closest('tr').attr('data-id'));
            $('#pTab1ModalInputName').val($(el).closest('tr').find('td:eq(0)').text());
            $('#pTab1ModalSelectShagnaltype').val($(el).closest('tr').find('td:eq(1)').attr('data-id'));
            $('#pTab1ModalInputDt').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab1ModalSelectShagnaldecision').val($(el).closest('tr').find('td:eq(3)').attr('data-id'));
            $('#pTab1ModalInputOrgdescription').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab1ModalInputPrice').val($(el).closest('tr').find('td:eq(5)').text());
            $('#pTab1ModalInputGround').val($(el).closest('tr').find('td:eq(6)').text());
            $('#pTab1ModalInputTushaalno').val($(el).closest('tr').find('td:eq(8)').text());
            $('#pTab1ModalInputTushaaldt').val($(el).closest('tr').find('td:eq(9)').text());
            if ($.trim($(el).closest('tr').find('td:eq(10)').html()) == '') {
                $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                $('#pTab1ModalInputAttachBtn').attr('href', 'javascript:void(0);');
                $('#pTab1ModalInputAttachInput').val('');
            }
            else {
                $('#pTab1ModalInputAttachBtn').html($(el).closest('tr').find('td:eq(10)').find('a').attr('data-filename'));
                $('#pTab1ModalInputAttachBtn').attr('href', '../files/shagnaltushaal/' + $(el).closest('tr').find('td:eq(10)').find('a').attr('data-filename'));
                $('#pTab1ModalInputAttachInput').val('');
            }
            dataBindpTab1ModalSelectStafflist($(el).closest('tr').find('td:eq(7)').attr('data-id'));
        }
    }
    function showDeleteTab1(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мэдээллийг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/SHAGNAL_DELETE",
                    data: '{"P_ID":"' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab1Datatable();
                        smallBox('Гавъяа шагнал', 'Амжилттай устгагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $("#pTab1ModalInputAttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 2971520) {
            errMsg += 'Файлын хэмжээ 20MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png' && valE != 'gif') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png, gif/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab1ModalInputAttachBtn').html($(this).val().split('\\').pop());
        }
        else alert(errMsg);
    });
    $("#pTab1ModalInputAttachDelete").click(function () {
        if ($('#pTab1ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
            $.SmartMessageBox({
                title: "Анхааруулга!",
                content: "Та устгахдаа итгэлтэй байна уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/DeleteFile",
                        data: '{filename:"~/files/shagnaltushaal/' + $('#pTab1ModalInputAttachBtn').html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            $('#pTab1ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                            smallBox('Файл', 'Амжилттай устгагдлаа...', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            });
        }
    });
    function dataBindpTab1ModalSelectStafflist(selectedList) {
        var valData = '';
        var stroptgroup = '';
        $('#pTab1ModalDivStafflist').html('<input class="form-control ui-autocomplete-loading" disabled="disabled" placeholder="" type="text">');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/tomiloltTab1ModalSelectstafflistForSelect2",
            data: '{"selectedList":"' + selectedList + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (stroptgroup != value.GAZAR_ID) {
                        if (stroptgroup != '') {
                            valData += "</optgroup>";
                        }
                        valData += "<optgroup label=\"" + value.INITNAME + "\">";
                    }
                    valData += "<option " + value.ISSELECTED + " value=\"" + value.STAFF_ID + "\" title=\"" + value.STAFF_NAME + "\">" + value.STAFF_NAME + "</option>";
                    stroptgroup = value.GAZAR_ID;
                });
                $("#pTab1ModalDivStafflist").html("<select id=\"pTab1ModalSelectStafflist\" name=\"pTab1ModalSelectStafflist\" multiple=\"multiple\" style=\"width:100%\">" + valData + "</select><script>$(\"#pTab1ModalSelectStafflist\").select2();<\/script>");
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#pTab1ModalForm').bootstrapValidator({
        fields: {
            pTab1ModalInputName: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 250,
                        message: 'Уртдаа 250 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalSelectShagnaltype: {
                group: '.col-md-5',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalSelectShagnaldecision: {
                group: '.col-md-5',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab1ModalInputDt: {
                group: '.col-md-2',
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
            pTab1ModalInputOrgdescription: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 250,
                        message: 'Уртдаа 250 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputPrice: {
                group: '.col-md-2',
                validators: {
                    stringLength: {
                        max: 15,
                        message: 'Уртдаа 15 тэмдэгт авна'
                    },
                    numeric: {
                        message: 'Зөвхөн тоон тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputGround: {
                group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 250,
                        message: 'Уртдаа 250 тэмдэгт авна'
                    }
                }
            },
            pTab1ModalInputTushaalno: {
                group: '.col-md-2',
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
            pTab1ModalInputTushaaldt: {
                group: '.col-md-2',
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
            if ($('#pTab1ModalSelectStafflist').val() == null) alert('Шагнагдсан ажилтан сонгоно уу');
            else {
                var filename = "none";
                if ($('#pTab1ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
                    filename = "Шагнал" + $.trim($('#pTab1ModalInputTushaalno').val()) + "D" + $.trim($('#pTab1ModalInputTushaaldt').val()).replace(/-/g, '') + "." + $('#pTab1ModalInputAttachBtn').html().split('.')[$('#pTab1ModalInputAttachBtn').html().split('.').length - 1];
                }
                if ($('#pTab1ModalHeaderLabel').text() == 'нэмэх') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/SHAGNAL_INSERT",
                        data: '{"P_NAME":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '", "P_DT":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDt').val())) + '", "P_SHAGNALTYPE_ID":"' + $('#pTab1ModalSelectShagnaltype option:selected').val() + '", "P_SHAGNALDECISION_ID":"' + $('#pTab1ModalSelectShagnaldecision option:selected').val() + '", "P_ORGDESCRIPTION":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputOrgdescription').val())) + '", "P_PRICE":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputPrice').val())) + '", "P_GROUND":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputGround').val())) + '", "P_TUSHAALNO":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaalno').val())) + '", "P_TUSHAALDT":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaaldt').val())) + '", "P_FILENAME":"' + filename + '", "P_STAFFLIST":"' + $.trim($('#pTab1ModalSelectStafflist').val()) + '", "P_STAFFID":"' + $.trim($('#indexUserId').text()) + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if (filename != "none") {
                                if ($("#pTab1ModalInputAttachInput").val() != '') {
                                    var uploadfiles = $("#pTab1ModalInputAttachInput").get(0);
                                    var uploadedfiles = uploadfiles.files;
                                    var fromdata = new FormData();
                                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "pg/UploadFile.ashx?folder=shagnaltushaal&filename=" + filename,
                                        data: fromdata,
                                        contentType: false,
                                        processData: false,
                                        success: function () {
                                            smallBox('Хавсралт', 'Амжилттай хадгалагдлаа', '#659265', 1000);
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                }
                            }
                            dataBindTab1Datatable();
                            $('#pTab1Modal').modal('hide');
                            smallBox('Гавъяа шагнал', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                else if ($('#pTab1ModalHeaderLabel').text() == 'засах') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/SHAGNAL_UPDATE",
                        data: '{"P_ID":"' + $.trim($('#pTab1ID').text()) + '", "P_NAME":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputName').val())) + '", "P_DT":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputDt').val())) + '", "P_SHAGNALTYPE_ID":"' + $('#pTab1ModalSelectShagnaltype option:selected').val() + '", "P_SHAGNALDECISION_ID":"' + $('#pTab1ModalSelectShagnaldecision option:selected').val() + '", "P_ORGDESCRIPTION":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputOrgdescription').val())) + '", "P_PRICE":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputPrice').val())) + '", "P_GROUND":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputGround').val())) + '", "P_TUSHAALNO":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaalno').val())) + '", "P_TUSHAALDT":"' + replaceDisplayToDatabase($.trim($('#pTab1ModalInputTushaaldt').val())) + '", "P_FILENAME":"' + filename + '", "P_STAFFLIST":"' + $.trim($('#pTab1ModalSelectStafflist').val()) + '", "P_STAFFID":"' + $.trim($('#indexUserId').text()) + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if (filename != "none") {
                                if ($("#pTab1ModalInputAttachInput").val() != '') {
                                    var uploadfiles = $("#pTab1ModalInputAttachInput").get(0);
                                    var uploadedfiles = uploadfiles.files;
                                    var fromdata = new FormData();
                                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "pg/UploadFile.ashx?folder=shagnaltushaal&filename=" + filename,
                                        data: fromdata,
                                        contentType: false,
                                        processData: false,
                                        success: function () {
                                            smallBox('Хавсралт', 'Амжилттай хадгалагдлаа', '#659265', 1000);
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                }
                            }
                            dataBindTab1Datatable();
                            $('#pTab1Modal').modal('hide');
                            smallBox('Гавъяа шагнал', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            }
        }
    });
    $("#pTab1SelectShagnalDecision, #pTab1SelectShagnaltype, #pTab1SelectFromdate, #pTab1SelectTodate").change(function () {
        dataBindTab1Datatable();
    });

    //tab2
    function dataBindTab2Datatable() {
        var valData = '';
        showLoader('loaderTab2');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/StaffsdataaddTab2Datatable",
            data: '{"fromdate": "' + $.trim($('#pTab2SelectFromdate').val()) + '", "todate": "' + $.trim($('#pTab2SelectTodate').val()) + '", "posdegreedtl":"' + $('#pTab2SelectPosdegreedtl option:selected').val() + '", "rankposdegree":"' + $('#pTab2SelectRankposdegree option:selected').val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                valData = '';
                valData += '<table id="pTab2Datatable" class="table table-striped table-bordered table-hover smart-form" width="100%"><thead>';
                valData += '<tr>';
                valData += '<th class="text-center" style="vertical-align:middle;">Албан тушаалын зэрэг дэв</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Албан тушаалын ангилал</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Шийдвэрийн нэр</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Огноо</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Дугаар</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Нэмэгдлийн хувь</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">Нэрс</th>';
                valData += '<th class="text-center" style="vertical-align:middle;"><i class="fa fa-fw fa-paperclip text-muted hidden-md hidden-sm hidden-xs"></i> Тушаал</th>';
                valData += '<th class="text-center" style="vertical-align:middle;">&nbsp;</th>';
                valData += '</tr>';
                valData += '</thead><tbody>';
                $($.parseJSON(data.d)).each(function (index, value) {
                    valData += '<tr data-id="' + value.ZEREGDEV_ID + '">';
                    valData += '<td data-id="' + value.POSDEGREEDTL_ID + '">' + replaceDatabaseToDisplay(value.POSDEGREEDTL_NAME) + '</td>';
                    valData += '<td data-id="' + value.RANKPOSDEGREE_ID + '">' + replaceDatabaseToDisplay(value.RANKPOSDEGREE_NAME) + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.DECISIONDESC) + '</td>';
                    valData += '<td>' + value.DT + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.CERTIFICATENO) + '</td>';
                    valData += '<td>' + replaceDatabaseToDisplay(value.UPPER) + '</td>';
                    valData += '<td data-id="' + value.STAFFLISTID + '"><a class="btn btn-info btn-xs" href="../pg/staffsdataaddStafflistModalTab2.aspx?id=' + value.ZEREGDEV_ID + '" data-toggle="modal" data-target="#pTab1StafflistModal"><i class="fa fa-group"></i> Харах</a></td>';
                    valData += '<td>';
                    if (value.FILENAME != '') valData += '<a data-filename="' + value.FILENAME + '" class="btn btn-info btn-xs" href="../pg/staffsdataaddAttachshowModalTab2.aspx?id=' + value.ZEREGDEV_ID + '" data-toggle="modal" data-target="#pTab1AttachshowModal"><i class="fa fa-paperclip"></i> Харах</a></td>';
                    valData += '</td>';
                    valData += '<td><div class="btn-group"><a href="javascript:void(0);" class="btn btn-default btn-xs" style="cursor:pointer;" onclick="showAddEditTab2(this,\'засах\');" data-target="#pTab2Modal" data-toggle="modal"><i class="fa fa-pencil"></i></a><a href="javascript:void(0);" class="btn btn-default btn-xs" style="cursor:pointer;" onclick="showDeleteTab2(this)"><i class="fa fa-trash-o"></i></a></div></td>';
                    valData += '</tr>';
                });
                valData += '</tbody>';
                valData += '</table>';
                valData += "<script>";
                valData += "var responsiveHelper_pTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#pTab2Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab2Datatable) {responsiveHelper_pTab2Datatable = new ResponsiveDatatablesHelper($('#pTab2Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_pTab2Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_pTab2Datatable.respond();}, \"aoColumns\": [null, null, null, { \"sWidth\": \"58px\" }, null, null, { \"sWidth\": \"56px\" }, { \"sWidth\": \"45px\" },{ \"sWidth\": \"37px\" }]});";
                valData += "<\/script>";
                $("#divBindTab2Table").html(valData);
                hideLoader('loaderTab2');
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    function showAddEditTab2(el, isinsupt) {
        $('#pTab2ModalHeaderLabel').text(isinsupt);
        if (isinsupt == 'нэмэх') {
            $('#pTab2ID').text('');
            $('#pTab2ModalSelectPosdegreedtl').val('');
            $('#pTab2ModalSelectRankposdegree').val('');
            $('#pTab2ModalInputDecisiondesc').val('');
            $('#pTab2ModalInputDt').val('');
            $('#pTab2ModalInputCertificateno').val('');
            $('#pTab2ModalInputUpper').val('');
            $('#pTab2ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
            $('#pTab2ModalInputAttachBtn').attr('href', 'javascript:void(0);');
            $('#pTab2ModalInputAttachInput').val('');
            dataBindpTab2ModalSelectStafflist('');
        }
        else {
            $('#pTab2ID').text($(el).closest('tr').attr('data-id'));
            $('#pTab2ModalSelectPosdegreedtl').val($(el).closest('tr').find('td:eq(0)').attr('data-id'));
            $('#pTab2ModalSelectRankposdegree').val($(el).closest('tr').find('td:eq(1)').attr('data-id'));
            $('#pTab2ModalInputDecisiondesc').val($(el).closest('tr').find('td:eq(2)').text());
            $('#pTab2ModalInputDt').val($(el).closest('tr').find('td:eq(3)').text());
            $('#pTab2ModalInputCertificateno').val($(el).closest('tr').find('td:eq(4)').text());
            $('#pTab2ModalInputUpper').val($(el).closest('tr').find('td:eq(5)').text());
            if ($.trim($(el).closest('tr').find('td:eq(7)').html()) == '') {
                $('#pTab2ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                $('#pTab2ModalInputAttachBtn').attr('href', 'javascript:void(0);');
                $('#pTab2ModalInputAttachInput').val('');
            }
            else {
                $('#pTab2ModalInputAttachBtn').html($(el).closest('tr').find('td:eq(7)').find('a').attr('data-filename'));
                $('#pTab2ModalInputAttachBtn').attr('href', '../files/zeregdevtushaal/' + $(el).closest('tr').find('td:eq(7)').find('a').attr('data-filename'));
                $('#pTab2ModalInputAttachInput').val('');
            }
            dataBindpTab2ModalSelectStafflist($(el).closest('tr').find('td:eq(6)').attr('data-id'));
        }
    }
    function showDeleteTab2(el) {
        $.SmartMessageBox({
            title: "Анхааруулга!",
            content: "Сонгосон мэдээллийг устгах уу?",
            buttons: '[Үгүй][Тийм]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "Тийм") {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "../webservice/ServiceMain.svc/ZEREGDEV_DELETE",
                    data: '{"P_ID":"' + $(el).closest('tr').attr('data-id') + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        dataBindTab2Datatable();
                        smallBox('Зэрэг дэв', 'Амжилттай устгагдлаа', '#659265', 4000);
                    },
                    failure: function (response) {
                        alert('FAILURE: ' + response.d);
                    },
                    error: function (xhr, status, error) {
                        window.location = '../#pg/error500.aspx';
                    }
                });
            }
        });
    }
    $("#pTab2ModalInputAttachInput").change(function () {
        var errMsg = '';
        var uploadfiles = $(this).get(0);
        var uploadedfiles = uploadfiles.files;
        var fromdata = new FormData();
        if (uploadedfiles[0].size > 2971520) {
            errMsg += 'Файлын хэмжээ 20MB -аас ихгүй байна!\n';
            $(this).val('');
        }
        if (errMsg == '') {
            valE = uploadedfiles[0].name.substr((uploadedfiles[0].name.lastIndexOf('.') + 1));
            if (valE != 'jpeg' && valE != 'jpg' && valE != 'png' && valE != 'gif') {
                errMsg += 'Файлын төрөл зөвшөөрөгдөөгүй төрөл байна. /jpeg, jpg, png, gif/\n';
                $(this).val('');
            }
            else fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
        }
        if (errMsg == '') {
            $('#pTab2ModalInputAttachBtn').html($(this).val().split('\\').pop());
        }
        else alert(errMsg);
    });
    $("#pTab2ModalInputAttachDelete").click(function () {
        if ($('#pTab2ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
            $.SmartMessageBox({
                title: "Анхааруулга!",
                content: "Та устгахдаа итгэлтэй байна уу?",
                buttons: '[Үгүй][Тийм]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Тийм") {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "ws.aspx/DeleteFile",
                        data: '{filename:"~/files/zeregdevtushaal/' + $('#pTab2ModalInputAttachBtn').html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            $('#pTab2ModalInputAttachBtn').html('Файл хавсаргаагүй байна...');
                            smallBox('Файл', 'Амжилттай устгагдлаа...', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            });
        }
    });
    function dataBindpTab2ModalSelectStafflist(selectedList) {
        var valData = '';
        var stroptgroup = '';
        $('#pTab2ModalDivStafflist').html('<input class="form-control ui-autocomplete-loading" disabled="disabled" placeholder="" type="text">');
        globalAjaxVar = $.ajax({
            type: "POST",
            url: "../webservice/ServiceMain.svc/tomiloltTab1ModalSelectstafflistForSelect2",
            data: '{"selectedList":"' + selectedList + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $($.parseJSON(data.d)).each(function (index, value) {
                    if (stroptgroup != value.GAZAR_ID) {
                        if (stroptgroup != '') {
                            valData += "</optgroup>";
                        }
                        valData += "<optgroup label=\"" + value.INITNAME + "\">";
                    }
                    valData += "<option " + value.ISSELECTED + " value=\"" + value.STAFF_ID + "\" title=\"" + value.STAFF_NAME + "\">" + value.STAFF_NAME + "</option>";
                    stroptgroup = value.GAZAR_ID;
                });
                $("#pTab2ModalDivStafflist").html("<select id=\"pTab2ModalSelectStafflist\" name=\"pTab2ModalSelectStafflist\" multiple=\"multiple\" style=\"width:100%\">" + valData + "</select><script>$(\"#pTab2ModalSelectStafflist\").select2();<\/script>");
            },
            failure: function (response) {
                alert('FAILURE: ' + response.d);
            },
            error: function (xhr, status, error) {
                window.location = '../#pg/error500.aspx';
            }
        });
    }
    $('#pTab2ModalForm').bootstrapValidator({
        fields: {
            pTab2ModalSelectPosdegreedtl: {
                group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2ModalSelectRankposdegree: {
                group: '.col-md-6',
                validators: {
                    notEmpty: {
                        message: 'Сонгоно уу'
                    }
                }
            },
            pTab2ModalInputDecisiondesc: {
                group: '.col-md-12',
                validators: {
                    notEmpty: {
                        message: 'Оруулна уу'
                    },
                    stringLength: {
                        max: 250,
                        message: 'Уртдаа 250 тэмдэгт авна'
                    }
                }
            },
            pTab2ModalInputDt: {
                group: '.col-md-4',
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
            pTab2ModalInputCertificateno: {
                group: '.col-md-4',
                validators: {
                    stringLength: {
                        max: 25,
                        message: 'Уртдаа 25 тэмдэгт авна'
                    }
                }
            },
            pTab2ModalInputUpper: {
                group: '.col-md-4',
                validators: {
                    stringLength: {
                        max: 25,
                        message: 'Уртдаа 25 тэмдэгт авна'
                    }
                }
            }
        },
        onSuccess: function (e, data) {
            e.preventDefault();
            if ($('#pTab2ModalSelectStafflist').val() == null) alert('Aжилтан сонгоно уу');
            else {
                var filename = "none";
                if ($('#pTab2ModalInputAttachBtn').html() != 'Файл хавсаргаагүй байна...') {
                    filename = "Зэрэгдэв" + $.trim($('#pTab2ModalInputTushaalno').val()) + "D" + $.trim($('#pTab2ModalInputTushaaldt').val()).replace(/-/g, '') + "." + $('#pTab2ModalInputAttachBtn').html().split('.')[$('#pTab2ModalInputAttachBtn').html().split('.').length - 1];
                }
                if ($('#pTab2ModalHeaderLabel').text() == 'нэмэх') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/ZEREGDEV_INSERT",
                        data: '{"P_POSDEGREEDTL_ID":"' + $('#pTab2ModalSelectPosdegreedtl option:selected').val() + '", "P_RANKPOSDEGREE_ID":"' + $('#pTab2ModalSelectRankposdegree option:selected').val() + '", "P_DECISIONDESC":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputDecisiondesc').val())) + '", "P_DT":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputDt').val())) + '", "P_CERTIFICATENO":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputCertificateno').val())) + '", "P_UPPER":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputUpper').val())) + '", "P_FILENAME":"' + filename + '", "P_STAFFLIST":"' + $.trim($('#pTab2ModalSelectStafflist').val()) + '", "P_STAFFID":"' + $.trim($('#indexUserId').text()) + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if (filename != "none") {
                                if ($("#pTab2ModalInputAttachInput").val() != '') {
                                    var uploadfiles = $("#pTab2ModalInputAttachInput").get(0);
                                    var uploadedfiles = uploadfiles.files;
                                    var fromdata = new FormData();
                                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "pg/UploadFile.ashx?folder=zeregdevtushaal&filename=" + filename,
                                        data: fromdata,
                                        contentType: false,
                                        processData: false,
                                        success: function () {
                                            smallBox('Хавсралт', 'Амжилттай хадгалагдлаа', '#659265', 1000);
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                }
                            }
                            dataBindTab2Datatable();
                            $('#pTab2Modal').modal('hide');
                            smallBox('Зэрэг дэв', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
                else if ($('#pTab2ModalHeaderLabel').text() == 'засах') {
                    globalAjaxVar = $.ajax({
                        type: "POST",
                        url: "../webservice/ServiceMain.svc/ZEREGDEV_UPDATE",
                        data: '{"P_ID":"' + $.trim($('#pTab2ID').text()) + '", "P_POSDEGREEDTL_ID":"' + $('#pTab2ModalSelectPosdegreedtl option:selected').val() + '", "P_RANKPOSDEGREE_ID":"' + $('#pTab2ModalSelectRankposdegree option:selected').val() + '", "P_DECISIONDESC":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputDecisiondesc').val())) + '", "P_DT":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputDt').val())) + '", "P_CERTIFICATENO":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputCertificateno').val())) + '", "P_UPPER":"' + replaceDisplayToDatabase($.trim($('#pTab2ModalInputUpper').val())) + '", "P_FILENAME":"' + filename + '", "P_STAFFLIST":"' + $.trim($('#pTab2ModalSelectStafflist').val()) + '", "P_STAFFID":"' + $.trim($('#indexUserId').text()) + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if (filename != "none") {
                                if ($("#pTab2ModalInputAttachInput").val() != '') {
                                    var uploadfiles = $("#pTab2ModalInputAttachInput").get(0);
                                    var uploadedfiles = uploadfiles.files;
                                    var fromdata = new FormData();
                                    fromdata.append(uploadedfiles[0].name, uploadedfiles[0]);
                                    globalAjaxVar = $.ajax({
                                        type: "POST",
                                        url: "pg/UploadFile.ashx?folder=zeregdevtushaal&filename=" + filename,
                                        data: fromdata,
                                        contentType: false,
                                        processData: false,
                                        success: function () {
                                            smallBox('Хавсралт', 'Амжилттай хадгалагдлаа', '#659265', 1000);
                                        },
                                        failure: function (response) {
                                            alert('FAILURE: ' + response.d);
                                        },
                                        error: function (xhr, status, error) {
                                            window.location = '../#pg/error500.aspx';
                                        }
                                    });
                                }
                            }
                            dataBindTab2Datatable();
                            $('#pTab2Modal').modal('hide');
                            smallBox('Зэрэг дэв', 'Амжилттай хадгалагдлаа', '#659265', 4000);
                        },
                        failure: function (response) {
                            alert('FAILURE: ' + response.d);
                        },
                        error: function (xhr, status, error) {
                            window.location = '../#pg/error500.aspx';
                        }
                    });
                }
            }
        }
    });
    $("#pTab2SelectPosdegreedtl, #pTab2SelectRankposdegree, #pTab2SelectFromdate, #pTab2SelectTodate").change(function () {
        dataBindTab2Datatable();
    });
    $('#pTab1SelectFromdate, #pTab1SelectTodate, #pTab1ModalInputDt, #pTab1ModalInputTushaaldt, #pTab2SelectFromdate, #pTab2SelectTodate, #pTab2ModalInputDt').datepicker({
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