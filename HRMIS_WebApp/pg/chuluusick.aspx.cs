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
    public partial class chuluusick : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            CMain MainClass = new CMain();
            DataTable dt = new DataTable();
            try
            {
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_CHULUUSICKTYPE");
                pTab1ModalSelectType.DataSource = ds.Tables[0];
                pTab1ModalSelectType.DataTextField = "NAME";
                pTab1ModalSelectType.DataValueField = "ID";
                pTab1ModalSelectType.DataBind();
                dt.Rows.Clear();
                dt = MainClass.getChuluuSickYears();
                pTab1SelectYear.DataSource = dt;
                pTab1SelectYear.DataTextField = "YEAR";
                pTab1SelectYear.DataValueField = "YEAR";
                pTab1SelectYear.DataBind();
                pTab1SelectYear.SelectedIndex = pTab1SelectYear.Items.IndexOf(pTab1SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
                if (!myObjGetTableData.checkRoles(Session["HRMIS_UserID"].ToString(), "1,8")) pTab1AddBtnDiv.Style.Add("display", "none");
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