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
    public partial class modalinventoryinterval : System.Web.UI.Page
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
                    inputName.Value = "";
                    inputIsActive1.Checked = false;
                    inputIsActive0.Checked = false;
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                    {
                        inputId.Value = Request.QueryString["id"];
                        ModifyDB myObj = new ModifyDB();
                        DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME, ISACTIVE FROM ST_INVENTORYINTERVAL WHERE ID=" + Request.QueryString["id"] + "");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            spanEditType.InnerHtml = "засах";
                            inputName.Value = ds.Tables[0].Rows[0]["NAME"].ToString();
                            if (ds.Tables[0].Rows[0]["ISACTIVE"].ToString() == "1") inputIsActive1.Checked = true;
                            else inputIsActive0.Checked = true;
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