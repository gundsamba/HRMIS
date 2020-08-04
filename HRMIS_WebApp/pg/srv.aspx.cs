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
    public partial class srv : System.Web.UI.Page
    {
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
                DataSet ds = myObjGetTableData.getUserInfo(Session["HRMIS_UserID"].ToString());
                for (int i = 0; i < ds.Tables[0].Rows[0]["ROLELISTID"].ToString().Split(',').Length; i++) {
                    if (ds.Tables[0].Rows[0]["ROLELISTID"].ToString().Split(',')[i].ToString() == "1" || ds.Tables[0].Rows[0]["ROLELISTID"].ToString().Split(',')[i].ToString() == "15") {
                        pTab2Li.Attributes["class"] = "pull-right";
                        pTab3Li.Attributes["class"] = "pull-right";
                    }
                }
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                throw ex;
            }
        }
    }
}