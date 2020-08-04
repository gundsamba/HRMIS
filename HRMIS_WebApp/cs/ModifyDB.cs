//using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Data.OleDb;

namespace HRWebApp.cs
{
    public class ModifyDB
    {
        public OracleConnection con;
        public OracleCommand cmd;
        //public MySqlConnection conmysql;
        //public MySqlCommand cmdmysql;
        public OleDbConnection conoledb;
        public OleDbCommand cmdoledb;

        public  bool checkUserSession()
        {
            if (HttpContext.Current.Session["HRMIS_UserID"] != null) return true;
            else return false;
        }
        public int OracleExecuteNonQuery(string strQry)
        {
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                cmd = new OracleCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQry;
                cmd.Connection = DBConnect();
                return cmd.ExecuteNonQuery();
            }
            catch (cs.HRMISException ex)
            {
                //cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
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
            finally { DBDisconnect(); }
        }
        public object OracleExecuteScalar(string strQry)
        {
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                cmd = new OracleCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQry;
                cmd.Connection = DBConnect();
                return cmd.ExecuteScalar();
            }
            catch (cs.HRMISException ex)
            {
                //cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
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
            finally
            {
                DBDisconnect();
            }
        }
        public OracleDataReader OracleExecuteReader(string strQry)
        {
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                cmd = new OracleCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQry;
                cmd.Connection = DBConnect();
                return cmd.ExecuteReader();
            }
            catch (cs.HRMISException ex)
            {
                //cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
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
            finally { }
        }
        public OracleCommand OracleCMD(string strQry)
        {
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                cmd = new OracleCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQry;
                cmd.Connection = DBConnect();
                return cmd;
            }
            catch (cs.HRMISException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { }
        }
        protected  OracleConnection DBConnect()
        {
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                con = new OracleConnection(ConfigurationManager.ConnectionStrings["HRMISDBCONN"].ConnectionString);
                if (con.State == ConnectionState.Closed) con.Open();
            }
            catch (cs.HRMISException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            return con;
        }
        public  void DBDisconnect()
        {
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                    con.Dispose();
                }
            }
            catch (cs.HRMISException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
        }
        public  int SP_OracleExecuteNonQuery(string SPName, string[] Params1, string[] Params2)
        {
            OracleCommand cmd;
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                cmd = new OracleCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = SPName;
                cmd.Connection = DBConnect();
                if ((Params1 != null || Params1.Length > 0) && (Params2 != null || Params2.Length > 0)) for (int i = 0; i < Params1.Length; i++) cmd.Parameters.AddWithValue(Params1[i], Params2[i]);
                return cmd.ExecuteNonQuery();
            }
            catch (cs.HRMISException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { DBDisconnect(); }
        }
        public DataSet OracleExecuteDataSet(string strQry)
        {
            GetTableData myObjGetTableData = new GetTableData();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataSet dataSet = null;
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                cmd = new OracleCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQry;
                cmd.Connection = DBConnect();
                adapter.SelectCommand = cmd;
                dataSet = new DataSet();
                adapter.Fill(dataSet);
            }
            catch (cs.HRMISException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                ////cs.WriteLogForEx.WriteLog(ex);
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally
            {
                DBDisconnect();
            }
            return dataSet;
        }

        /////////MYSQL//////////
        //protected MySqlConnection DBConnectMySql()
        //{
        //    conmysql = new MySqlConnection(ConfigurationManager.ConnectionStrings["MOFGOVMNConn"].ConnectionString);
        //    try
        //    {
        //        if (conmysql.State == ConnectionState.Closed) conmysql.Open();
        //    }
        //    catch (Exception ex)
        //    {
        //        HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
        //    }
        //    return conmysql;
        //}
        //public void DBDisconnectMySql()
        //{
        //    if (conmysql.State == ConnectionState.Open)
        //    {
        //        conmysql.Close();
        //        conmysql.Dispose();
        //    }
        //}
        //public MySqlDataReader MySqlExecuteReader(string strQry)
        //{
        //    try
        //    {
        //        cmdmysql = new MySqlCommand();
        //        cmdmysql.CommandType = CommandType.Text;
        //        cmdmysql.CommandText = strQry;
        //        cmdmysql.Connection = DBConnectMySql();
        //        return cmdmysql.ExecuteReader();
        //    }
        //    catch (DbException DbEx)
        //    {
        //        throw DbEx;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //    }
        //}
        //public object MySqlExecuteScalar(string strQry)
        //{
        //    try
        //    {
        //        cmdmysql = new MySqlCommand();
        //        cmdmysql.CommandType = CommandType.Text;
        //        cmdmysql.CommandText = strQry;
        //        cmdmysql.Connection = DBConnectMySql();
        //        return cmdmysql.ExecuteScalar();
        //    }
        //    catch (DbException DbEx)
        //    {
        //        throw DbEx;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        DBDisconnectMySql();
        //    }
        //}
        //public int SP_MySqlExecuteNonQuery(string SPName, string[] Params1, string[] Params2)
        //{
        //    MySqlCommand cmd;
        //    try
        //    {
        //        cmd = new MySqlCommand();
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = SPName;
        //        cmd.Connection = DBConnectMySql();
        //        if ((Params1 != null || Params1.Length > 0) && (Params2 != null || Params2.Length > 0)) for (int i = 0; i < Params1.Length; i++) cmd.Parameters.AddWithValue(Params1[i], Params2[i]);
        //        return cmd.ExecuteNonQuery();
        //    }
        //    catch (DbException DbEx)
        //    {
        //        throw DbEx;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        DBDisconnectMySql();
        //    }
        //}
        //public DataSet MySqlExecuteDataSet(string strQry)
        //{
        //    OracleDataAdapter adapter = new OracleDataAdapter();
        //    DataSet dataSet = null;
        //    try
        //    {
        //        cmdmysql = new MySqlCommand();
        //        cmdmysql.CommandType = CommandType.Text;
        //        cmdmysql.CommandText = strQry;
        //        cmdmysql.Connection = DBConnectMySql();
        //        adapter.SelectCommand = cmd;
        //        dataSet = new DataSet();
        //        adapter.Fill(dataSet);
        //    }
        //    catch (cs.HRMISException ex)
        //    {
        //        ////cs.WriteLogForEx.WriteLog(ex);
        //        HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
        //        throw ex;
        //    }
        //    catch (DbException ex)
        //    {
        //        ////cs.WriteLogForEx.WriteLog(ex);
        //        HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
        //        throw ex;
        //    }
        //    catch (Exception ex)
        //    {
        //        ////cs.WriteLogForEx.WriteLog(ex);
        //        HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
        //        throw ex;
        //    }
        //    finally
        //    {
        //        DBDisconnect();
        //    }
        //    return dataSet;
        //}

        ////////////InterBase//////////
        public OleDbConnection OleDBConnect() {
            conoledb = new OleDbConnection(ConfigurationManager.ConnectionStrings["IBConn"].ConnectionString);
            try
            {
                if (conoledb.State == ConnectionState.Closed) conoledb.Open();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
            }
            return conoledb;
        }
        public OleDbConnection OleDBConnect_Payroll()
        {
            conoledb = new OleDbConnection(ConfigurationManager.ConnectionStrings["IBConn_Payroll"].ConnectionString);
            try
            {
                if (conoledb.State == ConnectionState.Closed) conoledb.Open();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
            }
            return conoledb;
        }
        public void OleDBDisconnect()
        {
            if (conoledb.State == ConnectionState.Open)
            {
                conoledb.Close();
                conoledb.Dispose();
            }
        }
        public DataSet OleDBExecuteDataSet(string strQry, bool isPayroll = false)
        {
            OleDbDataAdapter adapter = new OleDbDataAdapter();
            DataSet dataSet = null;
            try
            {
                cmdoledb = new OleDbCommand();
                cmdoledb.CommandType = CommandType.Text;
                cmdoledb.CommandText = strQry;
                if(isPayroll) cmdoledb.Connection = OleDBConnect_Payroll();
                else cmdoledb.Connection = OleDBConnect();
                adapter.SelectCommand = cmdoledb;
                dataSet = new DataSet();
                adapter.Fill(dataSet);
            }
            catch (cs.HRMISException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally
            {
                OleDBDisconnect();
            }
            return dataSet;
        }
        public OleDbDataReader OleDBExecuteReader(string strQry)
        {
            try
            {
                if (!checkUserSession()) throw new cs.HRMISException("SessionDied");
                cmdoledb = new OleDbCommand();
                cmdoledb.CommandType = CommandType.Text;
                cmdoledb.CommandText = strQry;
                cmdoledb.Connection = OleDBConnect();
                return cmdoledb.ExecuteReader();
            }
            catch (cs.HRMISException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (DbException ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                throw ex;
            }
            finally { }
        }
    }
}