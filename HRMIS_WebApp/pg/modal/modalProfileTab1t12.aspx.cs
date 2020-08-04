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
    public partial class modalProfileTab1t12 : System.Web.UI.Page
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
                    inputName.Value = "";
                    selectType.DataSource = mainClass.getSelfCreatedTypeList("- Сонго -");
                    selectType.DataTextField = "NAME";
                    selectType.DataValueField = "ID";
                    selectType.DataBind();
                    inputDt.Value = "";
                    inputDesc.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                    {
                        inputId.Value = Request.QueryString["id"];
                        ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID, 
    a.NAME, 
    a.SELFCREATED_TYPE_ID, 
    a.DT, 
    a.""DESC"" 
FROM ST_SELFCREATED a
WHERE a.ID = "+ Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            spanEditType.InnerHtml = "засах";
                            inputName.Value = ds.Tables[0].Rows[0]["NAME"].ToString();
                            selectType.SelectedIndex = selectType.Items.IndexOf(selectType.Items.FindByValue(ds.Tables[0].Rows[0]["SELFCREATED_TYPE_ID"].ToString()));
                            inputDt.Value = ds.Tables[0].Rows[0]["DT"].ToString();
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