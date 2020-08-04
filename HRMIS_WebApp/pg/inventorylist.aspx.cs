using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class inventorylist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            CSession sessionClass = new CSession();
            CMain mainClass = new CMain();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                var userData = sessionClass.getCurrentUserData();
                bool boolRoleUser = false;
                for (int i = 0; i < userData.USR_ROLEDATA.Capacity; i++)
                {
                    if (userData.USR_ROLEDATA[i] == 1 || userData.USR_ROLEDATA[i] == 14)
                    {
                        boolRoleUser = true;
                        break;
                    }
                }
                if (!boolRoleUser) throw new cs.HRMISException("Тоологдох эд хөрөнгийн жагсаалт хэсэгт хандах эрх байхгүй байна! Хандах эрхийг ТЗУГ-тай холбогдон авна уу.");
                //string strQry = @"SELECT INV_ID, INV_CODE, INV_NAME, INV_UNIT, PRICE, SUM(END_QUANT) as END_QUANT, SUM(END_TOTAL) as END_TOTAL FROM I_INVENTORY_BALANCE WHERE ORG_ID<>0 AND ORG_ID is not null GROUP BY INV_ID, INV_CODE, INV_NAME, INV_UNIT, PRICE";
                string strQry = @"SELECT INV_ID, INV_CODE, INV_NAME, INV_UNIT, PRICE, END_QUANT, END_TOTAL, INV_TYPE FROM ST_INVENTORYLIST ORDER BY INV_CODE ASC";
                divDatatableTab1.InnerHtml += @"<table id=""tableDatatableTab1"" class=""table table-striped table-bordered table-hover"" width=""100%""><thead><tr><th>#</th><th data-class=""expand"">Код</th><th>Нэр</th><th>Нэгж үнэ</th><th>Тоо/ширхэг</th><th>Нийт үнэ</th><th></th></tr></thead><tbody>";
                //DataSet ds = myObj.OleDBExecuteDataSet(strQry);
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int i = 1;
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        divDatatableTab1.InnerHtml += @"<tr data-invid=""" + dr["INV_ID"].ToString() + @""">
						    <td class=""text-center"">" + i.ToString() + @"</td>
						    <td class=""text-center"">" + dr["INV_CODE"].ToString() + @"</td>
						    <td>" + mainClass.Win1251_To_Iso8859(dr["INV_NAME"].ToString()) + @"</td>
						    <td class=""text-right"" data-price=""" + dr["PRICE"].ToString() + @""">" + Convert.ToDouble(dr["PRICE"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "₮") + @"</td>
						    <td class=""text-center"">" + dr["END_QUANT"].ToString() + @" " + mainClass.Win1251_To_Iso8859(dr["INV_UNIT"].ToString()) + @"</td>
						    <td class=""text-right"">" + Convert.ToDouble(dr["END_TOTAL"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "₮") + @"</td>";
                        //divDatatableTab1.InnerHtml += @"<td><a href=""pg/modal/modalInventoryQRCode.aspx?invid=" + dr["INV_ID"].ToString() + @"&price=" + dr["PRICE"].ToString() + @"&invcode=" + dr["INV_CODE"].ToString() + @""" class=""btn btn-default btn-xs"" data-target=""#myModalInventoryQRCode"" data-toggle=""modal"">QRCode харах</a></td>";
                        divDatatableTab1.InnerHtml += @"<td><button type=""button"" class=""btn btn-default btn-xs btn-show-qrcode"">QRCode харах</a></td>";
                        divDatatableTab1.InnerHtml += @" </tr>";
                        i++;
                    }
                }
                else divDatatableTab1.InnerHtml += "<tr><td colspan=\"7\" class=\"text-center\"><em>Илэрц олдсонгүй...</em></td></tr>";
                divDatatableTab1.InnerHtml += "</tbody></table>";
                //divDatatableTab1.InnerHtml = strContent;
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                //divContentInfoContent.InnerHtml = "";
                divContentInfo.Attributes.Add("class", "row");
                divContentContent.Attributes.Add("class", "well hide");
            }
        }
    }
}