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
    public partial class dashboard : System.Web.UI.Page
    {
        OracleDataReader rdr;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                var userData = sessionClass.getCurrentUserData();
                string strQry = string.Empty;
                dashboardSection1btnStaffAnket.HRef = "../#pg/profile.aspx?id=" + Session["HRMIS_UserID"];
                //dashboardSection1btnStaffAnketPrint.HRef = "../pg/dashboardStaffAnketPrint.aspx?id=" + Session["HRMIS_UserID"];
                dashboardSection1btnStaffAnketPrint.HRef = "../pg/modal/modalStaffAnketPrint.aspx?id="+ userData.USR_STAFFID.ToString();
                dashboardSection1btnStaffAnketPrint2.HRef = "../pg/modal/modalStaffAnketPrint2.aspx?id=" + userData.USR_STAFFID.ToString();
                ds = myObj.OracleExecuteDataSet("SELECT a.IMAGE, CASE WHEN i.ACTIVE=1 AND i.SHOW=1 THEN TO_CHAR(h.NAME) WHEN i.ACTIVE=1 AND i.SHOW=0 THEN 'Идэвхтэй' ELSE TO_CHAR(j.NAME) END AS TP, i.COLOR, CASE WHEN a.GENDER=1 THEN '<i class=\"fa fa-male\"></i> Эрэгтэй<br />' ELSE '<i class=\"fa fa-female\"></i> Эмэгтэй<br />' END as GENDER,  NVL(TO_CHAR(trunc(months_between(sysdate,to_date(a.BDATE,'YYYY-MM-DD'))/12)),'-') as AGE,  a.FNAME, a.LNAME, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, f.NAME as POS_NAME, a.TEL||CASE WHEN TEL is not null THEN ', '||TEL2 END as TEL, a.EMAIL, g.NAME||NVL2(g.NAME,', ','')||h.NAME||NVL2(h.NAME,', ','')||a.ADDRESSNAME as ADDRESSNAME, a.REGNO, a.CITNO, a.SOCNO, a.HEALNO, a.MACID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID LEFT JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID LEFT JOIN STN_DIST h ON a.ADDRDIST_ID=h.ID INNER JOIN STN_MOVE i ON b.MOVE_ID=i.ID INNER JOIN STN_MOVETYPE j ON i.MOVETYPE_ID=j.ID WHERE a.ID=" + Session["HRMIS_UserID"].ToString());
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr["IMAGE"].ToString() != "") dashboardSection1Image.Src = "../files/staffs/" + dr["IMAGE"].ToString();
                        dashboardSection1DivStafftype.InnerHtml = "<span class=\"label " + dr["COLOR"].ToString() + "\">" + dr["TP"].ToString() + "</span><br /><br />" + dr["GENDER"].ToString() + "<span>" + dr["AGE"].ToString() + " нас</span>";
                        dashboardSection1H1Names.InnerHtml = "<span class=\"semi-bold\">" + dr["FNAME"].ToString() + "</span> " + dr["LNAME"].ToString() + "<br><small>" + dr["NEGJ"].ToString() + " | " + dr["POS_NAME"].ToString() + "</small>";
                        if (dr["TEL"].ToString() != "") dashboardSection1SpanTels.InnerHtml = dr["TEL"].ToString();
                        if (dr["EMAIL"].ToString() != "")
                        {
                            dashboardSection1SpanEmail.InnerHtml = dr["EMAIL"].ToString();
                            dashboardSection1SpanEmail.HRef = "mailto:" + dr["EMAIL"].ToString();
                        }
                        if (dr["ADDRESSNAME"].ToString() != "") dashboardSection1SpanAddress.InnerHtml = dr["ADDRESSNAME"].ToString();
                    }
                }

                string strMyVal = "";
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND(SUM(TOTALTM)/365,1)||'~'||ROUND(SUM(ISGOVTM)/365,1)||'~'||ROUND(SUM(ISMYORG)/365,1) as TMS FROM ( SELECT SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG FROM ( SELECT NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " UNION ALL SELECT (SELECT CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1)-(SELECT MIN(TO_DATE(DT,'YYYY-MM-DD')) FROM ST_STBR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ") as CC, 1 as ISGOV, 1 as ISMYORG FROM DUAL ) UNION ALL SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG FROM ( SELECT NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " UNION ALL SELECT (SELECT CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1)-(SELECT MIN(TO_DATE(DT,'YYYY-MM-DD')) FROM ST_STBR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ") as CC, 1 as ISGOV, 1 as ISMYORG FROM DUAL ) WHERE ISGOV=1 UNION ALL SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG FROM ( SELECT NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG FROM ST_EXPHISTORY a INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " UNION ALL SELECT (SELECT CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1)-(SELECT MIN(TO_DATE(DT,'YYYY-MM-DD')) FROM ST_STBR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ") as CC, 1 as ISGOV, 1 as ISMYORG FROM DUAL ) WHERE ISMYORG=1 )").ToString();
                //                strMyVal = myObj.OracleExecuteScalar(@"SELECT ROUND(SUM(TOTALTM)/365,1)||'~'||ROUND(SUM(ISGOVTM)/365,1)||'~'||ROUND(SUM(ISMYORG)/365,1) as TMS 
                //FROM ( 
                //  SELECT SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG 
                //  FROM ( 
                //    SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
                //    FROM ST_EXPHISTORY a 
                //    INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
                //    WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + @"
                //    GROUP BY b.ISGOV
                //    UNION ALL 
                //    SELECT
                //      SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG
                //    FROM ST_STBR a
                //    INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
                //    WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
                //  ) 
                //  UNION ALL 
                //  SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG 
                //  FROM ( 
                //    SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
                //    FROM ST_EXPHISTORY a 
                //    INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
                //    WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + @"
                //    GROUP BY b.ISGOV
                //    UNION ALL 
                //    SELECT
                //      SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG
                //    FROM ST_STBR a
                //    INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
                //    WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
                //  ) 
                //  WHERE ISGOV=1 
                //  UNION ALL 
                //  SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG 
                //  FROM ( 
                //    SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
                //    FROM ST_EXPHISTORY a 
                //    INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
                //    WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + @"
                //    GROUP BY b.ISGOV
                //    UNION ALL 
                //    SELECT
                //      SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG
                //    FROM ST_STBR a
                //    INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
                //    WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + Session["HRMIS_UserID"].ToString() + @"
                //  ) 
                //  WHERE ISMYORG=1
                //)").ToString();
                ds.Clear();
                ds = myObj.OracleExecuteDataSet(@"SELECT 
            STAFFS_ID
            , ROUND(DAYCNT_MOF/365,1) as YRCNT_MOF
            , ROUND((MOD(DAYCNT_MOF,365)/30.4),1) as MNTHCNT_MOF
            , ROUND((DAYCNT_MOF+DAYCNT_GOV)/365,1) as YRCNT_GOV
            , ROUND((MOD(DAYCNT_MOF+DAYCNT_GOV,365)/30.4),1) as MNTHCNT_GOV
            , ROUND((DAYCNT_MOF+DAYCNT_GOV+DAYCNT_WORKED)/365,1) as YRCNT_WORKED
            , ROUND((MOD(DAYCNT_MOF+DAYCNT_GOV+DAYCNT_WORKED,365)/30.4),1) as MNTHCNT_WORKED
        FROM (
            SELECT STAFFS_ID, SUM(DAYCNT_MOF) as DAYCNT_MOF, SUM(DAYCNT_GOV) as DAYCNT_GOV, SUM(DAYCNT_WORKED) as DAYCNT_WORKED
            FROM (
                SELECT STAFFS_ID, ROUND(ENDDT-DT) as DAYCNT_MOF, 0 as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM (
                    SELECT a.STAFFS_ID, TO_DATE(a.DT,'YYYY-MM-DD') as DT, CASE WHEN a.ENDDT IS NOT NULL THEN TO_DATE(a.ENDDT,'YYYY-MM-DD') ELSE SYSDATE END as ENDDT 
                    FROM hrdbuser.ST_STBR a
                    INNER JOIN hrdbuser.STN_MOVE b ON a.MOVE_ID=b.ID 
                    WHERE b.ISWORK=1 AND a.STAFFS_ID = " + userData.USR_STAFFID + @"
                )
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID=1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL AND STAFFS_ID = " + userData.USR_STAFFID + @"
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, 0 as DAYCNT_GOV, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID<>1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL AND STAFFS_ID = " + userData.USR_STAFFID + @"
            ) 
            GROUP BY STAFFS_ID
        )");
                //strMyVal = myObj.OracleExecuteScalar(@"SELECT ROUND(SUM(TOTALTM)/365,1)||'~'||ROUND(SUM(ISGOVTM)/365,1)||'~'||ROUND(SUM(ISMYORG)/365,1) as TMS FROM ( SELECT SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG FROM ( SELECT NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG FROM hrdbuser.ST_EXPHISTORY a INNER JOIN hrdbuser.STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " UNION ALL SELECT (SELECT CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END FROM hrdbuser.ST_STBR a INNER JOIN hrdbuser.STN_MOVE b ON a.MOVE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1)-(SELECT MIN(TO_DATE(DT,'YYYY-MM-DD')) FROM hrdbuser.ST_STBR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ") as CC, 1 as ISGOV, 1 as ISMYORG FROM DUAL ) UNION ALL SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG FROM ( SELECT NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG FROM hrdbuser.ST_EXPHISTORY a INNER JOIN hrdbuser.STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " UNION ALL SELECT (SELECT CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END FROM hrdbuser.ST_STBR a INNER JOIN hrdbuser.STN_MOVE b ON a.MOVE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1)-(SELECT MIN(TO_DATE(DT,'YYYY-MM-DD')) FROM hrdbuser.ST_STBR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ") as CC, 1 as ISGOV, 1 as ISMYORG FROM DUAL ) WHERE ISGOV=1 UNION ALL SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG FROM ( SELECT NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') as CC, b.ISGOV, 0 as ISMYORG FROM hrdbuser.ST_EXPHISTORY a INNER JOIN hrdbuser.STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " UNION ALL SELECT (SELECT CASE WHEN b.ACTIVE=1 THEN SYSDATE ELSE TO_DATE(a.DT,'YYYY-MM-DD') END FROM hrdbuser.ST_STBR a INNER JOIN hrdbuser.STN_MOVE b ON a.MOVE_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1)-(SELECT MIN(TO_DATE(DT,'YYYY-MM-DD')) FROM hrdbuser.ST_STBR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ") as CC, 1 as ISGOV, 1 as ISMYORG FROM DUAL ) WHERE ISMYORG=1 )").ToString();
                //string valTotalYear = "0", valTotalMonth = "0", valISGOVYear = "0", valISGOVMonth = "0", valISMYORGYear = "0", valISMYORGMonth = "0";
                //valTotalYear = strMyVal.Split('~')[0].Split('.')[0];
                //if (strMyVal.Split('~')[0].Split('.').Length > 1) valTotalMonth = strMyVal.Split('~')[0].Split('.')[1];
                //valISGOVYear = strMyVal.Split('~')[1].Split('.')[0];
                //if (strMyVal.Split('~')[1].Split('.').Length > 1) valISGOVMonth = strMyVal.Split('~')[1].Split('.')[1];
                //valISMYORGYear = strMyVal.Split('~')[2].Split('.')[0];
                //if (strMyVal.Split('~')[2].Split('.').Length > 1) valISMYORGMonth = strMyVal.Split('~')[2].Split('.')[1];
                dashboardSection1PWorkedTime.InnerHtml = "<table class=\"table\"><tbody><tr><th>Нийт</th><td>" + ds.Tables[0].Rows[0]["YRCNT_WORKED"].ToString().Split('.')[0] + " жил</td><td>" + ds.Tables[0].Rows[0]["MNTHCNT_WORKED"].ToString() + " сар</td></tr><tr><th>Төрд</th><td>" + ds.Tables[0].Rows[0]["YRCNT_GOV"].ToString().Split('.')[0] + " жил</td><td>" + ds.Tables[0].Rows[0]["MNTHCNT_GOV"].ToString() + " сар</td></tr><tr><th>Сангийн яам</th><td>" + ds.Tables[0].Rows[0]["YRCNT_MOF"].ToString().Split('.')[0] + " жил</td><td>" + ds.Tables[0].Rows[0]["MNTHCNT_MOF"].ToString() + " сар</td></tr></tbody></table>";

                string strMyColor="";
                ////MainPercent
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND(((NVL2(DOMAIN_USER,1,0)+NVL2(MNAME,1,0)+NVL2(LNAME,1,0)+NVL2(FNAME,1,0)+NVL2(BDATE,1,0)+NVL2(BDIST_ID,1,0)+NVL2(NAT_ID,1,0)+NVL2(EDUTP_ID,1,0)+NVL2(SOCPOS_ID,1,0)+NVL2(OCCTYPE_ID,1,0)+NVL2(OCCNAME,1,0)+NVL2(BCITY_ID,1,0)+NVL2(GENDER,1,0)+NVL2(REGNO,1,0)+NVL2(CITNO,1,0)+NVL2(SOCNO,1,0)+NVL2(HEALNO,1,0)+NVL2(ADDRCITY_ID,1,0)+NVL2(ADDRDIST_ID,1,0)+NVL2(ADDRESSNAME,1,0)+NVL2(TEL,1,0)+NVL2(TEL2,1,0)+NVL2(EMAIL,1,0)+NVL2(IMAGE,1,0)+NVL2(RELNAME,1,0)+NVL2(RELATION_ID,1,0)+NVL2(RELADDRESSNAME,1,0)+NVL2(RELTEL,1,0)+NVL2(RELTEL2,1,0)+NVL2(RELEMAIL,1,0))/30)*100) FROM ST_STAFFS WHERE ID=" + Session["HRMIS_UserID"].ToString() + "").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1MainPercent.Attributes["aria-valuetransitiongoal"] = strMyVal;
                //dashboardSection1MainPercent.Attributes["class"] = strMyColor;
                ////Section1Tab1T2
                //strMyVal =myObj.OracleExecuteScalar("SELECT NVL(ROUND((SUM(CNT)/2)*100),0) FROM ( SELECT TP, CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFSFAMILY WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " GROUP BY TP )").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T2Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T2Percent.Attributes["class"] = strMyColor;
                ////Section1Tab1T3
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_EDUCATION WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_PHD WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_SCIENCEDEGREE WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + "))/3)*100) FROM DUAL").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T3Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T3Percent.Attributes["class"] = strMyColor;
                ////Section1Tab1T4
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_TRAINING WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + "))/1)*100) FROM DUAL").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T4Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T4Percent.Attributes["class"] = strMyColor;
                ////Section1Tab1T5
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_JOBTITLEDEGREE WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + "))/1)*100) FROM DUAL").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T5Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T5Percent.Attributes["class"] = strMyColor;
                ////Section1Tab1T6
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND((((SELECT COUNT(1) FROM ST_SKILLS WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT COUNT(1) FROM ST_ANOTHERSKILLS WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + "))/33)*100) FROM DUAL").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T6Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T6Percent.Attributes["class"] = strMyColor;
                ////Section1Tab1T7
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_LANGUAGESKILLS WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_SOFTWARE WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT COUNT(1) FROM ST_OFFICE WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + "))/9)*100) FROM DUAL").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T7Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T7Percent.Attributes["class"] = strMyColor;
                ////Section1Tab1T8
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_EXPHISTORY WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT COUNT(1) FROM ST_STATES WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + "))/2)*100) FROM DUAL").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T8Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T8Percent.Attributes["class"] = strMyColor;
                ////Section1Tab1T9
                //strMyVal =myObj.OracleExecuteScalar("SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_INNOVATION WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_TOUR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_CONDITION WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_DISPUTE WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_BONUS WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + "))/5)*100) FROM DUAL").ToString();
                //if (Int32.Parse(strMyVal) < 51) strMyColor = "progress-bar bg-color-redLight";
                //else if (Int32.Parse(strMyVal) > 50 && Int32.Parse(strMyVal) < 100) strMyColor = "progress-bar bg-color-yellow";
                //else if (Int32.Parse(strMyVal) == 100) strMyColor = "progress-bar bg-color-greenLight";
                //dashboardSection1Tab1T9Percent.Attributes["style"] = "width: " + strMyVal + "%";
                //dashboardSection1Tab1T9Percent.Attributes["class"] = strMyColor;

                string strStaffPosId =myObj.OracleExecuteScalar("SELECT POS_ID FROM ST_STBR WHERE STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND ISACTIVE=1").ToString();
                string strBossListQry = "";
                if (strStaffPosId == "10106") strBossListQry = "SELECT NVL(d.IMAGE,'male.png') as IMAGE, d.FNAME||' '||d.LNAME as STAFFNAME, f.NAME||' | '||CASE WHEN b.ID=b.FATHER_ID THEN b.INITNAME ELSE c.INITNAME||' - '||b.INITNAME END as POSNEGJ FROM ST_STBR a INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID INNER JOIN ST_BRANCH c ON b.FATHER_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID INNER JOIN STN_POS f ON a.POS_ID=f.ID INNER JOIN STN_MOVE g ON a.MOVE_ID=g.ID WHERE a.ISACTIVE=1 AND a.POS_ID IN (10106) AND g.ACTIVE=1";
                else if (strStaffPosId == "2010201") strBossListQry = "SELECT NVL(d.IMAGE,'male.png') as IMAGE, d.FNAME||' '||d.LNAME as STAFFNAME, f.NAME||' | '||CASE WHEN b.ID=b.FATHER_ID THEN b.INITNAME ELSE c.INITNAME||' - '||b.INITNAME END as POSNEGJ FROM ST_STBR a INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID INNER JOIN ST_BRANCH c ON b.FATHER_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID INNER JOIN STN_POS f ON a.POS_ID=f.ID INNER JOIN STN_MOVE g ON a.MOVE_ID=g.ID WHERE a.ISACTIVE=1 AND a.POS_ID IN (10106) AND g.ACTIVE=1";
                else if (strStaffPosId == "2010301") strBossListQry = "SELECT NVL(d.IMAGE,'male.png') as IMAGE, d.FNAME||' '||d.LNAME as STAFFNAME, f.NAME||' | '||CASE WHEN b.ID=b.FATHER_ID THEN b.INITNAME ELSE c.INITNAME||' - '||b.INITNAME END as POSNEGJ FROM ST_STBR a INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID INNER JOIN ST_BRANCH c ON b.FATHER_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID INNER JOIN STN_POS f ON a.POS_ID=f.ID INNER JOIN STN_MOVE g ON a.MOVE_ID=g.ID WHERE a.ISACTIVE=1 AND a.POS_ID IN (10106, 2010201) AND b.FATHER_ID=(SELECT b.FATHER_ID FROM ST_STBR a INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1) AND g.ACTIVE=1 ORDER BY f.SORT, c.SORT";
                else strBossListQry = "SELECT NVL(d.IMAGE,'male.png') as IMAGE, d.FNAME||' '||d.LNAME as STAFFNAME, f.NAME||' | '||CASE WHEN b.ID=b.FATHER_ID THEN b.INITNAME ELSE c.INITNAME||' - '||b.INITNAME END as POSNEGJ FROM ST_STBR a INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID INNER JOIN ST_BRANCH c ON b.FATHER_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID INNER JOIN STN_POS f ON a.POS_ID=f.ID INNER JOIN STN_MOVE g ON a.MOVE_ID=g.ID WHERE a.ISACTIVE=1 AND a.POS_ID IN (10106, 2010201, 2010301) AND b.FATHER_ID=(SELECT b.FATHER_ID FROM ST_STBR a INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID WHERE a.STAFFS_ID=" + Session["HRMIS_UserID"].ToString() + " AND a.ISACTIVE=1) AND g.ACTIVE=1 ORDER BY f.SORT, c.SORT";
                rdr =myObj.OracleExecuteReader(strBossListQry);
                if (rdr.HasRows)
                {
                    dashboardSection3DivBossList.InnerHtml = "<ul>";
                    while (rdr.Read())
                    {
                        dashboardSection3DivBossList.InnerHtml += "<li class=\"message\" style=\"height:50px;\"><img src=\"../files/staffs/" + rdr["IMAGE"].ToString() + "\" class=\"online\" style=\"height:50px;\"><span class=\"message-text\"><a href=\"javascript:void(0);\" class=\"username\">" + rdr["STAFFNAME"].ToString() + "</a>" + rdr["POSNEGJ"].ToString() + "</span></li>";
                    }
                    dashboardSection3DivBossList.InnerHtml += "</ul>";
                }
                rdr.Close();
                rdr = myObj.OracleExecuteReader(@"SELECT 
  NVL(a.IMAGE,'male.png') as IMAGE
  , a.FNAME||' '||a.LNAME as STAFFNAME
  , g.NAME||' | '||CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||' - '||d.INITNAME END as POSNEGJ
  , SUBSTR(a.BDATE,6,2)||' сарын '||SUBSTR(a.BDATE,9,2) as DT 
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID AND c.ACTIVE=1 
INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID 
INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID 
INNER JOIN STN_POS g ON b.POS_ID=g.ID 
WHERE a.BDATE IS NOT NULL AND TO_CHAR(SYSDATE,'YYYY')||SUBSTR(a.BDATE,5) BETWEEN TO_CHAR((SELECT TRUNC(sysdate,'IW') FROM DUAL),'YYYY-MM-DD') AND TO_CHAR((select next_day(sysdate,'SUNDAY') from dual),'YYYY-MM-DD')
ORDER BY SUBSTR(a.BDATE,6,2)||' сарын '||SUBSTR(a.BDATE,9,2)");
                if (rdr.HasRows)
                {
                    dashboardSection3DivBdayList.InnerHtml = "<ul>";
                    while (rdr.Read())
                    {
                        dashboardSection3DivBdayList.InnerHtml += "<li class=\"message\" style=\"height:50px;\"><img src=\"../files/staffs/" + rdr["IMAGE"].ToString() + "\" class=\"online\" style=\"height:50px;\"><span class=\"message-text\"><a href=\"javascript:void(0);\" class=\"username\">" + rdr["STAFFNAME"].ToString() + "</a>" + rdr["POSNEGJ"].ToString() + "</span><span class=\"txt-color-red pull-right\">" + rdr["DT"].ToString() + "</span></li>";
                    }
                    dashboardSection3DivBdayList.InnerHtml += "</ul>";
                }
                rdr.Close();
                rdr =myObj.OracleExecuteReader("SELECT * FROM ( SELECT 'Бүгд' as TP, RANKPOSTYPE_ID, SUM(CNT) as CNT FROM ( SELECT RANKPOSTYPE_ID, COUNT(STAFFS_ID) as CNT FROM ( SELECT a.STAFFS_ID, c.RANKPOSTYPE_ID FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID INNER JOIN ST_RANK c ON a.RANK_ID=c.ID WHERE a.ISACTIVE=1 AND b.ACTIVE=1 AND a.RANK_ID IS NOT NULL GROUP BY a.STAFFS_ID, c.RANKPOSTYPE_ID ) GROUP BY RANKPOSTYPE_ID UNION ALL SELECT ID as RANKPOSTYPE_ID, 0 as CNT FROM STN_RANKPOSTYPE UNION ALL SELECT 99 as RANKPOSTYPE_ID, 0 as CNT FROM DUAL UNION ALL SELECT 99 as RANKPOSTYPE_ID, COUNT(STAFFS_ID) as CNT FROM ( SELECT a.STAFFS_ID, c.RANKPOSTYPE_ID FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID INNER JOIN ST_RANK c ON a.RANK_ID=c.ID WHERE a.ISACTIVE=1 AND b.ACTIVE=1 AND a.RANK_ID IS NOT NULL GROUP BY a.STAFFS_ID, c.RANKPOSTYPE_ID ) ) GROUP BY RANKPOSTYPE_ID UNION ALL SELECT 'Эрэгтэй' as TP, RANKPOSTYPE_ID, SUM(CNT) as CNT FROM ( SELECT RANKPOSTYPE_ID, COUNT(STAFFS_ID) as CNT FROM ( SELECT a.STAFFS_ID, c.RANKPOSTYPE_ID FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID INNER JOIN ST_RANK c ON a.RANK_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID WHERE a.ISACTIVE=1 AND b.ACTIVE=1 AND a.RANK_ID IS NOT NULL AND d.GENDER=1 GROUP BY a.STAFFS_ID, c.RANKPOSTYPE_ID ) GROUP BY RANKPOSTYPE_ID UNION ALL SELECT ID as RANKPOSTYPE_ID, 0 as CNT FROM STN_RANKPOSTYPE UNION ALL SELECT 99 as RANKPOSTYPE_ID, 0 as CNT FROM DUAL UNION ALL SELECT 99 as RANKPOSTYPE_ID, COUNT(STAFFS_ID) as CNT FROM ( SELECT a.STAFFS_ID, c.RANKPOSTYPE_ID FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID INNER JOIN ST_RANK c ON a.RANK_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID WHERE a.ISACTIVE=1 AND b.ACTIVE=1 AND a.RANK_ID IS NOT NULL AND d.GENDER=1 GROUP BY a.STAFFS_ID, c.RANKPOSTYPE_ID ) ) GROUP BY RANKPOSTYPE_ID UNION ALL SELECT 'Эмэгтэй' as TP, RANKPOSTYPE_ID, SUM(CNT) as CNT FROM ( SELECT RANKPOSTYPE_ID, COUNT(STAFFS_ID) as CNT FROM ( SELECT a.STAFFS_ID, c.RANKPOSTYPE_ID FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID INNER JOIN ST_RANK c ON a.RANK_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID WHERE a.ISACTIVE=1 AND b.ACTIVE=1 AND a.RANK_ID IS NOT NULL AND d.GENDER=0 GROUP BY a.STAFFS_ID, c.RANKPOSTYPE_ID ) GROUP BY RANKPOSTYPE_ID UNION ALL SELECT ID as RANKPOSTYPE_ID, 0 as CNT FROM STN_RANKPOSTYPE UNION ALL SELECT 99 as RANKPOSTYPE_ID, 0 as CNT FROM DUAL UNION ALL SELECT 99 as RANKPOSTYPE_ID, COUNT(STAFFS_ID) as CNT FROM ( SELECT a.STAFFS_ID, c.RANKPOSTYPE_ID FROM ST_STBR a INNER JOIN STN_MOVE b ON a.MOVE_ID=b.ID INNER JOIN ST_RANK c ON a.RANK_ID=c.ID INNER JOIN ST_STAFFS d ON a.STAFFS_ID=d.ID WHERE a.ISACTIVE=1 AND b.ACTIVE=1 AND a.RANK_ID IS NOT NULL AND d.GENDER=0 GROUP BY a.STAFFS_ID, c.RANKPOSTYPE_ID ) ) GROUP BY RANKPOSTYPE_ID ) PIVOT ( SUM(CNT) AS CNT FOR (RANKPOSTYPE_ID) IN (1, 2, 3, 4, 5, 6, 99))");
                if (rdr.HasRows)
                {
                    dashboardSection2RankTable.InnerHtml = "<table class=\"table\"><tbody><tr><th></th><th class=\"text-center\">УТ</th><th class=\"text-center\">ТТ</th><th class=\"text-center\">ТҮ</th><th class=\"text-center\">ТЗ</th><th class=\"text-center\">ТӨ</th><th class=\"text-center\">АА</th><th class=\"text-center\">Нийт</th></tr>";
                    while (rdr.Read())
                    {
                        dashboardSection2RankTable.InnerHtml += "<tr><td class=\"text-right\">" + rdr["TP"].ToString() + "</td><th class=\"text-center text-primary\">" + rdr["1_CNT"].ToString() + "</th><th class=\"text-center text-primary\">" + rdr["2_CNT"].ToString() + "</th><th class=\"text-center text-primary\">" + rdr["3_CNT"].ToString() + "</th><th class=\"text-center text-primary\">" + rdr["4_CNT"].ToString() + "</th><th class=\"text-center text-primary\">" + rdr["5_CNT"].ToString() + "</th><th class=\"text-center text-primary\">" + rdr["6_CNT"].ToString() + "</th><th class=\"text-center text-primary\">" + rdr["99_CNT"].ToString() + "</th></tr>";
                    }
                    dashboardSection2RankTable.InnerHtml += "</tbody></table>";
                }
                rdr.Close();
                rdr =myObj.OracleExecuteReader("SELECT b.NAME, COUNT(a.ID) as CNT FROM ( SELECT a.EDUTP_ID, a.ID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE b.ISACTIVE=1 AND c.ACTIVE=1 AND a.EDUTP_ID IN (1,3,4,7) GROUP BY a.EDUTP_ID, a.ID UNION ALL SELECT ID as EDUTP_ID, 0 FROM STN_EDUTP WHERE ID IN (1,3,4,7) ) a INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID GROUP BY b.NAME");
                if (rdr.HasRows)
                {
                    dashboardSection2Edutplist.InnerHtml="";
                    while (rdr.Read())
                    {
                        dashboardSection2Edutplist.InnerHtml += "<div class=\"col-sm-3 text-center no-padding\">" + rdr["NAME"].ToString() + " <p class=\"font-lg\">" + rdr["CNT"].ToString() + "</p></div>";
                    }
                }
                rdr.Close();
                rdr = myObj.OracleExecuteReader("SELECT NVL(a.IMAGE,'male.png') as IMAGE, a.FNAME||' '||a.LNAME as STAFFNAME, g.NAME||' | '||CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||' - '||d.INITNAME END as POSNEGJ, b.DT FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID AND c.ACTIVE=1 INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID INNER JOIN STN_POS g ON b.POS_ID=g.ID WHERE b.DT IS NOT NULL AND  TO_DATE(b.DT,'YYYY-MM-DD') BETWEEN SYSDATE-14 AND SYSDATE ORDER BY b.DT");
                if (rdr.HasRows)
                {
                    dashboardSection2DivLastActionList.InnerHtml = "<ul>";
                    while (rdr.Read())
                    {
                        dashboardSection2DivLastActionList.InnerHtml += "<li class=\"message\" style=\"height:50px;\"><img src=\"../files/staffs/" + rdr["IMAGE"].ToString() + "\" class=\"online\" style=\"height:50px;\"><span class=\"message-text\"><a href=\"javascript:void(0);\" class=\"username\">" + rdr["STAFFNAME"].ToString() + "</a>" + rdr["POSNEGJ"].ToString() + "</span><span class=\"txt-color-red pull-right\">" + rdr["DT"].ToString() + "</span></li>";
                    }
                    dashboardSection2DivLastActionList.InnerHtml += "</ul>";
                }
                rdr.Close();

                myObj.DBDisconnect();
                strMyVal =myObj.OracleExecuteScalar("SELECT MALE_CNT||'~'||FEMALE_CNT FROM ( SELECT * FROM ( SELECT GENDER, SUM(CNT) as CNT FROM ( SELECT GENDER, COUNT(GENDER) as CNT FROM ( SELECT a.ID, a.GENDER FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE b.ISACTIVE=1 AND c.ACTIVE=1 GROUP BY a.ID, a.GENDER ) GROUP BY GENDER UNION ALL SELECT 1 as GENDER, 0 AS CNT FROM DUAL UNION ALL SELECT 0 as GENDER, 0 AS CNT FROM DUAL ) GROUP BY GENDER ) PIVOT ( SUM(CNT) AS CNT FOR (GENDER) IN (1 as MALE, 0 as FEMALE)))").ToString();
                dashboardSection2GenderTotal.InnerHtml = (Int32.Parse(strMyVal.Split('~')[0]) + Int32.Parse(strMyVal.Split('~')[1])).ToString();
                dashboardSection2GenderMale.InnerHtml = strMyVal.Split('~')[0];
                dashboardSection2GenderFemale.InnerHtml = strMyVal.Split('~')[1];
                //dashboardSection2GenderPie.InnerHtml = strMyVal.Replace("~",",");

                dashboardSection1WorkingtimeSelectYear.SelectedIndex = dashboardSection1WorkingtimeSelectYear.Items.IndexOf(dashboardSection1WorkingtimeSelectYear.Items.FindByValue(DateTime.Now.ToString("yyyy")));
                dashboardSection1WorkingtimeSelectMonth.SelectedIndex = dashboardSection1WorkingtimeSelectMonth.Items.IndexOf(dashboardSection1WorkingtimeSelectMonth.Items.FindByValue(System.DateTime.Now.Month.ToString()));

                ds.Clear();
                strMyVal = "";
                strQry = @"WITH TMP_DAYLIST as (
    SELECT TO_CHAR(a.DT,'YYYY-MM-DD') as DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 1 ELSE a.ISWORK END as ISWORK
    FROM (
        SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 0 ELSE a.ISWORK END as ISWORK
        FROM (
            SELECT a.DT, CASE WHEN b.HOLMONTH IS NOT NULL AND b.HOLDAY IS NOT NULL THEN 0 ELSE a.ISWORK END AS ISWORK
            FROM (
                SELECT DT, CASE WHEN (MOD(TO_CHAR(DT, 'J'), 7) + 1)=6 OR (MOD(TO_CHAR(DT, 'J'), 7) + 1)=7 THEN 0 ELSE 1 END AS ISWORK
                FROM(
                  SELECT add_months((SYSDATE-1),-1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (SYSDATE-1) - add_months((SYSDATE-1),-1)
                )
                WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
            ) a
            LEFT JOIN hrdbuser.ST_HOLIDAYOFFICIAL b ON TO_NUMBER(TO_CHAR(a.DT, 'MM'))=b.HOLMONTH AND TO_NUMBER(TO_CHAR(a.DT, 'DD'))=b.HOLDAY
        ) a 
        LEFT JOIN hrdbuser.ST_HOLIDAYUNOFFICIAL b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
    ) a
    LEFT JOIN hrdbuser.ST_HOLIDAYISWORK b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
)
SELECT 
    a.DT
    , b.MINTM as MY_MINTM
    , b.MAXTM as MY_MAXTM
    , c.MINTM
    , d.MAXTM
FROM TMP_DAYLIST a
LEFT JOIN (
    SELECT 
        b.ID as ST_ID
        , TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'yyyy-mm-dd') as DT
        , ROUND(TO_NUMBER(TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24mi.ss')))+1 as MINTM
        , ROUND(TO_NUMBER(TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24mi.ss')))+1 as MAXTM
    FROM hr_mof.STN_TRCDLOG a
    INNER JOIN hrdbuser.ST_STAFFS b ON a.ENO = b.FINGERID
    INNER JOIN hrdbuser.ST_STBR c ON b.ID = c.STAFFS_ID AND c.ISACTIVE=1
    INNER JOIN hrdbuser.STN_MOVE d ON c.MOVE_ID = d.ID
    INNER JOIN TMP_DAYLIST f ON TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'yyyy-mm-dd')=f.DT
    WHERE d.ACTIVE = 1
        AND a.INOUT = 0 
        AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN add_months((SYSDATE-1),-1) AND SYSDATE 
        AND TO_DATE(c.DT, 'YYYY-MM-DD') <= TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
        AND f.ISWORK=1
        AND b.ID=" + userData.USR_STAFFID + @"
    GROUP BY b.ID, TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'yyyy-mm-dd')
) b ON a.DT=b.DT
LEFT JOIN (
    SELECT DT, ROUND(AVG(MINTM))+1 as MINTM
    FROM (
        SELECT 
            b.ID as ST_ID
            , TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'),'YYYY-MM-DD') as DT
            , ROUND(TO_NUMBER(TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24mi.ss')))+1 as MINTM
        FROM hr_mof.STN_TRCDLOG a
        INNER JOIN hrdbuser.ST_STAFFS b ON a.ENO = b.FINGERID
        INNER JOIN hrdbuser.ST_STBR c ON b.ID = c.STAFFS_ID AND c.ISACTIVE=1
        INNER JOIN hrdbuser.STN_MOVE d ON c.MOVE_ID = d.ID
        INNER JOIN TMP_DAYLIST f ON TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'),'YYYY-MM-DD')=f.DT
        WHERE d.ACTIVE = 1
            AND a.INOUT = 0 
            AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN add_months((SYSDATE-1),-1) AND SYSDATE 
            AND TO_DATE(c.DT, 'YYYY-MM-DD') <= TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
            AND f.ISWORK=1
            AND a.YEAR=TO_CHAR(SYSDATE,'YYYY')
        GROUP BY b.ID, TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'),'YYYY-MM-DD')
    )
    WHERE MINTM IS NOT NULL
    GROUP BY DT
) c ON a.DT=c.DT
LEFT JOIN (
    SELECT DT, ROUND(AVG(MAXTM))+1 as MAXTM
    FROM (
        SELECT 
            b.ID as ST_ID
            , TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'),'YYYY-MM-DD') as DT
            , ROUND(TO_NUMBER(TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24mi.ss')))+1 as MAXTM
        FROM hr_mof.STN_TRCDLOG a
        INNER JOIN hrdbuser.ST_STAFFS b ON a.ENO = b.FINGERID
        INNER JOIN hrdbuser.ST_STBR c ON b.ID = c.STAFFS_ID AND c.ISACTIVE=1
        INNER JOIN hrdbuser.STN_MOVE d ON c.MOVE_ID = d.ID
        INNER JOIN TMP_DAYLIST f ON TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'),'YYYY-MM-DD')=f.DT
        WHERE d.ACTIVE = 1
            AND a.INOUT = 0 
            AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN add_months((SYSDATE-1),-1) AND SYSDATE 
            AND TO_DATE(c.DT, 'YYYY-MM-DD') <= TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
            AND f.ISWORK=1
            AND a.YEAR=TO_CHAR(SYSDATE,'YYYY')
        GROUP BY b.ID, TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'),'YYYY-MM-DD')
    )
    WHERE MAXTM IS NOT NULL
    GROUP BY DT
) d ON a.DT=d.DT 
WHERE a.ISWORK=1
ORDER BY a.DT ASC";
                ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    strMyVal = "[";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (strMyVal != "[") strMyVal += ",";
                        strMyVal += "{\"period\": \""+ dr["DT"].ToString() + "\", \"my_irsen\": ";
                        if (dr["MY_MINTM"].ToString() != "" && dr["MY_MINTM"].ToString() != null) strMyVal += dr["MY_MINTM"].ToString();
                        else strMyVal += "null";
                        strMyVal += ", \"mof_irsen\": ";
                        if (dr["MINTM"].ToString() != "" && dr["MINTM"].ToString() != null) strMyVal += dr["MINTM"].ToString();
                        else strMyVal += "null";
                        strMyVal += ", \"my_yavsan\": ";
                        if (dr["MY_MAXTM"].ToString() != "" && dr["MY_MAXTM"].ToString() != null) strMyVal += dr["MY_MAXTM"].ToString();
                        else strMyVal += "null";
                        strMyVal += ", \"mof_yavsan\": ";
                        if (dr["MAXTM"].ToString() != "" && dr["MAXTM"].ToString() != null) strMyVal += dr["MAXTM"].ToString();
                        else strMyVal += "null";
                        strMyVal += "}";
                    }
                    strMyVal += "]";
                }
                dashboardAttendanceStatChart01.Value = strMyVal;
            }
            catch (NullReferenceException ex)
            {

            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                Response.Redirect("~/#pg/error500.aspx");
            }
        }
    }
}