using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace HRWebApp.cs
{
    public class CMain
    {
        public DataTable getBranchList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID
    , a.FATHER_ID
    , CASE WHEN a.ID<>a.FATHER_ID THEN b.INITNAME||'-'||a.INITNAME ELSE a.INITNAME END as INITNAME
    , a.NAME
FROM ST_BRANCH a
LEFT JOIN ST_BRANCH b ON a.FATHER_ID=b.ID
WHERE a.ISACTIVE=1
ORDER BY a.SORT ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["INITNAME"] = set1stIndexValue;
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex) {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getHouseConditionList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_CONDITIONTYPE ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0) {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getEducationTypeList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_EDUTP ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getOccupationTypeList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_OCCTYPE ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getAttendancedYears(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT YEAR FROM ( SELECT YEAR FROM hr_mof.STN_TRCDLOG WHERE YEAR IS NOT NULL AND YEAR<=TO_CHAR(SYSDATE,'YYYY') GROUP BY YEAR UNION ALL SELECT TO_CHAR(SYSDATE,'YYYY')+1 as YEAR FROM DUAL ) ORDER BY YEAR");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getStaffsWithPos(List<string> branch, string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
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
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID as STAFFS_ID
    , UPPER(SUBSTR(a.LNAME,0,1))||'.'||UPPER(a.FNAME)||' | '||f.NAME as ST_NAME
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID 
INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID 
INNER JOIN STN_POS f ON b.POS_ID=f.ID 
INNER JOIN STN_MOVE g ON b.MOVE_ID=g.ID 
WHERE g.ACTIVE=1"+ strBranch + @"
ORDER BY d.SORT, c.SORT, f.SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["ST_NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getStaffsWithBranchPos(List<string> branch, string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
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
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID as STAFFS_ID
    , c.ID as BRANCH_ID
    , CASE WHEN c.ID<>c.FATHER_ID THEN d.INITNAME||'-'||c.INITNAME ELSE c.INITNAME END as BRANCH_INITNAME
    , UPPER(SUBSTR(a.LNAME,0,1))||'.'||UPPER(a.FNAME)||' | '||f.NAME as ST_NAME
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID 
INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID 
INNER JOIN STN_POS f ON b.POS_ID=f.ID 
INNER JOIN STN_MOVE g ON b.MOVE_ID=g.ID 
WHERE g.ACTIVE=1" + strBranch + @"
ORDER BY d.SORT, c.SORT, f.SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["ST_NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public void setExLog(Exception ex) {

            throw ex;
        }
        public DataTable getRankPosType(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_RANKPOSTYPE ORDER BY SORT ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public class RankBasicSalary
        {
            public string pRankId { get; set; }
            public string pBasicSalary { get; set; }
        }
        public DataTable getTomiloltDirection(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_TOMILOLTDIRECTION ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getTomiloltBudget(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_TOMILOLTBUDGET ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getAmraltYears(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT YEAR 
        FROM ( 
            SELECT TO_NUMBER(TO_CHAR(TO_DATE(BEGINDT, 'YYYY-MM-DD'),'YYYY')) as YEAR 
            FROM hrdbuser.ST_AMRALT 
            WHERE BEGINDT IS NOT NULL AND TO_NUMBER(TO_CHAR(TO_DATE(BEGINDT, 'YYYY-MM-DD'),'YYYY'))<=TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))
            GROUP BY TO_NUMBER(TO_CHAR(TO_DATE(BEGINDT, 'YYYY-MM-DD'),'YYYY')) 
            UNION ALL 
            SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))+1 as YEAR FROM DUAL 
        ) ORDER BY YEAR");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getChuluuTimeYears(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT (SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(DT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUTIME)+LEVEL-1 as YEAR FROM DUAL
        CONNECT BY LEVEL <= ((SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))+1 FROM DUAL)-(SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(DT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUTIME)+1)");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getChuluuDayT2Years(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT (SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(BEGINDT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUDAYT2)+LEVEL-1 as YEAR FROM DUAL
        CONNECT BY LEVEL <= ((SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))+1 FROM DUAL)-(SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(BEGINDT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUDAYT2)+1)");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getChuluuDayF3Years(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT (SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(BEGINDT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUDAYF3)+LEVEL-1 as YEAR FROM DUAL
        CONNECT BY LEVEL <= ((SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))+1 FROM DUAL)-(SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(BEGINDT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUDAYF3)+1)");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getChuluuSickYears(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT (SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(BEGINDT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUSICK)+LEVEL-1 as YEAR FROM DUAL
        CONNECT BY LEVEL <= ((SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))+1 FROM DUAL)-(SELECT TO_NUMBER(TO_CHAR(TO_DATE(MIN(BEGINDT), 'YYYY-MM-DD'),'YYYY')) FROM hrdbuser.ST_CHULUUSICK)+1)");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getChuluuReason(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_CHULUUREASON ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getChuluuSickType(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_CHULUUSICKTYPE ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public string Win1251_To_Iso8859(string str)
        {
            var enc1251 = Encoding.GetEncoding(1251);
            var enc8859 = Encoding.GetEncoding("iso-8859-1");
            return enc1251.GetString(enc8859.GetBytes(str)).Replace("є", "ө").Replace("ї", "ү").Replace("Є", "Ө").Replace("Ї", "Ү");
        }
        public string Iso8859_To_Win1251(string str)
        {
            var enc1251 = Encoding.GetEncoding(1251);
            var enc8859 = Encoding.GetEncoding("iso-8859-1");
            return enc8859.GetString(enc1251.GetBytes(str));
        }
        public DataTable getInventoryAccountTypeList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                //DataSet ds = myObj.OleDBExecuteDataSet("SELECT ACCOUNT_CODE, ACCOUNT_NAME FROM I_INVENTORY_BALANCE GROUP BY ACCOUNT_CODE, ACCOUNT_NAME");
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ACCOUNT_CODE, ACCOUNT_NAME FROM ST_INVENTORYLIST GROUP BY ACCOUNT_CODE, ACCOUNT_NAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["ACCOUNT_NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getInventoryInterval(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM ST_INVENTORYINTERVAL ORDER BY ID DESC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public void setErrorPermission(string message) {
            HttpContext.Current.Session["errorpermission"] = message;
        }
        public DataTable getStaffSalaryYears(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT (SELECT MIN(YEAR_VALUE) as YEAR_VALUE FROM ST_STAFFSALARY)+LEVEL-1 as YEAR 
FROM DUAL 
CONNECT BY LEVEL <= ((SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))+1 FROM DUAL)-(SELECT MIN(YEAR_VALUE) as YEAR_VALUE FROM ST_STAFFSALARY))");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["YEAR"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getGazarList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID IN (1,3) AND ISACTIVE=1 ORDER BY SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["INITNAME"] = set1stIndexValue;
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getSelfCreatedTypeList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, NAME FROM STN_SELFCREATED_TYPE ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getRankPosDegreeList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, NAME FROM STN_RANKPOSDEGREE ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getRankList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, NAME FROM ST_RANK");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
        public DataTable getPosDegreeDtlList(string set1stIndexValue = null)
        {
            ModifyDB myObj = new ModifyDB();
            DataTable dt = null;
            try
            {
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, NAME FROM STN_POSDEGREEDTL ORDER BY ID ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    dt = ds.Tables[0];
                    if (set1stIndexValue != "" && set1stIndexValue != null)
                    {
                        DataRow drow = dt.NewRow();
                        drow["NAME"] = set1stIndexValue;
                        dt.Rows.InsertAt(drow, 0);
                    }
                }
            }
            catch (Exception ex)
            {
                setExLog(ex);
            }
            return dt;
        }
    }
}