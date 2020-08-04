using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.profileforms
{
    public partial class celebday : System.Web.UI.Page
    {
        string userId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            try
            {
                for (int i = 2000; i <= (DateTime.Now.Year + 1); i++) {
                    pTab2SelectYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    pTab3SelectYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
                pTab2SelectYear.SelectedIndex = pTab2SelectYear.Items.IndexOf(pTab2SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
                pTab3SelectYear.SelectedIndex = pTab2SelectYear.Items.IndexOf(pTab3SelectYear.Items.FindByValue(DateTime.Now.Year.ToString()));
            }
            catch (NullReferenceException ex)
            {

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

            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                userId = HttpContext.Current.Session["HRMIS_UserID"].ToString();
                if (!myObjGetTableData.checkRoles(userId, "1,5"))
                {
                    pIsRole.Style.Add("display", "block");
                    pMainDiv.Style.Add("display", "none");
                }
            }
            catch (cs.HRMISException ex)
            {
                Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                Response.Redirect("../pg/error500.aspx");
            }
            catch (Exception ex)
            {
                Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
                Response.Redirect("../pg/error500.aspx");
            }
        }
    }
}