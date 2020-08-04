using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMIS_WebApp.pg.modal
{
    public partial class modalProfileTab3t4 : System.Web.UI.Page
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
                    int lowyr = 1900;
                    for (int highyr = DateTime.Now.Year; highyr >= lowyr; highyr--)
                    {
                        selectYr.Items.Add(new ListItem(highyr.ToString(), highyr.ToString()));
                    }
                    inputD1.Value = "";
                    inputD2.Value = "";
                    inputD3.Value = "";
                    inputD4.Value = "";
                    inputD5.Value = "";
                    inputD6.Value = "";
                    inputDesc.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "" && Request.QueryString["staffsid"] != null && Request.QueryString["staffsid"] != "")
                    {
                        spanEditType.InnerHtml = "засах";
                        inputId.Value = Request.QueryString["id"];
                        ds = myObj.OracleExecuteDataSet(@"SELECT ID, STAFFS_ID, YR, D1, D2, D3, D4, D5, D6, ""DESC"" FROM ST_ANKETSALARY WHERE ID = " + Request.QueryString["id"] + " AND STAFFS_ID = " + Request.QueryString["staffsid"]);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            selectYr.SelectedIndex = selectYr.Items.IndexOf(selectYr.Items.FindByValue(ds.Tables[0].Rows[0]["YR"].ToString()));
                            inputD1.Value = ds.Tables[0].Rows[0]["D1"].ToString();
                            inputD2.Value = ds.Tables[0].Rows[0]["D2"].ToString();
                            inputD3.Value = ds.Tables[0].Rows[0]["D3"].ToString();
                            inputD4.Value = ds.Tables[0].Rows[0]["D4"].ToString();
                            inputD5.Value = ds.Tables[0].Rows[0]["D5"].ToString();
                            inputD6.Value = ds.Tables[0].Rows[0]["D6"].ToString();
                            inputDesc.Value = ds.Tables[0].Rows[0]["DESC"].ToString();
                        }
                    }
                }
                catch (HRWebApp.cs.HRMISException ex)
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