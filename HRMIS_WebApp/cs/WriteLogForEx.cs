using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace HRWebApp.cs
{
    public class WriteLogForEx
    {
        public void WriteLog(Exception myex)
        {
            //if (HttpContext.Current.Session["HRMIS_UserID"] != null)
            //{
            //    using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/hrmisexlogs.txt")))
            //    {
            //        w.WriteLine("Алдаа : {0} {1} - {2}", DateTime.Now.ToLongTimeString(), DateTime.Now.ToLongDateString(), cs.ModifyDB.OracleExecuteScalar("SELECT DOMAIN_USER||' '||SUBSTR(LNAME,0,1)||'.'||FNAME FROM ST_STAFFS WHERE ID=" + HttpContext.Current.Session["HRMIS_UserID"]).ToString());
            //        w.Write("  Message:{0}", myex.Message);
            //        w.WriteLine("  StackTrace:{0}", myex.StackTrace);
            //        w.WriteLine("--------------------------------------------------------------------------------");
            //    }
            //}
            //else
            //{
            //    using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/hrmisexlogs.txt")))
            //    {
            //        w.WriteLine("Алдаа : Session Died");
            //        w.WriteLine("--------------------------------------------------------------------------------");
            //    }
            //}
        }
    }
}