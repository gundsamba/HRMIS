using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.rprt
{
    public partial class RprtStaffChuluuDayT2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            CMain MainClass = new CMain();
            GetTableData myObjGetTableData = new GetTableData();
            DataTable dt = null;
            CSession sessionClass = new CSession();
            try
            {
                var userData = sessionClass.getCurrentUserData();
                bool boolRoleUser = false;
                for (int i = 0; i < userData.USR_ROLEDATA.Capacity; i++)
                {
                    if (userData.USR_ROLEDATA[i] == 1 || userData.USR_ROLEDATA[i] == 18)
                    {
                        boolRoleUser = true;
                        break;
                    }
                }
                if (!boolRoleUser) throw new cs.HRMISException("Тайлангийн хэсэгт хандах эрх байхгүй байна! Хандах эрхийг ТЗУГ-тай холбогдон авна уу.");
                dt = MainClass.getBranchList("Бүгд");
                selectFilterTab1Branch.DataSource = dt;
                selectFilterTab1Branch.DataTextField = "INITNAME";
                selectFilterTab1Branch.DataValueField = "ID";
                selectFilterTab1Branch.DataBind();
                selectFilterTab1Branch.SelectedIndex = 0;
                dt.Rows.Clear();
                dt = MainClass.getChuluuDayT2Years();
                selectFilterTab1Year.DataSource = dt;
                selectFilterTab1Year.DataTextField = "YEAR";
                selectFilterTab1Year.DataValueField = "YEAR";
                selectFilterTab1Year.DataBind();
                selectFilterTab1Year.SelectedIndex = selectFilterTab1Year.Items.IndexOf(selectFilterTab1Year.Items.FindByValue(DateTime.Now.Year.ToString()));
                dt.Rows.Clear();
                dt = MainClass.getChuluuReason("Бүгд");
                selectFilterTab1Reason.DataSource = dt;
                selectFilterTab1Reason.DataTextField = "NAME";
                selectFilterTab1Reason.DataValueField = "ID";
                selectFilterTab1Reason.DataBind();
                selectFilterTab1Reason.SelectedIndex = 0;
                spanReportHeaderDate.InnerHtml = DateTime.Today.ToString("yyyy-MM-dd");
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