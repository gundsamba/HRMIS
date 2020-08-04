using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.modal
{
    public partial class modalProfileTab3t8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else
            {
                GetTableData myObjGetTableData = new GetTableData();
                ModifyDB myObj = new ModifyDB();
                CMain mainClass = new CMain();
                try
                {
                    DataSet ds = null;
                    spanEditType.InnerHtml = "нэмэх";
                    inputId.Value = "";
                    inputContentName.Value = "";
                    inputUpdatedDate1.Value = "";
                    inputUpdatedPersonName.Value = "";
                    inputUpdatedDate2.Value = "";
                    inputDesc.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "" && Request.QueryString["staffsid"] != null && Request.QueryString["staffsid"] != "")
                    {
                        spanEditType.InnerHtml = "засах";
                        inputId.Value = Request.QueryString["id"];
                        ds = myObj.OracleExecuteDataSet(@"SELECT ID, STAFFS_ID, CONTENTNAME, UPDATEDT1, UPDATEDPERSONNAME, UPDATEDT2, ""DESC"" FROM ST_ANKETMONITOR WHERE ID = " + Request.QueryString["id"] + " AND STAFFS_ID = " + Request.QueryString["staffsid"]);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            inputContentName.Value = ds.Tables[0].Rows[0]["CONTENTNAME"].ToString();
                            inputUpdatedDate1.Value = ds.Tables[0].Rows[0]["UPDATEDT1"].ToString();
                            inputUpdatedPersonName.Value = ds.Tables[0].Rows[0]["UPDATEDPERSONNAME"].ToString();
                            inputUpdatedDate2.Value = ds.Tables[0].Rows[0]["UPDATEDT2"].ToString();
                            inputDesc.Value = ds.Tables[0].Rows[0]["DESC"].ToString();
                        }
                    }
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