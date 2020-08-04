using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class inventorycntinterval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else
            {
                GetTableData myObjGetTableData = new GetTableData();
                try
                {
                    CSession sessionClass = new CSession();
                    var userData = sessionClass.getCurrentUserData();
                    bool boolRoleUser = false;
                    for (int i = 0; i < userData.USR_ROLEDATA.Capacity; i++)
                    {
                        if (userData.USR_ROLEDATA[i] == 1 || userData.USR_ROLEDATA[i] == 14)
                        {
                            boolRoleUser = true;
                            break;
                        }
                    }
                    if (!boolRoleUser) throw new cs.HRMISException("Эд хөрөнгийн тоолох хэсэгт хандах эрх байхгүй байна! Хандах эрхийг ТЗУГ-тай холбогдон авна уу.");
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
}