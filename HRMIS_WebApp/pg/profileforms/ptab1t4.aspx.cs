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
    public partial class ptab1t4 : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_STUDYLOCATION");
            pTab1T4Section1ModalSelectStudylocation.DataSource = ds.Tables[0];
            pTab1T4Section1ModalSelectStudylocation.DataTextField = "NAME";
            pTab1T4Section1ModalSelectStudylocation.DataValueField = "ID";
            pTab1T4Section1ModalSelectStudylocation.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_STUDYTIME");
            pTab1T4Section1ModalSelectStudytime.DataSource = ds.Tables[0];
            pTab1T4Section1ModalSelectStudytime.DataTextField = "NAME";
            pTab1T4Section1ModalSelectStudytime.DataValueField = "ID";
            pTab1T4Section1ModalSelectStudytime.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_SCIENCEDEGREE");
            pTab1T3Section3ModalSelectSciencedegree.DataSource = ds.Tables[0];
            pTab1T3Section3ModalSelectSciencedegree.DataTextField = "NAME";
            pTab1T3Section3ModalSelectSciencedegree.DataValueField = "ID";
            pTab1T3Section3ModalSelectSciencedegree.DataBind();
        }
    }
}