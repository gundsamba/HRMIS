using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.profileforms
{
    public partial class ptab1t10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            DataSet ds = null;
            string strStaffsId = Request.QueryString["id"];
            ptab1t10IsCloseT1.Checked = false;
            ptab1t10IsCloseT0.Checked = false;
            ds = myObj.OracleExecuteDataSet("SELECT MILITARY_ISCLOSED FROM ST_STAFFS WHERE ID=" + strStaffsId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                if (ds.Tables[0].Rows[0]["MILITARY_ISCLOSED"].ToString() == "1") ptab1t10IsCloseT1.Checked = true;
                else if (ds.Tables[0].Rows[0]["MILITARY_ISCLOSED"].ToString() == "0") ptab1t10IsCloseT0.Checked = true;
            }
        }
    }
}