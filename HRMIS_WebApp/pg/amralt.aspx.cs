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
    public partial class amralt : System.Web.UI.Page
    {
        DataSet ds;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string strMyVal = "";
                pTab1ID.InnerHtml = Session["HRMIS_UserID"].ToString();
                ds = myObj.OracleExecuteDataSet("SELECT a.IMAGE, CASE WHEN i.ACTIVE=1 AND i.SHOW=1 THEN TO_CHAR(h.NAME) WHEN i.ACTIVE=1 AND i.SHOW=0 THEN 'Идэвхтэй' ELSE TO_CHAR(j.NAME) END AS TP, i.COLOR, CASE WHEN a.GENDER=1 THEN '<i class=\"fa fa-male\"></i> Эрэгтэй<br />' ELSE '<i class=\"fa fa-female\"></i> Эмэгтэй<br />' END as GENDER,  NVL(TO_CHAR(trunc(months_between(sysdate,to_date(a.BDATE,'YYYY-MM-DD'))/12)),'-') as AGE,  a.FNAME, a.LNAME, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, f.NAME as POS_NAME, a.TEL||CASE WHEN TEL is not null THEN ', '||TEL2 END as TEL, a.EMAIL, g.NAME||NVL2(g.NAME,', ','')||h.NAME||NVL2(h.NAME,', ','')||a.ADDRESSNAME as ADDRESSNAME, a.REGNO, a.CITNO, a.SOCNO, a.HEALNO FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID LEFT JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID LEFT JOIN STN_DIST h ON a.ADDRDIST_ID=h.ID INNER JOIN STN_MOVE i ON b.MOVE_ID=i.ID INNER JOIN STN_MOVETYPE j ON i.MOVETYPE_ID=j.ID WHERE a.ID=" + Session["HRMIS_UserID"].ToString());
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr[0].ToString() != "") pTab1ModalImage.Src = "../files/staffs/" + dr[0].ToString();
                        pTab1ModalDivStaffDet.InnerHtml = "<h1 class=\"no-margin\"><span class=\"semi-bold\">" + dr[5].ToString() + "</span> " + dr[6].ToString() + "<br><small>" + dr[7].ToString() + " | " + dr[8].ToString() + "</small><h1>";
                    }
                }
                //                strMyVal = myObj.OracleExecuteScalar(@"SELECT YRCNT||'~'||CASE 
                //    WHEN 6 > YRCNT
                //    THEN 0
                //    WHEN 6 <= YRCNT AND 11 > YRCNT
                //    THEN 3
                //    WHEN 11 <= YRCNT AND 16 > YRCNT
                //    THEN 5
                //    WHEN 16 <= YRCNT AND 21 > YRCNT
                //    THEN 7
                //    WHEN 21 <= YRCNT AND 26 > YRCNT
                //    THEN 9
                //    WHEN 26 <= YRCNT AND 32 > YRCNT
                //    THEN 11
                //    WHEN 32 <= YRCNT THEN 14 END as NEMEGDEL_DAY
                //FROM(
                //  SELECT SUM(YRCNT) as YRCNT
                //  FROM(
                //    SELECT
                //      NVL(ROUND(SUM(ROUND(NVL(TO_DATE(a.TODATE, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.FROMDATE, 'YYYY-MM-DD') + 1)) / 365), 0) as YRCNT
                //    FROM ST_EXPHISTORY a
                //    WHERE a.ISSOCINS = 1 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
                //    UNION ALL
                //    SELECT
                //      NVL(ROUND(SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) / 365), 0) as YRCNT
                //    FROM ST_STBR a
                //    INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
                //    WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
                //  )
                //)").ToString();
                strMyVal = myObj.OracleExecuteScalar(@"SELECT YRCNT||'~'||CASE 
    WHEN 6 > YRCNT
    THEN 0
    WHEN 6 <= YRCNT AND 11 > YRCNT
    THEN 3
    WHEN 11 <= YRCNT AND 16 > YRCNT
    THEN 5
    WHEN 16 <= YRCNT AND 21 > YRCNT
    THEN 7
    WHEN 21 <= YRCNT AND 26 > YRCNT
    THEN 9
    WHEN 26 <= YRCNT AND 32 > YRCNT
    THEN 11
    WHEN 32 <= YRCNT THEN 14 END as NEMEGDEL_DAY
FROM(
  SELECT SUM(YRCNT) as YRCNT
  FROM(
    SELECT ROUND(SUM(TOTALTM)/365,1) as YRCNT
    FROM ( 
      SELECT SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG 
      FROM ( 
        SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
        FROM ST_EXPHISTORY a 
        INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
        WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + @"
        GROUP BY b.ISGOV
        UNION ALL 
        SELECT
          SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG
        FROM ST_STBR a
        INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
        WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
      ) 
      UNION ALL 
      SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG 
      FROM ( 
        SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
        FROM ST_EXPHISTORY a 
        INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
        WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + @"
        GROUP BY b.ISGOV
        UNION ALL 
        SELECT
          SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG
        FROM ST_STBR a
        INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
        WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
      ) 
      WHERE ISGOV=1 
      UNION ALL 
      SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG 
      FROM ( 
        SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
        FROM ST_EXPHISTORY a 
        INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
        WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + @"
        GROUP BY b.ISGOV
        UNION ALL 
        SELECT
          SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG
        FROM ST_STBR a
        INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
        WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
      ) 
      WHERE ISMYORG=1
    )
  )
)").ToString();
                pTab1ModalDaynumDiv.InnerHtml = "Сангийн яам болон шимтгэлтэй ажилласан жил: <strong>" + strMyVal.Split('~')[0] + "</strong> | Амралтын нэмэгдэл хоног: <strong>" + strMyVal.Split('~')[1] + "</strong>";
                strMyVal = "";
                ds = myObj.OracleExecuteDataSet("SELECT HOLMONTH, HOLDAY, NAME FROM ST_HOLIDAYOFFICIAL UNION ALL SELECT TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'MM')) as HOLMONTH, TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'DD')) as HOLDAY, NAME FROM ST_HOLIDAYUNOFFICIAL WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'YYYY'))=" + DateTime.Now.Year.ToString());
                if (ds.Tables[0].Rows.Count != 0)
                {
                    strMyVal = "[";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (strMyVal == "[") strMyVal += "[" + dr[0].ToString() + ", " + dr[1].ToString() + ", \"" + dr[2].ToString() + "\"]";
                        else strMyVal += ",[" + dr[0].ToString() + ", " + dr[1].ToString() + ", \"" + dr[2].ToString() + "\"]";
                    }
                    strMyVal += "]";
                }
                myObj.DBDisconnect();
                pTab2HolidayStr.InnerHtml = strMyVal;
                for (int i = 2000; i <= (DateTime.Now.Year + 1); i++)
                {
                    pTab1SelectYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    pTab2t1SelectYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
                pTab1SelectYear.SelectedIndex = pTab1SelectYear.Items.IndexOf(pTab1SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
                pTab2t1SelectYear.SelectedIndex = pTab2t1SelectYear.Items.IndexOf(pTab2t1SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
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