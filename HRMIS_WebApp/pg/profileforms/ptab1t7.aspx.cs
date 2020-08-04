using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.profileforms
{
    public partial class ptab1t7 : System.Web.UI.Page
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
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_LANGUAGE");
            pTab1T7Section1ModalSelectLanguage.DataSource = ds.Tables[0];
            pTab1T7Section1ModalSelectLanguage.DataTextField = "NAME";
            pTab1T7Section1ModalSelectLanguage.DataValueField = "ID";
            pTab1T7Section1ModalSelectLanguage.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_GRADE");
            pTab1T7Section1ModalSelectListenGrade.DataSource = ds.Tables[0];
            pTab1T7Section1ModalSelectListenGrade.DataTextField = "NAME";
            pTab1T7Section1ModalSelectListenGrade.DataValueField = "ID";
            pTab1T7Section1ModalSelectListenGrade.DataBind();
            pTab1T7Section1ModalSelectSpeakGrade.DataSource = ds.Tables[0];
            pTab1T7Section1ModalSelectSpeakGrade.DataTextField = "NAME";
            pTab1T7Section1ModalSelectSpeakGrade.DataValueField = "ID";
            pTab1T7Section1ModalSelectSpeakGrade.DataBind();
            pTab1T7Section1ModalSelectReadGrade.DataSource = ds.Tables[0];
            pTab1T7Section1ModalSelectReadGrade.DataTextField = "NAME";
            pTab1T7Section1ModalSelectReadGrade.DataValueField = "ID";
            pTab1T7Section1ModalSelectReadGrade.DataBind();
            pTab1T7Section1ModalSelectWriteGrade.DataSource = ds.Tables[0];
            pTab1T7Section1ModalSelectWriteGrade.DataTextField = "NAME";
            pTab1T7Section1ModalSelectWriteGrade.DataValueField = "ID";
            pTab1T7Section1ModalSelectWriteGrade.DataBind();
            pTab1T7Section2ModalSelectGrade.DataSource = ds.Tables[0];
            pTab1T7Section2ModalSelectGrade.DataTextField = "NAME";
            pTab1T7Section2ModalSelectGrade.DataValueField = "ID";
            pTab1T7Section2ModalSelectGrade.DataBind();
            pTab1T7Section3ModalSelectGrade.DataSource = ds.Tables[0];
            pTab1T7Section3ModalSelectGrade.DataTextField = "NAME";
            pTab1T7Section3ModalSelectGrade.DataValueField = "ID";
            pTab1T7Section3ModalSelectGrade.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_SOFTWARE");
            pTab1T7Section2ModalSelectSoftware.DataSource = ds.Tables[0];
            pTab1T7Section2ModalSelectSoftware.DataTextField = "NAME";
            pTab1T7Section2ModalSelectSoftware.DataValueField = "ID";
            pTab1T7Section2ModalSelectSoftware.DataBind();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_OFFICE");
            pTab1T7Section3ModalSelectOffice.DataSource = ds.Tables[0];
            pTab1T7Section3ModalSelectOffice.DataTextField = "NAME";
            pTab1T7Section3ModalSelectOffice.DataValueField = "ID";
            pTab1T7Section3ModalSelectOffice.DataBind();

            //OracleDataReader rdr = cs.ModifyDB.OracleExecuteReader("SELECT COL, GRADE_ID FROM ST_OFFICE WHERE STAFFS_ID=" + Request.QueryString["id"] + " ORDER BY COL");
            //if (rdr.HasRows)
            //{
            //    while (rdr.Read())
            //    {
            //        switch (Int32.Parse(rdr[0].ToString()))
            //        {
            //            case 1:
            //                if (Int32.Parse(rdr[1].ToString()) == 1) pTab1T7Section3Table1T1.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 2) pTab1T7Section3Table1T2.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 3) pTab1T7Section3Table1T3.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                break;
            //            case 2:
            //                if (Int32.Parse(rdr[1].ToString()) == 1) pTab1T7Section3Table2T1.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 2) pTab1T7Section3Table2T2.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 3) pTab1T7Section3Table2T3.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                break;
            //            case 3:
            //                if (Int32.Parse(rdr[1].ToString()) == 1) pTab1T7Section3Table3T1.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 2) pTab1T7Section3Table3T2.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 3) pTab1T7Section3Table3T3.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                break;
            //            case 4:
            //                if (Int32.Parse(rdr[1].ToString()) == 1) pTab1T7Section3Table4T1.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 2) pTab1T7Section3Table4T2.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 3) pTab1T7Section3Table4T3.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                break;
            //            case 5:
            //                if (Int32.Parse(rdr[1].ToString()) == 1) pTab1T7Section3Table5T1.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 2) pTab1T7Section3Table5T2.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 3) pTab1T7Section3Table5T3.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                break;
            //            case 6:
            //                if (Int32.Parse(rdr[1].ToString()) == 1) pTab1T7Section3Table6T1.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 2) pTab1T7Section3Table6T2.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 3) pTab1T7Section3Table6T3.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                break;
            //            case 7:
            //                if (Int32.Parse(rdr[1].ToString()) == 1) pTab1T7Section3Table7T1.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 2) pTab1T7Section3Table7T2.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                else if (Int32.Parse(rdr[1].ToString()) == 3) pTab1T7Section3Table7T3.InnerHtml = "<i class=\"fa fa-plus\"></i>";
            //                break;
            //        }
            //    }
            //}
            //rdr.Close();
            //cs.ModifyDB.DBDisconnect();
        }
    }
}