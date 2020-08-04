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
    public partial class modalProfileTab3t2 : System.Web.UI.Page
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
                    inputId.Value = "";
                    inputTbl.Value = "";
                    inputTitle.Value = "";
                    inputDt.Value = "";
                    inputTushaalNo.Value = "";
                    inputTushaalName.Value = "";
                    inputChangedTushaalDate.Value = "";
                    inputChangedTushaalNo.Value = "";
                    inputChangedTushaalName.Value = "";
                    inputChangedReason.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "" && Request.QueryString["staffsid"] != null && Request.QueryString["staffsid"] != "" && Request.QueryString["tbl"] != null && Request.QueryString["tbl"] != "")
                    {
                        inputId.Value = Request.QueryString["id"];
                        inputTbl.Value = Request.QueryString["tbl"];
                        if (Request.QueryString["tbl"] == "ST_EXPHISTORY") {
                            ds = myObj.OracleExecuteDataSet(@"SELECT
    a.ID 
    , a.TITLE 
    , a.FROMDATE 
    , a.FROMTUSHAALNAME 
    , a.FROMTUSHAALNO
    , a.CHANGEDFROMTUSHAALDATE 
    , a.CHANGEDFROMTUSHAALNAME 
    , a.CHANGEDFROMTUSHAALNO 
    , a.CHANGEDFROMREASON 
  FROM ST_EXPHISTORY a 
  WHERE a.ID = " + Request.QueryString["id"]);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                inputTitle.Value = ds.Tables[0].Rows[0]["TITLE"].ToString();
                                inputDt.Value = ds.Tables[0].Rows[0]["FROMDATE"].ToString();
                                inputTushaalNo.Value = ds.Tables[0].Rows[0]["FROMTUSHAALNO"].ToString();
                                inputTushaalName.Value = ds.Tables[0].Rows[0]["FROMTUSHAALNAME"].ToString();
                                inputChangedTushaalDate.Value = ds.Tables[0].Rows[0]["CHANGEDFROMTUSHAALDATE"].ToString();
                                inputChangedTushaalNo.Value = ds.Tables[0].Rows[0]["CHANGEDFROMTUSHAALNO"].ToString();
                                inputChangedTushaalName.Value = ds.Tables[0].Rows[0]["CHANGEDFROMTUSHAALNAME"].ToString();
                                inputChangedReason.Value = ds.Tables[0].Rows[0]["CHANGEDFROMREASON"].ToString();
                            }
                        }
                        else if (Request.QueryString["tbl"] == "ST_STBR")
                        {
                            ds = myObj.OracleExecuteDataSet(@"SELECT
    a.ID
    , f.NAME
    , a.DT
    , a.TUSHAALNAME
    , a.TUSHAALNO
    , a.CHANGEDTUSHAALDATE
    , a.CHANGEDTUSHAALNAME
    , a.CHANGEDTUSHAALNO
    , a.CHANGEDREASON
  FROM ST_STBR a
  INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
  INNER JOIN ST_BRANCH c ON a.BRANCH_ID = c.ID
  INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID
  INNER JOIN STN_POS f ON a.POS_ID = f.ID
  WHERE  a.ID = " + Request.QueryString["id"]);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                inputTitle.Value = ds.Tables[0].Rows[0]["NAME"].ToString();
                                inputDt.Value = ds.Tables[0].Rows[0]["DT"].ToString();
                                inputTushaalNo.Value = ds.Tables[0].Rows[0]["TUSHAALNO"].ToString();
                                inputTushaalName.Value = ds.Tables[0].Rows[0]["TUSHAALNAME"].ToString();
                                inputChangedTushaalDate.Value = ds.Tables[0].Rows[0]["CHANGEDTUSHAALDATE"].ToString();
                                inputChangedTushaalNo.Value = ds.Tables[0].Rows[0]["CHANGEDTUSHAALNO"].ToString();
                                inputChangedTushaalName.Value = ds.Tables[0].Rows[0]["CHANGEDTUSHAALNAME"].ToString();
                                inputChangedReason.Value = ds.Tables[0].Rows[0]["CHANGEDREASON"].ToString();
                            }
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