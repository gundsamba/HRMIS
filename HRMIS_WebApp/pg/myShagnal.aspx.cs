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
    public partial class myShagnal : System.Web.UI.Page
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
                spanStaffInfo.InnerHtml = userData.USR_GAZARINITNAME + "-ын " + userData.USR_POSNAME + " " + userData.USR_LNAME.Substring(0, 1) + "." + userData.USR_FNAME;
                string strQry = @"SELECT 
    b.NAME, b.DT, c.NAME as SHAGNALTYPE_NAME, d.NAME as SHAGNALDECISION_NAME, b.ORGDESCRIPTION, b.PRICE, b.GROUND, b.TUSHAALNO, b.TUSHAALDT
FROM ST_SHAGNAL_STAFFS a
INNER JOIN ST_SHAGNAL b ON a.SHAGNAL_ID=b.ID
INNER JOIN STN_SHAGNALTYPE c ON b.SHAGNALTYPE_ID=c.ID
INNER JOIN STN_SHAGNALDECISION d ON b.SHAGNALDECISION_ID=d.ID
WHERE a.STAFFS_ID=" + userData.USR_STAFFID + @" 
ORDER BY b.DT DESC";
                string strContent = @"<table class=""table table-bordered table-striped margin-bottom-0"">
				    <thead>
					    <tr>
						    <th rowspan=""2"" class=""text-center"" style=""width:50px; vertical-align: middle;"">#</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Шагналын нэр</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Огноо</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Шагналын төрөл</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Шийдвэр</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Тодорхойлолт</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Мөнгөн дүн</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Үндэслэл</th>
						    <th colspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Тушаал</th>
					    </tr>
                        <tr>
                            <th class=""text-center"" style=""vertical-align: middle;"">Дугаар</th>
                            <th class=""text-center"" style=""vertical-align: middle;"">Огноо</th>
					    </tr>
				    </thead>
				    <tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int i = 1;
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strContent += @"<tr>
						    <td class=""text-center"">" + i.ToString() + @"</td>
						    <td>" + dr["NAME"].ToString() + @"</td>
						    <td class=""text-center"">" + dr["DT"].ToString() + @"</td>
						    <td>" + dr["SHAGNALTYPE_NAME"].ToString() + @"</td>
						    <td>" + dr["SHAGNALDECISION_NAME"].ToString() + @"</td>
						    <td>" + dr["ORGDESCRIPTION"].ToString() + @"</td>
						    <td class=""text-right"">" + Convert.ToDouble(dr["PRICE"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "₮") + @"</td>
						    <td>" + dr["GROUND"].ToString() + @"</td>
						    <td class=""text-center"">" + dr["TUSHAALNO"].ToString() + @"</td>
						    <td class=""text-center"">" + dr["TUSHAALDT"].ToString() + @"</td>
					    </tr>";
                        i++;
                    }
                }
                else strContent += "<tr><td colspan=\"10\"><em>Илэрц олдсонгүй...</em></td></tr>";
                strContent += "</tbody></table>";
                divTab1TableData.InnerHtml = strContent;

                ds.Clear();
                strQry = @"SELECT 
    c.NAME as POSDEGREEDTL_NAME
    , d.NAME AS RANKPOSDEGREE_NAME
    , b.DECISIONDESC
    , b.DT
    , b.CERTIFICATENO
    , b.UPPER
FROM ST_ZEREGDEV_STAFFS a
INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID=b.ID
INNER JOIN STN_POSDEGREEDTL c ON b.POSDEGREEDTL_ID=c.ID
INNER JOIN STN_RANKPOSDEGREE d ON b.RANKPOSDEGREE_ID=d.ID
WHERE a.STAFFS_ID=" + userData.USR_STAFFID + @" 
ORDER BY b.DT DESC";
                strContent = @"<table class=""table table-bordered table-striped margin-bottom-0"">
				    <thead>
					    <tr>
						    <th rowspan=""2"" class=""text-center"" style=""width:50px; vertical-align: middle;"">#</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Зэрэг дэв</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Ангилал</th>
						    <th colspan=""3"" class=""text-center"" style=""vertical-align: middle;"">Шийдвэр</th>
						    <th rowspan=""2"" class=""text-center"" style=""vertical-align: middle;"">Нэмэгдэл %</th>
					    </tr>
                        <tr>
                            <th class=""text-center"" style=""vertical-align: middle;"">Нэр</th>
                            <th class=""text-center"" style=""vertical-align: middle;"">Дугаар</th>
                            <th class=""text-center"" style=""vertical-align: middle;"">Огноо</th>
					    </tr>
				    </thead>
				    <tbody>";
                ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int i = 1;
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strContent += @"<tr>
						    <td class=""text-center"">" + i.ToString() + @"</td>
						    <td>" + dr["POSDEGREEDTL_NAME"].ToString() + @"</td>
						    <td>" + dr["RANKPOSDEGREE_NAME"].ToString() + @"</td>
						    <td>" + dr["DECISIONDESC"].ToString() + @"</td>
						    <td class=""text-center"">" + dr["CERTIFICATENO"].ToString() + @"</td>
						    <td class=""text-center"">" + dr["DT"].ToString() + @"</td>
						    <td class=""text-center"">" + dr["UPPER"].ToString() + @"%</td>
					    </tr>";
                        i++;
                    }
                }
                else strContent += "<tr><td colspan=\"7\"><em>Илэрц олдсонгүй...</em></td></tr>";
                strContent += "</tbody></table>";
                divTab2TableData.InnerHtml = strContent;
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