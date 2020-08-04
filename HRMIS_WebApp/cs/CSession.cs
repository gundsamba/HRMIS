using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HRWebApp.cs
{
    public class UserData
    {
        public int USR_STAFFID { get; set; }
        public string USR_DOMAIN { get; set; }
        public List<int> USR_ROLEDATA { get; set; }
        public string USR_FNAME { get; set; }
        public string USR_MNAME { get; set; }
        public string USR_LNAME { get; set; }
        public int USR_HELTESID { get; set; }
        public string USR_HELTESINITNAME { get; set; }
        public int USR_GAZARID { get; set; }
        public string USR_GAZARINITNAME { get; set; }
        public int USR_POSID { get; set; }
        public string USR_POSNAME { get; set; }
        public string USR_POSTYPENAME { get; set; }
        public int USR_HELTESBOSSID { get; set; }
        public string USR_HELTESBOSSINITNAME { get; set; }
        public int USR_GAZARBOSSID { get; set; }
        public string USR_GAZARBOSSINITNAME { get; set; }
        public string USR_FINGERID { get; set; }
        public string USR_REGNO { get; set; }
    }
    public class ExData {
        public string EX_MESSAGE { get; set; }
        public string EX_STACKTRACE { get; set; }
        public bool EX_ISPERMISSION { get; set; }
    }
    public class CSession
    {
        public UserData getCurrentUserData()
        {
            return (UserData)HttpContext.Current.Session["HRMIS_UserData"];
        }
        public void setUserData(UserData userData)
        {
            HttpContext.Current.Session["HRMIS_UserData"] = userData;
        }
    }
}