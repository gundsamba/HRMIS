using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class srvTab1ResultShowModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            string strVal = "", strChartVal="";
            int i = 1;
            string[] strColor = new string[10]          { "#356e35", "#6e3671", "#ac5287", "#568a89", "#4c4f53", "#a90329", "#a57225", "#c79121", "#496949", "#a8829f" };
            string[] strColorHighlight = new string[10] { "#71843f", "#6e587a", "#a8829f", "#57889c", "#92a2a8", "#a65858", "#b09b5b", "#b09b5b", "#71843f", "#a8829f" };
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                srvTab1ResultShowModalTitle.InnerHtml = myObj.OracleExecuteScalar("SELECT TITLE FROM ST_SRVQUESTION WHERE ID="+ Request.QueryString["id"]).ToString();
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT a.ID, a.NAME, COUNT(b.STAFFS_ID) as CNT
FROM ST_SRVANSWER a
LEFT JOIN ST_SRVRESULT b ON a.ID = b.SRVANSWER_ID
WHERE a.SRVQUESTION_ID = "+Request.QueryString["id"]+@"
GROUP BY a.ID, a.NAME
ORDER BY a.ID");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    strVal += "<table class=\"table table-bordered\"><thead><tr>";
                    strVal += "<th class=\"text-center\">#</th>";
                    strVal += "<th class=\"text-center\">Асуулгын хариулт</th>";
                    strVal += "<th class=\"text-center\">Саналын тоо</th>";
                    strVal += "</tr></thead><tbody>";
                    strChartVal += "[";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strVal += "<tr data-id=\""+ dr["ID"].ToString() + "\">";
                        strVal += "<td class=\"text-center\">" + i.ToString()+"</td>";
                        strVal += "<td>"+dr["NAME"].ToString()+"</td>";
                        strVal += "<td class=\"text-center\">"+dr["CNT"].ToString()+"</td>";
                        strVal += "</tr>";
                        if (strChartVal != "[") strChartVal += ",";
                        strChartVal += "{\"value\": \"" + dr["CNT"].ToString() + "\",\"color\": \"" + strColor[i-1] + "\",\"highlight\": \"" + strColorHighlight[i-1] + ")\",\"label\": \"" + dr["NAME"].ToString() + "\"}";
                        i++;
                    }
                    strVal += "</tbody></table>";
                    strChartVal += "]";
                }
                resultTable.InnerHtml = strVal;
                pieChartVal.InnerHtml = strChartVal;
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
        }
    }
}