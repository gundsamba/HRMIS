using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            string stid = "";
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else
            {
                try
                {
                    stid = Session["HRMIS_UserID"].ToString();
                    DataSet ds = myObjGetTableData.getUserInfo(stid);
                    inputUserId.Value = stid;
                    indexUserId.InnerHtml = stid;
                    indexUserGazarId.InnerHtml = ds.Tables[0].Rows[0]["GAZARID"].ToString();
                    indexUserHeltesId.InnerHtml = ds.Tables[0].Rows[0]["HELTESID"].ToString();
                    indexUserPosId.InnerHtml = ds.Tables[0].Rows[0]["POSID"].ToString();
                    indexUserGazarName.InnerHtml = ds.Tables[0].Rows[0]["GAZARNAME"].ToString();
                    indexUserGazarInitName.InnerHtml = ds.Tables[0].Rows[0]["GAZARNAMEINIT"].ToString();
                    indexUserRoleListId.InnerHtml = ds.Tables[0].Rows[0]["ROLELISTID"].ToString();
                    staffName.InnerHtml = ds.Tables[0].Rows[0]["STNAMEINIT"].ToString();
                    ds = myObj.OracleExecuteDataSet("SELECT a.IMAGE FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID LEFT JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID LEFT JOIN STN_DIST h ON a.ADDRDIST_ID=h.ID INNER JOIN STN_MOVE i ON b.MOVE_ID=i.ID INNER JOIN STN_MOVETYPE j ON i.MOVETYPE_ID=j.ID WHERE a.ID=" + stid);
                    if (ds.Tables[0].Rows[0]["IMAGE"].ToString() != "") staffImage.Src = "http://hr/files/staffs/" + ds.Tables[0].Rows[0]["IMAGE"].ToString();
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