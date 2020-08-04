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
    public partial class trainingreq : System.Web.UI.Page
    {
        string userId = "", currentYear = "";
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
            try
            {
                userId = Session["HRMIS_UserID"].ToString();
                currentYear = DateTime.Now.Year.ToString();
                pTab1SelectYear.SelectedIndex = pTab1SelectYear.Items.IndexOf(pTab1SelectYear.Items.FindByValue(currentYear));
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_TRAININGREQTYPE");
                myObj.DBDisconnect();
                pTab1SelectType.DataSource = ds.Tables[0];
                pTab1SelectType.DataTextField = "NAME";
                pTab1SelectType.DataValueField = "ID";
                pTab1SelectType.DataBind();
                pTab1ModalSelectType.DataSource = ds.Tables[0];
                pTab1ModalSelectType.DataTextField = "NAME";
                pTab1ModalSelectType.DataValueField = "ID";
                pTab1ModalSelectType.DataBind();
                pTab1ModalDivStaff.InnerHtml = myObj.OracleExecuteScalar(@"SELECT CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||'-'||c.INITNAME END||' | '||f.NAME||' | '||SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,1,1)||LOWER(SUBSTR(a.FNAME,2)) as ST_NAME 
FROM ST_STAFFS a
INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
INNER JOIN ST_BRANCH c ON b.BRANCH_ID = c.ID AND c.ISACTIVE = 1
INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID AND d.ISACTIVE = 1
INNER JOIN STN_POS f ON b.POS_ID = f.ID
WHERE a.ID = " + userId).ToString();
                pTab1ModalPrintLabelDate.InnerHtml = DateTime.Now.ToString("yyyy-MM-dd");
            }
            catch (cs.HRMISException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
        }
    }
}