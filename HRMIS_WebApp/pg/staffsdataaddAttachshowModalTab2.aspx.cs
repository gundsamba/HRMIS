using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class staffsdataaddAttachshowModalTab2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                staffsdataaddAttachshowModalCarousel1.InnerHtml = "<ol class=\"carousel-indicators\"><li data-target=\"#tomiloltAttachshowModalCarousel1\" data-slide-to=\"0\" class=\"active\"></li></ol><div class=\"carousel-inner\"><div class=\"item active\"><img src=\"../files/shagnaltushaal/" + myObj.OracleExecuteScalar("SELECT FILENAME FROM ST_ZEREGDEV WHERE ID=" + Request.QueryString["id"]).ToString() + "\" alt=\"\"></div></div><a class=\"left carousel-control\" href=\"#tomiloltAttachshowModalCarousel1\" data-slide=\"prev\"> <span class=\"glyphicon glyphicon-chevron-left\"></span> </a><a class=\"right carousel-control\" href=\"#tomiloltAttachshowModalCarousel1\" data-slide=\"next\"> <span class=\"glyphicon glyphicon-chevron-right\"></span> </a>";
            }
            catch (NullReferenceException ex)
            {
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