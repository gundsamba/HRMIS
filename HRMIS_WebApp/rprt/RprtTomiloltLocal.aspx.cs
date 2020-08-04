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
    public partial class RprtTomiloltLocal : System.Web.UI.Page
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
                dt = MainClass.getTomiloltDirection("Бүгд");
                selectFilterTab1Direction.DataSource = dt;
                selectFilterTab1Direction.DataTextField = "NAME";
                selectFilterTab1Direction.DataValueField = "ID";
                selectFilterTab1Direction.DataBind();
                selectFilterTab1Direction.SelectedIndex = 0;
                selectFilterTab2Direction.DataSource = dt;
                selectFilterTab2Direction.DataTextField = "NAME";
                selectFilterTab2Direction.DataValueField = "ID";
                selectFilterTab2Direction.DataBind();
                selectFilterTab2Direction.SelectedIndex = 0;
                dt.Rows.Clear();
                dt = MainClass.getTomiloltBudget("Бүгд");
                selectFilterTab1Budget.DataSource = dt;
                selectFilterTab1Budget.DataTextField = "NAME";
                selectFilterTab1Budget.DataValueField = "ID";
                selectFilterTab1Budget.DataBind();
                selectFilterTab1Budget.SelectedIndex = 0;
                selectFilterTab2Budget.DataSource = dt;
                selectFilterTab2Budget.DataTextField = "NAME";
                selectFilterTab2Budget.DataValueField = "ID";
                selectFilterTab2Budget.DataBind();
                selectFilterTab2Budget.SelectedIndex = 0;
                dt.Rows.Clear();
                dt = MainClass.getBranchList("Бүгд");
                selectFilterTab2Branch.DataSource = dt;
                selectFilterTab2Branch.DataTextField = "INITNAME";
                selectFilterTab2Branch.DataValueField = "ID";
                selectFilterTab2Branch.DataBind();
                selectFilterTab2Branch.SelectedIndex = 0;
                inputFilterTab1BeginDate.Value = DateTime.Today.AddYears(-1).ToString("yyyy-MM-dd");
                inputFilterTab1EndDate.Value = DateTime.Today.ToString("yyyy-MM-dd");
                inputFilterTab2BeginDate.Value = DateTime.Today.AddMonths(-6).ToString("yyyy-MM-dd");
                inputFilterTab2EndDate.Value = DateTime.Today.ToString("yyyy-MM-dd");
                spanReportHeaderDate.InnerHtml = DateTime.Today.ToString("yyyy-MM-dd");
                spanTab2ReportHeaderDate.InnerHtml = DateTime.Today.ToString("yyyy-MM-dd");
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