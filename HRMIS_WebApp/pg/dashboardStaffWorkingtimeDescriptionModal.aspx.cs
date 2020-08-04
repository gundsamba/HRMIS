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
    public partial class dashboardStaffWorkingtimeDescriptionModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            string year = Request.QueryString["yr"];
            string month = Request.QueryString["mnth"];
            string stid = Request.QueryString["stid"];
            spanStaffname.InnerHtml = myObj.OracleExecuteScalar("SELECT CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||'-'||d.INITNAME END||'-Н '||c.NAME||' '||SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,1,1)||LOWER(SUBSTR(a.FNAME,2)) as STAFFNAME FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1 INNER JOIN STN_POS c ON b.POS_ID = c.ID INNER JOIN ST_BRANCH d ON b.BRANCH_ID = d.ID AND d.ISACTIVE = 1 INNER JOIN ST_BRANCH f ON d.FATHER_ID = f.ID AND d.ISACTIVE = 1 WHERE a.ID = "+stid).ToString();
            string[] date = new string[3];
            string[] time1 = new string[3];
            string[] time2 = new string[3];
            string strTable = "";
            //string qry = "SELECT NVL(b.TP,0) as TP, a.DT, NVL(a.MINTM,'00:00:00') as MINTM, NVL(a.MAXTM,'00:00:00') as MAXTM FROM ( SELECT a.DT, TO_CHAR(b.MINTM,'HH24:MI:SS') as MINTM, TO_CHAR(b.MAXTM,'HH24:MI:SS') as MAXTM FROM ( SELECT ST_ID, DT FROM ( SELECT a.ST_ID, a.YEAR, a.MONTH as MONTH1,TO_NUMBER(TO_CHAR(b.DT,'mm')) as MONTH2, b.DT FROM ( SELECT STAFFS_ID as ST_ID, TO_NUMBER(TO_CHAR(MIN(DT),'YYYY')) as YEAR, TO_NUMBER(TO_CHAR(MIN(DT),'MM')) as MONTH FROM ST_IRTS WHERE INOUT=0 AND TO_NUMBER(TO_CHAR(DT,'YYYY'))=" + year + " AND STAFFS_ID=" + stid + " GROUP BY STAFFS_ID ) a, ( SELECT DT FROM ( SELECT (TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd')-1)+ROWNUM DT FROM DUAL CONNECT BY LEVEL<=(LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd'))+1)-TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd') ) WHERE DT BETWEEN TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN (1, 2, 3, 4, 5) UNION ALL SELECT TO_DATE(HOLDATE,'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'YYYY'))=" + year + " AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'MM'))=" + month + " ) b ) WHERE MONTH1<=MONTH2 ) a LEFT JOIN ( SELECT STAFFS_ID as ST_ID, TO_DATE(TO_CHAR(DT,'YYYY-MM-DD'),'YYYY-MM-DD') as DT, MIN(DT) as MINTM, MAX(DT) as MAXTM FROM ST_IRTS WHERE INOUT=0 AND TO_NUMBER(TO_CHAR(DT,'YYYY'))=" + year + " AND TO_NUMBER(TO_CHAR(DT,'MM'))=" + month + " AND STAFFS_ID=" + stid + " GROUP BY STAFFS_ID, TO_DATE(TO_CHAR(DT,'YYYY-MM-DD'),'YYYY-MM-DD') ) b ON a.ST_ID=b.ST_ID AND a.DT=b.DT ) a LEFT JOIN ( SELECT DT, MAX(TP) as TP FROM ( SELECT b.DT, 11 as TP FROM ST_CHULUUDAYF3 a, ( SELECT TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD')+(ROWNUM-1) DT FROM DUAL CONNECT BY LEVEL<=ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD'),1)-TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') ) b WHERE a.STAFFS_ID=" + stid + " AND (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd'))) AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') UNION ALL SELECT b.DT, 12 as TP FROM ST_CHULUUDAYT2 a, ( SELECT TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD')+(ROWNUM-1) DT FROM DUAL CONNECT BY LEVEL<=ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD'),1)-TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') ) b WHERE a.STAFFS_ID=" + stid + " AND a.ISRECEIVED=1 AND (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd'))) AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') UNION ALL SELECT b.DT, 13 as TP FROM ST_CHULUUSICK a, ( SELECT TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD')+(ROWNUM-1) DT FROM DUAL CONNECT BY LEVEL<=ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD'),1)-TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') ) b WHERE a.STAFFS_ID=" + stid + " AND (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd'))) AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') UNION ALL SELECT b.DT, 21 as TP FROM ST_AMRALT a, ( SELECT TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD')+(ROWNUM-1) DT FROM DUAL CONNECT BY LEVEL<=ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD'),1)-TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') ) b WHERE a.STAFFS_ID=" + stid + " AND a.TZISRECEIVED=1 AND (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd'))) AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') UNION ALL SELECT b.DT, 31 as TP FROM ST_TOMILOLT_STAFFS a INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID=c.ID, ( SELECT TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD')+(ROWNUM-1) DT FROM DUAL CONNECT BY LEVEL<=ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD'),1)-TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') ) b WHERE a.STAFFS_ID=" + stid + " AND (TO_DATE(c.FROMDATE, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd')) OR TO_DATE(c.TODATE, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01','yyyy-mm-dd'))) AND b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD') UNION ALL SELECT TO_DATE('" + year + "-'||HOLMONTH||'-'||HOLDAY,'YYYY-MM-DD') as DT, 91 as TP FROM ST_HOLIDAYOFFICIAL WHERE HOLMONTH=" + month + " UNION ALL SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT, 91 as TP FROM ST_HOLIDAYUNOFFICIAL WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'YYYY'))=" + year + " AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'MM'))=" + month + " ) GROUP BY DT ) b ON a.DT=b.DT ORDER BY a.DT";
            string qry = @"SELECT a.ST_ID, NVL(b.TP,a.TP) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
FROM(
  SELECT a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
  FROM(
    SELECT a.YEAR, a.MONTH, a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
    FROM(
      SELECT a.YEAR, a.MONTH, a.ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
      FROM(
        SELECT YEAR, MONTH2 as MONTH, ST_ID, DT, ISWORK
        FROM(
          SELECT a.ST_ID, a.YEAR, a.MONTH as MONTH1, TO_NUMBER(TO_CHAR(b.DT, 'mm')) as MONTH2, b.DT, CASE WHEN(MOD(TO_CHAR(b.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(b.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
          FROM(
            SELECT a.ID as ST_ID, f.YEAR, MIN(f.MONTH) as MONTH
            FROM ST_STAFFS a
            INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
            INNER JOIN STN_MOVE c ON b.MOVE_ID = c.ID AND c.ACTIVE = 1
            INNER JOIN hr_mof.STN_TRCDLOG f ON a.FINGERID = f.ENO
            WHERE f.YEAR = " + year + " AND a.ID = " + stid + @"
            GROUP BY a.ID, f.YEAR
          ) a, (
            SELECT DT
            FROM(
              SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
              FROM DUAL
              CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month + "-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
            )
            WHERE DT BETWEEN TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
          ) b
        )
        WHERE MONTH1 <= MONTH2
      ) a
      LEFT JOIN(
        SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + " AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + month + @")
      ) b ON a.DT = b.DT
    ) a
    LEFT JOIN(
      SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
      FROM hr_mof.STN_TRCDLOG a
      INNER JOIN ST_STAFFS b ON a.ENO = b.FINGERID
      INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID AND c.ISACTIVE = 1
      INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID AND d.ACTIVE = 1
      WHERE a.INOUT = 0 AND a.YEAR = " + year + " AND b.ID = " + stid + " AND a.MONTH IN(" + month + ") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
      GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
    ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT
  ) a
  LEFT JOIN(
    SELECT DT, STAFFS_ID, MAX(TP) as TP
    FROM(
      SELECT b.DT, a.STAFFS_ID, 11 as TP
      FROM ST_CHULUUDAYF3 a,
      (
        SELECT TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD') + (ROWNUM - 1) DT
        FROM DUAL
        CONNECT BY LEVEL <= ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD'), 1) - TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD')
      ) b
      WHERE
        a.STAFFS_ID = " + stid + @" AND
        (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01', 'yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd'))) AND
        b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
      UNION ALL
      SELECT b.DT, a.STAFFS_ID, 12 as TP
      FROM ST_CHULUUDAYT2 a,
      (
        SELECT TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD') + (ROWNUM - 1) DT
        FROM DUAL
        CONNECT BY LEVEL <= ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD'), 1) - TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD')
      ) b
      WHERE
        a.STAFFS_ID = " + stid + @" AND
        a.ISRECEIVED = 1 AND
          (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01', 'yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd'))) AND
        b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
      UNION ALL
      SELECT b.DT, a.STAFFS_ID, 13 as TP
      FROM ST_CHULUUSICK a,
      (
        SELECT TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD') + (ROWNUM - 1) DT
             FROM DUAL
             CONNECT BY LEVEL<= ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD'), 1) - TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD')
      ) b
      WHERE
        a.STAFFS_ID = " + stid + @" AND
          (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01', 'yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd'))) AND
        b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
      UNION ALL
      SELECT b.DT, a.STAFFS_ID, 21 as TP
      FROM ST_AMRALT a,
      (
        SELECT TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD') + (ROWNUM - 1) DT
             FROM DUAL
             CONNECT BY LEVEL<= ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD'), 1) - TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD')
      ) b
      WHERE
        a.STAFFS_ID = " + stid + @" AND
        a.TZISRECEIVED = 1 AND
          (TO_DATE(a.BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + "-01', 'yyyy-mm-dd')) OR TO_DATE(a.ENDDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd'))) AND
        b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
      UNION ALL
      SELECT b.DT, a.STAFFS_ID, 31 as TP
      FROM ST_TOMILOLT_STAFFS a
      INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
      (
        SELECT TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD') + (ROWNUM - 1) DT
             FROM DUAL
             CONNECT BY LEVEL<= ADD_MONTHS(TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD'), 1) - TO_DATE('" + year + "-" + month + @"-01', 'YYYY-MM-DD')
      ) b
      WHERE
        a.STAFFS_ID = " + stid + @" AND
          (
            TO_DATE(c.FROMDATE, 'YYYY-MM-DD')
            BETWEEN
              TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')) OR
            TO_DATE(c.TODATE, 'YYYY-MM-DD')
            BETWEEN
              TO_DATE('" + year + "-" + month + "-01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd'))) AND
        b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')    
    )
    GROUP BY DT, STAFFS_ID
  ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
) a
LEFT JOIN(
  SELECT TO_DATE('" + year + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT, 91 as TP
  FROM ST_HOLIDAYOFFICIAL
  WHERE HOLMONTH IN(" + month + @")
  UNION ALL
  SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT, 91 as TP
  FROM ST_HOLIDAYUNOFFICIAL
  WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + " AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + month + @")
) b ON a.DT = b.DT
ORDER BY a.DT";
            DataSet ds = myObj.OracleExecuteDataSet(qry);
            if (ds.Tables[0].Rows.Count != 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Array.Clear(date, 0, date.Length);
                    date = new string[3];
                    date = Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd").Split('-');

                    if (dr["ISWORK"].ToString() == "0")
                    {
                        strTable += "<tr>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueDark\">Амралтын өдөр</span></td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + dr["MINTM"].ToString().Replace("00:00:00", "--:--:--") + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + dr["MAXTM"].ToString().Replace("00:00:00", "--:--:--") + "</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        strTable += "</tr>";
                    }
                    else
                    {
                        if (dr["TP"].ToString() == "0")
                        {
                            Array.Clear(time1, 0, time1.Length);
                            time1 = new string[3];
                            time1 = dr["MINTM"].ToString().Split(':');
                            Array.Clear(time2, 0, time2.Length);
                            time2 = new string[3];
                            time2 = dr["MAXTM"].ToString().Split(':');
                            DateTime come = new DateTime(Int32.Parse(date[0]), Int32.Parse(date[1]), Int32.Parse(date[2]), Int32.Parse(time1[0]), Int32.Parse(time1[1]), Int32.Parse(time1[2]));
                            DateTime go = new DateTime(Int32.Parse(date[0]), Int32.Parse(date[1]), Int32.Parse(date[2]), Int32.Parse(time2[0]), Int32.Parse(time2[1]), Int32.Parse(time2[2]));
                            DateTime late = new DateTime(Int32.Parse(date[0]), Int32.Parse(date[1]), Int32.Parse(date[2]), 08, 40, 00);
                            DateTime early = new DateTime(Int32.Parse(date[0]), Int32.Parse(date[1]), Int32.Parse(date[2]), 17, 30, 00);
                            if (dr["MINTM"].ToString() == "00:00:00" && dr["MAXTM"].ToString() == "00:00:00")
                            {
                                strTable += "<tr>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-redLight\">Тасалсан</span></td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss").Replace("00:00:00", "--:--:--") + "</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTable += "</tr>";
                            }
                            else if (dr["MINTM"].ToString() != dr["MAXTM"].ToString())
                            {
                                var lateTimeSpanHour = TimeSpan.FromHours(Convert.ToDouble(come.Subtract(late).Hours));
                                var earlyTimeSpanHour = TimeSpan.FromHours(Convert.ToDouble(early.Subtract(go).Hours));
                                var lateTimeSpanMin = TimeSpan.FromMinutes(Convert.ToDouble(come.Subtract(late).Minutes));
                                var earlyTimeSpanMin = TimeSpan.FromMinutes(Convert.ToDouble(early.Subtract(go).Minutes));
                                var lateTimeSpanSec = TimeSpan.FromSeconds(Convert.ToDouble(come.Subtract(late).Seconds));
                                var earlyTimeSpanSec = TimeSpan.FromSeconds(Convert.ToDouble(early.Subtract(go).Seconds));
                                TimeSpan lateTimeSpan = lateTimeSpanHour + lateTimeSpanMin + lateTimeSpanSec;
                                TimeSpan earlyTimeSpan = earlyTimeSpanHour + earlyTimeSpanMin + earlyTimeSpanSec;

                                if (Convert.ToDouble(come.Subtract(late).Seconds) > 0)
                                {
                                    if (Convert.ToDouble(go.Subtract(early).Seconds) < 0)
                                    {
                                        strTable += "<tr>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-yellow\">Хоцорсон</span></td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + lateTimeSpan.ToString() + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + earlyTimeSpan.ToString() + "</td>";
                                        strTable += "</tr>";
                                    }
                                    else
                                    {
                                        strTable += "<tr>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-yellow\">Хоцорсон</span></td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + lateTimeSpan.ToString() + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                        strTable += "</tr>";
                                    }
                                }
                                else
                                {
                                    if (Convert.ToDouble(go.Subtract(early).Seconds) < 0)
                                    {
                                        strTable += "<tr>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueLight\">Цагтаа ирсэн</span></td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + earlyTimeSpan.ToString() + "</td>";
                                        strTable += "</tr>";
                                    }
                                    else
                                    {
                                        strTable += "<tr>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueLight\">Цагтаа ирсэн</span></td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                        strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                        strTable += "</tr>";
                                    }

                                }
                            }
                            else
                            {
                                strTable += "<tr>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-redLight\">Тасалсан</span></td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss").Replace("00:00:00", "--:--:--") + "</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTable += "</tr>";
                            }
                        }
                        else if (dr["TP"].ToString() == "13")
                        {
                            strTable += "<tr>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-pink\">Өвчтэй</span></td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "</tr>";
                        }
                        else if (dr["TP"].ToString() == "21")
                        {
                            strTable += "<tr>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-greenDark\">Ээлжийн амралттай</span></td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "</tr>";
                        }
                        else if (dr["TP"].ToString() == "11" || dr["TP"].ToString() == "12")
                        {
                            strTable += "<tr>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-orangeDark\">Чөлөөтэй</span></td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "</tr>";
                        }
                        else if (dr["TP"].ToString() == "31")
                        {
                            strTable += "<tr>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blue\">Албан томилолт</span></td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "</tr>";
                        }
                        else if (dr["TP"].ToString() == "91")
                        {
                            strTable += "<tr>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-lighten\">Тэмдэглэлт өдөр</span></td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTable += "</tr>";
                        }
                    }                    
                }
            }
            divdashboardStaffWorkingtimeDescriptionTableTbody.InnerHtml = strTable;
        }
    }
}