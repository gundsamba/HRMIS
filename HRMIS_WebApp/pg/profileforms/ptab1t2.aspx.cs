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
    public partial class ptab1t2 : System.Web.UI.Page
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
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_CITY");
            pTab1T2SectionsModalSelectBcity.DataSource = ds.Tables[0];
            pTab1T2SectionsModalSelectBcity.DataTextField = "NAME";
            pTab1T2SectionsModalSelectBcity.DataValueField = "ID";
            pTab1T2SectionsModalSelectBcity.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_RELATION");
            pTab1T2SectionsModalSelectRelation.DataSource = ds.Tables[0];
            pTab1T2SectionsModalSelectRelation.DataTextField = "NAME";
            pTab1T2SectionsModalSelectRelation.DataValueField = "ID";
            pTab1T2SectionsModalSelectRelation.DataBind();
            int highyr = DateTime.Now.Year;
            int lowyr = DateTime.Now.Year-110;
            for (highyr = DateTime.Now.Year; highyr >= lowyr; highyr--)
            {
                pTab1T2SectionsModalSelectByear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
            }
        }
    }
}