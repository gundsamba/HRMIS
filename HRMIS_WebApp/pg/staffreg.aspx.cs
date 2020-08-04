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
    public partial class staffreg : System.Web.UI.Page
    {
        DataSet ds = null;
        string userId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            userId = Session["HRMIS_UserID"].ToString();
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            CSession sessionClass = new CSession();
            CMain mainClass = new CMain();
            try
            {
                var userData = sessionClass.getCurrentUserData();
                bool boolRoleUser = false;
                for (int i = 0; i < userData.USR_ROLEDATA.Capacity; i++)
                {
                    if (userData.USR_ROLEDATA[i] == 1 || userData.USR_ROLEDATA[i] == 4)
                    {
                        boolRoleUser = true;
                        break;
                    }
                }
                if (!boolRoleUser) throw new cs.HRMISException("Ажилтны хөдөлгөөн, бүртгэлийн  хэсэгт хандах эрх байхгүй байна! Хандах эрхийг ТЗУГ-тай холбогдон авна уу.");
                if (Request.QueryString["ismove"] != null)
                {
                    if (Request.QueryString["ismove"] == "1")
                    {
                        pTab1AddBtn.Attributes["class"] = "hide";
                        pTab1H2Title.InnerHtml = "Бүрэлдэхүүн хөдөлгөөн";
                    }
                }
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_POS WHERE ISACTIVE=1");
                pTab1SelectPos.DataSource = ds.Tables[0];
                pTab1SelectPos.DataTextField = "NAME";
                pTab1SelectPos.DataValueField = "ID";
                pTab1SelectPos.DataBind();
                ds.Clear();
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR('1-0') as ID, TO_CHAR('Идэвхтэй') as NAME FROM DUAL UNION ALL SELECT '0-'||TO_CHAR(a.MOVETYPE_ID) as ID, TO_CHAR(b.NAME) as NAME FROM STN_MOVE a INNER JOIN STN_MOVETYPE b ON a.MOVETYPE_ID=b.ID WHERE a.ACTIVE=0 GROUP BY a.MOVETYPE_ID, b.NAME");
                pTab1SelectType.DataSource = ds.Tables[0];
                pTab1SelectType.DataTextField = "NAME";
                pTab1SelectType.DataValueField = "ID";
                pTab1SelectType.DataBind();
                pTab1SelectType.SelectedIndex = pTab1SelectType.Items.IndexOf(pTab1SelectType.Items.FindByValue("1-0"));
                ds.Clear();
                ds = myObj.OracleExecuteDataSet("SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_POS WHERE ISACTIVE=1");
                pTab1SelectPos.DataSource = ds.Tables[0];
                pTab1SelectPos.DataTextField = "NAME";
                pTab1SelectPos.DataValueField = "ID";
                pTab1SelectPos.DataBind();
                pTab1SelectGazar.DataSource = mainClass.getGazarList("- Бүгд -");
                pTab1SelectGazar.DataTextField = "INITNAME";
                pTab1SelectGazar.DataValueField = "ID";
                pTab1SelectGazar.DataBind();
                
                //ds = myObj.OracleExecuteDataSet("SELECT ID, INITNAME, NAME FROM ST_ORG WHERE ISACTIVE=1");
                //pTab1ModalSelectOrg.DataSource = ds.Tables[0];
                //pTab1ModalSelectOrg.DataTextField = "NAME";
                //pTab1ModalSelectOrg.DataValueField = "ID";
                //pTab1ModalSelectOrg.DataBind();
                //pTab1ModalSelectOrg.Disabled = true;
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID as ID, TO_CHAR(NAME) as NAME FROM STN_POSTYPE");
                //pTab1ModalSelectPostype.DataSource = ds.Tables[0];
                //pTab1ModalSelectPostype.DataTextField = "NAME";
                //pTab1ModalSelectPostype.DataValueField = "ID";
                //pTab1ModalSelectPostype.DataBind();
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_POS WHERE ISACTIVE=1");
                //pTab1ModalSelectPos.DataSource = ds.Tables[0];
                //pTab1ModalSelectPos.DataTextField = "NAME";
                //pTab1ModalSelectPos.DataValueField = "ID";
                //pTab1ModalSelectPos.DataBind();
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_CITY");
                //pTab1ModalSelectBcity.DataSource = ds.Tables[0];
                //pTab1ModalSelectBcity.DataTextField = "NAME";
                //pTab1ModalSelectBcity.DataValueField = "ID";
                //pTab1ModalSelectBcity.DataBind();
                //pTab1ModalSelectAddresscity.DataSource = ds.Tables[0];
                //pTab1ModalSelectAddresscity.DataTextField = "NAME";
                //pTab1ModalSelectAddresscity.DataValueField = "ID";
                //pTab1ModalSelectAddresscity.DataBind();
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_NAT");
                //pTab1ModalSelectNat.DataSource = ds.Tables[0];
                //pTab1ModalSelectNat.DataTextField = "NAME";
                //pTab1ModalSelectNat.DataValueField = "ID";
                //pTab1ModalSelectNat.DataBind();
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_EDUTP");
                //pTab1ModalSelectEdutp.DataSource = ds.Tables[0];
                //pTab1ModalSelectEdutp.DataTextField = "NAME";
                //pTab1ModalSelectEdutp.DataValueField = "ID";
                //pTab1ModalSelectEdutp.DataBind();
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_SOCPOS");
                //pTab1ModalSelectSocpos.DataSource = ds.Tables[0];
                //pTab1ModalSelectSocpos.DataTextField = "NAME";
                //pTab1ModalSelectSocpos.DataValueField = "ID";
                //pTab1ModalSelectSocpos.DataBind();
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_OCCTYPE");
                //pTab1ModalSelectOcctp.DataSource = ds.Tables[0];
                //pTab1ModalSelectOcctp.DataTextField = "NAME";
                //pTab1ModalSelectOcctp.DataValueField = "ID";
                //pTab1ModalSelectOcctp.DataBind();
                //ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_RELATION");
                //pTab1ModalSelectRelRelation.DataSource = ds.Tables[0];
                //pTab1ModalSelectRelRelation.DataTextField = "NAME";
                //pTab1ModalSelectRelRelation.DataValueField = "ID";
                //pTab1ModalSelectRelRelation.DataBind();
            }
            catch (NullReferenceException ex)
            {

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
            try
            {
             //   if (!myObjGetTableData.checkRoles(userId, "1,4"))
              //  {
              //      pIsRole.Style.Add("display", "block");
              //      pMainDiv.Style.Add("display", "none");
              //  }
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