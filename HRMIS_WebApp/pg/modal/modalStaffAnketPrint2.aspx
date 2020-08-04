<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modalStaffAnketPrint2.aspx.cs" Inherits="HRWebApp.pg.modal.modalStaffAnketPrint2" %>
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
        <p style="text-align:right; font-style:italic;">Төрийн албаны зөвлөлийн  2019  оны 01 дүгээр<br />сарын 31-ний  өдрийн 05 дугаар тогтоолын<br />гуравдугаар  хавсралт</p>
        <br />
        <p style="text-align:right; font-weight:bold;">Маягт 2</p>
        <p style="text-align:center; font-weight:bold; text-transform:uppercase;">ТӨРИЙН АЛБАН ХААГЧИЙН АНКЕТ  “Б ХЭСЭГ”</p>
        <p style="text-align:left;">Албан хаагчийн эцэг(эх)-ийн нэр <label id="labelLastname" runat="server" style="width:133px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label> өөрийн нэр <label id="labelFirstname" runat="server" style="width:133px; border-bottom:1px dotted #000; text-align:center; margin: 0;display: inline-block; font:italic bold 12pt 'Arial, Helvetica, sans-serif';"></label> </p>
        <p style="font-weight:bold;">Нэг. Албан тушаалын карт</p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:center; vertical-align:middle; width:5%;">1</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:middle;">Байгууллагын нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:middle; width:55%; font-weight:bold; font-style:italic;">Сангийн яам</td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;">2</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Нэгжийн нэр</td>
                    <td id="tdBranchName" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-weight:bold; font-style:italic;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;">3</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Албан тушаалын нэр</td>
                    <td id="tdPositionName" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-weight:bold; font-style:italic;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;">4</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Албан тушаалын ангилал</td>
                    <td id="tdPositionAngilal" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-weight:bold; font-style:italic;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;">5</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Албан тушаалын зэрэглэл</td>
                    <td id="tdPositionZereglel" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-weight:bold; font-style:italic;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;">6</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Албан тушаал бий болгосон шийдвэрийн нэр</td>
                    <td id="tdPositionTushaalNo" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-weight:bold; font-style:italic;"></td>
                </tr>
                <tr>
                    <td style="border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;">7</td>
                    <td style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;">Албан тушаал бий болгосон огноо</td>
                    <td id="tdPositionTushaalDate" runat="server" style="border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top; font-weight:bold; font-style:italic;"></td>
                </tr>
            </tbody>
        </table>
        <p style="font-weight:bold;"><br />Хоёр. Албан тушаалын томилгоо:</p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:5%;">Д/д</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:24%;">Томилогдсон албан тушаалын нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:21%;">Томилсон огноо, шийдвэрийн нэр, дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:21%;">Өөрчилсөн огноо, шийдвэрийн нэр, дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Өөрчилсөн шалтгаан</td>
                </tr>
            </tbody>
            <tbody id="tbodyTomilgoo" runat="server">
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
            </tbody>
        </table>
        <p style="font-weight:bold;"><br />Гурав. Албан тушаалын зэрэг дэв, цол:</p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:25%;">Албан тушаалын ангилал, зэрэглэл</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:27%;">Зэрэг дэв, цолны нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:21%;">Шийдвэрийн огноо, дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Үнэмлэхийн дугаар</td>
                </tr>
            </tbody>
            <tbody id="tbodyZeregDev" runat="server">
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
        <p style="font-weight:bold;">
            <br />Дөрөв. Цалин хөлсний талаарх мэдээлэл
            <br /><span style="font-weight:normal; font-style:italic; font-size:10pt;">(Төрийн албаны тухай хуулийн 57 дугаар зүйлийн 57.2-т заасан цалин хөлсийг бичнэ)</span>
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr style="font-size:11pt;">
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:7%;" rowspan="2">Он</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;" colspan="6">Цалин хөлс /мян.төг/</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;" rowspan="2">Тайлбар</td>
                </tr>
                <tr style="font-size:10pt;">
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:13%;">Албан тушаалын</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:15%;">Онцгой нөхцөлийн нэмэгдэл</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:15%;">Төрийн алба хаасан хугацааны нэмэгдэл</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:12%;">Зэрэг дэвийн нэмэгдэл</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:13%;">Цолны нэмэгдэл</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:10%;">Бусад</td>
                </tr>
            </tbody>
            <tbody id="tbodyAnketSalary" runat="server">
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;">&nbsp;</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
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
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:left; vertical-align:top;"></td>
                </tr>
            </tbody>
        </table>
        <p style="font-size:10pt; font-style:italic;"><span style="font-weight:bold;">"Тайлбар"</span> хэсэгт цалин хөлсийг өөрчилсөн үндэслэл, шийдвэрийн нэр, огноог бичнэ.</p>
        <p style="font-weight:bold;">
            Тав. Урамшууллын талаарх мэдээлэл
            <br /><span style="font-weight:normal; font-style:italic; font-size:10pt;">(Төрийн албаны тухай хуулийн 51 дугаар зүйлийн 51.1, 51.4-т заасан урамшууллыг бичнэ)</span>
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:17%;">Урамшуулал авсан огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:29%;">Урамшууллын нэр, мөнгөн дүн /мян.төг/</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:26%;">Шийдвэрийн нэр, огноо, дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Урамшуулсан үндэслэл</td>
                </tr>
            </tbody>
            <tbody id="tbodyUramshuulal" runat="server">
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
        <p style="font-weight:bold;">
            <br />Зургаа. Нөхөх төлбөрийн талаарх мэдээлэл
            <br /><span style="font-weight:normal; font-style:italic; font-size:10pt;">(Төрийн албаны тухай хуулийн 59 дугаар зүйлийн 59.1, 59.8-д заасан нөхөх төлбөрийг бичнэ)</span>
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:18%;">Нөхөх төлбөр олгосон огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:30%;">Нөхөх төлбөрийн нэр, мөнгөн дүн /мян.төг/</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:26%;">Шийдвэрийн нэр, огноо, дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Нөхөх төлбөр олгосон үндэслэл</td>
                </tr>
            </tbody>
            <tbody id="tbodyNuhuhtulbur" runat="server">
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
        <p style="font-weight:bold; text-align:justify;">
            <br />Долоо. Шийтгэлийн талаарх мэдээлэл
            <br /><span style="font-weight:normal; font-style:italic; font-size:10pt;">(Төрийн албаны тухай хуулийн 48 дугаар зүйлийн 48.1-д буюу уг хуулийн 37, 39 дүгээр зүйлд заасныг болон 40 дүгээр зүйлийн 40.1, 40.2-т заасны дагуу эрх бүхий байгууллагаас тогтоосон төрийн албан хаагчийн ёс зүйн хэм хэмжээг зөрчсөний улмаас ногдуулсан сахилгын шийтгэлийг бичнэ)</span>
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:19%;">Байгууллагын нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:28%;">Шийтгэл ногдуулсан албан тушаалтан</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:25%;">Шийдвэрийн нэр, огноо, дугаар</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Юуны учир, ямар шийтгэл ногдуулсан*</td>
                </tr>
            </tbody>
            <tbody id="tbodyShiitgel" runat="server">
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
        <p style="font-size:10pt; font-style:italic; text-align:justify;">(*Төрийн албаны тухай хуулийн 48 дугаар зүйлийн 48.6-д заасныг үндэслэн сахилгын шийтгэлгүйд тооцсон тухай энэ хэсэгт бичиж болно).</p>
        <p style="font-weight:bold; text-align:justify;">
            Найм. Хувийн хэргийг мэдэллийг хянасан, баяжуулсан тухай бүртгэл
        </p>
        <table style="width:100%; border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:19%;">Мэдээллийн агуулга</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:17%;">Баяжуулалт хийсэн огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:25%;">Хянаж, баяжуулалт хийсэн албан тушаалтны нэр</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle; width:15%;">Баяжилт хийсэн огноо</td>
                    <td style="border: 1px solid #000; padding: 2px; text-align:center; vertical-align:middle;">Тайлбар</td>
                </tr>
            </tbody>
            <tbody id="tbodyHuviinHereg" runat="server">
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
