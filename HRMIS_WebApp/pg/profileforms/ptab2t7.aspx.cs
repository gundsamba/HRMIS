using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.profileforms
{
    public partial class ptab2t7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                string strTableVal = "";
                string straddedit = "0";
                if (myObjGetTableData.checkRoles(Session["HRMIS_UserID"].ToString(), "1,15")) straddedit = "1";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ROWNUM as ROWNO, a.* FROM ( SELECT b.ID, b.BRANCH_ID, a.DOMAIN_USER, b.MOVE_ID, b.POSTYPE_ID, b.POS_ID, b.RANK_ID, b.TUSHAALDATE, b.TUSHAALNO, b.DT, i.NAME as POSTYPE_NAME, f.NAME as POS_NAME, NVL(g.NAME,'-') as RANK_NAME, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, j.NAME||' - '||h.NAME as MOVE_NAME, NVL(b.DESCRIPTION,'-') as DESCRIPTION, b.ISACTIVE FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID LEFT JOIN ST_RANK g ON b.RANK_ID=g.ID INNER JOIN STN_MOVE h ON b.MOVE_ID=h.ID INNER JOIN STN_MOVETYPE j ON h.MOVETYPE_ID=j.ID INNER JOIN STN_POSTYPE i ON b.POSTYPE_ID=i.ID WHERE a.ID=" + Request.QueryString["id"] + " ORDER BY b.DT DESC ) a");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr data-id=\""+dr["ID"].ToString()+"\" data-domainuser=\""+ dr["DOMAIN_USER"].ToString() + "\" data-tushaaldate=\"" + dr["TUSHAALDATE"].ToString() + "\" data-tushaalno=\"" + dr["TUSHAALNO"].ToString() + "\">";
                        strTableVal += "<td>" + dr["ROWNO"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DT"].ToString() + "</td>";
                        strTableVal += "<td data-id=\""+ dr["POSTYPE_ID"].ToString() + "\">" + dr["POSTYPE_NAME"].ToString() + "</td>";
                        strTableVal += "<td data-id=\"" + dr["POS_ID"].ToString() + "\">" + dr["POS_NAME"].ToString() + "</td>";
                        strTableVal += "<td data-id=\"" + dr["RANK_ID"].ToString() + "\">" + dr["RANK_NAME"].ToString() + "</td>";
                        strTableVal += "<td data-id=\"" + dr["BRANCH_ID"].ToString() + "\">" + dr["NEGJ"].ToString() + "</td>";
                        strTableVal += "<td data-id=\"" + dr["MOVE_ID"].ToString() + "\">" + dr["MOVE_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DESCRIPTION"].ToString() + "</td>";
                        strTableVal += "<td>";
                        strTableVal += "<div class=\"btn-group\">";
                        if (straddedit == "1")
                        {
                            strTableVal += "<button type=\"button\" class=\"btn btn-default btn-xs\" onclick=\"showEditTab2t7(this);\" data-target=\"#pTab2t7Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></button>";
                            if (dr["ISACTIVE"].ToString() == "0") strTableVal += "<button type=\"button\" class=\"btn btn-default btn-xs\" onclick=\"showDeleteTab2t7(this);\"><i class=\"fa fa-trash-o\"></i></button>";
                        }
                        strTableVal += "</div>";
                        strTableVal += "</td>";
                        strTableVal += "</tr>";
                    }
                }
                ptab2t7DivTableTbody.InnerHtml = strTableVal;
                
                ds = myObj.OracleExecuteDataSet("SELECT ID, INITNAME, NAME FROM ST_ORG WHERE ISACTIVE=1");
                pTab2t7ModalSelectOrg.DataSource = ds.Tables[0];
                pTab2t7ModalSelectOrg.DataTextField = "NAME";
                pTab2t7ModalSelectOrg.DataValueField = "ID";
                pTab2t7ModalSelectOrg.DataBind();
                pTab2t7ModalSelectOrg.Disabled = true;
                ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID as ID, TO_CHAR(NAME) as NAME FROM STN_POSTYPE");
                pTab2t7ModalSelectPostype.DataSource = ds.Tables[0];
                pTab2t7ModalSelectPostype.DataTextField = "NAME";
                pTab2t7ModalSelectPostype.DataValueField = "ID";
                pTab2t7ModalSelectPostype.DataBind();
                ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_POS WHERE ISACTIVE=1");
                pTab2t7ModalSelectPos.DataSource = ds.Tables[0];
                pTab2t7ModalSelectPos.DataTextField = "NAME";
                pTab2t7ModalSelectPos.DataValueField = "ID";
                pTab2t7ModalSelectPos.DataBind();
            }
            catch (cs.HRMISException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
        }
    }
}