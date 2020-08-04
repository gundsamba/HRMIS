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
    public partial class setrole : System.Web.UI.Page
    {
        string userId = "";
        DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_ROLE");
                myObj.DBDisconnect();
                pTab1SelectRole.DataSource = ds.Tables[0];
                pTab1SelectRole.DataTextField = "NAME";
                pTab1SelectRole.DataValueField = "ID";
                pTab1SelectRole.DataBind();
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_POS WHERE ISACTIVE=1");
                myObj.DBDisconnect();
                pTab1SelectPos.DataSource = ds.Tables[0];
                pTab1SelectPos.DataTextField = "NAME";
                pTab1SelectPos.DataValueField = "ID";
                pTab1SelectPos.DataBind();
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR('1-0') as ID, TO_CHAR('Идэвхтэй') as NAME FROM DUAL UNION ALL SELECT '0-'||TO_CHAR(a.MOVETYPE_ID) as ID, TO_CHAR(b.NAME) as NAME FROM STN_MOVE a INNER JOIN STN_MOVETYPE b ON a.MOVETYPE_ID=b.ID WHERE a.ACTIVE=0 GROUP BY a.MOVETYPE_ID, b.NAME");
                myObj.DBDisconnect();
                pTab1SelectType.DataSource = ds.Tables[0];
                pTab1SelectType.DataTextField = "NAME";
                pTab1SelectType.DataValueField = "ID";
                pTab1SelectType.DataBind();
                pTab1SelectType.SelectedIndex = pTab1SelectType.Items.IndexOf(pTab1SelectType.Items.FindByValue("1-0"));

                ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_ROLE ORDER BY ID");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    setroleTab1ModalInputRoles.InnerHtml = "";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        setroleTab1ModalInputRoles.InnerHtml += "<div class=\"checkbox\"><label><input type=\"checkbox\" class=\"checkbox style-0 classCheckedRole\" value=\"" + dr[0].ToString() + "\"><span>" + dr[1].ToString() + "</span></label></div>";
                    }
                }
                myObj.DBDisconnect();
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

            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                userId = HttpContext.Current.Session["HRMIS_UserID"].ToString();
                if (!myObjGetTableData.checkRoles(userId, "1,12"))
                {
                    pIsRole.Style.Add("display", "block");
                    pMainDiv.Style.Add("display", "none");
                }
            }
            catch (cs.HRMISException ex)
            {
                Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                Response.Redirect("../pg/error500.aspx");
            }
            catch (Exception ex)
            {
                Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                Response.Redirect("../pg/error500.aspx");
            }
        }
    }
}