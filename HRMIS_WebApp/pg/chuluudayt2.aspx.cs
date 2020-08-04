using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class chuluudayt2 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            CMain MainClass = new CMain();
            try
            {
                OracleDataReader rdr = myObj.OracleExecuteReader("SELECT a.IMAGE, CASE WHEN i.ACTIVE=1 AND i.SHOW=1 THEN TO_CHAR(h.NAME) WHEN i.ACTIVE=1 AND i.SHOW=0 THEN 'Идэвхтэй' ELSE TO_CHAR(j.NAME) END AS TP, i.COLOR, CASE WHEN a.GENDER=1 THEN '<i class=\"fa fa-male\"></i> Эрэгтэй<br />' ELSE '<i class=\"fa fa-female\"></i> Эмэгтэй<br />' END as GENDER,  NVL(TO_CHAR(trunc(months_between(sysdate,to_date(a.BDATE,'YYYY-MM-DD'))/12)),'-') as AGE,  a.FNAME, a.LNAME, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, f.NAME as POS_NAME, a.TEL||CASE WHEN TEL is not null THEN ', '||TEL2 END as TEL, a.EMAIL, g.NAME||NVL2(g.NAME,', ','')||h.NAME||NVL2(h.NAME,', ','')||a.ADDRESSNAME as ADDRESSNAME, a.REGNO, a.CITNO, a.SOCNO, a.HEALNO FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID LEFT JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID LEFT JOIN STN_DIST h ON a.ADDRDIST_ID=h.ID INNER JOIN STN_MOVE i ON b.MOVE_ID=i.ID INNER JOIN STN_MOVETYPE j ON i.MOVETYPE_ID=j.ID WHERE a.ID=" + Session["HRMIS_UserID"].ToString());
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        if (rdr[0].ToString() != "") pTab1ModalImage.Src = "../files/staffs/" + rdr[0].ToString();
                        pTab1ModalDivStaffDet.InnerHtml = "<h1 class=\"no-margin\"><span class=\"semi-bold\">" + rdr[5].ToString() + "</span> " + rdr[6].ToString() + "<br><small>" + rdr[7].ToString() + " | " + rdr[8].ToString() + "</small><h1>";
                    }
                }
                rdr.Close();
                myObj.DBDisconnect();

                dt.Rows.Clear();
                dt.Load(myObj.OracleExecuteReader("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_CHULUUREASON"));
                myObj.DBDisconnect();
                pTab1ModalSelectReason.DataSource = dt;
                pTab1ModalSelectReason.DataTextField = "NAME";
                pTab1ModalSelectReason.DataValueField = "ID";
                pTab1ModalSelectReason.DataBind();
                dt.Rows.Clear();
                dt = MainClass.getChuluuDayT2Years();
                pTab1SelectYear.DataSource = dt;
                pTab1SelectYear.DataTextField = "YEAR";
                pTab1SelectYear.DataValueField = "YEAR";
                pTab1SelectYear.DataBind();
                pTab1SelectYear.SelectedIndex = pTab1SelectYear.Items.IndexOf(pTab1SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
            }
            catch (NullReferenceException ex)
            {

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