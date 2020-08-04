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
    public partial class modalProfileTab3t3 : System.Web.UI.Page
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
                    inputTbl.Value = "";
                    selectPosDegree.DataSource = mainClass.getRankPosDegreeList("- Сонго -");
                    selectPosDegree.DataTextField = "NAME";
                    selectPosDegree.DataValueField = "ID";
                    selectPosDegree.DataBind();
                    selectRank.DataSource = mainClass.getRankList("- Сонго -");
                    selectRank.DataTextField = "NAME";
                    selectRank.DataValueField = "ID";
                    selectRank.DataBind();
                    selectPosDegreedtl.DataSource = mainClass.getPosDegreeDtlList("- Сонго -");
                    selectPosDegreedtl.DataTextField = "NAME";
                    selectPosDegreedtl.DataValueField = "ID";
                    selectPosDegreedtl.DataBind();
                    inputTsolName.Value = "";
                    inputDecisionDate.Value = "";
                    inputCertificateNo.Value = "";
                    inputUnemlehNo.Value = "";
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "" && Request.QueryString["staffsid"] != null && Request.QueryString["staffsid"] != "" && Request.QueryString["tbl"] != null && Request.QueryString["tbl"] != "")
                    {
                        inputId.Value = Request.QueryString["id"];
                        inputTbl.Value = Request.QueryString["tbl"];
                        if (Request.QueryString["tbl"] == "ST_ZEREGDEV_STAFFS")
                        {
                            ds = myObj.OracleExecuteDataSet(@"SELECT a.ZEREGDEV_ID as ID, a.STAFFS_ID, b.RANKPOSDEGREE_ID, a.RANK_ID, b.POSDEGREEDTL_ID, a.TSOLNAME, b.DT as DECISIONDATE, b.CERTIFICATENO, a.UNEMLEHNO
    FROM ST_ZEREGDEV_STAFFS a
    INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID = b.ID
    INNER JOIN STN_POSDEGREEDTL c ON b.POSDEGREEDTL_ID = c.ID
    INNER JOIN STN_RANKPOSDEGREE d ON b.RANKPOSDEGREE_ID = d.ID
    LEFT JOIN ST_RANK e ON a.RANK_ID=e.ID
  WHERE b.ID = " + Request.QueryString["id"] + " AND a.STAFFS_ID = " + Request.QueryString["staffsid"]);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                selectPosDegree.SelectedIndex = selectPosDegree.Items.IndexOf(selectPosDegree.Items.FindByValue(ds.Tables[0].Rows[0]["RANKPOSDEGREE_ID"].ToString()));
                                selectRank.SelectedIndex = selectRank.Items.IndexOf(selectRank.Items.FindByValue(ds.Tables[0].Rows[0]["RANK_ID"].ToString()));
                                selectPosDegreedtl.SelectedIndex = selectPosDegreedtl.Items.IndexOf(selectPosDegreedtl.Items.FindByValue(ds.Tables[0].Rows[0]["POSDEGREEDTL_ID"].ToString()));
                                inputTsolName.Value = ds.Tables[0].Rows[0]["TSOLNAME"].ToString();
                                inputDecisionDate.Value = ds.Tables[0].Rows[0]["DECISIONDATE"].ToString();
                                inputCertificateNo.Value = ds.Tables[0].Rows[0]["CERTIFICATENO"].ToString();
                                inputUnemlehNo.Value = ds.Tables[0].Rows[0]["UNEMLEHNO"].ToString();
                            }
                        }
                        else if (Request.QueryString["tbl"] == "ST_JOBTITLEDEGREE")
                        {
                            ds = myObj.OracleExecuteDataSet(@"SELECT a.ID, a.STAFFS_ID, a.RANKPOSDEGREE_ID, a.RANK_ID, a.POSDEGREEDTL_ID, a.TSOLNAME, a.DECISIONDATE, a.CERTIFICATENO, a.UNEMLEHNO
    FROM ST_JOBTITLEDEGREE a
    INNER JOIN STN_POSDEGREEDTL b ON a.POSDEGREEDTL_ID = b.ID
    INNER JOIN STN_RANKPOSDEGREE c ON a.RANKPOSDEGREE_ID = c.ID
    LEFT JOIN ST_RANK e ON a.RANK_ID=e.ID
  WHERE a.ID = " + Request.QueryString["id"] + " AND a.STAFFS_ID = " + Request.QueryString["staffsid"]);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                selectPosDegree.SelectedIndex = selectPosDegree.Items.IndexOf(selectPosDegree.Items.FindByValue(ds.Tables[0].Rows[0]["RANKPOSDEGREE_ID"].ToString()));
                                selectRank.SelectedIndex = selectRank.Items.IndexOf(selectRank.Items.FindByValue(ds.Tables[0].Rows[0]["RANK_ID"].ToString()));
                                selectPosDegreedtl.SelectedIndex = selectPosDegreedtl.Items.IndexOf(selectPosDegreedtl.Items.FindByValue(ds.Tables[0].Rows[0]["POSDEGREEDTL_ID"].ToString()));
                                inputTsolName.Value = ds.Tables[0].Rows[0]["TSOLNAME"].ToString();
                                inputDecisionDate.Value = ds.Tables[0].Rows[0]["DECISIONDATE"].ToString();
                                inputCertificateNo.Value = ds.Tables[0].Rows[0]["CERTIFICATENO"].ToString();
                                inputUnemlehNo.Value = ds.Tables[0].Rows[0]["UNEMLEHNO"].ToString();
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