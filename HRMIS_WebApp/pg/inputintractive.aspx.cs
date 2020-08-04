using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class inputintractive : System.Web.UI.Page
    {
        string userId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                userId = HttpContext.Current.Session["HRMIS_UserID"].ToString();
                if (!myObjGetTableData.checkRoles(userId, "1,10"))
                {
                    pIsRole.Style.Add("display", "block");
                    pMainDiv.Style.Add("display", "none");
                }
            }
            catch (cs.HRMISException ex)
            {
                Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                Response.Redirect("../pg/error500.aspx");
            }
            catch (Exception ex)
            {
                Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                Response.Redirect("../pg/error500.aspx");
            }
        }
    }
}