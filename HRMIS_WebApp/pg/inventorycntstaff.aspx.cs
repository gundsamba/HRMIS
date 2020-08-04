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
    public partial class inventorycntstaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            CSession sessionClass = new CSession();
            CMain mainClass = new CMain();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                var userData = sessionClass.getCurrentUserData();
                inputStaffId.Value = userData.USR_STAFFID.ToString();
                spanStaffInfo.InnerHtml = userData.USR_GAZARINITNAME + "-ын " + userData.USR_POSNAME + " " + userData.USR_LNAME.Substring(0, 1) + "." + userData.USR_FNAME;
                CMain MainClass = new CMain();
                DataTable dt = null;
                dt = MainClass.getInventoryInterval();
                selectInventory.DataSource = dt;
                selectInventory.DataTextField = "NAME";
                selectInventory.DataValueField = "ID";
                selectInventory.DataBind();
                selectInventory.SelectedIndex = 0;
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
        }
    }
}