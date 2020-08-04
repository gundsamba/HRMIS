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
    public partial class ptab1t6_2 : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            string strStaffsId = Request.QueryString["id"];
            ptab1t6_2IsgaveT1.Checked = false;
            ptab1t6_2IsgaveT0.Checked = false;
            ptab1t6_2IsswearT1.Checked = false;
            ptab1t6_2IsswearT0.Checked = false;
            ptab1t6_2IsspecialT1.Checked = false;
            ptab1t6_2IsspecialT0.Checked = false;
            ptab1t6_2IsreserveT1.Checked = false;
            ptab1t6_2IsreserveT0.Checked = false;
            ptab1t6_2Testdate.Value = "";
            ds = myObj.OracleExecuteDataSet("SELECT ISGAVE, ISSWEAR, TESTDATE, ISSPECIAL, ISRESERVE FROM ST_STATES WHERE STAFFS_ID=" + strStaffsId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                if (ds.Tables[0].Rows[0]["ISGAVE"].ToString() == "1") ptab1t6_2IsgaveT1.Checked = true;
                else if (ds.Tables[0].Rows[0]["ISGAVE"].ToString() == "0") ptab1t6_2IsgaveT0.Checked = true;
                if (ds.Tables[0].Rows[0]["ISSWEAR"].ToString() == "1") ptab1t6_2IsswearT1.Checked = true;
                else if (ds.Tables[0].Rows[0]["ISSWEAR"].ToString() == "0") ptab1t6_2IsswearT0.Checked = true;
                if (ds.Tables[0].Rows[0]["ISSPECIAL"].ToString() == "1") ptab1t6_2IsspecialT1.Checked = true;
                else if (ds.Tables[0].Rows[0]["ISSPECIAL"].ToString() == "0") ptab1t6_2IsspecialT0.Checked = true;
                if (ds.Tables[0].Rows[0]["ISRESERVE"].ToString() == "1") ptab1t6_2IsreserveT1.Checked = true;
                else if (ds.Tables[0].Rows[0]["ISRESERVE"].ToString() == "0") ptab1t6_2IsreserveT0.Checked = true;
                ptab1t6_2Testdate.Value = ds.Tables[0].Rows[0]["TESTDATE"].ToString();
            }
        }
    }
}