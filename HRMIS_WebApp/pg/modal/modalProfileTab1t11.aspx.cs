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
    public partial class modalProfileTab1t11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else
            {
                GetTableData myObjGetTableData = new GetTableData();
                try
                {
                    spanEditType.InnerHtml = "нэмэх";
                    inputId.Value = "";
                    inputDt.Value = "";
                    inputName.Value = "";
                    inputOrgdescription.Value = "";
                    inputTushaalDt.Value = "";
                    inputTushaalNo.Value = "";
                    inputGround.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                    {
                        inputId.Value = Request.QueryString["id"];
                        ModifyDB myObj = new ModifyDB();
                        DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    ID, 
    DT, 
    NAME,
    ORGDESCRIPTION,
    TUSHAALDT,
    TUSHAALNO,
    GROUND 
FROM ST_BONUS 
WHERE ID=" + Request.QueryString["id"] + @" ORDER BY ID ASC");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            spanEditType.InnerHtml = "засах";
                            inputDt.Value = ds.Tables[0].Rows[0]["DT"].ToString();
                            inputName.Value = ds.Tables[0].Rows[0]["NAME"].ToString();
                            inputOrgdescription.Value = ds.Tables[0].Rows[0]["ORGDESCRIPTION"].ToString();
                            inputTushaalDt.Value = ds.Tables[0].Rows[0]["TUSHAALDT"].ToString();
                            inputTushaalNo.Value = ds.Tables[0].Rows[0]["TUSHAALNO"].ToString();
                            inputGround.Value = ds.Tables[0].Rows[0]["GROUND"].ToString();
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