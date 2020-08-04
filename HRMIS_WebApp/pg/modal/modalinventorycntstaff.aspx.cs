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
    public partial class modalinventorycntstaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else
            {
                GetTableData myObjGetTableData = new GetTableData();
                ModifyDB myObj = new ModifyDB();
                try
                {
                    if (Request.QueryString["intervalid"] != null && Request.QueryString["intervalid"] != "" && Request.QueryString["staffid"] != null && Request.QueryString["staffid"] != "" && Request.QueryString["invid"] != null && Request.QueryString["invid"] != "" && Request.QueryString["invprice"] != null && Request.QueryString["invprice"] != "")
                    {
                        inputId.Value = "";
                        inputIntervalId.Value = Request.QueryString["intervalid"];
                        inputStaffId.Value = Request.QueryString["staffid"];
                        inputInvId.Value = Request.QueryString["invid"];
                        inputInvPrice.Value = Request.QueryString["invprice"];
                        inputMyModalDescription.Value = "";
                        string strQry = @"SELECT * FROM ST_STAFFINVENTORY_INVDESC
WHERE INVENTORYINTERVAL_ID=" + Request.QueryString["intervalid"] + " AND STAFFS_ID="+ Request.QueryString["staffid"] + " AND INVENTORY_INV_ID=" + Request.QueryString["invid"] + " AND INVENTORY_PRICE=" + Request.QueryString["invprice"] + "";
                        DataSet ds = myObj.OracleExecuteDataSet(strQry);
                        spanModifyType.InnerHtml = "нэмэх";
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            spanModifyType.InnerHtml = "засах";
                            inputId.Value = ds.Tables[0].Rows[0]["ID"].ToString();
                            inputMyModalDescription.Value = ds.Tables[0].Rows[0]["DESC"].ToString();
                        }
                    }
                    else Response.Redirect("~/");
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