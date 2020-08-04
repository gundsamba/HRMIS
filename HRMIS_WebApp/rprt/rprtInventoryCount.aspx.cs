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
    public partial class rprtInventoryCount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            GetTableData myObjGetTableData = new GetTableData();
            CMain mainClass = new CMain();
            DataTable dt = null;
            ModifyDB myObj = new ModifyDB();
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
                dt = mainClass.getInventoryAccountTypeList("Á¿ãä");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt.Rows[i]["ACCOUNT_NAME"] = mainClass.Win1251_To_Iso8859(dt.Rows[i]["ACCOUNT_NAME"].ToString());
                }
                selectFilterTab1AccountType.DataSource = dt;
                selectFilterTab1AccountType.DataTextField = "ACCOUNT_NAME";
                selectFilterTab1AccountType.DataValueField = "ACCOUNT_CODE";
                selectFilterTab1AccountType.DataBind();
                selectFilterTab1AccountType.SelectedIndex = 0;
                dt.Rows.Clear();
                dt = mainClass.getInventoryInterval("Сонго...");
                selectFilterTab1InventoryInterval.DataSource = dt;
                selectFilterTab1InventoryInterval.DataTextField = "NAME";
                selectFilterTab1InventoryInterval.DataValueField = "ID";
                selectFilterTab1InventoryInterval.DataBind();
                selectFilterTab2InventoryInterval.DataSource = dt;
                selectFilterTab2InventoryInterval.DataTextField = "NAME";
                selectFilterTab2InventoryInterval.DataValueField = "ID";
                selectFilterTab2InventoryInterval.DataBind();
                selectFilterTab3InventoryInterval.DataSource = dt;
                selectFilterTab3InventoryInterval.DataTextField = "NAME";
                selectFilterTab3InventoryInterval.DataValueField = "ID";
                selectFilterTab3InventoryInterval.DataBind();
                DataSet ds = myObj.OracleExecuteDataSet("SELECT MAX(ID) as ID FROM ST_INVENTORYINTERVAL");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    selectFilterTab1InventoryInterval.SelectedIndex = selectFilterTab1InventoryInterval.Items.IndexOf(selectFilterTab1InventoryInterval.Items.FindByValue(ds.Tables[0].Rows[0]["ID"].ToString()));
                    selectFilterTab2InventoryInterval.SelectedIndex = selectFilterTab2InventoryInterval.Items.IndexOf(selectFilterTab2InventoryInterval.Items.FindByValue(ds.Tables[0].Rows[0]["ID"].ToString()));
                    selectFilterTab3InventoryInterval.SelectedIndex = selectFilterTab3InventoryInterval.Items.IndexOf(selectFilterTab3InventoryInterval.Items.FindByValue(ds.Tables[0].Rows[0]["ID"].ToString()));
                }
                else {
                    selectFilterTab1InventoryInterval.SelectedIndex = 0;
                    selectFilterTab2InventoryInterval.SelectedIndex = 0;
                    selectFilterTab3InventoryInterval.SelectedIndex = 0;
                }
                dt.Rows.Clear();
                dt = mainClass.getBranchList();
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
                List<string> tempList = new List<string>();
                tempList.Add(userData.USR_HELTESID.ToString());
                dt = mainClass.getStaffsWithPos(tempList, "Бүгд");
                selectFilterTab2Staff.DataSource = dt;
                selectFilterTab2Staff.DataTextField = "ST_NAME";
                selectFilterTab2Staff.DataValueField = "STAFFS_ID";
                selectFilterTab2Staff.DataBind();
                selectFilterTab2Staff.SelectedIndex = 0;
                selectFilterTab3Staff.DataSource = dt;
                selectFilterTab3Staff.DataTextField = "ST_NAME";
                selectFilterTab3Staff.DataValueField = "STAFFS_ID";
                selectFilterTab3Staff.DataBind();
                selectFilterTab3Staff.SelectedIndex = 0;
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
                //myObjGetTableData.exeptionMethod(ex);
                //throw ex;
                divMainContent.Attributes.Add("class", "hide");
                divMainInfo.Attributes.Add("class", "row");
            }
        }
    }
}