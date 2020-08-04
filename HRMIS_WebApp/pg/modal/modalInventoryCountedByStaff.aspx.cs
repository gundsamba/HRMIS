using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.modal
{
    public partial class modalInventoryCountedByStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else
            {
                GetTableData myObjGetTableData = new GetTableData();
                CSession sessionClass = new CSession();
                ModifyDB myObj = new ModifyDB();
                CMain mainClass = new CMain();
                try
                {
                    var userData = sessionClass.getCurrentUserData();
                    spanStaffInfo.InnerHtml = userData.USR_GAZARINITNAME + "-ын " + userData.USR_POSNAME + " " + userData.USR_LNAME.Substring(0, 1) + "." + userData.USR_FNAME;
                    DataSet ds = myObj.OracleExecuteDataSet("SELECT INVENTORY_INV_CODE, INVENTORY_INV_NAME, INVENTORY_INV_UNIT, INVENTORY_PRICE, SUM(INVENTORY_PRICE) as INVENTORY_PRICE_TOTAL, COUNT(1) as CNT FROM ST_INVENTORYCOUNT WHERE INVENTORYINTERVAL_ID="+ Request.QueryString["pIntervalId"] + " AND STAFFS_ID=" + Request.QueryString["pStaffId"] + " GROUP BY INVENTORY_INV_CODE, INVENTORY_INV_NAME, INVENTORY_INV_UNIT, INVENTORY_PRICE");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        divTableData.InnerHtml += @"<table class=""table table-bordered table-striped margin-bottom-0"">
				    <thead>
					    <tr>
						    <th class=""text-center"" style=""width:50px;"">#</th>
						    <th class=""text-center"" style=""width:130px;"">Хөрөнгийн код</th>
						    <th class=""text-center"">Хөрөнгийн нэр</th>
						    <th class=""text-center"" style=""width:100px;"">Тоо/ширхэг</th>
						    <th class=""text-center"" style=""width:150px;"">Нэгж үнэ</th>
						    <th class=""text-center"" style=""width:150px;"">Нийт үнэ</th>
					    </tr>
				    </thead>
				    <tbody>";
                        int i = 1;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            divTableData.InnerHtml += @"<tr>
						    <td class=""text-center"">" + i.ToString() + @"</td>
						    <td class=""text-center"">" + dr["INVENTORY_INV_CODE"].ToString() + @"</td>
						    <td>" + dr["INVENTORY_INV_NAME"].ToString() + @"</td>
						    <td class=""text-center"">" + dr["CNT"].ToString() + @" " + dr["INVENTORY_INV_UNIT"].ToString() + @"</td>
						    <td class=""text-right"">" + Convert.ToDouble(dr["INVENTORY_PRICE"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "₮") + @"</td>
						    <td class=""text-right"">" + Convert.ToDouble(dr["INVENTORY_PRICE_TOTAL"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "₮") + @"</td>
					    </tr>";
                            i++;
                        }
                        divTableData.InnerHtml += "</tbody></table>";
                    }
                    else divTableData.InnerHtml = " <h5><em>Илэрц олдсонгүй...</em></h5>";
                }
                catch (cs.HRMISException ex)
                {
                    myObjGetTableData.exeptionMethod(ex);
                    throw ex;
                }
                catch (Exception ex)
                {
                    myObjGetTableData.exeptionMethod(ex);
                    throw ex;
                }
            }
        }
    }
}