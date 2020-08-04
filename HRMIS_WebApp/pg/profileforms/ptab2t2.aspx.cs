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
    public partial class ptab2t2 : System.Web.UI.Page
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
            ds = myObj.OracleExecuteDataSet("SELECT ID, INITNAME, NAME FROM ST_ORG WHERE ISACTIVE=1");
            pTab1ModalSelectOrg.DataSource = ds.Tables[0];
            pTab1ModalSelectOrg.DataTextField = "NAME";
            pTab1ModalSelectOrg.DataValueField = "ID";
            pTab1ModalSelectOrg.DataBind();
            pTab1ModalSelectOrg.Disabled = true;
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID as ID, TO_CHAR(NAME) as NAME FROM STN_POSTYPE");
            pTab1ModalSelectPostype.DataSource = ds.Tables[0];
            pTab1ModalSelectPostype.DataTextField = "NAME";
            pTab1ModalSelectPostype.DataValueField = "ID";
            pTab1ModalSelectPostype.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_POS WHERE ISACTIVE=1");
            pTab1ModalSelectPos.DataSource = ds.Tables[0];
            pTab1ModalSelectPos.DataTextField = "NAME";
            pTab1ModalSelectPos.DataValueField = "ID";
            pTab1ModalSelectPos.DataBind();
        }
    }
}