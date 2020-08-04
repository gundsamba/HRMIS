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
    public partial class salarysettingsModal2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else
            {
                GetTableData myObjGetTableData = new GetTableData();
                ModifyDB myObj = new ModifyDB();
                try
                {
                    if (Request.QueryString["coltype"] == null || (Request.QueryString["coltype"] != "1" && Request.QueryString["coltype"] != "2"))
                    {
                        Response.Redirect("~/");
                    }
                    else
                    {
                        selectColType.SelectedIndex = selectColType.Items.IndexOf(selectColType.Items.FindByValue(Request.QueryString["coltype"]));
                        spanModifyType.InnerHtml = "нэмэх";
                        inputId.Value = "";
                        inputColName.Value = "";
                        inputColName.Attributes.Add("disabled","disabled");
                        inputColName.Attributes.Add("placeholder", "Баганы нэр систем автоматаар өгнө...");
                        inputCalculate.Value = "";
                        inputName.Value = "";
                        radioIsActive1.Checked = false;
                        radioIsActive0.Checked = false;
                        DataSet ds = null;
                        ds = myObj.OracleExecuteDataSet("SELECT ID, COLNAME, NAME FROM ST_SALARYCOL WHERE ISACTIVE=1 ORDER BY COLNAME ASC");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string strContent = string.Empty;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strContent += "<li style=\"padding:5px 10px;\"><strong>"+ dr["COLNAME"].ToString() + "</strong> " + dr["NAME"].ToString() + "</li>";
                            }
                            dropdownTab2List.InnerHtml += strContent;
                        }
                        if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                        {
                            string strQry = @"SELECT 
    a.ID
    , a.COLNAME
    , a.NAME
    , a.CALCULATE
    , a.ISACTIVE
    , b.SALARYCOL_REL_IDS
FROM ST_SALARYCOL a
LEFT JOIN ( 
    SELECT SALARYCOL_ID, RTRIM(xmlagg (xmlelement (e, SALARYCOL_REL_ID || ',')).extract('//text()'), ',') as SALARYCOL_REL_IDS FROM ST_SALARYCOL_REL GROUP BY SALARYCOL_ID
) b ON a.ID=b.SALARYCOL_ID
WHERE a.ID=" + Request.QueryString["id"];
                            ds.Clear();
                            ds = myObj.OracleExecuteDataSet(strQry);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                spanModifyType.InnerHtml = "засах";
                                inputId.Value = ds.Tables[0].Rows[0]["ID"].ToString();
                                inputColName.Value = ds.Tables[0].Rows[0]["COLNAME"].ToString();
                                inputCalculate.Value = ds.Tables[0].Rows[0]["NAME"].ToString();
                                inputName.Value = ds.Tables[0].Rows[0]["CALCULATE"].ToString();
                                if(ds.Tables[0].Rows[0]["ISACTIVE"].ToString() == "1") radioIsActive1.Checked = true;
                                else radioIsActive0.Checked = true;
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