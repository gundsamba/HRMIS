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
    public partial class staffsdataadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            DataSet ds = null;
            CSession sessionClass = new CSession();
            string strQry0 = "", strQry1 = "", strQry2 = "", strQry3 = "";
            try
            {
                var userData = sessionClass.getCurrentUserData();
                bool boolRoleUser = false;
                for (int i = 0; i < userData.USR_ROLEDATA.Capacity; i++)
                {
                    if (userData.USR_ROLEDATA[i] == 1 || userData.USR_ROLEDATA[i] == 19)
                    {
                        boolRoleUser = true;
                        break;
                    }
                }
                if (!boolRoleUser) throw new cs.HRMISException("Шагнал, зэрэг дэв хэсэгт хандах эрх байхгүй байна! Хандах эрхийг ТЗУГ-тай холбогдон авна уу.");
                strQry0 = "SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_SHAGNALTYPE";
                strQry1 = "SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_SHAGNALDECISION";
                strQry2 = "SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_POSDEGREEDTL";
                strQry3 = "SELECT '' as ID, TO_CHAR('- Бүгд -') as NAME FROM DUAL UNION ALL SELECT TO_CHAR(ID) as ID, TO_CHAR(NAME) as NAME FROM STN_RANKPOSDEGREE";
                ds = myObj.OracleExecuteDataSet(strQry0);
                pTab1SelectShagnaltype.DataSource = ds.Tables[0];
                pTab1SelectShagnaltype.DataTextField = "NAME";
                pTab1SelectShagnaltype.DataValueField = "ID";
                pTab1SelectShagnaltype.DataBind();
                pTab1ModalSelectShagnaltype.DataSource = ds.Tables[0];
                pTab1ModalSelectShagnaltype.DataTextField = "NAME";
                pTab1ModalSelectShagnaltype.DataValueField = "ID";
                pTab1ModalSelectShagnaltype.DataBind();
                ds = myObj.OracleExecuteDataSet(strQry1);
                pTab1SelectShagnalDecision.DataSource = ds.Tables[0];
                pTab1SelectShagnalDecision.DataTextField = "NAME";
                pTab1SelectShagnalDecision.DataValueField = "ID";
                pTab1SelectShagnalDecision.DataBind();
                pTab1ModalSelectShagnaldecision.DataSource = ds.Tables[0];
                pTab1ModalSelectShagnaldecision.DataTextField = "NAME";
                pTab1ModalSelectShagnaldecision.DataValueField = "ID";
                pTab1ModalSelectShagnaldecision.DataBind();
                ds = myObj.OracleExecuteDataSet(strQry2);
                pTab2SelectPosdegreedtl.DataSource = ds.Tables[0];
                pTab2SelectPosdegreedtl.DataTextField = "NAME";
                pTab2SelectPosdegreedtl.DataValueField = "ID";
                pTab2SelectPosdegreedtl.DataBind();
                pTab2ModalSelectPosdegreedtl.DataSource = ds.Tables[0];
                pTab2ModalSelectPosdegreedtl.DataTextField = "NAME";
                pTab2ModalSelectPosdegreedtl.DataValueField = "ID";
                pTab2ModalSelectPosdegreedtl.DataBind();
                ds = myObj.OracleExecuteDataSet(strQry3);
                pTab2SelectRankposdegree.DataSource = ds.Tables[0];
                pTab2SelectRankposdegree.DataTextField = "NAME";
                pTab2SelectRankposdegree.DataValueField = "ID";
                pTab2SelectRankposdegree.DataBind();
                pTab2ModalSelectRankposdegree.DataSource = ds.Tables[0];
                pTab2ModalSelectRankposdegree.DataTextField = "NAME";
                pTab2ModalSelectRankposdegree.DataValueField = "ID";
                pTab2ModalSelectRankposdegree.DataBind();
                pTab1SelectTodate.Value = DateTime.Now.ToString("yyyy-MM-dd");
                pTab1SelectFromdate.Value = DateTime.Now.AddMonths(-3).ToString("yyyy-MM-dd");
                pTab2SelectTodate.Value = DateTime.Now.ToString("yyyy-MM-dd");
                pTab2SelectFromdate.Value = DateTime.Now.AddMonths(-3).ToString("yyyy-MM-dd");
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