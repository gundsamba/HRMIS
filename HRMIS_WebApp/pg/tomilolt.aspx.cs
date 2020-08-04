using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class tomilolt : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                string strTomiloltTypeName = "";
                if (Request.QueryString["id"] != null)
                {
                    if ("0" != myObj.OracleExecuteScalar("SELECT COUNT(1) FROM STN_TOMILOLTYPE WHERE ID=" + Request.QueryString["id"]).ToString())
                    {
                        pTab1SelectMy.Items.Add(new ListItem("Миний", Session["HRMIS_UserID"].ToString()));
                        if(Request.QueryString["id"] == "1"){
                            if (!myObjGetTableData.checkRoles(Session["HRMIS_UserID"].ToString(), "1,2"))
                            {
                                pTab1SelectMy.SelectedIndex = pTab1SelectMy.Items.IndexOf(pTab1SelectMy.Items.FindByValue(Session["HRMIS_UserID"].ToString()));
                                pTab1SelectMy.Disabled = true;
                            }
                        }
                        else if (Request.QueryString["id"] == "2")
                        {
                            if (!myObjGetTableData.checkRoles(Session["HRMIS_UserID"].ToString(), "1,3"))
                            {
                                pTab1SelectMy.SelectedIndex = pTab1SelectMy.Items.IndexOf(pTab1SelectMy.Items.FindByValue(Session["HRMIS_UserID"].ToString()));
                                pTab1SelectMy.Disabled = true;
                            }
                        }
                        
                        pTab1SelectTodate.Value = DateTime.Now.ToString("yyyy-MM-dd");
                        pTab1SelectFromdate.Value = DateTime.Now.AddMonths(-3).ToString("yyyy-MM-dd");
                        strTomiloltTypeName = myObj.OracleExecuteScalar("SELECT NAME FROM STN_TOMILOLTYPE WHERE ID=" + Request.QueryString["id"]).ToString();
                        tomiloltTypeSpan1.InnerHtml = strTomiloltTypeName;
                        tomiloltTypeSpan2.InnerHtml = strTomiloltTypeName+"ын";
                        tomiloltTypeSpan3.InnerHtml = strTomiloltTypeName;
                        tomiloltTypeSpan4.InnerHtml = strTomiloltTypeName;
                        if (Request.QueryString["id"] == "1") {
                            pTab1ModalLabelCountry.InnerHtml = "Аль улс";
                            pTab1ModalInputCountry.Attributes["placeholder"] = "Аль улс";
                            pTab1ModalLabelCity.InnerHtml = "Ямар хот";
                            pTab1ModalInputCity.Attributes["placeholder"] = "Ямар хот";
                        }
                        else if (Request.QueryString["id"] == "2")
                        {
                            pTab1ModalLabelCountry.InnerHtml = "Аль аймаг, нийслэл";
                            pTab1ModalInputCountry.Attributes["placeholder"] = "Аль аймаг, нийслэл";
                            pTab1ModalLabelCity.InnerHtml = "Ямар хот, сум, дүүрэг";
                            pTab1ModalInputCity.Attributes["placeholder"] = "Ямар хот, сум, дүүрэг";
                        }
                        dt.Rows.Clear();
                        dt.Load(myObj.OracleExecuteReader("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_TOMILOLTYPE"));
                        myObj.DBDisconnect();
                        pTab1ModalSelectType.DataSource = dt;
                        pTab1ModalSelectType.DataTextField = "NAME";
                        pTab1ModalSelectType.DataValueField = "ID";
                        pTab1ModalSelectType.DataBind();
                        pTab1ModalSelectType.SelectedIndex = pTab1ModalSelectType.Items.IndexOf(pTab1ModalSelectType.Items.FindByValue(Request.QueryString["id"]));
                        pTab1ModalSelectType.Disabled = true;
                        dt.Rows.Clear();
                        dt.Load(myObj.OracleExecuteReader("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_TOMILOLTDIRECTION"));
                        myObj.DBDisconnect();
                        pTab1SelectDirection.DataSource = dt;
                        pTab1SelectDirection.DataTextField = "NAME";
                        pTab1SelectDirection.DataValueField = "ID";
                        pTab1SelectDirection.DataBind();
                        pTab1ModalSelectDirection.DataSource = dt;
                        pTab1ModalSelectDirection.DataTextField = "NAME";
                        pTab1ModalSelectDirection.DataValueField = "ID";
                        pTab1ModalSelectDirection.DataBind();
                        dt.Rows.Clear();
                        dt.Load(myObj.OracleExecuteReader("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_TOMILOLTBUDGET"));
                        myObj.DBDisconnect();
                        pTab1SelectBudget.DataSource = dt;
                        pTab1SelectBudget.DataTextField = "NAME";
                        pTab1SelectBudget.DataValueField = "ID";
                        pTab1SelectBudget.DataBind();
                        pTab1ModalSelectBudget.DataSource = dt;
                        pTab1ModalSelectBudget.DataTextField = "NAME";
                        pTab1ModalSelectBudget.DataValueField = "ID";
                        pTab1ModalSelectBudget.DataBind();
                    }
                    else
                    {
                        Session["error500"] = "БУРУУ ХАНДАЛТ";
                        Response.Redirect("~/#pg/error500.aspx");
                    }
                }
                else
                {
                    Session["error500"] = "БУРУУ ХАНДАЛТ";
                    Response.Redirect("~/#pg/error500.aspx");
                }
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