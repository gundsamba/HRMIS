using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HRWebApp.pg
{
    public partial class inventory : System.Web.UI.Page
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
                //                string strQry = @"SELECT a.INV_CODE, a.INV_NAME, a.END_QUANT, a.PRICE, a.END_TOTAL, a.INV_TYPE, a.INV_UNIT
                //FROM I_INVENTORY_BALANCE a
                //INNER JOIN C_ORGANIZATION b ON a.ORG_ID=b.org_id
                //WHERE b.ORG_TYPE=1 AND b.REGISTER_NUMBER = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"'
                //ORDER BY a.INV_NAME ASC";
                string strQry = @"SELECT INV_CODE, INV_NAME, END_QUANT, PRICE, END_TOTAL, INV_TYPE, INV_UNIT
FROM ST_STAFFINVENTORY 
WHERE (REGNO = '" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' OR REGNO='" + userData.USR_REGNO + @"')
ORDER BY INV_NAME ASC";
                string strContent = @"<table class=""table table-bordered table-striped margin-bottom-0"">
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
                //DataSet ds = myObj.OleDBExecuteDataSet(strQry);
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count > 0) {
                    int i = 1;
                    double total = 0;
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strContent += @"<tr>
						    <td class=""text-center"">"+i.ToString()+ @"</td>
						    <td class=""text-center"">" + dr["INV_CODE"].ToString() + @"</td>
						    <td>" + mainClass.Win1251_To_Iso8859(dr["INV_NAME"].ToString()) + @"</td>
						    <td class=""text-center"">" + dr["END_QUANT"].ToString() + @" "+ mainClass.Win1251_To_Iso8859(dr["INV_UNIT"].ToString()) + @"</td>
						    <td class=""text-right"">" + Convert.ToDouble(dr["PRICE"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "₮") + @"</td>
						    <td class=""text-right"">" + Convert.ToDouble(dr["END_TOTAL"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$","₮") + @"</td>
					    </tr>";
                        total += Convert.ToDouble(dr["END_TOTAL"].ToString());
                        i++;
                    }
                    strContent += "<tr><th colspan=\"5\" class=\"text-center\">Нийт</th><th class=\"text-right\">"+ total.ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "₮") + "</th></tr>";
                }
                else strContent += "<tr><td colspan=\"6\"><em>Одоогоор бүртгэлтэй хөрөнгө байхгүй байна...</em></td></tr>";
                strContent += "</tbody></table>";
                divTableData.InnerHtml = strContent;
                spanStaffInfo.InnerHtml = userData.USR_GAZARINITNAME + "-ын " + userData.USR_POSNAME + " "+userData.USR_LNAME.Substring(0, 1) + "." + userData.USR_FNAME;
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                //divContentInfoContent.InnerHtml = "";
                divContentInfo.Attributes.Add("class","row");
                divContentContent.Attributes.Add("class", "well hide");
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