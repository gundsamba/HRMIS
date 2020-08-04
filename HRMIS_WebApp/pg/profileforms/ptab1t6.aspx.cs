using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.profileforms
{
    public partial class ptab1t6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            try
            {
                OracleDataReader rdr = myObj.OracleExecuteReader("SELECT COL, EVAL FROM ST_SKILLS WHERE STAFFS_ID=" + Request.QueryString["id"] + " ORDER BY COL");
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        switch (Int32.Parse(rdr[0].ToString())) {
                            case 1: 
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD1T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD1T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD1T3.Checked = true;
                                break;
                            case 2:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD2T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD2T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD2T3.Checked = true;
                                break;
                            case 3:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD3T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD3T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD3T3.Checked = true;
                                break;
                            case 4:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD4T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD4T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD4T3.Checked = true;
                                break;
                            case 5:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD5T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD5T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD5T3.Checked = true;
                                break;
                            case 6:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD6T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD6T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD6T3.Checked = true;
                                break;
                            case 7:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD7T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD7T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD7T3.Checked = true;
                                break;
                            case 8:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD8T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD8T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD8T3.Checked = true;
                                break;
                            case 9:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD9T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD9T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD9T3.Checked = true;
                                break;
                            case 10:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD10T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD10T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD10T3.Checked = true;
                                break;
                            case 11:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD11T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD11T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD11T3.Checked = true;
                                break;
                            case 12:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD12T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD12T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD12T3.Checked = true;
                                break;
                            case 13:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD13T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD13T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD13T3.Checked = true;
                                break;
                            case 14:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD14T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD14T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD14T3.Checked = true;
                                break;
                            case 15:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD15T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD15T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD15T3.Checked = true;
                                break;
                            case 16:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD16T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD16T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD16T3.Checked = true;
                                break;
                            case 17:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD17T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD17T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD17T3.Checked = true;
                                break;
                            case 18:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD18T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD18T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD18T3.Checked = true;
                                break;
                            case 19:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD19T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD19T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD19T3.Checked = true;
                                break;
                            case 20:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD20T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD20T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD20T3.Checked = true;
                                break;
                            case 21:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD21T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD21T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD21T3.Checked = true;
                                break;
                            case 22:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD22T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD22T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD22T3.Checked = true;
                                break;
                            case 23:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD23T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD23T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD23T3.Checked = true;
                                break;
                            case 24:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD24T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD24T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD24T3.Checked = true;
                                break;
                            case 25:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD25T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD25T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD25T3.Checked = true;
                                break;
                            case 26:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD26T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD26T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD26T3.Checked = true;
                                break;
                            case 27:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD27T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD27T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD27T3.Checked = true;
                                break;
                            case 28:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD28T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD28T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD28T3.Checked = true;
                                break;
                            case 29:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD29T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD29T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD29T3.Checked = true;
                                break;
                            case 30:
                                if (Int32.Parse(rdr[1].ToString()) == 1) ptab1t6SkillsD30T1.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 2) ptab1t6SkillsD30T2.Checked = true;
                                else if (Int32.Parse(rdr[1].ToString()) == 3) ptab1t6SkillsD30T3.Checked = true;
                                break;
                        }
                    }
                }
                rdr.Close();
                rdr = myObj.OracleExecuteReader("SELECT COL, NAME, EVAL FROM ST_ANOTHERSKILLS WHERE STAFFS_ID=" + Request.QueryString["id"] + " ORDER BY COL");
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        switch (Int32.Parse(rdr[0].ToString()))
                        {
                            case 1:
                                pTab1t6AnotherD1Name.Value = rdr[1].ToString();
                                if (Int32.Parse(rdr[2].ToString()) == 1) ptab1t6AnotherD1T1.Checked = true;
                                else if (Int32.Parse(rdr[2].ToString()) == 2) ptab1t6AnotherD1T2.Checked = true;
                                else if (Int32.Parse(rdr[2].ToString()) == 3) ptab1t6AnotherD1T3.Checked = true;
                                break;
                            case 2:
                                pTab1t6AnotherD2Name.Value = rdr[1].ToString();
                                if (Int32.Parse(rdr[2].ToString()) == 1) ptab1t6SkillsD2T1.Checked = true;
                                else if (Int32.Parse(rdr[2].ToString()) == 2) ptab1t6SkillsD2T2.Checked = true;
                                else if (Int32.Parse(rdr[2].ToString()) == 3) ptab1t6SkillsD2T3.Checked = true;
                                break;
                            case 3:
                                pTab1t6AnotherD3Name.Value = rdr[1].ToString();
                                if (Int32.Parse(rdr[2].ToString()) == 1) ptab1t6SkillsD3T1.Checked = true;
                                else if (Int32.Parse(rdr[2].ToString()) == 2) ptab1t6SkillsD3T2.Checked = true;
                                else if (Int32.Parse(rdr[2].ToString()) == 3) ptab1t6SkillsD3T3.Checked = true;
                                break;
                        }
                    }
                }
                rdr.Close();
                myObj.DBDisconnect();
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
        }
    }
}