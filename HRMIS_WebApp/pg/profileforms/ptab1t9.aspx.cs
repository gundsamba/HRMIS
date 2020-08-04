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
    public partial class ptab1t9 : System.Web.UI.Page
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
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_INNOIMPLTYPE");
            pTab1T9Section1ModalSelectImpltype.DataSource = ds.Tables[0];
            pTab1T9Section1ModalSelectImpltype.DataTextField = "NAME";
            pTab1T9Section1ModalSelectImpltype.DataValueField = "ID";
            pTab1T9Section1ModalSelectImpltype.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_COUNTRY");
            pTab1T9Section2ModalSelectCountry.DataSource = ds.Tables[0];
            pTab1T9Section2ModalSelectCountry.DataTextField = "NAME";
            pTab1T9Section2ModalSelectCountry.DataValueField = "ID";
            pTab1T9Section2ModalSelectCountry.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_CONDITIONTYPE");
            pTab1T9Section3ModalSelectConditiontype.DataSource = ds.Tables[0];
            pTab1T9Section3ModalSelectConditiontype.DataTextField = "NAME";
            pTab1T9Section3ModalSelectConditiontype.DataValueField = "ID";
            pTab1T9Section3ModalSelectConditiontype.DataBind();
            int highyr = DateTime.Now.Year;
            int lowyr = DateTime.Now.Year - 110;
            for (highyr = DateTime.Now.Year; highyr >= lowyr; highyr--)
            {
                pTab1T9Section3ModalSelectYear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
            }
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_CAUSE");
            pTab1T9Section4ModalSelectCause.DataSource = ds.Tables[0];
            pTab1T9Section4ModalSelectCause.DataTextField = "NAME";
            pTab1T9Section4ModalSelectCause.DataValueField = "ID";
            pTab1T9Section4ModalSelectCause.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_DECIDE");
            pTab1T9Section4ModalSelectDecide.DataSource = ds.Tables[0];
            pTab1T9Section4ModalSelectDecide.DataTextField = "NAME";
            pTab1T9Section4ModalSelectDecide.DataValueField = "ID";
            pTab1T9Section4ModalSelectDecide.DataBind();
        }
    }
}