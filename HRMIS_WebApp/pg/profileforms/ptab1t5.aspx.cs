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
    public partial class ptab1t5 : System.Web.UI.Page
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
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_POSDEGREEDTL");
            pTab1T5Section1ModalSelectPosdegreedtl.DataSource = ds.Tables[0];
            pTab1T5Section1ModalSelectPosdegreedtl.DataTextField = "NAME";
            pTab1T5Section1ModalSelectPosdegreedtl.DataValueField = "ID";
            pTab1T5Section1ModalSelectPosdegreedtl.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_RANKPOSDEGREE");
            pTab1T5Section1ModalSelectRankposdegree.DataSource = ds.Tables[0];
            pTab1T5Section1ModalSelectRankposdegree.DataTextField = "NAME";
            pTab1T5Section1ModalSelectRankposdegree.DataValueField = "ID";
            pTab1T5Section1ModalSelectRankposdegree.DataBind();
        }
    }
}