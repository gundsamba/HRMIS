using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class error500 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else
            {
                var objExData = (ExData)Session["HRMISExData"];
                if (objExData.EX_MESSAGE == "SessionDied" || objExData.EX_MESSAGE == "Invalid operation. The connection is closed.") Response.Redirect("~/login");
                else {
                    if(objExData.EX_MESSAGE.Contains("Хандах эрхийг ТЗУГ-тай холбогдон авна уу")) h1Title.InnerHtml = "<i class=\"fa fa-info-circle text-warning error-icon-shadow\"></i> Хандах эрх";
                    else h1Title.InnerHtml = "<i class=\"fa fa-times-circle text-danger error-icon-shadow\"></i> Алдаа";
                    inputMessage.Value = objExData.EX_MESSAGE;
                    inputStackTrace.Value = objExData.EX_STACKTRACE;
                    errorname.InnerHtml = objExData.EX_MESSAGE;
                }
            }
        }
    }
}