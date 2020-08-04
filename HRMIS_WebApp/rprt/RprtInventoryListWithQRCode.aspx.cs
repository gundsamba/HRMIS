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
    public partial class RprtInventoryListWithQRCode : System.Web.UI.Page
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
                spanReportHeaderDate.InnerHtml = DateTime.Today.ToString("yyyy-MM-dd");
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