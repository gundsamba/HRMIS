<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalStaffAnketPrint.aspx.cs" Inherits="HRWebApp.pg.modal.modalStaffAnketPrint" %>
<style>
    .A4 {
      background: white;
      width: 21cm;
      height: 29.7cm;
      display: block;
      margin: 0 auto;
      /*padding: 414px 235px 10px 235px;*/
      box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
      overflow-y: scroll;
      box-sizing: border-box;
      font-family: Times New Roman, Times, serif;
      font-size: 12pt;
      line-height: 24px;
    }
    @page {
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
        margin-bottom: 0px;
    }
</style>
<div style="padding:0.79in 0.75in 0.86in 0.98in !important;">
    <div id="divContent" style="font-family: Arial, Helvetica, sans-serif; font-size: 12pt; line-height: 1;">
        <p style="text-align:right; font-style:italic;">Төрийн албаны зөвлөлийн  2019  оны 01 дүгээр<br />сарын 31-ний  өдрийн 05 дугаар тогтоолын<br />хоёрдугаар  хавсралт</p>
        <br />
        <p style="text-align:right; font-weight:bold;">Маягт 1</p>
        <p style="text-align:center; font-weight:bold; text-transform:uppercase;">ТӨРИЙН АЛБАН ХААГЧИЙН АНКЕТ<br />“А ХЭСЭГ”</p>
        <table style="width:100%; border-collapse:collapse; border:none; height:140px;">
            <tbody>
                <tr>
                    <th style="width:70%;">Нэг. Хувь хүний талаарх мэдээлэл</th>
                    <td rowspan="5">
                        <div style="border:1px solid #000; width:91px; height:120px;" class="pull-right">
                            <img id="imgAvatar" runat="server" src="../files/staffs/male.png" width="89" height="118" style="vertical-align: top;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:100%; border-collapse:collapse; border:none;">
                            <tbody>
                                <tr>
                                    <td style="width: 165px;">Регистрийн дугаар:    </td>
                                    <td style="width: 45px;">
                                        <table style="width:32.2px; border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <td id="tdRDNO1" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO2" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td>
                                        <table style="width:128.8px; border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <td id="tdRDNO3" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO4" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO5" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO6" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO7" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO8" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO9" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                    <td id="tdRDNO10" runat="server" style="border: 1px solid #000; padding: 0; text-align:center; vertical-align:middle; width:16px; font-style:italic;">&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>1.1. Иргэншил:  <label id="labelNationality" runat="server" style="width:275px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label></td>
                </tr>
                <tr>
                    <td>1.2. Ургийн овог:  <label id="labelMiddleName" runat="server" style="width:262px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label></td>
                </tr>
                <tr>
                    <td>1.3. Эцэг (эх)-ийн нэр:  <label id="labelLastName" runat="server" style="width:222px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:left; line-height:1.5;  margin: 0;">
            1.4. Өөрийн нэр:  <label id="labelFirstName" runat="server" style="width:222px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label> 1.5. Хүйс: <label style="width:122px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
            <br />
            1.5. Төрсөн:  <label id="labelBirthYear" runat="server" style="width:52px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label> он  <label id="labelBirthMonth" runat="server" style="width:32px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>  сар  <label id="labelBirthDay" runat="server" style="width:32px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>  өдөр
            <br />
            1.6. Төрсөн аймаг, хот: улс  <label id="labelBirthAimag" runat="server" style="width:150px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>  сум, дүүрэг:  <label id="labelBirthSoum" runat="server" style="width:152px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Төрсөн газар:  <label id="labelBirthPlace" runat="server" style="width:275px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
            <br />
            1.7. Үндэс, угсаа:  <label id="labelUndesUgsaa" runat="server" style="width:221px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
            <br />
            1.8. Гэр бүлийн байдал (зөвхөн гэр бүлийн бүртгэлд байгаа хүмүүсийг бичнэ):
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:10%;">Таны юу болох</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:30%;">Гэр бүлийн гишүүний эцэг /эх/-ийн болон өөрийн нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:9%;">Төрсөн он</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:26%;">Төрсөн аймаг, хот, сум, дүүрэг</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Одоо эрхэлж буй ажил</td>
                </tr>
            </tbody>
            <tbody id="dashboardStaffAnketFamily1" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:left; margin: 0;">
            <br />
            1.9. Садан төрлийн байдал (Таны эцэг, эх, төрсөн ах, эгч дүү, өрх тусгаарласан хүүхэд болон таны эхнэр /нөхөр/-ийн эцэг, эхийг оруулна):
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:10%;">Таны юу болох</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:30%;">Садан төрлийн хүний эцэг /эх/-ийн болон өөрийн нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:9%;">Төрсөн он</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:26%;">Төрсөн аймаг, хот, сум, дүүрэг</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Одоо эрхэлж буй ажил</td>
                </tr>
            </tbody>
            <tbody id="dashboardStaffAnketFamily2" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:left; line-height:1.5; margin: 0;">
            <br />
            1.10. Оршин суугаа хаяг:  <label id="labelAddrAimag" runat="server" style="width:150px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>  аймаг, хот  <label id="labelAddrSoum" runat="server" style="width:150px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>  сум, дүүрэг, гэрийн хаяг:  <label id="labelAddrHome" runat="server" style="width:455px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Утасны дугаар:  <label id="labelTel" runat="server" style="width:95px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>&nbsp;&nbsp;&nbsp;<label id="labelTel2" runat="server" style="width:95px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>  Е-майл хаяг:  <label id="labelEmail" runat="server" style="width:150px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label> 
            <br />
            1.11.Зайлшгүй шаардлагатай үед холбоо барих хүн
            <br />
            Нэр  <label id="labelRelName" runat="server" style="width:120px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>&nbsp;&nbsp;&nbsp;<label id="labelRelationName" runat="server" style="width:120px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>/ хэн болох/
            <br />
            <label style="font-weight:bold; margin:0;">Хоёр. Ур чадварын талаарх мэдээлэл</label>
            <br />
            2.1. Төрийн жинхэнэ албаны шалгалтын талаарх мэдээлэл
        </p>     
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:65%; height:40px;">Мэдээллийн агуулга</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Тайлбар</td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Ерөнхий шалгалт өгсөн эсэх </td>
                    <td id="tdIsTuriinAlbaShalgalt" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-style:italic; text-align:center;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Тусгай шалгалт өгсөн эсэх </td>
                    <td id="tdIsTuriinAlbaTusgaiShalgalt" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-style:italic; text-align:center;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Нөөцөд байгаа эсэх </td>
                    <td id="tdIsNuutsud" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-style:italic; text-align:center;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:justify; margin: 0; font-size:11pt;">(* Шалгалт өгсөн эсэх гэсэн хэсэгт ерөнхий болон тусгай шалгалт “өгсөн” гэх, өгөөгүй бол “өгөөгүй” гэж бичнэ).</p>
        <p style="text-align:left; line-height:1.5; margin: 0;">
            <label style="font-weight:bold; margin:0;">Гурав .Боловсролын талаарх мэдээлэл</label>
        </p>
        <p style="text-align:left; line-height:1; margin: 0;">
            3.1. Боловсрол (суурь боловсрол, дипломын дээд боловсрол, бакалавр, магистрын зэргийг оролцуулан)
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:32%;">Сургуулийн нэр*</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:14%;">Орсон он, сар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:14%;">Төгссөн он, сар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:20%;">Эзэмшсэн мэргэжил</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Гэрчилгээ, дипломын дугаар</td>
                </tr>
            </tbody>
            <tbody id="dashboardStaffAnketEducationTable" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:justify; font-size:11pt;">(*Сургуулийн нэрийг бүтэн бичнэ)</p>
        <p style="text-align:left; line-height:1; margin: 0;">
            3.2. Боловсролын болон шинжлэх ухааны докторын зэрэг
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:32%;">Зэрэг</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:25%;">Хамгаалсан газар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:11%;">Он, сар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Гэрчилгээ, дипломын дугаар</td>
                </tr>
            </tbody>
            <tbody id="dashboardStaffAnketPhdTable" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <br />
        <p style="text-align:justify;">
            Боловсролын    доктор    (Ph.D)-ын    зэрэг хамгаалсан сэдэв: <label id="dashboardStaffAnketPhdDesc" runat="server" style="width:605px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';">&nbsp;</label>
        </p>
        <p style="text-align:justify;">
            Шинжлэх ухааны доктор (ScD)-ын зэрэг хамгаалсан сэдэв: <label id="dashboardStaffAnketScdDesc" runat="server" style="width:605px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';">&nbsp;</label>
        </p>
        <p style="text-align:left; line-height:1.5; margin: 0;">
            <label style="font-weight:bold; margin:0;">Дөрөв. Мэргэшлийн талаарх мэдээлэл</label>
        </p>
        <p style="text-align:left; line-height:1; margin: 0;">
            4.1. Мэргэшлийн бэлтгэл <label style="font:italic 11pt 'Arial, Helvetica, sans-serif';"></label>(Мэргэжлээрээ болон бусад чиглэлээр нарийн мэргэшүүлэх багц сургалтанд хамрагдсан байдлыг бичнэ)
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:25%;">Хаана, дотоод, гадаадын ямар байгууллагад</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:16%;">Эхэлсэн дууссан огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:12%;">Хугацаа/хоногоор</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:24%;">Ямар чиглэлээр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Үнэмлэх, гэрчилгээ олгосон огноо</td>
                </tr>
            </tbody>
            <tbody id="dashboardStaffAnketTrainingTable" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:left; line-height:1; margin: 0;">
            <br />
            4.2. Эрдмийн цол /дэд профессор,профессор,академийн гишүүнийг  оролцуулан/
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:30%;">Цол</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:30%;">Цол олгосон байгууллага</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:16%;">Огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Гэрчилгээ, дипломын дугаар</td>
                </tr>
            </tbody>
            <tbody id="dashboardStaffAnketSciencedegreeTable" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <br />
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <th rowspan="2" style="border: none; padding: 2px; text-align:left; vertical-align:top; width:60%;">Тав. Цэргийн алба хаасан эсэх</th>
                    <th style="border: 1px solid #000; padding: 2px; text-align:justify; vertical-align:top; font-size:10pt; width:23%;">Цэргийн алба хаасан</th>
                    <td id="tdMilitaryIsClosed1" runat="server" style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; font-style:italic; text-align:center; font-weight:bold;"></td>
                </tr>
                <tr>
                    <th style="border: 1px solid #000; padding: 2px; text-align:justify; vertical-align:top; font-size:10pt; font-style:italic; text-align:center; font-weight:bold;">Цэргийн алба хаагаагүй</th>
                    <td id="tdMilitaryIsClosed0" runat="server" style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;"></td>
                </tr>
            </tbody>
        </table>
        <br />
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:5%;">Д/д</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:30%;">Цэргийн үүрэгтний үнэмлэхний дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:42%;">Цэргийн алба хаасан байдал</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Тайлбар</td>
                </tr>
            </tbody>
            <tbody id="tbodyMilitary" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:justify; font-size:10pt;">/Цэргийн алба хаасан бол дээрх мэдээллийг бөглөнө/</p>
        <p style="text-align:left; line-height:1; margin: 0; font-weight:bold;">
            Зургаа. Шагналын талаарх мэдээлэл <span style="font:italic 12pt 'Arial, Helvetica, sans-serif';">(Төрийн дээд шагнал, Засгийн газрын шагнал болон салбарын бусад шагналыг бичнэ)</span>
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:16%;">Шагнагдсан огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:27%;">Шагналын нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:30%;">Шийдвэрийн нэр, огноо, дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Шагнуулсан үндэслэл</td>
                </tr>
            </tbody>
            <tbody id="tbodyShagnal" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:left; line-height:1; font-weight:bold;">
            <br />
            Долоо. Туршлагын талаарх мэдээлэл
        </p>
        <p style="text-align:left; line-height:1; margin: 0;">
            7.1. Ажилласан байдал
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Ажилласан байгууллагын нэр*</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:23%;">Газар, хэлтэс, алба</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:21%;">Эрхэлсэн албан тушаал</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:17%;">Ажилд орсон огноо (тушаалын дугаар)</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:17%;">Ажлаас гарсан огноо (тушаалын дугаар)</td>
                </tr>
            </tbody>
            <tbody id="tbodyTurshlaga" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:justify; font-size:11pt;">(*Байгууллагын нэрийг бүтнээр бичнэ).</p>
        <p style="text-align:left; line-height:1; font-weight:bold;">
            Найм. Бүтээлийн жагсаалт
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:5%;">Д/д</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:26%;">Бүтээлийн нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:24%;">Бүтээлийн төрөл</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:19%;">Бүтээл гаргасан огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Тайлбар</td>
                </tr>
            </tbody>
            <tbody id="tbodyButeel" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:top;">1</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:top;">2</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:top;">3</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:justify; font-size:11pt; font-style:italic;"><span style="font-weight:bold;">"Тайлбар"</span> хэсэгт гадаад хэлнээс орчуулсан болон хамтран зохиогчийн тухай тэмдэглэнэ.</p>
        <br />
        <br />
        <br />
        <br />
        <p style="text-align:center;">Анкет үнэн зөв бичсэн:</p>
        <table style="width:100%; border-collapse:collapse; border:none;">
            <tbody>
                <tr>
                    <td style="width:33%; text-align:center;">
                        <label id="labelSignatureLastname" runat="server" style="width:160px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
                        <br />
                        /Эцэг (эх)-ийн нэр/
                    </td>
                    <td style="width:34%; text-align:center;">
                        <label id="labelSignatureFistname" runat="server" style="width:160px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
                        <br />
                        /Өөрийн нэр нэр/
                    </td>
                    <td style="width:33%; text-align:center;">
                        <label style="width:160px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
                        <br />
                        /Гарын үсэг/
                    </td>
                </tr>
            </tbody>
        </table>
        <p style="text-align:center;">
            <br />
            Огноо: <label style="width:120px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label>
        </p>
    </div>
</div>