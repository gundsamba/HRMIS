using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace HRWebApp.pg
{
    public partial class inventorycnt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
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
                if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                {
                    int value;
                    if (int.TryParse(Request.QueryString["id"], out value)) {
                        ModifyDB myObj = new ModifyDB();
                        DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME, ISACTIVE FROM ST_INVENTORYINTERVAL WHERE ISACTIVE=1 AND ID="+ Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count > 0) {
                            inputMyModalInvIntervalId.Value = Request.QueryString["id"];
                            divIntervalInfo.InnerHtml = "<i class=\"fa-fw fa fa-info\"></i> " + ds.Tables[0].Rows[0]["NAME"].ToString();
                            CMain MainClass = new CMain();
                            DataTable dt = null;
                            dt = MainClass.getBranchList("Сонго...");
                            selectBranch.DataSource = dt;
                            selectBranch.DataTextField = "INITNAME";
                            selectBranch.DataValueField = "ID";
                            selectBranch.DataBind();
                            selectBranch.SelectedIndex = 0;
                            dt.Clear();
                            dt = MainClass.getStaffsWithBranchPos(new List<string>() { "" }, "Сонго...");
                            selectMyModalFromStaff.DataSource = dt;
                            selectMyModalFromStaff.DataTextField = "ST_NAME";
                            selectMyModalFromStaff.DataValueField = "STAFFS_ID";
                            selectMyModalFromStaff.DataBind();
                            selectMyModalFromStaff.SelectedIndex = 0;
                        }
                        else throw new cs.HRMISException("Хуудсын буруу хандалт!");
                    }
                    else throw new cs.HRMISException("Хуудсын буруу хандалт!");
                }
                else throw new cs.HRMISException("Хуудсын буруу хандалт!");

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
        [WebMethod]
        public static string Test(string t) {
            return "Yes";
        }
    }
}