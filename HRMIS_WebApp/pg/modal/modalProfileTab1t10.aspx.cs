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
    public partial class modalProfileTab1t10 : System.Web.UI.Page
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
                    inputCertificateNo.Value = "";
                    inputSituation.Value = "";
                    inputDesc.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                    {
                        inputId.Value = Request.QueryString["id"];
                        ModifyDB myObj = new ModifyDB();
                        DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, CERTIFICATENO, SITUATION, \"DESC\" FROM ST_MILITARY WHERE ID=" + Request.QueryString["id"] + " ORDER BY ID ASC");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            spanEditType.InnerHtml = "засах";
                            inputCertificateNo.Value = ds.Tables[0].Rows[0]["CERTIFICATENO"].ToString();
                            inputSituation.Value = ds.Tables[0].Rows[0]["SITUATION"].ToString();
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