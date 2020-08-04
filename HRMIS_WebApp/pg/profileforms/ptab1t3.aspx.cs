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
    public partial class ptab1t3 : System.Web.UI.Page
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
            pTab1T3Section1ModalSelectCity.DataSource = ds.Tables[0];
            pTab1T3Section1ModalSelectCity.DataTextField = "NAME";
            pTab1T3Section1ModalSelectCity.DataValueField = "ID";
            pTab1T3Section1ModalSelectCity.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_EDUTP");
            pTab1T3Section1ModalSelectEdutp.DataSource = ds.Tables[0];
            pTab1T3Section1ModalSelectEdutp.DataTextField = "NAME";
            pTab1T3Section1ModalSelectEdutp.DataValueField = "ID";
            pTab1T3Section1ModalSelectEdutp.DataBind();
            pTab1T3Section2ModalSelectEdutp.DataSource = ds.Tables[0];
            pTab1T3Section2ModalSelectEdutp.DataTextField = "NAME";
            pTab1T3Section2ModalSelectEdutp.DataValueField = "ID";
            pTab1T3Section2ModalSelectEdutp.DataBind();
            //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_SCIENCEDEGREE");
            //pTab1T3Section3ModalSelectSciencedegree.DataSource = ds.Tables[0];
            //pTab1T3Section3ModalSelectSciencedegree.DataTextField = "NAME";
            //pTab1T3Section3ModalSelectSciencedegree.DataValueField = "ID";
            //pTab1T3Section3ModalSelectSciencedegree.DataBind();
            int highyr = DateTime.Now.Year;
            int lowyr = DateTime.Now.Year - 110;
            for (highyr = DateTime.Now.Year; highyr >= lowyr; highyr--)
            {
                pTab1T3Section1ModalSelectFromyear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                pTab1T3Section1ModalSelectToyear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                pTab1T3Section2ModalSelectYear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                //pTab1T3Section3ModalSelectYear.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
            }
        }
    }
}