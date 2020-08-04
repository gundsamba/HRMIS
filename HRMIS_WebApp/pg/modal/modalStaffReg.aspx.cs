using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.modal
{
    public partial class modalStaffReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else
            {
                GetTableData myObjGetTableData = new GetTableData();
                ModifyDB myObj = new ModifyDB();
                try
                {
                    DataSet ds = null;
                    spanModifyType.InnerHtml = "нэмэх";
                    pTab1ID.Value = "";
                    ds = myObj.OracleExecuteDataSet("SELECT ID, INITNAME, NAME FROM ST_ORG WHERE ISACTIVE=1");
                    pTab1ModalSelectOrg.DataSource = ds.Tables[0];
                    pTab1ModalSelectOrg.DataTextField = "NAME";
                    pTab1ModalSelectOrg.DataValueField = "ID";
                    pTab1ModalSelectOrg.DataBind();
                    pTab1ModalSelectOrg.Disabled = true;
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet(@"SELECT ID, NAME, SORT FROM ( SELECT null as ID, TO_CHAR('- Сонго -') as NAME, 0 as SORT FROM DUAL UNION ALL SELECT a.ID, CASE WHEN b.ID=a.ID THEN TO_CHAR(b.INITNAME) ELSE TO_CHAR(b.INITNAME||' - '||a.INITNAME) END as NAME, a.SORT
FROM ST_BRANCH a 
INNER JOIN ST_BRANCH b ON a.FATHER_ID=b.ID 
WHERE a.ISACTIVE=1 )
ORDER BY SORT ASC");
                    pTab1ModalSelectBranch.DataSource = ds.Tables[0];
                    pTab1ModalSelectBranch.DataTextField = "NAME";
                    pTab1ModalSelectBranch.DataValueField = "ID";
                    pTab1ModalSelectBranch.DataBind();
                    pTab1ModalInputDomainname.Value = "";
                    pTab1ModalHiddenMove.Value = "";
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID as ID, TO_CHAR(NAME) as NAME FROM STN_POSTYPE");
                    pTab1ModalSelectPostype.DataSource = ds.Tables[0];
                    pTab1ModalSelectPostype.DataTextField = "NAME";
                    pTab1ModalSelectPostype.DataValueField = "ID";
                    pTab1ModalSelectPostype.DataBind();
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_POS WHERE ISACTIVE=1");
                    pTab1ModalSelectPos.DataSource = ds.Tables[0];
                    pTab1ModalSelectPos.DataTextField = "NAME";
                    pTab1ModalSelectPos.DataValueField = "ID";
                    pTab1ModalSelectPos.DataBind();
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM ( SELECT null as ID, TO_CHAR('- Сонго -') as NAME, 0 as SORT1, 0 as SORT2 FROM DUAL UNION ALL SELECT a.ID, TO_CHAR(a.NAME) as NAME, b.SORT as SORT1, a.SORT as SORT2 FROM ST_RANK a INNER JOIN STN_RANKPOSTYPE b ON a.RANKPOSTYPE_ID=b.ID ) ORDER BY SORT1 ASC, SORT2 ASC");
                    pTab1ModalSelectRank.DataSource = ds.Tables[0];
                    pTab1ModalSelectRank.DataTextField = "NAME";
                    pTab1ModalSelectRank.DataValueField = "ID";
                    pTab1ModalSelectRank.DataBind();
                    pTab1ModalInputSigndate.Value = "";
                    pTab1ModalInputTushaaldate.Value = "";
                    pTab1ModalInputTushaalno.Value = "";
                    pTab1ModalInputDescription.Value = "";
                    pTab1ModalInputNationality.Value = "";
                    pTab1ModalInputMName.Value = "";
                    pTab1ModalInputLName.Value = "";
                    pTab1ModalInputFName.Value = "";
                    pTab1ModalSelectGenderMale.Checked = false;
                    pTab1ModalSelectGenderFemale.Checked = false;
                    pTab1ModalInputBdate.Value = "";
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_EDUTP");
                    pTab1ModalSelectEdutp.DataSource = ds.Tables[0];
                    pTab1ModalSelectEdutp.DataTextField = "NAME";
                    pTab1ModalSelectEdutp.DataValueField = "ID";
                    pTab1ModalSelectEdutp.DataBind();
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_OCCTYPE");
                    pTab1ModalSelectOcctp.DataSource = ds.Tables[0];
                    pTab1ModalSelectOcctp.DataTextField = "NAME";
                    pTab1ModalSelectOcctp.DataValueField = "ID";
                    pTab1ModalSelectOcctp.DataBind();
                    ds.Clear();
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
                    ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_SOCPOS");
                    pTab1ModalSelectSocpos.DataSource = ds.Tables[0];
                    pTab1ModalSelectSocpos.DataTextField = "NAME";
                    pTab1ModalSelectSocpos.DataValueField = "ID";
                    pTab1ModalSelectSocpos.DataBind();
                    pTab1ModalImgStaffImage.Src = "../img/avatars/male.png";
                    //pTab1ModalInputImageUpload.Value = "";
                    pTab1ModalInputFingerid.Value = "";
                    pTab1ModalInputAddressname.Value = "";
                    pTab1ModalInputTel.Value = "";
                    pTab1ModalInputTel2.Value = "";
                    pTab1ModalInputEmail.Value = "";
                    pTab1ModalInputRegno.Value = "";
                    pTab1ModalInputCitno.Value = "";
                    pTab1ModalInputSocno.Value = "";
                    pTab1ModalInputHealno.Value = "";
                    pTab1ModalInputRelName.Value = "";
                    ds.Clear();
                    ds = myObj.OracleExecuteDataSet("SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_RELATION");
                    pTab1ModalSelectRelRelation.DataSource = ds.Tables[0];
                    pTab1ModalSelectRelRelation.DataTextField = "NAME";
                    pTab1ModalSelectRelRelation.DataValueField = "ID";
                    pTab1ModalSelectRelRelation.DataBind();
                    pTab1ModalInputRelAddress.Value = "";
                    pTab1ModalInputRelTel.Value = "";
                    pTab1ModalInputRelTel2.Value = "";
                    pTab1ModalInputRelEmail.Value = "";

                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                    {
                        spanModifyType.InnerHtml = "засах";
                        string strStaffId = Request.QueryString["id"];
                        pTab1ID.Value = strStaffId;
                        ds.Clear();
                        ds = myObj.OracleExecuteDataSet(@"SELECT 
    b.BRANCH_ID, 
    a.DOMAIN_USER, 
    b.MOVE_ID, 
    b.POSTYPE_ID, 
    b.POS_ID, 
    b.RANK_ID, 
    b.DT, 
    b.TUSHAALDATE, 
    b.TUSHAALNO, 
    b.DESCRIPTION, 
    a.NATIONALITY,
    a.MNAME, 
    a.LNAME, 
    a.FNAME, 
    a.GENDER, 
    a.BDATE, 
    a.EDUTP_ID, 
    a.OCCTYPE_ID, 
    a.OCCNAME, 
    a.BCITY_ID, 
    a.BDIST_ID, 
    a.NAT_ID, 
    a.SOCPOS_ID, 
    a.IMAGE, 
    a.FINGERID, 
    a.ADDRCITY_ID, 
    a.ADDRDIST_ID, 
    a.ADDRESSNAME, 
    a.TEL, 
    a.TEL2, 
    a.EMAIL, 
    a.REGNO, 
    a.CITNO, 
    a.SOCNO, 
    a.HEALNO, 
    a.RELNAME, 
    a.RELATION_ID, 
    a.RELADDRESSNAME, 
    a.RELTEL, 
    a.RELTEL2, 
    a.RELEMAIL 
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
WHERE a.ID=" + strStaffId);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            pTab1ModalSelectBranch.SelectedIndex = pTab1ModalSelectBranch.Items.IndexOf(pTab1ModalSelectBranch.Items.FindByValue(ds.Tables[0].Rows[0]["BRANCH_ID"].ToString()));
                            pTab1ModalInputDomainname.Value = ds.Tables[0].Rows[0]["DOMAIN_USER"].ToString();
                            pTab1ModalHiddenMove.Value = ds.Tables[0].Rows[0]["MOVE_ID"].ToString();
                            pTab1ModalSelectMove.SelectedIndex = pTab1ModalSelectMove.Items.IndexOf(pTab1ModalSelectMove.Items.FindByValue(ds.Tables[0].Rows[0]["MOVE_ID"].ToString()));
                            pTab1ModalSelectPostype.SelectedIndex = pTab1ModalSelectPostype.Items.IndexOf(pTab1ModalSelectPostype.Items.FindByValue(ds.Tables[0].Rows[0]["POSTYPE_ID"].ToString()));
                            pTab1ModalSelectPos.SelectedIndex = pTab1ModalSelectPos.Items.IndexOf(pTab1ModalSelectPos.Items.FindByValue(ds.Tables[0].Rows[0]["POS_ID"].ToString()));
                            pTab1ModalSelectRank.SelectedIndex = pTab1ModalSelectRank.Items.IndexOf(pTab1ModalSelectRank.Items.FindByValue(ds.Tables[0].Rows[0]["RANK_ID"].ToString()));
                            pTab1ModalInputSigndate.Value = ds.Tables[0].Rows[0]["DT"].ToString();
                            pTab1ModalInputTushaaldate.Value = ds.Tables[0].Rows[0]["TUSHAALDATE"].ToString();
                            pTab1ModalInputTushaalno.Value = ds.Tables[0].Rows[0]["TUSHAALNO"].ToString();
                            pTab1ModalInputDescription.Value = ds.Tables[0].Rows[0]["DESCRIPTION"].ToString();
                            pTab1ModalInputNationality.Value = ds.Tables[0].Rows[0]["NATIONALITY"].ToString();
                            pTab1ModalInputMName.Value = ds.Tables[0].Rows[0]["MNAME"].ToString();
                            pTab1ModalInputLName.Value = ds.Tables[0].Rows[0]["LNAME"].ToString();
                            pTab1ModalInputFName.Value = ds.Tables[0].Rows[0]["FNAME"].ToString();
                            if(ds.Tables[0].Rows[0]["GENDER"].ToString() == "1") pTab1ModalSelectGenderMale.Checked = true;
                            else pTab1ModalSelectGenderFemale.Checked = true;
                            pTab1ModalInputBdate.Value = ds.Tables[0].Rows[0]["BDATE"].ToString();
                            pTab1ModalSelectEdutp.SelectedIndex = pTab1ModalSelectEdutp.Items.IndexOf(pTab1ModalSelectEdutp.Items.FindByValue(ds.Tables[0].Rows[0]["EDUTP_ID"].ToString()));
                            pTab1ModalSelectOcctp.SelectedIndex = pTab1ModalSelectOcctp.Items.IndexOf(pTab1ModalSelectOcctp.Items.FindByValue(ds.Tables[0].Rows[0]["OCCTYPE_ID"].ToString()));
                            pTab1ModalInputOccname.Value = ds.Tables[0].Rows[0]["OCCNAME"].ToString();
                            pTab1ModalSelectBcity.SelectedIndex = pTab1ModalSelectBcity.Items.IndexOf(pTab1ModalSelectBcity.Items.FindByValue(ds.Tables[0].Rows[0]["BCITY_ID"].ToString()));
                            string strBCITY_ID = ds.Tables[0].Rows[0]["BCITY_ID"].ToString();
                            string strBDIST_ID = ds.Tables[0].Rows[0]["BDIST_ID"].ToString();
                            pTab1ModalSelectNat.SelectedIndex = pTab1ModalSelectNat.Items.IndexOf(pTab1ModalSelectNat.Items.FindByValue(ds.Tables[0].Rows[0]["NAT_ID"].ToString()));
                            pTab1ModalSelectSocpos.SelectedIndex = pTab1ModalSelectSocpos.Items.IndexOf(pTab1ModalSelectSocpos.Items.FindByValue(ds.Tables[0].Rows[0]["SOCPOS_ID"].ToString()));
                            pTab1ModalImgStaffImage.Src = "../files/staffs/"+ ds.Tables[0].Rows[0]["IMAGE"].ToString();
                            pTab1ModalInputFingerid.Value = ds.Tables[0].Rows[0]["FINGERID"].ToString();
                            pTab1ModalSelectAddresscity.SelectedIndex = pTab1ModalSelectAddresscity.Items.IndexOf(pTab1ModalSelectAddresscity.Items.FindByValue(ds.Tables[0].Rows[0]["ADDRCITY_ID"].ToString()));
                            string strADDRCITY_ID = ds.Tables[0].Rows[0]["ADDRCITY_ID"].ToString();
                            string strADDRDIST_ID = ds.Tables[0].Rows[0]["ADDRDIST_ID"].ToString();
                            pTab1ModalInputAddressname.Value = ds.Tables[0].Rows[0]["ADDRESSNAME"].ToString();
                            pTab1ModalInputTel.Value = ds.Tables[0].Rows[0]["TEL"].ToString();
                            pTab1ModalInputTel2.Value = ds.Tables[0].Rows[0]["TEL2"].ToString();
                            pTab1ModalInputEmail.Value = ds.Tables[0].Rows[0]["EMAIL"].ToString();
                            pTab1ModalInputRegno.Value = ds.Tables[0].Rows[0]["REGNO"].ToString();
                            pTab1ModalInputCitno.Value = ds.Tables[0].Rows[0]["CITNO"].ToString();
                            pTab1ModalInputSocno.Value = ds.Tables[0].Rows[0]["SOCNO"].ToString();
                            pTab1ModalInputHealno.Value = ds.Tables[0].Rows[0]["HEALNO"].ToString();
                            pTab1ModalInputRelName.Value = ds.Tables[0].Rows[0]["RELNAME"].ToString();
                            pTab1ModalSelectRelRelation.SelectedIndex = pTab1ModalSelectRelRelation.Items.IndexOf(pTab1ModalSelectRelRelation.Items.FindByValue(ds.Tables[0].Rows[0]["RELATION_ID"].ToString()));
                            pTab1ModalInputRelAddress.Value = ds.Tables[0].Rows[0]["RELADDRESSNAME"].ToString();
                            pTab1ModalInputRelTel.Value = ds.Tables[0].Rows[0]["RELTEL"].ToString();
                            pTab1ModalInputRelTel2.Value = ds.Tables[0].Rows[0]["RELTEL2"].ToString();
                            pTab1ModalInputRelEmail.Value = ds.Tables[0].Rows[0]["RELEMAIL"].ToString();
                            if (strBDIST_ID != "" && strBDIST_ID != null) {
                                ds.Clear();
                                ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM ( SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_DIST WHERE BCITY_ID=" + strBCITY_ID + ") ORDER BY NAME ASC");
                                pTab1ModalSelectBdist.DataSource = ds.Tables[0];
                                pTab1ModalSelectBdist.DataTextField = "NAME";
                                pTab1ModalSelectBdist.DataValueField = "ID";
                                pTab1ModalSelectBdist.DataBind();
                                pTab1ModalSelectBdist.SelectedIndex = pTab1ModalSelectBdist.Items.IndexOf(pTab1ModalSelectBdist.Items.FindByValue(strBDIST_ID));
                                pTab1ModalSelectBdist.Disabled = false;
                            }
                            if (strADDRDIST_ID != "" && strADDRDIST_ID != null)
                            {
                                ds.Clear();
                                ds = myObj.OracleExecuteDataSet("SELECT ID, NAME FROM ( SELECT null as ID, TO_CHAR('- Сонго -') as NAME FROM DUAL UNION ALL SELECT ID, TO_CHAR(NAME) FROM STN_DIST WHERE BCITY_ID=" + strADDRCITY_ID + ") ORDER BY NAME ASC");
                                pTab1ModalSelectAddressdist.DataSource = ds.Tables[0];
                                pTab1ModalSelectAddressdist.DataTextField = "NAME";
                                pTab1ModalSelectAddressdist.DataValueField = "ID";
                                pTab1ModalSelectAddressdist.DataBind();
                                pTab1ModalSelectAddressdist.SelectedIndex = pTab1ModalSelectAddressdist.Items.IndexOf(pTab1ModalSelectAddressdist.Items.FindByValue(strADDRDIST_ID));
                                pTab1ModalSelectAddressdist.Disabled = false;
                            }
                        }
                    }
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
}