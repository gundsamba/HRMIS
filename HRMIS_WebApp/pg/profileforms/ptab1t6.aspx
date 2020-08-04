<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptab1t6.aspx.cs" Inherits="HRWebApp.pg.profileforms.ptab1t6" %>
<style>
    .saveanotherskills {
        cursor:pointer;
    }
    .saveanotherskills:hover {
        color:#000;
    }
</style>
<div class="row" style="padding-top:10px;">
    <div class="col-smT12">
        <h4>Ур чадвар <small>/ та өөрийн ур чадварын түвшинг 1T3 баллаар үнэлнэ үү. 1-тааруу, 2-дунд, 3-сайн /</small></h4>
    </div>
</div>
<div id="ptab1t6DivParent" runat="server" class="row" style="padding-top:10px;">
    <div class="col-sm-4">
        <div class="well well-sm">
            <h4 class="text-primary" style="margin-bottom:5px;">Хувь хүний ур чадвар</h4>
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td rowspan="3" style="vertical-align:middle;" class="text-center">Өөрийгөө танин мэдэх</td>
                        <td class="text-center">Өөрийгөө эрхэмлэн дээдлэх зүйлс ба тэргүүлэх чиглэлээ тодорхойлох</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD1T1" name="ptab1t6SkillsD1" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD1T2" name="ptab1t6SkillsD1" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD1T3" name="ptab1t6SkillsD1" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Танин мэдэх хэв маягаа тогтоох</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD2T1" name="ptab1t6SkillsD2" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD2T2" name="ptab1t6SkillsD2" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD2T3" name="ptab1t6SkillsD2" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Өөрчлөлтийг хүлээх авах</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD3T1" name="ptab1t6SkillsD3" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD3T2" name="ptab1t6SkillsD3" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD3T3" name="ptab1t6SkillsD3" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center" rowspan="3" style="vertical-align:middle;">Стрессээ тайлах</td>
                        <td class="text-center">Стрессийн хүчин зүйлсийг намжаах</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD4T1" name="ptab1t6SkillsD4" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD4T2" name="ptab1t6SkillsD4" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD4T3" name="ptab1t6SkillsD4" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Цагийг зохистой ашиглах</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD5T1" name="ptab1t6SkillsD5" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD5T2" name="ptab1t6SkillsD5" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD5T3" name="ptab1t6SkillsD5" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Эрх мэдлээ төлөөлүүлэх</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD6T1" name="ptab1t6SkillsD6" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD6T2" name="ptab1t6SkillsD6" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD6T3" name="ptab1t6SkillsD6" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center" rowspan="3" style="vertical-align:middle;">Асуудлыг бүтээлчээр шийдвэрлэх</td>
                        <td class="text-center">Зүй зохистой хандлагыг хэрэглэх</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD7T1" name="ptab1t6SkillsD7" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD7T2" name="ptab1t6SkillsD7" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD7T3" name="ptab1t6SkillsD7" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Бүтээлч хандлагыг ашиглах</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD8T1" name="ptab1t6SkillsD8" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD8T2" name="ptab1t6SkillsD8" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD8T3" name="ptab1t6SkillsD8" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Шинэ санаачлагыг дэмжих</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD9T1" name="ptab1t6SkillsD9" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD9T2" name="ptab1t6SkillsD9" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD9T3" name="ptab1t6SkillsD9" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="well well-sm">
            <h4 class="text-primary" style="margin-bottom:5px;">Хүмүүс хоорондын харилцааны ур чадвар</h4>
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td rowspan="3" style="vertical-align:middle;" class="text-center">Бусадтай бие биенийгээ дэмжсэн харилцаа холбоо тогтоох</td>
                        <td class="text-center" style="width:210px;">Халамжлах</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD10T1" name="ptab1t6SkillsD10" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD10T2" name="ptab1t6SkillsD10" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD10T3" name="ptab1t6SkillsD10" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Зөвөлгөө өгөх</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD11T1" name="ptab1t6SkillsD11" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD11T2" name="ptab1t6SkillsD11" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD11T3" name="ptab1t6SkillsD11" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Бусдыг сонсох</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD12T1" name="ptab1t6SkillsD12" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD12T2" name="ptab1t6SkillsD12" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD12T3" name="ptab1t6SkillsD12" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center" rowspan="3" style="vertical-align:middle;">Эрх мэдлийнхээ хүрээнд бусдад нөлөөлөх</td>
                        <td class="text-center">Эрх мэдлээ хэрэгжүүлэх</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD13T1" name="ptab1t6SkillsD13" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD13T2" name="ptab1t6SkillsD13" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD13T3" name="ptab1t6SkillsD13" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Бусдад нөлөөлөх</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD14T1" name="ptab1t6SkillsD14" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD14T2" name="ptab1t6SkillsD14" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD14T3" name="ptab1t6SkillsD14" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Бусдад бүрэн эрх олгох</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD15T1" name="ptab1t6SkillsD15" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD15T2" name="ptab1t6SkillsD15" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD15T3" name="ptab1t6SkillsD15" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center" rowspan="3" style="vertical-align:middle;">Бусдад урам хайрлах</td>
                        <td class="text-center">Үр нөлөөгүй үйл ажиллагааг илрүүлэх</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD16T1" name="ptab1t6SkillsD16" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD16T2" name="ptab1t6SkillsD16" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD16T3" name="ptab1t6SkillsD16" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Урам зориг оруулах орчин бий болгох</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD17T1" name="ptab1t6SkillsD17" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD17T2" name="ptab1t6SkillsD17" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD17T3" name="ptab1t6SkillsD17" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Амжилтыг урамшуулах</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD18T1" name="ptab1t6SkillsD18" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD18T2" name="ptab1t6SkillsD18" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD18T3" name="ptab1t6SkillsD18" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center" rowspan="3" style="vertical-align:middle;">Зөрчлийг зохицуулах</td>
                        <td class="text-center">Шалтгааныг тогтоох</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD19T1" name="ptab1t6SkillsD19" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD19T2" name="ptab1t6SkillsD19" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD19T3" name="ptab1t6SkillsD19" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Тохирсон стратегийг сонгох</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD20T1" name="ptab1t6SkillsD20" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD20T2" name="ptab1t6SkillsD20" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD20T3" name="ptab1t6SkillsD20" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Сөргөлдөх явдлыг арилгах</td>
                        <td class="text-center" style="vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD21T1" name="ptab1t6SkillsD21" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD21T2" name="ptab1t6SkillsD21" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD21T3" name="ptab1t6SkillsD21" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="well well-sm">
            <h4 class="text-primary" style="margin-bottom:5px;">Бүлгээр ажиллах ур чадвар</h4>
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td class="text-center">Үр нөлөөтэй баг бүрдүүлэх</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD22T1" name="ptab1t6SkillsD22" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD22T2" name="ptab1t6SkillsD22" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD22T3" name="ptab1t6SkillsD22" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Бусдын эрх мэдэл, бүрэн эрхийг хүндэтгэж, дэмжлэг</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD23T1" name="ptab1t6SkillsD23" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD23T2" name="ptab1t6SkillsD23" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD23T3" name="ptab1t6SkillsD23" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Мэдлэг, мэдээллээ бусадтай хуваалцах</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD24T1" name="ptab1t6SkillsD24" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD24T2" name="ptab1t6SkillsD24" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD24T3" name="ptab1t6SkillsD24" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="well well-sm">
            <h4 class="text-primary" style="margin-bottom:5px;">Бусад ур чадвар</h4>
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td class="text-center">Үүрэг хүлээх</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD25T1" name="ptab1t6SkillsD25" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD25T2" name="ptab1t6SkillsD25" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD25T3" name="ptab1t6SkillsD25" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Хариуцлага хүлээх</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD26T1" name="ptab1t6SkillsD26" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD26T2" name="ptab1t6SkillsD26" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD26T3" name="ptab1t6SkillsD26" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Нийтийн зорилгод тууштай байх</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD27T1" name="ptab1t6SkillsD27" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD27T2" name="ptab1t6SkillsD27" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD27T3" name="ptab1t6SkillsD27" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Өөрийгөө хэгжүүлэх</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD28T1" name="ptab1t6SkillsD28" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD28T2" name="ptab1t6SkillsD28" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD28T3" name="ptab1t6SkillsD28" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Асуудал боловсруулах</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD29T1" name="ptab1t6SkillsD29" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD29T2" name="ptab1t6SkillsD29" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD29T3" name="ptab1t6SkillsD29" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">Оновчтой шийдвэр гаргах</td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6SkillsD30T1" name="ptab1t6SkillsD30" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD30T2" name="ptab1t6SkillsD30" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6SkillsD30T3" name="ptab1t6SkillsD30" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="well well-sm">
            <h4 class="text-primary" style="margin-bottom:5px;">Дээр дурдсанаас бусад ур чадвараасаа заримыг нэрлэнэ үү</h4>
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td class="text-center">
                            <textarea id="pTab1t6AnotherD1Name" name="pTab1t6AnotherD1Name" runat="server" class="form-control" rows="1"></textarea>
                        </td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6AnotherD1T1" name="ptab1t6AnotherD1" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6AnotherD1T2" name="ptab1t6AnotherD1" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6AnotherD1T3" name="ptab1t6AnotherD1" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                        <td class="text-center" style="width:35px; vertical-align:middle;"><i class="glyphicon glyphicon-floppy-disk text-muted saveanotherskills"></i></td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            <textarea id="pTab1t6AnotherD2Name" name="pTab1t6AnotherD2Name" runat="server" class="form-control" rows="1"></textarea>
                        </td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6AnotherD2T1" name="ptab1t6AnotherD2" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6AnotherD2T2" name="ptab1t6AnotherD2" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6AnotherD2T3" name="ptab1t6AnotherD2" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                        <td class="text-center" style="width:35px; vertical-align:middle;"><i class="glyphicon glyphicon-floppy-disk text-muted saveanotherskills"></i></td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            <textarea id="pTab1t6AnotherD3Name" name="pTab1t6AnotherD3Name" runat="server" class="form-control" rows="1"></textarea>
                        </td>
                        <td class="text-center" style="width:150px; vertical-align:middle;">
                            <label class="radio radio-inline no-margin">
							    <input id="ptab1t6AnotherD3T1" name="ptab1t6AnotherD3" runat="server" type="radio" class="radiobox" value="1">
								<span>1</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6AnotherD3T2" name="ptab1t6AnotherD3" runat="server" type="radio" class="radiobox" value="2">
								<span>2</span> 
							</label>
                            <label class="radio radio-inline">
							    <input id="ptab1t6AnotherD3T3" name="ptab1t6AnotherD3" runat="server" type="radio" class="radiobox" value="3">
								<span>3</span> 
							</label>
                        </td>
                        <td class="text-center" style="width:35px; vertical-align:middle;"><i class="glyphicon glyphicon-floppy-disk text-muted saveanotherskills"></i></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('.radiobox').change(function () {
        if ($(this).attr('name').split('ptab1t6')[1].substring(0, 6) == 'Skills') {
            globalAjaxVar = $.ajax({
                type: "POST",
                url: "ws.aspx/SKILLS_INSERT",
                data: '{P_STAFFS_ID:"' + <%=Request.QueryString["id"]%> + '", P_COL:"' + $(this).attr('name').split('Skills')[1].split('D')[1] + '", P_EVAL:"' + $(this).attr('id').split('Skills')[1].split('T')[1] + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    formTab1T6Percent();
                    smallBox('Түвшин', 'Амжилттай хадгалагдлаа', '#659265', 2000);
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
    });
    $('.saveanotherskills').click(function () {
        if ($.trim($(this).closest('tr').find('td:eq(0)').find('textarea').val()) == '') alert('Бусад ур чадвар заавал бичнэ үү!');
        else {
            if ($('input[name = "ptab1t6AnotherD' + ($(this).closest('tr').index() + 1) + '"]').is(':checked') == false) alert('Түвшин заавал сонгоно уу!');
            else {
                globalAjaxVar = $.ajax({
                    type: "POST",
                    url: "ws.aspx/ANOTHERSKILLS_INSERT",
                    data: '{P_STAFFS_ID:"' + <%=Request.QueryString["id"]%> + '", P_COL:"' + ($(this).closest('tr').index() + 1) + '", P_NAME:"' + replaceDisplayToDatabase($.trim($(this).closest('tr').find('td:eq(0)').find('textarea').val())) + '", P_EVAL:"' + $('input[name = "ptab1t6AnotherD' + ($(this).closest('tr').index() + 1) + '"]:checked').val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        formTab1T6Percent();
                        smallBox('Бусад ур чадвар', 'Амжилттай хадгалагдлаа', '#659265', 2000);
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
        }
    });
</script>
