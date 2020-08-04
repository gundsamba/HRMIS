using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class chuluuf3AttachshowModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                chuluuf3AttachshowModalCarousel1.InnerHtml = "<ol class=\"carousel-indicators\"><li data-target=\"#chuluuf3AttachshowModalCarousel1\" data-slide-to=\"0\" class=\"active\"></li></ol><div class=\"carousel-inner\"><div class=\"item active\"><img src=\"../files/chuluuf3/" + myObj.OracleExecuteScalar("SELECT FILENAME FROM ST_CHULUUDAYF3 WHERE ID=" + Request.QueryString["id"]).ToString() + "\" alt=\"\"></div></div><a class=\"left carousel-control\" href=\"#chuluuf3AttachshowModalCarousel1\" data-slide=\"prev\"> <span class=\"glyphicon glyphicon-chevron-left\"></span> </a><a class=\"right carousel-control\" href=\"#chuluuf3AttachshowModalCarousel1\" data-slide=\"next\"> <span class=\"glyphicon glyphicon-chevron-right\"></span> </a>";
            }
            catch (NullReferenceException ex)
            {
            }
            catch (cs.HRMISException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
    }
}