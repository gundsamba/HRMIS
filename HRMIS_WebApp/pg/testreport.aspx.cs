using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class testreport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                string strTableVal = "";
                string strQry = @"SELECT 
    CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||'-'||d.INITNAME END as NEGJ,
    g.NAME as POSNAME, 
    SUBSTR(a.LNAME, 0, 1) || '.' || SUBSTR(a.FNAME, 1, 1) || LOWER(SUBSTR(a.FNAME, 2)) as STNAME,
    b.DT, 
    b.TUSHAALDATE,
    b.TUSHAALNO,
    i.DESCNAME, 
    j.TOTALTM, 
    j.GOVTM, 
    j.MYGOVTM, 
    k.GRADUATED_LIST, 
    l.WORKED_LIST
  FROM ST_STAFFS a 
  INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
  INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID AND c.ACTIVE=1 
  INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID 
  INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID 
  INNER JOIN STN_POS g ON b.POS_ID=g.ID 
  LEFT JOIN ST_RANK h ON b.RANK_ID=h.ID
  LEFT JOIN STN_RANKPOSTYPE i ON h.RANKPOSTYPE_ID=i.ID
  LEFT JOIN (
    SELECT STAFFS_ID, ROUND(SUM(TOTALTM)/365,1) as TOTALTM, ROUND(SUM(ISGOVTM)/365,1) as GOVTM, ROUND(SUM(ISMYORG)/365,1) as MYGOVTM
    FROM (
      SELECT STAFFS_ID, SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG
      FROM (
        SELECT a.STAFFS_ID, NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG
        FROM ST_EXPHISTORY a
        INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID
        UNION ALL    
        SELECT a.STAFFS_ID, CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END - c.MINDT as CC, 1 as ISGOV, 1 as ISMYORG 
        FROM ST_STBR a 
        INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID
        INNER JOIN (
          SELECT a.STAFFS_ID, MIN(TO_DATE(a.DT,'YYYY-MM-DD')) as MINDT
          FROM ST_STBR a
          GROUP BY a.STAFFS_ID
        ) c ON a.STAFFS_ID=c.STAFFS_ID
      )
      GROUP BY STAFFS_ID
      UNION ALL
      SELECT STAFFS_ID, 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG
      FROM (
        SELECT a.STAFFS_ID, NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG
        FROM ST_EXPHISTORY a
        INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID
        UNION ALL    
        SELECT a.STAFFS_ID, CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END - c.MINDT as CC, 1 as ISGOV, 1 as ISMYORG 
        FROM ST_STBR a 
        INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID
        INNER JOIN (
          SELECT a.STAFFS_ID, MIN(TO_DATE(a.DT,'YYYY-MM-DD')) as MINDT
          FROM ST_STBR a
          GROUP BY a.STAFFS_ID
        ) c ON a.STAFFS_ID=c.STAFFS_ID
        WHERE a.ISACTIVE=1
      )
      WHERE ISGOV=1
      GROUP BY STAFFS_ID
      UNION ALL
      SELECT STAFFS_ID, 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG
      FROM (
        SELECT a.STAFFS_ID, NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG
        FROM ST_EXPHISTORY a
        INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID
        UNION ALL    
        SELECT a.STAFFS_ID, CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END - c.MINDT as CC, 1 as ISGOV, 1 as ISMYORG 
        FROM ST_STBR a 
        INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID
        INNER JOIN (
          SELECT a.STAFFS_ID, MIN(TO_DATE(a.DT,'YYYY-MM-DD')) as MINDT
          FROM ST_STBR a
          GROUP BY a.STAFFS_ID
        ) c ON a.STAFFS_ID=c.STAFFS_ID
        WHERE a.ISACTIVE=1
      )
      WHERE ISMYORG=1
      GROUP BY STAFFS_ID
    )
    GROUP BY STAFFS_ID
  ) j ON a.ID=j.STAFFS_ID
  LEFT JOIN (
    SELECT STAFFS_ID, RTRIM(xmlagg(xmlelement(e,GRADUATED || '<br>') ORDER BY GRADUATED).extract('//text()'), '<br>') as GRADUATED_LIST
    FROM (
      SELECT a.STAFFS_ID, TO_CHAR(a.FROMYR)||'-'||TO_CHAR(a.TOYR)||' '||TO_CHAR(a.INSTITUTENAME)||' '||'/'||b.NAME||'/' as GRADUATED
      FROM ST_EDUCATION a
      INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID
    )
    GROUP BY STAFFS_ID
  ) k ON a.ID=k.STAFFS_ID
  LEFT JOIN (
    SELECT STAFFS_ID, RTRIM(xmlagg(xmlelement(e,WORKED || '<br>') ORDER BY WORKED).extract('//text()'), '<br>') as WORKED_LIST
    FROM (";
                strQry += "SELECT a.STAFFS_ID, '\"'||a.FROMDATE||' - '||a.TODATE||'\" '||a.ORGNAME||' /'||a.TITLE||'/' as WORKED FROM ST_EXPHISTORY a UNION ALL SELECT a.STAFFS_ID, '\"' || a.DT || ' - ' || NVL(a.ENDDT, 'одоо') || '\" СЯ-' || b.INITNAME || ' /' || c.NAME || '/' as WORKED FROM ST_STBR a INNER JOIN ST_BRANCH b ON a.BRANCH_ID = b.ID INNER JOIN STN_POS c ON a.POS_ID = c.ID ) GROUP BY STAFFS_ID ) l ON a.ID = l.STAFFS_ID WHERE b.POS_ID != 2020102 ORDER BY f.SORT, d.SORT, g.SORT, a.ID";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    strTableVal += "<table class=\"table table-bordered\"><tbody>";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr["NEGJ"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["POSNAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["STNAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DT"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["TUSHAALDATE"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["TUSHAALNO"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DESCNAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["TOTALTM"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["GOVTM"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["MYGOVTM"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["GRADUATED_LIST"].ToString().Replace("&lt;", "<").Replace("&gt;", ">") + "</td>";
                        strTableVal += "<td>" + dr["WORKED_LIST"].ToString().Replace("&lt;","<").Replace("&gt;", ">") + "</td>";
                        strTableVal += "</tr>";
                    }
                    strTableVal += "</tbody></table>";
                }
                divid.InnerHtml = strTableVal;
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