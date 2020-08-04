using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace HRWebApp.cs
{
    public class GetTableData
    {
        public string DataTableToJson(DataTable dt)
        {
            List<Dictionary<string, string>> ListRows = new List<Dictionary<string, string>>();
            Dictionary<string, string> DicRow;
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    DicRow = new Dictionary<string, string>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        DicRow.Add(col.ColumnName, dr[col].ToString());
                    }
                    ListRows.Add(DicRow);
                }
            }
            return (new JavaScriptSerializer().Serialize(ListRows));
        }
        public void exeptionMethod(Exception ex, bool ispermission = false)
        {
            var objExData = new ExData
            {
                EX_MESSAGE = ex.Message,
                EX_STACKTRACE = ex.StackTrace,
                EX_ISPERMISSION = ispermission
            };
            HttpContext.Current.Session["HRMISExData"] = objExData;
            ModifyDB myObj = new ModifyDB();
            CSession sessionClass = new CSession();
            GetTableData myObjGetTableData = new GetTableData();
            var userData = sessionClass.getCurrentUserData();
            try
            {
                myObj.OracleExecuteNonQuery("INSERT INTO ST_ERRORLOG (ID, STAFFS_ID, OCCURDATE, EX_MESSAGE, EX_STACKTRACE) VALUES (TBLLASTID('ST_ERRORLOG'), "+ userData.USR_STAFFID + ", SYSDATE, '"+ ex.Message.ToString().Replace("'","") + "', '" + ex.StackTrace.ToString().Replace("'", "") + "')");
            }
            catch (Exception e) {
                string aa = e.Message;
                string aaa = e.StackTrace.ToString();
                myObj.OracleExecuteNonQuery("INSERT INTO ST_ERRORLOG (ID, STAFFS_ID, OCCURDATE, EX_MESSAGE, EX_STACKTRACE) VALUES (TBLLASTID('ST_ERRORLOG'), " + userData.USR_STAFFID + ", SYSDATE, '" + e.Message.ToString().Replace("'", "") + "', '" + e.StackTrace.ToString().Replace("'", "") + "')");
            }
        }
        public DataSet getUserInfo(string stid)
        {
            ModifyDB myObj = new ModifyDB();
            DataSet ds = null;
            try
            {
                ds = myObj.OracleExecuteDataSet("SELECT COUNT(1) FROM ST_BRANCH WHERE FATHER_ID = ( SELECT c.FATHER_ID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1 WHERE a.ID=" + stid + " ) AND ID != ( SELECT c.FATHER_ID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1 WHERE a.ID=" + stid + ")");
                if (ds.Tables[0].Rows[0][0].ToString() == "0") ds = myObj.OracleExecuteDataSet(@"SELECT a.ID as STID
  , SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,1,1)||LOWER(SUBSTR(a.FNAME,2)) as STNAMEINIT
  , c.ID as HELTESID
  , c.INITNAME as HELTESNAMEINIT
  , c.NAME as HELTESNAME
  , d.ID as GAZARID
  , d.INITNAME as GAZARNAMEINIT
  , d.NAME as GAZARNAME
  , b.POS_ID as POSID
  , f.NAME as POSNAME
  , g.NAME as POSTYPE
  , m.ID as HELTESBOSSID
  , SUBSTR(m.LNAME,0,1)||'.'||SUBSTR(m.FNAME,1,1)||LOWER(SUBSTR(m.FNAME,2)) as HELTESBOSSNAMEINIT
  , m.ID as GAZARBOSSID
  , SUBSTR(m.LNAME,0,1)||'.'||SUBSTR(m.FNAME,1,1)||LOWER(SUBSTR(m.FNAME,2)) as GAZARBOSSNAMEINIT
  , (SELECT a.ID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 AND b.POS_ID=10205 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID AND c.ACTIVE=1) as TNBDID
  , (SELECT SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,1,1)||LOWER(SUBSTR(a.FNAME,2)) FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 AND b.POS_ID=10205 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID AND c.ACTIVE=1) as TNBDNAME 
  , n.ROLELISTID
FROM ST_STAFFS a
LEFT JOIN (
  SELECT STAFFS_ID, RTRIM(xmlagg (xmlelement (e, ROLE_ID || ',')).extract('//text()'), ',') as ROLELISTID FROM ST_STAFFS_ROLE WHERE STAFFS_ID=" + stid + @" GROUP BY STAFFS_ID
) n ON n.STAFFS_ID = a.ID
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID AND c.ISACTIVE=1 
INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID AND d.ISACTIVE=1 
LEFT JOIN STN_POS f ON b.POS_ID=f.ID 
LEFT JOIN ST_RANK g ON b.RANK_ID=g.ID 
LEFT JOIN ST_STBR k ON d.ID=k.BRANCH_ID AND k.ISACTIVE=1 AND k.POS_ID IN (2010201,10205) 
LEFT JOIN STN_MOVE l ON k.MOVE_ID=l.ID AND l.ACTIVE=1 
LEFT JOIN ST_STAFFS m ON k.STAFFS_ID=m.ID 
WHERE a.ID=" + stid);
                else {
                    ds = myObj.OracleExecuteDataSet(@"SELECT a.ID as STID
  , b.POS_ID as POSID
FROM ST_STAFFS a
INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
WHERE a.ID = "+ stid);
                    if (ds.Tables[0].Rows[0]["POSID"].ToString() != "2010201")
                    {
                        ds = myObj.OracleExecuteDataSet(@"SELECT a.ID as STID
  , SUBSTR(a.LNAME, 0, 1) || '.' || SUBSTR(a.FNAME, 1, 1) || LOWER(SUBSTR(a.FNAME, 2)) as STNAMEINIT
  , c.ID as HELTESID
  , c.INITNAME as HELTESNAMEINIT
  , c.NAME as HELTESNAME
  , d.ID as GAZARID
  , d.INITNAME as GAZARNAMEINIT
  , d.NAME as GAZARNAME
  , b.POS_ID as POSID
  , f.NAME as POSNAME
  , g.NAME as POSTYPE
  , i.ID as HELTESBOSSID
  , SUBSTR(j.LNAME, 0, 1) || '.' || SUBSTR(j.FNAME, 1, 1) || LOWER(SUBSTR(j.FNAME, 2)) as HELTESBOSSNAMEINIT
  , m.ID as GAZARBOSSID
  , SUBSTR(m.LNAME, 0, 1) || '.' || SUBSTR(m.FNAME, 1, 1) || LOWER(SUBSTR(m.FNAME, 2)) as GAZARBOSSNAMEINIT
  , n.ROLELISTID
FROM ST_STAFFS a
LEFT JOIN (
  SELECT STAFFS_ID, RTRIM(xmlagg (xmlelement (e, ROLE_ID || ',')).extract('//text()'), ',') as ROLELISTID FROM ST_STAFFS_ROLE WHERE STAFFS_ID=" + stid + @" GROUP BY STAFFS_ID
) n ON n.STAFFS_ID = a.ID
INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
INNER JOIN ST_BRANCH c ON b.BRANCH_ID = c.ID AND c.ISACTIVE = 1
INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID AND d.ISACTIVE = 1
LEFT JOIN STN_POS f ON b.POS_ID = f.ID
LEFT JOIN ST_RANK g ON b.RANK_ID = g.ID
LEFT JOIN ST_STBR h ON c.ID = h.BRANCH_ID AND h.ISACTIVE = 1 AND h.POS_ID = 2010301
LEFT JOIN STN_MOVE i ON h.MOVE_ID = i.ID AND i.ACTIVE = 1
LEFT JOIN ST_STAFFS j ON h.STAFFS_ID = j.ID
LEFT JOIN ST_STBR k ON d.ID = k.BRANCH_ID AND k.ISACTIVE = 1 AND k.POS_ID = 2010201
LEFT JOIN STN_MOVE l ON k.MOVE_ID = l.ID AND l.ACTIVE = 1
LEFT JOIN ST_STAFFS m ON k.STAFFS_ID = m.ID
WHERE a.ID = " + stid);
                    }
                    else {
                        ds = myObj.OracleExecuteDataSet(@"SELECT a.ID as STID
  , SUBSTR(a.LNAME, 0, 1) || '.' || SUBSTR(a.FNAME, 1, 1) || LOWER(SUBSTR(a.FNAME, 2)) as STNAMEINIT
  , c.ID as HELTESID
  , c.INITNAME as HELTESNAMEINIT
  , c.NAME as HELTESNAME
  , d.ID as GAZARID
  , d.INITNAME as GAZARNAMEINIT
  , d.NAME as GAZARNAME
  , b.POS_ID as POSID
  , f.NAME as POSNAME
  , g.NAME as POSTYPE
  , m.ID as GAZARBOSSID
  , SUBSTR(m.LNAME, 0, 1) || '.' || SUBSTR(m.FNAME, 1, 1) || LOWER(SUBSTR(m.FNAME, 2)) as GAZARBOSSNAMEINIT
  , n.ROLELISTID
FROM ST_STAFFS a
LEFT JOIN (
  SELECT STAFFS_ID, RTRIM(xmlagg (xmlelement (e, ROLE_ID || ',')).extract('//text()'), ',') as ROLELISTID FROM ST_STAFFS_ROLE WHERE STAFFS_ID="+stid+ @" GROUP BY STAFFS_ID
) n ON n.STAFFS_ID = a.ID
INNER JOIN ST_STBR b ON a.ID = b.STAFFS_ID AND b.ISACTIVE = 1
INNER JOIN ST_BRANCH c ON b.BRANCH_ID = c.ID AND c.ISACTIVE = 1
INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID AND d.ISACTIVE = 1
LEFT JOIN STN_POS f ON b.POS_ID = f.ID
LEFT JOIN ST_RANK g ON b.RANK_ID = g.ID
LEFT JOIN ST_STBR k ON d.ID = k.BRANCH_ID AND k.ISACTIVE = 1 AND k.POS_ID = 2010201
LEFT JOIN STN_MOVE l ON k.MOVE_ID = l.ID AND l.ACTIVE = 1
LEFT JOIN ST_STAFFS m ON k.STAFFS_ID = m.ID
WHERE a.ID = " + stid);
                    }
                }
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
            return ds;
        }
        public string gazarListForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "<option selected value=\"\">- Бүгд -</option>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID IN (1,3) AND ISACTIVE=1 ORDER BY SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<option value=\"" + dr["ID"].ToString() + "\" title=\"" + dr["NAME"].ToString() + "\">" + dr["INITNAME"].ToString() + "</option>";
                    }
                }
                return strTableVal;
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
        public string heltesListForDDL(string gazarId)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "<option selected value=\"\">- Бүгд -</option>";
                if ("0" != myObj.OracleExecuteScalar("SELECT COUNT(1) FROM ST_BRANCH WHERE BRANCH_TYPE_ID=2 AND ISACTIVE=1 AND FATHER_ID=" + gazarId).ToString())
                {
                    DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID=3 AND ISACTIVE=1 AND ID=" + gazarId + @"
UNION ALL
SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID=2 AND ISACTIVE=1 AND FATHER_ID=" + gazarId);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            strTableVal += "<option value=\"" + dr["ID"].ToString() + "\" title=\"" + dr["NAME"].ToString() + "\">" + dr["INITNAME"].ToString() + "</option>";
                        }
                    }
                }
                else
                {
                    DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, INITNAME, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID IN (1,3) AND ISACTIVE=1 AND FATHER_ID=" + gazarId);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            strTableVal += "<option value=\"" + dr["ID"].ToString() + "\" title=\"" + dr["NAME"].ToString() + "\">" + dr["INITNAME"].ToString() + "</option>";
                        }
                    }
                }
                return strTableVal;
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
        public string staffListForDDL(string gazarId, string heltesId)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string mydata = "<option value=\"\">- Бүгд -</option>";
                string stroptgroup = "";
                if (gazarId != "") gazarId = " AND c.FATHER_ID=" + gazarId;
                if (heltesId != "") heltesId = " AND b.BRANCH_ID=" + heltesId;
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID as STAFFS_ID, SUBSTR(a.LNAME,0,1)||'.'||a.FNAME||' | '||f.NAME as ST_NAME, c.ID as BR_ID, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as BR_NAME FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID INNER JOIN STN_MOVE g ON b.MOVE_ID=g.ID WHERE g.ACTIVE=1 " + gazarId + heltesId + " ORDER BY d.SORT, c.SORT, f.SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (stroptgroup != dr["BR_ID"].ToString()) {
                            if (stroptgroup != "") mydata += "</optgroup>";
                            mydata += "<optgroup label=\"" + dr["BR_NAME"].ToString() + "\">";
                        }
                        mydata += "<option value=\"" + dr["STAFFS_ID"].ToString() + "\">" + dr["ST_NAME"].ToString() + "</option>";
                        stroptgroup = dr["BR_ID"].ToString();
                    }
                }
                return mydata;
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
        public string timeListForDDL(string begintime, string endtime, string intervalmin)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "<option selected value=\"\">- Сонго -</option>";
                DateTime dateValueStart = new DateTime(2014, 1, 1, Int32.Parse(begintime.Split(':')[0]), Int32.Parse(begintime.Split(':')[1]), 0);
                DateTime dateValueEnd = new DateTime(2014, 1, 1, Int32.Parse(endtime.Split(':')[0]), Int32.Parse(endtime.Split(':')[1]), 0);
                while (dateValueStart <= dateValueEnd)
                {
                    strTableVal += "<option>" + dateValueStart.ToString("HH:mm") + "</option>";
                    dateValueStart = dateValueStart.AddMinutes(Int32.Parse(intervalmin));
                }
                return strTableVal;
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
        public bool checkRoles(string stid, string roles)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if ("0" == myObj.OracleExecuteScalar("SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFS_ROLE WHERE STAFFS_ID=" + stid + " AND ROLE_ID IN (" + roles + ")").ToString()) return false;
                else return true;
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
        public string get_finger_id(string stid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT FINGERID FROM st_staffs WHERE id="+ stid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal =  dr["FINGERID"].ToString();
                    }
                }
                return strTableVal;
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
        //branchreg
        public string branchregTab1ModalTypeForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<option selected value=\"\">- Төрөл сонго -</option>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_BRANCH_TYPE");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<option value=\"" + dr["ID"].ToString() + "\" title=\"" + dr["NAME"].ToString() + "\">" + dr["NAME"].ToString() + "</option>";
                    }
                }
                myObj.DBDisconnect();
                return strTableVal;
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
        public string branchregTab1ModalChangeTypeForDDL(string isinsert)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (isinsert != "") isinsert = " WHERE ISINSERT=" + isinsert;
                string strTableVal = "";
                strTableVal = "<option selected value=\"\">- Өөрчлөгдөх төрөл сонго -</option>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_BRANCH_CHANGETYPE" + isinsert);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<option value=\"" + dr["ID"].ToString() + "\" title=\"" + dr["NAME"].ToString() + "\">" + dr["NAME"].ToString() + "</option>";
                    }
                }
                myObj.DBDisconnect();
                return strTableVal;
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
        public string branchregTab1ModalFatherForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", stroptgroup = "";
                strTableVal = "<option selected value=\"\">- Нэгж сонго -</option>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, a.INITNAME, a.NAME, a.BRANCH_TYPE_ID, b.NAME as BRANCH_TYPE_NAME FROM ST_BRANCH a INNER JOIN STN_BRANCH_TYPE b ON a.BRANCH_TYPE_ID=b.ID WHERE b.ISFATHER=1 AND a.ISACTIVE=1 ORDER BY a.SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (stroptgroup != dr[3].ToString())
                        {
                            if (stroptgroup == "") strTableVal += "<optgroup label=\"" + dr[4].ToString() + "\">";
                            else
                            {
                                strTableVal += "</optgroup>";
                                strTableVal += "<optgroup label=\"" + dr[4].ToString() + "\">";
                            }
                        }
                        strTableVal += "<option value=\"" + dr[0].ToString() + "\" title=\"" + dr[2].ToString() + "\">" + dr[1].ToString() + "</option>";
                        stroptgroup = dr[3].ToString();
                    }
                }
                myObj.DBDisconnect();
                return strTableVal;
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
        public string branchregTab1Datatable(string tp, string isactive)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (tp != "") tp = " AND a.BRANCH_TYPE_ID=" + tp;
                if (isactive != "") isactive = " AND a.ISACTIVE=" + isactive;
                string strTableVal = "";
                strTableVal = "<table id=\"branchregTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Товч нэр</th>";
                strTableVal += "<th>Дэлгэрэнгүй нэр</th>";
                strTableVal += "<th>Нэгжийн төрөл</th>";
                strTableVal += "<th>Нэмэгдсэн төлөв</th>";
                strTableVal += "<th>Тайлбар</th>";
                strTableVal += "<th>Тушаалын огноо</th>";
                strTableVal += "<th>Sort</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, a.INITNAME, a.NAME, b.NAME as BRANCH_TYPE_NAME, c.NAME as BRANCH_CHANGETYPE_NAME, a.DESCRIPTION, a.DT, a.ISACTIVE, a.SORT FROM ST_BRANCH a INNER JOIN STN_BRANCH_TYPE b ON a.BRANCH_TYPE_ID=b.ID INNER JOIN STN_BRANCH_CHANGETYPE c ON a.BRANCH_CHANGETYPE_ID=c.ID WHERE 1=1" + tp + isactive + " ORDER BY a.ISACTIVE DESC, a.SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr[7].ToString() == "1") strTableVal += "<tr class=\"success\">";
                        else strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        if (dr[7].ToString() == "1") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this,'шинэчлэх');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-refresh\"></i></a><a style=\"cursor:pointer;\" onclick=\"showAddEditTab1(this,'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a></td>";
                        else strTableVal += "<td>&nbsp;</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_branchregTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#branchregTab1Datatable').dataTable({\"bSort\": false, \"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_branchregTab1Datatable) {responsiveHelper_branchregTab1Datatable = new ResponsiveDatatablesHelper($('#branchregTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_branchregTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_branchregTab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"60px\" },null,{ \"sWidth\": \"100px\" },{ \"sWidth\": \"230px\" },null,{ \"sWidth\": \"110px\" },{ \"sWidth\": \"40px\" },{ \"sWidth\": \"35px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //staffreg
        public string staffregTab1ModalBranchForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", stroptgroup = "";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT b.ID as FATHER_ID, b.INITNAME as FATHERINIT_NAME, a.ID, a.INITNAME, b.NAME as FATHER_NAME, a.NAME, CASE WHEN b.ID=a.ID THEN b.INITNAME ELSE b.INITNAME||' - '||a.INITNAME END as NEGJNAME FROM ST_BRANCH a INNER JOIN ST_BRANCH b ON a.FATHER_ID=b.ID WHERE a.ISACTIVE=1 ORDER BY a.SORT ");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (stroptgroup != dr["FATHER_ID"].ToString())
                        {
                            if (stroptgroup == "") strTableVal += "<optgroup label=\"" + dr["FATHERINIT_NAME"].ToString() + "\">";
                            else
                            {
                                strTableVal += "</optgroup>";
                                strTableVal += "<optgroup label=\"" + dr["FATHERINIT_NAME"].ToString() + "\">";
                            }
                        }
                        strTableVal += "<option value=\"" + dr["ID"].ToString() + "\" title=\"" + dr["NAME"].ToString() + "\">" + dr["NEGJNAME"].ToString() + "</option>";
                        stroptgroup = dr["FATHER_ID"].ToString();
                    }
                }
                return strTableVal;
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
        public string staffregTab1ModalMoveForDDL(string tp)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (tp != "") tp = " WHERE b.ID="+tp;
                string strTableVal = "", stroptgroup = "";
                strTableVal = "<option selected value=\"\">- Сонго -</option>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT b.ID as TYPE_ID, b.NAME as TYPE_NAME, a.ID, a.NAME FROM STN_MOVE a INNER JOIN STN_MOVETYPE b ON a.MOVETYPE_ID=b.ID" + tp);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (stroptgroup != dr[0].ToString())
                        {
                            if (stroptgroup == "") strTableVal += "<optgroup label=\"" + dr[1].ToString() + "\">";
                            else
                            {
                                strTableVal += "</optgroup>";
                                strTableVal += "<optgroup label=\"" + dr[1].ToString() + "\">";
                            }
                        }
                        strTableVal += "<option value=\"" + dr[2].ToString() + "\" title=\"" + dr[3].ToString() + "\">" + dr[3].ToString() + "</option>";
                        stroptgroup = dr[0].ToString();
                    }
                }
                myObj.DBDisconnect();
                return strTableVal;
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
        public string staffregTab1ModalRankForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", stroptgroup = "";
                strTableVal = "<option selected value=\"\">- Сонго -</option>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT b.ID, b.NAME, a.ID, a.NAME FROM ST_RANK a INNER JOIN STN_RANKPOSTYPE b ON a.RANKPOSTYPE_ID=b.ID ORDER BY b.SORT, a.SORT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (stroptgroup != dr[0].ToString())
                        {
                            if (stroptgroup == "") strTableVal += "<optgroup label=\"" + dr[1].ToString() + "\">";
                            else
                            {
                                strTableVal += "</optgroup>";
                                strTableVal += "<optgroup label=\"" + dr[1].ToString() + "\">";
                            }
                        }
                        strTableVal += "<option value=\"" + dr[2].ToString() + "\" title=\"" + dr[3].ToString() + "\">" + dr[3].ToString() + "</option>";
                        stroptgroup = dr[0].ToString();
                    }
                }
                myObj.DBDisconnect();
                return strTableVal;
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
        public string staffregTab1ModalDistForDDL(string city)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<option selected value=\"\">- Сонго -</option>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM STN_DIST WHERE BCITY_ID=" + city + " ORDER BY ID");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<option value=\"" + dr[0].ToString() + "\" title=\"" + dr[1].ToString() + "\">" + dr[1].ToString() + "</option>";
                    }
                }
                myObj.DBDisconnect();
                return strTableVal;
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
        public string staffregTab1Datatable(string pos, string gazar, string heltes, string tp, string currstaffid, string ismove)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (pos != "") pos = " AND b.POS_ID="+pos;
                if (gazar != "") gazar = " AND c.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND b.BRANCH_ID=" + heltes;
                if (tp != "") {
                    if (tp.Split('-')[0] == "1") tp = " AND h.ACTIVE=1";
                    else if (tp.Split('-')[0] == "0") tp = " AND h.MOVETYPE_ID=" + tp.Split('-')[1];
                }
                string strTableVal = "", strIsEdit = "1", strIsMove="0", strIsMoveValue = "&ismove=1";
                if (!myObjGetTableData.checkRoles(currstaffid, "1,4")) strIsEdit = "0";
                if (strIsEdit == "1")
                {
                    if (ismove == "1") strIsMoveValue = "";
                }
                strTableVal = "<table id=\"staffregTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th>Регистер</th>";
                strTableVal += "<th>Домайн нэр</th>";
                strTableVal += "<th>Нэгж</th>";
                strTableVal += "<th>Эцэг(эх)-н нэр</th>";
                strTableVal += "<th>Өөрийн нэр</th>";
                strTableVal += "<th>Албан тушаал</th>";
                strTableVal += "<th>Хүйс</th>";
                strTableVal += "<th>ТАХ анкет</th>";
                strTableVal += "<th>А/Т/Т</th>";
                strTableVal += "<th>Гар утас</th>";
                strTableVal += "<th>Хур/хээ код</th>";
                strTableVal += "<th>MAC ID</th>";
                strTableVal += "<th>Төлөв</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID as STAFFS_ID, a.IMAGE, a.REGNO, a.DOMAIN_USER, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, UPPER(SUBSTR(a.LNAME,0,1))||LOWER(substr(a.LNAME, instr(a.LNAME, 'K') + 2)) as LNAME, UPPER(a.FNAME) as FNAME, f.NAME as POS_NAME, CASE WHEN a.GENDER=1 THEN 'Эр' ELSE 'Эм' END as GENDER, g.NAME as POSTYPE_NAME, a.TEL||CASE WHEN TEL is not null THEN ', '||TEL2 END as TEL, CASE WHEN h.ACTIVE=1 AND h.SHOW=1 THEN TO_CHAR(h.NAME) WHEN h.ACTIVE=1 AND h.SHOW=0 THEN 'Идэвхтэй' ELSE REPLACE(REPLACE(TO_CHAR(i.NAME),'өлөөлөх','өлөөлөгдсөн'),'халах','халагдсан') END AS TP, h.COLOR, a.FINGERID, a.MACID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID LEFT JOIN STN_POS f ON b.POS_ID=f.ID INNER JOIN STN_POSTYPE g ON b.POSTYPE_ID=g.ID INNER JOIN STN_MOVE h ON b.MOVE_ID=h.ID INNER JOIN STN_MOVETYPE i ON h.MOVETYPE_ID=i.ID WHERE 1=1" + pos + gazar + heltes + tp + " ORDER BY a.FNAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr["STAFFS_ID"].ToString() + "</td>";
                        if (dr[1].ToString() != "") strTableVal += "<td class=\"no-padding\" style=\"padding-left:5px!important;\"><img src=\"../files/staffs/" + dr["IMAGE"].ToString() + "\" class=\"stafflistimage\"></td>";
                        else strTableVal += "<td class=\"no-padding\" style=\"padding-left:5px!important;\"><img src=\"../img/avatars/male.png\" class=\"stafflistimage\"></td>";
                        if (strIsEdit == "1") strTableVal += "<td><a class=\"btn btn-link btn-xs no-padding\" href=\"../#pg/profile.aspx?id=" + dr["STAFFS_ID"].ToString() + strIsMoveValue + "\">" + dr["REGNO"].ToString() + "</a></td>";
                        else
                        {
                            if (currstaffid == dr["STAFFS_ID"].ToString()) strTableVal += "<td><a class=\"btn btn-link btn-xs no-padding\" href=\"../#pg/profile.aspx?id=" + dr["STAFFS_ID"].ToString() + strIsMoveValue + "\">" + dr["REGNO"].ToString() + "</a></td>";
                            else strTableVal += "<td>" + dr["REGNO"].ToString() + "</td>";
                        }
                        strTableVal += "<td>" + dr["DOMAIN_USER"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["NEGJ"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["LNAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["FNAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["POS_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["GENDER"].ToString() + "</td>";
                        strTableVal += "<td><a href='../pg/dashboardStaffAnketPrint.aspx?id=" + dr["STAFFS_ID"].ToString() + "' id='dashboardSection1btnStaffAnketPrint' class='btn btn-xs bg-color-teal txt-color-white' data-target='#dashboardStaffAnketPrint' data-toggle='modal'> <i class='fa fa-print'></i> ТАХ хэвлэх </a></td>";
                        strTableVal += "<td>" + dr["POSTYPE_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["TEL"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["FINGERID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["MACID"].ToString() + "</td>";
                        strTableVal += "<td><span class=\"label " + dr["COLOR"].ToString() + "\">" + dr["TP"].ToString() + "</span></td>";
                        if (strIsEdit == "1" && ismove == "0") strTableVal += "<td><a style=\"cursor:pointer;\" onclick=\"showAddEditTab1(this,'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a></td>";
                        else strTableVal += "<td></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_staffregTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#staffregTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_staffregTab1Datatable) {responsiveHelper_staffregTab1Datatable = new ResponsiveDatatablesHelper($('#staffregTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_staffregTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_staffregTab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"10px\" },{ \"sWidth\": \"80px\" },{ \"sWidth\": \"80px\" },{ \"sWidth\": \"100px\" },null,null,null,null,{ \"sWidth\": \"30px\" },null,null,null,{ \"sWidth\": \"80px\" },{ \"sWidth\": \"80px\" },{ \"sWidth\": \"15px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //profile
        public string profileTab1T2Datatable(string staffid, string tp)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T2Datatable"+tp+"\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Таны юу болох</th>";
                strTableVal += "<th>Эцэг(эх)-н нэр</th>";
                strTableVal += "<th>Өөрийн нэр</th>";
                strTableVal += "<th>Төрсөн он</th>";
                strTableVal += "<th>Төрсөн аймаг, хот</th>";
                strTableVal += "<th>Төрсөн сум, дүүрэг</th>";
                strTableVal += "<th>Одоо эрхэлж буй ажил</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME as RELATIONNAME, a.LNAME, a.FNAME, a.BYEAR, c.NAME as BCITYNAME, NVL(d.NAME,'-') as BDISTNAME, a.CURRENTWORK FROM ST_STAFFSFAMILY a INNER JOIN STN_RELATION b ON a.RELATION_ID=b.ID INNER JOIN STN_CITY c ON a.BCITY_ID=c.ID LEFT JOIN STN_DIST d ON a.BDIST_ID=d.ID WHERE a.STAFFS_ID=" + staffid + " AND a.TP=" + tp);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T2Sections(this,'засах');\" data-target=\"#pTab1T2SectionsModal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T2Sections(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T2Datatable" + tp + " = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T2Datatable" + tp + "').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T2Datatable" + tp + ") {responsiveHelper_profileTab1T2Datatable" + tp + " = new ResponsiveDatatablesHelper($('#profileTab1T2Datatable" + tp + "'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T2Datatable" + tp + ".createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T2Datatable" + tp + ".respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"100px\" },{ \"sWidth\": \"150px\" },{ \"sWidth\": \"150px\" },{ \"sWidth\": \"65px\" },{ \"sWidth\": \"125px\" },{ \"sWidth\": \"125px\" },null,{ \"sWidth\": \"35px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T3Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T3Datatable1\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Аймар, хот, Гадаадад </th>";
                strTableVal += "<th>Сум, дүүрэг, Аль улсад</th>";
                strTableVal += "<th>Сургуулийн нэр</th>";
                strTableVal += "<th>Орсон он, сар</th>";
                strTableVal += "<th>Төгссөн он, сар</th>";
                strTableVal += "<th>Эзэмшсэн боловсрол, мэргэжил</th>";
                strTableVal += "<th>Боловсрол, мэргэжлийн зэрэг</th>";
                strTableVal += "<th>Гэрчилгээ, Дипломын #</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">CITY_ID</th>";
                strTableVal += "<th class=\"hide\">DIST_ID</th>";
                strTableVal += "<th class=\"hide\">EDUTP_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID, 
    c.NAME as CITY_NAME, 
    d.NAME as DIST_NAME, 
    a.INSTITUTENAME, 
    a.FROMYR, 
    a.FROMMNTH, 
    a.TOYR,
    a.TOMNTH,
    a.PROFESSIONDESC, 
    b.NAME as EDUTP_NAME, 
    a.CERTIFICATENO, 
    a.CITY_ID, 
    a.DIST_ID, 
    a.EDUTP_ID 
FROM ST_EDUCATION a 
INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID LEFT JOIN STN_CITY c ON a.CITY_ID=c.ID LEFT JOIN STN_DIST d ON a.DIST_ID=d.ID AND d.BCITY_ID=a.CITY_ID 
WHERE a.STAFFS_ID=" + staffid + @" 
ORDER BY a.FROMYR ASC, a.FROMMNTH ASC, a.TOYR ASC, a.TOMNTH ASC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr["ID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["CITY_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DIST_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["INSTITUTENAME"].ToString() + "</td>";
                        strTableVal += "<td data-yr=\""+ dr["FROMYR"].ToString() + "\" data-mnth=\"" + dr["FROMMNTH"].ToString() + "\">" + dr["FROMYR"].ToString() + ", "+ dr["FROMMNTH"].ToString() + "</td>";
                        strTableVal += "<td data-yr=\"" + dr["TOYR"].ToString() + "\" data-mnth=\"" + dr["TOMNTH"].ToString() + "\">" + dr["TOYR"].ToString() + ", " + dr["TOMNTH"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["PROFESSIONDESC"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["EDUTP_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["CERTIFICATENO"].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T3Section1(this,'засах');\" data-target=\"#pTab1T3Section1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T3Section1(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr["CITY_ID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DIST_ID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["EDUTP_ID"].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T3Datatable1 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T3Datatable1').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T3Datatable1) {responsiveHelper_profileTab1T3Datatable1 = new ResponsiveDatatablesHelper($('#profileTab1T3Datatable1'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T3Datatable1.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T3Datatable1.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"140px\" },{ \"sWidth\": \"145px\" },null,{ \"sWidth\": \"65px\" },{ \"sWidth\": \"70px\" },null,{ \"sWidth\": \"200px\" },{ \"sWidth\": \"150px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T3Datatable2(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T3Datatable2\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Зэрэг</th>";
                strTableVal += "<th>Хамгаалсан газар</th>";
                strTableVal += "<th>Хамгаалсан сэдэв</th>";
                strTableVal += "<th>Он, сар</th>";
                strTableVal += "<th>Гэрчилгээ, Дипломын #</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">EDUTP_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID, 
    b.NAME as EDUTP_NAME, 
    a.INSTITUTENAME, 
    a.TITLEDESC, 
    a.DEGREEYR, 
    a.DEGREEMNTH, 
    a.CERTIFICATENO, 
    a.EDUTP_ID 
FROM ST_PHD a 
INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID 
WHERE a.STAFFS_ID=" + staffid+@" 
ORDER BY a.DEGREEYR");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr["ID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["EDUTP_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["INSTITUTENAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["TITLEDESC"].ToString() + "</td>";
                        strTableVal += "<td data-yr=\"" + dr["DEGREEYR"].ToString() + "\" data-mnth=\"" + dr["DEGREEMNTH"].ToString() + "\">" + dr["DEGREEYR"].ToString() + ", " + dr["DEGREEMNTH"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["CERTIFICATENO"].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T3Section2(this,'засах');\" data-target=\"#pTab1T3Section2Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T3Section2(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr["EDUTP_ID"].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T3Datatable2 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T3Datatable2').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T3Datatable2) {responsiveHelper_profileTab1T3Datatable2 = new ResponsiveDatatablesHelper($('#profileTab1T3Datatable2'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T3Datatable2.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T3Datatable2.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"200px\" },null,null,{ \"sWidth\": \"60px\" },{ \"sWidth\": \"150px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T3Datatable3(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T3Datatable3\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Цол</th>";
                strTableVal += "<th>Цол олгосон байгууллага</th>";
                strTableVal += "<th>Огноо</th>";
                strTableVal += "<th>Гэрчилгээ, Дипломын #</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">SCIENCEDEGREE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID, 
    b.NAME as SCIENCEDEGREE_NAME, 
    a.INSTITUTENAME, 
    a.DEGREEYR, 
    a.DEGREEDATE, 
    a.CERTIFICATENO, 
    a.SCIENCEDEGREE_ID 
FROM ST_SCIENCEDEGREE a 
INNER JOIN STN_SCIENCEDEGREE b ON a.SCIENCEDEGREE_ID=b.ID 
WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr["ID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["SCIENCEDEGREE_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["INSTITUTENAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DEGREEDATE"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["CERTIFICATENO"].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T3Section3(this,'засах');\" data-target=\"#pTab1T3Section3Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T3Section3(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr["SCIENCEDEGREE_ID"].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T3Datatable3 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T3Datatable3').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T3Datatable3) {responsiveHelper_profileTab1T3Datatable3 = new ResponsiveDatatablesHelper($('#profileTab1T3Datatable3'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T3Datatable3.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T3Datatable3.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,null,{ \"sWidth\": \"63px\" },{ \"sWidth\": \"150px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T4Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T4Datatable1\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Хаана</th>";
                strTableVal += "<th>Ямар байгууллагад</th>";
                strTableVal += "<th>Эхэлсэн огноо</th>";
                strTableVal += "<th>Дууссан огноо</th>";
                strTableVal += "<th>Хугацаа</th>";
                strTableVal += "<th>Ямар чиглэлээр</th>";
                strTableVal += "<th>Үнэмлэх гэрчилгээний #</th>";
                strTableVal += "<th>Олгосон огноо</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">CITY_ID</th>";
                strTableVal += "<th class=\"hide\">STUDYTIME_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME as STUDYLOCATION_NAME, a.ORGNAME, a.FROMDATE, a.TODATE, c.NAME as STUDYTIME_NAME, a.SUBJECTDESC, a.CERTIFICATENO, a.CERTIFICATEDATE, a.STUDYLOCATION_ID, a.STUDYTIME_ID FROM ST_TRAINING a INNER JOIN STN_STUDYLOCATION b ON a.STUDYLOCATION_ID=b.ID INNER JOIN STN_STUDYTIME c ON a.STUDYTIME_ID=c.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T4Section1(this,'засах');\" data-target=\"#pTab1T4Section1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T4Section1(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        strTableVal += "<td>" + dr[10].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T4Datatable1 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T4Datatable1').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T4Datatable1) {responsiveHelper_profileTab1T4Datatable1 = new ResponsiveDatatablesHelper($('#profileTab1T4Datatable1'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T4Datatable1.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T4Datatable1.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"100px\" },null,{ \"sWidth\": \"100px\" },{ \"sWidth\": \"100px\" },{ \"sWidth\": \"100px\" },null,{ \"sWidth\": \"155px\" },{ \"sWidth\": \"100px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T5Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T5Datatable1\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Албан тушаалын зэрэг дэв</th>";
                strTableVal += "<th>Албан тушаалын ангилал</th>";
                strTableVal += "<th>Зарлиг, захирамж, тушаалын нэр</th>";
                strTableVal += "<th>Огноо</th>";
                strTableVal += "<th>Үнэмлэхний дугаар</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">POSDEGREEDTL_ID</th>";
                strTableVal += "<th class=\"hide\">RANKPOSDEGREE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT ID, POSDEGREEDTL_NAME, RANKPOSDEGREE_NAME, DECISIONDESC, DECISIONDATE, CERTIFICATENO, POSDEGREEDTL_ID, RANKPOSDEGREE_ID, ISEDIT
FROM(
  SELECT a.ID, b.NAME as POSDEGREEDTL_NAME, c.NAME as RANKPOSDEGREE_NAME, a.DECISIONDESC, a.DECISIONDATE, a.CERTIFICATENO, a.POSDEGREEDTL_ID, a.RANKPOSDEGREE_ID, 1 as ISEDIT
  FROM ST_JOBTITLEDEGREE a
  INNER JOIN STN_POSDEGREEDTL b ON a.POSDEGREEDTL_ID = b.ID
  INNER JOIN STN_RANKPOSDEGREE c ON a.RANKPOSDEGREE_ID = c.ID
  WHERE a.STAFFS_ID = "+ staffid + @"
  UNION ALL
  SELECT a.STAFFS_ID as ID, c.NAME as POSDEGREEDTL_NAME, d.NAME as RANKPOSDEGREE_NAME, b.DECISIONDESC, b.DT as DECISIONDATE, b.CERTIFICATENO, b.POSDEGREEDTL_ID, b.RANKPOSDEGREE_ID, 0 as ISEDIT
  FROM ST_ZEREGDEV_STAFFS a
  INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID = b.ID
  INNER JOIN STN_POSDEGREEDTL c ON b.POSDEGREEDTL_ID = c.ID
  INNER JOIN STN_RANKPOSDEGREE d ON b.RANKPOSDEGREE_ID = d.ID
  WHERE a.STAFFS_ID = " + staffid + @"
) a
ORDER BY DECISIONDATE DESC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>";
                        if(dr[8].ToString() == "1") strTableVal += "<a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T5Section1(this,'засах');\" data-target=\"#pTab1T5Section1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T5Section1(this);\"><i class=\"fa fa-trash-o\"></i></a>";
                        strTableVal += "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T5Datatable1 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T5Datatable1').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T5Datatable1) {responsiveHelper_profileTab1T5Datatable1 = new ResponsiveDatatablesHelper($('#profileTab1T5Datatable1'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T5Datatable1.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T5Datatable1.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"150px\" },{ \"sWidth\": \"140px\" },null,{ \"sWidth\": \"70px\" },{ \"sWidth\": \"150px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T7Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T7Datatable1\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Гадаад хэлний нэр</th>";
                strTableVal += "<th>Сонсох</th>";
                strTableVal += "<th>Ярих</th>";
                strTableVal += "<th>Унших</th>";
                strTableVal += "<th>Бичих</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">LANGUAGE_ID</th>";
                strTableVal += "<th class=\"hide\">LISTEN_GRADE_ID</th>";
                strTableVal += "<th class=\"hide\">SPEAK_GRADE_ID</th>";
                strTableVal += "<th class=\"hide\">READ_GRADE_ID</th>";
                strTableVal += "<th class=\"hide\">WRITE_GRADE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME as LANGUAGE_NAME, c.NAME as LISTEN_GRADE_NAME, d.NAME as SPEAK_GRADE_NAME, f.NAME as READ_GRADE_NAME, g.NAME as WRITE_GRADE_NAME, a.LANGUAGE_ID, a.LISTEN_GRADE_ID, a.SPEAK_GRADE_ID, a.READ_GRADE_ID, a.WRITE_GRADE_ID FROM ST_LANGUAGESKILLS a INNER JOIN STN_LANGUAGE b ON a.LANGUAGE_ID=b.ID INNER JOIN STN_GRADE c ON a.LISTEN_GRADE_ID=c.ID INNER JOIN STN_GRADE d ON a.SPEAK_GRADE_ID=d.ID INNER JOIN STN_GRADE f ON a.READ_GRADE_ID=f.ID INNER JOIN STN_GRADE g ON a.WRITE_GRADE_ID=g.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T7Section1(this,'засах');\" data-target=\"#pTab1T7Section1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T7Section1(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        strTableVal += "<td>" + dr[10].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T7Datatable1 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T7Datatable1').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T7Datatable1) {responsiveHelper_profileTab1T7Datatable1 = new ResponsiveDatatablesHelper($('#profileTab1T7Datatable1'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T7Datatable1.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T7Datatable1.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,null,null,null,null,{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T7Datatable2(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T7Datatable2\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Эзэмшсэн програмын нэр</th>";
                strTableVal += "<th>Түвшин</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">SOFTWARE_ID</th>";
                strTableVal += "<th class=\"hide\">GRADE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME as SOFTWARE_NAME, c.NAME as GRADE_NAME, a.SOFTWARE_ID, a.GRADE_ID FROM ST_SOFTWARE a INNER JOIN STN_SOFTWARE b ON a.SOFTWARE_ID=b.ID INNER JOIN STN_GRADE c ON a.GRADE_ID=c.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T7Section2(this,'засах');\" data-target=\"#pTab1T7Section2Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T7Section2(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T7Datatable2 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T7Datatable2').dataTable({\"bFilter\":false, \"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T7Datatable2) {responsiveHelper_profileTab1T7Datatable2 = new ResponsiveDatatablesHelper($('#profileTab1T7Datatable2'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T7Datatable2.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T7Datatable2.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,null,{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T7Datatable3(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T7Datatable3\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Оффис-ын тоног төхөөрөмж ашиглах</th>";
                strTableVal += "<th>Түвшин</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">OFFICE_ID</th>";
                strTableVal += "<th class=\"hide\">GRADE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME as OFFICE_NAME, c.NAME as GRADE_NAME, a.OFFICE_ID, a.GRADE_ID FROM ST_OFFICE a INNER JOIN STN_OFFICE b ON a.OFFICE_ID=b.ID INNER JOIN STN_GRADE c ON a.GRADE_ID=c.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T7Section3(this,'засах');\" data-target=\"#pTab1T7Section3Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T7Section3(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T7Datatable3 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T7Datatable3').dataTable({\"bFilter\":false, \"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T7Datatable3) {responsiveHelper_profileTab1T7Datatable3 = new ResponsiveDatatablesHelper($('#profileTab1T7Datatable3'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T7Datatable3.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T7Datatable3.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,null,{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T8Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T8Datatable1\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Ажилласан байгууллагын нэр</th>";
                strTableVal += "<th>Газар, хэлтэс, алба</th>";
                strTableVal += "<th>Эрхэлсэн албан тушаал</th>";
                strTableVal += "<th>Ямар байгууллагад</th>";
                strTableVal += "<th>Ажиллаж байгаа эсэх</th>";
                strTableVal += "<th>Ажилд орсон огноо (тушаалын дугаар)</th>";
                strTableVal += "<th>Ажлаас гарсан огноо (тушаалын дугаар)</th>";
                strTableVal += "<th>НД төлж байсан</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">ORGTYPE_ID</th>";
                strTableVal += "<th class=\"hide\">ISWORKING_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID, 
    a.ORGNAME, 
    a.TITLE, 
    b.NAME as ORGTYPE_NAME, 
    c.NAME as ISWORKING_NAME, 
    a.FROMDATE, 
    a.TODATE, 
    CASE WHEN a.ISSOCINS=1 THEN 'Төлж байсан' ELSE '' END as SOCINS, 
    a.ORGTYPE_ID, 
    a.ISWORKING_ID, 
    a.BRANCHNAME, 
    a.FROMTUSHAALNO, 
    a.TOTUSHAALNO
FROM ST_EXPHISTORY a 
INNER JOIN STN_ORGTYPE b ON a.ORGTYPE_ID=b.ID 
INNER JOIN STN_ISWORKING c ON a.ISWORKING_ID=c.ID 
WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr["ID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["ORGNAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["BRANCHNAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["TITLE"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["ORGTYPE_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["ISWORKING_NAME"].ToString() + "</td>";
                        strTableVal += "<td data-fromdate=\"" + dr["FROMDATE"].ToString() + "\" data-fromtushaalno=\"" + dr["FROMTUSHAALNO"].ToString() + "\">" + dr["FROMDATE"].ToString() + ", " + dr["FROMTUSHAALNO"].ToString() + "</td>";
                        strTableVal += "<td data-todate=\"" + dr["TODATE"].ToString() + "\" data-totushaalno=\"" + dr["TOTUSHAALNO"].ToString() + "\">" + dr["TODATE"].ToString() + ", " + dr["TOTUSHAALNO"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["SOCINS"].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T8Section1(this,'засах');\" data-target=\"#pTab1T8Section1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T8Section1(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr["ORGTYPE_ID"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["ISWORKING_ID"].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T8Datatable1 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T8Datatable1').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T8Datatable1) {responsiveHelper_profileTab1T8Datatable1 = new ResponsiveDatatablesHelper($('#profileTab1T8Datatable1'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T8Datatable1.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T8Datatable1.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,null,null,{ \"sWidth\": \"130px\" },{ \"sWidth\": \"140px\" },null,null,{ \"sWidth\": \"105px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T9Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T9Datatable1\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Гаргасан санаачлага</th>";
                strTableVal += "<th>Огноо</th>";
                strTableVal += "<th>Хэрэгжилт</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">INNOIMPLTYPE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, a.NAME, a.DT, b.NAME, a.INNOIMPLTYPE_ID FROM ST_INNOVATION a INNER JOIN STN_INNOIMPLTYPE b ON a.INNOIMPLTYPE_ID=b.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T9Section1(this,'засах');\" data-target=\"#pTab1T9Section1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T9Section1(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T9Datatable1 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T9Datatable1').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T9Datatable1) {responsiveHelper_profileTab1T9Datatable1 = new ResponsiveDatatablesHelper($('#profileTab1T9Datatable1'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T9Datatable1.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T9Datatable1.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,{ \"sWidth\": \"70px\" },{ \"sWidth\": \"120px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T9Datatable2(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T9Datatable2\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Улс</th>";
                strTableVal += "<th>Хот</th>";
                strTableVal += "<th>Явсан огноо</th>";
                strTableVal += "<th>Ирсэн огноо</th>";
                strTableVal += "<th>Зорилго</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">DIST_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME, a.CITYNAME, a.FROMDATE, a.TODATE, a.PURPOSE, a.COUNTRY_ID FROM ST_TOUR a INNER JOIN STN_COUNTRY b ON a.COUNTRY_ID=b.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T9Section2(this,'засах');\" data-target=\"#pTab1T9Section2Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T9Section2(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T9Datatable2 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T9Datatable2').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T9Datatable2) {responsiveHelper_profileTab1T9Datatable2 = new ResponsiveDatatablesHelper($('#profileTab1T9Datatable2'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T9Datatable2.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T9Datatable2.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"100px\" },null,{ \"sWidth\": \"80px\" },{ \"sWidth\": \"80px\" },null,{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T9Datatable3(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T9Datatable3\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Орон сууц</th>";
                strTableVal += "<th>Гэрийн хаяг</th>";
                strTableVal += "<th>Хэдэн онд</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">CONDITIONTYPE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME, a.ADDRESS, a.YR, a.CONDITIONTYPE_ID FROM ST_CONDITION a INNER JOIN STN_CONDITIONTYPE b ON a.CONDITIONTYPE_ID=b.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T9Section3(this,'засах');\" data-target=\"#pTab1T9Section3Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T9Section3(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T9Datatable3 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T9Datatable3').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T9Datatable3) {responsiveHelper_profileTab1T9Datatable3 = new ResponsiveDatatablesHelper($('#profileTab1T9Datatable3'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T9Datatable3.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T9Datatable3.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,null,{ \"sWidth\": \"65px\" },{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T9Datatable4(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T9Datatable4\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Маргааны шалтгаан</th>";
                strTableVal += "<th>Маргаан шийдвэрлэсэн байдал</th>";
                strTableVal += "<th>Гаргасан огноо</th>";
                strTableVal += "<th>Шийдвэрлэсэн огноо</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">CAUSE_ID</th>";
                strTableVal += "<th class=\"hide\">DECIDE_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, b.NAME, c.NAME, a.FROMDATE, a.TODATE, a.CAUSE_ID, a.DECIDE_ID FROM ST_DISPUTE a INNER JOIN STN_CAUSE b ON a.CAUSE_ID=b.ID INNER JOIN STN_DECIDE c ON a.DECIDE_ID=c.ID WHERE a.STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T9Section4(this,'засах');\" data-target=\"#pTab1T9Section4Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T9Section4(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T9Datatable4 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T9Datatable4').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T9Datatable4) {responsiveHelper_profileTab1T9Datatable4 = new ResponsiveDatatablesHelper($('#profileTab1T9Datatable4'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T9Datatable4.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T9Datatable4.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,null,null,null,{ \"sWidth\": \"35px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab1T9Datatable5(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                strTableVal = "<table id=\"profileTab1T9Datatable5\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Ямар шагнал, цолоор шагнагдсан</th>";
                strTableVal += "<th>Шагнагдсан огноо</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ID, NAME, DT FROM ST_BONUS WHERE STAFFS_ID=" + staffid);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1T9Section5(this,'засах');\" data-target=\"#pTab1T9Section5Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1T9Section5(this);\"><i class=\"fa fa-trash-o\"></i></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_profileTab1T9Datatable5 = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#profileTab1T9Datatable5').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_profileTab1T9Datatable5) {responsiveHelper_profileTab1T9Datatable5 = new ResponsiveDatatablesHelper($('#profileTab1T9Datatable5'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_profileTab1T9Datatable5.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_profileTab1T9Datatable5.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,{ \"sWidth\": \"130px\" },{ \"sWidth\": \"35px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string profileTab2T7Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "";
                string straddedit = "0";
                if (myObjGetTableData.checkRoles(HttpContext.Current.Session["HRMIS_UserID"].ToString(), "1,15")) straddedit = "1";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT ROWNUM as ROWNO, a.* FROM ( SELECT b.ID, b.BRANCH_ID, a.DOMAIN_USER, b.MOVE_ID, b.POSTYPE_ID, b.POS_ID, b.RANK_ID, b.TUSHAALDATE, b.TUSHAALNO, b.DT, i.NAME as POSTYPE_NAME, f.NAME as POS_NAME, NVL(g.NAME,'-') as RANK_NAME, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, j.NAME||' - '||h.NAME as MOVE_NAME, NVL(b.DESCRIPTION,'-') as DESCRIPTION, b.ISACTIVE FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID LEFT JOIN ST_RANK g ON b.RANK_ID=g.ID INNER JOIN STN_MOVE h ON b.MOVE_ID=h.ID INNER JOIN STN_MOVETYPE j ON h.MOVETYPE_ID=j.ID INNER JOIN STN_POSTYPE i ON b.POSTYPE_ID=i.ID WHERE a.ID=" + staffid + " ORDER BY b.DT DESC ) a");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr data-id=\"" + dr["ID"].ToString() + "\" data-domainuser=\"" + dr["DOMAIN_USER"].ToString() + "\" data-tushaaldate=\"" + dr["TUSHAALDATE"].ToString() + "\" data-tushaalno=\"" + dr["TUSHAALNO"].ToString() + "\">";
                        strTableVal += "<td>" + dr["ROWNO"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DT"].ToString() + "</td>";
                        strTableVal += "<td data-id=\"" + dr["POSTYPE_ID"].ToString() + "\">" + dr["POSTYPE_NAME"].ToString() + "</td>";
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
                            if(dr["ISACTIVE"].ToString() == "0") strTableVal += "<button type=\"button\" class=\"btn btn-default btn-xs\" onclick=\"showDeleteTab2t7(this);\"><i class=\"fa fa-trash-o\"></i></button>";
                        }
                        strTableVal += "</div>";
                        strTableVal += "</td>";
                        strTableVal += "</tr>";
                    }
                }
                return strTableVal;
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
        //tomilolt
        public string tomiloltTab1ModalSelectstafflistForSelect2(string selectedList)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", isSelected = "", stroptgroup = "";
                string[] arrSelectedList = selectedList.Split(',');
                DataSet ds = myObj.OracleExecuteDataSet("SELECT f.ID as GAZAR_ID, f.INITNAME, a.ID as STAFF_ID, SUBSTR(a.LNAME,0,1)||'.'||SUBSTR(a.FNAME,1,1)||LOWER(SUBSTR(a.FNAME,2))||' | '||g.NAME as STAFF_NAME FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID INNER JOIN STN_POS g ON b.POS_ID=g.ID WHERE b.ISACTIVE=1 AND c.ACTIVE=1 ORDER BY f.SORT, g.SORT, a.LNAME, a.FNAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (selectedList != "none")
                        {
                            isSelected = "";
                            for (int i = 0; i < arrSelectedList.Length; i++)
                            {
                                if (arrSelectedList[i] == dr[2].ToString()) { isSelected = "selected=\"selected\""; break; }
                            }
                        }
                        if (stroptgroup != dr[0].ToString())
                        {
                            if (stroptgroup == "")
                            {
                                strTableVal += "<optgroup label=\"" + dr[1].ToString() + "\">";
                                strTableVal += "<option " + isSelected + " value=\"" + dr[2].ToString() + "\" title=\"" + dr[3].ToString() + "\">" + dr[3].ToString() + "</option>";
                            }
                            else
                            {
                                strTableVal += "</optgroup>";
                                strTableVal += "<optgroup label=\"" + dr[1].ToString() + "\">";
                                strTableVal += "<option " + isSelected + " value=\"" + dr[2].ToString() + "\" title=\"" + dr[3].ToString() + "\">" + dr[3].ToString() + "</option>";
                            }
                        }
                        else strTableVal += "<option " + isSelected + " value=\"" + dr[2].ToString() + "\" title=\"" + dr[3].ToString() + "\">" + dr[3].ToString() + "</option>";
                        stroptgroup = dr[0].ToString();
                    }
                }
                myObj.DBDisconnect();
                return strTableVal;
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
        public string tomiloltTab1Datatable(string type, string fromdate, string todate, string budget, string direction, string currstaffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (budget != "") budget = " AND a.TOMILOLTBUDGET_ID="+budget;
                if (direction != "") direction = " AND a.TOMILOLTDIRECTION_ID=" + direction;
                if (currstaffid != "") currstaffid = " AND b.STAFFS_ID=" + currstaffid;
                string strTableVal = "";
                strTableVal = "<table id=\"tomiloltTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">TOMILOLT_ID</th>";
                strTableVal += "<th>Чиглэл</th>";
                strTableVal += "<th>Зардал</th>";
                strTableVal += "<th>Эхэлсэн</th>";
                strTableVal += "<th>Дууссан</th>";
                strTableVal += "<th>Хоног</th>";
                if (type == "1") strTableVal += "<th>Аль улс</th><th>Ямар хот</th>";
                else if (type == "2") strTableVal += "<th>Аль аймаг, нийслэл</th><th>Ямар хот, сум, дүүрэг</th>";
                strTableVal += "<th>Сэдэв</th>";
                strTableVal += "<th>Нэрс</th>";
                strTableVal += "<th>Тушаал №</th>";
                strTableVal += "<th>Тушаал огноо</th>";
                strTableVal += "<th><i class=\"fa fa-fw fa-paperclip text-muted hidden-md hidden-sm hidden-xs\"></i> Тушаал</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">TOMILOLTDIRECTION_ID</th>";
                strTableVal += "<th class=\"hide\">TOMILOLTBUDGET_ID</th>";
                strTableVal += "<th class=\"hide\">STAFFLISTID</th>";
                strTableVal += "<th class=\"hide\">TUSHAALFILENAME</th>";
                strTableVal += "<th class=\"hide\">TOMILOLT_BUDGET_OTHER</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.TOMILOLT_ID, c.NAME as TOMILOLTDIRECTION_NAME, d.NAME as TOMILOLTBUDGET_NAME, b.FROMDATE, b.TODATE, b.DAYNUM, b.COUNTRYNAME, b.CITYNAME, b.SUBJECTNAME, a.STAFFLISTID, b.TUSHAALNO, b.TUSHAALDATE, b.TUSHAALFILENAME, b.TOMILOLTDIRECTION_ID, b.TOMILOLTBUDGET_ID, b.TOMILOLT_BUDGET_OTHER FROM ( SELECT a.TOMILOLT_ID, NVL(RTRIM(xmlagg (xmlelement (e, b.STAFFS_ID || ',')).extract('//text()'), ','),'none') as STAFFLISTID FROM ( SELECT a.ID as TOMILOLT_ID FROM ST_TOMILOLT a INNER JOIN ST_TOMILOLT_STAFFS b ON a.ID=b.TOMILOLT_ID INNER JOIN ST_STAFFS c ON b.STAFFS_ID=c.ID INNER JOIN ST_STBR d ON c.ID=d.STAFFS_ID INNER JOIN STN_POS f ON d.POS_ID=f.ID WHERE a.TOMILOLTYPE_ID=" + type + " AND TO_DATE(a.FROMDATE,'YYYY-MM-DD') BETWEEN TO_DATE('" + fromdate + "','YYYY-MM-DD') AND TO_DATE('" + todate + "','YYYY-MM-DD')" + budget + direction + currstaffid + " GROUP BY a.ID ) a INNER JOIN ST_TOMILOLT_STAFFS b ON a.TOMILOLT_ID=b.TOMILOLT_ID GROUP BY a.TOMILOLT_ID ) a INNER JOIN ST_TOMILOLT b ON a.TOMILOLT_ID=b.ID INNER JOIN STN_TOMILOLTDIRECTION c ON b.TOMILOLTDIRECTION_ID=c.ID INNER JOIN STN_TOMILOLTBUDGET d ON b.TOMILOLTBUDGET_ID=d.ID ORDER BY b.FROMDATE, b.TODATE");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/tomiloltStafflistModal.aspx?id=" + dr[0].ToString() + "\" data-toggle=\"modal\" data-target=\"#pTab1StafflistModal\"><i class=\"fa fa-group\"></i> Харах</a></td>";
                        strTableVal += "<td>" + dr[10].ToString() + "</td>";
                        strTableVal += "<td>" + dr[11].ToString() + "</td>";
                        if (dr[12].ToString() != "") strTableVal += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/tomiloltAttachshowModal.aspx?id=" + dr[0].ToString() + "\" data-toggle=\"modal\" data-target=\"#pTab1AttachshowModal\"><i class=\"fa fa-paperclip\"></i> Харах</a></td>";
                        else strTableVal += "<td></td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this,'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                        strTableVal += "<td>" + dr[13].ToString() + "</td>";
                        strTableVal += "<td>" + dr[14].ToString() + "</td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        strTableVal += "<td>" + dr[12].ToString() + "</td>";
                        strTableVal += "<td>" + dr["TOMILOLT_BUDGET_OTHER"].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_tomiloltTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#tomiloltTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_tomiloltTab1Datatable) {responsiveHelper_tomiloltTab1Datatable = new ResponsiveDatatablesHelper($('#tomiloltTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_tomiloltTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_tomiloltTab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,{ \"sWidth\": \"140px\" },{ \"sWidth\": \"62px\" },{ \"sWidth\": \"62px\" },{ \"sWidth\": \"37px\" },null,null,null,{ \"sWidth\": \"55px\" },{ \"sWidth\": \"65px\" },{ \"sWidth\": \"87px\" },{ \"sWidth\": \"67px\" },{ \"sWidth\": \"25px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string tomiloltTab2Datatable(string type, string fromdate, string todate, string budget, string direction, string isreport, string currstaffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (budget != "") budget = " AND a.TOMILOLTBUDGET_ID=" + budget;
                if (direction != "") direction = " AND a.TOMILOLTDIRECTION_ID=" + direction;
                if (isreport != "")
                    if (isreport == "1") isreport = " AND i.REPORTDATE is not null";
                    else if (isreport == "0") isreport = " AND i.REPORTDATE is null";
                if (currstaffid != "") currstaffid = " AND b.STAFFS_ID=" + currstaffid;
                string strTableVal = "";
                strTableVal = "<table id=\"tomiloltTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">TOMILOLT_ID</th>";
                strTableVal += "<th class=\"hide\">STAFFS_ID</th>";
                strTableVal += "<th>Овог, нэр</th>";
                strTableVal += "<th>Албан тушаал</th>";
                strTableVal += "<th>Чиглэл</th>";
                strTableVal += "<th>Сэдэв</th>";
                strTableVal += "<th>Хугацаа</th>";
                if (type == "1") strTableVal += "<th>Аль улс</th><th>Ямар хот</th>";
                else if (type == "2") strTableVal += "<th>Аль аймаг, нийслэл</th><th>Ямар хот, сум, дүүрэг</th>";
                strTableVal += "<th>Зардал</th>";
                strTableVal += "<th>Тушаалын №, огноо</th>";
                strTableVal += "<th><i class=\"fa fa-fw fa-paperclip text-muted hidden-md hidden-sm hidden-xs\"></i> Тайлан өгсөн эсэх</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID as TOMILOLT_ID, b.STAFFS_ID, c.LNAME||' '||c.FNAME as STAFF_NAME, f.NAME as POS_NAME, g.NAME as TOMILOLTDIRECTION_NAME, a.SUBJECTNAME, a.FROMDATE||' - '||a.TODATE as TM, a.COUNTRYNAME, a.CITYNAME, h.NAME as TOMILOLTBUDGET_NAME, a.TUSHAALNO||' - '||a.TUSHAALDATE as TUSHAAL, i.REPORTDATE, i.REPORTFILENAME FROM ST_TOMILOLT a INNER JOIN ST_TOMILOLT_STAFFS b ON a.ID=b.TOMILOLT_ID INNER JOIN ST_STAFFS c ON b.STAFFS_ID=c.ID INNER JOIN ST_STBR d ON c.ID=d.STAFFS_ID AND d.ISACTIVE = 1 INNER JOIN STN_POS f ON d.POS_ID=f.ID INNER JOIN STN_TOMILOLTDIRECTION g ON a.TOMILOLTDIRECTION_ID=g.ID INNER JOIN STN_TOMILOLTBUDGET h ON a.TOMILOLTBUDGET_ID=h.ID LEFT JOIN ST_TOMILOLT_REPORT i ON a.ID=i.TOMILOLT_ID AND b.STAFFS_ID=i.STAFFS_ID WHERE a.TOMILOLTYPE_ID=" + type + " AND TO_DATE(a.FROMDATE,'YYYY-MM-DD') BETWEEN TO_DATE('" + fromdate + "','YYYY-MM-DD') AND TO_DATE('" + todate + "','YYYY-MM-DD')" + budget + direction + isreport + currstaffid + " ORDER BY a.FROMDATE, a.TODATE, f.SORT, c.LNAME, c.FNAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        strTableVal += "<td>" + dr[10].ToString() + "</td>";
                        if (dr[11].ToString() != "") strTableVal += "<td>" + dr[11].ToString() + " <a class=\"btn btn-info btn-xs\" href=\"../files/tomilolttushaal/" + dr[12].ToString() + "\" download><i class=\"fa fa-paperclip\"></i> Татах</a></td>";
                        else strTableVal += "<td></td>";
                        strTableVal += "<td><a class=\"btn btn-info btn-xs\" href=\"javascript:void(0);\" onclick=\"showAddEditTab2(this);\" data-toggle=\"modal\" data-target=\"#pTab2Modal\"><i class=\"fa fa-plus\"></i> Оруулах</a></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_tomiloltTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#tomiloltTab2Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_tomiloltTab2Datatable) {responsiveHelper_tomiloltTab2Datatable = new ResponsiveDatatablesHelper($('#tomiloltTab2Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_tomiloltTab2Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_tomiloltTab2Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },null,null,null,null,{ \"sWidth\": \"145px\" },null,null,{ \"sWidth\": \"140px\" },{ \"sWidth\": \"130px\" },{ \"sWidth\": \"132px\" },{ \"sWidth\": \"69px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //setrole
        public string setroleTab1Datatable(string pos, string gazar, string heltes, string tp, string role)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (pos != "") pos = " AND b.POS_ID=" + pos;
                if (gazar != "") gazar = " AND c.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND b.BRANCH_ID=" + heltes;
                if (tp != "")
                {
                    if (tp.Split('-')[0] == "1") tp = " AND h.ACTIVE=1";
                    else if (tp.Split('-')[0] == "0") tp = " AND h.MOVETYPE_ID=" + tp.Split('-')[1];
                }
                if (role != "") role = " AND j.ROLE_ID=" + role;
                string strTableVal = "";
                strTableVal = "<table id=\"setroleTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th>Регистер</th>";
                strTableVal += "<th>Домайн нэр</th>";
                strTableVal += "<th>Нэгж</th>";
                strTableVal += "<th>Эцэг(эх)-н нэр</th>";
                strTableVal += "<th>Өөрийн нэр</th>";
                strTableVal += "<th>Албан тушаал</th>";
                strTableVal += "<th>Хүйс</th>";
                strTableVal += "<th>А/Т/Т</th>";
                strTableVal += "<th>Төлөв</th>";
                strTableVal += "<th>Олгосон эрх</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">ROLELISTID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID as STAFFS_ID, a.IMAGE, a.REGNO, a.DOMAIN_USER, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, a.LNAME, a.FNAME, f.NAME as POS_NAME, CASE WHEN a.GENDER=1 THEN 'Эр' ELSE 'Эм' END as GENDER, g.NAME as POSTYPE_NAME, CASE WHEN h.ACTIVE=1 AND h.SHOW=1 THEN TO_CHAR(h.NAME) WHEN h.ACTIVE=1 AND h.SHOW=0 THEN 'Идэвхтэй' ELSE REPLACE(REPLACE(TO_CHAR(i.NAME),'өлөөлөх','өлөөлөгдсөн'),'халах','халагдсан') END AS TP, h.COLOR, NVL(RTRIM(xmlagg (xmlelement (e, j.ROLE_ID || ',')).extract('//text()'), ','),'none') as ROLELISTID, NVL(RTRIM(xmlagg (xmlelement (e, ' '||k.NAME || ',')).extract('//text()'), ','),'none') as ROLELISTNAME FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID INNER JOIN STN_POSTYPE g ON b.POSTYPE_ID=g.ID INNER JOIN STN_MOVE h ON b.MOVE_ID=h.ID INNER JOIN STN_MOVETYPE i ON h.MOVETYPE_ID=i.ID LEFT JOIN ST_STAFFS_ROLE j ON a.ID=j.STAFFS_ID LEFT JOIN STN_ROLE k ON j.ROLE_ID=k.ID WHERE 1=1 " + pos + gazar + heltes + tp + role + " GROUP BY a.ID, a.IMAGE, a.REGNO, a.DOMAIN_USER, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END, a.LNAME, a.FNAME, f.NAME, CASE WHEN a.GENDER=1 THEN 'Эр' ELSE 'Эм' END, g.NAME, CASE WHEN h.ACTIVE=1 AND h.SHOW=1 THEN TO_CHAR(h.NAME) WHEN h.ACTIVE=1 AND h.SHOW=0 THEN 'Идэвхтэй' ELSE REPLACE(REPLACE(TO_CHAR(i.NAME),'өлөөлөх','өлөөлөгдсөн'),'халах','халагдсан') END, h.COLOR ORDER BY a.FNAME");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        if (dr[1].ToString() != "") strTableVal += "<td class=\"no-padding\" style=\"padding-left:5px!important;\"><img src=\"../files/staffs/" + dr[1].ToString() + "\" class=\"stafflistimage\"></td>";
                        else strTableVal += "<td class=\"no-padding\" style=\"padding-left:5px!important;\"><img src=\"../img/avatars/male.png\" class=\"stafflistimage\"></td>";
                        strTableVal += "<td><a class=\"btn btn-link btn-xs no-padding\" href=\"../#pg/profile.aspx?id=" + dr[0].ToString() + "\">" + dr[2].ToString() + "</a></td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        strTableVal += "<td><span class=\"label " + dr[11].ToString() + "\">" + dr[10].ToString() + "</span></td>";
                        if (dr[13].ToString() != "none") strTableVal += "<td>" + dr[13].ToString() + "</td>";
                        else strTableVal += "<td><i class=\"text-muted\">Мэдээлэл алга...</i></td>";
                        strTableVal += "<td><a style=\"cursor:pointer;\" onclick=\"showAddEditTab1(this);\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a></td>";
                        strTableVal += "<td>" + dr[12].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_setroleTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#setroleTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_setroleTab1Datatable) {responsiveHelper_setroleTab1Datatable = new ResponsiveDatatablesHelper($('#setroleTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_setroleTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_setroleTab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"10px\" },{ \"sWidth\": \"80px\" },{ \"sWidth\": \"80px\" },{ \"sWidth\": \"100px\" },null,null,null,{ \"sWidth\": \"30px\" },null,null,null,{ \"sWidth\": \"15px\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //chuluutime
        public string chuluutimeTab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", strIsBoss="0";
                if (checkRoles(currstaffid, "1")) strIsBoss = "1";
                else strIsBoss = myObj.OracleExecuteScalar("SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 WHERE b.POS_ID IN (2010201, 2010301) AND a.ID="+currstaffid).ToString();
                if (gazar != "") gazar = " AND d.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND c.BRANCH_ID=" + heltes;
                if (staffid != "") staffid = " AND a.STAFFS_ID=" + staffid;
                strTableVal = "<table id=\"chuluutimeTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Хүсэлт гаргагч, огноо</th>";
                strTableVal += "<th>Огноо</th>";
                strTableVal += "<th>Хугацаа</th>";
                strTableVal += "<th>Шалтгаан</th>";
                strTableVal += "<th>Цалинтай эсэх</th>";
                strTableVal += "<th>Тайлбар</th>";
                strTableVal += "<th>Зөв/эсэх</th>";
                strTableVal += "<th>Зөвшөөрсөн удирдлага, огноо</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">CHULUUREASON_ID</th>";
                strTableVal += "<th class=\"hide\">FINGER_ID</th>";
                strTableVal += "<th class=\"hide\">BEGONTM</th>";
                strTableVal += "<th class=\"hide\">ENDTM</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT 
    a.ID
    , NVL(b.IMAGE,'male.png') as IMAGE
    , SUBSTR(b.LNAME,0,1)||'.'||b.FNAME as STAFFNAME
    , CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||' - '||d.INITNAME END as NEGJ
    , g.NAME as POS_NAME
    , TO_CHAR(a.REQUESTDATE,'YYYY-MM-DD HH24:MM:SS'), a.DT, a.BEGINTM||'-'||a.ENDTM as TM
    , h.NAME as CHULUUREASON_NAME
    , CASE WHEN a.ISSALARY = 1 THEN 'Цалинтай' ELSE 'Цалингүй' END SALARY
    , a.DESCRIPTION
    , a.ISRECEIVED
    , TO_CHAR(a.RECEIVEDDATE,'YYYY-MM-DD HH24:MM:SS')
    , a.RECEIVED_STAFFS_ID
    , NVL(i.IMAGE,'male.png') as IMAGE
    , SUBSTR(i.LNAME,0,1)||'.'||i.FNAME as STAFFNAME
    , CASE WHEN k.ID=k.FATHER_ID THEN k.INITNAME ELSE l.INITNAME||' - '||k.INITNAME END as NEGJ
    , m.NAME as POS_NAME
    , a.CHULUUREASON_ID
    , a.STAFFS_ID
    , b.FINGERID
    , a.BEGINTM
    , a.ENDTM 
FROM ST_CHULUUTIME a 
INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID 
INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 
INNER JOIN ST_BRANCH d ON c.BRANCH_ID=d.ID 
INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID 
INNER JOIN STN_POS g ON c.POS_ID=g.ID 
INNER JOIN STN_CHULUUREASON h ON a.CHULUUREASON_ID=h.ID 
LEFT JOIN ST_STAFFS i ON a.RECEIVED_STAFFS_ID=i.ID 
LEFT JOIN ST_STBR j ON i.ID=j.STAFFS_ID AND j.ISACTIVE=1 
LEFT JOIN ST_BRANCH k ON j.BRANCH_ID=k.ID 
LEFT JOIN ST_BRANCH l ON k.FATHER_ID=l.ID 
LEFT JOIN STN_POS m ON j.POS_ID=m.ID 
WHERE TO_CHAR(TO_DATE(a.DT, 'YYYY-MM-DD'),'YYYY')=" + year + gazar + heltes + staffid + @" 
ORDER BY a.DT DESC, a.BEGINTM DESC, a.ENDTM DESC");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td><div style=\"float:left;\"><img src=\"../files/staffs/" + dr[1].ToString() + "\" class=\"stafflistimage\"></div><div style=\"float:left; margin-left:10px;\">" + dr[2].ToString() + "  <small class=\"text-muted\"><i>" + dr[5].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr[4].ToString() + " | " + dr[3].ToString() + "</small></div></td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        strTableVal += "<td>" + dr[10].ToString() + "</td>";
                        if (strIsBoss == "1")
                        {
                            if (dr[11].ToString() == "") strTableVal += "<td><select class=\"form-control input-sm\" style=\"padding:1px; border:1px solid #DDD; color:#555; background-color:#fff;\" onchange=\"saveReceive(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr[11].ToString() == "1") strTableVal += "<td><select class=\"form-control input-sm bg-color-greenLight\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceive(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr[11].ToString() == "0") strTableVal += "<td><select class=\"form-control input-sm bg-color-red\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceive(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Татгалзав</option></select></td>";
                        }
                        else
                        {
                            if (dr[11].ToString() == "") strTableVal += "<td><span class=\"label bg-color-blueLight\">Хариу өгөөгүй</span></td>";
                            else if (dr[11].ToString() == "1") strTableVal += "<td><span class=\"label bg-color-greenLight\">Зөвшөөрөв</span></td>";
                            else if (dr[11].ToString() == "0") strTableVal += "<td><span class=\"label bg-color-red\">Татгалзав</span></td>";
                        }
                        if (dr[11].ToString() == "") strTableVal += "<td></td>";
                        else strTableVal += "<td><div style=\"float:left;\"><img src=\"../files/staffs/" + dr[14].ToString() + "\" class=\"stafflistimage\"></div><div style=\"float:left; margin-left:10px;\">" + dr[15].ToString() + "  <small class=\"text-muted\"><i>" + dr[12].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr[16].ToString() + " | " + dr[17].ToString() + "</small></div></td>";
                        if (currstaffid == dr[19].ToString())
                        {
                            if (dr[11].ToString() != "") strTableVal += "<td></td>";
                            else strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this, 'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                        }
                        else strTableVal += "<td></td>";
                        strTableVal += "<td>" + dr[18].ToString() + "</td>";
                        strTableVal += "<td>" + dr[20].ToString() + "</td>";
                        strTableVal += "<td>" + dr[21].ToString() + "</td>";
                        strTableVal += "<td>" + dr[22].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_chuluutimeTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#chuluutimeTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_chuluutimeTab1Datatable) {responsiveHelper_chuluutimeTab1Datatable = new ResponsiveDatatablesHelper($('#chuluutimeTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_chuluutimeTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_chuluutimeTab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,{ \"sWidth\": \"70px\" },{ \"sWidth\": \"70px\" },null,{ \"sWidth\": \"95px\" },null,{ \"sWidth\": \"95px\" },null,{ \"sWidth\": \"30px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //chuluudayt2
        public string chuluudayt2Tab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", strIsBoss = "0";
                if (checkRoles(currstaffid, "1")) strIsBoss = "1";
                else strIsBoss = myObj.OracleExecuteScalar("SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 WHERE b.POS_ID IN (2010201, 2010301) AND a.ID=" + currstaffid).ToString();
                if (gazar != "") gazar = " AND d.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND c.BRANCH_ID=" + heltes;
                if (staffid != "") staffid = " AND a.STAFFS_ID=" + staffid;
                strTableVal = "<table id=\"chuluudayt2Tab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Хүсэлт гаргагч, огноо</th>";
                strTableVal += "<th>Хугацаа</th>";
                strTableVal += "<th>Шалтгаан</th>";
                strTableVal += "<th>Цалинтай эсэх</th>";
                strTableVal += "<th>Тайлбар</th>";
                strTableVal += "<th>Зөв/эсэх</th>";
                strTableVal += "<th>Зөвшөөрсөн удирдлага, огноо</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">CHULUUREASON_ID</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, NVL(b.IMAGE,'male.png') as IMAGE, SUBSTR(b.LNAME,0,1)||'.'||b.FNAME as STAFFNAME, CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||' - '||d.INITNAME END as NEGJ,g.NAME as POS_NAME, TO_CHAR(a.REQUESTDATE,'YYYY-MM-DD HH24:MM:SS'), a.BEGINDT||'<br>'||a.ENDDT as TM, h.NAME as CHULUUREASON_NAME, CASE WHEN a.ISSALARY = 1 THEN 'Цалинтай' ELSE 'Цалингүй' END SALARY, a.DESCRIPTION, a.ISRECEIVED, TO_CHAR(a.RECEIVEDDATE,'YYYY-MM-DD HH24:MM:SS'), a.RECEIVED_STAFFS_ID, NVL(i.IMAGE,'male.png') as IMAGE, SUBSTR(i.LNAME,0,1)||'.'||i.FNAME as STAFFNAME, CASE WHEN k.ID=k.FATHER_ID THEN k.INITNAME ELSE l.INITNAME||' - '||k.INITNAME END as NEGJ, m.NAME as POS_NAME, a.CHULUUREASON_ID, a.STAFFS_ID FROM ST_CHULUUDAYT2 a INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 INNER JOIN ST_BRANCH d ON c.BRANCH_ID=d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID INNER JOIN STN_POS g ON c.POS_ID=g.ID INNER JOIN STN_CHULUUREASON h ON a.CHULUUREASON_ID=h.ID LEFT JOIN ST_STAFFS i ON a.RECEIVED_STAFFS_ID=i.ID LEFT JOIN ST_STBR j ON i.ID=j.STAFFS_ID AND j.ISACTIVE=1 LEFT JOIN ST_BRANCH k ON j.BRANCH_ID=k.ID LEFT JOIN ST_BRANCH l ON k.FATHER_ID=l.ID LEFT JOIN STN_POS m ON j.POS_ID=m.ID WHERE TO_CHAR(TO_DATE(a.BEGINDT, 'YYYY-MM-DD'),'YYYY')="+year + gazar + heltes + staffid + " ORDER BY a.BEGINDT, a.ENDDT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td><div style=\"float:left;\"><img src=\"../files/staffs/" + dr[1].ToString() + "\" class=\"stafflistimage\"></div><div style=\"float:left; margin-left:10px;\">" + dr[2].ToString() + "  <small class=\"text-muted\"><i>" + dr[5].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr[4].ToString() + " | " + dr[3].ToString() + "</small></div></td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        if (strIsBoss == "1")
                        {
                            if (dr[10].ToString() == "") strTableVal += "<td><select class=\"form-control input-sm\" style=\"padding:1px; border:1px solid #DDD; color:#555; background-color:#fff;\" onchange=\"saveReceive(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr[10].ToString() == "1") strTableVal += "<td><select class=\"form-control input-sm bg-color-greenLight\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceive(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr[10].ToString() == "0") strTableVal += "<td><select class=\"form-control input-sm bg-color-red\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceive(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Татгалзав</option></select></td>";
                        }
                        else
                        {
                            if (dr[10].ToString() == "") strTableVal += "<td><span class=\"label bg-color-blueLight\">Хариу өгөөгүй</span></td>";
                            else if (dr[10].ToString() == "1") strTableVal += "<td><span class=\"label bg-color-greenLight\">Зөвшөөрөв</span></td>";
                            else if (dr[10].ToString() == "0") strTableVal += "<td><span class=\"label bg-color-red\">Татгалзав</span></td>";
                        }
                        if (dr[10].ToString() == "") strTableVal += "<td></td>";
                        else strTableVal += "<td><div style=\"float:left;\"><img src=\"../files/staffs/" + dr[13].ToString() + "\" class=\"stafflistimage\"></div><div style=\"float:left; margin-left:10px;\">" + dr[14].ToString() + "  <small class=\"text-muted\"><i>" + dr[11].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr[15].ToString() + " | " + dr[16].ToString() + "</small></div></td>";
                        if (currstaffid == dr[18].ToString())
                        {
                            if (dr[10].ToString() == "") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this, 'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                            else strTableVal += "<td></td>";
                        }
                        else strTableVal += "<td></td>";
                        strTableVal += "<td>" + dr[17].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_chuluudayt2Tab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#chuluudayt2Tab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_chuluudayt2Tab1Datatable) {responsiveHelper_chuluudayt2Tab1Datatable = new ResponsiveDatatablesHelper($('#chuluudayt2Tab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_chuluudayt2Tab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_chuluudayt2Tab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,{ \"sWidth\": \"70px\" },{ \"sWidth\": \"70px\" },{ \"sWidth\": \"95px\" },null,{ \"sWidth\": \"95px\" },null,{ \"sWidth\": \"30px\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //chuluudayf3
        public string chuluudayf3Tab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", strIsBoss = "0";
                if (checkRoles(currstaffid, "1,6")) strIsBoss = "1";
                if (gazar != "") gazar = " AND d.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND c.BRANCH_ID=" + heltes;
                if (staffid != "") staffid = " AND a.STAFFS_ID=" + staffid;
                strTableVal = "<table id=\"chuluudayf3Tab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Чөлөө хүсэгч</th>";
                strTableVal += "<th>Хугацаа</th>";
                strTableVal += "<th>Шалтгаан</th>";
                strTableVal += "<th>Цалинтай эсэх</th>";
                strTableVal += "<th>Тайлбар</th>";
                strTableVal += "<th><i class=\"fa fa-fw fa-paperclip text-muted hidden-md hidden-sm hidden-xs\"></i></th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "<th class=\"hide\">GAZAR_ID</th>";
                strTableVal += "<th class=\"hide\">HELTES_ID</th>";
                strTableVal += "<th class=\"hide\">STAFF_ID</th>";
                strTableVal += "<th class=\"hide\">CHULUUREASON_ID</th>";
                strTableVal += "<th class=\"hide\">FILENAME</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, NVL(b.IMAGE,'male.png') as IMAGE, SUBSTR(b.LNAME,0,1)||'.'||b.FNAME as STAFFNAME, CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||' - '||d.INITNAME END as NEGJ,g.NAME as POS_NAME, a.BEGINDT||'<br>'||a.ENDDT as TM, h.NAME as CHULUUREASON_NAME, CASE WHEN a.ISSALARY = 1 THEN 'Цалинтай' ELSE 'Цалингүй' END SALARY, a.DESCRIPTION, d.FATHER_ID, c.BRANCH_ID, a.STAFFS_ID, a.CHULUUREASON_ID, a.FILENAME FROM ST_CHULUUDAYF3 a INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 INNER JOIN ST_BRANCH d ON c.BRANCH_ID=d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID INNER JOIN STN_POS g ON c.POS_ID=g.ID INNER JOIN STN_CHULUUREASON h ON a.CHULUUREASON_ID=h.ID WHERE TO_CHAR(TO_DATE(a.BEGINDT, 'YYYY-MM-DD'),'YYYY')=" + year + gazar + heltes + staffid + " ORDER BY a.BEGINDT, a.ENDDT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td><div style=\"float:left;\"><img src=\"../files/staffs/" + dr[1].ToString() + "\" class=\"stafflistimage\"></div><div style=\"float:left; margin-left:10px;\">" + dr[2].ToString() + "<br /><small class=\"text-muted\">" + dr[4].ToString() + " | " + dr[3].ToString() + "</small></div></td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        if (dr[13].ToString() != "") strTableVal += "<td><a class=\"btn btn-info btn-xs\" href=\"../pg/chuluuf3AttachshowModal.aspx?id=" + dr[0].ToString() + "\" data-toggle=\"modal\" data-target=\"#pTab1AttachshowModal\"><i class=\"fa fa-paperclip\"></i> Харах</a></td>";
                        else strTableVal += "<td></td>";
                        if (strIsBoss == "1") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this, 'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                        else strTableVal += "<td></td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        strTableVal += "<td>" + dr[10].ToString() + "</td>";
                        strTableVal += "<td>" + dr[11].ToString() + "</td>";
                        strTableVal += "<td>" + dr[12].ToString() + "</td>";
                        strTableVal += "<td>" + dr[13].ToString() + "</td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_chuluudayf3Tab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#chuluudayf3Tab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_chuluudayf3Tab1Datatable) {responsiveHelper_chuluudayf3Tab1Datatable = new ResponsiveDatatablesHelper($('#chuluudayf3Tab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_chuluudayf3Tab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_chuluudayf3Tab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,{ \"sWidth\": \"70px\" },null,{ \"sWidth\": \"95px\" },null,{ \"sWidth\": \"67px\" },{ \"sWidth\": \"30px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //chuluusick
        public string chuluusickTab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", strIsBoss = "0";
                if (checkRoles(currstaffid, "1,8")) strIsBoss = "1";
                if (gazar != "") gazar = " AND d.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND c.BRANCH_ID=" + heltes;
                if (staffid != "") staffid = " AND a.STAFFS_ID=" + staffid;
                strTableVal = "<table id=\"chuluusickTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th>Чөлөө хүсэгч</th>";
                strTableVal += "<th>Хугацаа</th>";
                strTableVal += "<th>Төрөл</th>";
                strTableVal += "<th>Тайлбар</th>";
                strTableVal += "<th><i class=\"fa fa-fw fa-paperclip text-muted hidden-md hidden-sm hidden-xs\"></i></th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT a.ID, NVL(b.IMAGE,'male.png') as IMAGE, SUBSTR(b.LNAME,0,1)||'.'||b.FNAME as STAFFNAME, CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||' - '||d.INITNAME END as NEGJ, g.NAME as POS_NAME, a.BEGINDT||'<br>'||a.ENDDT as TM, h.NAME as CHULUUSICKTYPE_NAME, a.DESCRIPTION, d.FATHER_ID, c.BRANCH_ID, a.STAFFS_ID, a.CHULUUSICKTYPE_ID, a.FILENAME FROM ST_CHULUUSICK a INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 INNER JOIN ST_BRANCH d ON c.BRANCH_ID=d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID INNER JOIN STN_POS g ON c.POS_ID=g.ID INNER JOIN STN_CHULUUSICKTYPE h ON a.CHULUUSICKTYPE_ID=h.ID WHERE TO_CHAR(TO_DATE(a.BEGINDT, 'YYYY-MM-DD'),'YYYY')=" + year + gazar + heltes + staffid + " ORDER BY a.BEGINDT, a.ENDDT");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr data-id=\"" + dr["ID"].ToString() + "\">";
                        strTableVal += "<td data-staffid=\"" + dr["STAFFS_ID"].ToString() + "\" data-gazarid=\"" + dr["FATHER_ID"].ToString() + "\" data-heltesid=\"" + dr["BRANCH_ID"].ToString() + "\"><div style=\"float:left;\"><img src=\"../files/staffs/" + dr["IMAGE"].ToString() + "\" class=\"stafflistimage\"></div><div style=\"float:left; margin-left:10px;\">" + dr["STAFFNAME"].ToString() + "<br /><small class=\"text-muted\">" + dr["POS_NAME"].ToString() + " | " + dr["NEGJ"].ToString() + "</small></div></td>";
                        strTableVal += "<td>" + dr["TM"].ToString() + "</td>";
                        strTableVal += "<td data-id=\"" + dr["CHULUUSICKTYPE_ID"].ToString() + "\">" + dr["CHULUUSICKTYPE_NAME"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DESCRIPTION"].ToString() + "</td>";
                        strTableVal += "<td data-filename=\"" + dr["FILENAME"].ToString() + "\">";
                        if (dr["FILENAME"].ToString() != "") strTableVal += "<a class=\"btn btn-info btn-xs\" href=\"../pg/chuluusickAttachshowModal.aspx?id=" + dr["ID"].ToString() + "\" data-toggle=\"modal\" data-target=\"#pTab1AttachshowModal\"><i class=\"fa fa-paperclip\"></i> Харах</a>";
                        strTableVal += "</td>";
                        strTableVal += "<td>";
                        if (strIsBoss == "1") strTableVal += "<a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this, 'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a>";
                        strTableVal += "</td>";
                        strTableVal += "</tr>";
                    }
                }
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_chuluusickTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#chuluusickTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_chuluusickTab1Datatable) {responsiveHelper_chuluusickTab1Datatable = new ResponsiveDatatablesHelper($('#chuluusickTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_chuluusickTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_chuluusickTab1Datatable.respond();}, \"aoColumns\": [null,{ \"sWidth\": \"70px\" },{ \"sWidth\": \"50px\" },null,{ \"sWidth\": \"67px\" },{ \"sWidth\": \"30px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //celebday
        public string celebdayTab1Datatable(string currstaffid)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", strIsBoss = "0";
                if (checkRoles(currstaffid, "1,5")) strIsBoss = "1";
                strTableVal = "<table id=\"celebdayTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th>Сар</th>";
                strTableVal += "<th>Өдөр</th>";
                strTableVal += "<th>Нэр</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT HOLMONTH, HOLDAY, NAME FROM ST_HOLIDAYOFFICIAL ORDER BY HOLMONTH, HOLDAY");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        if (strIsBoss == "1") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this, 'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                        else strTableVal += "<td></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_celebdayTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#celebdayTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_celebdayTab1Datatable) {responsiveHelper_celebdayTab1Datatable = new ResponsiveDatatablesHelper($('#celebdayTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_celebdayTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_celebdayTab1Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"25px\" },{ \"sWidth\": \"35px\" },null,{ \"sWidth\": \"30px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string celebdayTab2Datatable(string currstaffid, string yr)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", strIsBoss = "0";
                if (checkRoles(currstaffid, "1,5")) strIsBoss = "1";
                strTableVal = "<table id=\"celebdayTab2Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th>Огноо</th>";
                strTableVal += "<th>Нэр</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT HOLDATE, NAME FROM ST_HOLIDAYUNOFFICIAL WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'YYYY'))=" + yr + " ORDER BY HOLDATE");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        if (strIsBoss == "1") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab2(this, 'засах');\" data-target=\"#pTab2Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab2(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                        else strTableVal += "<td></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_celebdayTab2Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#celebdayTab2Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_celebdayTab2Datatable) {responsiveHelper_celebdayTab2Datatable = new ResponsiveDatatablesHelper($('#celebdayTab2Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_celebdayTab2Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_celebdayTab2Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"100px\" },null,{ \"sWidth\": \"30px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        public string celebdayTab3Datatable(string currstaffid, string yr)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string strTableVal = "", strIsBoss = "0";
                if (checkRoles(currstaffid, "1,5")) strIsBoss = "1";
                strTableVal = "<table id=\"celebdayTab3Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th>Огноо</th>";
                strTableVal += "<th>Нэр</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet("SELECT HOLDATE, NAME FROM ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE,'YYYY-MM-DD'),'YYYY'))=" + yr + " ORDER BY HOLDATE");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        if (strIsBoss == "1") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab3(this, 'засах');\" data-target=\"#pTab3Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab3(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                        else strTableVal += "<td></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_celebdayTab3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#celebdayTab3Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_celebdayTab3Datatable) {responsiveHelper_celebdayTab3Datatable = new ResponsiveDatatablesHelper($('#celebdayTab3Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_celebdayTab3Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_celebdayTab3Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"100px\" },null,{ \"sWidth\": \"30px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //amralt
        public string amraltTab1Datatable(string currstaffid, string gazar, string heltes, string staffid, string yr)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
               
                string strTableVal = "", strIsBossHeltes = "0", strIsBossGazar = "0", strIsBossTz = "0";
                string strYr = "";
                strYr = yr;
                if (checkRoles(currstaffid, "1"))
                {
                    strIsBossHeltes = "1";
                    strIsBossGazar = "1";
                    strIsBossTz = "1";
                }
                else {
                    strIsBossHeltes = myObj.OracleExecuteScalar("SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 WHERE b.POS_ID IN (2010301) AND a.ID=" + currstaffid).ToString();
                    strIsBossGazar = myObj.OracleExecuteScalar("SELECT CASE WHEN COUNT(1)>0 THEN 1 ELSE 0 END as CNT FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 WHERE b.POS_ID IN (2010201) AND a.ID=" + currstaffid).ToString();
                    if (checkRoles(currstaffid, "7")) strIsBossTz = "1";
                }                
                if (gazar != "") gazar = " AND d.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND c.BRANCH_ID=" + heltes;
                if (staffid != "") staffid = " AND a.STAFFS_ID=" + staffid;
                if (yr != "") yr = " AND TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'YYYY'))=" + yr;
                strTableVal = "<table id=\"amraltTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th class=\"hide\">ID</th>";
                strTableVal += "<th>Хүсэлт гаргагч, огноо</th>";
                strTableVal += "<th>Хугацаа</th>";
                strTableVal += "<th>Хо</th>";
                strTableVal += "<th>Биеэр эдлэх</th>";
                strTableVal += "<th>Тайлбар</th>";
                strTableVal += "<th>Хэлтсийн түвшинд<br>зөвшөөрсөн эсэх</th>";
                strTableVal += "<th>Хэлтсийн түвшинд<br>зөвшөөрсөн удирдлага, огноо</th>";
                strTableVal += "<th>Газрын түвшинд<br>зөвшөөрсөн эсэх</th>";
                strTableVal += "<th>Газрын түвшинд<br>зөвшөөрсөн удирдлага, огноо</th>";
                strTableVal += "<th>ТЗ<br>зөвшөөрсөн эсэх</th>";
                strTableVal += "<th>ТЗ<br>зөвшөөрсөн, огноо</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                string sql = @"SELECT a.ID, NVL(b.IMAGE,'male.png') as IMAGE, SUBSTR(b.LNAME,0,1)||'.'||b.FNAME as STAFFNAME, CASE WHEN d.ID=d.FATHER_ID THEN d.INITNAME ELSE f.INITNAME||' - '||d.INITNAME END as NEGJ,g.NAME as POS_NAME, TO_CHAR(a.REQUESTDATE,'YYYY-MM-DD HH24:MM:SS') as REQUESTDATE, a.BEGINDT||'<br>'||a.ENDDT as TM, (TRUNC(TO_DATE(a.ENDDT,'YYYY-MM-DD')) - TRUNC(TO_DATE(a.BEGINDT,'YYYY-MM-DD')) ) +1 - ((((TRUNC(TO_DATE(a.ENDDT,'YYYY-MM-DD'),'D'))-(TRUNC(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'D')))/7)*2) - (CASE WHEN TO_CHAR(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'DY','nls_date_language=english')='SUN' THEN 1 ELSE 0 END) - (CASE WHEN TO_CHAR(TO_DATE(a.ENDDT,'YYYY-MM-DD'),'DY','nls_date_language=english')='SAT' THEN 1 ELSE 0 END) as BusinessDays, CASE WHEN a.ISBODY = 1 THEN 'Биеэр эдлэнэ' ELSE 'Биеэр эдлэхгүй' END ISBODY, a.DESCRIPTION, a.HELTESISRECEIVED, TO_CHAR(a.HELTESRECEIVEDATE,'YYYY-MM-DD HH24:MM:SS') as HELTESISRECEIVEDATE, a.HELTESRECEIVESTAFFID, NVL(bb.IMAGE,'male.png') as HELTESIMAGE, SUBSTR(bb.LNAME,0,1)||'.'||bb.FNAME as HELTESSTAFFNAME, CASE WHEN dd.ID=dd.FATHER_ID THEN dd.INITNAME ELSE ff.INITNAME||' - '||dd.INITNAME END as HELTESNEGJ, gg.NAME as HELTESPOSNAME, a.GAZARISRECEIVED, TO_CHAR(a.GAZARRECEIVEDATE,'YYYY-MM-DD HH24:MM:SS') as GAZARISRECEIVEDATE, a.GAZARRECEIVESTAFFID, NVL(bbb.IMAGE,'male.png') as GAZARIMAGE, SUBSTR(bbb.LNAME,0,1)||'.'||bbb.FNAME as GAZARSTAFFNAME, CASE WHEN ddd.ID=ddd.FATHER_ID THEN ddd.INITNAME ELSE fff.INITNAME||' - '||ddd.INITNAME END as GAZARNEGJ, ggg.NAME as GAZARPOSNAME, a.TZISRECEIVED, TO_CHAR(a.TZRECEIVEDATE,'YYYY-MM-DD HH24:MM:SS') as TZISRECEIVEDATE, a.TZRECEIVESTAFFID, NVL(bbbb.IMAGE,'male.png') as TZIMAGE, SUBSTR(bbbb.LNAME,0,1)||'.'||bbbb.FNAME as TZSTAFFNAME, CASE WHEN dddd.ID=dddd.FATHER_ID THEN dddd.INITNAME ELSE ffff.INITNAME||' - '||dddd.INITNAME END as TZNEGJ, gggg.NAME as TZPOSNAME, a.STAFFS_ID, h.AMRALTDAY FROM ST_AMRALT a INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID AND c.ISACTIVE=1 INNER JOIN ST_BRANCH d ON c.BRANCH_ID=d.ID INNER JOIN ST_BRANCH f ON d.FATHER_ID=f.ID INNER JOIN STN_POS g ON c.POS_ID=g.ID LEFT JOIN ST_STAFFS bb ON a.HELTESRECEIVESTAFFID=bb.ID LEFT JOIN ST_STBR cc ON bb.ID=cc.STAFFS_ID AND cc.ISACTIVE=1 LEFT JOIN ST_BRANCH dd ON cc.BRANCH_ID=dd.ID LEFT JOIN ST_BRANCH ff ON dd.FATHER_ID=ff.ID LEFT JOIN STN_POS gg ON cc.POS_ID=gg.ID LEFT JOIN ST_STAFFS bbb ON a.GAZARRECEIVESTAFFID=bbb.ID LEFT JOIN ST_STBR ccc ON bbb.ID=ccc.STAFFS_ID AND ccc.ISACTIVE=1 LEFT JOIN ST_BRANCH ddd ON ccc.BRANCH_ID=ddd.ID LEFT JOIN ST_BRANCH fff ON ddd.FATHER_ID=fff.ID LEFT JOIN STN_POS ggg ON ccc.POS_ID=ggg.ID LEFT JOIN ST_STAFFS bbbb ON a.TZRECEIVESTAFFID=bbbb.ID LEFT JOIN ST_STBR cccc ON bbbb.ID=cccc.STAFFS_ID AND cccc.ISACTIVE=1 LEFT JOIN ST_BRANCH dddd ON cccc.BRANCH_ID=dddd.ID LEFT JOIN ST_BRANCH ffff ON dddd.FATHER_ID=ffff.ID LEFT JOIN STN_POS gggg ON cccc.POS_ID=gggg.ID LEFT JOIN ( SELECT 
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
          SELECT(TO_DATE('" + strYr + @"-1-01', 'yyyy-mm-dd') - 1) + ROWNUM DT
          FROM DUAL
          CONNECT BY LEVEL <= (LAST_DAY(TO_DATE('" + strYr + @"-12-01', 'yyyy-mm-dd')) + 1) - TO_DATE('" + strYr + @"-1-01', 'yyyy-mm-dd')
        )
        WHERE MOD(TO_CHAR(DT, 'J'), 7) + 1 IN(1, 2, 3, 4, 5)
        UNION ALL
        SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT FROM hrdbuser.ST_HOLIDAYISWORK WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + strYr + @"
      )
      GROUP BY DT
    ) a
    LEFT JOIN (
      SELECT DT
      FROM (
        SELECT TO_DATE('" + strYr + @"-' || HOLMONTH || '-' || HOLDAY, 'YYYY-MM-DD') as DT
        FROM hrdbuser.ST_HOLIDAYOFFICIAL
        UNION ALL
        SELECT TO_DATE(HOLDATE, 'YYYY-MM-DD') as DT
        FROM hrdbuser.ST_HOLIDAYUNOFFICIAL
        WHERE TO_NUMBER(TO_CHAR(TO_DATE(HOLDATE, 'YYYY-MM-DD'), 'YYYY')) = " + strYr + @"
      ) 
      GROUP BY DT
    ) b ON a.DT=b.DT
    WHERE b.DT IS NULL
  ) b ON TO_DATE(a.BEGINDT, 'yyyy-mm-dd') <= b.DT AND TO_DATE(a.ENDDT, 'yyyy-mm-dd') >= b.DT
  WHERE TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDT,'YYYY-MM-DD'),'YYYY'))=" + strYr + @" 
  ORDER BY a.STAFFS_ID, b.DT
) a
GROUP BY a.STAFFS_ID ) h ON a.STAFFS_ID=h.STAFFS_ID WHERE 1=1" + gazar + heltes + staffid + yr + @" ORDER BY a.BEGINDT, a.ENDDT";
                DataSet ds = myObj.OracleExecuteDataSet(sql);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td class=\"hide\">" + dr["ID"].ToString() + "</td>";
                        strTableVal += "<td>";
                        strTableVal += "<table><tbody><tr><td><img src=\"../files/staffs/" + dr["IMAGE"].ToString() + "\" class=\"stafflistimage\"></td><td>" + dr["STAFFNAME"].ToString() + "  <small class=\"text-muted\"><i>" + dr["REQUESTDATE"].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr["POS_NAME"].ToString() + " | " + dr["NEGJ"].ToString() + "</small></td></tbody></table>";
                        strTableVal += "</td>";
                        strTableVal += "<td>" + dr["TM"].ToString() + "</td>";
                        //strTableVal += "<td>" + dr["BUSINESSDAYS"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["AMRALTDAY"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["ISBODY"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["DESCRIPTION"].ToString() + "</td>";
                        //heltes
                        if (strIsBossHeltes == "1")
                        {
                            //if (dr["NEGJ"].ToString().Split('-')[0].Trim() != dr["NEGJ"].ToString().Split('-')[1].Trim())
                            //{
                            //    if (dr["HELTESISRECEIVED"].ToString() == "") strTableVal += "<td><select class=\"form-control input-sm\" style=\"padding:1px; border:1px solid #DDD; color:#555; background-color:#fff;\" onchange=\"saveReceiveHeltes(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            //    else if (dr["HELTESISRECEIVED"].ToString() == "1") strTableVal += "<td><select class=\"form-control input-sm bg-color-greenLight\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveHeltes(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            //    else if (dr["HELTESISRECEIVED"].ToString() == "0") strTableVal += "<td><select class=\"form-control input-sm bg-color-red\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveHeltes(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Татгалзав</option></select></td>";
                            //}
                            //else strTableVal += "<td></td>";
                            if (dr["NEGJ"].ToString().Split('-')[0].Length>1)
                            {
                                if (dr["HELTESISRECEIVED"].ToString() == "") strTableVal += "<td><select class=\"form-control input-sm\" style=\"padding:1px; border:1px solid #DDD; color:#555; background-color:#fff;\" onchange=\"saveReceiveHeltes(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                                else if (dr["HELTESISRECEIVED"].ToString() == "1") strTableVal += "<td><select class=\"form-control input-sm bg-color-greenLight\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveHeltes(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                                else if (dr["HELTESISRECEIVED"].ToString() == "0") strTableVal += "<td><select class=\"form-control input-sm bg-color-red\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveHeltes(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Татгалзав</option></select></td>";
                            }
                            else strTableVal += "<td></td>";
                        }
                        else
                        {
                            if (dr["NEGJ"].ToString().Split('-')[0].Length > 1)
                            {
                                if (dr["HELTESISRECEIVED"].ToString() == "") strTableVal += "<td><span class=\"label bg-color-blueLight\">Хариу өгөөгүй</span></td>";
                                else if (dr["HELTESISRECEIVED"].ToString() == "1") strTableVal += "<td><span class=\"label bg-color-greenLight\">Зөвшөөрөв</span></td>";
                                else if (dr["HELTESISRECEIVED"].ToString() == "0") strTableVal += "<td><span class=\"label bg-color-red\">Зөвшөөрөв</span></td>";
                            }
                            else strTableVal += "<td></td>";

                        }
                        if (dr["HELTESISRECEIVED"].ToString() == "") strTableVal += "<td></td>";
                        else
                        {
                            strTableVal += "<td>";
                            strTableVal += "<table><tbody><tr><td><img src=\"../files/staffs/" + dr["HELTESIMAGE"].ToString() + "\" class=\"stafflistimage\"></td><td>" + dr["HELTESSTAFFNAME"].ToString() + "  <small class=\"text-muted\"><i>" + dr["HELTESISRECEIVEDATE"].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr["HELTESNEGJ"].ToString() + " | " + dr["HELTESPOSNAME"].ToString() + "</small></td></tbody></table>";
                            strTableVal += "</td>";
                        }
                        //gazar
                        if (strIsBossGazar == "1")
                        {
                            if (dr["GAZARISRECEIVED"].ToString() == "") strTableVal += "<td><select class=\"form-control input-sm\" style=\"padding:1px; border:1px solid #DDD; color:#555; background-color:#fff;\" onchange=\"saveReceiveGazar(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr["GAZARISRECEIVED"].ToString() == "1") strTableVal += "<td><select class=\"form-control input-sm bg-color-greenLight\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveGazar(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr["GAZARISRECEIVED"].ToString() == "0") strTableVal += "<td><select class=\"form-control input-sm bg-color-red\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveGazar(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Татгалзав</option></select></td>";
                        }
                        else
                        {
                            if (dr["GAZARISRECEIVED"].ToString() == "") strTableVal += "<td><span class=\"label bg-color-blueLight\">Хариу өгөөгүй</span></td>";
                            else if (dr["GAZARISRECEIVED"].ToString() == "1") strTableVal += "<td><span class=\"label bg-color-greenLight\">Зөвшөөрөв</span></td>";
                            else if (dr["GAZARISRECEIVED"].ToString() == "0") strTableVal += "<td><span class=\"label bg-color-red\">Татгалзав</span></td>";

                        }
                        if (dr["GAZARISRECEIVED"].ToString() == "") strTableVal += "<td></td>";
                        else
                        {
                            strTableVal += "<td>";
                            strTableVal += "<table><tbody><tr><td><img src=\"../files/staffs/" + dr["GAZARIMAGE"].ToString() + "\" class=\"stafflistimage\"></td><td>" + dr["GAZARSTAFFNAME"].ToString() + "  <small class=\"text-muted\"><i>" + dr["GAZARISRECEIVEDATE"].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr["GAZARNEGJ"].ToString() + " | " + dr["GAZARPOSNAME"].ToString() + "</small></td></tbody></table>";
                            strTableVal += "</td>";
                        }
                        //tz
                        if (strIsBossTz == "1")
                        {
                            if (dr["TZISRECEIVED"].ToString() == "") strTableVal += "<td><select class=\"form-control input-sm\" style=\"padding:1px; border:1px solid #DDD; color:#555; background-color:#fff;\" onchange=\"saveReceiveTz(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr["TZISRECEIVED"].ToString() == "1") strTableVal += "<td><select class=\"form-control input-sm bg-color-greenLight\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveTz(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\">Татгалзав</option></select></td>";
                            else if (dr["TZISRECEIVED"].ToString() == "0") strTableVal += "<td><select class=\"form-control input-sm bg-color-red\" style=\"padding:1px; border:none; color:#fff;\" onchange=\"saveReceiveTz(this)\"><option value=\"\" style=\"color:#555; background-color:#fff;\">- Сонго -</option><option value=\"1\" class=\"bg-color-greenLight\" style=\"color:#fff; font-weight:bold;\">Зөвшөөрөв</option><option value=\"0\" class=\"bg-color-red\" style=\"color:#fff; font-weight:bold;\" selected=\"selected\">Татгалзав</option></select></td>";
                        }
                        else
                        {
                            if (dr["TZISRECEIVED"].ToString() == "") strTableVal += "<td><span class=\"label bg-color-blueLight\">Хариу өгөөгүй</span></td>";
                            else if (dr["TZISRECEIVED"].ToString() == "1") strTableVal += "<td><span class=\"label bg-color-greenLight\">Зөвшөөрөв</span></td>";
                            else if (dr["TZISRECEIVED"].ToString() == "0") strTableVal += "<td><span class=\"label bg-color-red\">Татгалзав</span></td>";

                        }
                        if (dr["TZISRECEIVED"].ToString() == "") strTableVal += "<td></td>";
                        else
                        {
                            strTableVal += "<td>";
                            strTableVal += "<table><tbody><tr><td><img src=\"../files/staffs/" + dr["TZIMAGE"].ToString() + "\" class=\"stafflistimage\"></td><td>" + dr["TZSTAFFNAME"].ToString() + "  <small class=\"text-muted\"><i>" + dr["TZISRECEIVEDATE"].ToString() + "</i></small><br /><small class=\"text-muted\">" + dr["TZNEGJ"].ToString() + " | " + dr["TZPOSNAME"].ToString() + "</small></td></tbody></table>";
                            strTableVal += "</td>";
                        }

                        if (checkRoles(currstaffid, "1"))
                        {
                            if (dr["HELTESISRECEIVED"].ToString() == "" && dr["GAZARISRECEIVED"].ToString() == "" && dr["TZISRECEIVED"].ToString() == "") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this, 'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                            else strTableVal += "<td></td>";
                        }

                            if (currstaffid == dr["STAFFS_ID"].ToString())
                        {
                            if (dr["HELTESISRECEIVED"].ToString() == "" && dr["GAZARISRECEIVED"].ToString() == "" && dr["TZISRECEIVED"].ToString() == "") strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this, 'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this)\"><i class=\"fa fa-trash-o\"></i></a></td>";
                            else strTableVal += "<td></td>";
                        }
                       // else strTableVal += "<td></td>";
                        strTableVal += "</tr>";
                    }
                }
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_amraltTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#amraltTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_amraltTab1Datatable) {responsiveHelper_amraltTab1Datatable = new ResponsiveDatatablesHelper($('#amraltTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_amraltTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_amraltTab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },null,{ \"sWidth\": \"70px\" },{ \"sWidth\": \"16px\" },{ \"sWidth\": \"90px\" },null, null ,null, null ,null, null ,null,{ \"sWidth\": \"30px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //**********trainingreq
        public string trainingreqTab1Datatable(string currstid, string yr, string gazar, string heltes, string stid, string tp)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try { 


               string is_permission = "false";

                if (myObjGetTableData.checkRoles(HttpContext.Current.Session["HRMIS_UserID"].ToString(), "9")) is_permission = "true";

                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (gazar != "") gazar = " AND f.FATHER_ID=" + gazar;
                if (heltes != "") heltes = " AND f.ID=" + heltes;
                if (stid != "") stid = " AND a.STAFFS_ID=" + stid;
                if (tp != "") tp = " AND a.TRAININGREQTYPE_ID=" + tp;

                string strTableVal = "";
                string stredit = "0", strHeltesSubmit = "", strGazarSubmit = "", strTzSubmit = "", strStPosId="";
                DataSet ds = getUserInfo(currstid);
                if (!checkRoles(currstid, "1")) {

                    if(ds.Tables[0].Rows[0]["POSID"].ToString() != "2010301") strHeltesSubmit = " disabled=\"disabled\"";
                    if (ds.Tables[0].Rows[0]["POSID"].ToString() != "2010201") strGazarSubmit = " disabled=\"disabled\"";
                    if (!checkRoles(currstid, "1,9")) strHeltesSubmit = " disabled=\"disabled\"";

                }

                strTableVal = "<table id=\"pTab1Datatable\" class=\"table table-striped table-bordered table-hover\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th rowspan=\"2\" class=\"hide\">ID</th>";
                strTableVal += "<th rowspan=\"2\">№</th>";
                strTableVal += "<th rowspan=\"2\">Ажилтан</th>";
                strTableVal += "<th rowspan=\"2\">Төрөл</th>";
                strTableVal += "<th rowspan=\"2\">Зохион байгуулагч</th>";
                strTableVal += "<th rowspan=\"2\">Зардлын талаар</th>";
                strTableVal += "<th rowspan=\"2\">Нэр</th>";
                strTableVal += "<th colspan=\"2\">Зохион байгуулагдах</th>";
                strTableVal += "<th rowspan=\"2\">Хугацаа</th>";
                strTableVal += "<th colspan=\"3\">Зөвшөөрөх</th>";
                strTableVal += "<th rowspan=\"2\">&nbsp;</th>";
                strTableVal += "<th rowspan=\"2\"><i class=\"fa fa-fw fa-file-text-o text-muted hidden-md hidden-sm hidden-xs\"></i></th>";
                strTableVal += "<th rowspan=\"2\" class=\"hide\">ST_ID</th>";
                strTableVal += "<th rowspan=\"2\" class=\"hide\">TRAININGREQTYPE_ID</th>";
                strTableVal += "</tr>";
                strTableVal += "<tr>";
                strTableVal += "<th>Улс</th>";
                strTableVal += "<th>Хот</th>";
                strTableVal += "<th>Хэлтэс</th>";
                strTableVal += "<th>Газар</th>";
                strTableVal += "<th>ТЗУГ</th>";
                strTableVal += "</tr>";
                strTableVal += "</thead><tbody>";
                ds = myObj.OracleExecuteDataSet(@"SELECT ROWNUM as ROWNO, a.* 
FROM(
  SELECT a.ID
    , CASE WHEN f.ID = f.FATHER_ID THEN f.INITNAME ELSE g.INITNAME || '-' || f.INITNAME END || ' | ' || h.NAME || ' | ' || SUBSTR(c.LNAME, 0, 1) || '.' || SUBSTR(c.FNAME, 1, 1) || LOWER(SUBSTR(c.FNAME, 2)) as ST_NAME
    , b.NAME as TRAININGREQTYPE_NAME
    , a.ORGANIZERNAME
    , a.BUDGETNAME
    , a.TRAININGNAME
    , a.COUNTRYNAME
    , a.CITYNAME
    , a.BEGINDATE || ' - ' || a.ENDDATE as DT
    , NVL(a.ISSUBMITHELTES, 0) as ISSUBMITHELTES
    , NVL(a.ISSUBMITGAZAR, 0) as ISSUBMITGAZAR
    , NVL(a.ISSUBMITTZ, 0) as ISSUBMITTZ
    , a.STAFFS_ID
    , a.TRAININGREQTYPE_ID
  FROM ST_TRAININGREQ a
  INNER JOIN STN_TRAININGREQTYPE b ON a.TRAININGREQTYPE_ID = b.ID
  INNER JOIN ST_STAFFS c ON a.STAFFS_ID = c.ID
  INNER JOIN ST_STBR d ON c.ID = d.STAFFS_ID AND d.ISACTIVE = 1
  INNER JOIN ST_BRANCH f ON d.BRANCH_ID = f.ID AND f.ISACTIVE = 1
  INNER JOIN ST_BRANCH g ON f.FATHER_ID = g.ID AND g.ISACTIVE = 1
  INNER JOIN STN_POS h ON d.POS_ID = h.ID
  WHERE TO_NUMBER(TO_CHAR(TO_DATE(a.BEGINDATE, 'YYYY-MM-DD'), 'YYYY')) = " + yr + gazar + heltes + stid + tp + @"
  ORDER BY a.BEGINDATE, a.ENDDATE
) a");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr>";
                        strTableVal += "<td>" + dr[1].ToString() + "</td>";
                        strTableVal += "<td>" + dr[0].ToString() + "</td>";
                        strTableVal += "<td>" + dr[2].ToString() + "</td>";
                        strTableVal += "<td>" + dr[3].ToString() + "</td>";
                        strTableVal += "<td>" + dr[4].ToString() + "</td>";
                        strTableVal += "<td>" + dr[5].ToString() + "</td>";
                        strTableVal += "<td>" + dr[6].ToString() + "</td>";
                        strTableVal += "<td>" + dr[7].ToString() + "</td>";
                        strTableVal += "<td>" + dr[8].ToString() + "</td>";
                        strTableVal += "<td>" + dr[9].ToString() + "</td>";
                        if (dr[10].ToString() == "1") strTableVal += "<td><label class=\"checkbox-inline\"><input checked=\"checked\"" + strHeltesSubmit + " type=\"checkbox\" name=\"checkbox\" class=\"checkbox style-0\" onclick=\"pTab1DatatableSubmitHeltes(this)\"/><span></span></label></td>";
                        else strTableVal += "<td><label class=\"checkbox-inline\"><input " + strHeltesSubmit + " type=\"checkbox\" name=\"checkbox\" class=\"checkbox style-0\" onclick=\"pTab1DatatableSubmitHeltes(this)\"/><span></span></label></td>";
                        if (dr[11].ToString() == "1") strTableVal += "<td><label class=\"checkbox-inline\"><input checked=\"checked\"" + strGazarSubmit + " type=\"checkbox\" name=\"checkbox\" class=\"checkbox style-0\" onclick=\"pTab1DatatableSubmitGazar(this)\"/><span></span></label></td>";
                        else strTableVal += "<td><label class=\"checkbox-inline\"><input " + strGazarSubmit + " type=\"checkbox\" name=\"checkbox\" class=\"checkbox style-0\" onclick=\"pTab1DatatableSubmitGazar(this)\"/><span></span></label></td>";
                        if (dr[12].ToString() == "1") strTableVal += "<td><label class=\"checkbox-inline\"><input checked=\"checked\"" + strTzSubmit + " type=\"checkbox\" name=\"checkbox\" class=\"checkbox style-0\" onclick=\"pTab1DatatableSubmitTz(this)\"/><span></span></label></td>";
                        else strTableVal += "<td><label class=\"checkbox-inline\"><input " + strTzSubmit + " type=\"checkbox\" name=\"checkbox\" class=\"checkbox style-0\" onclick=\"pTab1DatatableSubmitTz(this)\"/><span></span></label></td>";
                        strTableVal += "<td>";
                        if (dr[10].ToString() != "1" && dr[11].ToString() != "1" && dr[12].ToString() != "1" && dr[13].ToString() == currstid) strTableVal += "<a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab1(this,'засах');\" data-target=\"#pTab1Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab1(this);\"><i class=\"fa fa-trash-o\"></i></a>";
                        strTableVal += "</td>";
                        if (is_permission == "true")
                        {
                            if (dr[12].ToString() == "1") strTableVal += "<td><a class=\"btn btn-default btn-xs\" href=\"javascript:void(0);\" data-target=\"#pTab1ModalPrint\" data-toggle=\"modal\" onclick=\"showTab1ModalPrint(this);\"><i class=\"fa fa-file-text-o\"></i> Хэвлэх</a></td>";
                            else strTableVal += "<td></td>";
                        }
                        else {
                            strTableVal += "<td></td>";
                        }
                        strTableVal += "<td>" + dr[13].ToString() + "</td>";
                        strTableVal += "<td>" + dr[14].ToString() + "</td>";
                  
                      

                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_pTab1Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#pTab1Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab1Datatable) {responsiveHelper_pTab1Datatable = new ResponsiveDatatablesHelper($('#pTab1Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_pTab1Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_pTab1Datatable.respond();}, \"aoColumns\": [{ \"sClass\": \"hide\" },{ \"sWidth\": \"15px\" },null,null,null,null,null,null,null,{ \"sWidth\": \"140px\" },{ \"sWidth\": \"41px\" },{ \"sWidth\": \"37px\" },{ \"sWidth\": \"30px\" },{ \"sWidth\": \"25px\" },{ \"sWidth\": \"58px\" },{ \"sClass\": \"hide\" },{ \"sClass\": \"hide\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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
        //inputintractive
        public string inputintractiveTab3Datatable(string yr, string tp)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (yr != "") yr = " AND a.YR=" + yr;
                if (tp != "") tp = " AND a.INTRACTIVEDATA_TYPE=" + tp;
                string strTableVal = "";
                strTableVal = "<table id=\"pTab3Datatable\" class=\"table table-striped table-bordered table-hover smart-form\" width=\"100%\"><thead>";
                strTableVal += "<tr>";
                strTableVal += "<th>Жил</th>";
                strTableVal += "<th>Сар</th>";
                strTableVal += "<th>Мэдээний төрөл</th>";
                strTableVal += "<th>Файлын нэр</th>";
                strTableVal += "<th>&nbsp;</th>";
                strTableVal += "</tr></thead><tbody>";
                DataSet ds = myObj.OracleExecuteDataSet(@"SELECT a.ID, a.YR, CASE WHEN ISMNTH=0 THEN '-' ELSE TO_CHAR(a.MNTH) END as MNTH, a.FILE_NAME, a.INTRACTIVEDATA_TYPE as INTRACTIVEDATA_TYPE_ID, b.NAME as INTRACTIVEDATA_TYPE_NAME
FROM ST_INTRACTIVEDATA a
INNER JOIN (
  SELECT 3 as ID, 'Сангийн сайдын багцын батлагдсан төсөв' as NAME, 0 as ISMNTH FROM DUAL
  UNION ALL
  SELECT 4 as ID, 'Сангийн яамны батлагдсан төсөв' as NAME, 0 as ISMNTH FROM DUAL
  UNION ALL
  SELECT 5 as ID, 'Сангийн яамны төсвийн сарын гүйцэтгэл' as NAME, 1 as ISMNTH FROM DUAL
  UNION ALL
  SELECT 7 as ID, 'Сангийн сайдын хэрэгжүүлэх хөтөлбөр, хөтөлбөрийн хүрэх үр дүн, шалгуур үзүүлэлт' as NAME, 0 as ISMNTH FROM DUAL
  UNION ALL
  SELECT 8 as ID, 'Сангийн сайдын багцад улсын төсвийн хөрөнгөөр хэрэгжүүлэх хөрөнгө оруулалтын төсөл, арга хэмжээ барилга байгууламжын жагсаалт' as NAME, 0 as ISMNTH FROM DUAL
) b ON a.INTRACTIVEDATA_TYPE=b.ID
WHERE 1=1" + yr+tp+@"
ORDER BY a.INTRACTIVEDATA_TYPE, a.YR, a.MNTH");
                if (ds.Tables[0].Rows.Count != 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strTableVal += "<tr data-id=\"" + dr["ID"].ToString() + "\">";
                        strTableVal += "<td>" + dr["YR"].ToString() + "</td>";
                        strTableVal += "<td>" + dr["MNTH"].ToString() + "</td>";
                        strTableVal += "<td data-id=\""+ dr["INTRACTIVEDATA_TYPE_ID"].ToString() + "\">" + dr["INTRACTIVEDATA_TYPE_NAME"].ToString() + "</td>";
                        strTableVal += "<td><a href=\"../pg/forclient/assets/files/" + dr["FILE_NAME"].ToString() + "\" class=\"btn btn-link btn-xs\" style=\"padding:0px; border:none;\" download title=\"Хавсаргасан файл татах\"><i class=\"fa fa-paperclip fa-lg\"></i> " + dr["FILE_NAME"].ToString() + "</a></td>";
                        strTableVal += "<td><a style=\"cursor:pointer; margin-right:8px;\" onclick=\"showAddEditTab3(this,'засах');\" data-target=\"#pTab3Modal\" data-toggle=\"modal\"><i class=\"fa fa-pencil\"></i></a><a style=\"cursor:pointer;\" onclick=\"showDeleteTab3(this);\"><i class=\"fa fa-trash-o\"></i></a></td>";
                        strTableVal += "</tr>";
                    }
                }
                myObj.DBDisconnect();
                strTableVal += "</tbody>";
                strTableVal += "</table>";
                strTableVal += "<script>";
                strTableVal += "var responsiveHelper_pTab3Datatable = undefined;var breakpointDefinition = {tablet: 1024, phone: 480};$('#pTab3Datatable').dataTable({\"iDisplayLength\" : 100, \"sDom\": \"<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>\" + \"t\" + \"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>\",\"autoWidth\": true,\"preDrawCallback\": function () {if (!responsiveHelper_pTab3Datatable) {responsiveHelper_pTab3Datatable = new ResponsiveDatatablesHelper($('#pTab3Datatable'), breakpointDefinition); }}, \"rowCallback\": function (nRow) {responsiveHelper_pTab3Datatable.createExpandIcon(nRow);}, \"drawCallback\": function (oSettings) {responsiveHelper_pTab3Datatable.respond();}, \"aoColumns\": [{ \"sWidth\": \"20px\" }, { \"sWidth\": \"20px\", \"className\": \"text-center\" }, { \"sWidth\": \"50%\" },null,{ \"sWidth\": \"25px\" }]});</script>";
                strTableVal += "</script>";
                return strTableVal;
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