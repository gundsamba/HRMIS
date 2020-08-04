using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class tomiloltStafflistModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT NVL(b.IMAGE,'male.png'), b.LNAME, b.FNAME, d.NAME, CASE WHEN f.ID=f.FATHER_ID THEN f.INITNAME ELSE g.INITNAME||' - '||f.INITNAME END as NEGJ FROM ST_TOMILOLT_STAFFS a INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID INNER JOIN STN_POS d ON c.POS_ID=d.ID INNER JOIN ST_BRANCH f ON c.BRANCH_ID=f.ID INNER JOIN ST_BRANCH g ON f.FATHER_ID=g.ID WHERE a.TOMILOLT_ID=" + Request.QueryString["id"] + " AND c.ISACTIVE=1 ORDER BY d.SORT, b.LNAME, b.FNAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    tomiloltStafflistModalTableDiv.InnerHtml = "<table class=\"table table-hover table-striped\"><thead><tr><th><i class=\"fa fa-fw fa-file-photo-o text-muted hidden-md hidden-sm hidden-xs\"></i></th><th>Овог</th><th>Нэр</th><th>Албан тушаал</th><th>Харьялагдах нэгж</th></tr></thead><tbody>";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        tomiloltStafflistModalTableDiv.InnerHtml += "<tr><td class=\"no-padding\" style=\"padding-left:5px!important;\"><img src=\"../files/staffs/" + dr[0].ToString() + "\" class=\"stafflistimage\" /></td><td>" + dr[1].ToString() + "</td><td>" + dr[2].ToString() + "</td><td>" + dr[3].ToString() + "</td><td>" + dr[4].ToString() + "</td></tr>";
                    }
                    tomiloltStafflistModalTableDiv.InnerHtml += "</tbody></table>";
                }
            }
            catch (NullReferenceException ex)
            {
            }
            catch (cs.HRMISException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
    }
}