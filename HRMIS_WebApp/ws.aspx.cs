using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OracleClient;
using System.DirectoryServices;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Oracle.DataAccess.Client;

namespace HRWebApp
{
    public partial class ws : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
        }
        [WebMethod]
        public static void gotoLM(string stid)
        {
            HttpContext.Current.Session["LM_UserID"] = stid;
        }
        [WebMethod]
        public static void gotoHRMIS(string stid)
        {
            HttpContext.Current.Session["HRMIS_UserID"] = stid;
        }
//        [WebMethod]
//        public static string CheckLogin(string username, string pass)
//        {
//            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["HRMISDBCONN"].ConnectionString);
//            OracleCommand cmd;
//            OracleDataAdapter adapter = new OracleDataAdapter();
//            DataSet ds = null;
//            CSession sessionClass = new CSession();
//            try
//            {
//                //DirectoryEntry dirEntry = null;
//                //int countEntry = 0;
//                string stid = "", finger_id = "";
//                //dirEntry = new DirectoryEntry("LDAP://mof.local", username, pass, AuthenticationTypes.Secure);
//                //countEntry = dirEntry.Properties.Count;

//                if (con.State == ConnectionState.Closed) con.Open();
//                cmd = new OracleCommand();
//                cmd.CommandType = CommandType.Text;
//                //cmd.CommandText = "SELECT a.ID,a.FINGERID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID WHERE c.ACTIVE=1 AND a.DOMAIN_USER='gundsamba_g@mof.gov.mn'";
//                cmd.CommandText = @"SELECT 
//    a.ID
//    , a.DOMAIN_USER
//    , a.MNAME
//    , a.LNAME
//    , a.FNAME
//    , b.BRANCH_ID as HELTES_ID
//    , d.INITNAME as HELTES_INITNAME
//    , d.FATHER_ID as GAZAR_ID
//    , e.INITNAME AS GAZAR_INITNAME
//    , b.POS_ID
//    , f.NAME as POS_NAME
//    , b.POSTYPE_ID
//    , j.NAME as POSTYPE_NAME
//    , k.ROLELISTID
//    , g3.ID as HELTESBOSSID
//    , SUBSTR(g3.LNAME, 0, 1) || '.' || SUBSTR(g3.FNAME, 1, 1) || LOWER(SUBSTR(g3.FNAME, 2)) as HELTESBOSSNAMEINIT
//    , h3.ID as GAZARBOSSID
//    , SUBSTR(h3.LNAME, 0, 1) || '.' || SUBSTR(h3.FNAME, 1, 1) || LOWER(SUBSTR(h3.FNAME, 2)) as GAZARBOSSNAMEINIT
//    , a.FINGERID 
//    , a.REGNO
//FROM ST_STAFFS a 
//INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
//INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
//INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID
//LEFT JOIN ST_BRANCH e ON d.FATHER_ID=e.ID
//LEFT JOIN STN_POS f ON b.POS_ID=f.ID
//LEFT JOIN STN_POSTYPE j ON b.POSTYPE_ID=j.ID
//LEFT JOIN (
//  SELECT STAFFS_ID, RTRIM(xmlagg (xmlelement (e, ROLE_ID || ',')).extract('//text()'), ',') as ROLELISTID FROM ST_STAFFS_ROLE WHERE STAFFS_ID IN (SELECT ID FROM ST_STAFFS WHERE DOMAIN_USER='mof0005103') GROUP BY STAFFS_ID
//) k ON a.ID=k.STAFFS_ID
//LEFT JOIN ST_STBR g1 ON b.BRANCH_ID = g1.BRANCH_ID AND g1.ISACTIVE = 1 AND g1.POS_ID = (CASE WHEN d.ID=d.FATHER_ID THEN 2010201 ELSE 2010301 END)
//LEFT JOIN STN_MOVE g2 ON g1.MOVE_ID = g2.ID
//LEFT JOIN ST_STAFFS g3 ON g1.STAFFS_ID = g3.ID
//LEFT JOIN ST_STBR h1 ON d.FATHER_ID = h1.BRANCH_ID AND h1.ISACTIVE = 1 AND h1.POS_ID = 2010201
//LEFT JOIN STN_MOVE h2 ON h1.MOVE_ID = h2.ID
//LEFT JOIN ST_STAFFS h3 ON h1.STAFFS_ID = h3.ID
//WHERE 
//    c.ACTIVE=1 AND 
//    g2.ACTIVE = 1 AND 
//    h2.ACTIVE = 1 AND 
//    a.DOMAIN_USER='mof0005103'";
//                cmd.Connection = con;
//                adapter.SelectCommand = cmd;
//                ds = new DataSet();
//                adapter.Fill(ds);
//                if (ds.Tables[0].Rows.Count == 0) {
//                    throw new cs.HRMISException("Нэвтрэх нэр бүртгэлгүй эсвэл идэвхгүй байна. ТЗУГ-д хандана уу!");
//                } 
//                else
//                {
//                    List<int> listUserRole = new List<int>();
//                    if (ds.Tables[0].Rows[0]["ROLELISTID"].ToString() != "" && ds.Tables[0].Rows[0]["ROLELISTID"].ToString() != null) {
//                        string strUserRoleIds = ds.Tables[0].Rows[0]["ROLELISTID"].ToString();
//                        if (strUserRoleIds.Split(',').Length > 0) for (int i = 0; i < strUserRoleIds.Split(',').Length; i++) listUserRole.Add(Int32.Parse(strUserRoleIds.Split(',')[i]));
//                    }
//                    else throw new cs.HRMISException("Системийн эрх авна уу! ТЗУГ-д хандана уу!");
//                    var objUserData = new UserData
//                    {
//                        USR_STAFFID = Int32.Parse(ds.Tables[0].Rows[0]["ID"].ToString()),
//                        USR_DOMAIN = ds.Tables[0].Rows[0]["DOMAIN_USER"].ToString(),
//                        USR_ROLEDATA = listUserRole,
//                        USR_FNAME = ds.Tables[0].Rows[0]["FNAME"].ToString(),
//                        USR_MNAME = ds.Tables[0].Rows[0]["MNAME"].ToString(),
//                        USR_LNAME = ds.Tables[0].Rows[0]["FNAME"].ToString(),
//                        USR_HELTESID = Int32.Parse(ds.Tables[0].Rows[0]["HELTES_ID"].ToString()),
//                        USR_HELTESINITNAME = ds.Tables[0].Rows[0]["HELTES_INITNAME"].ToString(),
//                        USR_GAZARID = Int32.Parse(ds.Tables[0].Rows[0]["GAZAR_ID"].ToString()),
//                        USR_GAZARINITNAME = ds.Tables[0].Rows[0]["GAZAR_INITNAME"].ToString(),
//                        USR_POSID = Int32.Parse(ds.Tables[0].Rows[0]["POS_ID"].ToString()),
//                        USR_POSNAME = ds.Tables[0].Rows[0]["POS_NAME"].ToString(),
//                        USR_POSTYPENAME = ds.Tables[0].Rows[0]["POSTYPE_NAME"].ToString(),
//                        USR_HELTESBOSSID = Int32.Parse(ds.Tables[0].Rows[0]["HELTESBOSSID"].ToString()),
//                        USR_HELTESBOSSINITNAME = ds.Tables[0].Rows[0]["HELTESBOSSNAMEINIT"].ToString(),
//                        USR_GAZARBOSSID = Int32.Parse(ds.Tables[0].Rows[0]["GAZARBOSSID"].ToString()),
//                        USR_GAZARBOSSINITNAME = ds.Tables[0].Rows[0]["GAZARBOSSNAMEINIT"].ToString(),
//                        USR_FINGERID = ds.Tables[0].Rows[0]["FINGERID"].ToString(),
//                        USR_REGNO = ds.Tables[0].Rows[0]["REGNO"].ToString()
//                    };
//                    sessionClass.setUserData(objUserData);
//                    stid = ds.Tables[0].Rows[0][0].ToString();
//                    finger_id = ds.Tables[0].Rows[0][1].ToString();
//                }

//                //cmd = new OracleCommand();
//                //cmd.CommandType = CommandType.Text;
//                //cmd.CommandText = "SELECT COUNT(1) FROM TBL_USER_ROLE WHERE USER_ID=" + stid;
//                //cmd.Connection = con;
//                //if (cmd.ExecuteScalar().ToString() == "0") throw new cs.LMException("Уг системд эрх аваагүй хэрэглэгч байна");

//                HttpContext.Current.Session["HRMIS_UserID"] = stid;
//                HttpContext.Current.Session["HRMIS_finger_id"] = finger_id;
//                return stid;
//            }
//            catch (DirectoryServicesCOMException ex)
//            {
//                if (ex.ErrorCode.Equals(-2147023570))
//                    throw new cs.HRMISException("Нэвтрэх нэр эсвэл нууц үг буруу байна");
//                else
//                    throw new cs.HRMISException("Домайнтай холбогдож чадсангүй");
//            }
//            catch (cs.HRMISException ex)
//            {
//                using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/hrmisexlogs.txt")))
//                {
//                    w.Write("  Message:{0}", ex.Message);
//                    w.WriteLine("  StackTrace:{0}", ex.StackTrace);
//                    w.WriteLine("--------------------------------------------------------------------------------");
//                }
//                throw ex;                    
//            }
//            catch (Exception ex)
//            {
//                using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/hrmisexlogs.txt")))
//                {
//                    w.Write("  Message:{0}", ex.Message);
//                    w.WriteLine("  StackTrace:{0}", ex.StackTrace);
//                    w.WriteLine("--------------------------------------------------------------------------------");
//                }
//                throw new cs.HRMISException("Нэвтрэлт амжилтгүй боллоо.", ex);
//            }
//            finally
//            {
//                con.Close();
//                con.Dispose();
//            }
//        }
        [WebMethod]
        public static void WSSessionKill()
        {
            HttpContext.Current.Session["HRMIS_UserID"] = null;
        }
        [WebMethod]
        public static string WSOracleExecuteNonQuery(string qry)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                myObj.OracleExecuteNonQuery(qry);
            }
            catch (cs.HRMISException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                //cs.WriteLogForEx.WriteLog(ex);
                throw ex;
            }
            catch (OracleException ex)
            {

                if (ex.Code == 20000) {
                    return ex.Message;
                }

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
            return "";
        }
        //[WebMethod]
        //public static void WSOracleExecuteNonQueryForClient(string qry)
        //{
        //    OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["HRMISDBCONN"].ConnectionString);
        //    try
        //    {
        //        if (con.State == ConnectionState.Closed) con.Open();

        //        OracleCommand cmd = new OracleCommand();
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText = qry;
        //        cmd.Connection = con;
        //        cmd.ExecuteNonQuery();
        //    }
        //    catch (cs.HRMISException ex)
        //    {
        //        HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
        //        throw ex;
        //    }
        //    catch (DbException ex)
        //    {
        //        HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
        //        throw ex;
        //    }
        //    catch (Exception ex)
        //    {
        //        HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
        //        throw ex;
        //    }
        //    finally
        //    {
        //        if (con.State == ConnectionState.Open)
        //        {
        //            con.Close();
        //            con.Dispose();
        //        }
        //    }

        //}
        [WebMethod]
        public static string WSOracleExecuteScalar(string qry)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObj.OracleExecuteScalar(qry).ToString();
            }
            catch (NullReferenceException ex)
            {
                throw new cs.HRMISException("NullReferenceException");
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
        [WebMethod]
        public static void DeleteFile(string filename)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                string Path = HostingEnvironment.MapPath(filename);
                FileInfo file = new FileInfo(Path);
                if (file.Exists) file.Delete();
            }
            catch (cs.HRMISException ex)
            {
                //cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                //cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }

        }
        [WebMethod]
        public static string gazarListForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.gazarListForDDL();
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
        [WebMethod]
        public static string heltesListForDDL(string gazarId)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.heltesListForDDL(gazarId);
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
        [WebMethod]
        public static string timeListForDDL(string begintime, string endtime, string intervalmin)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.timeListForDDL(begintime, endtime, intervalmin);
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
        [WebMethod]
        public static string staffListForDDL(string gazarId, string heltesId)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.staffListForDDL(gazarId, heltesId);
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
        [WebMethod]
        public static string checkRoles(string stid, string roles)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (myObjGetTableData.checkRoles(stid, roles)) return "1";
                else return "0";
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
        [WebMethod]
        public static string branchreg_branchregTab1ModalTypeForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.branchregTab1ModalTypeForDDL();
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
        [WebMethod]
        public static string branchreg_branchregTab1ModalChangeTypeForDDL(string isinsert)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.branchregTab1ModalChangeTypeForDDL(isinsert);
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
        [WebMethod]
        public static string branchreg_branchregTab1ModalFatherForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.branchregTab1ModalFatherForDDL();
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
        [WebMethod]
        public static string branchreg_branchregTab1DatatableTab1Datatable(string tp, string isactive)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.branchregTab1Datatable(tp, isactive);
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
        [WebMethod]
        public static void BRANCH_INSERT(string P_FATHER_ID, string P_INITNAME, string P_NAME, string P_INITNAME_ENG, string P_NAME_ENG, string P_BRANCH_TYPE_ID, string P_BRANCH_CHANGETYPE_ID, string P_DESCRIPTION, string P_SORT, string P_STAFFID, string P_DT)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                string[] ParamName = new string[11], ParamValue = new string[11];
                ParamName[0] = "P_FATHER_ID";
                ParamName[1] = "P_INITNAME";
                ParamName[2] = "P_NAME";
                ParamName[3] = "P_INITNAME_ENG";
                ParamName[4] = "P_NAME_ENG";
                ParamName[5] = "P_BRANCH_TYPE_ID";
                ParamName[6] = "P_BRANCH_CHANGETYPE_ID";
                ParamName[7] = "P_DESCRIPTION";
                ParamName[8] = "P_SORT";
                ParamName[9] = "P_STAFFID";
                ParamName[10] = "P_DT";
                ParamValue[0] = P_FATHER_ID;
                ParamValue[1] = P_INITNAME;
                ParamValue[2] = P_NAME;
                ParamValue[3] = P_INITNAME_ENG;
                ParamValue[4] = P_NAME_ENG;
                ParamValue[5] = P_BRANCH_TYPE_ID;
                ParamValue[6] = P_BRANCH_CHANGETYPE_ID;
                ParamValue[7] = P_DESCRIPTION;
                ParamValue[8] = P_SORT;
                ParamValue[9] = P_STAFFID;
                ParamValue[10] = P_DT;
                myObj.SP_OracleExecuteNonQuery("BRANCH_INSERT", ParamName, ParamValue);
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
        [WebMethod]
        public static void BRANCH_UPDATE(string P_MAIN_ID, string P_FATHER_ID, string P_INITNAME, string P_NAME, string P_INITNAME_ENG, string P_NAME_ENG, string P_BRANCH_TYPE_ID, string P_BRANCH_CHANGETYPE_ID, string P_DESCRIPTION, string P_SORT, string P_STAFFID, string P_DT)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                string[] ParamName = new string[12], ParamValue = new string[12];
                ParamName[0] = "P_MAIN_ID";
                ParamName[1] = "P_FATHER_ID";
                ParamName[2] = "P_INITNAME";
                ParamName[3] = "P_NAME";
                ParamName[4] = "P_INITNAME_ENG";
                ParamName[5] = "P_NAME_ENG";
                ParamName[6] = "P_BRANCH_TYPE_ID";
                ParamName[7] = "P_BRANCH_CHANGETYPE_ID";
                ParamName[8] = "P_DESCRIPTION";
                ParamName[9] = "P_SORT";
                ParamName[10] = "P_STAFFID";
                ParamName[11] = "P_DT";
                ParamValue[0] = P_MAIN_ID;
                ParamValue[1] = P_FATHER_ID;
                ParamValue[2] = P_INITNAME;
                ParamValue[3] = P_NAME;
                ParamValue[4] = P_INITNAME_ENG;
                ParamValue[5] = P_NAME_ENG;
                ParamValue[6] = P_BRANCH_TYPE_ID;
                ParamValue[7] = P_BRANCH_CHANGETYPE_ID;
                ParamValue[8] = P_DESCRIPTION;
                ParamValue[9] = P_SORT;
                ParamValue[10] = P_STAFFID;
                ParamValue[11] = P_DT;
                myObj.SP_OracleExecuteNonQuery("BRANCH_UPDATE", ParamName, ParamValue);
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
        [WebMethod]
        public static void BRANCH_REPLACE(string P_ID, string P_FATHER_ID, string P_INITNAME, string P_NAME, string P_INITNAME_ENG, string P_NAME_ENG, string P_BRANCH_TYPE_ID, string P_BRANCH_CHANGETYPE_ID, string P_DESCRIPTION, string P_SORT, string P_STAFFID, string P_DT)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[12], ParamValue = new string[12];
                ParamName[0] = "P_ID";
                ParamName[1] = "P_FATHER_ID";
                ParamName[2] = "P_INITNAME";
                ParamName[3] = "P_NAME";
                ParamName[4] = "P_INITNAME_ENG";
                ParamName[5] = "P_NAME_ENG";
                ParamName[6] = "P_BRANCH_TYPE_ID";
                ParamName[7] = "P_BRANCH_CHANGETYPE_ID";
                ParamName[8] = "P_DESCRIPTION";
                ParamName[9] = "P_SORT";
                ParamName[10] = "P_STAFFID";
                ParamName[11] = "P_DT";
                ParamValue[0] = P_ID;
                ParamValue[1] = P_FATHER_ID;
                ParamValue[2] = P_INITNAME;
                ParamValue[3] = P_NAME;
                ParamValue[4] = P_INITNAME_ENG;
                ParamValue[5] = P_NAME_ENG;
                ParamValue[6] = P_BRANCH_TYPE_ID;
                ParamValue[7] = P_BRANCH_CHANGETYPE_ID;
                ParamValue[8] = P_DESCRIPTION;
                ParamValue[9] = P_SORT;
                ParamValue[10] = P_STAFFID;
                ParamValue[11] = P_DT;
                myObj.SP_OracleExecuteNonQuery("BRANCH_REPLACE", ParamName, ParamValue);
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
        [WebMethod]
        public static string staffreg_staffregTab1ModalBranchForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.staffregTab1ModalBranchForDDL();
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
        [WebMethod]
        public static string staffreg_staffregTab1ModalMoveForDDL(string tp)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.staffregTab1ModalMoveForDDL(tp);
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
        [WebMethod]
        public static string staffreg_staffregTab1ModalRankForDDL()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.staffregTab1ModalRankForDDL();
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
        [WebMethod]
        public static string staffreg_staffregTab1ModalDistForDDL(string city)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.staffregTab1ModalDistForDDL(city);
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
        [WebMethod]
        public static void STAFF_INSERT(string P_MNAME, string P_LNAME, string P_FNAME, string P_BDATE, string P_BDIST_ID, string P_BCITY_ID, string P_NAT_ID, string P_EDUTP_ID, string P_SOCPOS_ID, string P_OCCTYPE_ID, string P_OCCNAME, string P_GENDER, string P_REGNO, string P_CITNO, string P_SOCNO, string P_HEALNO, string P_ADDRCITY_ID, string P_ADDRDIST_ID, string P_ADDRESSNAME, string P_TEL, string P_TEL2, string P_EMAIL, string P_IMAGE, string P_DT, string P_BRANCH_ID, string P_POSTYPE_ID, string P_POS_ID, string P_RANK_ID, string P_TUSHAALDATE, string P_TUSHAALNO, string P_MOVE_ID, string P_DESCRIPTION, string P_STAFFID, string P_DOMAIN_USER, string P_RELNAME, string P_RELATION_ID, string P_RELADDRESSNAME, string P_RELTEL, string P_RELTEL2, string P_RELEMAIL, string P_FINGERID)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[41], ParamValue = new string[41];
                ParamName[0] = "P_MNAME";
                ParamName[1] = "P_LNAME";
                ParamName[2] = "P_FNAME";
                ParamName[3] = "P_BDATE";
                ParamName[4] = "P_BCITY_ID";
                ParamName[5] = "P_BDIST_ID";
                ParamName[6] = "P_NAT_ID";
                ParamName[7] = "P_EDUTP_ID";
                ParamName[8] = "P_SOCPOS_ID";
                ParamName[9] = "P_OCCTYPE_ID";
                ParamName[10] = "P_OCCNAME";
                ParamName[11] = "P_GENDER";
                ParamName[12] = "P_REGNO";
                ParamName[13] = "P_CITNO";
                ParamName[14] = "P_SOCNO";
                ParamName[15] = "P_HEALNO";
                ParamName[16] = "P_ADDRCITY_ID";
                ParamName[17] = "P_ADDRDIST_ID";
                ParamName[18] = "P_ADDRESSNAME";
                ParamName[19] = "P_TEL";
                ParamName[20] = "P_TEL2";
                ParamName[21] = "P_EMAIL";
                ParamName[22] = "P_IMAGE";
                ParamName[23] = "P_DT";
                ParamName[24] = "P_BRANCH_ID";
                ParamName[25] = "P_POSTYPE_ID";
                ParamName[26] = "P_POS_ID";
                ParamName[27] = "P_RANK_ID";
                ParamName[28] = "P_TUSHAALDATE";
                ParamName[29] = "P_TUSHAALNO";
                ParamName[30] = "P_MOVE_ID";
                ParamName[31] = "P_DESCRIPTION";
                ParamName[32] = "P_STAFFID";
                ParamName[33] = "P_DOMAIN_USER";
                ParamName[34] = "P_RELNAME";
                ParamName[35] = "P_RELATION_ID";
                ParamName[36] = "P_RELADDRESSNAME";
                ParamName[37] = "P_RELTEL";
                ParamName[38] = "P_RELTEL2";
                ParamName[39] = "P_RELEMAIL";
                ParamName[40] = "P_FINGERID";
                ParamValue[0] = P_MNAME;
                ParamValue[1] = P_LNAME;
                ParamValue[2] = P_FNAME;
                ParamValue[3] = P_BDATE;
                ParamValue[4] = P_BCITY_ID;
                ParamValue[5] = P_BDIST_ID;
                ParamValue[6] = P_NAT_ID;
                ParamValue[7] = P_EDUTP_ID;
                ParamValue[8] = P_SOCPOS_ID;
                ParamValue[9] = P_OCCTYPE_ID;
                ParamValue[10] = P_OCCNAME;
                ParamValue[11] = P_GENDER;
                ParamValue[12] = P_REGNO;
                ParamValue[13] = P_CITNO;
                ParamValue[14] = P_SOCNO;
                ParamValue[15] = P_HEALNO;
                ParamValue[16] = P_ADDRCITY_ID;
                ParamValue[17] = P_ADDRDIST_ID;
                ParamValue[18] = P_ADDRESSNAME;
                ParamValue[19] = P_TEL;
                ParamValue[20] = P_TEL2;
                ParamValue[21] = P_EMAIL;
                ParamValue[22] = P_IMAGE;
                ParamValue[23] = P_DT;
                ParamValue[24] = P_BRANCH_ID;
                ParamValue[25] = P_POSTYPE_ID;
                ParamValue[26] = P_POS_ID;
                ParamValue[27] = P_RANK_ID;
                ParamValue[28] = P_TUSHAALDATE;
                ParamValue[29] = P_TUSHAALNO;
                ParamValue[30] = P_MOVE_ID;
                ParamValue[31] = P_DESCRIPTION;
                ParamValue[32] = P_STAFFID;
                ParamValue[33] = P_DOMAIN_USER;
                ParamValue[34] = P_RELNAME;
                ParamValue[35] = P_RELATION_ID;
                ParamValue[36] = P_RELADDRESSNAME;
                ParamValue[37] = P_RELTEL;
                ParamValue[38] = P_RELTEL2;
                ParamValue[39] = P_RELEMAIL;
                ParamValue[40] = P_FINGERID;
                myObj.SP_OracleExecuteNonQuery("STAFF_INSERT", ParamName, ParamValue);
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
        [WebMethod]
        public static string staffreg_staffregTab1Datatable(string pos, string gazar, string heltes, string tp, string currstaffid, string ismove)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.staffregTab1Datatable(pos, gazar, heltes, tp, currstaffid, ismove);
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
        [WebMethod]
        public static void STAFF_UPDATE(string P_ID, string P_MNAME, string P_LNAME, string P_FNAME, string P_BDATE, string P_BDIST_ID, string P_BCITY_ID, string P_NAT_ID, string P_EDUTP_ID, string P_SOCPOS_ID, string P_OCCTYPE_ID, string P_OCCNAME, string P_GENDER, string P_REGNO, string P_CITNO, string P_SOCNO, string P_HEALNO, string P_ADDRCITY_ID, string P_ADDRDIST_ID, string P_ADDRESSNAME, string P_TEL, string P_TEL2, string P_EMAIL, string P_IMAGE, string P_DT, string P_BRANCH_ID, string P_POSTYPE_ID, string P_POS_ID, string P_RANK_ID, string P_TUSHAALDATE, string P_TUSHAALNO, string P_MOVE_ID, string P_DESCRIPTION, string P_STAFFID, string P_DOMAIN_USER, string P_RELNAME, string P_RELATION_ID, string P_RELADDRESSNAME, string P_RELTEL, string P_RELTEL2, string P_RELEMAIL, string P_FINGERID)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[42], ParamValue = new string[42];
                ParamName[0] = "P_ID";
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
                ParamValue[0] = P_ID;
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
                myObj.SP_OracleExecuteNonQuery("STAFF_UPDATE", ParamName, ParamValue);
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
        [WebMethod]
        public static string profile_profileTab1T2Datatable(string staffid, string tp)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T2Datatable(staffid, tp);
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
        [WebMethod]
        public static string profile_profileTab1T3Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T3Datatable1(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T3Datatable2(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T3Datatable2(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T3Datatable3(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T3Datatable3(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T4Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T4Datatable1(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T5Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T5Datatable1(staffid);
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
        [WebMethod]
        public static void SKILLS_INSERT(string P_STAFFS_ID, string P_COL, string P_EVAL)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[3], ParamValue = new string[3];
                ParamName[0] = "P_STAFFS_ID";
                ParamName[1] = "P_COL";
                ParamName[2] = "P_EVAL";
                ParamValue[0] = P_STAFFS_ID;
                ParamValue[1] = P_COL;
                ParamValue[2] = P_EVAL;
                myObj.SP_OracleExecuteNonQuery("SKILLS_INSERT", ParamName, ParamValue);
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
        [WebMethod]
        public static void ANOTHERSKILLS_INSERT(string P_STAFFS_ID, string P_COL, string P_NAME, string P_EVAL)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[4], ParamValue = new string[4];
                ParamName[0] = "P_STAFFS_ID";
                ParamName[1] = "P_COL";
                ParamName[2] = "P_NAME";
                ParamName[3] = "P_EVAL";
                ParamValue[0] = P_STAFFS_ID;
                ParamValue[1] = P_COL;
                ParamValue[2] = P_NAME;
                ParamValue[3] = P_EVAL;
                myObj.SP_OracleExecuteNonQuery("ANOTHERSKILLS_INSERT", ParamName, ParamValue);
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
        [WebMethod]
        public static string profile_profileTab1T7Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T7Datatable1(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T7Datatable2(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T7Datatable2(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T7Datatable3(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T7Datatable3(staffid);
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
        [WebMethod]
        public static void OFFICE_INSERT(string P_STAFFS_ID, string P_COL, string P_GRADE_ID)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[3], ParamValue = new string[3];
                ParamName[0] = "P_STAFFS_ID";
                ParamName[1] = "P_COL";
                ParamName[2] = "P_GRADE_ID";
                ParamValue[0] = P_STAFFS_ID;
                ParamValue[1] = P_COL;
                ParamValue[2] = P_GRADE_ID;
                myObj.SP_OracleExecuteNonQuery("OFFICE_INSERT", ParamName, ParamValue);
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
        [WebMethod]
        public static string profile_profileTab1T8Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T8Datatable1(staffid);
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
        [WebMethod]
        public static void STAFF_MOVE(string P_STAFFS_ID, string P_DT, string P_BRANCH_ID, string P_POSTYPE_ID, string P_POS_ID, string P_RANK_ID, string P_TUSHAALDATE, string P_TUSHAALNO, string P_MOVE_ID, string P_DESCRIPTION, string P_STAFFID, string P_DOMAIN_USER)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[12], ParamValue = new string[12];
                ParamName[0] = "P_STAFFS_ID";
                ParamName[1] = "P_DT";
                ParamName[2] = "P_BRANCH_ID";
                ParamName[3] = "P_POSTYPE_ID";
                ParamName[4] = "P_POS_ID";
                ParamName[5] = "P_RANK_ID";
                ParamName[6] = "P_TUSHAALDATE";
                ParamName[7] = "P_TUSHAALNO";
                ParamName[8] = "P_MOVE_ID";
                ParamName[9] = "P_DESCRIPTION";
                ParamName[10] = "P_STAFFID";
                ParamName[11] = "P_DOMAIN_USER";
                ParamValue[0] = P_STAFFS_ID;
                ParamValue[1] = P_DT;
                ParamValue[2] = P_BRANCH_ID;
                ParamValue[3] = P_POSTYPE_ID;
                ParamValue[4] = P_POS_ID;
                ParamValue[5] = P_RANK_ID;
                ParamValue[6] = P_TUSHAALDATE;
                ParamValue[7] = P_TUSHAALNO;
                ParamValue[8] = P_MOVE_ID;
                ParamValue[9] = P_DESCRIPTION;
                ParamValue[10] = P_STAFFID;
                ParamValue[11] = P_DOMAIN_USER;
                myObj.SP_OracleExecuteNonQuery("STAFF_MOVE", ParamName, ParamValue);
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
        [WebMethod]
        public static string profile_profileTab1T9Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T9Datatable1(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T9Datatable2(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T9Datatable2(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T9Datatable3(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T9Datatable3(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T9Datatable4(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T9Datatable4(staffid);
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
        [WebMethod]
        public static string profile_profileTab1T9Datatable5(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab1T9Datatable5(staffid);
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
        [WebMethod]
        public static string profile_profileTab2T7Datatable1(string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.profileTab2T7Datatable1(staffid);
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
        [WebMethod]
        public static string tomilolt_tomiloltTab1ModalSelectstafflistForSelect2(string selectedList)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.tomiloltTab1ModalSelectstafflistForSelect2(selectedList);
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
        [WebMethod]
        public static string tomilolt_tomiloltTab1Datatable(string type, string fromdate, string todate, string budget, string direction, string currstaffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.tomiloltTab1Datatable(type, fromdate, todate, budget, direction, currstaffid);
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
        [WebMethod]
        public static string tomilolt_tomiloltTab2Datatable(string type, string fromdate, string todate, string budget, string direction, string isreport, string currstaffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.tomiloltTab2Datatable(type, fromdate, todate, budget, direction, isreport, currstaffid);
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
        [WebMethod]
        public static void TOMILOLT_INSERT(string P_TOMILOLTYPE_ID, string P_TOMILOLTDIRECTION_ID, string P_TOMILOLTBUDGET_ID, string P_FROMDATE, string P_TODATE, string P_DAYNUM, string P_COUNTRYNAME, string P_CITYNAME, string P_SUBJECTNAME, string P_TUSHAALNO, string P_TUSHAALDATE, string P_TUSHAALFILENAME, string P_STAFFLIST, string P_STAFFID, string P_TOMILOLT_BUDGET_OTHER)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[15], ParamValue = new string[15];
                ParamName[0] = "P_TOMILOLTYPE_ID";
                ParamName[1] = "P_TOMILOLTDIRECTION_ID";
                ParamName[2] = "P_TOMILOLTBUDGET_ID";
                ParamName[3] = "P_FROMDATE";
                ParamName[4] = "P_TODATE";
                ParamName[5] = "P_DAYNUM";
                ParamName[6] = "P_COUNTRYNAME";
                ParamName[7] = "P_CITYNAME";
                ParamName[8] = "P_SUBJECTNAME";
                ParamName[9] = "P_TUSHAALNO";
                ParamName[10] = "P_TUSHAALDATE";
                ParamName[11] = "P_TUSHAALFILENAME";
                ParamName[12] = "P_STAFFLIST";
                ParamName[13] = "P_STAFFID";
                ParamName[14] = "P_TOMILOLT_BUDGET_OTHER";
                ParamValue[0] = P_TOMILOLTYPE_ID;
                ParamValue[1] = P_TOMILOLTDIRECTION_ID;
                ParamValue[2] = P_TOMILOLTBUDGET_ID;
                ParamValue[3] = P_FROMDATE;
                ParamValue[4] = P_TODATE;
                ParamValue[5] = P_DAYNUM;
                ParamValue[6] = P_COUNTRYNAME;
                ParamValue[7] = P_CITYNAME;
                ParamValue[8] = P_SUBJECTNAME;
                ParamValue[9] = P_TUSHAALNO;
                ParamValue[10] = P_TUSHAALDATE;
                ParamValue[11] = P_TUSHAALFILENAME;
                ParamValue[12] = P_STAFFLIST;
                ParamValue[13] = P_STAFFID;
                ParamValue[14] = P_TOMILOLT_BUDGET_OTHER;
                myObj.SP_OracleExecuteNonQuery("TOMILOLT_INSERT", ParamName, ParamValue);
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
        [WebMethod]
        public static void TOMILOLT_UPDATE(string P_TOMILOL_ID, string P_TOMILOLTYPE_ID, string P_TOMILOLTDIRECTION_ID, string P_TOMILOLTBUDGET_ID, string P_FROMDATE, string P_TODATE, string P_DAYNUM, string P_COUNTRYNAME, string P_CITYNAME, string P_SUBJECTNAME, string P_TUSHAALNO, string P_TUSHAALDATE, string P_TUSHAALFILENAME, string P_STAFFLIST, string P_STAFFID, string P_TOMILOLT_BUDGET_OTHER)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[16], ParamValue = new string[16];
                ParamName[0] = "P_TOMILOL_ID";
                ParamName[1] = "P_TOMILOLTYPE_ID";
                ParamName[2] = "P_TOMILOLTDIRECTION_ID";
                ParamName[3] = "P_TOMILOLTBUDGET_ID";
                ParamName[4] = "P_FROMDATE";
                ParamName[5] = "P_TODATE";
                ParamName[6] = "P_DAYNUM";
                ParamName[7] = "P_COUNTRYNAME";
                ParamName[8] = "P_CITYNAME";
                ParamName[9] = "P_SUBJECTNAME";
                ParamName[10] = "P_TUSHAALNO";
                ParamName[11] = "P_TUSHAALDATE";
                ParamName[12] = "P_TUSHAALFILENAME";
                ParamName[13] = "P_STAFFLIST";
                ParamName[14] = "P_STAFFID";
                ParamName[15] = "P_TOMILOLT_BUDGET_OTHER";
                ParamValue[0] = P_TOMILOL_ID;
                ParamValue[1] = P_TOMILOLTYPE_ID;
                ParamValue[2] = P_TOMILOLTDIRECTION_ID;
                ParamValue[3] = P_TOMILOLTBUDGET_ID;
                ParamValue[4] = P_FROMDATE;
                ParamValue[5] = P_TODATE;
                ParamValue[6] = P_DAYNUM;
                ParamValue[7] = P_COUNTRYNAME;
                ParamValue[8] = P_CITYNAME;
                ParamValue[9] = P_SUBJECTNAME;
                ParamValue[10] = P_TUSHAALNO;
                ParamValue[11] = P_TUSHAALDATE;
                ParamValue[12] = P_TUSHAALFILENAME;
                ParamValue[13] = P_STAFFLIST;
                ParamValue[14] = P_STAFFID;
                ParamValue[15] = P_TOMILOLT_BUDGET_OTHER;
                myObj.SP_OracleExecuteNonQuery("TOMILOLT_UPDATE", ParamName, ParamValue);
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
        [WebMethod]
        public static void TOMILOLT_DELETE(string P_TOMILOL_ID)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[1], ParamValue = new string[1];
                ParamName[0] = "P_TOMILOL_ID";
                ParamValue[0] = P_TOMILOL_ID;
                myObj.SP_OracleExecuteNonQuery("TOMILOLT_DELETE", ParamName, ParamValue);
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
        [WebMethod]
        public static string setrole_setroleTab1Datatable(string pos, string gazar, string heltes, string tp, string role)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.setroleTab1Datatable(pos, gazar, heltes, tp, role);
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
        [WebMethod]
        public static void STAFFS_ROLE(string P_STAFFS_ID, string P_ROLELIST)
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                string[] ParamName = new string[2], ParamValue = new string[2];
                ParamName[0] = "P_STAFFS_ID";
                ParamName[1] = "P_ROLELIST";
                ParamValue[0] = P_STAFFS_ID;
                ParamValue[1] = P_ROLELIST;
                myObj.SP_OracleExecuteNonQuery("STAFFS_ROLE", ParamName, ParamValue);
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
        [WebMethod]
        public static string chuluutime_chuluutimeTab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.chuluutimeTab1Datatable(year, currstaffid, gazar, heltes, staffid);
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
        [WebMethod]
        public static string chuluudayt2_chuluudayt2Tab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.chuluudayt2Tab1Datatable(year, currstaffid, gazar, heltes, staffid);
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
        [WebMethod]
        public static string chuluudayf3_chuluudayf3Tab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.chuluudayf3Tab1Datatable(year, currstaffid, gazar, heltes, staffid);
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
        [WebMethod]
        public static string chuluusick_chuluusickTab1Datatable(string year, string currstaffid, string gazar, string heltes, string staffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.chuluusickTab1Datatable(year, currstaffid, gazar, heltes, staffid);
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
        [WebMethod]
        public static string celebday_celebdayTab1Datatable(string currstaffid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.celebdayTab1Datatable(currstaffid);
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
        [WebMethod]
        public static string celebday_celebdayTab2Datatable(string currstaffid, string yr)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.celebdayTab2Datatable(currstaffid, yr);
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
        [WebMethod]
        public static string celebday_celebdayTab3Datatable(string currstaffid, string yr)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.celebdayTab3Datatable(currstaffid, yr);
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
        [WebMethod]
        public static string amralt_amraltTab1Datatable(string currstaffid, string gazar, string heltes, string staffid, string yr)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.amraltTab1Datatable(currstaffid, gazar, heltes, staffid, yr);
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
        //*************************trainingreq*******************
        [WebMethod]
        public static string trainingreq_trainingreqTab1Datatable(string currstid, string yr, string gazar, string heltes, string stid, string tp)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.trainingreqTab1Datatable(currstid, yr, gazar, heltes, stid, tp);
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
        //*************************inputintractive*******************
        [WebMethod]
        public static string inputintractive_inputintractiveTab3Datatable(string yr, string tp)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.inputintractiveTab3Datatable(yr, tp);
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
        //*************************finger id get*******************
        [WebMethod]
        public static string get_finger_id_info( string stid)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (!myObj.checkUserSession()) throw new cs.HRMISException("SessionDied");
                return myObjGetTableData.get_finger_id(stid);
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