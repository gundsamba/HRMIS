using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.profileforms
{
    public partial class ptab1t1 : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login.html");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_CITY");
            pTab1ModalSelectBcity.DataSource = ds.Tables[0];
            pTab1ModalSelectBcity.DataTextField = "NAME";
            pTab1ModalSelectBcity.DataValueField = "ID";
            pTab1ModalSelectBcity.DataBind();
            pTab1ModalSelectAddresscity.DataSource = ds.Tables[0];
            pTab1ModalSelectAddresscity.DataTextField = "NAME";
            pTab1ModalSelectAddresscity.DataValueField = "ID";
            pTab1ModalSelectAddresscity.DataBind();
            ds.Clear();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_NAT");
            pTab1ModalSelectNat.DataSource = ds.Tables[0];
            pTab1ModalSelectNat.DataTextField = "NAME";
            pTab1ModalSelectNat.DataValueField = "ID";
            pTab1ModalSelectNat.DataBind();
            ds.Clear();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_EDUTP");
            pTab1ModalSelectEdutp.DataSource = ds.Tables[0];
            pTab1ModalSelectEdutp.DataTextField = "NAME";
            pTab1ModalSelectEdutp.DataValueField = "ID";
            pTab1ModalSelectEdutp.DataBind();
            ds.Clear();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_SOCPOS");
            pTab1ModalSelectSocpos.DataSource = ds.Tables[0];
            pTab1ModalSelectSocpos.DataTextField = "NAME";
            pTab1ModalSelectSocpos.DataValueField = "ID";
            pTab1ModalSelectSocpos.DataBind();
            ds.Clear();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_OCCTYPE");
            pTab1ModalSelectOcctp.DataSource = ds.Tables[0];
            pTab1ModalSelectOcctp.DataTextField = "NAME";
            pTab1ModalSelectOcctp.DataValueField = "ID";
            pTab1ModalSelectOcctp.DataBind();
            ds.Clear();
            ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_RELATION");
            pTab1ModalSelectRelRelation.DataSource = ds.Tables[0];
            pTab1ModalSelectRelRelation.DataTextField = "NAME";
            pTab1ModalSelectRelRelation.DataValueField = "ID";
            pTab1ModalSelectRelRelation.DataBind();

            ds.Clear();
            ds = myObj.OracleExecuteDataSet(@"SELECT NATIONALITY, MNAME, LNAME, FNAME, GENDER, BDATE, EDUTP_ID, OCCTYPE_ID, OCCNAME, BCITY_ID, BDIST_ID, BPLACE, NAT_ID, SOCPOS_ID, ADDRCITY_ID, ADDRDIST_ID, ADDRESSNAME, TEL, TEL2, EMAIL, RELNAME, RELATION_ID, RELADDRESSNAME, RELTEL, RELTEL2, RELEMAIL, MACID 
FROM ST_STAFFS 
WHERE ID=" + Request.QueryString["id"]);
            //string strVal = myObj.OracleExecuteScalar("SELECT MNAME||'~'||LNAME||'~'||FNAME||'~'||GENDER||'~'||BDATE||'~'||EDUTP_ID||'~'||OCCTYPE_ID||'~'||OCCNAME||'~'||BCITY_ID||'~'||BDIST_ID||'~'||BPLACE||'~'||NAT_ID||'~'||SOCPOS_ID||'~'||ADDRCITY_ID||'~'||ADDRDIST_ID||'~'||ADDRESSNAME||'~'||TEL||'~'||TEL2||'~'||EMAIL||'~'||RELNAME||'~'||RELATION_ID||'~'||RELADDRESSNAME||'~'||RELTEL||'~'||RELTEL2||'~'||RELEMAIL||'~'||MACID FROM ST_STAFFS WHERE ID=" + Request.QueryString["id"]).ToString();
            //section1
            pTab1ModalInputNationality.Value = ds.Tables[0].Rows[0]["NATIONALITY"].ToString();
            pTab1ModalInputMName.Value = ds.Tables[0].Rows[0]["MNAME"].ToString();
            pTab1ModalInputLName.Value = ds.Tables[0].Rows[0]["LNAME"].ToString();
            pTab1ModalInputFName.Value = ds.Tables[0].Rows[0]["FNAME"].ToString();
            if (ds.Tables[0].Rows[0]["GENDER"].ToString() == "1") pTab1ModalSelectGenderMale.Attributes["checked"] = "checked";
            else pTab1ModalSelectGenderFemale.Attributes["checked"] = "checked";
            pTab1ModalInputBdate.Value = ds.Tables[0].Rows[0]["BDATE"].ToString();
            pTab1ModalSelectEdutp.SelectedIndex = pTab1ModalSelectEdutp.Items.IndexOf(pTab1ModalSelectEdutp.Items.FindByValue(ds.Tables[0].Rows[0]["EDUTP_ID"].ToString()));
            pTab1ModalSelectOcctp.SelectedIndex = pTab1ModalSelectOcctp.Items.IndexOf(pTab1ModalSelectOcctp.Items.FindByValue(ds.Tables[0].Rows[0]["OCCTYPE_ID"].ToString()));
            pTab1ModalInputOccname.Value = ds.Tables[0].Rows[0]["NATIONALITY"].ToString();
            //section2
            pTab1ModalSelectBcity.SelectedIndex = pTab1ModalSelectBcity.Items.IndexOf(pTab1ModalSelectBcity.Items.FindByValue(ds.Tables[0].Rows[0]["BCITY_ID"].ToString()));
            string strBCITY_ID = ds.Tables[0].Rows[0]["BCITY_ID"].ToString();
            string strBDIST_ID = ds.Tables[0].Rows[0]["BDIST_ID"].ToString();
            pTab1ModalInputBplace.Value = ds.Tables[0].Rows[0]["BPLACE"].ToString();
            pTab1ModalSelectNat.SelectedIndex = pTab1ModalSelectNat.Items.IndexOf(pTab1ModalSelectNat.Items.FindByValue(ds.Tables[0].Rows[0]["NAT_ID"].ToString()));
            pTab1ModalSelectSocpos.SelectedIndex = pTab1ModalSelectSocpos.Items.IndexOf(pTab1ModalSelectSocpos.Items.FindByValue(ds.Tables[0].Rows[0]["SOCPOS_ID"].ToString()));
            //section3
            pTab1ModalSelectAddresscity.SelectedIndex = pTab1ModalSelectAddresscity.Items.IndexOf(pTab1ModalSelectAddresscity.Items.FindByValue(ds.Tables[0].Rows[0]["ADDRCITY_ID"].ToString()));
            string strADDRCITY_ID = ds.Tables[0].Rows[0]["ADDRCITY_ID"].ToString();
            string strADDRDIST_ID = ds.Tables[0].Rows[0]["ADDRDIST_ID"].ToString();
            pTab1ModalInputAddressname.Value = ds.Tables[0].Rows[0]["ADDRESSNAME"].ToString();
            pTab1ModalInputTel.Value = ds.Tables[0].Rows[0]["TEL"].ToString();
            pTab1ModalInputTel2.Value = ds.Tables[0].Rows[0]["TEL2"].ToString();
            pTab1ModalInputEmail.Value = ds.Tables[0].Rows[0]["EMAIL"].ToString();
            //section4
            pTab1ModalInputRelName.Value = ds.Tables[0].Rows[0]["RELNAME"].ToString();
            pTab1ModalSelectRelRelation.SelectedIndex = pTab1ModalSelectRelRelation.Items.IndexOf(pTab1ModalSelectRelRelation.Items.FindByValue(ds.Tables[0].Rows[0]["RELATION_ID"].ToString()));
            pTab1ModalInputRelAddress.Value = ds.Tables[0].Rows[0]["RELADDRESSNAME"].ToString();
            pTab1ModalInputRelTel.Value = ds.Tables[0].Rows[0]["RELTEL"].ToString();
            pTab1ModalInputRelTel2.Value = ds.Tables[0].Rows[0]["RELTEL2"].ToString();
            pTab1ModalInputRelEmail.Value = ds.Tables[0].Rows[0]["RELEMAIL"].ToString();
            MacID.Value = ds.Tables[0].Rows[0]["MACID"].ToString();
            if (strBCITY_ID != "")
            {
                ds.Clear();
                ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_DIST WHERE BCITY_ID=" + strBCITY_ID + "");
                pTab1ModalSelectBdist.DataSource = ds.Tables[0];
                pTab1ModalSelectBdist.DataTextField = "NAME";
                pTab1ModalSelectBdist.DataValueField = "ID";
                pTab1ModalSelectBdist.DataBind();
                pTab1ModalSelectBdist.Disabled = false;
                if (strBDIST_ID != "") pTab1ModalSelectBdist.SelectedIndex = pTab1ModalSelectBdist.Items.IndexOf(pTab1ModalSelectBdist.Items.FindByValue(strBDIST_ID));
            }
            if (strADDRCITY_ID != "")
            {
                ds.Clear();
                ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_DIST WHERE BCITY_ID=" + strADDRCITY_ID + "");
                pTab1ModalSelectAddressdist.DataSource = ds.Tables[0];
                pTab1ModalSelectAddressdist.DataTextField = "NAME";
                pTab1ModalSelectAddressdist.DataValueField = "ID";
                pTab1ModalSelectAddressdist.DataBind();
                pTab1ModalSelectAddressdist.Disabled = false;
                if (strADDRDIST_ID != "") pTab1ModalSelectAddressdist.SelectedIndex = pTab1ModalSelectAddressdist.Items.IndexOf(pTab1ModalSelectAddressdist.Items.FindByValue(strADDRDIST_ID));
            }
        }
    }
}