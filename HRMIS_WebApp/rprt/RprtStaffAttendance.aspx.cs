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
    public partial class RprtStaffAttendance : System.Web.UI.Page
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
                dt = MainClass.getBranchList();
                selectFilterTab2Branch.DataSource = dt;
                selectFilterTab2Branch.DataTextField = "INITNAME";
                selectFilterTab2Branch.DataValueField = "ID";
                selectFilterTab2Branch.DataBind();
                selectFilterTab2Branch.SelectedIndex = selectFilterTab2Branch.Items.IndexOf(selectFilterTab2Branch.Items.FindByValue(userData.USR_HELTESID.ToString()));
                selectFilterTab3Branch.DataSource = dt;
                selectFilterTab3Branch.DataTextField = "INITNAME";
                selectFilterTab3Branch.DataValueField = "ID";
                selectFilterTab3Branch.DataBind();
                selectFilterTab3Branch.SelectedIndex = selectFilterTab3Branch.Items.IndexOf(selectFilterTab3Branch.Items.FindByValue(userData.USR_HELTESID.ToString()));
                dt.Rows.Clear();
                dt = MainClass.getAttendancedYears();
                selectFilterTab1Year.DataSource = dt;
                selectFilterTab1Year.DataTextField = "YEAR";
                selectFilterTab1Year.DataValueField = "YEAR";
                selectFilterTab1Year.DataBind();
                selectFilterTab1Year.SelectedIndex = selectFilterTab1Year.Items.IndexOf(selectFilterTab1Year.Items.FindByValue(DateTime.Now.Year.ToString()));
                selectFilterTab2Year.DataSource = dt;
                selectFilterTab2Year.DataTextField = "YEAR";
                selectFilterTab2Year.DataValueField = "YEAR";
                selectFilterTab2Year.DataBind();
                selectFilterTab2Year.SelectedIndex = selectFilterTab2Year.Items.IndexOf(selectFilterTab2Year.Items.FindByValue(DateTime.Now.Year.ToString()));
                selectFilterTab3Year.DataSource = dt;
                selectFilterTab3Year.DataTextField = "YEAR";
                selectFilterTab3Year.DataValueField = "YEAR";
                selectFilterTab3Year.DataBind();
                selectFilterTab3Year.SelectedIndex = selectFilterTab3Year.Items.IndexOf(selectFilterTab3Year.Items.FindByValue(DateTime.Now.Year.ToString()));
                selectFilterTab1Month.SelectedIndex = selectFilterTab1Month.Items.IndexOf(selectFilterTab1Month.Items.FindByValue(DateTime.Now.Month.ToString()));
                selectFilterTab2MonthBegin.SelectedIndex = selectFilterTab2MonthBegin.Items.IndexOf(selectFilterTab2MonthBegin.Items.FindByValue(DateTime.Now.Month.ToString()));
                selectFilterTab2MonthEnd.SelectedIndex = selectFilterTab2MonthEnd.Items.IndexOf(selectFilterTab2MonthEnd.Items.FindByValue(DateTime.Now.Month.ToString()));
                selectFilterTab3MonthBegin.SelectedIndex = selectFilterTab3MonthBegin.Items.IndexOf(selectFilterTab3MonthBegin.Items.FindByValue(DateTime.Now.Month.ToString()));
                selectFilterTab3MonthEnd.SelectedIndex = selectFilterTab3MonthEnd.Items.IndexOf(selectFilterTab3MonthEnd.Items.FindByValue(DateTime.Now.Month.ToString()));
                dt.Rows.Clear();
                List<string> tempList = new List<string>();
                tempList.Add(userData.USR_HELTESID.ToString());
                dt = MainClass.getStaffsWithPos(tempList, "Бүгд");
                selectFilterTab2Staff.DataSource = dt;
                selectFilterTab2Staff.DataTextField = "ST_NAME";
                selectFilterTab2Staff.DataValueField = "STAFFS_ID";
                selectFilterTab2Staff.DataBind();
                selectFilterTab2Staff.SelectedIndex = 0;
                dt.Rows.Clear();
                dt = MainClass.getStaffsWithPos(tempList);
                selectFilterTab3Staff.DataSource = dt;
                selectFilterTab3Staff.DataTextField = "ST_NAME";
                selectFilterTab3Staff.DataValueField = "STAFFS_ID";
                selectFilterTab3Staff.DataBind();
                selectFilterTab3Staff.SelectedIndex = selectFilterTab3Staff.Items.IndexOf(selectFilterTab3Staff.Items.FindByValue(userData.USR_STAFFID.ToString()));
                dt.Rows.Clear();
                spanReportHeaderDate.InnerHtml = DateTime.Today.ToString("yyyy-MM-dd");
                spanReportHeaderDate2.InnerHtml = DateTime.Today.ToString("yyyy-MM-dd");
                spanReportHeaderDate3.InnerHtml = DateTime.Today.ToString("yyyy-MM-dd");
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