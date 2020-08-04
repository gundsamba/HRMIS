using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class profile : System.Web.UI.Page
    {
        string strMyVal = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null || Session["HRMIS_UserData"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                {
                    if ("0" != myObj.OracleExecuteScalar("SELECT COUNT(1) FROM ST_STAFFS WHERE ID=" + Request.QueryString["id"]).ToString())
                    {
                        CSession sessionClass = new CSession();
                        var userData = sessionClass.getCurrentUserData();
                        if (userData.USR_STAFFID.ToString() != Request.QueryString["id"])
                        {
                            bool boolRoleUser = false;
                            for (int i = 0; i < userData.USR_ROLEDATA.Capacity; i++)
                            {
                                if (userData.USR_ROLEDATA[i] == 1 || userData.USR_ROLEDATA[i] == 4)
                                {
                                    boolRoleUser = true;
                                    break;
                                }
                            }
                            if (!boolRoleUser) throw new cs.HRMISException("Буруу хандалт! Дахин оролдоно уу.");
                        }

                        //worked year/month
                        DataSet ds = null;
                        ds = myObj.OracleExecuteDataSet(@"SELECT 
            STAFFS_ID
            , ROUND(DAYCNT_MOF/365,1) as YRCNT_MOF
            , ROUND((MOD(DAYCNT_MOF,365)/30.4),1) as MNTHCNT_MOF
            , ROUND((DAYCNT_MOF+DAYCNT_GOV)/365,1) as YRCNT_GOV
            , ROUND((MOD(DAYCNT_MOF+DAYCNT_GOV,365)/30.4),1) as MNTHCNT_GOV
            , ROUND((DAYCNT_MOF+DAYCNT_GOV+DAYCNT_WORKED)/365,1) as YRCNT_WORKED
            , ROUND((MOD(DAYCNT_MOF+DAYCNT_GOV+DAYCNT_WORKED,365)/30.4),1) as MNTHCNT_WORKED
        FROM (
            SELECT STAFFS_ID, SUM(DAYCNT_MOF) as DAYCNT_MOF, SUM(DAYCNT_GOV) as DAYCNT_GOV, SUM(DAYCNT_WORKED) as DAYCNT_WORKED
            FROM (
                SELECT STAFFS_ID, ROUND(ENDDT-DT) as DAYCNT_MOF, 0 as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM (
                    SELECT a.STAFFS_ID, TO_DATE(a.DT,'YYYY-MM-DD') as DT, CASE WHEN a.ENDDT IS NOT NULL THEN TO_DATE(a.ENDDT,'YYYY-MM-DD') ELSE SYSDATE END as ENDDT 
                    FROM hrdbuser.ST_STBR a
                    INNER JOIN hrdbuser.STN_MOVE b ON a.MOVE_ID=b.ID 
                    WHERE b.ISWORK=1 AND a.STAFFS_ID = " + Request.QueryString["id"] + @"
                )
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_GOV, 0 as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID=1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL AND STAFFS_ID = " + Request.QueryString["id"] + @"
                UNION ALL
                SELECT STAFFS_ID, 0 as DAYCNT_MOF, 0 as DAYCNT_GOV, TO_DATE(TODATE, 'YYYY-MM-DD')-TO_DATE(FROMDATE, 'YYYY-MM-DD') as DAYCNT_WORKED
                FROM hrdbuser.ST_EXPHISTORY
                WHERE ORGTYPE_ID<>1 AND FROMDATE IS NOT NULL AND TODATE IS NOT NULL AND STAFFS_ID = " + Request.QueryString["id"] + @"
            ) 
            GROUP BY STAFFS_ID
        )");
                        profileMainWorkedTime.InnerHtml = "<table class=\"table\"><tbody><tr><th>Нийт</th><td>" + ds.Tables[0].Rows[0]["YRCNT_WORKED"].ToString().Split('.')[0] + " жил</td><td>" + ds.Tables[0].Rows[0]["MNTHCNT_WORKED"].ToString() + " сар</td></tr><tr><th>Төрд</th><td>" + ds.Tables[0].Rows[0]["YRCNT_GOV"].ToString().Split('.')[0] + " жил</td><td>" + ds.Tables[0].Rows[0]["MNTHCNT_GOV"].ToString() + " сар</td></tr><tr><th>Сангийн яам</th><td>" + ds.Tables[0].Rows[0]["YRCNT_MOF"].ToString().Split('.')[0] + " жил</td><td>" + ds.Tables[0].Rows[0]["MNTHCNT_MOF"].ToString() + " сар</td></tr></tbody></table>";
                        ds.Clear();
                        ds = myObj.OracleExecuteDataSet("SELECT a.IMAGE, CASE WHEN i.ACTIVE=1 AND i.SHOW=1 THEN TO_CHAR(h.NAME) WHEN i.ACTIVE=1 AND i.SHOW=0 THEN 'Идэвхтэй' ELSE TO_CHAR(j.NAME) END AS TP, i.COLOR, CASE WHEN a.GENDER=1 THEN '<i class=\"fa fa-male\"></i> Эрэгтэй<br />' ELSE '<i class=\"fa fa-female\"></i> Эмэгтэй<br />' END as GENDER,  NVL(TO_CHAR(trunc(months_between(sysdate,to_date(a.BDATE,'YYYY-MM-DD'))/12)),'-') as AGE,  a.FNAME, a.LNAME, CASE WHEN c.ID=c.FATHER_ID THEN c.INITNAME ELSE d.INITNAME||' - '||c.INITNAME END as NEGJ, f.NAME as POS_NAME, a.TEL||CASE WHEN TEL is not null THEN ', '||TEL2 END as TEL, a.EMAIL, g.NAME||NVL2(g.NAME,', ','')||h.NAME||NVL2(h.NAME,', ','')||a.ADDRESSNAME as ADDRESSNAME, a.REGNO, a.CITNO, a.SOCNO, a.HEALNO, a.DOCPERMISSIONID FROM ST_STAFFS a INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 INNER JOIN ST_BRANCH c ON b.BRANCH_ID=c.ID INNER JOIN ST_BRANCH d ON c.FATHER_ID=d.ID INNER JOIN STN_POS f ON b.POS_ID=f.ID LEFT JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID LEFT JOIN STN_DIST h ON a.ADDRDIST_ID=h.ID INNER JOIN STN_MOVE i ON b.MOVE_ID=i.ID INNER JOIN STN_MOVETYPE j ON i.MOVETYPE_ID=j.ID WHERE a.ID=" + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                if (dr[0].ToString() != "") profileMainImage.Src = "../files/staffs/" + dr[0].ToString();
                                profileMainDivStafftype.InnerHtml = "<span class=\"label " + dr[2].ToString() + "\">" + dr[1].ToString() + "</span><br /><br />" + dr[3].ToString() + "<span>" + dr[4].ToString() + " нас</span>";
                                profileMainH1Names.InnerHtml = "<span class=\"semi-bold\">" + dr[5].ToString() + "</span> " + dr[6].ToString() + "<br><small>" + dr[7].ToString() + " | " + dr[8].ToString() + "</small>";
                                if (dr[9].ToString() != "") profileMainSpanTels.InnerHtml = dr[9].ToString();
                                if (dr[10].ToString() != "")
                                {
                                    profileMainSpanEmail.InnerHtml = dr[10].ToString();
                                    profileMainSpanEmail.HRef = "mailto:" + dr[10].ToString();
                                }
                                if (dr[11].ToString() != "") profileMainSpanAddress.InnerHtml = dr[11].ToString();
                                profileMainInputRegno.Value = dr[12].ToString();
                                profileMainInputCitno.Value = dr[13].ToString();
                                profileMainInputSocno.Value = dr[14].ToString();
                                profileMainInputHealno.Value = dr[15].ToString();
                                profileMainSelectDocRole.SelectedIndex = profileMainSelectDocRole.Items.IndexOf(profileMainSelectDocRole.Items.FindByValue(dr["DOCPERMISSIONID"].ToString()));
                            }
                        }
                        myObj.DBDisconnect();

                        if (!myObjGetTableData.checkRoles(Session["HRMIS_UserID"].ToString(), "1,4"))
                        {
                            pTab2Li.Attributes["class"] = "hide";
                            profileMainSelectDocRole.Disabled = true;
                        }
                        else
                        {
                            if (Request.QueryString["ismove"] != null)
                            {
                                if (Request.QueryString["ismove"] == "1")
                                {
                                    pTab1Li.Attributes["class"] = "";
                                    pTab2Li.Attributes["class"] = "active";
                                    pTab1.Attributes["class"] = "tab-pane fade";
                                    pTab2.Attributes["class"] = "tab-pane fade in active";
                                }
                            }
                            profileMainSelectDocRole.Disabled = false;
                        }

                        if (!myObjGetTableData.checkRoles(Session["HRMIS_UserID"].ToString(), "1,13"))
                        {
                            profileMainSelectDocRole.Disabled = true;
                        }
                        else
                        {
                            profileMainSelectDocRole.Disabled = false;
                        }
                    }
                    else throw new cs.HRMISException("Буруу хандалт! Дахин оролдоно уу.");
                }
                else throw new cs.HRMISException("Буруу хандалт! Дахин оролдоно уу.");
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
        }
    }
}