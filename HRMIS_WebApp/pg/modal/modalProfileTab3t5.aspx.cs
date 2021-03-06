﻿using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.modal
{
    public partial class modalProfileTab3t5 : System.Web.UI.Page
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
                    inputDt.Value = "";
                    inputName.Value = "";
                    inputAmt.Value = "";
                    inputTushaalName.Value = "";
                    inputTushaalDate.Value = "";
                    inputTushaalNo.Value = "";
                    inputDesc.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "" && Request.QueryString["staffsid"] != null && Request.QueryString["staffsid"] != "")
                    {
                        spanEditType.InnerHtml = "засах";
                        inputId.Value = Request.QueryString["id"];
                        ds = myObj.OracleExecuteDataSet(@"SELECT ID, STAFFS_ID, DT, ""NAME"", AMT, TUSHAALNAME, TUSHAALNO, TUSHAALDT, ""DESC"" FROM ST_INCENTIVES WHERE ID = " + Request.QueryString["id"] + " AND STAFFS_ID = " + Request.QueryString["staffsid"]);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            inputDt.Value = ds.Tables[0].Rows[0]["DT"].ToString();
                            inputName.Value = ds.Tables[0].Rows[0]["NAME"].ToString();
                            inputAmt.Value = ds.Tables[0].Rows[0]["AMT"].ToString();
                            inputTushaalName.Value = ds.Tables[0].Rows[0]["TUSHAALNAME"].ToString();
                            inputTushaalDate.Value = ds.Tables[0].Rows[0]["TUSHAALNO"].ToString();
                            inputTushaalNo.Value = ds.Tables[0].Rows[0]["TUSHAALDT"].ToString();
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