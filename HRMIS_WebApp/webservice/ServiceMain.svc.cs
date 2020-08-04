using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.DirectoryServices;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web;
using static HRWebApp.cs.CMain;

namespace HRWebApp.webservice
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ServiceMain" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ServiceMain.svc or ServiceMain.svc.cs at the Solution Explorer and start debugging.
    public class ServiceMain : IServiceMain
    {
        int intJsonStatusSuccess = Int32.Parse(ConfigurationManager.AppSettings["JsonStatusSuccess"].ToString());
        int intJsonStatusFailed = Int32.Parse(ConfigurationManager.AppSettings["JsonStatusFailed"].ToString());
        public string GazarListForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID IN (1,3) AND ISACTIVE=1 ORDER BY SORT");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string HeltesListForDDL(string gazarId)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            DataSet ds = null;
            string strQry = "";
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if ("0" != myObj.OracleExecuteScalar("SELECT COUNT(1) FROM ST_BRANCH WHERE BRANCH_TYPE_ID=2 AND ISACTIVE=1 AND FATHER_ID=" + gazarId).ToString())
                {
                    strQry = @"SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID=3 AND ISACTIVE=1 AND ID="+gazarId+@"
UNION ALL
SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID=2 AND ISACTIVE=1 AND FATHER_ID=" + gazarId;
                }
                else
                {
                    strQry = "SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID IN (1,3) AND ISACTIVE=1 AND FATHER_ID=" + gazarId;
                }
                ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string StaffListForDDL(string gazarId, string heltesId)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            string strQry = "";
            if (gazarId != "") gazarId = " AND f.FATHER_ID=" + gazarId;
            //if (heltesId != "") heltesId = " AND b.BRANCH_ID=" + heltesId;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (heltesId == "")
                    strQry = @"SELECT a.ID as ST_ID, SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,0,1)||LOWER(SUBSTR(a.FNAME,2)) as ST_NAME, d.NAME as POS_NAME, f.ID as BR_ID, CASE WHEN f.ID=f.FATHER_ID THEN f.INITNAME ELSE g.INITNAME||'-'||f.INITNAME END as DOMAIN_ORG 
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID AND c.ACTIVE=1 
LEFT JOIN STN_POS d ON b.POS_ID=d.ID 
INNER JOIN ST_BRANCH f ON b.BRANCH_ID=f.ID AND f.ISACTIVE=1 
INNER JOIN ST_BRANCH g ON f.FATHER_ID=g.ID AND g.ISACTIVE=1 
WHERE 1=1" + gazarId + @" 
ORDER BY g.SORT, f.SORT, d.SORT";
                else strQry = @"SELECT h.ST_ID, SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,0,1)||LOWER(SUBSTR(a.FNAME,2)) as ST_NAME, d.NAME as POS_NAME, f.ID as BR_ID, CASE WHEN f.ID=f.FATHER_ID THEN f.INITNAME ELSE g.INITNAME||'-'||f.INITNAME END as DOMAIN_ORG 
FROM(
  SELECT ST_ID
  FROM(
    SELECT a.ID as ST_ID
    FROM ST_STAFFS a
    INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
    INNER JOIN STN_MOVE c ON b.MOVE_ID = c.ID AND c.ACTIVE = 1
    INNER JOIN ST_BRANCH f ON b.BRANCH_ID = f.ID AND f.ISACTIVE = 1
    WHERE f.FATHER_ID = (SELECT FATHER_ID FROM ST_BRANCH WHERE ID = " + heltesId + @" AND ISACTIVE = 1) AND b.POS_ID = 2010201
    UNION ALL
    SELECT a.ID as ST_ID
    FROM ST_STAFFS a
    INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
    INNER JOIN STN_MOVE c ON b.MOVE_ID = c.ID AND c.ACTIVE = 1
    INNER JOIN ST_BRANCH f ON b.BRANCH_ID = f.ID AND f.ISACTIVE = 1
    WHERE f.ID = " + heltesId + @"
  )
  GROUP BY ST_ID
) h
INNER JOIN ST_STAFFS a ON h.ST_ID = a.ID
INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
INNER JOIN STN_MOVE c ON b.MOVE_ID = c.ID AND c.ACTIVE = 1
LEFT JOIN STN_POS d ON b.POS_ID = d.ID
INNER JOIN ST_BRANCH f ON b.BRANCH_ID = f.ID AND f.ISACTIVE = 1
INNER JOIN ST_BRANCH g ON f.FATHER_ID = g.ID AND g.ISACTIVE = 1
ORDER BY g.SORT, f.SORT, d.SORT";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string StaffListForSelect2(string selectedList)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet("SELECT b.BRANCH_ID , CASE WHEN d.ID = d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME || '-' || d.INITNAME END AS NEGJNAME , a.ID as STAFFS_ID , SUBSTR(a.LNAME, 0, 1) || '.' || SUBSTR(a.FNAME, 1, 1) || LOWER(SUBSTR(a.FNAME, 2)) as STAFFS_NAME , g.NAME as POS_NAME , NVL2(h.STAFFS_ID, ' selected=\"selected\"', null) as ISSELECTED FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1 INNER JOIN STN_MOVE c ON b.MOVE_ID = c.ID AND c.ACTIVE = 1 INNER JOIN ST_BRANCH d ON b.BRANCH_ID = d.ID AND d.ISACTIVE = 1 INNER JOIN ST_BRANCH f ON d.FATHER_ID = f.ID AND d.ISACTIVE = 1 INNER JOIN STN_POS g ON b.POS_ID = g.ID LEFT JOIN( select regexp_substr('" + selectedList + "', '[^,]+', 1, level) AS STAFFS_ID from dual connect by regexp_substr('" + selectedList + "', '[^,]+', 1, level) is not null ) h ON a.ID = h.STAFFS_ID ORDER BY f.SORT, d.SORT, g.SORT, a.ID");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string OracleExecuteScalar(string qry)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObj.OracleExecuteScalar(qry).ToString();
            }
            catch (NullReferenceException ex)
            {
                return "";
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
        public void OracleExecuteNonQuery(string qry)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                myObj.OracleExecuteNonQuery(qry).ToString();
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

        //*****property.aspx*****//
        public string PropertyTab1Datatable(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ROWNUM as ROWNO, a.*
FROM (
  SELECT a.RECEIVEDDT, a.PROPERTYLIST_ID, b.CODE, b.PROPERTYTYPELIST_ID, c.NAME as PROPERTYTYPELIST_NAME, b.UNITLIST_ID, d.NAME as UNITLIST_NAME, b.UNITPRICE, b.DESCRIPTION
  FROM ST_PROPERTYUSE a
  INNER JOIN ST_PROPERTYLIST b ON a.PROPERTYLIST_ID=b.ID
  INNER JOIN STN_PROPERTYTYPELIST c ON b.PROPERTYTYPELIST_ID=c.ID
  INNER JOIN STN_UNITLIST d ON b.UNITLIST_ID=d.ID
  WHERE a.STAFFS_ID="+ staffid + @" AND a.HANDADDATE is null
  ORDER BY a.RECEIVEDDT, b.CODE
) a");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string PropertyTab1PropertyTypeListForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_PROPERTYTYPELIST ORDER BY NAME");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string PropertyTab1UnitListForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_UNITLIST ORDER BY NAME");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public void PROPERTYUSE_INSERT(string P_RECEIVEDDT, string P_CODE, string P_PROPERTYTYPELIST_ID, string P_UNITLIST_ID, string P_UNITPRICE, string P_DESCRIPTION, string P_STAFFS_ID, string P_MOD_STAFFS_ID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[8], ParamValue = new string[8];
                ParamName[0] = "P_RECEIVEDDT";
                ParamName[1] = "P_CODE";
                ParamName[2] = "P_PROPERTYTYPELIST_ID";
                ParamName[3] = "P_UNITLIST_ID";
                ParamName[4] = "P_UNITPRICE";
                ParamName[5] = "P_DESCRIPTION";
                ParamName[6] = "P_STAFFS_ID";
                ParamName[7] = "P_MOD_STAFFS_ID";
                ParamValue[0] = P_RECEIVEDDT;
                ParamValue[1] = P_CODE;
                ParamValue[2] = P_PROPERTYTYPELIST_ID;
                ParamValue[3] = P_UNITLIST_ID;
                ParamValue[4] = P_UNITPRICE;
                ParamValue[5] = P_DESCRIPTION;
                ParamValue[6] = P_STAFFS_ID;
                ParamValue[7] = P_MOD_STAFFS_ID;
                myObj.SP_OracleExecuteNonQuery("PROPERTYUSE_INSERT", ParamName, ParamValue);
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
        public void PROPERTYUSE_UPDATE(string P_PROPERTYLIST_ID, string P_RECEIVEDDT, string P_CODE, string P_PROPERTYTYPELIST_ID, string P_UNITLIST_ID, string P_UNITPRICE, string P_DESCRIPTION, string P_STAFFS_ID, string P_MOD_STAFFS_ID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[9], ParamValue = new string[9];
                ParamName[0] = "P_PROPERTYLIST_ID";
                ParamName[1] = "P_RECEIVEDDT";
                ParamName[2] = "P_CODE";
                ParamName[3] = "P_PROPERTYTYPELIST_ID";
                ParamName[4] = "P_UNITLIST_ID";
                ParamName[5] = "P_UNITPRICE";
                ParamName[6] = "P_DESCRIPTION";
                ParamName[7] = "P_STAFFS_ID";
                ParamName[8] = "P_MOD_STAFFS_ID";
                ParamValue[0] = P_PROPERTYLIST_ID;
                ParamValue[1] = P_RECEIVEDDT;
                ParamValue[2] = P_CODE;
                ParamValue[3] = P_PROPERTYTYPELIST_ID;
                ParamValue[4] = P_UNITLIST_ID;
                ParamValue[5] = P_UNITPRICE;
                ParamValue[6] = P_DESCRIPTION;
                ParamValue[7] = P_STAFFS_ID;
                ParamValue[8] = P_MOD_STAFFS_ID;
                myObj.SP_OracleExecuteNonQuery("PROPERTYUSE_UPDATE", ParamName, ParamValue);
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
        public string PropertyTab2Datatable()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ROWNUM as ROWNO, a.* FROM ( SELECT ID, NAME FROM STN_PROPERTYTYPELIST ORDER BY NAME ) a");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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

        //*****srv.aspx*****//
        public string SrvTab1Datatable(string tp, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            if (tp == "1") tp = " WHERE TO_DATE(a.BEGINDT, 'YYYY-MM-DD') <= SYSDATE AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') >= SYSDATE";
            else if (tp == "2") tp = " WHERE TO_DATE(a.ENDDT, 'YYYY-MM-DD') < SYSDATE";
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ROWNUM as ROWNO, a.* 
FROM ( SELECT a.ID, TITLE, a.BEGINDT, a.ENDDT, a.FILENAME, CASE WHEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') <= SYSDATE AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') >= SYSDATE THEN 1 ELSE 0 END as ISACTIVE, CASE WHEN SRVANSWER_ID is not null THEN 1 ELSE 0 END as ISANSWERED
FROM ST_SRVQUESTION a
LEFT JOIN ST_SRVRESULT b ON a.ID=b.SRVQUESTION_ID AND b.STAFFS_ID=" + staffid+ tp + @"
ORDER BY a.BEGINDT, a.ENDDT ) a");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string SrvTab1AnswerList(string questionid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, NAME FROM ST_SRVANSWER WHERE SRVQUESTION_ID="+questionid+" ORDER BY ID");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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

        //*****amralt.aspx*****//
        public string AmraltTab1GetAmraltDays(string yr, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 15 as DEFAULT_DAY, a.NEMEGDEL_DAY, NVL(b.AMRALTDAY,0) as AMARSAN_DAY
FROM ( 
  SELECT " + staffid + @"  as STAFF_ID, CASE WHEN 6 > YRCNT THEN 0 WHEN 6 <= YRCNT AND 11 > YRCNT THEN 3 WHEN 11 <= YRCNT AND 16 > YRCNT THEN 5 WHEN 16 <= YRCNT AND 21 > YRCNT THEN 7 WHEN 21 <= YRCNT AND 26 > YRCNT THEN 9 WHEN 26 <= YRCNT AND 32 > YRCNT THEN 11 WHEN 32 <= YRCNT THEN 14 END as NEMEGDEL_DAY 
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
          WHERE a.STAFFS_ID=" + staffid + @"  
          GROUP BY b.ISGOV 
          UNION ALL 
          SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG 
          FROM ST_STBR a 
          INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID 
          WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + staffid + @"  
        ) 
        UNION ALL 
        SELECT 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG 
        FROM ( 
          SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
          FROM ST_EXPHISTORY a 
          INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
          WHERE a.STAFFS_ID=" + staffid + @"  
          GROUP BY b.ISGOV 
          UNION ALL 
          SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG 
          FROM ST_STBR a 
          INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID 
          WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + staffid + @"  
        ) 
        WHERE ISGOV=1 
        UNION ALL 
        SELECT 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG 
        FROM ( 
          SELECT SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
          FROM ST_EXPHISTORY a 
          INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
          WHERE a.STAFFS_ID=" + staffid + @"  
          GROUP BY b.ISGOV 
          UNION ALL 
          SELECT SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG 
          FROM ST_STBR a 
          INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID 
          WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102 AND a.STAFFS_ID = " + staffid + @" 
        ) 
        WHERE ISMYORG=1
      )
    )
  ) 
) a
LEFT JOIN (
  SELECT " + staffid + @"  as STAFF_ID, COUNT(a.STAFFS_ID) as AMRALTDAY 
  FROM ( 
    SELECT a.STAFFS_ID, a.BEGINDT||' - '||a.ENDDT as TM, b.DT 
    FROM ST_AMRALT a 
    INNER JOIN ( 
      SELECT a.DT
      FROM ( 
        SELECT DT 
        FROM ( 
          SELECT DT 
          FROM( 
            SELECT(TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT 
            FROM DUAL 
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') 
          ) 
          WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5) 
          UNION ALL 
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT 
          FROM ST_HOLIDAYISWORK 
          WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" 
        ) 
        GROUP BY DT 
      ) a
      LEFT JOIN ( 
        SELECT DT 
        FROM ( 
          SELECT TO_DATE('" + yr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT 
          FROM ST_HOLIDAYOFFICIAL 
          UNION ALL 
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT 
          FROM ST_HOLIDAYUNOFFICIAL 
          WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" 
        ) 
        GROUP BY DT 
      ) b ON a.DT=b.DT 
      WHERE b.DT IS NULL 
    ) b ON TO_DATE(a.BEGINDT, 'yyyy-mm-dd') <= b.DT AND TO_DATE(a.ENDDT, 'yyyy-mm-dd') >= b.DT 
    WHERE TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'YYYY'))=" + yr + @" AND a.STAFFS_ID="+staffid+@" 
    ORDER BY a.STAFFS_ID, b.DT 
  ) a 
  GROUP BY a.STAFFS_ID
) b ON a.STAFF_ID=b.STAFF_ID");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string AmraltTab2t1Datatable(string yr, string gazarid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            if (gazarid != "") gazarid = " AND d.FATHER_ID=" + gazarid;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ROWNUM as ROWNO, a.* FROM ( 
SELECT 
  a.ID, 
  CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||'-'||d.INITNAME END as NEGJ,
  SUBSTR(b.LNAME,0,1)||'.'||b.FNAME as STAFFNAME, 
  g.NAME as POS_NAME, 
  h.NEMEGDEL_DAY as AMRAH_HONOG, 
  i.AMRALTDAY as AMARSAN_HONOG, 
  j.TMLIST, 
  NVL(h.NEMEGDEL_DAY,0)-NVL(i.AMRALTDAY, 0) as DUTUU_HONOG
FROM ST_AMRALT a 
INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID 
INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
INNER JOIN ST_BRANCH d ON c.BRANCH_ID=d.ID 
INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID 
LEFT JOIN STN_POS g ON c.POS_ID=g.ID 
LEFT JOIN (
  SELECT STAFFS_ID, 
    CASE 
      WHEN 6 > YRCNT THEN 0 
      WHEN 6 <= YRCNT AND 11 > YRCNT THEN 3 
      WHEN 11 <= YRCNT AND 16 > YRCNT THEN 5
      WHEN 16 <= YRCNT AND 21 > YRCNT THEN 7 
      WHEN 21 <= YRCNT AND 26 > YRCNT THEN 9 
      WHEN 26 <= YRCNT AND 32 > YRCNT THEN 11 
      WHEN 32 <= YRCNT THEN 14 
    END+15 as NEMEGDEL_DAY 
  FROM( 
    SELECT STAFFS_ID, SUM(YRCNT) as YRCNT 
    FROM( 
      SELECT STAFFS_ID, ROUND(SUM(TOTALTM)/365,1) as YRCNT 
      FROM ( 
        SELECT STAFFS_ID, SUM(CC) as TOTALTM, 0 as ISGOVTM, 0 as ISMYORG 
        FROM ( 
          SELECT a.STAFFS_ID, SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
          FROM ST_EXPHISTORY a 
          INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
          GROUP BY b.ISGOV, a.STAFFS_ID
          UNION ALL 
          SELECT a.STAFFS_ID, SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG 
          FROM ST_STBR a 
          INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID 
          WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102
          GROUP BY a.STAFFS_ID
        ) 
        GROUP BY STAFFS_ID
        UNION ALL 
        SELECT STAFFS_ID, 0 as TOTALTM, SUM(CC) as ISGOVTM, 0 as ISMYORG 
        FROM ( 
          SELECT a.STAFFS_ID, SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
          FROM ST_EXPHISTORY a 
          INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
          GROUP BY a.STAFFS_ID, b.ISGOV
          UNION ALL 
          SELECT a.STAFFS_ID, SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG 
          FROM ST_STBR a 
          INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID 
          WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102
          GROUP BY a.STAFFS_ID
        ) 
        WHERE ISGOV=1 
        GROUP BY STAFFS_ID
        UNION ALL 
        SELECT STAFFS_ID, 0 as TOTALTM, 0 as ISGOVTM, SUM(CC) as ISMYORG 
        FROM ( 
          SELECT a.STAFFS_ID, SUM(NVL(TO_DATE(a.TODATE,'YYYY-MM-DD'),SYSDATE)-TO_DATE(a.FROMDATE,'YYYY-MM-DD') + 1) as CC, b.ISGOV, 0 as ISMYORG 
          FROM ST_EXPHISTORY a 
          INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
          GROUP BY a.STAFFS_ID, b.ISGOV 
          UNION ALL 
          SELECT a.STAFFS_ID, SUM(ROUND(NVL(TO_DATE(a.ENDDT, 'YYYY-MM-DD'), SYSDATE) - TO_DATE(a.DT, 'YYYY-MM-DD') + 1)) as CC, 1 as ISGOV, 1 as ISMYORG 
          FROM ST_STBR a 
          INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID 
          WHERE (b.ACTIVE = 1 OR b.MOVETYPE_ID=2) AND a.POS_ID != 2020102
          GROUP BY a.STAFFS_ID
        ) 
        WHERE ISMYORG=1
        GROUP BY STAFFS_ID
      )
      GROUP BY STAFFS_ID
    )
    GROUP BY STAFFS_ID
  )
) h ON a.STAFFS_ID=h.STAFFS_ID
LEFT JOIN (
  SELECT 
    a.STAFFS_ID, COUNT(a.STAFFS_ID) as AMRALTDAY
  FROM (
    SELECT 
      a.STAFFS_ID, 
      a.BEGINDT||' - '||a.ENDDT as TM, 
      b.DT
    FROM ST_AMRALT a 
    INNER JOIN (
      SELECT a.DT
      FROM (
        SELECT DT
        FROM (
          SELECT DT
          FROM(
            SELECT(TO_DATE('"+yr+ @"-1-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-1-01', 'yyyy-mm-dd')
          )
          WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5)
          UNION ALL
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @"
        )
        GROUP BY DT
      ) a
      LEFT JOIN (
        SELECT DT
        FROM (
          SELECT TO_DATE('" + yr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYOFFICIAL
          UNION ALL
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYUNOFFICIAL
          WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @"
        ) 
        GROUP BY DT
      ) b ON a.DT=b.DT
      WHERE b.DT IS NULL
    ) b ON TO_DATE(a.BEGINDT, 'yyyy-mm-dd') <= b.DT AND TO_DATE(a.ENDDT, 'yyyy-mm-dd') >= b.DT
    WHERE a.TZISRECEIVED=1 AND TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'YYYY'))=" + yr + @" 
    ORDER BY a.STAFFS_ID, b.DT
  ) a
  GROUP BY a.STAFFS_ID
) i ON a.STAFFS_ID=i.STAFFS_ID
LEFT JOIN ( 
  SELECT 
    STAFFS_ID, 
    RTRIM(xmlagg(xmlelement(e, TM || ', ') ORDER BY TM).extract('//text()'), ', ') as TMLIST
  FROM (
    SELECT 
      a.STAFFS_ID, 
      a.BEGINDT||' - '||a.ENDDT as TM 
    FROM ST_AMRALT a 
    INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID 
    INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
    INNER JOIN ST_BRANCH d ON c.BRANCH_ID=d.ID 
    INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID 
    LEFT JOIN STN_POS g ON c.POS_ID=g.ID 
    WHERE a.TZISRECEIVED=1 AND TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'YYYY'))=" + yr + @" 
    GROUP BY a.STAFFS_ID, a.BEGINDT||' - '||a.ENDDT
  )
  GROUP BY STAFFS_ID
) j ON a.STAFFS_ID=j.STAFFS_ID
WHERE a.TZISRECEIVED=1 AND TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'YYYY'))=" + yr+gazarid + @" 
ORDER BY f.SORT, d.SORT, g.SORT, a.STAFFS_ID
) a");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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

        //*****staffsdataadd.aspx*****//
        public string StaffsdataaddTab1Datatable(string fromdate, string todate, string decision, string type)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            if (decision != "") decision = " AND b.SHAGNALDECISION_ID=" + decision;
            if (type != "") type = " AND b.SHAGNALTYPE_ID=" + type;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT
  a.SHAGNAL_ID, 
  a.STAFFLISTID, 
  b.NAME, 
  b.DT, 
  b.SHAGNALTYPE_ID, 
  c.NAME as SHAGNALTYPE_NAME, 
  b.SHAGNALDECISION_ID, 
  d.NAME as SHAGNALDECISION_NAME, 
  b.ORGDESCRIPTION, 
  b.PRICE, 
  b.GROUND, 
  b.TUSHAALNO, 
  b.TUSHAALDT, 
  b.FILENAME
FROM (
  SELECT a.SHAGNAL_ID, RTRIM(xmlagg (xmlelement (e, a.STAFFS_ID || ',')).extract('//text()'), ',') as STAFFLISTID 
  FROM ST_SHAGNAL_STAFFS a 
  INNER JOIN ST_SHAGNAL b ON a.SHAGNAL_ID=b.ID
  WHERE TO_DATE(b.DT,'YYYY-MM-DD') BETWEEN TO_DATE('" + fromdate + @"','YYYY-MM-DD') AND TO_DATE('" + todate + @"','YYYY-MM-DD')" + decision + type + @"
  GROUP BY a.SHAGNAL_ID
) a 
INNER JOIN ST_SHAGNAL b ON a.SHAGNAL_ID=b.ID
INNER JOIN STN_SHAGNALTYPE c ON b.SHAGNALTYPE_ID=c.ID
INNER JOIN STN_SHAGNALDECISION d ON b.SHAGNALDECISION_ID=d.ID
ORDER BY b.DT");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public void SHAGNAL_INSERT(string P_NAME, string P_DT, string P_SHAGNALTYPE_ID, string P_SHAGNALDECISION_ID, string P_ORGDESCRIPTION, string P_PRICE, string P_GROUND, string P_TUSHAALNO, string P_TUSHAALDT, string P_FILENAME, string P_STAFFLIST, string P_STAFFID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[12], ParamValue = new string[12];
                ParamName[0] = "P_NAME";
                ParamName[1] = "P_DT";
                ParamName[2] = "P_SHAGNALTYPE_ID";
                ParamName[3] = "P_SHAGNALDECISION_ID";
                ParamName[4] = "P_ORGDESCRIPTION";
                ParamName[5] = "P_PRICE";
                ParamName[6] = "P_GROUND";
                ParamName[7] = "P_TUSHAALNO";
                ParamName[8] = "P_TUSHAALDT";
                ParamName[9] = "P_FILENAME";
                ParamName[10] = "P_STAFFLIST";
                ParamName[11] = "P_STAFFID";
                ParamValue[0] = P_NAME;
                ParamValue[1] = P_DT;
                ParamValue[2] = P_SHAGNALTYPE_ID;
                ParamValue[3] = P_SHAGNALDECISION_ID;
                ParamValue[4] = P_ORGDESCRIPTION;
                ParamValue[5] = P_PRICE;
                ParamValue[6] = P_GROUND;
                ParamValue[7] = P_TUSHAALNO;
                ParamValue[8] = P_TUSHAALDT;
                ParamValue[9] = P_FILENAME;
                ParamValue[10] = P_STAFFLIST;
                ParamValue[11] = P_STAFFID;
                myObj.SP_OracleExecuteNonQuery("SHAGNAL_INSERT", ParamName, ParamValue);
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
        public void SHAGNAL_UPDATE(string P_ID, string P_NAME, string P_DT, string P_SHAGNALTYPE_ID, string P_SHAGNALDECISION_ID, string P_ORGDESCRIPTION, string P_PRICE, string P_GROUND, string P_TUSHAALNO, string P_TUSHAALDT, string P_FILENAME, string P_STAFFLIST, string P_STAFFID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[13], ParamValue = new string[13];
                ParamName[0] = "P_ID";
                ParamName[1] = "P_NAME";
                ParamName[2] = "P_DT";
                ParamName[3] = "P_SHAGNALTYPE_ID";
                ParamName[4] = "P_SHAGNALDECISION_ID";
                ParamName[5] = "P_ORGDESCRIPTION";
                ParamName[6] = "P_PRICE";
                ParamName[7] = "P_GROUND";
                ParamName[8] = "P_TUSHAALNO";
                ParamName[9] = "P_TUSHAALDT";
                ParamName[10] = "P_FILENAME";
                ParamName[11] = "P_STAFFLIST";
                ParamName[12] = "P_STAFFID";
                ParamValue[0] = P_ID;
                ParamValue[1] = P_NAME;
                ParamValue[2] = P_DT;
                ParamValue[3] = P_SHAGNALTYPE_ID;
                ParamValue[4] = P_SHAGNALDECISION_ID;
                ParamValue[5] = P_ORGDESCRIPTION;
                ParamValue[6] = P_PRICE;
                ParamValue[7] = P_GROUND;
                ParamValue[8] = P_TUSHAALNO;
                ParamValue[9] = P_TUSHAALDT;
                ParamValue[10] = P_FILENAME;
                ParamValue[11] = P_STAFFLIST;
                ParamValue[12] = P_STAFFID;
                myObj.SP_OracleExecuteNonQuery("SHAGNAL_UPDATE", ParamName, ParamValue);
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
        public void SHAGNAL_DELETE(string P_ID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[1], ParamValue = new string[1];
                ParamName[0] = "P_ID";
                ParamValue[0] = P_ID;
                myObj.SP_OracleExecuteNonQuery("SHAGNAL_DELETE", ParamName, ParamValue);
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
        public string StaffsdataaddTab2Datatable(string fromdate, string todate, string posdegreedtl, string rankposdegree)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            if (posdegreedtl != "") posdegreedtl = " AND b.POSDEGREEDTL_ID=" + posdegreedtl;
            if (rankposdegree != "") rankposdegree = " AND b.RANKPOSDEGREE_ID=" + rankposdegree;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT
  a.ZEREGDEV_ID, 
  a.STAFFLISTID, 
  b.POSDEGREEDTL_ID, 
  c.NAME as POSDEGREEDTL_NAME, 
  b.RANKPOSDEGREE_ID, 
  d.NAME as RANKPOSDEGREE_NAME, 
  b.DECISIONDESC, 
  b.DT, 
  b.CERTIFICATENO, 
  b.UPPER, 
  b.FILENAME
FROM (
  SELECT a.ZEREGDEV_ID, RTRIM(xmlagg (xmlelement (e, a.STAFFS_ID || ',')).extract('//text()'), ',') as STAFFLISTID 
  FROM ST_ZEREGDEV_STAFFS a 
  INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID=b.ID
  WHERE TO_DATE(b.DT,'YYYY-MM-DD') BETWEEN TO_DATE('"+fromdate+"','YYYY-MM-DD') AND TO_DATE('"+todate+"','YYYY-MM-DD')"+posdegreedtl+rankposdegree+@"
  GROUP BY a.ZEREGDEV_ID
) a 
INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID=b.ID
INNER JOIN STN_POSDEGREEDTL c ON b.POSDEGREEDTL_ID=c.ID
INNER JOIN STN_RANKPOSDEGREE d ON b.RANKPOSDEGREE_ID=d.ID
ORDER BY b.DT");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public void ZEREGDEV_INSERT(string P_POSDEGREEDTL_ID, string P_RANKPOSDEGREE_ID, string P_DECISIONDESC, string P_DT, string P_CERTIFICATENO, string P_UPPER, string P_FILENAME, string P_STAFFLIST, string P_STAFFID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[9], ParamValue = new string[9];
                ParamName[0] = "P_POSDEGREEDTL_ID";
                ParamName[1] = "P_RANKPOSDEGREE_ID";
                ParamName[2] = "P_DECISIONDESC";
                ParamName[3] = "P_DT";
                ParamName[4] = "P_CERTIFICATENO";
                ParamName[5] = "P_UPPER";
                ParamName[6] = "P_FILENAME";
                ParamName[7] = "P_STAFFLIST";
                ParamName[8] = "P_STAFFID";
                ParamValue[0] = P_POSDEGREEDTL_ID;
                ParamValue[1] = P_RANKPOSDEGREE_ID;
                ParamValue[2] = P_DECISIONDESC;
                ParamValue[3] = P_DT;
                ParamValue[4] = P_CERTIFICATENO;
                ParamValue[5] = P_UPPER;
                ParamValue[6] = P_FILENAME;
                ParamValue[7] = P_STAFFLIST;
                ParamValue[8] = P_STAFFID;
                myObj.SP_OracleExecuteNonQuery("ZEREGDEV_INSERT", ParamName, ParamValue);
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
        public void ZEREGDEV_UPDATE(string P_ID, string P_POSDEGREEDTL_ID, string P_RANKPOSDEGREE_ID, string P_DECISIONDESC, string P_DT, string P_CERTIFICATENO, string P_UPPER, string P_FILENAME, string P_STAFFLIST, string P_STAFFID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[10], ParamValue = new string[10];
                ParamName[0] = "P_ID";
                ParamName[1] = "P_POSDEGREEDTL_ID";
                ParamName[2] = "P_RANKPOSDEGREE_ID";
                ParamName[3] = "P_DECISIONDESC";
                ParamName[4] = "P_DT";
                ParamName[5] = "P_CERTIFICATENO";
                ParamName[6] = "P_UPPER";
                ParamName[7] = "P_FILENAME";
                ParamName[8] = "P_STAFFLIST";
                ParamName[9] = "P_STAFFID";
                ParamValue[0] = P_ID;
                ParamValue[1] = P_POSDEGREEDTL_ID;
                ParamValue[2] = P_RANKPOSDEGREE_ID;
                ParamValue[3] = P_DECISIONDESC;
                ParamValue[4] = P_DT;
                ParamValue[5] = P_CERTIFICATENO;
                ParamValue[6] = P_UPPER;
                ParamValue[7] = P_FILENAME;
                ParamValue[8] = P_STAFFLIST;
                ParamValue[9] = P_STAFFID;
                myObj.SP_OracleExecuteNonQuery("ZEREGDEV_UPDATE", ParamName, ParamValue);
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
        public void ZEREGDEV_DELETE(string P_ID)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string[] ParamName = new string[1], ParamValue = new string[1];
                ParamName[0] = "P_ID";
                ParamValue[0] = P_ID;
                myObj.SP_OracleExecuteNonQuery("ZEREGDEV_DELETE", ParamName, ParamValue);
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

        //*****tomilolt.aspx*****//
        public string tomiloltTab1ModalSelectstafflistForSelect2(string selectedList)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                //DataSet ds = myObj.OracleExecuteDataSet("SELECT f.ID as GAZAR_ID, f.INITNAME, a.ID as STAFF_ID, SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,1,1)||LOWER(SUBSTR(a.FNAME,2))||' | '||g.NAME as STAFF_NAME, NVL2(h.ST_ID,' selected=\"selected\"',null) as ISSELECTED FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID INNER JOIN STN_MOVE c ON b.MOVE_ID = c.ID INNER JOIN ST_BRANCH d ON b.BRANCH_ID = d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID = f.ID INNER JOIN STN_POS g ON b.POS_ID = g.ID LEFT JOIN( SELECT TO_NUMBER(ST_ID) as ST_ID FROM( select regexp_substr('"+selectedList+"', '[^,]+', 1, level) AS ST_ID from dual connect by regexp_substr('"+selectedList+"', '[^,]+', 1, level) is not null ) a ) h ON a.ID = h.ST_ID WHERE b.ISACTIVE = 1 AND c.ACTIVE = 1 ORDER BY f.SORT, g.SORT, a.LNAME, a.FNAME");
                DataSet ds = myObj.OracleExecuteDataSet("SELECT f.ID as GAZAR_ID, f.INITNAME, a.ID as STAFF_ID, SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,1,1)||LOWER(SUBSTR(a.FNAME,2))||' | '||g.NAME as STAFF_NAME, NVL2(h.ST_ID,' selected=\"selected\"',null) as ISSELECTED FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID INNER JOIN STN_MOVE c ON b.MOVE_ID = c.ID INNER JOIN ST_BRANCH d ON b.BRANCH_ID = d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID = f.ID INNER JOIN STN_POS g ON b.POS_ID = g.ID LEFT JOIN( SELECT TO_NUMBER(ST_ID) as ST_ID FROM( select regexp_substr('" + selectedList + "', '[^,]+', 1, level) AS ST_ID from dual connect by regexp_substr('" + selectedList + "', '[^,]+', 1, level) is not null ) a ) h ON a.ID = h.ST_ID WHERE b.ISACTIVE = 1 ORDER BY f.SORT, g.SORT, a.LNAME, a.FNAME");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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

        //*****profile.aspx*****//
        public string ProfileTab1t9t1Datatable(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, NAME, DT, ISEDIT
FROM (
  SELECT a.STAFFS_ID as ID, b.NAME, b.DT, 0 as ISEDIT
  FROM ST_SHAGNAL_STAFFS a
  INNER JOIN ST_SHAGNAL b ON a.SHAGNAL_ID=b.ID
  WHERE a.STAFFS_ID="+ staffid + @"
  UNION ALL
  SELECT ID, NAME, DT, 1 as ISEDIT
  FROM ST_BONUS 
  WHERE STAFFS_ID=" + staffid + @"
)
ORDER BY DT DESC");
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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

        //*****workingtime.aspx*****//
        public string WorkingtimeTab2Datatable(string yr, string month, string month2, string gazar, string heltes, string stid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            string yr1 = yr, strMonthList = "";
            for (int i = Int32.Parse(month); i <= Int32.Parse(month2); i++)
            {
                if (strMonthList == "") strMonthList += i.ToString();
                else strMonthList += "," + i.ToString();
            }
            if (gazar != "") gazar = " AND c.FATHER_ID=" + gazar;
            if (heltes != "") heltes = " AND c.ID=" + heltes;
            if (stid != "") stid = " AND b.STAFFS_ID=" + stid;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
  SELECT 
    a.ST_ID, 
    CASE WHEN d.ID = d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME || '-' || d.INITNAME END as NEGJ, 
    g.NAME as POS_NAME, 
    SUBSTR(h.LNAME, 0, 1) || '.' || SUBSTR(h.FNAME, 1, 1) || LOWER(SUBSTR(h.FNAME, 2)) as STAFFNAME, 
    a.WORKDAY, 
    a.CHOLOODAYSUM, 
    a.UWCHTEIDAYSUM, 
    a.AMRALTDAYSUM, 
    a.TOMILOLTDAYSUM, 
    ROUND((a.WORKDAY - (a.CHOLOODAYSUM + a.UWCHTEIDAYSUM + a.AMRALTDAYSUM + a.TOMILOLTDAYSUM + a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)), 2) as WORKEDAY, 
    a.TASALSANDAYSUM, 
    ROUND(a.HOTSORSONMINUTESUM, 1) as HOTSORSONMINUTESUM, 
    ROUND(a.HOTSORSONDAYSUM,1) as HOTSORSONDAYSUM, 
    ROUND(a.ERTMINUTESUM, 1) as ERTMINUTESUM, 
    ROUND(a.OROIMINUTESUM, 1) as OROIMINUTESUM, 
    ROUND((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)), 2) as EVALWORKEDDAY, 
    ROUND(((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)) / a.WORKDAY) * 100, 2) as PER
  FROM(
    SELECT ST_ID,
      SUM(ISWORK) as WORKDAY,
      SUM(CHOLOODAY) as CHOLOODAYSUM,
      SUM(UWCHTEIDAY) as UWCHTEIDAYSUM,
      SUM(AMRALTDAY) as AMRALTDAYSUM,
      SUM(TOMILOLTDAY) as TOMILOLTDAYSUM,
      SUM(ISTASALSAN) as TASALSANDAYSUM,
      SUM(HOTSORSONMINUTE) as HOTSORSONMINUTESUM,
      SUM(HOTSORSONDAY) as HOTSORSONDAYSUM,
      SUM(ERTMINUTE) as ERTMINUTESUM,
      SUM(ERTDAY) as ERTDAYSUM,
      SUM(OROIMINUTE) as OROIMINUTESUM,
      SUM(OROIDAY) as OROIDAYSUM
    FROM(
      SELECT ST_ID, TP, DT, MINTM, MAXTM, ISWORK,
        CASE WHEN TP = 11 AND ISWORK = 1 OR TP = 12 THEN 1 ELSE 0 END as CHOLOODAY,
        CASE WHEN TP = 13 AND ISWORK = 1 THEN 1 ELSE 0 END as UWCHTEIDAY,
        CASE WHEN TP = 21 AND ISWORK = 1 THEN 1 ELSE 0 END as AMRALTDAY,
        CASE WHEN TP = 31 AND ISWORK = 1 THEN 1 ELSE 0 END as TOMILOLTDAY,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM = MAXTM THEN 1 ELSE 0 END as ISTASALSAN,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'minute') ELSE 0 END as HOTSORSONMINUTE,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'day') ELSE 0 END as HOTSORSONDAY,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'minute') ELSE 0 END as ERTMINUTE,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'day') ELSE 0 END as ERTDAY,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'minute') ELSE 0 END as OROIMINUTE,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'day') ELSE 0 END as OROIDAY
      FROM(
        SELECT a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
        FROM(
          SELECT a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
          FROM(
            SELECT a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
            FROM(
              SELECT a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
              FROM ( 
                SELECT a.ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
                FROM (
                  SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
                  FROM (
                    SELECT a.ID, 
                      CASE 
                        WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD') 
                        THEN a.DT 
                        ELSE '" + yr + "-" + month + @"-01' 
                      END as BEGINDT, 
                      CASE 
                        --WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        --THEN CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                        WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                    FROM ST_STBR a
                    INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                    INNER JOIN STN_MOVE c ON a.MOVE_ID=c.ID
                    WHERE a.POS_ID!=2020102 AND c.ACTIVE=1
                    AND ((
                        TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD') 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                        OR 
                        LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                      ) OR 
                        (
                          TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                        ))
                  ) a, (
                    SELECT DT
                    FROM(
                      SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                      FROM DUAL
                      CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                    )
                    WHERE DT BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                  ) b
                ) a
                INNER JOIN ST_STBR b ON a.ID=b.ID
                INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
                WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102" + gazar + heltes + stid + @"
              ) a
              LEFT JOIN(
                SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
              ) b ON a.DT = b.DT  
            ) a
            LEFT JOIN(
              SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
              FROM hr_mof.STN_TRCDLOG a
              INNER JOIN ST_STAFFS b ON a.ENO = b.FINGERID
              INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID
              INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
              INNER JOIN ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
              WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + yr + @" AND a.MONTH IN(" + strMonthList + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
              GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
            ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
          ) a
          LEFT JOIN(
            SELECT DT, STAFFS_ID, MAX(TP) as TP
            FROM(
              SELECT b.DT, a.STAFFS_ID, 11 as TP
              FROM ST_CHULUUDAYF3 a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 12 as TP
              FROM ST_CHULUUDAYT2 a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.ISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 13 as TP
              FROM ST_CHULUUSICK a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 21 as TP
              FROM ST_AMRALT a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.TZISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 31 as TP
              FROM ST_TOMILOLT_STAFFS a
              INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
            )
            GROUP BY DT, STAFFS_ID
          ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
        ) a
        LEFT JOIN(
          SELECT TO_DATE('" + yr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYOFFICIAL
          WHERE HOLMONTH IN(" + strMonthList + @")
          UNION ALL
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYUNOFFICIAL
          WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
        ) b ON a.DT = b.DT
        GROUP BY a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
      )
    )
    GROUP BY ST_ID
  ) a
  INNER JOIN ST_STBR c ON a.ST_ID = c.STAFFS_ID AND c.ISACTIVE = 1
  INNER JOIN ST_BRANCH d ON c.BRANCH_ID = d.ID AND d.ISACTIVE = 1
  INNER JOIN ST_BRANCH f ON d.FATHER_ID = f.ID AND f.ISACTIVE = 1
  INNER JOIN STN_POS g ON c.POS_ID = g.ID
  INNER JOIN ST_STAFFS h ON a.ST_ID = h.ID
  WHERE a.WORKDAY>0
  ORDER BY f.SORT, d.SORT, g.SORT, a.ST_ID ) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string WorkingtimeTab3Datatable(string yr, string month, string month2, string gazar, string heltes, string stid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            string strMonthList = "";
            for (int i = Int32.Parse(month); i <= Int32.Parse(month2); i++)
            {
                if (strMonthList == "") strMonthList += i.ToString();
                else strMonthList += "," + i.ToString();
            }
            if (gazar != "") gazar = " AND c.FATHER_ID=" + gazar;
            if (heltes != "") heltes = " AND c.ID=" + heltes;
            if (stid != "") stid = " AND b.STAFFS_ID=" + stid;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
  SELECT 
    a.ST_ID, 
    CASE WHEN d.ID = d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME || '-' || d.INITNAME END as NEGJ, 
    g.NAME as POS_NAME, 
    SUBSTR(h.LNAME, 0, 1) || '.' || SUBSTR(h.FNAME, 1, 1) || LOWER(SUBSTR(h.FNAME, 2)) as STAFFNAME, 
    a.WORKDAY, 
    a.CHOLOODAYSUM, 
    a.UWCHTEIDAYSUM, 
    a.AMRALTDAYSUM, 
    a.TOMILOLTDAYSUM, 
    ROUND((a.WORKDAY - (a.CHOLOODAYSUM + a.UWCHTEIDAYSUM + a.AMRALTDAYSUM + a.TOMILOLTDAYSUM + a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)), 2) as WORKEDAY, 
    a.TASALSANDAYSUM, 
    ROUND(a.HOTSORSONMINUTESUM, 1) as HOTSORSONMINUTESUM, 
    ROUND(a.HOTSORSONDAYSUM,1) as HOTSORSONDAYSUM, 
    ROUND(a.ERTMINUTESUM, 1) as ERTMINUTESUM, 
    ROUND(a.OROIMINUTESUM, 1) as OROIMINUTESUM, 
    ROUND((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)), 2) as EVALWORKEDDAY, 
    ROUND(((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)) / a.WORKDAY) * 100, 2) as PER
  FROM(
    SELECT ST_ID,
      SUM(ISWORK) as WORKDAY,
      SUM(CHOLOODAY) as CHOLOODAYSUM,
      SUM(UWCHTEIDAY) as UWCHTEIDAYSUM,
      SUM(AMRALTDAY) as AMRALTDAYSUM,
      SUM(TOMILOLTDAY) as TOMILOLTDAYSUM,
      SUM(ISTASALSAN) as TASALSANDAYSUM,
      SUM(HOTSORSONMINUTE) as HOTSORSONMINUTESUM,
      SUM(HOTSORSONDAY) as HOTSORSONDAYSUM,
      SUM(ERTMINUTE) as ERTMINUTESUM,
      SUM(ERTDAY) as ERTDAYSUM,
      SUM(OROIMINUTE) as OROIMINUTESUM,
      SUM(OROIDAY) as OROIDAYSUM
    FROM(
      SELECT ST_ID, TP, DT, MINTM, MAXTM, ISWORK,
        CASE WHEN TP = 11 AND ISWORK = 1 OR TP = 12 THEN 1 ELSE 0 END as CHOLOODAY,
        CASE WHEN TP = 13 AND ISWORK = 1 THEN 1 ELSE 0 END as UWCHTEIDAY,
        CASE WHEN TP = 21 AND ISWORK = 1 THEN 1 ELSE 0 END as AMRALTDAY,
        CASE WHEN TP = 31 AND ISWORK = 1 THEN 1 ELSE 0 END as TOMILOLTDAY,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM = MAXTM THEN 1 ELSE 0 END as ISTASALSAN,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'minute') ELSE 0 END as HOTSORSONMINUTE,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'day') ELSE 0 END as HOTSORSONDAY,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'minute') ELSE 0 END as ERTMINUTE,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'day') ELSE 0 END as ERTDAY,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'minute') ELSE 0 END as OROIMINUTE,
        CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'day') ELSE 0 END as OROIDAY
      FROM(
        SELECT a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
        FROM(
          SELECT a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
          FROM(
            SELECT a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
            FROM(
              SELECT a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
              FROM ( 
                SELECT a.ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
                FROM (
                  SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
                  FROM (
                    SELECT a.ID, 
                      CASE 
                        WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD') 
                        THEN a.DT 
                        ELSE '" + yr + "-" + month + @"-01' 
                      END as BEGINDT, 
                      CASE 
                        --WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        --THEN CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                        WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                    FROM ST_STBR a
                    INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                    INNER JOIN STN_MOVE c ON a.MOVE_ID=c.ID
                    WHERE a.POS_ID!=2020102 AND c.ACTIVE=1
                    AND ((
                        TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD') 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                        OR 
                        LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                      ) OR 
                        (
                          TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                        ))
                  ) a, (
                    SELECT DT
                    FROM(
                      SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                      FROM DUAL
                      CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                    )
                    WHERE DT BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                  ) b
                ) a
                INNER JOIN ST_STBR b ON a.ID=b.ID
                INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
                WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102" + gazar + heltes + stid + @"
              ) a
              LEFT JOIN(
                SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
              ) b ON a.DT = b.DT  
            ) a
            LEFT JOIN(
              SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
              FROM hr_mof.STN_TRCDLOG a
              INNER JOIN ST_STAFFS b ON a.ENO = b.FINGERID
              INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID
              INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
              INNER JOIN ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
              WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + yr + @" AND a.MONTH IN(" + strMonthList + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
              GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
            ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
          ) a
          LEFT JOIN(
            SELECT DT, STAFFS_ID, MAX(TP) as TP
            FROM(
              SELECT b.DT, a.STAFFS_ID, 11 as TP
              FROM ST_CHULUUDAYF3 a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 12 as TP
              FROM ST_CHULUUDAYT2 a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.ISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 13 as TP
              FROM ST_CHULUUSICK a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 21 as TP
              FROM ST_AMRALT a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.TZISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 31 as TP
              FROM ST_TOMILOLT_STAFFS a
              INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
            )
            GROUP BY DT, STAFFS_ID
          ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
        ) a
        LEFT JOIN(
          SELECT TO_DATE('" + yr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYOFFICIAL
          WHERE HOLMONTH IN(" + strMonthList + @")
          UNION ALL
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYUNOFFICIAL
          WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
        ) b ON a.DT = b.DT
        GROUP BY a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
      )
    )
    GROUP BY ST_ID
  ) a
  INNER JOIN ST_STBR c ON a.ST_ID = c.STAFFS_ID AND c.ISACTIVE = 1
  INNER JOIN ST_BRANCH d ON c.BRANCH_ID = d.ID AND d.ISACTIVE = 1
  INNER JOIN ST_BRANCH f ON d.FATHER_ID = f.ID AND f.ISACTIVE = 1
  INNER JOIN STN_POS g ON c.POS_ID = g.ID
  INNER JOIN ST_STAFFS h ON a.ST_ID = h.ID
  WHERE a.WORKDAY>0
  ORDER BY f.SORT, d.SORT, g.SORT, a.ST_ID 
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string WorkingtimeTab3Desc(string year, string month, string month2, string stid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            string strMonthList = "";
            for (int i = Int32.Parse(month); i <= Int32.Parse(month2); i++)
            {
                if (strMonthList == "") strMonthList += i.ToString();
                else strMonthList += "," + i.ToString();
            }
            string[] date = new string[3];
            string[] time1 = new string[3];
            string[] time2 = new string[3];
            string strQry = @"SELECT  a.ST_ID, b.NEGJ, b.POSNAME, b.STNAME, a.TP, TO_CHAR(a.DT, 'YYYY-MM-DD') as DT, a.MINTM, a.MAXTM, a.ISWORK, 
      ROUND(IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI;SS'), TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI;SS'), 'hotsorson', 'minute'),1) as HOTSORSONMINUTE, 
      ROUND(IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI;SS'), TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI;SS'), 'ert', 'minute'),1) as ERTMINUTE
    FROM (
      SELECT a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
        FROM(
          SELECT a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
          FROM(
            SELECT a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
            FROM(
              SELECT a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
              FROM ( 
                SELECT a.ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
                FROM (
                  SELECT a.ID, a.STAFFS_ID, a.BEGINDT, a.ENDDT, b.DT
                  FROM (
                    SELECT a.ID, a.STAFFS_ID, 
                      CASE 
                        WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD') 
                        THEN a.DT 
                        ELSE '" + year + "-" + month + @"-01' 
                      END as BEGINDT, 
                      CASE 
                        --WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        --THEN CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                        WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                    FROM ST_STBR a
                    INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                    INNER JOIN STN_MOVE c ON a.MOVE_ID=c.ID
                    WHERE a.POS_ID!=2020102 AND c.ACTIVE=1 AND a.STAFFS_ID=" + stid + @"
                    AND ((
                        TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD') 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                        OR 
                        LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                      ) OR 
                        (
                          TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                        ))
                  ) a, (
                    SELECT DT
                    FROM(
                      SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                      FROM DUAL
                      CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
                    )
                    WHERE DT BETWEEN TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                  ) b
                ) a
                INNER JOIN ST_STBR b ON a.ID=b.ID
                INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
                WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102
              ) a
              LEFT JOIN(
                SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
              ) b ON a.DT = b.DT  
            ) a
            LEFT JOIN(
              SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
              FROM hr_mof.STN_TRCDLOG a
              INNER JOIN ST_STAFFS b ON a.ENO = b.FINGERID
              INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID
              INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
              INNER JOIN ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
              WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + year + @" AND a.MONTH IN(" + strMonthList + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
              GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
            ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
          ) a
          LEFT JOIN(
            SELECT DT, STAFFS_ID, MAX(TP) as TP
            FROM(
              SELECT b.DT, a.STAFFS_ID, 11 as TP
              FROM ST_CHULUUDAYF3 a,
              (
                SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 12 as TP
              FROM ST_CHULUUDAYT2 a,
              (
                SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.ISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 13 as TP
              FROM ST_CHULUUSICK a,
              (
                SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 21 as TP
              FROM ST_AMRALT a,
              (
                SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.TZISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 31 as TP
              FROM ST_TOMILOLT_STAFFS a
              INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
              (
                SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
            )
            GROUP BY DT, STAFFS_ID
          ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
        ) a
        LEFT JOIN(
          SELECT TO_DATE('" + year + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYOFFICIAL
          WHERE HOLMONTH IN(" + strMonthList + @")
          UNION ALL
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYUNOFFICIAL
          WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
        ) b ON a.DT = b.DT
        GROUP BY a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
      ORDER BY a.DT
    ) a
    LEFT JOIN (
      SELECT 
        a.ID, 
        CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||'-'||d.INITNAME END as NEGJ, 
        g.NAME as POSNAME, 
        SUBSTR(a.LNAME, 0, 1) || '.' || SUBSTR(a.FNAME, 1, 1) || LOWER(SUBSTR(a.FNAME, 2)) as STNAME, 
        d.SORT as NEGJSORT,
        g.SORT as POSSORT
      FROM ST_STAFFS a 
      INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
      INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID AND c.ACTIVE=1 
      INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID 
      INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID 
      INNER JOIN STN_POS g ON b.POS_ID=g.ID 
    ) b ON a.ST_ID=b.ID
    ORDER BY b.NEGJSORT, b.POSSORT";
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string WorkingtimeTab4Datatable(string yr, string month)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.*
FROM (
    SELECT 
    b.NAME as BR_NAME, a.WORKDAY, ROUND(a.WORKDAY-(a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM),2) as EVALWORKEDDAY, ROUND(((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)) / a.WORKDAY) * 100, 2) as PER, ROUND((ROUND(((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)) / a.WORKDAY) * 100, 2) * 0.1),2) as PNT, b.SORT
    FROM (  
        SELECT FATHER_ID as GAZAR_ID,
          SUM(ISWORK) as WORKDAY,
          SUM(CHOLOODAY) as CHOLOODAYSUM,
          SUM(UWCHTEIDAY) as UWCHTEIDAYSUM,
          SUM(AMRALTDAY) as AMRALTDAYSUM,
          SUM(TOMILOLTDAY) as TOMILOLTDAYSUM,
          SUM(ISTASALSAN) as TASALSANDAYSUM,
          SUM(HOTSORSONMINUTE) as HOTSORSONMINUTESUM,
          SUM(HOTSORSONDAY) as HOTSORSONDAYSUM,
          SUM(ERTMINUTE) as ERTMINUTESUM,
          SUM(ERTDAY) as ERTDAYSUM,
          SUM(OROIMINUTE) as OROIMINUTESUM,
          SUM(OROIDAY) as OROIDAYSUM
        FROM(
          SELECT FATHER_ID, ST_ID, TP, DT, MINTM, MAXTM, ISWORK,
            CASE WHEN TP = 11 AND ISWORK = 1 OR TP = 12 THEN 1 ELSE 0 END as CHOLOODAY,
            CASE WHEN TP = 13 AND ISWORK = 1 THEN 1 ELSE 0 END as UWCHTEIDAY,
            CASE WHEN TP = 21 AND ISWORK = 1 THEN 1 ELSE 0 END as AMRALTDAY,
            CASE WHEN TP = 31 AND ISWORK = 1 THEN 1 ELSE 0 END as TOMILOLTDAY,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM = MAXTM THEN 1 ELSE 0 END as ISTASALSAN,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'minute') ELSE 0 END as HOTSORSONMINUTE,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'day') ELSE 0 END as HOTSORSONDAY,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'minute') ELSE 0 END as ERTMINUTE,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'day') ELSE 0 END as ERTDAY,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'minute') ELSE 0 END as OROIMINUTE,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'day') ELSE 0 END as OROIDAY
          FROM(
            SELECT a.FATHER_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
            FROM(
              SELECT a.FATHER_ID, a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
              FROM(
                SELECT a.FATHER_ID, a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
                FROM(
                  SELECT a.FATHER_ID, a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
                  FROM ( 
                    SELECT a.ID, c.FATHER_ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
                    FROM (
                      SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
                      FROM (
                        SELECT a.ID, 
                          CASE 
                            WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD') 
                            THEN a.DT 
                            ELSE '" + yr + "-" + month + @"-01' 
                          END as BEGINDT, 
                          CASE 
                            --WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')) 
                            --THEN CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                            WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')) 
                            THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                        FROM ST_STBR a
                        INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                        INNER JOIN STN_MOVE c ON a.MOVE_ID=c.ID
                        WHERE a.POS_ID!=2020102 AND c.ACTIVE=1
                        AND ((
                            TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD') 
                            BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                            OR 
                            LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')) 
                            BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                          ) OR 
                            (
                              TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                            ))
                      ) a, (
                        SELECT DT
                        FROM(
                          SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                          FROM DUAL
                          CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                        )
                        WHERE DT BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                      ) b
                    ) a
                    INNER JOIN ST_STBR b ON a.ID=b.ID
                    INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
                    WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102
                  ) a
                  LEFT JOIN(
                    SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + month + @")
                  ) b ON a.DT = b.DT  
                ) a
                LEFT JOIN(
                  SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
                  FROM hr_mof.STN_TRCDLOG a
                  INNER JOIN ST_STAFFS b ON a.ENO = b.FINGERID
                  INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID
                  INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
                  INNER JOIN ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
                  WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + yr + @" AND a.MONTH IN(" + month + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                  GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
                ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
              ) a
              LEFT JOIN(
                SELECT DT, STAFFS_ID, MAX(TP) as TP
                FROM(
                  SELECT b.DT, a.STAFFS_ID, 11 as TP
                  FROM ST_CHULUUDAYF3 a,
                  (
                    SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 12 as TP
                  FROM ST_CHULUUDAYT2 a,
                  (
                    SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    a.ISRECEIVED = 1 AND
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 13 as TP
                  FROM ST_CHULUUSICK a,
                  (
                    SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 21 as TP
                  FROM ST_AMRALT a,
                  (
                    SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    a.TZISRECEIVED = 1 AND
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 31 as TP
                  FROM ST_TOMILOLT_STAFFS a
                  INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
                  (
                    SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
                )
                GROUP BY DT, STAFFS_ID
              ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
            ) a
            LEFT JOIN(
              SELECT TO_DATE('" + yr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
              FROM ST_HOLIDAYOFFICIAL
              WHERE HOLMONTH IN(" + month + @")
              UNION ALL
              SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
              FROM ST_HOLIDAYUNOFFICIAL
              WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + month + @")
            ) b ON a.DT = b.DT
            GROUP BY a.FATHER_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
          )
        )
        GROUP BY FATHER_ID
    ) a
    INNER JOIN ST_BRANCH b ON a.GAZAR_ID=b.ID AND b.ISACTIVE=1
    ORDER BY b.SORT
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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
        public string WorkingtimeTab4t2Datatable(string yr, string month, string month2, string gazar, string heltes, string stid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            string strMonthList = "";
            for (int i = Int32.Parse(month); i <= Int32.Parse(month2); i++)
            {
                if (strMonthList == "") strMonthList += i.ToString();
                else strMonthList += "," + i.ToString();
            }
            if (gazar != "") gazar = " AND c.FATHER_ID=" + gazar;
            if (heltes != "") heltes = " AND c.ID=" + heltes;
            if (stid != "") stid = " AND b.STAFFS_ID=" + stid;
            string strTableVal = "";
            string strQry = "";
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strColor1 = "\"background:#fcf8e3;\"";
                strQry = @"SELECT a.ST_ID
        , CASE WHEN b.ID=b.FATHER_ID THEN b.INITNAME ELSE c.INITNAME||'-'||b.INITNAME END as NEGJ
        , d.NAME as POSNAME
        , SUBSTR(f.LNAME,0,1)||'.'||SUBSTR(f.FNAME,1,1)||LOWER(SUBSTR(f.FNAME,2)) as STNAME
        , a.TP
        , TO_CHAR(a.DT,'YYYY-MM-DD') as DT
        , a.MINTM
        , a.MAXTM
        , CASE WHEN a.ISWORK=0 THEN 'style=" + strColor1 + @"' ELSE null END as ISWORK
      FROM(
        SELECT a.BRANCH_ID, a.POS_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
        FROM(
          SELECT a.BRANCH_ID, a.POS_ID, a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
          FROM(
            SELECT a.BRANCH_ID, a.POS_ID, a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
            FROM(
              SELECT a.BRANCH_ID, a.POS_ID, a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
              FROM(
                SELECT a.ID, b.BRANCH_ID, b.POS_ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
                FROM(
                  SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
                  FROM(
                    SELECT a.ID,
                      CASE
                        WHEN TO_DATE(a.DT, 'YYYY-MM-DD') > TO_DATE('" + yr + "-" + month + @"-01', 'YYYY-MM-DD')
                        THEN a.DT
                        ELSE '" + yr + "-" + month + @"-01'
                      END as BEGINDT,
                      CASE
                        --WHEN TO_DATE(CASE WHEN c.ACTIVE = 0 THEN NVL(a.ENDDT, a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE, 'YYYY-MM-DD')) END, 'YYYY-MM-DD') < LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'YYYY-MM-DD'))
                        --THEN CASE WHEN c.ACTIVE = 0 THEN NVL(a.ENDDT, a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE, 'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'YYYY-MM-DD')), 'YYYY-MM-DD') END as ENDDT
                        WHEN TO_DATE(CASE WHEN c.ACTIVE = 0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT, a.DT), 'YYYY-MM-DD') - 1), 'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT, 'YYYY-MM-DD') - 1), 'YYYY-MM-DD'), TO_CHAR(SYSDATE, 'YYYY-MM-DD')) END, 'YYYY-MM-DD') < LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'YYYY-MM-DD'))
                        THEN CASE WHEN c.ACTIVE = 0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT, a.DT), 'YYYY-MM-DD') - 1), 'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT, 'YYYY-MM-DD') - 1), 'YYYY-MM-DD'), TO_CHAR(SYSDATE, 'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'YYYY-MM-DD')), 'YYYY-MM-DD') END as ENDDT
                    FROM ST_STBR a
                    INNER JOIN ST_BRANCH b ON a.BRANCH_ID = b.ID AND b.ISACTIVE = 1
                    INNER JOIN STN_MOVE c ON a.MOVE_ID = c.ID
                    WHERE a.POS_ID != 2020102 AND c.ACTIVE=1
                    AND ((
                        TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD') 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                        OR 
                        LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD')) 
                        BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                      ) OR 
                        (
                          TO_DATE('" + yr + "-" + month + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                        ))
                  ) a, (
                    SELECT DT
                    FROM(
                      SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                      FROM DUAL
                      CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
                    )
                    WHERE DT BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                  ) b
                ) a
                INNER JOIN ST_STBR b ON a.ID = b.ID
                INNER JOIN ST_BRANCH c ON b.BRANCH_ID = c.ID AND c.ISACTIVE = 1
                WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID != 2020102" + gazar + heltes + stid + @"
              ) a
              LEFT JOIN(
                SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
              ) b ON a.DT = b.DT
            ) a
            LEFT JOIN(
              SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
              FROM hr_mof.STN_TRCDLOG a
              INNER JOIN ST_STAFFS b ON a.ENO = b.FINGERID
              INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID
              INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
              INNER JOIN ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
              WHERE c.POS_ID != 2020102 AND a.INOUT = 0 AND a.YEAR = " + yr + @" AND a.MONTH IN(" + strMonthList + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
              GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
            ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT
          ) a
          LEFT JOIN(
            SELECT DT, STAFFS_ID, MAX(TP) as TP
            FROM(
              SELECT b.DT, a.STAFFS_ID, 11 as TP
              FROM ST_CHULUUDAYF3 a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 12 as TP
              FROM ST_CHULUUDAYT2 a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.ISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 13 as TP
              FROM ST_CHULUUSICK a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 21 as TP
              FROM ST_AMRALT a,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                a.TZISRECEIVED = 1 AND
                b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
              UNION ALL
              SELECT b.DT, a.STAFFS_ID, 31 as TP
              FROM ST_TOMILOLT_STAFFS a
              INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
              (
                SELECT(TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + "-" + month2 + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + "-" + month + @"-01', 'yyyy-mm-dd')
              ) b
              WHERE
                b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
            )
            GROUP BY DT, STAFFS_ID
          ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
        ) a
        LEFT JOIN(
          SELECT TO_DATE('" + yr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYOFFICIAL
          WHERE HOLMONTH IN(" + strMonthList + @")
          UNION ALL
          SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
          FROM ST_HOLIDAYUNOFFICIAL
          WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
        ) b ON a.DT = b.DT
        GROUP BY a.BRANCH_ID, a.POS_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
      ) a
      INNER JOIN ST_BRANCH b ON a.BRANCH_ID = b.ID AND b.ISACTIVE = 1
      INNER JOIN ST_BRANCH c ON b.FATHER_ID = c.ID AND c.ISACTIVE = 1
      INNER JOIN STN_POS d ON a.POS_ID = d.ID
      INNER JOIN ST_STAFFS f ON a.ST_ID = f.ID
      ORDER BY c.SORT, b.SORT, d.SORT, a.ST_ID, a.DT";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                strTableVal += "<table style=\"border: 1px solid #000; border-collapse: collapse; font: 11pt arial, sans-serif; width: 100%;\">";
                strTableVal += "<thead style=\"background-color:C6D9F1;\">";
                strTableVal += "<tr>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Нэгж</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Нэр</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Албан тушаал</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Огноо</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Төлөв</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Ирсэн</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Явсан</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Хоцорсон<br>(минут)</th>";
                strTableVal += "<th style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">Эрт явсан<br>(минут)</th>";
                strTableVal += "</tr>";
                strTableVal += "</thead>";
                strTableVal += "<tbody>";
                string[] date = new string[3];
                string[] time1 = new string[3];
                string[] time2 = new string[3];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        Array.Clear(date, 0, date.Length);
                        date = new string[3];
                        date = Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd").Split('-');

                        strTableVal += "<tr " + dr["ISWORK"].ToString() + ">";
                        if (dr["ISWORK"].ToString() == "style=\"background:#fcf8e3;\"")
                        {
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueDark\">Амралтын өдөр</span></td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + dr["MINTM"].ToString().Replace("00:00:00", "--:--:--") + "</td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + dr["MAXTM"].ToString().Replace("00:00:00", "--:--:--") + "</td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                        }
                        else {
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
                                if (dr["MINTM"].ToString() != dr["MAXTM"].ToString())
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
                                        if (Convert.ToDouble(come.Subtract(early).Seconds) > 0)
                                        {
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-yellow\">Хоцорсон</span></td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + lateTimeSpan.ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + earlyTimeSpan.ToString() + "</td>";
                                        }
                                        else
                                        {
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-yellow\">Хоцорсон</span></td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + lateTimeSpan.ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                        }
                                    }
                                    else
                                    {
                                        if (Convert.ToDouble(come.Subtract(early).Seconds) > 0)
                                        {
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueLight\">Цагтаа ирсэн</span></td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + earlyTimeSpan.ToString() + "</td>";
                                        }
                                        else
                                        {
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blueLight\">Цагтаа ирсэн</span></td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + go.ToString("HH:mm:ss") + "</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                            strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                        }
                                    }
                                }
                                else
                                {
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-redLight\">Тасалсан</span></td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">" + come.ToString("HH:mm:ss").Replace("00:00:00", "--:--:--") + "</td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                    strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                }
                            }
                            else if (dr["TP"].ToString() == "13")
                            {
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-pink\">Өвчтэй</span></td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            }
                            else if (dr["TP"].ToString() == "21")
                            {
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-greenDark\">Ээлжийн амралттай</span></td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            }
                            else if (dr["TP"].ToString() == "11" || dr["TP"].ToString() == "12")
                            {
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-orangeDark\">Чөлөөтэй</span></td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            }
                            else if (dr["TP"].ToString() == "31")
                            {
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-blue\">Албан томилолт</span></td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            }
                            else if (dr["TP"].ToString() == "91")
                            {
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["NEGJ"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["STNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + dr["POSNAME"].ToString() + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\">" + Convert.ToDateTime(dr["DT"]).ToString("yyyy-MM-dd") + "</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:center;\"><span class=\"label bg-color-lighten\">Тэмдэглэлт өдөр</span></td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                                strTableVal += "<td style=\"border: 1px solid #DDD; padding:5px; text-align:right;\">--:--:--</td>";
                            }
                        }
                        strTableVal += "</tr>";
                    }
                }
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                return strTableVal;
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
        public string WorkingtimeTab4t3Datatable(string yr)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = @"SELECT * FROM (
    SELECT 
      b.NAME as GAZAR_NAME, a.MNTH, ROUND(((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)) / a.WORKDAY) * 100, 2) as PER, b.SORT
    FROM (
      SELECT FATHER_ID as GAZAR_ID, TO_NUMBER(TO_CHAR(DT,'MM')) as MNTH, 
          SUM(ISWORK) as WORKDAY,
          SUM(CHOLOODAY) as CHOLOODAYSUM,
          SUM(UWCHTEIDAY) as UWCHTEIDAYSUM,
          SUM(AMRALTDAY) as AMRALTDAYSUM,
          SUM(TOMILOLTDAY) as TOMILOLTDAYSUM,
          SUM(ISTASALSAN) as TASALSANDAYSUM,
          SUM(HOTSORSONMINUTE) as HOTSORSONMINUTESUM,
          SUM(HOTSORSONDAY) as HOTSORSONDAYSUM,
          SUM(ERTMINUTE) as ERTMINUTESUM,
          SUM(ERTDAY) as ERTDAYSUM,
          SUM(OROIMINUTE) as OROIMINUTESUM,
          SUM(OROIDAY) as OROIDAYSUM
        FROM(
          SELECT FATHER_ID, ST_ID, TP, DT, MINTM, MAXTM, ISWORK,
            CASE WHEN TP = 11 AND ISWORK = 1 OR TP = 12 THEN 1 ELSE 0 END as CHOLOODAY,
            CASE WHEN TP = 13 AND ISWORK = 1 THEN 1 ELSE 0 END as UWCHTEIDAY,
            CASE WHEN TP = 21 AND ISWORK = 1 THEN 1 ELSE 0 END as AMRALTDAY,
            CASE WHEN TP = 31 AND ISWORK = 1 THEN 1 ELSE 0 END as TOMILOLTDAY,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM = MAXTM THEN 1 ELSE 0 END as ISTASALSAN,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'minute') ELSE 0 END as HOTSORSONMINUTE,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'day') ELSE 0 END as HOTSORSONDAY,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'minute') ELSE 0 END as ERTMINUTE,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'day') ELSE 0 END as ERTDAY,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'minute') ELSE 0 END as OROIMINUTE,
            CASE WHEN TP = 0 AND ISWORK = 1 AND MINTM != MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'day') ELSE 0 END as OROIDAY
          FROM(
            SELECT a.FATHER_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
            FROM(
              SELECT a.FATHER_ID, a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
              FROM(
                SELECT a.FATHER_ID, a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
                FROM(
                  SELECT a.FATHER_ID, a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
                  FROM ( 
                    SELECT a.ID, c.FATHER_ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
                    FROM (
                      SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
                      FROM (
                        SELECT a.ID, 
                          CASE 
                            WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + yr + @"-01-01','YYYY-MM-DD') 
                            THEN a.DT 
                            ELSE '" + yr + @"-01-01' 
                          END as BEGINDT, 
                          CASE 
                            --WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + @"-12-01','YYYY-MM-DD')) 
                            --THEN CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + @"-12-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                            WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + yr + @"-12-01','YYYY-MM-DD')) 
                            THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + yr + @"-12-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                        FROM ST_STBR a
                        INNER JOIN ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                        INNER JOIN STN_MOVE c ON a.MOVE_ID=c.ID
                        WHERE a.POS_ID!=2020102 AND c.ACTIVE=1
                        AND ((
                            TO_DATE('" + yr + @"-01-01','YYYY-MM-DD') 
                            BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                            OR 
                            LAST_DAY(TO_DATE('" + yr + @"-12-01','YYYY-MM-DD')) 
                            BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                          ) OR 
                            (
                              TO_DATE('" + yr + @"-01-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + yr + @"-12-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                            ))
                      ) a, (
                        SELECT DT
                        FROM(
                          SELECT(TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                          FROM DUAL
                          CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd')
                        )
                        WHERE DT BETWEEN TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                      ) b
                    ) a
                    INNER JOIN ST_STBR b ON a.ID=b.ID
                    INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
                    WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102
                  ) a
                  LEFT JOIN(
                    SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(1,2,3,4,5,6,7,8,9,10,11,12)
                  ) b ON a.DT = b.DT  
                ) a
                LEFT JOIN(
                  SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
                  FROM hr_mof.STN_TRCDLOG a
                  INNER JOIN ST_STAFFS b ON a.ENO = b.FINGERID
                  INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID
                  INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
                  INNER JOIN ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
                  WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + yr + @" AND a.MONTH IN(1,2,3,4,5,6,7,8,9,10,11,12) AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
                  GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
                ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
              ) a
              LEFT JOIN(
                SELECT DT, STAFFS_ID, MAX(TP) as TP
                FROM(
                  SELECT b.DT, a.STAFFS_ID, 11 as TP
                  FROM ST_CHULUUDAYF3 a,
                  (
                    SELECT(TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 12 as TP
                  FROM ST_CHULUUDAYT2 a,
                  (
                    SELECT(TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    a.ISRECEIVED = 1 AND
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 13 as TP
                  FROM ST_CHULUUSICK a,
                  (
                    SELECT(TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 21 as TP
                  FROM ST_AMRALT a,
                  (
                    SELECT(TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    a.TZISRECEIVED = 1 AND
                    b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
                  UNION ALL
                  SELECT b.DT, a.STAFFS_ID, 31 as TP
                  FROM ST_TOMILOLT_STAFFS a
                  INNER JOIN ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
                  (
                    SELECT(TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                    FROM DUAL
                    CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + yr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + yr + @"-01-01', 'yyyy-mm-dd')
                  ) b
                  WHERE
                    b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
                )
                GROUP BY DT, STAFFS_ID
              ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
            ) a
            LEFT JOIN(
              SELECT TO_DATE('" + yr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
              FROM ST_HOLIDAYOFFICIAL
              WHERE HOLMONTH IN(1,2,3,4,5,6,7,8,9,10,11,12)
              UNION ALL
              SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
              FROM ST_HOLIDAYUNOFFICIAL
              WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(1,2,3,4,5,6,7,8,9,10,11,12)
            ) b ON a.DT = b.DT
            GROUP BY a.FATHER_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
          )
        )
        GROUP BY FATHER_ID, TO_NUMBER(TO_CHAR(DT,'MM'))
    ) a
    INNER JOIN ST_BRANCH b ON a.GAZAR_ID=b.ID AND b.ISACTIVE=1
  )
  pivot(
    AVG(PER) ";
                strQry += "FOR MNTH IN (1 as \"Jan\",2 as \"Feb\",3 as \"Mar\",4 as \"Apr\",5 as \"May\",6 as \"Jun\",7 as \"Jul\",8 as \"Aug\",9 as \"Sep\",10 as \"Oct\",11 as \"Nov\",12 as \"Dec\") ) ORDER BY SORT";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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

        //*****rprt1.aspx*****//
        public string Rprt1Tab1Datatable(string gazar, string heltes, string stid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            if (gazar != "") gazar = " AND f.FATHER_ID=" + gazar;
            if (heltes != "") heltes = " AND f.ID=" + heltes;
            if (stid != "") stid = " AND a.STAFFS_ID=" + stid;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
  SELECT
  a.STAFFS_ID, 
  SUBSTR(c.LNAME,1,1)||LOWER(SUBSTR(c.LNAME,2))||' '||SUBSTR(c.FNAME,1,1)||LOWER(SUBSTR(c.FNAME,2)) as STAFFNAME,
  CASE WHEN f.ID=f.FATHER_ID THEN f.INITNAME ELSE g.INITNAME||' - '||f.INITNAME END as NEGJ,
  h.NAME as POSNAME,
  a.NAME, 
  a.SHAGNALDECISION_NAME, 
  a.DT, 
  a.TUSHAALNO, 
  a.PRICE, 
  a.CNT
FROM (
  SELECT
    a.STAFFS_ID, 
    a.NAME, 
    a.SHAGNALDECISION_NAME, 
    a.DT, 
    a.TUSHAALNO,
    a.PRICE, 
    b.CNT
  FROM (
    SELECT 
      b.STAFFS_ID, 
      a.NAME, 
      c.NAME as SHAGNALDECISION_NAME, 
      a.DT, 
      a.TUSHAALNO, 
      a.PRICE
    FROM ST_SHAGNAL a 
    INNER JOIN ST_SHAGNAL_STAFFS b ON a.ID=b.SHAGNAL_ID
    INNER JOIN STN_SHAGNALDECISION c ON a.SHAGNALDECISION_ID=c.ID
    UNION ALL
    SELECT 
      STAFFS_ID, NAME, null as SHAGNALDECISION_NAME, DT, null as TUSHAALNO, null as PRICE
    FROM ST_BONUS
  ) a
  LEFT JOIN (
    SELECT STAFFS_ID, SUM(CNT) as CNT
    FROM (
      SELECT 
        STAFFS_ID, COUNT(SHAGNAL_ID) as CNT
      FROM ST_SHAGNAL_STAFFS
      GROUP BY STAFFS_ID
      UNION ALL
      SELECT STAFFS_ID, COUNT(ID) as CNT
      FROM ST_BONUS
      GROUP BY STAFFS_ID
    ) 
    GROUP BY STAFFS_ID
  ) b ON a.STAFFS_ID=b.STAFFS_ID
) a
INNER JOIN ST_STAFFS c ON a.STAFFS_ID=c.ID
INNER JOIN ST_STBR d ON c.ID=d.STAFFS_ID AND d.ISACTIVE=1 
INNER JOIN STN_MOVE i ON d.MOVE_ID=i.ID AND i.ACTIVE=1
INNER JOIN ST_BRANCH f ON d.BRANCH_ID=f.ID AND d.ISACTIVE=1 
INNER JOIN ST_BRANCH g ON f.FATHER_ID=g.ID AND g.ISACTIVE=1 
LEFT JOIN STN_POS h ON d.POS_ID=h.ID 
WHERE 1=1" + gazar+heltes+stid+@"
ORDER BY g.SORT, f.SORT, h.SORT, c.ID, a.DT 
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return myObjGetTableData.DataTableToJson(ds.Tables[0]);
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

        public string RprtStaffHousCondTab1Table(List<string> branch, List<string> condition)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strCondition = string.Empty;
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++) {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            if (condition.Count == 1)
            {
                if (condition[0] == "") strCondition = "";
                else
                {
                    strCondition = " AND j.CONDITIONTYPE_ID = " + condition[0] + "";
                }
            }
            else
            {
                strCondition += " AND j.CONDITIONTYPE_ID IN (";
                for (int i = 0; i < condition.Count; i++)
                {
                    if (i != 0)
                    {
                        strCondition += ",";
                    }
                    strCondition += condition[i];
                }
                strCondition += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
    SELECT 
        b.STAFFS_ID
        , CASE WHEN g.ID<>g.FATHER_ID THEN h.INITNAME||'-'||g.INITNAME ELSE g.INITNAME END as BRANCH_INITNAME
        , i.NAME as POS_NAME
        , UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME
        , UPPER(a.FNAME) as FNAME
        , CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
        , k.NAME as CONDITIONTYPE_NAME
        , j.ADDRESS
        , j.YR
    FROM ST_CONDITION j
    INNER JOIN STN_CONDITIONTYPE k ON j.CONDITIONTYPE_ID=k.ID
    INNER JOIN ST_STBR b ON j.STAFFS_ID=b.STAFFS_ID AND b.ISACTIVE=1
    INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
    INNER JOIN STN_MOVETYPE f ON c.MOVETYPE_ID=f.ID 
    INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
    INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
    INNER JOIN ST_STAFFS a ON b.STAFFS_ID=a.ID
    LEFT JOIN STN_POS i ON b.POS_ID=i.ID
    WHERE c.ACTIVE=1"+ strBranch + strCondition + @"
    ORDER BY g.SORT, a.FNAME, j.YR
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffAgeGrpTab1Table(List<string> branch, List<string> type, List<string> ages)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strType = string.Empty;
            string strAges = string.Empty;
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            //type
            if (type.Count == 1)
            {
                if (type[0] == "") strType = "";
                else
                {
                    if (type[0] == "1")
                    {
                        strType = " AND c.ACTIVE=1";
                    }
                    else
                    {
                        strType += " AND c.MOVETYPE_ID = " + type[0];
                    }
                }
            }
            else {
                strType += " AND (";
                for (int i = 0; i < type.Count; i++)
                {
                    if (type[i] == "1")
                    {
                        strType = " c.ACTIVE=1";
                    }
                }
                if (strType == " AND (")
                {
                    strType += "";
                }
                else if (strType == "") {
                    strType += " AND (";
                }
                else
                {
                    strType += " OR";
                }
                strType += " c.MOVETYPE_ID IN (";
                int i2 = 0;
                for (int i = 0; i < type.Count; i++)
                {
                    if (type[i] != "1") {
                        if (i2 != 0)
                        {
                            strType += ",";
                        }
                        strType += type[i];
                        i2++;
                    }
                }
                strType += ")";
            }
            if (ages.Count == 1)
            {
                if (ages[0] == "") strAges = "";
                else
                {
                    strAges = " WHERE AGE BETWEEN " + ages[0].Split('-')[0] + " AND " + ages[0].Split('-')[1];
                }
            }
            else
            {
                strAges += " WHERE ";
                for (int i = 0; i < ages.Count; i++)
                {
                    if (i != 0)
                    {
                        strAges += " OR";
                    }
                    strAges += " (AGE BETWEEN " + ages[0].Split('-')[0] + " AND " + ages[0].Split('-')[1]+")";
                }
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.*  
FROM (
    SELECT * 
    FROM (
        SELECT 
            a.ID
            , CASE WHEN g.ID<>g.FATHER_ID THEN h.INITNAME||'-'||g.INITNAME ELSE g.INITNAME END as BRANCH_INITNAME
            , i.NAME as POS_NAME
            , UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME
            , UPPER(a.FNAME) as FNAME
            , a.REGNO
            , CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
            , CASE WHEN a.BDATE IS NULL THEN 0 ELSE trunc(months_between(sysdate, TO_DATE(a.BDATE, 'yyyy-mm-dd'))/12) END as AGE
            , CASE WHEN c.ACTIVE=1 AND c.SHOW=1 THEN TO_CHAR(c.NAME) WHEN c.ACTIVE=1 AND c.SHOW=0 THEN 'Идэвхтэй' ELSE REPLACE(REPLACE(TO_CHAR(f.NAME),'өлөөлөх','өлөөлөгдсөн'),'халах','халагдсан') END AS TP
        FROM ST_STAFFS a 
        INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
        INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
        INNER JOIN STN_MOVETYPE f ON c.MOVETYPE_ID=f.ID 
        INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
        INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
        LEFT JOIN STN_POS i ON b.POS_ID=i.ID
        WHERE 1=1" + strBranch + strType + @"
        ORDER BY g.SORT, i.SORT, a.FNAME
    ) "+ strAges + @"
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtMonitorFillDataTab1Table(List<string> branch, List<string> type)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strType = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            //type
            if (type.Count == 1)
            {
                if (type[0] == "") strType = "";
                else
                {
                    if (type[0] == "1")
                    {
                        strType = " AND (T1_AVGPER = 100 AND T2_AVGPER = 100 AND T3_AVGPER = 100 AND T4_AVGPER = 100 AND T5_AVGPER = 100 AND T6_AVGPER = 100 AND T7_AVGPER = 100 AND T8_AVGPER = 100 AND T9_AVGPER = 100)";
                    }
                    else if (type[0] == "2")
                    {
                        strType = " AND (T1_AVGPER <> 100 OR T2_AVGPER <> 100 OR T3_AVGPER <> 100 OR T4_AVGPER <> 100 OR T5_AVGPER <> 100 OR T6_AVGPER <> 100 OR T7_AVGPER <> 100 OR T8_AVGPER <> 100 OR T9_AVGPER <> 100)";
                    }
                    else {
                        strType += " AND T" + type[0].ToString().Substring(2, 1) + "_AVGPER";
                        if (type[0].ToString().Substring(0, 1) == "1") strType += " =";
                        else strType += " <>";
                        strType += " 100";
                    }
                }
            }
            else
            {
                strType += " AND (";
                for (int i = 0; i < type.Count; i++)
                {
                    if (type[i] == "1")
                    {
                        if (strType != " AND (") strType += " OR";
                        strType += " (T1_AVGPER = 100 AND T2_AVGPER = 100 AND T3_AVGPER = 100 AND T4_AVGPER = 100 AND T5_AVGPER = 100 AND T6_AVGPER = 100 AND T7_AVGPER = 100 AND T8_AVGPER = 100 AND T9_AVGPER = 100)";
                    }
                    else if (type[i] == "2")
                    {
                        if (strType != " AND (") strType += " OR";
                        strType += " (T1_AVGPER <> 100 OR T2_AVGPER <> 100 OR T3_AVGPER <> 100 OR T4_AVGPER <> 100 OR T5_AVGPER <> 100 OR T6_AVGPER <> 100 OR T7_AVGPER <> 100 OR T8_AVGPER <> 100 OR T9_AVGPER <> 100)";
                    }
                    else {
                        if (strType != " AND (") strType += " OR";
                        strType += " (T" + type[i].ToString().Substring(2, 1) + "_AVGPER";
                        if (type[i].ToString().Substring(0, 1) == "1") strType += " =";
                        else strType += " <>";
                        strType += " 100)";
                    }
                }
                strType += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
    SELECT *
    FROM (
        SELECT
            a.ID
            , b.BRANCH_ID
            , CASE WHEN g.ID<>g.FATHER_ID THEN h.NAME||'-'||g.NAME ELSE g.NAME END as BRANCH_NAME
            , i.NAME as POS_NAME
            , UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME
            , UPPER(a.FNAME) as FNAME
            , a.REGNO
            , CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
            , NVL(t1.AVGPER,0) as T1_AVGPER
            , NVL(t2.AVGPER,0) as T2_AVGPER
            , NVL(t3.AVGPER,0) as T3_AVGPER
            , NVL(t4.AVGPER,0) as T4_AVGPER
            , NVL(t5.AVGPER,0) as T5_AVGPER
            , NVL(t6.AVGPER,0) as T6_AVGPER
            , NVL(t7.AVGPER,0) as T7_AVGPER
            , NVL(t8.AVGPER,0) as T8_AVGPER
            , NVL(t9.AVGPER,0) as T9_AVGPER
        FROM ST_STAFFS a
        INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
        INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
        INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
        INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
        LEFT JOIN STN_POS i ON b.POS_ID=i.ID
        LEFT JOIN (
            SELECT ID as STAFFS_ID, ROUND(((NVL2(DOMAIN_USER,1,0)+NVL2(MNAME,1,0)+NVL2(LNAME,1,0)+NVL2(FNAME,1,0)+NVL2(BDATE,1,0)+NVL2(GENDER,1,0)+NVL2(EDUTP_ID,1,0)+NVL2(OCCTYPE_ID,1,0)+NVL2(OCCNAME,1,0)+NVL2(BCITY_ID,1,0)+NVL2(BDIST_ID,1,0)+NVL2(BPLACE,1,0)+NVL2(NAT_ID,1,0)+NVL2(SOCPOS_ID,1,0)+NVL2(ADDRCITY_ID,1,0)+NVL2(ADDRDIST_ID,1,0)+NVL2(ADDRESSNAME,1,0)+NVL2(TEL,1,0)+NVL2(TEL2,1,0)+NVL2(EMAIL,1,0)+NVL2(RELNAME,1,0)+NVL2(RELATION_ID,1,0)+NVL2(RELADDRESSNAME,1,0)+NVL2(RELTEL,1,0)+NVL2(RELTEL2,1,0)+NVL2(RELEMAIL,1,0)+NVL2(IMAGE,1,0)+NVL2(REGNO,1,0)+NVL2(CITNO,1,0)+NVL2(SOCNO,1,0)+NVL2(HEALNO,1,0))/31)*100) as AVGPER FROM ST_STAFFS
        ) t1 ON a.ID=t1.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, ROUND(SUM(PER)) as AVGPER FROM ( SELECT STAFFS_ID, TP, CASE WHEN COUNT(1)>0 THEN 100/2 ELSE 0 END as PER FROM ST_STAFFSFAMILY GROUP BY STAFFS_ID, TP ) GROUP BY STAFFS_ID
        ) t2 ON a.ID=t2.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, ROUND(SUM(PER)) as AVGPER
            FROM (
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/3 ELSE 0 END as PER FROM ST_EDUCATION GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/3 ELSE 0 END as PER FROM ST_PHD GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/3 ELSE 0 END as PER FROM ST_SCIENCEDEGREE GROUP BY STAFFS_ID
            )
            GROUP BY STAFFS_ID
        ) t3 ON a.ID=t3.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100 ELSE 0 END as AVGPER FROM ST_TRAINING GROUP BY STAFFS_ID
        ) t4 ON a.ID=t4.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100 ELSE 0 END as AVGPER FROM ST_JOBTITLEDEGREE GROUP BY STAFFS_ID
        ) t5 ON a.ID=t5.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, ROUND(SUM(PER)) as AVGPER
            FROM (
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/2 ELSE 0 END as PER FROM ST_SKILLS GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/2 ELSE 0 END as PER FROM ST_ANOTHERSKILLS GROUP BY STAFFS_ID
            )
            GROUP BY STAFFS_ID
        ) t6 ON a.ID=t6.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, ROUND(SUM(PER)) as AVGPER
            FROM (
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/3 ELSE 0 END as PER FROM ST_LANGUAGESKILLS GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/3 ELSE 0 END as PER FROM ST_SOFTWARE GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/3 ELSE 0 END as PER FROM ST_OFFICE GROUP BY STAFFS_ID
            )
            GROUP BY STAFFS_ID
        ) t7 ON a.ID=t7.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, ROUND(SUM(PER)) as AVGPER
            FROM (
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/2 ELSE 0 END as PER FROM ST_EXPHISTORY GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/2 ELSE 0 END as PER FROM ST_STATES GROUP BY STAFFS_ID
            )
            GROUP BY STAFFS_ID
        ) t8 ON a.ID=t8.STAFFS_ID
        LEFT JOIN (
            SELECT STAFFS_ID, ROUND(SUM(PER)) as AVGPER
            FROM (
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/5 ELSE 0 END as PER FROM ST_INNOVATION GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/5 ELSE 0 END as PER FROM ST_TOUR GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/5 ELSE 0 END as PER FROM ST_CONDITION GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/5 ELSE 0 END as PER FROM ST_DISPUTE GROUP BY STAFFS_ID
                UNION ALL
                SELECT STAFFS_ID, CASE WHEN COUNT(1)>0 THEN 100/5 ELSE 0 END as PER FROM ST_BONUS GROUP BY STAFFS_ID
            )
            GROUP BY STAFFS_ID
        ) t9 ON a.ID=t9.STAFFS_ID
        WHERE c.ACTIVE=1" + strBranch + @"
        ORDER BY g.SORT, i.SORT, a.FNAME
    )
    WHERE 1=1 " + strType + @"
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffMoveTab1Table(List<string> branch, List<string> type)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strType = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            //type
            if (type.Count == 1)
            {
                if (type[0] == "") strType = " AND c.MOVETYPE_ID IN (1,2,5,6)";
                else
                {
                    if (type[0] == "1")
                    {
                        strType = " AND c.ACTIVE = 1";
                    }
                    else if (type[0] == "2")
                    {
                        strType = " AND c.MOVETYPE_ID = 2";
                    }
                    else
                    {
                        strType = " AND c.ID = 20";
                    }
                }
            }
            else
            {
                strType += " AND (";
                for (int i = 0; i < type.Count; i++)
                {
                    if (type[i] == "1")
                    {
                        if (strType != " AND (") strType += " OR";
                        strType += " (c.ACTIVE = 1)";
                    }
                    else if (type[i] == "2")
                    {
                        if (strType != " AND (") strType += " OR";
                        strType += " (c.MOVETYPE_ID = 2)";
                    }
                    else
                    {
                        if (strType != " AND (") strType += " OR";
                        strType += " (c.ID = 20)";
                    }
                }
                strType += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
    SELECT 
        a.ID
        , CASE WHEN g.ID<>g.FATHER_ID THEN h.INITNAME||'-'||g.INITNAME ELSE g.INITNAME END as BRANCH_INITNAME
        , i.NAME as POS_NAME
        , UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME
        , UPPER(a.FNAME) as FNAME
        , a.REGNO
        , CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
        , CASE WHEN c.ACTIVE=1 THEN TO_CHAR('Идэвхтэй') ELSE CASE WHEN c.SHOW=1 THEN REPLACE(TO_CHAR(c.NAME),'эхэлсэн','авсан') ELSE REPLACE(TO_CHAR(f.NAME),'өлөөлөх','өлөөлөгдсөн') END END as MOVETYPE_NAME
    FROM ST_STAFFS a 
    INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
    INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
    INNER JOIN STN_MOVETYPE f ON c.MOVETYPE_ID=f.ID 
    INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
    INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
    LEFT JOIN STN_POS i ON b.POS_ID=i.ID
    WHERE 1=1" + strBranch +strType+ @"
    ORDER BY g.SORT, i.SORT, a.FNAME
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffMoveTab2Table(List<string> branch, List<string> type)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strType = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            //type
            if (type.Count == 1)
            {
                if (type[0] == "") strType = " AND c.MOVETYPE_ID IN (3,4)";
                else
                {
                    if (type[0] == "3")
                    {
                        strType = " AND c.MOVETYPE_ID = 3";
                    }
                    else
                    {
                        strType = " AND c.MOVETYPE_ID = 4";
                    }
                }
            }
            else
            {
                strType += " AND (";
                for (int i = 0; i < type.Count; i++)
                {
                    if (type[i] == "3")
                    {
                        if (strType != " AND (") strType += " OR";
                        strType += " (c.MOVETYPE_ID = 3)";
                    }
                    else
                    {
                        if (strType != " AND (") strType += " OR";
                        strType += " (c.MOVETYPE_ID = 4)";
                    }
                }
                strType += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
        SELECT 
        a.ID
            , CASE WHEN g.ID<>g.FATHER_ID THEN h.INITNAME||'-'||g.INITNAME ELSE g.INITNAME END as BRANCH_INITNAME
        , i.NAME as POS_NAME
        , UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME
        , UPPER(a.FNAME) as FNAME
        , a.REGNO
        , CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
        , REPLACE(REPLACE(TO_CHAR(f.NAME),'өлөөлөх','өлөөлөгдсөн'),'халах','халагдсан') as MOVETYPE_NAME
        , c.NAME as MOVE_NAME
        , b.DT as DT
    FROM ST_STAFFS a 
    INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
    INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
    INNER JOIN STN_MOVETYPE f ON c.MOVETYPE_ID=f.ID 
    INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
    INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
    LEFT JOIN STN_POS i ON b.POS_ID=i.ID
    WHERE 1=1" + strBranch + strType + @"
    ORDER BY g.SORT, i.SORT, a.FNAME
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffEducationTab1Table(List<string> branch, List<string> edutype, List<string> occtype)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strEduType = string.Empty;
            string strOccType = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            //edutype
            if (edutype.Count == 1)
            {
                if (edutype[0] == "") strEduType = "";
                else strEduType = " AND a.EDUTP_ID = "+ edutype[0];
            }
            else
            {
                strEduType = " AND a.EDUTP_ID IN (";
                for (int i = 0; i < edutype.Count; i++)
                {
                    if (strEduType != " AND a.EDUTP_ID IN (") strEduType += ",";
                    strEduType += edutype[i];
                }
                strEduType += ")";
            }

            //occtype
            if (occtype.Count == 1)
            {
                if (occtype[0] == "") strOccType = "";
                else strOccType = " AND a.OCCTYPE_ID = " + occtype[0];
            }
            else
            {
                strOccType = " AND a.OCCTYPE_ID IN (";
                for (int i = 0; i < occtype.Count; i++)
                {
                    if (strOccType != " AND a.OCCTYPE_ID IN (") strOccType += ",";
                    strOccType += occtype[i];
                }
                strOccType += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT 
        a.ID
        , CASE WHEN g.ID<>g.FATHER_ID THEN h.INITNAME||'-'||g.INITNAME ELSE g.INITNAME END as BRANCH_INITNAME
        , i.NAME as POS_NAME
        , UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME
        , UPPER(a.FNAME) as FNAME
        , CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
        , j.NAME AS EDUTP_NAME
        , k.NAME as OCCTYPE_NAME
        , a.OCCNAME
        , l.INSTITUTENAME as SCHL_INSTITUTENAME
        , a.EDUTP_ID
        , l.EDUTP_NAME as SCHL_EDUTP_NAME
        , l.PROFESSIONDESC as SCHL_PROFESSIONDESC
        , l.FROMYR as SCHL_FROMYR
        , l.TOYR as SCHL_TOYR
        , NVL(m.CNT, 1) as CNT 
    FROM ST_STAFFS a 
    INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
    INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
    INNER JOIN STN_MOVETYPE f ON c.MOVETYPE_ID=f.ID 
    INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
    INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
    LEFT JOIN STN_POS i ON b.POS_ID=i.ID
    LEFT JOIN STN_EDUTP j ON a.EDUTP_ID=j.ID
    LEFT JOIN STN_OCCTYPE k ON a.OCCTYPE_ID=k.ID
    LEFT JOIN (
        SELECT 
            a.STAFFS_ID
            , a.INSTITUTENAME
            , b.NAME AS EDUTP_NAME
            , a.PROFESSIONDESC
            , a.FROMYR
            , a.TOYR
        FROM ST_EDUCATION a
        LEFT JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID
    ) l ON a.ID=l.STAFFS_ID
    LEFT JOIN (
        SELECT a.STAFFS_ID, COUNT(1) as CNT FROM ST_EDUCATION a GROUP BY a.STAFFS_ID
    ) m ON a.ID=m.STAFFS_ID
    WHERE c.ACTIVE=1" + strBranch + strEduType + strOccType + @"
    ORDER BY g.SORT, i.SORT, a.FNAME, l.FROMYR, l.TOYR";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffRewardMofTab1Table(List<string> branch, List<string> shagnaltype, List<string> shagnaldescision, string begindate, string enddate)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strShagnalType = string.Empty;
            string strShagnalDecision = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            //shagnaltype
            if (shagnaltype.Count == 1)
            {
                if (shagnaltype[0] == "") strShagnalType = "";
                else strShagnalType = " AND k.SHAGNALTYPE_ID = " + shagnaltype[0];
            }
            else
            {
                strShagnalType = " AND k.SHAGNALTYPE_ID IN (";
                for (int i = 0; i < shagnaltype.Count; i++)
                {
                    if (strShagnalType != " AND k.SHAGNALTYPE_ID IN (") strShagnalType += ",";
                    strShagnalType += shagnaltype[i];
                }
                strShagnalType += ")";
            }

            //shagnaldecision
            if (shagnaldescision.Count == 1)
            {
                if (shagnaldescision[0] == "") strShagnalDecision = "";
                else strShagnalDecision = " AND k.SHAGNALDECISION = " + shagnaldescision[0];
            }
            else
            {
                strShagnalDecision = " AND k.SHAGNALDECISION IN (";
                for (int i = 0; i < shagnaldescision.Count; i++)
                {
                    if (strShagnalDecision != " AND k.SHAGNALDECISION IN (") strShagnalDecision += ",";
                    strShagnalDecision += shagnaldescision[i];
                }
                strShagnalDecision += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.* 
FROM (
    SELECT
        j.STAFFS_ID
        , CASE WHEN g.ID<>g.FATHER_ID THEN h.INITNAME||'-'||g.INITNAME ELSE g.INITNAME END as BRANCH_INITNAME
        , i.NAME as POS_NAME
        , UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME
        , UPPER(a.FNAME) as FNAME
        , CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
        , k.NAME as SHAGNAL_NAME
        , l.NAME as SHAGNAL_HELBER
        , m.NAME as SHAGNAL_SHIIDVER
        , k.ORGDESCRIPTION
        , k.PRICE
        , k.GROUND
        , k.DT
        , k.TUSHAALNO
    FROM ST_SHAGNAL_STAFFS j
    INNER JOIN ST_SHAGNAL k ON j.SHAGNAL_ID=k.ID
    INNER JOIN STN_SHAGNALTYPE l ON k.SHAGNALTYPE_ID=l.ID
    INNER JOIN STN_SHAGNALDECISION m ON k.SHAGNALDECISION_ID=m.ID
    INNER JOIN ST_STBR b ON j.STAFFS_ID=b.STAFFS_ID AND b.ISACTIVE=1
    INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
    INNER JOIN STN_MOVETYPE f ON c.MOVETYPE_ID=f.ID 
    INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
    INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
    INNER JOIN ST_STAFFS a ON b.STAFFS_ID=a.ID
    LEFT JOIN STN_POS i ON b.POS_ID=i.ID
    WHERE TO_DATE(k.DT,'YYYY-MM-DD') BETWEEN TO_DATE('" + begindate + @"','YYYY-MM-DD') AND TO_DATE('" + enddate + @"','YYYY-MM-DD')" + strBranch + strShagnalType + strShagnalDecision + @"
    ORDER BY g.SORT, a.FNAME, k.DT
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffAttendanceTab1Table(List<string> branch, string year, string month)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (b.ID = " + branch[0] + " OR b.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (b.ID = " + branch[i] + " OR b.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"with irts_main as (
    SELECT c.FATHER_ID, b.BRANCH_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK,
    CASE WHEN a.TP = 11 AND a.ISWORK = 1 OR a.TP = 12 THEN 1 ELSE 0 END as CHOLOODAY,
    CASE WHEN a.TP = 13 AND a.ISWORK = 1 THEN 1 ELSE 0 END as UWCHTEIDAY,
    CASE WHEN a.TP = 21 AND a.ISWORK = 1 THEN 1 ELSE 0 END as AMRALTDAY,
    CASE WHEN a.TP = 31 AND a.ISWORK = 1 THEN 1 ELSE 0 END as TOMILOLTDAY,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM = a.MAXTM THEN 1 ELSE 0 END as ISTASALSAN,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'minute') ELSE 0 END as HOTSORSONMINUTE,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'day') ELSE 0 END as HOTSORSONDAY,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'minute') ELSE 0 END as ERTMINUTE,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'day') ELSE 0 END as ERTDAY,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'minute') ELSE 0 END as OROIMINUTE,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'day') ELSE 0 END as OROIDAY
  FROM(
    SELECT a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
    FROM(
      SELECT a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
      FROM(
        SELECT a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
        FROM(
          SELECT a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
          FROM ( 
            SELECT a.ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
            FROM (
              SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
              FROM (
                SELECT a.ID, 
                  CASE 
                    WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD') 
                    THEN a.DT 
                    ELSE '" + year + "-" + month + @"-01' 
                  END as BEGINDT, 
                  CASE 
                    WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD')) 
                    THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                FROM hrdbuser.ST_STBR a
                INNER JOIN hrdbuser.ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                INNER JOIN hrdbuser.STN_MOVE c ON a.MOVE_ID=c.ID
                WHERE a.POS_ID!=2020102 AND c.ACTIVE=1
                AND ((
                    TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD') 
                    BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                    OR 
                    LAST_DAY(TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD')) 
                    BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                  ) OR 
                    (
                      TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + month + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                    ))
              ) a, (
                SELECT DT
                FROM(
                  SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
                )
                WHERE DT BETWEEN TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
              ) b
            ) a
            INNER JOIN hrdbuser.ST_STBR b ON a.ID=b.ID
            INNER JOIN hrdbuser.ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
            WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102
          ) a
          LEFT JOIN(
            SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM hrdbuser.ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + month + @")
          ) b ON a.DT = b.DT  
        ) a
        LEFT JOIN(
          SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
          FROM hr_mof.STN_TRCDLOG a
          INNER JOIN hrdbuser.ST_STAFFS b ON a.ENO = b.FINGERID
          INNER JOIN hrdbuser.ST_STBR c ON b.ID = c.STAFFS_ID
          INNER JOIN hrdbuser.STN_MOVE d ON c.MOVE_ID = d.ID
          INNER JOIN hrdbuser.ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
          WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + year + @" AND a.MONTH IN(" + month + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
          GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
        ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
      ) a
      LEFT JOIN(
        SELECT DT, STAFFS_ID, MAX(TP) as TP
        FROM(
          SELECT b.DT, a.STAFFS_ID, 11 as TP
          FROM hrdbuser.ST_CHULUUDAYF3 a,
          (
            SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 12 as TP
          FROM hrdbuser.ST_CHULUUDAYT2 a,
          (
            SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            a.ISRECEIVED = 1 AND
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 13 as TP
          FROM hrdbuser.ST_CHULUUSICK a,
          (
            SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 21 as TP
          FROM hrdbuser.ST_AMRALT a,
          (
            SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            a.TZISRECEIVED = 1 AND
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 31 as TP
          FROM hrdbuser.ST_TOMILOLT_STAFFS a
          INNER JOIN hrdbuser.ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
          (
            SELECT(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + month + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
        )
        GROUP BY DT, STAFFS_ID
      ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
    ) a
    LEFT JOIN(
      SELECT TO_DATE('" + year + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
      FROM hrdbuser.ST_HOLIDAYOFFICIAL
      WHERE HOLMONTH IN(" + month + @")
      UNION ALL
      SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
      FROM hrdbuser.ST_HOLIDAYUNOFFICIAL
      WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + month + @")
    ) b ON a.DT = b.DT
    GROUP BY a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
  ) a
  INNER JOIN ST_STBR b ON a.ST_ID=b.STAFFS_ID AND b.ISACTIVE=1
  INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID
)
SELECT ROWNUM as ROWNO, a.*
FROM (
    SELECT 
        CASE WHEN b.ID<>b.FATHER_ID THEN '     '||b.NAME ELSE b.NAME END as BR_NAME, a.WORKDAY, ROUND(a.WORKDAY-(a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM),2) as EVALWORKEDDAY, ROUND(((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)) / a.WORKDAY) * 100, 2) as PER, b.SORT
        , c.CNT AS STAFF_CNT
    FROM ( 
        SELECT 
            a.FATHER_ID as BRANCH_ID, b.WORKDAY, b.CHOLOODAYSUM, b.UWCHTEIDAYSUM, b.AMRALTDAYSUM, b.TOMILOLTDAYSUM, b.TASALSANDAYSUM, b.HOTSORSONMINUTESUM, b.HOTSORSONDAYSUM, b.ERTMINUTESUM,  b.ERTDAYSUM, b.OROIMINUTESUM, b.OROIDAYSUM
        FROM (
            SELECT FATHER_ID FROM ST_BRANCH WHERE ISACTIVE=1 GROUP BY FATHER_ID
        ) a
        LEFT JOIN (
            SELECT FATHER_ID,
              SUM(ISWORK) as WORKDAY,
              SUM(CHOLOODAY) as CHOLOODAYSUM,
              SUM(UWCHTEIDAY) as UWCHTEIDAYSUM,
              SUM(AMRALTDAY) as AMRALTDAYSUM,
              SUM(TOMILOLTDAY) as TOMILOLTDAYSUM,
              SUM(ISTASALSAN) as TASALSANDAYSUM,
              SUM(HOTSORSONMINUTE) as HOTSORSONMINUTESUM,
              SUM(HOTSORSONDAY) as HOTSORSONDAYSUM,
              SUM(ERTMINUTE) as ERTMINUTESUM,
              SUM(ERTDAY) as ERTDAYSUM,
              SUM(OROIMINUTE) as OROIMINUTESUM,
              SUM(OROIDAY) as OROIDAYSUM
            FROM(
                irts_main
            )
            GROUP BY FATHER_ID
        ) b ON a.FATHER_ID=b.FATHER_ID
        UNION ALL
        SELECT 
            a.ID as BRANCH_ID, b.WORKDAY, b.CHOLOODAYSUM, b.UWCHTEIDAYSUM, b.AMRALTDAYSUM, b.TOMILOLTDAYSUM, b.TASALSANDAYSUM, b.HOTSORSONMINUTESUM, b.HOTSORSONDAYSUM, b.ERTMINUTESUM,  b.ERTDAYSUM, b.OROIMINUTESUM, b.OROIDAYSUM
        FROM ST_BRANCH a
        LEFT JOIN (
            SELECT BRANCH_ID,
              SUM(ISWORK) as WORKDAY,
              SUM(CHOLOODAY) as CHOLOODAYSUM,
              SUM(UWCHTEIDAY) as UWCHTEIDAYSUM,
              SUM(AMRALTDAY) as AMRALTDAYSUM,
              SUM(TOMILOLTDAY) as TOMILOLTDAYSUM,
              SUM(ISTASALSAN) as TASALSANDAYSUM,
              SUM(HOTSORSONMINUTE) as HOTSORSONMINUTESUM,
              SUM(HOTSORSONDAY) as HOTSORSONDAYSUM,
              SUM(ERTMINUTE) as ERTMINUTESUM,
              SUM(ERTDAY) as ERTDAYSUM,
              SUM(OROIMINUTE) as OROIMINUTESUM,
              SUM(OROIDAY) as OROIDAYSUM
            FROM(
                irts_main
            )
            GROUP BY BRANCH_ID
        ) b ON a.ID=b.BRANCH_ID
        WHERE a.ISACTIVE=1 AND a.ID<>a.FATHER_ID
    ) a
    INNER JOIN hrdbuser.ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
    LEFT JOIN (
        SELECT d.FATHER_ID as BRANCH_ID, COUNT(1) as CNT 
        FROM ST_STAFFS a 
        INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
        INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID
        INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID
        WHERE c.ACTIVE=1
        GROUP BY d.FATHER_ID
        UNION ALL
        SELECT d.ID as BRANCH_ID, COUNT(1) as CNT 
        FROM ST_STAFFS a 
        INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
        INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID
        INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID
        WHERE c.ACTIVE=1 AND d.ID<>d.FATHER_ID
        GROUP BY d.ID
    ) c ON a.BRANCH_ID=c.BRANCH_ID
    WHERE 1 = 1" + strBranch + @"
    ORDER BY b.SORT
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string ListStaffsWithPos(List<string> branch, string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            DataTable dt = null;
            string strBranch = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (c.ID = " + branch[0] + " OR c.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (c.ID = " + branch[i] + " OR c.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT 
    a.ID as STAFFS_ID
    , UPPER(SUBSTR(a.LNAME,0,1))||'.'||UPPER(a.FNAME)||' | '||f.NAME as ST_NAME
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID 
INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID 
INNER JOIN STN_POS f ON b.POS_ID=f.ID 
INNER JOIN STN_MOVE g ON b.MOVE_ID=g.ID 
WHERE g.ACTIVE=1"+ strBranch + @"
ORDER BY d.SORT, c.SORT, f.SORT";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                dt = ds.Tables[0];
                if (set1stIndexValue != "" && set1stIndexValue != null)
                {
                    DataRow drow = dt.NewRow();
                    drow["ST_NAME"] = set1stIndexValue;
                    dt.Rows.InsertAt(drow, 0);
                }
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", dt);
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
        public string RprtStaffAttendanceTab2Table(List<string> branch, List<string> staff, string year, string monthbegin, string monthend)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strStaff = string.Empty;
            string strMonthList = "";
            for (int i = Int32.Parse(monthbegin); i <= Int32.Parse(monthend); i++)
            {
                if (strMonthList == "") strMonthList += i.ToString();
                else strMonthList += "," + i.ToString();
            }
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (d.ID = " + branch[0] + " OR d.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (d.ID = " + branch[i] + " OR d.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }
            //staff
            if (staff.Count == 1)
            {
                if (staff[0] == "") strStaff = "";
                else
                {
                    strStaff = " AND (a.ST_ID = " + staff[0] + ")";
                }
            }
            else
            {
                strStaff += " AND (";
                for (int i = 0; i < staff.Count; i++)
                {
                    if (i != 0)
                    {
                        strStaff += " OR";
                    }
                    strStaff += " (a.ST_ID = " + staff[i] + ")";
                }
                strStaff += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"with irts_main as (
    SELECT c.FATHER_ID, b.BRANCH_ID, a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK,
    CASE WHEN a.TP = 11 AND a.ISWORK = 1 OR a.TP = 12 THEN 1 ELSE 0 END as CHOLOODAY,
    CASE WHEN a.TP = 13 AND a.ISWORK = 1 THEN 1 ELSE 0 END as UWCHTEIDAY,
    CASE WHEN a.TP = 21 AND a.ISWORK = 1 THEN 1 ELSE 0 END as AMRALTDAY,
    CASE WHEN a.TP = 31 AND a.ISWORK = 1 THEN 1 ELSE 0 END as TOMILOLTDAY,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM = a.MAXTM THEN 1 ELSE 0 END as ISTASALSAN,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'minute') ELSE 0 END as HOTSORSONMINUTE,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'hotsorson', 'day') ELSE 0 END as HOTSORSONDAY,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'minute') ELSE 0 END as ERTMINUTE,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'ert', 'day') ELSE 0 END as ERTDAY,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'minute') ELSE 0 END as OROIMINUTE,
    CASE WHEN a.TP = 0 AND a.ISWORK = 1 AND a.MINTM != a.MAXTM THEN IS_CHECK_TSAG(TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MINTM, 'yyyy-mm-dd hh24:mi:ss'), TO_DATE(TO_CHAR(a.DT, 'yyyy-mm-dd') || ' ' || MAXTM, 'yyyy-mm-dd hh24:mi:ss'), 'oroi', 'day') ELSE 0 END as OROIDAY
  FROM(
    SELECT a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
    FROM(
      SELECT a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
      FROM(
        SELECT a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
        FROM(
          SELECT a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
          FROM ( 
            SELECT a.ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
            FROM (
              SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
              FROM (
                SELECT a.ID, 
                  CASE 
                    WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + year + "-" + monthbegin + @"-01','YYYY-MM-DD') 
                    THEN a.DT 
                    ELSE '" + year + "-" + monthbegin + @"-01' 
                  END as BEGINDT, 
                  CASE 
                    WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD')) 
                    THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                FROM hrdbuser.ST_STBR a
                INNER JOIN hrdbuser.ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                INNER JOIN hrdbuser.STN_MOVE c ON a.MOVE_ID=c.ID
                WHERE a.POS_ID!=2020102 AND c.ACTIVE=1
                AND ((
                    TO_DATE('" + year + "-" + monthbegin + @"-01','YYYY-MM-DD') 
                    BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                    OR 
                    LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD')) 
                    BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                  ) OR 
                    (
                      TO_DATE('" + year + "-" + monthbegin + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                    ))
              ) a, (
                SELECT DT
                FROM(
                  SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
                )
                WHERE DT BETWEEN TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
              ) b
            ) a
            INNER JOIN hrdbuser.ST_STBR b ON a.ID=b.ID
            INNER JOIN hrdbuser.ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
            WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102
          ) a
          LEFT JOIN(
            SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM hrdbuser.ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
          ) b ON a.DT = b.DT  
        ) a
        LEFT JOIN(
          SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
          FROM hr_mof.STN_TRCDLOG a
          INNER JOIN hrdbuser.ST_STAFFS b ON a.ENO = b.FINGERID
          INNER JOIN hrdbuser.ST_STBR c ON b.ID = c.STAFFS_ID
          INNER JOIN hrdbuser.STN_MOVE d ON c.MOVE_ID = d.ID
          INNER JOIN hrdbuser.ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
          WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + year + @" AND a.MONTH IN(" + strMonthList + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
          GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
        ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
      ) a
      LEFT JOIN(
        SELECT DT, STAFFS_ID, MAX(TP) as TP
        FROM(
          SELECT b.DT, a.STAFFS_ID, 11 as TP
          FROM hrdbuser.ST_CHULUUDAYF3 a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 12 as TP
          FROM hrdbuser.ST_CHULUUDAYT2 a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            a.ISRECEIVED = 1 AND
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 13 as TP
          FROM hrdbuser.ST_CHULUUSICK a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 21 as TP
          FROM hrdbuser.ST_AMRALT a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            a.TZISRECEIVED = 1 AND
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 31 as TP
          FROM hrdbuser.ST_TOMILOLT_STAFFS a
          INNER JOIN hrdbuser.ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
        )
        GROUP BY DT, STAFFS_ID
      ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
    ) a
    LEFT JOIN(
      SELECT TO_DATE('" + year + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
      FROM hrdbuser.ST_HOLIDAYOFFICIAL
      WHERE HOLMONTH IN(" + strMonthList + @")
      UNION ALL
      SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
      FROM hrdbuser.ST_HOLIDAYUNOFFICIAL
      WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
    ) b ON a.DT = b.DT
    GROUP BY a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
  ) a
  INNER JOIN ST_STBR b ON a.ST_ID=b.STAFFS_ID AND b.ISACTIVE=1
  INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID
)
SELECT ROWNUM as ROWNO, a.*
FROM (
    SELECT
        a.ST_ID, 
        CASE WHEN d.ID = d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME || '-' || d.INITNAME END as NEGJ, 
        g.NAME as POS_NAME, 
        SUBSTR(h.LNAME, 0, 1) || '.' || SUBSTR(h.FNAME, 1, 1) || LOWER(SUBSTR(h.FNAME, 2)) as STAFFNAME, 
        a.WORKDAY, 
        a.CHOLOODAYSUM, 
        a.UWCHTEIDAYSUM, 
        a.AMRALTDAYSUM, 
        a.TOMILOLTDAYSUM, 
        ROUND((a.WORKDAY - (a.CHOLOODAYSUM + a.UWCHTEIDAYSUM + a.AMRALTDAYSUM + a.TOMILOLTDAYSUM + a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)), 2) as WORKEDAY, 
        a.TASALSANDAYSUM, 
        ROUND(a.HOTSORSONMINUTESUM, 1) as HOTSORSONMINUTESUM, 
        ROUND(a.HOTSORSONDAYSUM,1) as HOTSORSONDAYSUM, 
        ROUND(a.ERTMINUTESUM, 1) as ERTMINUTESUM, 
        ROUND(a.OROIMINUTESUM, 1) as OROIMINUTESUM, 
        ROUND((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)), 2) as EVALWORKEDDAY, 
        ROUND(((a.WORKDAY - (a.TASALSANDAYSUM + a.HOTSORSONDAYSUM + a.ERTDAYSUM)) / a.WORKDAY) * 100, 2) as PER
    FROM (
        SELECT ST_ID,
          SUM(ISWORK) as WORKDAY,
          SUM(CHOLOODAY) as CHOLOODAYSUM,
          SUM(UWCHTEIDAY) as UWCHTEIDAYSUM,
          SUM(AMRALTDAY) as AMRALTDAYSUM,
          SUM(TOMILOLTDAY) as TOMILOLTDAYSUM,
          SUM(ISTASALSAN) as TASALSANDAYSUM,
          SUM(HOTSORSONMINUTE) as HOTSORSONMINUTESUM,
          SUM(HOTSORSONDAY) as HOTSORSONDAYSUM,
          SUM(ERTMINUTE) as ERTMINUTESUM,
          SUM(ERTDAY) as ERTDAYSUM,
          SUM(OROIMINUTE) as OROIMINUTESUM,
          SUM(OROIDAY) as OROIDAYSUM
        FROM(
            irts_main
        )
        GROUP BY ST_ID
    ) a
    INNER JOIN hrdbuser.ST_STBR c ON a.ST_ID = c.STAFFS_ID AND c.ISACTIVE = 1
    INNER JOIN hrdbuser.ST_BRANCH d ON c.BRANCH_ID = d.ID AND d.ISACTIVE = 1
    INNER JOIN hrdbuser.ST_BRANCH f ON d.FATHER_ID = f.ID AND f.ISACTIVE = 1
    INNER JOIN hrdbuser.STN_POS g ON c.POS_ID = g.ID
    INNER JOIN hrdbuser.ST_STAFFS h ON a.ST_ID = h.ID
    WHERE a.WORKDAY>0" + strBranch + strStaff + @"
    ORDER BY f.SORT, d.SORT, g.SORT, a.ST_ID 
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffAttendanceTab3Table(string staff, string year, string monthbegin, string monthend)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strStaff = string.Empty;
            string strMonthList = "";
            for (int i = Int32.Parse(monthbegin); i <= Int32.Parse(monthend); i++)
            {
                if (strMonthList == "") strMonthList += i.ToString();
                else strMonthList += "," + i.ToString();
            }
            //staff
            if (staff == "") strStaff = "";
            else
            {
                strStaff = " AND (a.ST_ID = " + staff + ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"with irts_main as (
    SELECT a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END as ISWORK
    FROM(
      SELECT a.ST_ID, NVL(b.TP, 0) as TP, a.DT, a.MINTM, a.MAXTM, a.ISWORK
      FROM(
        SELECT a.ST_ID, a.DT, NVL(b.TP, 0) as TP, NVL(b.MINTM, '00:00:00') as MINTM, NVL(b.MAXTM, '00:00:00') as MAXTM, a.ISWORK
        FROM(
          SELECT a.STAFFS_ID as ST_ID, a.DT, CASE WHEN b.DT IS NULL THEN a.ISWORK ELSE 1 END as ISWORK
          FROM ( 
            SELECT a.ID, b.STAFFS_ID, c.FATHER_ID as GAZAR_ID, c.ID as HELTES_ID, a.DT, CASE WHEN(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 6 OR(MOD(TO_CHAR(a.DT, 'J'), 7) + 1) = 7 THEN 0 ELSE 1 END as ISWORK
            FROM (
              SELECT a.ID, a.BEGINDT, a.ENDDT, b.DT
              FROM (
                SELECT a.ID, 
                  CASE 
                    WHEN TO_DATE(a.DT,'YYYY-MM-DD')>TO_DATE('" + year + "-" + monthbegin + @"-01','YYYY-MM-DD') 
                    THEN a.DT 
                    ELSE '" + year + "-" + monthbegin + @"-01' 
                  END as BEGINDT, 
                  CASE 
                    WHEN TO_DATE(CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')<LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD')) 
                    THEN CASE WHEN c.ACTIVE=0 THEN TO_CHAR((TO_DATE(NVL(a.ENDDT,a.DT),'YYYY-MM-DD')-1),'YYYY-MM-DD') ELSE NVL(TO_CHAR((TO_DATE(a.ENDDT,'YYYY-MM-DD')-1),'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD')) END ELSE TO_CHAR(LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD')),'YYYY-MM-DD') END as ENDDT
                FROM hrdbuser.ST_STBR a
                INNER JOIN hrdbuser.ST_BRANCH b ON a.BRANCH_ID=b.ID AND b.ISACTIVE=1
                INNER JOIN hrdbuser.STN_MOVE c ON a.MOVE_ID=c.ID
                WHERE a.POS_ID!=2020102 AND c.ACTIVE=1 AND a.STAFFS_ID="+staff+@"
                AND ((
                    TO_DATE('" + year + "-" + monthbegin + @"-01','YYYY-MM-DD') 
                    BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                    OR 
                    LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD')) 
                    BETWEEN TO_DATE(a.DT,'YYYY-MM-DD') AND TO_DATE(CASE WHEN c.ACTIVE=0 THEN NVL(a.ENDDT,a.DT) ELSE NVL(a.ENDDT, TO_CHAR(SYSDATE,'YYYY-MM-DD')) END,'YYYY-MM-DD')
                  ) OR 
                    (
                      TO_DATE('" + year + "-" + monthbegin + @"-01','YYYY-MM-DD')<TO_DATE(a.DT,'YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01','YYYY-MM-DD'))>TO_DATE(a.DT,'YYYY-MM-DD')
                    ))
              ) a, (
                SELECT DT
                FROM(
                  SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
                )
                WHERE DT BETWEEN TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
              ) b
            ) a
            INNER JOIN hrdbuser.ST_STBR b ON a.ID=b.ID
            INNER JOIN hrdbuser.ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1
            WHERE a.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND b.POS_ID!=2020102
          ) a
          LEFT JOIN(
            SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM hrdbuser.ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
          ) b ON a.DT = b.DT  
        ) a
        LEFT JOIN(
          SELECT a.MONTH, a.INOUT as TP, b.ID as ST_ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') as DT, TO_CHAR(MIN(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MINTM, TO_CHAR(MAX(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY || ' ' || a.HOUR || ':' || a.MINUTE || ':' || a.SECOND, 'yyyy-mm-dd hh24:mi:ss')), 'hh24:mi:ss') as MAXTM
          FROM hr_mof.STN_TRCDLOG a
          INNER JOIN hrdbuser.ST_STAFFS b ON a.ENO = b.FINGERID
          INNER JOIN hrdbuser.ST_STBR c ON b.ID = c.STAFFS_ID
          INNER JOIN hrdbuser.STN_MOVE d ON c.MOVE_ID = d.ID
          INNER JOIN hrdbuser.ST_BRANCH f ON c.BRANCH_ID = f.ID AND f.ISACTIVE = 1
          WHERE c.POS_ID!=2020102 AND a.INOUT = 0 AND a.YEAR = " + year + @" AND a.MONTH IN(" + strMonthList + @") AND TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd') BETWEEN TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') AND SYSDATE AND MOD(TO_CHAR(TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd'), 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
            AND b.ID="+ staff + @"
          GROUP BY a.MONTH, a.INOUT, b.ID, TO_DATE(a.YEAR || '-' || a.MONTH || '-' || a.DAY, 'yyyy-mm-dd')
        ) b ON a.ST_ID = b.ST_ID AND a.DT = b.DT  
      ) a
      LEFT JOIN(
        SELECT DT, STAFFS_ID, MAX(TP) as TP
        FROM(
          SELECT b.DT, a.STAFFS_ID, 11 as TP
          FROM hrdbuser.ST_CHULUUDAYF3 a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 12 as TP
          FROM hrdbuser.ST_CHULUUDAYT2 a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            a.ISRECEIVED = 1 AND
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 13 as TP
          FROM hrdbuser.ST_CHULUUSICK a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 21 as TP
          FROM hrdbuser.ST_AMRALT a,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            a.TZISRECEIVED = 1 AND
            b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
          UNION ALL
          SELECT b.DT, a.STAFFS_ID, 31 as TP
          FROM hrdbuser.ST_TOMILOLT_STAFFS a
          INNER JOIN hrdbuser.ST_TOMILOLT c ON a.TOMILOLT_ID = c.ID,
          (
            SELECT(TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + "-" + monthend + @"-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + "-" + monthbegin + @"-01', 'yyyy-mm-dd')
          ) b
          WHERE
            b.DT BETWEEN TO_DATE(c.FROMDATE, 'YYYY-MM-DD') AND TO_DATE(c.TODATE, 'YYYY-MM-DD')
        )
        GROUP BY DT, STAFFS_ID
      ) b ON a.DT = b.DT AND a.ST_ID = b.STAFFS_ID
    ) a
    LEFT JOIN(
      SELECT TO_DATE('" + year + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
      FROM hrdbuser.ST_HOLIDAYOFFICIAL
      WHERE HOLMONTH IN(" + strMonthList + @")
      UNION ALL
      SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
      FROM hrdbuser.ST_HOLIDAYUNOFFICIAL
      WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + year + @" AND TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'MM')) IN(" + strMonthList + @")
    ) b ON a.DT = b.DT
    GROUP BY a.ST_ID, a.TP, a.DT, a.MINTM, a.MAXTM, CASE WHEN b.DT is null THEN a.ISWORK ELSE 0 END
)
SELECT ROWNUM as ROWNO, a.*
FROM (
    SELECT a.ST_ID
        , CASE WHEN b.ID=b.FATHER_ID THEN b.INITNAME ELSE c.INITNAME||'-'||b.INITNAME END as NEGJ
        , d.NAME as POSNAME
        , SUBSTR(f.LNAME,0,1)||'.'||SUBSTR(f.FNAME,1,1)||LOWER(SUBSTR(f.FNAME,2)) as STNAME
        , a.TP
        , TO_CHAR(a.DT,'YYYY-MM-DD') as DT
        , a.MINTM
        , a.MAXTM
        , a.ISWORK
        , CASE 
            WHEN a.ISWORK=0 THEN 'Амралтын өдөр' 
        ELSE
            CASE 
                WHEN a.TP = 91 THEN 'Тэмдэглэлт өдөр' 
                WHEN a.TP = 31 THEN 'Албан томилолт' 
                WHEN a.TP = 11 OR a.TP = 12 THEN 'Чөлөөтэй' 
                WHEN a.TP = 21 THEN 'Ээлжийн амралттай' 
                WHEN a.TP = 13 THEN 'Өвчтэй'
                WHEN a.TP = 0 THEN CASE
                    WHEN a.MINTM = '00:00:00' OR a.MAXTM = '00:00:00' THEN 'Тасалсан'
                    ELSE CASE
                        WHEN trunc(86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))>0 THEN 'Хоцорсон' 
                        ELSE 'Цагтаа ирсэн'
                    END
                END
            END
        END as TP_NAME
        , CASE 
            WHEN a.ISWORK=0 THEN 'blueDark' 
        ELSE
            CASE 
                WHEN a.TP = 91 THEN 'lighten' 
                WHEN a.TP = 31 THEN 'blue' 
                WHEN a.TP = 11 OR a.TP = 12 THEN 'orangeDark' 
                WHEN a.TP = 21 THEN 'greenDark' 
                WHEN a.TP = 13 THEN 'pink'
                WHEN a.TP = 0 THEN CASE
                    WHEN a.MINTM = '00:00:00' OR a.MAXTM = '00:00:00' THEN 'redLight'
                    ELSE CASE
                        WHEN trunc(86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))>0 THEN 'yellow' 
                        ELSE 'blueLight'
                    END
                END
            END
        END as TP_COLOR
        , CASE 
            WHEN a.ISWORK = 1 AND a.TP = 0 AND a.MINTM <> '00:00:00' THEN CASE
                WHEN trunc(86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS'))) > 0 
                THEN TO_CHAR(trunc(((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)/60)-24*(trunc((((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)/60)/24)))||':'||TO_CHAR(trunc((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)-60*(trunc(((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)/60)))||':'||TO_CHAR(trunc(86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))-60*(trunc((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MINTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.BEGINTM IS NOT NULL THEN CASE WHEN g.BEGINTM = '08:30' THEN g.ENDTM ELSE '08:40' END ELSE '08:40' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)))
                ELSE '00:00:00'
            END
        ELSE
            '00:00:00'
        END as HOTSORSON
        , CASE 
            WHEN a.ISWORK = 1 AND a.TP = 0 AND a.MAXTM <> '00:00:00' THEN CASE
                WHEN trunc(86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.ENDTM IS NOT NULL THEN CASE WHEN g.ENDTM = '17:30' THEN g.BEGINTM ELSE '17:30' END ELSE '17:30' END||':00','YYYY-MM-DD HH24:MI:SS'))) < 0 
                THEN TO_CHAR(24*(trunc((((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.ENDTM IS NOT NULL THEN CASE WHEN g.ENDTM = '17:30' THEN g.BEGINTM ELSE '17:30' END ELSE '17:30' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)/60)/24)) - trunc(((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.ENDTM IS NOT NULL THEN CASE WHEN g.ENDTM = '17:30' THEN g.BEGINTM ELSE '17:30' END ELSE '17:30' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)/60))||':'||TO_CHAR(60*(trunc(((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.ENDTM IS NOT NULL THEN CASE WHEN g.ENDTM = '17:30' THEN g.BEGINTM ELSE '17:30' END ELSE '17:30' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)/60)) - trunc((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.ENDTM IS NOT NULL THEN CASE WHEN g.ENDTM = '17:30' THEN g.BEGINTM ELSE '17:30' END ELSE '17:30' END||':00','YYYY-MM-DD HH24:MI:SS')))/60))||':'||TO_CHAR(60*(trunc((86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.ENDTM IS NOT NULL THEN CASE WHEN g.ENDTM = '17:30' THEN g.BEGINTM ELSE '17:30' END ELSE '17:30' END||':00','YYYY-MM-DD HH24:MI:SS')))/60)) - trunc(86400*(TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||a.MAXTM,'YYYY-MM-DD HH24:MI:SS')-TO_DATE(TO_CHAR(a.DT,'YYYY-MM-DD')||' '||CASE WHEN g.ENDTM IS NOT NULL THEN CASE WHEN g.ENDTM = '17:30' THEN g.BEGINTM ELSE '17:30' END ELSE '17:30' END||':00','YYYY-MM-DD HH24:MI:SS'))))
                ELSE '00:00:00'
            END
        ELSE
            '00:00:00'
        END as ERT
    FROM irts_main a
    INNER JOIN hrdbuser.ST_STAFFS f ON a.ST_ID = f.ID
    INNER JOIN hrdbuser.ST_STBR j ON j.STAFFS_ID=f.ID AND j.ISACTIVE=1
    INNER JOIN hrdbuser.ST_BRANCH b ON j.BRANCH_ID = b.ID AND b.ISACTIVE = 1
    INNER JOIN hrdbuser.ST_BRANCH c ON b.FATHER_ID = c.ID AND c.ISACTIVE = 1
    INNER JOIN hrdbuser.STN_POS d ON j.POS_ID = d.ID
    LEFT JOIN hrdbuser.ST_CHULUUTIME g ON a.ST_ID=g.STAFFS_ID AND a.DT=TO_DATE(g.DT,'YYYY-MM-DD') AND g.ISRECEIVED=1
    ORDER BY c.SORT, b.SORT, d.SORT, a.ST_ID, a.DT
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffWorkedYearTab1Table(List<string> branch, List<string> type, List<string> ages)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strType = string.Empty;
            string strAges = string.Empty;
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (g.ID = " + branch[0] + " OR g.FATHER_ID = " + branch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (g.ID = " + branch[i] + " OR g.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }

            //type
            if (type.Count == 1)
            {
                if (type[0] == "") strType = "";
                else
                {
                    if (type[0] == "1")
                    {
                        strType = " AND c.ACTIVE=1";
                    }
                    else
                    {
                        strType = " AND c.ACTIVE<>1";
                    }
                }
            }
            else
            {
                strType += " AND (";
                for (int i = 0; i < type.Count; i++)
                {
                    if (strType != " AND (") strType += " OR";
                    if (type[i] == "1") strType += " c.ACTIVE = 1";
                    if (type[i] == "2") strType += " c.ACTIVE <> 1";
                }
                strType += " )";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT ROWNUM as ROWNO, a.*  
FROM (
    SELECT 
        a.STAFFS_ID
        , CASE WHEN g.ID<>g.FATHER_ID THEN h.INITNAME||'-'||g.INITNAME ELSE g.INITNAME END as BRANCH_INITNAME
        , i.NAME as POS_NAME
        , UPPER(SUBSTR(a1.LNAME,0,1))||LOWER(substr(a1.LNAME, instr(a1.LNAME, 'K') + 2)) as LNAME
        , UPPER(a1.FNAME) as FNAME
        , a1.REGNO
        , CASE WHEN a1.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
        , a.DAYCNT_MOF
        , a.DAYCNT_GOV
        , a.DAYCNT_WORKED
    FROM ( 
        SELECT STAFFS_ID, ROUND(DAYCNT_MOF/365,1) as DAYCNT_MOF, ROUND((DAYCNT_MOF+DAYCNT_GOV)/365,1) as DAYCNT_GOV, ROUND((DAYCNT_MOF+DAYCNT_GOV+DAYCNT_WORKED)/365,1) as DAYCNT_WORKED
        FROM (
            SELECT STAFFS_ID, SUM(DAYCNT_MOF) as DAYCNT_MOF, SUM(DAYCNT_GOV) as DAYCNT_GOV, SUM(DAYCNT_WORKED) as DAYCNT_WORKED
            FROM (
                SELECT STAFFS_ID, ROUND(ENDDT-DT) as DAYCNT_MOF, 0 as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM (
                    SELECT a.STAFFS_ID, TO_DATE(a.DT,'YYYY-MM-DD') as DT, CASE WHEN a.ENDDT IS NOT NULL THEN TO_DATE(a.ENDDT,'YYYY-MM-DD') ELSE SYSDATE END as ENDDT 
                    FROM hrdbuser.ST_STBR a
                    INNER JOIN hrdbuser.STN_MOVE b ON a.MOVE_ID=b.ID 
                    WHERE b.ISWORK=1
                )
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID=1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, 0 as DAYCNT_GOV, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID<>1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL
            ) 
            GROUP BY STAFFS_ID
        )
    ) a
    INNER JOIN ST_STAFFS a1 ON a.STAFFS_ID=a1.ID
    INNER JOIN ST_STBR b ON a.STAFFS_ID=b.STAFFS_ID AND b.ISACTIVE=1 
    INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
    INNER JOIN STN_MOVETYPE f ON c.MOVETYPE_ID=f.ID 
    INNER JOIN ST_BRANCH g ON b.BRANCH_ID=g.ID AND b.ISACTIVE=1
    INNER JOIN ST_BRANCH h ON g.FATHER_ID=h.ID
    LEFT JOIN STN_POS i ON b.POS_ID=i.ID
    WHERE 1=1" + strBranch + strType + @"
    ORDER BY g.SORT, i.SORT, a1.FNAME
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtTomiloltForeignTab1Table(string type, List<string> direction, List<string> budget, string begindate, string enddate)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strDirection = string.Empty;
            string strBudget = string.Empty;
            string strDateDuration = string.Empty;
            //type
            if(type != "1" && type != "2") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу.");
            //check begindate
            DateTime dtBeginDate, dtEndDate;
            if (!DateTime.TryParseExact(begindate, "yyyy-MM-dd", DateTimeFormatInfo.InvariantInfo, DateTimeStyles.None, out dtBeginDate)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Эхлэх огноо буруу орсон байна.");
            if (!DateTime.TryParseExact(enddate, "yyyy-MM-dd", DateTimeFormatInfo.InvariantInfo, DateTimeStyles.None, out dtEndDate)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дуусах огноо буруу орсон байна.");
            if(dtBeginDate > dtEndDate) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дуусах огноо эхлэх огнооноос их байна.");
            strDateDuration = " AND TO_DATE(FROMDATE,'YYYY-MM-DD') BETWEEN TO_DATE('"+ begindate + "','YYYY-MM-DD') AND TO_DATE('" + enddate + "','YYYY-MM-DD')";
            //direction
            if (direction.Count == 1)
            {
                if (direction[0] == "") strDirection = "";
                else strDirection = " AND TOMILOLTDIRECTION_ID = " + direction[0];
            }
            else
            {
                strDirection += " AND TOMILOLTDIRECTION_ID IN (";
                for (int i = 0; i < direction.Count; i++)
                {
                    if (i != 0) strDirection += ",";
                    strDirection += direction[i];
                }
                strDirection += ")";
            }
            //budget
            if (budget.Count == 1)
            {
                if (budget[0] == "") strBudget = "";
                else strBudget = " AND TOMILOLTBUDGET_ID = " + budget[0];
            }
            else
            {
                strBudget += " AND TOMILOLTDIRECTION_ID IN (";
                for (int i = 0; i < budget.Count; i++)
                {
                    if (i != 0) strBudget += ",";
                    strBudget += budget[i];
                }
                strBudget += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"WITH TMP_TOMILOLT as (
    SELECT ID FROM hrdbuser.ST_TOMILOLT WHERE TOMILOLTYPE_ID = " + type + strDirection + strBudget + strDateDuration + @"
)
SELECT ROWNUM as ROWNO, a.*
FROM (
    SELECT 
        a.ID
        , b.NAME as TOMILOLTDIRECTION_NAME
        , CASE WHEN a.TOMILOLTBUDGET_ID=3 THEN a.TOMILOLT_BUDGET_OTHER ELSE c.NAME END as TOMILOLTBUDGET_NAME
        , a.FROMDATE||' - '||a.TODATE as ""DURATION""
        , a.DAYNUM
        , a.COUNTRYNAME
        , a.CITYNAME
        , a.SUBJECTNAME
        , a.TUSHAALDATE
        , a.TUSHAALNO
        , d.STAFFSLISTID
    FROM ST_TOMILOLT a
    LEFT JOIN STN_TOMILOLTDIRECTION b ON a.TOMILOLTDIRECTION_ID = b.ID
    LEFT JOIN STN_TOMILOLTBUDGET c ON a.TOMILOLTBUDGET_ID = c.ID
    LEFT JOIN(
        SELECT TOMILOLT_ID, RTRIM(xmlagg (xmlelement (e, BRANCH_INITNAME|| ' - ' || STAFFS_NAME || ',')).extract('//text()'), ',') as STAFFSLISTID
        FROM(
            SELECT
                a.TOMILOLT_ID
                , a.STAFFS_ID
                , CASE WHEN d.ID <> d.FATHER_ID THEN f.INITNAME || '-' || d.INITNAME ELSE d.INITNAME END as BRANCH_INITNAME
                , g.NAME as POS_NAME
                , UPPER(SUBSTR(h.LNAME,0,1))||'.'||UPPER(SUBSTR(h.FNAME,0,1))||LOWER(SUBSTR(h.FNAME,2)) as STAFFS_NAME 
            FROM ST_TOMILOLT_STAFFS a
            INNER JOIN hrdbuser.ST_STBR c ON a.STAFFS_ID = c.STAFFS_ID AND c.ISACTIVE = 1
            INNER JOIN hrdbuser.ST_BRANCH d ON c.BRANCH_ID = d.ID
            INNER JOIN hrdbuser.ST_BRANCH f ON d.FATHER_ID = f.ID
            INNER JOIN hrdbuser.ST_STAFFS h ON a.STAFFS_ID = h.ID
            LEFT JOIN hrdbuser.STN_POS g ON c.POS_ID = g.ID
            WHERE a.TOMILOLT_ID IN(SELECT ID FROM TMP_TOMILOLT)
            ORDER BY d.SORT ASC, g.SORT ASC, h.FNAME ASC
        )
        GROUP BY TOMILOLT_ID
    ) d ON a.ID = d.TOMILOLT_ID
    WHERE a.ID IN(SELECT ID FROM TMP_TOMILOLT)
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtTomiloltForeignTab2Table(string type, List<string> direction, List<string> budget, string begindate, string enddate, List<string> branch, List<string> isreport)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strDirection = string.Empty;
            string strBudget = string.Empty;
            string strDateDuration = string.Empty;
            string strBranch = string.Empty;
            string strIsReport = string.Empty;
            //type
            if (type != "1" && type != "2") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу.");
            //check begindate
            DateTime dtBeginDate, dtEndDate;
            if (!DateTime.TryParseExact(begindate, "yyyy-MM-dd", DateTimeFormatInfo.InvariantInfo, DateTimeStyles.None, out dtBeginDate)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Эхлэх огноо буруу орсон байна.");
            if (!DateTime.TryParseExact(enddate, "yyyy-MM-dd", DateTimeFormatInfo.InvariantInfo, DateTimeStyles.None, out dtEndDate)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дуусах огноо буруу орсон байна.");
            if (dtBeginDate > dtEndDate) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дуусах огноо эхлэх огнооноос их байна.");
            strDateDuration = " AND TO_DATE(FROMDATE,'YYYY-MM-DD') BETWEEN TO_DATE('" + begindate + "','YYYY-MM-DD') AND TO_DATE('" + enddate + "','YYYY-MM-DD')";
            //direction
            if (direction.Count == 1)
            {
                if (direction[0] == "") strDirection = "";
                else strDirection = " AND TOMILOLTDIRECTION_ID = " + direction[0];
            }
            else
            {
                strDirection += " AND TOMILOLTDIRECTION_ID IN (";
                for (int i = 0; i < direction.Count; i++)
                {
                    if (i != 0) strDirection += ",";
                    strDirection += direction[i];
                }
                strDirection += ")";
            }
            //budget
            if (budget.Count == 1)
            {
                if (budget[0] == "") strBudget = "";
                else strBudget = " AND TOMILOLTBUDGET_ID = " + budget[0];
            }
            else
            {
                strBudget += " AND TOMILOLTDIRECTION_ID IN (";
                for (int i = 0; i < budget.Count; i++)
                {
                    if (i != 0) strBudget += ",";
                    strBudget += budget[i];
                }
                strBudget += ")";
            }
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else strBranch = " AND (d.ID = " + branch[0] + " OR d.FATHER_ID = " + branch[0] + ")";
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0) strBranch += " OR";
                    strBranch += " (d.ID = " + branch[i] + " OR d.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }
            //isreport
            if (isreport.Count == 1)
            {
                if (isreport[0] == "") strIsReport = "";
                else
                {
                    if (isreport[0] == "1") strIsReport = " AND j.REPORTFILENAME IS NOT NULL";
                    else if (isreport[0] == "0") strIsReport = " AND j.REPORTFILENAME IS NULL";
                }
            }
            else {
                strIsReport += " AND (";
                for (int i = 0; i < isreport.Count; i++)
                {
                    if (i != 0) strIsReport += " OR";
                    if (isreport[i] == "1") strIsReport += " j.REPORTFILENAME IS NOT NULL";
                    else if (isreport[i] == "0") strIsReport += " j.REPORTFILENAME IS NULL";
                }
                strIsReport += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"WITH TMP_TOMILOLT as (
    SELECT ID FROM hrdbuser.ST_TOMILOLT WHERE TOMILOLTYPE_ID = " + type + strDirection + strBudget + strDateDuration + @"
)
SELECT ROWNUM as ROWNO, a.*
FROM (
    SELECT
        a.TOMILOLT_ID
        , a.STAFFS_ID
        , CASE WHEN d.ID<>d.FATHER_ID THEN f.INITNAME||'-'||d.INITNAME ELSE d.INITNAME END as BRANCH_INITNAME
        , g.NAME as POS_NAME
        , UPPER(SUBSTR(h.LNAME,0,1))||LOWER(substr(h.LNAME, instr(h.LNAME, 'K') + 2)) as LNAME
        , UPPER(h.FNAME) as FNAME
        , i.FROMDATE||' - '||i.TODATE as ""DURATION""
        , i.DAYNUM
        , i.COUNTRYNAME
        , i.CITYNAME
        , i.SUBJECTNAME
        , CASE WHEN j.REPORTFILENAME IS NOT NULL THEN 'Тийм' ELSE 'Үгүй' END AS ISREPORT
    FROM ST_TOMILOLT_STAFFS a
    INNER JOIN hrdbuser.ST_STBR c ON a.STAFFS_ID = c.STAFFS_ID AND c.ISACTIVE = 1
    INNER JOIN hrdbuser.ST_BRANCH d ON c.BRANCH_ID = d.ID
    INNER JOIN hrdbuser.ST_BRANCH f ON d.FATHER_ID = f.ID
    INNER JOIN hrdbuser.ST_STAFFS h ON a.STAFFS_ID = h.ID
    LEFT JOIN hrdbuser.STN_POS g ON c.POS_ID = g.ID
    LEFT JOIN hrdbuser.ST_TOMILOLT i ON a.TOMILOLT_ID = i.ID
    LEFT JOIN hrdbuser.ST_TOMILOLT_REPORT j ON a.TOMILOLT_ID = j.TOMILOLT_ID AND a.STAFFS_ID = j.STAFFS_ID
    WHERE a.TOMILOLT_ID IN (SELECT ID FROM TMP_TOMILOLT)" + strBranch + strIsReport + @"
    ORDER BY d.SORT ASC, g.SORT ASC, h.FNAME ASC
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtAmraltTab1Table(string year, List<string> branch, List<string> isbody)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strIsBody = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else strBranch = " AND (d.ID = " + branch[0] + " OR d.FATHER_ID = " + branch[0] + ")";
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0) strBranch += " OR";
                    strBranch += " (d.ID = " + branch[i] + " OR d.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }
            //isbody
            if (isbody.Count == 1)
            {
                if (isbody[0] == "") strIsBody = "";
                else strIsBody = " AND a.ISBODY = " + isbody[0];
            }
            else
            {
                strIsBody += " AND (";
                for (int i = 0; i < isbody.Count; i++)
                {
                    if (i != 0) strIsBody += " OR";
                    strIsBody += " a.ISBODY = " + isbody[i];
                }
                strIsBody += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"WITH TMP_ACTIVESTAFFLIST as (
    SELECT 
        a.ID as STAFFS_ID
        , CASE WHEN TO_DATE(b.DT,'YYYY-MM-DD')>TO_DATE('" + year + @"-01-01','YYYY-MM-DD') THEN TO_DATE(b.DT,'YYYY-MM-DD') ELSE TO_DATE('" + year + @"-01-01','YYYY-MM-DD') END as BEGINDT
        , LAST_DAY(TO_DATE('" + year + @"-12-01','YYYY-MM-DD')) as ENDDT
    FROM ST_STAFFS a 
    INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
    INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
    INNER JOIN ST_BRANCH d ON b.BRANCH_ID = d.ID
    WHERE c.ACTIVE=1 AND CASE WHEN TO_DATE(b.DT,'YYYY-MM-DD')>TO_DATE('" + year + @"-01-01','YYYY-MM-DD') THEN TO_DATE(b.DT,'YYYY-MM-DD') ELSE TO_DATE('" + year + @"-01-01','YYYY-MM-DD') END BETWEEN TO_DATE('" + year + @"-01-01','YYYY-MM-DD') AND LAST_DAY(TO_DATE('" + year + @"-12-01','YYYY-MM-DD'))" + strBranch + @"
), TMP_DAYLIST as (
    SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 1 ELSE a.ISWORK END as ISWORK
    FROM (
        SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 0 ELSE a.ISWORK END as ISWORK
        FROM (
            SELECT a.DT, CASE WHEN b.HOLMONTH IS NOT NULL AND b.HOLDAY IS NOT NULL THEN 0 ELSE a.ISWORK END AS ISWORK
            FROM (
                SELECT DT, CASE WHEN (MOD(TO_CHAR(DT, 'J'), 7) + 1)=6 OR (MOD(TO_CHAR(DT, 'J'), 7) + 1)=7 THEN 0 ELSE 1 END AS ISWORK
                FROM(
                  SELECT(TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + @"-12-31', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd')
                )
                WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
            ) a
            LEFT JOIN hrdbuser.ST_HOLIDAYOFFICIAL b ON TO_NUMBER(TO_CHAR(a.DT, 'MM'))=b.HOLMONTH AND TO_NUMBER(TO_CHAR(a.DT, 'DD'))=b.HOLDAY
        ) a 
        LEFT JOIN hrdbuser.ST_HOLIDAYUNOFFICIAL b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
    ) a
    LEFT JOIN hrdbuser.ST_HOLIDAYISWORK b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
), TMP_AMRALT as (
    SELECT STAFFS_ID, COUNT(DT) as AMARSANDAYCNT
    FROM (
        SELECT
            a.DT, a.STAFFS_ID
        FROM (
            SELECT b.DT, a.STAFFS_ID
            FROM hrdbuser.ST_AMRALT a,
            (
                SELECT(TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                FROM DUAL
                CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd')
            ) b
            WHERE a.TZISRECEIVED = 1 AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD') AND a.STAFFS_ID IN (SELECT STAFFS_ID FROM TMP_ACTIVESTAFFLIST)" + strIsBody + @"
            GROUP BY b.DT, a.STAFFS_ID
        ) a
        INNER JOIN TMP_DAYLIST b ON a.DT=b.DT AND b.ISWORK=1 
    )
    GROUP BY STAFFS_ID
)
SELECT ROWNUM as ROWNO, a.*
FROM (
    SELECT 
        a.STAFFS_ID
        , CASE WHEN e.ID<>e.FATHER_ID THEN e2.INITNAME||'-'||e.INITNAME ELSE e.INITNAME END as BRANCH_INITNAME
        , f.NAME as POS_NAME
        , UPPER(SUBSTR(b.LNAME,0,1))||LOWER(substr(b.LNAME, instr(b.LNAME, 'K') + 2)) as LNAME
        , UPPER(b.FNAME) as FNAME
        , b.REGNO
        , CASE WHEN b.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
        , (15+NVL(CASE WHEN 6 > g.DAYCNT_WORKED THEN 0 WHEN 6 <= g.DAYCNT_WORKED AND 11 > g.DAYCNT_WORKED THEN 3 WHEN 11 <= g.DAYCNT_WORKED AND 16 > g.DAYCNT_WORKED THEN 5 WHEN 16 <= g.DAYCNT_WORKED AND 21 > g.DAYCNT_WORKED THEN 7 WHEN 21 <= g.DAYCNT_WORKED AND 26 > g.DAYCNT_WORKED THEN 9 WHEN 26 <= g.DAYCNT_WORKED AND 32 > g.DAYCNT_WORKED THEN 11 WHEN 32 <= g.DAYCNT_WORKED THEN 14 END,0)) as AMRAHDAY
        , NVL(h.AMARSANDAYCNT,0) as AMARSANDAYCNT
        , i.DTLIST
    FROM TMP_ACTIVESTAFFLIST a 
    INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID
    INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
    INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
    INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
    INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID
    LEFT JOIN STN_POS f ON c.POS_ID=f.ID
    LEFT JOIN (
        SELECT STAFFS_ID, ROUND(DAYCNT_MOF/365,1) as DAYCNT_MOF, ROUND((DAYCNT_MOF+DAYCNT_GOV)/365,1) as DAYCNT_GOV, ROUND((DAYCNT_MOF+DAYCNT_GOV+DAYCNT_WORKED)/365,1) as DAYCNT_WORKED
        FROM (
            SELECT STAFFS_ID, SUM(DAYCNT_MOF) as DAYCNT_MOF, SUM(DAYCNT_GOV) as DAYCNT_GOV, SUM(DAYCNT_WORKED) as DAYCNT_WORKED
            FROM (
                SELECT STAFFS_ID, ROUND(ENDDT-DT) as DAYCNT_MOF, 0 as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM (
                    SELECT a.STAFFS_ID, TO_DATE(a.DT,'YYYY-MM-DD') as DT, CASE WHEN a.ENDDT IS NOT NULL THEN TO_DATE(a.ENDDT,'YYYY-MM-DD') ELSE SYSDATE END as ENDDT 
                    FROM hrdbuser.ST_STBR a
                    INNER JOIN hrdbuser.STN_MOVE b ON a.MOVE_ID=b.ID 
                    WHERE b.ISWORK=1 AND a.STAFFS_ID IN (SELECT STAFFS_ID FROM TMP_ACTIVESTAFFLIST)
                )
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID=1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL AND STAFFS_ID IN (SELECT STAFFS_ID FROM TMP_ACTIVESTAFFLIST)
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, 0 as DAYCNT_GOV, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID<>1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL AND STAFFS_ID IN (SELECT STAFFS_ID FROM TMP_ACTIVESTAFFLIST)
            ) 
            GROUP BY STAFFS_ID
        )
    ) g ON a.STAFFS_ID=g.STAFFS_ID
    LEFT JOIN TMP_AMRALT h ON a.STAFFS_ID=h.STAFFS_ID
    LEFT JOIN (
        SELECT STAFFS_ID, RTRIM(xmlagg (xmlelement (e, DT || ', ')).extract('//text()'), ', ') as DTLIST
        FROM (
            SELECT STAFFS_ID, BEGINDT||' - '||ENDDT as DT 
            FROM (
                SELECT STAFFS_ID, BEGINDT, ENDDT 
                FROM hrdbuser.ST_AMRALT 
                WHERE TZISRECEIVED = 1 AND TO_DATE(BEGINDT, 'YYYY-MM-DD') BETWEEN TO_DATE('" + year + @"-01-01', 'YYYY-MM-DD') AND TO_DATE('" + year + @"-12-31', 'YYYY-MM-DD')
                GROUP BY STAFFS_ID, BEGINDT, ENDDT
            )
            ORDER BY BEGINDT ASC, ENDDT ASC
        )
        GROUP BY STAFFS_ID
    ) i ON a.STAFFS_ID=i.STAFFS_ID
    WHERE d.ACTIVE=1
    ORDER BY e.SORT ASC, f.SORT ASC, b.FNAME ASC
) a";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtChuluuTimeTab1Table(string year, List<string> branch, List<string> reason, List<string> issalary)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strIsSalary = string.Empty;
            string strReason = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else strBranch = " AND (e.ID = " + branch[0] + " OR e.FATHER_ID = " + branch[0] + ")";
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0) strBranch += " OR";
                    strBranch += " (e.ID = " + branch[i] + " OR e.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }
            //reason
            if (reason.Count == 1)
            {
                if (reason[0] == "") strReason = "";
                else strReason = " AND a.CHULUUREASON_ID = " + reason[0];
            }
            else
            {
                strReason += " AND (";
                for (int i = 0; i < reason.Count; i++)
                {
                    if (i != 0) strReason += " OR";
                    strReason += " a.CHULUUREASON_ID = " + reason[i];
                }
                strReason += ")";
            }
            //issalary
            if (issalary.Count == 1)
            {
                if (issalary[0] == "") strIsSalary = "";
                else strIsSalary = " AND a.ISSALARY = " + issalary[0];
            }
            else
            {
                strIsSalary += " AND (";
                for (int i = 0; i < issalary.Count; i++)
                {
                    if (i != 0) strIsSalary += " OR";
                    strIsSalary += " a.ISSALARY = " + issalary[i];
                }
                strIsSalary += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT 
    a.STAFFS_ID
    , CASE WHEN e.ID<>e.FATHER_ID THEN e2.INITNAME||'-'||e.INITNAME ELSE e.INITNAME END as BRANCH_INITNAME
    , f.NAME as POS_NAME
    , UPPER(SUBSTR(b.LNAME,0,1))||LOWER(substr(b.LNAME, instr(b.LNAME, 'K') + 2)) as LNAME
    , UPPER(b.FNAME) as FNAME
    , b.REGNO
    , CASE WHEN b.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
    , a.DT
    , a.BEGINTM
    , a.ENDTM
    , ROUND((TO_DATE(a.DT||' '||a.ENDTM, 'YYYY-MM-DD HH24:MI')-TO_DATE(a.DT||' '||a.BEGINTM, 'YYYY-MM-DD HH24:MI'))*24,1) as TSAG
    , MOD((TO_DATE(a.DT||' '||a.ENDTM, 'YYYY-MM-DD HH24:MI')-TO_DATE(a.DT||' '||a.BEGINTM, 'YYYY-MM-DD HH24:MI'))*24*60,60) as MIN
    , g.NAME as CHULUUREASON_NAME
    , CASE WHEN a.ISSALARY=1 THEN 'Цалинтай' ELSE 'Цалингүй' END AS ISSALARY
FROM ST_CHULUUTIME a 
INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID
INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID
LEFT JOIN STN_POS f ON c.POS_ID=f.ID
LEFT JOIN STN_CHULUUREASON g ON a.CHULUUREASON_ID=g.ID
WHERE d.ACTIVE=1 AND a.ISRECEIVED=1 AND TO_CHAR(TO_DATE(a.DT,'YYYY-MM-DD'),'YYYY')=" + year + strBranch + strReason + strIsSalary + @"
ORDER BY a.DT ASC, e.SORT ASC, f.SORT ASC, b.FNAME ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtChuluuDayT2Tab1Table(string year, List<string> branch, List<string> reason, List<string> issalary)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strIsSalary = string.Empty;
            string strReason = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else strBranch = " AND (e.ID = " + branch[0] + " OR e.FATHER_ID = " + branch[0] + ")";
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0) strBranch += " OR";
                    strBranch += " (e.ID = " + branch[i] + " OR e.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }
            //reason
            if (reason.Count == 1)
            {
                if (reason[0] == "") strReason = "";
                else strReason = " AND a.CHULUUREASON_ID = " + reason[0];
            }
            else
            {
                strReason += " AND (";
                for (int i = 0; i < reason.Count; i++)
                {
                    if (i != 0) strReason += " OR";
                    strReason += " a.CHULUUREASON_ID = " + reason[i];
                }
                strReason += ")";
            }
            //issalary
            if (issalary.Count == 1)
            {
                if (issalary[0] == "") strIsSalary = "";
                else strIsSalary = " AND a.ISSALARY = " + issalary[0];
            }
            else
            {
                strIsSalary += " AND (";
                for (int i = 0; i < issalary.Count; i++)
                {
                    if (i != 0) strIsSalary += " OR";
                    strIsSalary += " a.ISSALARY = " + issalary[i];
                }
                strIsSalary += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"WITH TMP_DAYLIST as (
    SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 1 ELSE a.ISWORK END as ISWORK
    FROM (
        SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 0 ELSE a.ISWORK END as ISWORK
        FROM (
            SELECT a.DT, CASE WHEN b.HOLMONTH IS NOT NULL AND b.HOLDAY IS NOT NULL THEN 0 ELSE a.ISWORK END AS ISWORK
            FROM (
                SELECT DT, CASE WHEN (MOD(TO_CHAR(DT, 'J'), 7) + 1)=6 OR (MOD(TO_CHAR(DT, 'J'), 7) + 1)=7 THEN 0 ELSE 1 END AS ISWORK
                FROM(
                  SELECT(TO_DATE('"+year+@"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('"+year+@"-12-31', 'yyyy-mm-dd')) + 1) - TO_DATE('"+year+@"-01-01', 'yyyy-mm-dd')
                )
                WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
            ) a
            LEFT JOIN hrdbuser.ST_HOLIDAYOFFICIAL b ON TO_NUMBER(TO_CHAR(a.DT, 'MM'))=b.HOLMONTH AND TO_NUMBER(TO_CHAR(a.DT, 'DD'))=b.HOLDAY
        ) a 
        LEFT JOIN hrdbuser.ST_HOLIDAYUNOFFICIAL b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
    ) a
    LEFT JOIN hrdbuser.ST_HOLIDAYISWORK b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
), TMP_CHULUUDAYT2 as (
    SELECT a.ID, COUNT(a.DT) as DAYCNT
    FROM (
        SELECT a.ID, b.DT
        FROM ST_CHULUUDAYT2 a
        INNER JOIN ST_STBR c ON a.STAFFS_ID=c.STAFFS_ID AND c.ISACTIVE=1
        INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
        INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
        INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID,
        (
            SELECT(TO_DATE('"+year+@"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('"+year+@"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('"+year+ @"-01-01', 'yyyy-mm-dd')
        ) b
        WHERE d.ACTIVE=1 AND a.ISRECEIVED=1 AND TO_CHAR(TO_DATE(a.BEGINDT, 'YYYY-MM-DD'),'YYYY')=" + year + strBranch + strReason + strIsSalary + @" AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
    ) a
    INNER JOIN TMP_DAYLIST b ON a.DT=b.DT AND b.ISWORK=1
    GROUP BY a.ID
)
SELECT 
    a1.ID
    , a.STAFFS_ID
    , CASE WHEN e.ID<>e.FATHER_ID THEN e2.INITNAME||'-'||e.INITNAME ELSE e.INITNAME END as BRANCH_INITNAME
    , f.NAME as POS_NAME
    , UPPER(SUBSTR(b.LNAME,0,1))||LOWER(substr(b.LNAME, instr(b.LNAME, 'K') + 2)) as LNAME
    , UPPER(b.FNAME) as FNAME
    , b.REGNO
    , CASE WHEN b.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
    , a.BEGINDT
    , a.ENDDT
    , a1.DAYCNT
    , g.NAME as CHULUUREASON_NAME
    , CASE WHEN a.ISSALARY=1 THEN 'Цалинтай' ELSE 'Цалингүй' END AS ISSALARY
FROM TMP_CHULUUDAYT2 a1 
INNER JOIN ST_CHULUUDAYT2 a ON a1.ID=a.ID
INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID
INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID
LEFT JOIN STN_POS f ON c.POS_ID=f.ID
LEFT JOIN STN_CHULUUREASON g ON a.CHULUUREASON_ID=g.ID
ORDER BY a.BEGINDT ASC, a.ENDDT ASC, e.SORT ASC, f.SORT ASC, b.FNAME ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtChuluuDayF3Tab1Table(string year, List<string> branch, List<string> reason, List<string> issalary)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strIsSalary = string.Empty;
            string strReason = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else strBranch = " AND (e.ID = " + branch[0] + " OR e.FATHER_ID = " + branch[0] + ")";
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0) strBranch += " OR";
                    strBranch += " (e.ID = " + branch[i] + " OR e.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }
            //reason
            if (reason.Count == 1)
            {
                if (reason[0] == "") strReason = "";
                else strReason = " AND a.CHULUUREASON_ID = " + reason[0];
            }
            else
            {
                strReason += " AND (";
                for (int i = 0; i < reason.Count; i++)
                {
                    if (i != 0) strReason += " OR";
                    strReason += " a.CHULUUREASON_ID = " + reason[i];
                }
                strReason += ")";
            }
            //issalary
            if (issalary.Count == 1)
            {
                if (issalary[0] == "") strIsSalary = "";
                else strIsSalary = " AND a.ISSALARY = " + issalary[0];
            }
            else
            {
                strIsSalary += " AND (";
                for (int i = 0; i < issalary.Count; i++)
                {
                    if (i != 0) strIsSalary += " OR";
                    strIsSalary = " a.ISSALARY = " + issalary[i];
                }
                strIsSalary += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"WITH TMP_DAYLIST as (
    SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 1 ELSE a.ISWORK END as ISWORK
    FROM (
        SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 0 ELSE a.ISWORK END as ISWORK
        FROM (
            SELECT a.DT, CASE WHEN b.HOLMONTH IS NOT NULL AND b.HOLDAY IS NOT NULL THEN 0 ELSE a.ISWORK END AS ISWORK
            FROM (
                SELECT DT, CASE WHEN (MOD(TO_CHAR(DT, 'J'), 7) + 1)=6 OR (MOD(TO_CHAR(DT, 'J'), 7) + 1)=7 THEN 0 ELSE 1 END AS ISWORK
                FROM(
                  SELECT(TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + @"-12-31', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd')
                )
                WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
            ) a
            LEFT JOIN hrdbuser.ST_HOLIDAYOFFICIAL b ON TO_NUMBER(TO_CHAR(a.DT, 'MM'))=b.HOLMONTH AND TO_NUMBER(TO_CHAR(a.DT, 'DD'))=b.HOLDAY
        ) a 
        LEFT JOIN hrdbuser.ST_HOLIDAYUNOFFICIAL b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
    ) a
    LEFT JOIN hrdbuser.ST_HOLIDAYISWORK b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
), TMP_CHULUUDAYF3 as (
    SELECT a.ID, COUNT(a.DT) as DAYCNT
    FROM (
        SELECT a.ID, b.DT
        FROM ST_CHULUUDAYF3 a
        INNER JOIN ST_STBR c ON a.STAFFS_ID=c.STAFFS_ID AND c.ISACTIVE=1
        INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
        INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
        INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID,
        (
            SELECT(TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd')
        ) b
        WHERE d.ACTIVE=1 AND TO_CHAR(TO_DATE(a.BEGINDT, 'YYYY-MM-DD'),'YYYY')=" + year + strBranch + strReason + strIsSalary + @" AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
    ) a
    INNER JOIN TMP_DAYLIST b ON a.DT=b.DT AND b.ISWORK=1
    GROUP BY a.ID
)
SELECT 
    a1.ID
    , a.STAFFS_ID
    , CASE WHEN e.ID<>e.FATHER_ID THEN e2.INITNAME||'-'||e.INITNAME ELSE e.INITNAME END as BRANCH_INITNAME
    , f.NAME as POS_NAME
    , UPPER(SUBSTR(b.LNAME,0,1))||LOWER(substr(b.LNAME, instr(b.LNAME, 'K') + 2)) as LNAME
    , UPPER(b.FNAME) as FNAME
    , b.REGNO
    , CASE WHEN b.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
    , a.BEGINDT
    , a.ENDDT
    , a1.DAYCNT
    , g.NAME as CHULUUREASON_NAME
    , CASE WHEN a.ISSALARY=1 THEN 'Цалинтай' ELSE 'Цалингүй' END AS ISSALARY
FROM TMP_CHULUUDAYF3 a1 
INNER JOIN ST_CHULUUDAYF3 a ON a1.ID=a.ID
INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID
INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID
LEFT JOIN STN_POS f ON c.POS_ID=f.ID
LEFT JOIN STN_CHULUUREASON g ON a.CHULUUREASON_ID=g.ID
ORDER BY a.BEGINDT ASC, a.ENDDT ASC, e.SORT ASC, f.SORT ASC, b.FNAME ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtChuluuSickTab1Table(string year, List<string> branch, List<string> type)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strType = string.Empty;
            //branch
            if (branch.Count == 1)
            {
                if (branch[0] == "") strBranch = "";
                else strBranch = " AND (e.ID = " + branch[0] + " OR e.FATHER_ID = " + branch[0] + ")";
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < branch.Count; i++)
                {
                    if (i != 0) strBranch += " OR";
                    strBranch += " (e.ID = " + branch[i] + " OR e.FATHER_ID = " + branch[i] + ")";
                }
                strBranch += ")";
            }
            //type
            if (type.Count == 1)
            {
                if (type[0] == "") strType = "";
                else strType = " AND a.CHULUUREASON_ID = " + type[0];
            }
            else
            {
                strType += " AND (";
                for (int i = 0; i < type.Count; i++)
                {
                    if (i != 0) strType += " OR";
                    strType += " a.CHULUUSICKTYPE_ID = " + type[i];
                }
                strType += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"WITH TMP_DAYLIST as (
    SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 1 ELSE a.ISWORK END as ISWORK
    FROM (
        SELECT a.DT, CASE WHEN b.HOLDATE IS NOT NULL THEN 0 ELSE a.ISWORK END as ISWORK
        FROM (
            SELECT a.DT, CASE WHEN b.HOLMONTH IS NOT NULL AND b.HOLDAY IS NOT NULL THEN 0 ELSE a.ISWORK END AS ISWORK
            FROM (
                SELECT DT, CASE WHEN (MOD(TO_CHAR(DT, 'J'), 7) + 1)=6 OR (MOD(TO_CHAR(DT, 'J'), 7) + 1)=7 THEN 0 ELSE 1 END AS ISWORK
                FROM(
                  SELECT(TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
                  FROM DUAL
                  CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + @"-12-31', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd')
                )
                WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5, 6, 7)
            ) a
            LEFT JOIN hrdbuser.ST_HOLIDAYOFFICIAL b ON TO_NUMBER(TO_CHAR(a.DT, 'MM'))=b.HOLMONTH AND TO_NUMBER(TO_CHAR(a.DT, 'DD'))=b.HOLDAY
        ) a 
        LEFT JOIN hrdbuser.ST_HOLIDAYUNOFFICIAL b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
    ) a
    LEFT JOIN hrdbuser.ST_HOLIDAYISWORK b ON TO_CHAR(a.DT, 'YYYY-MM-DD')=b.HOLDATE
), TMP_CHULUUSICK as (
    SELECT a.ID, COUNT(a.DT) as DAYCNT
    FROM (
        SELECT a.ID, b.DT
        FROM ST_CHULUUSICK a
        INNER JOIN ST_STBR c ON a.STAFFS_ID=c.STAFFS_ID AND c.ISACTIVE=1
        INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
        INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
        INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID,
        (
            SELECT(TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
            FROM DUAL
            CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + year + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + year + @"-01-01', 'yyyy-mm-dd')
        ) b
        WHERE d.ACTIVE=1 AND TO_CHAR(TO_DATE(a.BEGINDT, 'YYYY-MM-DD'),'YYYY')=" + year + strBranch + strType + @" AND b.DT BETWEEN TO_DATE(a.BEGINDT, 'YYYY-MM-DD') AND TO_DATE(a.ENDDT, 'YYYY-MM-DD')
    ) a
    INNER JOIN TMP_DAYLIST b ON a.DT=b.DT AND b.ISWORK=1
    GROUP BY a.ID
)
SELECT 
    a1.ID
    , a.STAFFS_ID
    , CASE WHEN e.ID<>e.FATHER_ID THEN e2.INITNAME||'-'||e.INITNAME ELSE e.INITNAME END as BRANCH_INITNAME
    , f.NAME as POS_NAME
    , UPPER(SUBSTR(b.LNAME,0,1))||LOWER(substr(b.LNAME, instr(b.LNAME, 'K') + 2)) as LNAME
    , UPPER(b.FNAME) as FNAME
    , b.REGNO
    , CASE WHEN b.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
    , a.BEGINDT
    , a.ENDDT
    , a1.DAYCNT
    , g.NAME as CHULUUSICKTYPE_NAME
FROM TMP_CHULUUSICK a1 
INNER JOIN ST_CHULUUSICK a ON a1.ID=a.ID
INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID
INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
INNER JOIN STN_MOVE d ON c.MOVE_ID=d.ID 
INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID
INNER JOIN ST_BRANCH e2 ON e.FATHER_ID = e2.ID
LEFT JOIN STN_POS f ON c.POS_ID=f.ID
LEFT JOIN STN_CHULUUSICKTYPE g ON a.CHULUUSICKTYPE_ID=g.ID
ORDER BY a.BEGINDT ASC, a.ENDDT ASC, e.SORT ASC, f.SORT ASC, b.FNAME ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtInventoryListWithQRCode(List<string> accounttype) {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CMain mainClass = new CMain();
            string strAccountType = string.Empty;
            //accounttype
            if (accounttype.Count == 1)
            {
                if (accounttype[0] == "") strAccountType = "";
                else strAccountType = " WHERE ACCOUNT_CODE = '" + accounttype[0] + "'";
            }
            else
            {
                strAccountType += " WHERE (";
                for (int i = 0; i < accounttype.Count; i++)
                {
                    if (i != 0) strAccountType += " OR";
                    strAccountType += " ACCOUNT_CODE = " + accounttype[i];
                }
                strAccountType += ")";
            }
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
    //            string strQry = @"SELECT INV_ID, ACCOUNT_CODE, ACCOUNT_NAME, INV_CODE, INV_NAME, INV_UNIT, PRICE, SUM(END_QUANT) as END_QUANT, SUM(END_TOTAL) as END_TOTAL
    //FROM I_INVENTORY_BALANCE
    //WHERE ORG_ID<>0 AND ORG_ID is not null" + strAccountType + @"
    //GROUP BY INV_ID, ACCOUNT_CODE, ACCOUNT_NAME, INV_CODE, INV_NAME, INV_UNIT, PRICE";
    //            DataSet ds = myObj.OleDBExecuteDataSet(strQry);
                string strQry = @"SELECT INV_ID, ACCOUNT_CODE, ACCOUNT_NAME, INV_CODE, INV_NAME, INV_UNIT, PRICE, END_QUANT, END_TOTAL
    FROM ST_INVENTORYLIST" + strAccountType + @"
    ORDER BY INV_CODE ASC, INV_ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ds.Tables[0].Rows[i]["ACCOUNT_NAME"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["ACCOUNT_NAME"].ToString());
                    ds.Tables[0].Rows[i]["INV_NAME"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_NAME"].ToString());
                    ds.Tables[0].Rows[i]["INV_UNIT"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_UNIT"].ToString());
                }
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
            }
            catch (cs.HRMISException ex)
            {
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Acolous системтэй холбогдож чадсангүй");
            }
            catch (Exception ex)
            {
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Acolous системтэй холбогдож чадсангүй");
            }
        }
        public string RprtInventoryListStaff(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CMain mainClass = new CMain();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = string.Empty, strRegNo = string.Empty;
                DataSet ds = null;
                strQry = "SELECT REGNO FROM ST_STAFFS WHERE ID = " + staffid;
                ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count > 0) {
                    strRegNo = ds.Tables[0].Rows[0]["REGNO"].ToString();
                    //                    strQry = @"SELECT a.INV_CODE, a.INV_NAME, a.END_QUANT, a.PRICE, a.END_TOTAL, a.INV_TYPE, a.INV_UNIT
                    //FROM I_INVENTORY_BALANCE a
                    //INNER JOIN C_ORGANIZATION b ON a.ORG_ID=b.org_id
                    //WHERE b.ORG_TYPE=1 AND b.REGISTER_NUMBER = _none'" + mainClass.Iso8859_To_Win1251(strRegNo) + @"'
                    //ORDER BY a.INV_NAME ASC";
                    //                    ds.Clear();
                    //                    ds = myObj.OleDBExecuteDataSet(strQry);
                    strQry = @"SELECT INV_CODE, INV_NAME, END_QUANT, PRICE, END_TOTAL, INV_TYPE, INV_UNIT
FROM ST_STAFFINVENTORY 
WHERE REGNO = '" + mainClass.Iso8859_To_Win1251(strRegNo) + @"'
ORDER BY INV_NAME ASC";
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet(strQry);
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        ds.Tables[0].Rows[i]["INV_NAME"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_NAME"].ToString());
                        ds.Tables[0].Rows[i]["INV_UNIT"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_UNIT"].ToString());
                    }
                    return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "HRMIS системээс ажилтны мэдээлэл олдсонгүй");
            }
            catch (cs.HRMISException ex)
            {
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Acolous системтэй холбогдож чадсангүй");
            }
            catch (Exception ex)
            {
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Acolous системтэй холбогдож чадсангүй");
            }
        }
        public string RprtInventoryCountedData(string intervalid)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strAccountType = string.Empty;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "SELECT INVENTORY_INV_ID, INVENTORY_PRICE, COUNT(ID) as CNT FROM ST_INVENTORYCOUNT WHERE INVENTORYINTERVAL_ID = "+ intervalid + " GROUP BY INVENTORY_INV_ID, INVENTORY_PRICE";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtStaffSalaryData(string pYear, string pStaffId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strAccountType = string.Empty;
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                CMain mainClass = new CMain();
                string strQry = "SELECT REGNO FROM ST_STAFFS WHERE ID="+ pStaffId;
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                string strRegNo = ds.Tables[0].Rows[0]["REGNO"].ToString();
                strQry = @"SELECT MONTH_VALUE, WORK_DAY, TSALIN, BUILD_TSALIN, B_TOTAL, A_TOTAL, N_TOTAL
	, TOTAL_A1, TOTAL_A2, TOTAL_A3, TOTAL_A4, TOTAL_A5, TOTAL_A6, TOTAL_A7, TOTAL_A8, TOTAL_A9, TOTAL_A10, TOTAL_A11, TOTAL_A12, TOTAL_A13, TOTAL_A14, TOTAL_A15, TOTAL_A16, TOTAL_A17, TOTAL_A18, TOTAL_A19, TOTAL_A20, TOTAL_A21, TOTAL_A22, TOTAL_A23, TOTAL_A24, TOTAL_A25, TOTAL_A26, TOTAL_A27, TOTAL_A28, TOTAL_A29, TOTAL_A30, TOTAL_A31, TOTAL_A32, TOTAL_A33, TOTAL_A34, TOTAL_A35
    , TOTAL_L1, TOTAL_L2, TOTAL_L3, TOTAL_L4, TOTAL_L5, TOTAL_L6, TOTAL_L7, TOTAL_L8, TOTAL_L9, TOTAL_L10, TOTAL_L11, TOTAL_L12, TOTAL_L13, TOTAL_L14, TOTAL_L15, TOTAL_L16, TOTAL_L17, TOTAL_L18, TOTAL_L19, TOTAL_L20, TOTAL_L21, TOTAL_L22, TOTAL_L23, TOTAL_L24, TOTAL_L25, TOTAL_L26, TOTAL_L27, TOTAL_L28, TOTAL_L29, TOTAL_L30, TOTAL_L31, TOTAL_L32, TOTAL_L33, TOTAL_L34, TOTAL_L35
    , SUM_TSALIN, FIRST_LESS, LESS_TSALIN, SUB_TSALIN, END_TSALIN FROM ST_STAFFSALARY WHERE YEAR_VALUE=" + pYear + @" AND REGNO ='" + mainClass.Iso8859_To_Win1251(strRegNo) + @"' ORDER BY MONTH_VALUE";
                ds.Clear();
                ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtInventoryCountTab2Table(List<string> pBranch, List<string> pStaff, string pInterval)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strStaff = string.Empty;
            //branch
            if (pBranch.Count == 1)
            {
                if (pBranch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (e.ID = " + pBranch[0] + " OR e.FATHER_ID = " + pBranch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < pBranch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (e.ID = " + pBranch[i] + " OR e.FATHER_ID = " + pBranch[i] + ")";
                }
                strBranch += ")";
            }
            //staff
            if (pStaff.Count == 1)
            {
                if (pStaff[0] == "") strStaff = "";
                else
                {
                    strStaff = " AND (a.STAFFS_ID = " + pStaff[0] + ")";
                }
            }
            else
            {
                strStaff += " AND (";
                for (int i = 0; i < pStaff.Count; i++)
                {
                    if (i != 0)
                    {
                        strStaff += " OR";
                    }
                    strStaff += " (a.STAFFS_ID = " + pStaff[i] + ")";
                }
                strStaff += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT 
    a.ID
    , a.STAFFS_ID
    , CASE WHEN e.ID<>e.FATHER_ID THEN f.INITNAME||'-'||e.INITNAME ELSE e.INITNAME END as BRANCH_INITNAME
    , j.""NAME"" as POS_NAME
    , UPPER(SUBSTR(b.LNAME, 0, 1)) || LOWER(substr(b.LNAME, instr(b.LNAME, 'K') + 2)) as LNAME
    , UPPER(b.FNAME) as FNAME
    , CASE WHEN b.GENDER = 1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
    , a.INVENTORY_INV_ID
    , a.INVENTORY_INV_CODE
    , a.INVENTORY_INV_NAME
    , a.INVENTORY_INV_UNIT
    , a.INVENTORY_PRICE
    , CASE WHEN i.INV_ID IS NOT NULL THEN 'Тийм' ELSE 'Үгүй' END AS ISOWN
    , a.""DESC""
    , CASE WHEN a.FROM_USERID IS NOT NULL THEN CASE WHEN e1.ID<> e1.FATHER_ID THEN TO_CHAR(f1.INITNAME || '-' || e1.INITNAME) ELSE TO_CHAR(e1.INITNAME) END || ' - ' || TO_CHAR(UPPER(SUBSTR(b1.LNAME, 0, 1)) || '.' || UPPER(b1.FNAME)) ELSE null END AS FROM_USERINFO
               FROM ST_INVENTORYCOUNT a
INNER JOIN ST_STAFFS b ON a.STAFFS_ID = b.ID
INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID AND c.ISACTIVE = 1
INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID AND c.ISACTIVE = 1
INNER JOIN ST_BRANCH f ON e.FATHER_ID = f.ID
LEFT JOIN STN_POS j ON c.POS_ID = j.ID
LEFT JOIN ST_STAFFINVENTORY i ON a.STAFFS_ID = i.STAFFS_ID AND a.INVENTORY_INV_ID = i.INV_ID AND a.INVENTORY_PRICE = i.PRICE
LEFT JOIN ST_STAFFS b1 ON a.FROM_USERID = b1.ID
LEFT JOIN ST_STBR c1 ON b1.ID = c1.STAFFS_ID AND c1.ISACTIVE = 1
LEFT JOIN STN_MOVE d1 ON c1.MOVE_ID = d1.ID AND d1.ACTIVE = 1
LEFT JOIN ST_BRANCH e1 ON c1.BRANCH_ID = e1.ID AND c1.ISACTIVE = 1
LEFT JOIN ST_BRANCH f1 ON e1.FATHER_ID = f1.ID
LEFT JOIN STN_POS j1 ON c1.POS_ID = j1.ID
WHERE d.ACTIVE = 1 AND a.INVENTORYINTERVAL_ID=" + pInterval + strBranch + strStaff + @"
ORDER BY e.""SORT"" ASC, j.""SORT"" ASC, b.FNAME ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string RprtInventoryCountTab3Table(List<string> pBranch, List<string> pStaff, string pInterval)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strBranch = string.Empty;
            string strStaff = string.Empty;
            //branch
            if (pBranch.Count == 1)
            {
                if (pBranch[0] == "") strBranch = "";
                else
                {
                    strBranch = " AND (e.ID = " + pBranch[0] + " OR e.FATHER_ID = " + pBranch[0] + ")";
                }
            }
            else
            {
                strBranch += " AND (";
                for (int i = 0; i < pBranch.Count; i++)
                {
                    if (i != 0)
                    {
                        strBranch += " OR";
                    }
                    strBranch += " (e.ID = " + pBranch[i] + " OR e.FATHER_ID = " + pBranch[i] + ")";
                }
                strBranch += ")";
            }
            //staff
            if (pStaff.Count == 1)
            {
                if (pStaff[0] == "") strStaff = "";
                else
                {
                    strStaff = " AND (a.STAFFS_ID = " + pStaff[0] + ")";
                }
            }
            else
            {
                strStaff += " AND (";
                for (int i = 0; i < pStaff.Count; i++)
                {
                    if (i != 0)
                    {
                        strStaff += " OR";
                    }
                    strStaff += " (a.STAFFS_ID = " + pStaff[i] + ")";
                }
                strStaff += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT 
    a.ID
    , a.STAFFS_ID
    , CASE WHEN e.ID<>e.FATHER_ID THEN f.INITNAME||'-'||e.INITNAME ELSE e.INITNAME END as BRANCH_INITNAME
    , j.""NAME"" as POS_NAME
    , UPPER(SUBSTR(b.LNAME, 0, 1)) || LOWER(substr(b.LNAME, instr(b.LNAME, 'K') + 2)) as LNAME
    , UPPER(b.FNAME) as FNAME
    , CASE WHEN b.GENDER = 1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END AS GENDER
    , a.INVENTORY_INV_ID
    , i.INV_CODE as INVENTORY_INV_CODE
    , i.INV_NAME as INVENTORY_INV_NAME
    , i.INV_UNIT as INVENTORY_INV_UNIT
    , a.INVENTORY_PRICE
    , a.""DESC""
FROM ST_STAFFINVENTORY_INVDESC a
INNER JOIN ST_STAFFS b ON a.STAFFS_ID = b.ID
INNER JOIN ST_STBR c ON b.ID = c.STAFFS_ID AND c.ISACTIVE = 1
INNER JOIN STN_MOVE d ON c.MOVE_ID = d.ID
INNER JOIN ST_BRANCH e ON c.BRANCH_ID = e.ID AND c.ISACTIVE = 1
INNER JOIN ST_BRANCH f ON e.FATHER_ID = f.ID
LEFT JOIN STN_POS j ON c.POS_ID = j.ID
LEFT JOIN ST_INVENTORYLIST i ON a.INVENTORY_INV_ID = i.INV_ID AND a.INVENTORY_PRICE = i.PRICE
WHERE d.ACTIVE = 1 AND a.INVENTORYINTERVAL_ID=" + pInterval + strBranch + strStaff + @"
ORDER BY e.""SORT"" ASC, j.""SORT"" ASC, b.FNAME ASC, i.INV_CODE ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        //        //*****salarysettings.aspx*****//
        //        public string SalarysettingsTab1Table(string rankpostype)
        //        {
        //            ModifyDB myObj = new ModifyDB();
        //            CJsonResponse jsonResClass = new CJsonResponse();
        //            GetTableData myObjGetTableData = new GetTableData();
        //            string strRankpostype = string.Empty;
        //            //rankpostype
        //            if (rankpostype == "") rankpostype = "";
        //            else
        //            {
        //                strRankpostype = " AND (a.RANKPOSTYPE_ID = '" + rankpostype + "')";
        //            }

        //            try
        //            {
        //                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
        //                string strQry = "";
        //                strQry = @"SELECT ROWNUM as ROWNO, a.* 
        //FROM (
        //    SELECT 
        //        a.ID
        //        , a.NAME
        //        , b.NAME as RANKPOSTYPE_NAME
        //        , c.NAME as RANKPOSDEGREE_NAME
        //        , d.NAME as RANKPOSCLASS_NAME
        //        , a.BASICSALARY
        //    FROM ST_RANK a
        //    LEFT JOIN STN_RANKPOSTYPE b ON a.RANKPOSTYPE_ID=b.ID
        //    LEFT JOIN STN_RANKPOSDEGREE c ON a.RANKPOSDEGREE_ID=c.ID
        //    LEFT JOIN STN_RANKPOSCLASS d ON a.RANKPOSCLASS_ID=d.ID
        //    WHERE 1=1"+ strRankpostype + @"
        //    ORDER BY a.RANKPOSTYPE_ID ASC, a.SORT ASC
        //) a";
        //                DataSet ds = myObj.OracleExecuteDataSet(strQry);
        //                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
        //            }
        //            catch (cs.HRMISException ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //            catch (Exception ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //        }
        //        public string SalarysettingsTab2Table(string coltype)
        //        {
        //            ModifyDB myObj = new ModifyDB();
        //            CJsonResponse jsonResClass = new CJsonResponse();
        //            GetTableData myObjGetTableData = new GetTableData();
        //            string strColtype = string.Empty;
        //            //rankpostype
        //            if (coltype == "") strColtype = "";
        //            else
        //            {
        //                strColtype = " AND (a.COLTYPE_ID = '" + coltype + "')";
        //            }

        //            try
        //            {
        //                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
        //                string strQry = "";
        //                strQry = @"SELECT ROWNUM as ROWNO, a.* 
        //FROM (
        //    SELECT 
        //        a.ID
        //        , a.COLNAME
        //        , a.NAME
        //        , a.CALCULATE
        //        , a.ISACTIVE
        //        , b.SALARYCOL_REL_IDS
        //    FROM ST_SALARYCOL a
        //    LEFT JOIN ( 
        //        SELECT SALARYCOL_ID, RTRIM(xmlagg (xmlelement (e, SALARYCOL_REL_ID || ',')).extract('//text()'), ',') as SALARYCOL_REL_IDS FROM ST_SALARYCOL_REL GROUP BY SALARYCOL_ID
        //    ) b ON a.ID=b.SALARYCOL_ID
        //    WHERE 1=1"+ strColtype + @"
        //    ORDER BY a.COLNAME ASC
        //) a";
        //                DataSet ds = myObj.OracleExecuteDataSet(strQry);
        //                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
        //            }
        //            catch (cs.HRMISException ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //            catch (Exception ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //        }
        //        public string SalarysettingsSaveBasicSalary(List<RankBasicSalary> pRankList)
        //        {
        //            ModifyDB myObj = new ModifyDB();
        //            CJsonResponse jsonResClass = new CJsonResponse();
        //            GetTableData myObjGetTableData = new GetTableData();
        //            try
        //            {
        //                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
        //                if (pRankList.Count > 0) {
        //                    string strQry = "";
        //                    strQry = @"BEGIN 
        //";
        //                    for (int i = 0; i < pRankList.Count; i++)
        //                    {
        //                        strQry += @"UPDATE ST_RANK SET BASICSALARY = " + pRankList[i].pBasicSalary + @" WHERE ID = '" + pRankList[i].pRankId + @"'; 
        //";
        //                    }
        //                    strQry += "END;";
        //                    myObj.OracleExecuteNonQuery(strQry);
        //                    return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
        //                }
        //                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
        //            }
        //            catch (cs.HRMISException ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //            catch (Exception ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //        }
        //        public string SaveSalaryCol(string pId, string pColType, string pColName, string pCalculate, string pName, string pIsActive)
        //        {
        //            ModifyDB myObj = new ModifyDB();
        //            CJsonResponse jsonResClass = new CJsonResponse();
        //            GetTableData myObjGetTableData = new GetTableData();
        //            CSession sessionClass = new CSession();
        //            try
        //            {
        //                string strQry = "";
        //                if (pId != null && pId != "")
        //                {
        //                    strQry = @"UPDATE ST_SALARYCOL SET NAME='" + pName + @"', CALCULATE='" + pCalculate + @"', ISACTIVE=" + pIsActive + @", UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID = " + pId;
        //                }
        //                else
        //                {
        //                    strQry = @"INSERT INTO ST_SALARYCOL (ID, COLTYPE_ID, COLNAME, NAME, CALCULATE, ISACTIVE, CREATED_STAFFID, CREATED_DATE) 
        //VALUES (TBLLASTID('ST_SALARYCOL'), " + pColType + @", (SELECT '$'||CASE WHEN " + pColType + @" = 1 THEN 'I' ELSE 'O' END||TO_CHAR((NVL(TO_NUMBER(SUBSTR(SUBSTR(REPLACE(MAX(COLNAME),'$'), LENGTH(REPLACE(MAX(COLNAME),'$'))), LENGTH(SUBSTR(REPLACE(MAX(COLNAME),'$'), LENGTH(REPLACE(MAX(COLNAME),'$')))))),0)+1))||'$' as COLNAME FROM ST_SALARYCOL WHERE COLTYPE_ID = " + pColType + @"), '" + pName + @"', '" + pCalculate + @"', " + pIsActive + @", " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
        //                }
        //                myObj.OracleExecuteNonQuery(strQry);
        //                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
        //            }
        //            catch (cs.HRMISException ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //            catch (Exception ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //        }
        //        public string DeleteSalaryCol(string pId)
        //        {
        //            ModifyDB myObj = new ModifyDB();
        //            CJsonResponse jsonResClass = new CJsonResponse();
        //            GetTableData myObjGetTableData = new GetTableData();
        //            CSession sessionClass = new CSession();
        //            try
        //            {
        //                string strQry = "";
        //                if (pId != null && pId != "")
        //                {
        //                    strQry = "DELETE FROM ST_SALARYCOL WHERE ID = " + pId;
        //                    myObj.OracleExecuteNonQuery(strQry);
        //                    return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
        //                }
        //                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт!");
        //            }
        //            catch (cs.HRMISException ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //            catch (Exception ex)
        //            {
        //                myObjGetTableData.exeptionMethod(ex);
        //                throw ex;
        //            }
        //        }

        //*****inventory.aspx*****//
        public string InventoryIntervalTab1Table(string isactive)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            string strIsActive = string.Empty;
            //rankpostype
            if (isactive == "") strIsActive = "";
            else strIsActive = " WHERE ISACTIVE = " + isactive;
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                strQry = @"SELECT ID, NAME, ISACTIVE FROM ST_INVENTORYINTERVAL"+ strIsActive + @" ORDER BY ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string SaveInventoryIntervalData(string pId, string pName, string pIsActive)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = @"UPDATE ST_INVENTORYINTERVAL SET NAME='" + pName + @"', ISACTIVE=" + pIsActive + @", UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID = " + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_INVENTORYINTERVAL (ID, NAME, ISACTIVE, CREATED_STAFFID, CREATED_DATE) VALUES (TBLLASTID('ST_INVENTORYINTERVAL'), '" + pName + @"', " + pIsActive + @", " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string DeleteInventoryIntervalData(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                if (pId != null && pId != "") {
                    int value;
                    if (int.TryParse(pId, out value))
                    {
                        strQry = "SELECT COUNT(1) as CNT FROM ST_INVENTORYCOUNT WHERE INVENTORYINTERVAL_ID = " + pId;
                        DataSet ds = myObj.OracleExecuteDataSet(strQry);
                        if (Int32.Parse(ds.Tables[0].Rows[0]["CNT"].ToString()) > 0) return jsonResClass.JsonResponse(intJsonStatusFailed, "Тооллогын бүртгэлд хамааралтай эд хөрөнгө тоологдсон тул устгах боломжгүй байна!");
                        else {
                            strQry = @"DELETE FROM ST_INVENTORYINTERVAL WHERE ID=" + pId;
                            myObj.OracleExecuteNonQuery(strQry);
                            return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                        }
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
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
        public string GetStaffListWithBranchPos(List<string> branch) {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CMain MainClass = new CMain();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", MainClass.getStaffsWithBranchPos(branch, "Сонго..."));
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
        public string GetInventoryData(string invid, string price)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (invid != "" && invid != null && price != "" && price != null) {
                    //string strQry = "SELECT INV_ID, INV_CODE, INV_NAME, INV_UNIT, PRICE, SUM(END_QUANT) as END_QUANT, SUM(END_TOTAL) as END_TOTAL FROM I_INVENTORY_BALANCE WHERE ORG_ID<>0 AND ORG_ID is not null AND INV_ID=" + invid + " AND PRICE=" + price + " GROUP BY INV_ID, INV_CODE, INV_NAME, INV_UNIT, PRICE";
                    //DataSet ds = myObj.OleDBExecuteDataSet(strQry);
                    string strQry = "SELECT INV_ID, INV_CODE, INV_NAME, INV_UNIT, PRICE, END_QUANT, END_TOTAL FROM ST_INVENTORYLIST WHERE INV_ID=" + invid + " AND PRICE=" + price;
                    DataSet ds = myObj.OracleExecuteDataSet(strQry);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        CMain mainClass = new CMain();
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            ds.Tables[0].Rows[i]["INV_NAME"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_NAME"].ToString());
                            ds.Tables[0].Rows[i]["INV_UNIT"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_UNIT"].ToString());
                        }
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Уншуулсан хөрөнгө олдсонгүй! Тухайн хөрөнгө ямар нэгэн эд хариуцагч буюу ажилтан дээр оноогдсон актлагдаагүй хөрөнгө байх ёстой.");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин хандана уу.");
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Acolous системтэй холбогдож чадсангүй.");
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Acolous системтэй холбогдож чадсангүй.");
            }
        }
        public string SaveInventoryCountData(string pInvIntervalId, string pStaffsId, string pInvId, string pInvCode, string pInvName, string pInvUnit, string pInvPrice, string pFromUserId, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                string strPDesc = "null", strPFromUserId = "null";
                if (pInvIntervalId != null && pInvIntervalId != "" && pStaffsId != null && pStaffsId != "" && pInvId != null && pInvId != "" && pInvPrice != null && pInvPrice != "")
                {
                    if (pDesc != "" && pDesc != null) strPDesc = "'"+ pDesc + "'";
                    if (pFromUserId != "" && pFromUserId != null) strPFromUserId = pFromUserId;
                    strQry = @"INSERT INTO ST_INVENTORYCOUNT (ID, INVENTORYINTERVAL_ID, STAFFS_ID, INVENTORY_INV_ID, INVENTORY_PRICE, INVENTORY_INV_CODE, INVENTORY_INV_NAME, INVENTORY_INV_UNIT, CREATED_STAFFID, CREATED_DATE, FROM_USERID, ""DESC"") VALUES (TBLLASTID('ST_INVENTORYCOUNT'), " + pInvIntervalId + ", " + pStaffsId + ", " + pInvId + ", " + pInvPrice + ", '" + pInvCode + "', '" + pInvName + "' ,'" + pInvUnit + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE, " + strPFromUserId + ", " + strPDesc + ")";
                    myObj.OracleExecuteNonQuery(strQry);
                    return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин хандан уу.");
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
        public string GetCountedInventoryCount(string pInvIntervalId, string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pInvIntervalId != "" && pInvIntervalId != null && pStaffsId != "" && pStaffsId != null)
                {
                    string strQry = "SELECT COUNT(1) as CNT FROM ST_INVENTORYCOUNT WHERE INVENTORYINTERVAL_ID = "+ pInvIntervalId + " AND STAFFS_ID = "+ pStaffsId;
                    DataSet ds = myObj.OracleExecuteDataSet(strQry);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, ds.Tables[0].Rows[0]["CNT"].ToString());
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин хандана уу.");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин хандана уу.");
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
        public string IsMyInv(string pStaffId, string pPrice, string pId) {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CMain mainClass = new CMain();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pStaffId != "" && pStaffId != null && pId != "" && pId != null && pPrice != "" && pPrice != null)
                {
                    string strRegNo = string.Empty;
                    string strQry = "SELECT REGNO FROM ST_STAFFS WHERE ID=" + pStaffId;
                    DataSet ds = myObj.OracleExecuteDataSet(strQry);
                    if (ds.Tables[0].Rows.Count > 0) {
                        strRegNo = ds.Tables[0].Rows[0]["REGNO"].ToString();
                        ds.Clear();
                        strQry = "SELECT REGNO FROM ST_STAFFINVENTORY WHERE REGNO = '" + mainClass.Iso8859_To_Win1251(strRegNo) + "' AND INV_ID=" + pId + " AND PRICE=" + pPrice + "";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Бүртгэлтэй ажилтан олдсонгүй!");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин хандана уу.");
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
        public string InventoryStaffCntTab1Table(string pIntervalId) {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                CSession sessionClass = new CSession();
                CMain mainClass = new CMain();
                var userData = sessionClass.getCurrentUserData();
                string strQry = "";
                strQry = @"SELECT 
    a.INV_ID, a.INV_CODE, a.INV_NAME, a.END_QUANT, a.INV_UNIT, a.PRICE, a.END_TOTAL, b.CNT, c.""DESC""
FROM ST_STAFFINVENTORY a 
LEFT JOIN (
    SELECT INVENTORY_INV_ID, INVENTORY_PRICE, COUNT(1) as CNT FROM ST_INVENTORYCOUNT WHERE INVENTORYINTERVAL_ID=" + pIntervalId + " AND STAFFS_ID=" + userData.USR_STAFFID + @" GROUP BY INVENTORY_INV_ID, INVENTORY_PRICE
) b ON a.INV_ID=b.INVENTORY_INV_ID AND a.PRICE=b.INVENTORY_PRICE
LEFT JOIN ST_STAFFINVENTORY_INVDESC c ON a.INV_ID=c.INVENTORY_INV_ID AND a.PRICE=c.INVENTORY_PRICE AND c.INVENTORYINTERVAL_ID = " + pIntervalId + @" AND c.STAFFS_ID = " + userData.USR_STAFFID + @"
WHERE (REGNO = '" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' OR REGNO = '" + userData.USR_REGNO + @"')
ORDER BY a.INV_CODE ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ds.Tables[0].Rows[i]["INV_NAME"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_NAME"].ToString());
                    ds.Tables[0].Rows[i]["INV_UNIT"] = mainClass.Win1251_To_Iso8859(ds.Tables[0].Rows[i]["INV_UNIT"].ToString());
                }
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string SaveInventiryCntStaffDesc(string pId, string pIntervalId, string pStaffId, string pInvId, string pInvPrice, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = @"UPDATE ST_STAFFINVENTORY_INVDESC SET ""DESC""='" + pDesc + @"' UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID = " + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_STAFFINVENTORY_INVDESC (ID, INVENTORYINTERVAL_ID, STAFFS_ID, INVENTORY_INV_ID, INVENTORY_PRICE, ""DESC"", CREATED_STAFFID, CREATED_DATE) 
        VALUES (TBLLASTID('ST_STAFFINVENTORY_INVDESC'), " + pIntervalId + ", " + pStaffId + ", " + pInvId + ", " + pInvPrice + ", '"+ pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + @", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string GetBranchList(string pFirstIndexName)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CMain MainClass = new CMain();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", MainClass.getBranchList(pFirstIndexName));
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

        //*****login.aspx*****//
        public string CheckLogin(string pUsername, string pPass)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["HRMISDBCONN"].ConnectionString);
            OracleCommand cmd;
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataSet ds = null;
            CSession sessionClass = new CSession();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                //DirectoryEntry dirEntry = null;
                //int countEntry = 0;
                //dirEntry = new DirectoryEntry("LDAP://mof.local", pUsername, pPass, AuthenticationTypes.Secure);
                //countEntry = dirEntry.Properties.Count;

                if (con.State == ConnectionState.Closed) con.Open();
                cmd = new OracleCommand();
                cmd.CommandType = CommandType.Text;
                //cmd.CommandText = "SELECT a.ID,a.FINGERID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE c.ACTIVE=1 AND a.DOMAIN_USER='gundsamba_g@mof.gov.mn'";
                cmd.CommandText = @"SELECT 
    a.ID
    , a.DOMAIN_USER
    , a.MNAME
    , a.LNAME
    , a.FNAME
    , b.BRANCH_ID as HELTES_ID
    , d.INITNAME as HELTES_INITNAME
    , d.FATHER_ID as GAZAR_ID
    , e.INITNAME AS GAZAR_INITNAME
    , b.POS_ID
    , f.NAME as POS_NAME
    , b.POSTYPE_ID
    , j.NAME as POSTYPE_NAME
    , k.ROLELISTID
    , a.FINGERID 
    , a.REGNO
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID
LEFT JOIN ST_BRANCH e ON d.FATHER_ID=e.ID
LEFT JOIN STN_POS f ON b.POS_ID=f.ID
LEFT JOIN STN_POSTYPE j ON b.POSTYPE_ID=j.ID
LEFT JOIN (
  SELECT STAFFS_ID, RTRIM(xmlagg (xmlelement (e, ROLE_ID || ',')).extract('//text()'), ',') as ROLELISTID FROM ST_STAFFS_ROLE WHERE STAFFS_ID IN (SELECT ID FROM ST_STAFFS WHERE DOMAIN_USER='" + pUsername.Trim() + @"') GROUP BY STAFFS_ID
) k ON a.ID=k.STAFFS_ID
WHERE 
    c.ACTIVE=1 AND 
    a.DOMAIN_USER='" + pUsername.Trim() + @"'";
                cmd.Connection = con;
                adapter.SelectCommand = cmd;
                ds = new DataSet();
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    throw new cs.HRMISException("Нэвтрэх нэр бүртгэлгүй эсвэл идэвхгүй байна. ТЗУГ-д хандана уу!");
                }
                else
                {
                    List<int> listUserRole = new List<int>();
                    if (ds.Tables[0].Rows[0]["ROLELISTID"].ToString() != "" && ds.Tables[0].Rows[0]["ROLELISTID"].ToString() != null)
                    {
                        string strUserRoleIds = ds.Tables[0].Rows[0]["ROLELISTID"].ToString();
                        if (strUserRoleIds.Split(',').Length > 0) for (int i = 0; i < strUserRoleIds.Split(',').Length; i++) listUserRole.Add(Int32.Parse(strUserRoleIds.Split(',')[i]));
                    }
                    //else throw new cs.HRMISException("Системийн эрх авна уу! ТЗУГ-д хандана уу!");
                    var objUserData = new UserData
                    {
                        USR_STAFFID = Int32.Parse(ds.Tables[0].Rows[0]["ID"].ToString()),
                        USR_DOMAIN = ds.Tables[0].Rows[0]["DOMAIN_USER"].ToString(),
                        USR_ROLEDATA = listUserRole,
                        USR_FNAME = ds.Tables[0].Rows[0]["FNAME"].ToString(),
                        USR_MNAME = ds.Tables[0].Rows[0]["MNAME"].ToString(),
                        USR_LNAME = ds.Tables[0].Rows[0]["FNAME"].ToString(),
                        USR_HELTESID = Int32.Parse(ds.Tables[0].Rows[0]["HELTES_ID"].ToString()),
                        USR_HELTESINITNAME = ds.Tables[0].Rows[0]["HELTES_INITNAME"].ToString(),
                        USR_GAZARID = Int32.Parse(ds.Tables[0].Rows[0]["GAZAR_ID"].ToString()),
                        USR_GAZARINITNAME = ds.Tables[0].Rows[0]["GAZAR_INITNAME"].ToString(),
                        USR_POSID = Int32.Parse(ds.Tables[0].Rows[0]["POS_ID"].ToString()),
                        USR_POSNAME = ds.Tables[0].Rows[0]["POS_NAME"].ToString(),
                        USR_POSTYPENAME = ds.Tables[0].Rows[0]["POSTYPE_NAME"].ToString(),
                        USR_HELTESBOSSID = 0,
                        USR_HELTESBOSSINITNAME = null,
                        USR_GAZARBOSSID = 0,
                        USR_GAZARBOSSINITNAME = null,
                        USR_FINGERID = ds.Tables[0].Rows[0]["FINGERID"].ToString(),
                        USR_REGNO = ds.Tables[0].Rows[0]["REGNO"].ToString()
                    };
                    sessionClass.setUserData(objUserData);
                    HttpContext.Current.Session["HRMIS_UserID"] = ds.Tables[0].Rows[0][0].ToString();
                    HttpContext.Current.Session["HRMIS_finger_id"] = ds.Tables[0].Rows[0][1].ToString();
                    return ds.Tables[0].Rows[0][0].ToString();
                }
                //cmd = new OracleCommand();
                //cmd.CommandType = CommandType.Text;
                //cmd.CommandText = "SELECT COUNT(1) FROM TBL_USER_ROLE WHERE USER_ID=" + stid;
                //cmd.Connection = con;
                //if (cmd.ExecuteScalar().ToString() == "0") throw new cs.LMException("Уг системд эрх аваагүй хэрэглэгч байна");
            }
            catch (DirectoryServicesCOMException ex)
            {
                if (ex.ErrorCode.Equals(-2147023570))
                    throw new cs.HRMISException("Нэвтрэх нэр эсвэл нууц үг буруу байна");
                else
                    throw new cs.HRMISException("Домайнтай холбогдож чадсангүй");
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                throw new cs.HRMISException(ex.Message, ex);
                //throw new cs.HRMISException("Нэвтрэлт амжилтгүй боллоо.", ex);
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        public string SaveStaff(
            string P_ID, 
            string P_NATIONALITY, 
            string P_MNAME, 
            string P_LNAME, 
            string P_FNAME, 
            string P_BDATE, 
            string P_BDIST_ID, 
            string P_BCITY_ID, 
            string P_NAT_ID, 
            string P_EDUTP_ID, 
            string P_SOCPOS_ID, 
            string P_OCCTYPE_ID, 
            string P_OCCNAME, 
            string P_GENDER, 
            string P_REGNO, 
            string P_CITNO, 
            string P_SOCNO, 
            string P_HEALNO, 
            string P_ADDRCITY_ID, 
            string P_ADDRDIST_ID, 
            string P_ADDRESSNAME, 
            string P_TEL, 
            string P_TEL2, 
            string P_EMAIL, 
            string P_IMAGE, 
            string P_DT, 
            string P_BRANCH_ID, 
            string P_POSTYPE_ID, 
            string P_POS_ID, 
            string P_RANK_ID, 
            string P_TUSHAALDATE, 
            string P_TUSHAALNO, 
            string P_MOVE_ID, 
            string P_DESCRIPTION, 
            string P_STAFFID, 
            string P_DOMAIN_USER, 
            string P_RELNAME, 
            string P_RELATION_ID, 
            string P_RELADDRESSNAME, 
            string P_RELTEL, 
            string P_RELTEL2,
            string P_RELEMAIL, 
            string P_FINGERID
        )
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                DataSet ds = null;
                if (P_ID != null && P_ID != "")
                {
                    strQry = "SELECT COUNT(1) as CNT FROM ST_STAFFS a WHERE a.REGNO=N'" + P_REGNO + "' AND a.ID!=" + P_ID;
                    ds = myObj.OracleExecuteDataSet(strQry);
                    if (Int32.Parse(ds.Tables[0].Rows[0]["CNT"].ToString()) > 0) return jsonResClass.JsonResponse(intJsonStatusFailed, P_REGNO + " регистерийн дугаартай хэрэглэгч бүртгэгдсэн байна!");
                    else
                    {
                        ds.Clear();
                        strQry = "SELECT COUNT(1) as CNT FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE c.ACTIVE=1 AND a.DOMAIN_USER='" + P_DOMAIN_USER + "' AND a.ID!=" + P_ID;
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (Int32.Parse(ds.Tables[0].Rows[0]["CNT"].ToString()) > 0) return jsonResClass.JsonResponse(intJsonStatusFailed, P_DOMAIN_USER + " домайн хаягтай идэвхтэй хэрэглэгч бүртгэгдсэн байна!");
                        else
                        {
                            string[] ParamName = new string[43], ParamValue = new string[43];
                            ParamName[0] = "P_ID";
                            ParamName[1] = "P_NATIONALITY";
                            ParamName[2] = "P_MNAME";
                            ParamName[3] = "P_LNAME";
                            ParamName[4] = "P_FNAME";
                            ParamName[5] = "P_BDATE";
                            ParamName[6] = "P_BCITY_ID";
                            ParamName[7] = "P_BDIST_ID";
                            ParamName[8] = "P_NAT_ID";
                            ParamName[9] = "P_EDUTP_ID";
                            ParamName[10] = "P_SOCPOS_ID";
                            ParamName[11] = "P_OCCTYPE_ID";
                            ParamName[12] = "P_OCCNAME";
                            ParamName[13] = "P_GENDER";
                            ParamName[14] = "P_REGNO";
                            ParamName[15] = "P_CITNO";
                            ParamName[16] = "P_SOCNO";
                            ParamName[17] = "P_HEALNO";
                            ParamName[18] = "P_ADDRCITY_ID";
                            ParamName[19] = "P_ADDRDIST_ID";
                            ParamName[20] = "P_ADDRESSNAME";
                            ParamName[21] = "P_TEL";
                            ParamName[22] = "P_TEL2";
                            ParamName[23] = "P_EMAIL";
                            ParamName[24] = "P_IMAGE";
                            ParamName[25] = "P_DT";
                            ParamName[26] = "P_BRANCH_ID";
                            ParamName[27] = "P_POSTYPE_ID";
                            ParamName[28] = "P_POS_ID";
                            ParamName[29] = "P_RANK_ID";
                            ParamName[30] = "P_TUSHAALDATE";
                            ParamName[31] = "P_TUSHAALNO";
                            ParamName[32] = "P_MOVE_ID";
                            ParamName[33] = "P_DESCRIPTION";
                            ParamName[34] = "P_STAFFID";
                            ParamName[35] = "P_DOMAIN_USER";
                            ParamName[36] = "P_RELNAME";
                            ParamName[37] = "P_RELATION_ID";
                            ParamName[38] = "P_RELADDRESSNAME";
                            ParamName[39] = "P_RELTEL";
                            ParamName[40] = "P_RELTEL2";
                            ParamName[41] = "P_RELEMAIL";
                            ParamName[42] = "P_FINGERID";
                            ParamValue[0] = P_ID;
                            ParamValue[1] = P_NATIONALITY;
                            ParamValue[2] = P_MNAME;
                            ParamValue[3] = P_LNAME;
                            ParamValue[4] = P_FNAME;
                            ParamValue[5] = P_BDATE;
                            ParamValue[6] = P_BCITY_ID;
                            ParamValue[7] = P_BDIST_ID;
                            ParamValue[8] = P_NAT_ID;
                            ParamValue[9] = P_EDUTP_ID;
                            ParamValue[10] = P_SOCPOS_ID;
                            ParamValue[11] = P_OCCTYPE_ID;
                            ParamValue[12] = P_OCCNAME;
                            ParamValue[13] = P_GENDER;
                            ParamValue[14] = P_REGNO;
                            ParamValue[15] = P_CITNO;
                            ParamValue[16] = P_SOCNO;
                            ParamValue[17] = P_HEALNO;
                            ParamValue[18] = P_ADDRCITY_ID;
                            ParamValue[19] = P_ADDRDIST_ID;
                            ParamValue[20] = P_ADDRESSNAME;
                            ParamValue[21] = P_TEL;
                            ParamValue[22] = P_TEL2;
                            ParamValue[23] = P_EMAIL;
                            ParamValue[24] = P_IMAGE;
                            ParamValue[25] = P_DT;
                            ParamValue[26] = P_BRANCH_ID;
                            ParamValue[27] = P_POSTYPE_ID;
                            ParamValue[28] = P_POS_ID;
                            ParamValue[29] = P_RANK_ID;
                            ParamValue[30] = P_TUSHAALDATE;
                            ParamValue[31] = P_TUSHAALNO;
                            ParamValue[32] = P_MOVE_ID;
                            ParamValue[33] = P_DESCRIPTION;
                            ParamValue[34] = P_STAFFID;
                            ParamValue[35] = P_DOMAIN_USER;
                            ParamValue[36] = P_RELNAME;
                            ParamValue[37] = P_RELATION_ID;
                            ParamValue[38] = P_RELADDRESSNAME;
                            ParamValue[39] = P_RELTEL;
                            ParamValue[40] = P_RELTEL2;
                            ParamValue[41] = P_RELEMAIL;
                            ParamValue[42] = P_FINGERID;
                            myObj.SP_OracleExecuteNonQuery("STAFF_UPDATE", ParamName, ParamValue);
                        }
                    }
                }
                else
                {
                    strQry = "SELECT COUNT(1) as CNT FROM ST_STAFFS a WHERE a.REGNO=N'"+ P_REGNO + "'";
                    ds = myObj.OracleExecuteDataSet(strQry);
                    if (Int32.Parse(ds.Tables[0].Rows[0]["CNT"].ToString()) > 0) return jsonResClass.JsonResponse(intJsonStatusFailed, P_REGNO + " регистерийн дугаартай хэрэглэгч бүртгэгдсэн байна!");
                    else {
                        ds.Clear();
                        strQry = "SELECT COUNT(1) as CNT FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE c.ACTIVE=1 AND a.DOMAIN_USER='"+ P_DOMAIN_USER + "'";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (Int32.Parse(ds.Tables[0].Rows[0]["CNT"].ToString()) > 0) return jsonResClass.JsonResponse(intJsonStatusFailed, P_DOMAIN_USER + " домайн хаягтай идэвхтэй хэрэглэгч бүртгэгдсэн байна!");
                        else {
                            string[] ParamName = new string[42], ParamValue = new string[42];
                            ParamName[0] = "P_NATIONALITY";
                            ParamName[1] = "P_MNAME";
                            ParamName[2] = "P_LNAME";
                            ParamName[3] = "P_FNAME";
                            ParamName[4] = "P_BDATE";
                            ParamName[5] = "P_BCITY_ID";
                            ParamName[6] = "P_BDIST_ID";
                            ParamName[7] = "P_NAT_ID";
                            ParamName[8] = "P_EDUTP_ID";
                            ParamName[9] = "P_SOCPOS_ID";
                            ParamName[10] = "P_OCCTYPE_ID";
                            ParamName[11] = "P_OCCNAME";
                            ParamName[12] = "P_GENDER";
                            ParamName[13] = "P_REGNO";
                            ParamName[14] = "P_CITNO";
                            ParamName[15] = "P_SOCNO";
                            ParamName[16] = "P_HEALNO";
                            ParamName[17] = "P_ADDRCITY_ID";
                            ParamName[18] = "P_ADDRDIST_ID";
                            ParamName[19] = "P_ADDRESSNAME";
                            ParamName[20] = "P_TEL";
                            ParamName[21] = "P_TEL2";
                            ParamName[22] = "P_EMAIL";
                            ParamName[23] = "P_IMAGE";
                            ParamName[24] = "P_DT";
                            ParamName[25] = "P_BRANCH_ID";
                            ParamName[26] = "P_POSTYPE_ID";
                            ParamName[27] = "P_POS_ID";
                            ParamName[28] = "P_RANK_ID";
                            ParamName[29] = "P_TUSHAALDATE";
                            ParamName[30] = "P_TUSHAALNO";
                            ParamName[31] = "P_MOVE_ID";
                            ParamName[32] = "P_DESCRIPTION";
                            ParamName[33] = "P_STAFFID";
                            ParamName[34] = "P_DOMAIN_USER";
                            ParamName[35] = "P_RELNAME";
                            ParamName[36] = "P_RELATION_ID";
                            ParamName[37] = "P_RELADDRESSNAME";
                            ParamName[38] = "P_RELTEL";
                            ParamName[39] = "P_RELTEL2";
                            ParamName[40] = "P_RELEMAIL";
                            ParamName[41] = "P_FINGERID";
                            ParamValue[0] = P_NATIONALITY;
                            ParamValue[1] = P_MNAME;
                            ParamValue[2] = P_LNAME;
                            ParamValue[3] = P_FNAME;
                            ParamValue[4] = P_BDATE;
                            ParamValue[5] = P_BCITY_ID;
                            ParamValue[6] = P_BDIST_ID;
                            ParamValue[7] = P_NAT_ID;
                            ParamValue[8] = P_EDUTP_ID;
                            ParamValue[9] = P_SOCPOS_ID;
                            ParamValue[10] = P_OCCTYPE_ID;
                            ParamValue[11] = P_OCCNAME;
                            ParamValue[12] = P_GENDER;
                            ParamValue[13] = P_REGNO;
                            ParamValue[14] = P_CITNO;
                            ParamValue[15] = P_SOCNO;
                            ParamValue[16] = P_HEALNO;
                            ParamValue[17] = P_ADDRCITY_ID;
                            ParamValue[18] = P_ADDRDIST_ID;
                            ParamValue[19] = P_ADDRESSNAME;
                            ParamValue[20] = P_TEL;
                            ParamValue[21] = P_TEL2;
                            ParamValue[22] = P_EMAIL;
                            ParamValue[23] = P_IMAGE;
                            ParamValue[24] = P_DT;
                            ParamValue[25] = P_BRANCH_ID;
                            ParamValue[26] = P_POSTYPE_ID;
                            ParamValue[27] = P_POS_ID;
                            ParamValue[28] = P_RANK_ID;
                            ParamValue[29] = P_TUSHAALDATE;
                            ParamValue[30] = P_TUSHAALNO;
                            ParamValue[31] = P_MOVE_ID;
                            ParamValue[32] = P_DESCRIPTION;
                            ParamValue[33] = P_STAFFID;
                            ParamValue[34] = P_DOMAIN_USER;
                            ParamValue[35] = P_RELNAME;
                            ParamValue[36] = P_RELATION_ID;
                            ParamValue[37] = P_RELADDRESSNAME;
                            ParamValue[38] = P_RELTEL;
                            ParamValue[39] = P_RELTEL2;
                            ParamValue[40] = P_RELEMAIL;
                            ParamValue[41] = P_FINGERID;
                            myObj.SP_OracleExecuteNonQuery("STAFF_INSERT", ParamName, ParamValue);
                        }
                    }
                }
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string ListMove(List<string> tp, string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            DataTable dt = null;
            string strTp = "";
            //branch
            if (tp.Count == 1)
            {
                if (tp[0] == "") strTp = "";
                else
                {
                    strTp = " WHERE b.ID = " + tp[0];
                }
            }
            else if(tp.Count > 1)
            {
                strTp += " WHERE b.ID IN (";
                for (int i = 0; i < tp.Count; i++)
                {
                    if (i != 0)
                    {
                        strTp += ",";
                    }
                    strTp += tp[i];
                }
                strTp += ")";
            }

            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strQry = "";
                strQry = @"SELECT b.ID as TYPE_ID, b.NAME as TYPE_NAME, a.ID, a.NAME FROM STN_MOVE a INNER JOIN STN_MOVETYPE b ON a.MOVETYPE_ID=b.ID "+ strTp + " ORDER BY b.NAME ASC, a.NAME ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                dt = ds.Tables[0];
                if (set1stIndexValue != "" && set1stIndexValue != null)
                {
                    DataRow drow = dt.NewRow();
                    drow["NAME"] = set1stIndexValue;
                    dt.Rows.InsertAt(drow, 0);
                }
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", dt);
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
        public string StaffsTable(string pos, string gazar, string heltes, string tp)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                CSession sessionClass = new CSession();
                CMain mainClass = new CMain();
                var userData = sessionClass.getCurrentUserData();
                string strQry = "";
                if (pos != "") pos = " AND b.POS_ID=" + pos;
                if (gazar != "") gazar = " AND c.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND b.BRANCH_ID=" + heltes;
                if (tp != "")
                {
                    if (tp.Split('-')[0] == "1") tp = " AND h.ACTIVE=1";
                    else if (tp.Split('-')[0] == "0") tp = " AND h.MOVETYPE_ID=" + tp.Split('-')[1];
                }
                strQry = @"SELECT a.ID as STAFFS_ID, a.IMAGE, a.REGNO, a.DOMAIN_USER, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME, UPPER(a.FNAME) as FNAME, f.NAME as POS_NAME, CASE WHEN a.GENDER=1 THEN 'Эр' ELSE 'Эм' END as GENDER, g.NAME as POSTYPE_NAME, a.TEL||CASE WHEN TEL is not null THEN ', '||TEL2 END as TEL, CASE WHEN h.ACTIVE=1 AND h.SHOW=1 THEN TO_CHAR(h.NAME) WHEN h.ACTIVE=1 AND h.SHOW=0 THEN 'Идэвхтэй' ELSE REPLACE(REPLACE(TO_CHAR(i.NAME),'өлөөлөх','өлөөлөгдсөн'),'халах','халагдсан') END AS TP, h.COLOR, a.FINGERID, a.MACID 
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID 
INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID 
LEFT JOIN STN_POS f ON b.POS_ID=f.ID 
INNER JOIN STN_POSTYPE g ON b.POSTYPE_ID=g.ID 
INNER JOIN STN_MOVE h ON b.MOVE_ID=h.ID 
INNER JOIN STN_MOVETYPE i ON h.MOVETYPE_ID=i.ID WHERE 1=1" + pos + gazar + heltes + tp + @" 
ORDER BY a.FNAME";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string profileTab1T10Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                CSession sessionClass = new CSession();
                CMain mainClass = new CMain();
                var userData = sessionClass.getCurrentUserData();
                string strQry = "";
                strQry = @"SELECT ID, CERTIFICATENO, SITUATION, ""DESC"" FROM ST_MILITARY WHERE STAFFS_ID="+ pStaffsId + @" ORDER BY ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string SaveProfileTab1T10Datatable1(string pId, string pStaffsId, string pCertificateNo, string pSituation, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = @"UPDATE ST_MILITARY SET CERTIFICATENO='" + pCertificateNo + @"', SITUATION='"+ pSituation + @"', ""DESC""='" + pDesc + @"', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID = " + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_MILITARY (ID, STAFFS_ID, CERTIFICATENO, SITUATION, ""DESC"", CREATED_STAFFID, CREATED_DATE) 
        VALUES (TBLLASTID('ST_MILITARY'), " + pStaffsId + ", '" + pCertificateNo + "', '" + pSituation + "', '" + pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + @", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string DeleteProfileTab1T10Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                if (pId != null && pId != "")
                {
                    int value;
                    if (int.TryParse(pId, out value))
                    {
                        strQry = @"DELETE FROM ST_MILITARY WHERE ID=" + pId;
                        myObj.OracleExecuteNonQuery(strQry);
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
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
        public string profileTab1T11Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                CSession sessionClass = new CSession();
                CMain mainClass = new CMain();
                var userData = sessionClass.getCurrentUserData();
                string strQry = "";
                strQry = @"SELECT
    ID, 
    DT, 
    NAME, 
    ORGDESCRIPTION, 
    TUSHAALDT, 
    TUSHAALNO, 
    GROUND
FROM ST_BONUS 
WHERE STAFFS_ID="+ pStaffsId + @"
ORDER BY DT ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string SaveProfileTab1T11Datatable1(string pId, string pStaffsId, string pDt, string pName, string pOrgdescription, string TushaalNo, string TushaalDt, string pGround)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = @"UPDATE ST_BONUS SET DT='" + pDt + @"', NAME='" + pName + @"', ORGDESCRIPTION='" + pOrgdescription + @"', TUSHAALNO='" + TushaalNo + @"', TUSHAALDT='" + TushaalDt + @"', GROUND='" + pGround + @"', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID = " + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_BONUS (ID, STAFFS_ID, DT, NAME, ORGDESCRIPTION, TUSHAALNO, TUSHAALDT, GROUND, CREATED_STAFFID, CREATED_DATE) 
        VALUES (TBLLASTID('ST_BONUS'), " + pStaffsId + ", '" + pDt + "', '" + pName + "', '" + pOrgdescription + "', '" + TushaalNo + "', '" + TushaalDt + "', '" + pGround + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + @", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string DeleteProfileTab1T11Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                if (pId != null && pId != "")
                {
                    int value;
                    if (int.TryParse(pId, out value))
                    {
                        strQry = @"DELETE FROM ST_BONUS WHERE ID=" + pId;
                        myObj.OracleExecuteNonQuery(strQry);
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
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
        public string profileTab1T12Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                CSession sessionClass = new CSession();
                CMain mainClass = new CMain();
                var userData = sessionClass.getCurrentUserData();
                string strQry = "";
                strQry = @"SELECT 
    a.ID, 
    a.NAME, 
    a.SELFCREATED_TYPE_ID, 
    b.NAME as SELFCREATED_TYPE_NAME, 
    a.DT, 
    a.""DESC"" 
FROM ST_SELFCREATED a
INNER JOIN STN_SELFCREATED_TYPE b ON a.SELFCREATED_TYPE_ID = b.ID
WHERE a.STAFFS_ID = " + pStaffsId + @"
ORDER BY a.ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string DeleteProfileTab1T12Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                if (pId != null && pId != "")
                {
                    int value;
                    if (int.TryParse(pId, out value))
                    {
                        strQry = @"DELETE FROM ST_SELFCREATED WHERE ID=" + pId;
                        myObj.OracleExecuteNonQuery(strQry);
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
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
        public string SaveProfileTab1T12Datatable1(string pId, string pStaffsId, string pName, string pTypeId, string pDt, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = @"UPDATE ST_SELFCREATED SET NAME='" + pName + @"', SELFCREATED_TYPE_ID="+ pTypeId + @", DT='" + pDt + @"', ""DESC""='" + pDesc + @"', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID = " + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_SELFCREATED (ID, STAFFS_ID, NAME, SELFCREATED_TYPE_ID, DT, ""DESC"", CREATED_STAFFID, CREATED_DATE) 
        VALUES (TBLLASTID('ST_SELFCREATED'), " + pStaffsId + ", '" + pName + "', " + pTypeId + ", '" + pDt + "', '" + pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + @", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string profileTab3T2Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                strQry = @"SELECT ID, TBL, TITLE, DT, TUSHAALNAME, TUSHAALNO, CHANGEDTUSHAALDATE, CHANGEDTUSHAALNAME, CHANGEDTUSHAALNO, CHANGEDREASON
FROM(
  SELECT
    a.ID
    , 'ST_EXPHISTORY' as TBL
    , TO_CHAR(a.TITLE) as TITLE
    , a.FROMDATE as DT
    , a.FROMTUSHAALNAME as TUSHAALNAME
    , TO_CHAR(a.FROMTUSHAALNO) as TUSHAALNO
    , a.CHANGEDFROMTUSHAALDATE as CHANGEDTUSHAALDATE
    , a.CHANGEDFROMTUSHAALNAME as CHANGEDTUSHAALNAME
    , a.CHANGEDFROMTUSHAALNO as CHANGEDTUSHAALNO
    , a.CHANGEDFROMREASON as CHANGEDREASON
  FROM ST_EXPHISTORY a 
  WHERE a.ORGTYPE_ID=1 AND a.STAFFS_ID = "+ pStaffsId + @" 
  UNION ALL
  SELECT
    a.ID
    , 'ST_STBR' as TBL
    , TO_CHAR(f.NAME) as TITLE
    , a.DT
    , a.TUSHAALNAME
    , TO_CHAR(a.TUSHAALNO) as TUSHAALNO
    , a.CHANGEDTUSHAALDATE
    , a.CHANGEDTUSHAALNAME
    , a.CHANGEDTUSHAALNO
    , a.CHANGEDREASON
  FROM ST_STBR a
  INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
  INNER JOIN ST_BRANCH c ON a.BRANCH_ID = c.ID
  INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID
  INNER JOIN STN_POS f ON a.POS_ID = f.ID
  WHERE b.ACTIVE = 1 AND a.STAFFS_ID = " + pStaffsId + @"
)
ORDER BY DT ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string SaveProfileTab3T2Datatable1(string pId, string pTbl, string pTushaalName, string pChangedTushaalDate, string pChangedTushaalNo, string pChangedTushaalName, string pChangedReason)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    if (pTbl == "ST_EXPHISTORY") {
                        strQry = @"UPDATE " + pTbl + " SET FROMTUSHAALNAME='"+ pTushaalName + "', CHANGEDFROMTUSHAALDATE='" + pChangedTushaalDate + "', CHANGEDFROMTUSHAALNAME='" + pChangedTushaalName + "', CHANGEDFROMTUSHAALNO='" + pChangedTushaalNo + "', CHANGEDFROMREASON='" + pChangedReason + "' WHERE ID=" + pId;
                    }
                    else if (pTbl == "ST_STBR")
                    {
                        strQry = @"UPDATE " + pTbl + " SET TUSHAALNAME='" + pTushaalName + "', CHANGEDTUSHAALDATE='" + pChangedTushaalDate + "', CHANGEDTUSHAALNAME='" + pChangedTushaalName + "', CHANGEDTUSHAALNO='" + pChangedTushaalNo + "', CHANGEDREASON='" + pChangedReason + "' WHERE ID=" + pId;
                    }
                    if (strQry != "") {
                        myObj.OracleExecuteNonQuery(strQry);
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                    }
                }
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт");
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
        public string profileTab3T3Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                strQry = @"SELECT ID, STAFFS_ID, RANKPOSDEGREE_NAME, RANK_NAME, POSDEGREEDTL_NAME, TSOLNAME, DECISIONDATE, CERTIFICATENO, UNEMLEHNO, ISDEL, TBL
FROM (
    SELECT a.ZEREGDEV_ID as ID, a.STAFFS_ID, d.NAME as RANKPOSDEGREE_NAME, e.NAME as RANK_NAME, c.NAME as POSDEGREEDTL_NAME, a.TSOLNAME, b.DT as DECISIONDATE, b.CERTIFICATENO, a.UNEMLEHNO, 0 as ISDEL, 'ST_ZEREGDEV_STAFFS' as TBL
    FROM ST_ZEREGDEV_STAFFS a
    INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID = b.ID
    INNER JOIN STN_POSDEGREEDTL c ON b.POSDEGREEDTL_ID = c.ID
    INNER JOIN STN_RANKPOSDEGREE d ON b.RANKPOSDEGREE_ID = d.ID
    LEFT JOIN ST_RANK e ON a.RANK_ID=e.ID
    WHERE a.STAFFS_ID = " + pStaffsId + @"
    UNION ALL
    SELECT a.ID, a.STAFFS_ID, c.NAME as RANKPOSDEGREE_NAME, e.NAME as RANK_NAME, b.NAME as POSDEGREEDTL_NAME, a.TSOLNAME, a.DECISIONDATE, a.CERTIFICATENO, a.UNEMLEHNO, 1 as ISDEL, 'ST_JOBTITLEDEGREE' as TBL
    FROM ST_JOBTITLEDEGREE a
    INNER JOIN STN_POSDEGREEDTL b ON a.POSDEGREEDTL_ID = b.ID
    INNER JOIN STN_RANKPOSDEGREE c ON a.RANKPOSDEGREE_ID = c.ID
    LEFT JOIN ST_RANK e ON a.RANK_ID=e.ID
    WHERE a.STAFFS_ID = " + pStaffsId + @"
)
ORDER BY DECISIONDATE ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string SaveProfileTab3T3Datatable1(string pId, string pStaffsId, string pTbl, string pRankPosDegree, string pRank, string pPosDegreeDtl, string pTsolName, string pDecisionDate, string pCertificateNo, string pUnemlehNo)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    if (pTbl == "ST_ZEREGDEV_STAFFS")
                    {
                        strQry = @"UPDATE " + pTbl + " SET RANK_ID='" + pRank + "', TSOLNAME='" + pTsolName + "', UNEMLEHNO='" + pUnemlehNo + "' WHERE ZEREGDEV_ID=" + pId + " AND STAFFS_ID=" + pStaffsId;
                    }
                    else if (pTbl == "ST_JOBTITLEDEGREE")
                    {
                        strQry = @"UPDATE " + pTbl + " SET POSDEGREEDTL_ID=" + pPosDegreeDtl + ", RANKPOSDEGREE_ID=" + pRankPosDegree + ", DECISIONDATE='" + pDecisionDate + "', CERTIFICATENO='" + pCertificateNo + "', RANK_ID='" + pRank + "', TSOLNAME='" + pTsolName + "', UNEMLEHNO='" + pUnemlehNo + "', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID=" + pId;
                    }
                }
                else {
                    strQry = @"INSERT INTO ST_JOBTITLEDEGREE (ID, STAFFS_ID, POSDEGREEDTL_ID, RANKPOSDEGREE_ID, DECISIONDATE, CERTIFICATENO, RANK_ID, TSOLNAME, UNEMLEHNO, CREATED_STAFFID, CREATED_DATE) " +
                                "VALUES (TBLLASTID('ST_JOBTITLEDEGREE'), "+ pStaffsId + ", " + pPosDegreeDtl + ", " + pRankPosDegree + ", '" + pDecisionDate + "', '" + pCertificateNo + "', '" + pRank + "', '" + pTsolName + "', '" + pUnemlehNo + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
                }  
                if (strQry != "")
                {
                    myObj.OracleExecuteNonQuery(strQry);
                    return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                }
                return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт");
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
        public string DeleteProfileTab3T3Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                string strQry = "";
                if (pId != null && pId != "")
                {
                    int value;
                    if (int.TryParse(pId, out value))
                    {
                        strQry = @"DELETE FROM ST_JOBTITLEDEGREE WHERE ID=" + pId;
                        myObj.OracleExecuteNonQuery(strQry);
                        return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
                    }
                    else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
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
        public string profileTab3T5Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pStaffsId == null || pStaffsId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт");
                string strQry = @"SELECT ID, STAFFS_ID, DT, ""NAME"", AMT, TUSHAALNAME, TUSHAALNO, TUSHAALDT, ""DESC"" FROM ST_INCENTIVES WHERE STAFFS_ID="+ pStaffsId + @" ORDER BY ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string DeleteProfileTab3T5Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pId == null || pId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                int value;
                if (!int.TryParse(pId, out value)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                string strQry = @"DELETE FROM ST_INCENTIVES WHERE ID=" + pId;
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string SaveProfileTab3T5Datatable1(string pId, string pStaffsId, string pDt, string pName, string pAmt, string pTushaalName, string pTushaalNo, string pTushaalDt, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = "UPDATE ST_INCENTIVES SET DT='" + pDt + "', \"NAME\"='" + pName + "', AMT=" + pAmt + ", TUSHAALNAME='" + pTushaalName + "', TUSHAALNO='" + pTushaalNo + "', TUSHAALDT='" + pTushaalDt + "', \"DESC\"='" + pDesc + "', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID=" + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_INCENTIVES (ID, STAFFS_ID, DT, ""NAME"", AMT, TUSHAALNAME, TUSHAALNO, TUSHAALDT, ""DESC"", CREATED_STAFFID, CREATED_DATE) " +
                                "VALUES (TBLLASTID('ST_INCENTIVES'), " + pStaffsId + ", '" + pDt + "', '" + pName + "', " + pAmt + ", '" + pTushaalName + "', '" + pTushaalNo + "', '" + pTushaalDt + "', '" + pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string profileTab3T6Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pStaffsId == null || pStaffsId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт");
                string strQry = @"SELECT ID, STAFFS_ID, DT, ""NAME"", AMT, TUSHAALNAME, TUSHAALNO, TUSHAALDT, ""DESC"" FROM ST_COMPENSATION WHERE STAFFS_ID=" + pStaffsId + @" ORDER BY ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string DeleteProfileTab3T6Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pId == null || pId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                int value;
                if (!int.TryParse(pId, out value)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                string strQry = @"DELETE FROM ST_COMPENSATION WHERE ID=" + pId;
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string SaveProfileTab3T6Datatable1(string pId, string pStaffsId, string pDt, string pName, string pAmt, string pTushaalName, string pTushaalNo, string pTushaalDt, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = "UPDATE ST_COMPENSATION SET DT='" + pDt + "', \"NAME\"='" + pName + "', AMT=" + pAmt + ", TUSHAALNAME='" + pTushaalName + "', TUSHAALNO='" + pTushaalNo + "', TUSHAALDT='" + pTushaalDt + "', \"DESC\"='" + pDesc + "', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID=" + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_COMPENSATION (ID, STAFFS_ID, DT, ""NAME"", AMT, TUSHAALNAME, TUSHAALNO, TUSHAALDT, ""DESC"", CREATED_STAFFID, CREATED_DATE) " +
                                "VALUES (TBLLASTID('ST_COMPENSATION'), " + pStaffsId + ", '" + pDt + "', '" + pName + "', " + pAmt + ", '" + pTushaalName + "', '" + pTushaalNo + "', '" + pTushaalDt + "', '" + pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string profileTab3T7Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pStaffsId == null || pStaffsId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт");
                string strQry = @"SELECT ID, STAFFS_ID, ORGNAME, PUNISHEDPERSONNAME, TUSHAALNAME, TUSHAALNO, TUSHAALDT, ""DESC"" FROM ST_SHIITGEL WHERE STAFFS_ID=" + pStaffsId + @" ORDER BY ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string DeleteProfileTab3T7Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pId == null || pId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                int value;
                if (!int.TryParse(pId, out value)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                string strQry = @"DELETE FROM ST_SHIITGEL WHERE ID=" + pId;
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string SaveProfileTab3T7Datatable1(string pId, string pStaffsId, string pOrgName, string pPunishedPersonName, string pTushaalName, string pTushaalNo, string pTushaalDt, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = "UPDATE ST_SHIITGEL SET ORGNAME='" + pOrgName + "', PUNISHEDPERSONNAME='" + pPunishedPersonName + "', TUSHAALNAME='" + pTushaalName + "', TUSHAALNO='" + pTushaalNo + "', TUSHAALDT='" + pTushaalDt + "', \"DESC\"='" + pDesc + "', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID=" + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_SHIITGEL (ID, STAFFS_ID, ORGNAME, PUNISHEDPERSONNAME, TUSHAALNAME, TUSHAALNO, TUSHAALDT, ""DESC"", CREATED_STAFFID, CREATED_DATE) " +
                                "VALUES (TBLLASTID('ST_SHIITGEL'), " + pStaffsId + ", '" + pOrgName + "', '" + pPunishedPersonName + "', '" + pTushaalName + "', '" + pTushaalNo + "', '" + pTushaalDt + "', '" + pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string profileTab3T8Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pStaffsId == null || pStaffsId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт");
                string strQry = @"SELECT ID, STAFFS_ID, CONTENTNAME, UPDATEDT1, UPDATEDPERSONNAME, UPDATEDT2, ""DESC"" FROM ST_ANKETMONITOR WHERE STAFFS_ID=" + pStaffsId + @" ORDER BY ID ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string DeleteProfileTab3T8Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pId == null || pId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                int value;
                if (!int.TryParse(pId, out value)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                string strQry = @"DELETE FROM ST_ANKETMONITOR WHERE ID=" + pId;
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string SaveProfileTab3T8Datatable1(string pId, string pStaffsId, string pContentName, string pUpdatedDt1, string pUpdatedPersonName, string pUpdatedDt2, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = "UPDATE ST_ANKETMONITOR SET CONTENTNAME='" + pContentName + "', UPDATEDT1='" + pUpdatedDt1 + "', UPDATEDPERSONNAME='" + pUpdatedPersonName + "', UPDATEDT2='" + pUpdatedDt2 + "', \"DESC\"='" + pDesc + "', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID=" + pId;
                }
                else
                {
                    strQry = @"INSERT INTO ST_ANKETMONITOR (ID, STAFFS_ID, CONTENTNAME, UPDATEDT1, UPDATEDPERSONNAME, UPDATEDT2, ""DESC"", CREATED_STAFFID, CREATED_DATE) " +
                                "VALUES (TBLLASTID('ST_ANKETMONITOR'), " + pStaffsId + ", '" + pContentName + "', '" + pUpdatedDt1 + "', '" + pUpdatedPersonName + "', '" + pUpdatedDt2 + "', '" + pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string profileTab3T4Datatable1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pStaffsId == null || pStaffsId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт");
                string strQry = @"SELECT ID, STAFFS_ID, YR, D1, D2, D3, D4, D5, D6, ""DESC"" FROM ST_ANKETSALARY WHERE STAFFS_ID=" + pStaffsId + @" ORDER BY YR ASC";
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string DeleteProfileTab3T4Datatable1(string pId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (!myObj.checkUserSession()) return jsonResClass.JsonResponse(intJsonStatusFailed, "SessionDied");
                if (pId == null || pId == "") return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                int value;
                if (!int.TryParse(pId, out value)) return jsonResClass.JsonResponse(intJsonStatusFailed, "Буруу хандалт! Дахин оролдоно уу");
                string strQry = @"DELETE FROM ST_ANKETSALARY WHERE ID=" + pId;
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string SaveProfileTab3T4Datatable1(string pId, string pStaffsId, string pYr, string pD1, string pD2, string pD3, string pD4, string pD5, string pD6, string pDesc)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                if (pD6 == "" || pD6 == null) pD6 = "null";
                string strQry = "";
                if (pId != null && pId != "")
                {
                    strQry = "UPDATE ST_ANKETSALARY SET YR=" + pYr + ", D1=" + pD1 + ", D2=" + pD2 + ", D3=" + pD3 + ", D4=" + pD4 + ", D5=" + pD5 + ", D6=" + pD6 + ", \"DESC\"='" + pDesc + "', UPDATED_STAFFID=" + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", UPDATED_DATE=SYSDATE WHERE ID=" + pId;
                }
                else
                {
                    strQry = "SELECT COUNT(1) as CNT FROM ST_ANKETSALARY WHERE STAFFS_ID=" + pStaffsId + " AND YR=" + pYr;
                    DataSet ds = myObj.OracleExecuteDataSet(strQry);
                    if(ds.Tables[0].Rows[0]["CNT"].ToString() != "0") return jsonResClass.JsonResponse(intJsonStatusFailed, pYr + " оны мэдээлэл хадгалагдсан байна!");
                    strQry = @"INSERT INTO ST_ANKETSALARY (ID, STAFFS_ID, YR, D1, D2, D3, D4, D5, D6, ""DESC"", CREATED_STAFFID, CREATED_DATE) " +
                                "VALUES (TBLLASTID('ST_ANKETSALARY'), " + pStaffsId + ", " + pYr + ", " + pD1 + ", " + pD2 + ", " + pD3 + ", " + pD4 + ", " + pD5 + ", " + pD6 + ", '" + pDesc + "', " + sessionClass.getCurrentUserData().USR_STAFFID.ToString() + ", SYSDATE)";
                }
                myObj.OracleExecuteNonQuery(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай");
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
        public string GetPerFilledAnket1_1(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((NVL(SUM(CNT),0)/31)*100) as PER
FROM (
    SELECT (
        NVL2(NATIONALITY,1,0)+
        NVL2(MNAME,1,0)+
        NVL2(LNAME,1,0)+
        NVL2(FNAME,1,0)+
        NVL2(GENDER,1,0)+
        NVL2(BDATE,1,0)+
        NVL2(EDUTP_ID,1,0)+
        NVL2(OCCTYPE_ID,1,0)+
        NVL2(OCCNAME,1,0)+
        NVL2(BCITY_ID,1,0)+
        NVL2(BDIST_ID,1,0)+
        NVL2(BPLACE,1,0)+
        NVL2(NAT_ID,1,0)+
        NVL2(SOCPOS_ID,1,0)+
        NVL2(ADDRCITY_ID,1,0)+
        NVL2(ADDRDIST_ID,1,0)+
        NVL2(ADDRESSNAME,1,0)+
        NVL2(TEL,1,0)+
        NVL2(TEL2,1,0)+
        NVL2(EMAIL,1,0)+
        NVL2(RELNAME,1,0)+
        NVL2(RELATION_ID,1,0)+
        NVL2(RELADDRESSNAME,1,0)+
        NVL2(RELTEL,1,0)+
        NVL2(RELTEL2,1,0)+
        NVL2(RELEMAIL,1,0)+
        NVL2(REGNO,1,0)+
        NVL2(CITNO,1,0)+
        NVL2(SOCNO,1,0)+
        NVL2(HEALNO,1,0)+
        NVL2(IMAGE,1,0)
    ) as CNT FROM ST_STAFFS WHERE ID="+ pStaffsId + @"
    UNION ALL
    SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFSFAMILY WHERE STAFFS_ID=" + pStaffsId + @" AND TP=1
    UNION ALL
    SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFSFAMILY WHERE STAFFS_ID=" + pStaffsId + @" AND TP=2
)";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket1_2(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((NVL(NVL2(ISGAVE,1,0)+NVL2(ISSWEAR,1,0)+NVL2(TESTDATE,1,0)+NVL2(ISSPECIAL,1,0)+NVL2(ISRESERVE,1,0),0)/5)*100) as PER FROM ST_STATES WHERE STAFFS_ID="+ pStaffsId;
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket1_3(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_EDUCATION WHERE STAFFS_ID=" + pStaffsId + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_PHD WHERE STAFFS_ID=" + pStaffsId + "))/2)*100) as PER FROM DUAL";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket1_4(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_TRAINING WHERE STAFFS_ID=" + pStaffsId + ")+(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_SCIENCEDEGREE WHERE STAFFS_ID=" + pStaffsId + "))/2)*100) as PER FROM DUAL";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket1_5(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((NVL(SUM(CNT),0)/2)*100) as PER
FROM (
    SELECT (NVL2(MILITARY_ISCLOSED,1,0)) as CNT FROM ST_STAFFS WHERE ID="+ pStaffsId + @"
    UNION ALL
    SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_MILITARY WHERE STAFFS_ID=" + pStaffsId + @"
)";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket1_6(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_BONUS WHERE STAFFS_ID="+ pStaffsId + "))/1)*100) as PER FROM DUAL";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket1_7(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_EXPHISTORY WHERE STAFFS_ID=" + pStaffsId + "))/1)*100) as PER FROM DUAL";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket1_8(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND((((SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_SELFCREATED WHERE STAFFS_ID=" + pStaffsId + "))/1)*100) as PER FROM DUAL";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
        public string GetPerFilledAnket2_0(string pStaffsId)
        {
            ModifyDB myObj = new ModifyDB();
            CJsonResponse jsonResClass = new CJsonResponse();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            try
            {
                string strQry = "";
                if (pStaffsId != null && pStaffsId != "")
                {
                    strQry = @"SELECT ROUND(((
(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_ANKETSALARY WHERE STAFFS_ID="+ pStaffsId + @")+
(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_INCENTIVES WHERE STAFFS_ID=" + pStaffsId + @")+
(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_COMPENSATION WHERE STAFFS_ID=" + pStaffsId + @")+
(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_SHIITGEL WHERE STAFFS_ID=" + pStaffsId + @")+
(SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_ANKETMONITOR WHERE STAFFS_ID=" + pStaffsId + @"))/5)*100) as PER FROM DUAL";
                }
                else return jsonResClass.JsonResponse(intJsonStatusFailed, "Холболтонд алдаа гарлаа!");
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                return jsonResClass.JsonResponse(intJsonStatusSuccess, "Амжилттай", ds.Tables[0]);
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
