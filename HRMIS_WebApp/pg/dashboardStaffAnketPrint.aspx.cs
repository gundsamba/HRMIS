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
    public partial class dashboardStaffAnketPrint : System.Web.UI.Page
    {
        DataSet ds;
        string strMyVal = "", strQry = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            if (Request.QueryString["id"] != null)
            {
                if ("0" != myObj.OracleExecuteScalar("SELECT COUNT(1) FROM ST_STAFFS WHERE ID=" + Request.QueryString["id"]).ToString())
                {
                    try
                    {
                        //ds = myObj.OracleExecuteDataSet("SELECT a.REGNO, CASE WHEN a.CITNO IS NULL THEN '000000000' END as CITNO, '000000' as SOCNO, CASE WHEN a.HEALNO IS NULL THEN '00000000' END as HEALNO , a.LNAME, a.FNAME, CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END as GENDER, a.BDATE, b.NAME as CITY_NAME, c.NAME as DIST_NAME, a.BPLACE, a.MNAME, d.NAME as NAT_NAME, f.NAME as SOCPOS_NAME, a.IMAGE, g.NAME as ADDRCITY_NAME, h.NAME as ADDRDIST_NAME, a.ADDRESSNAME, a.TEL, a.TEL2, a.EMAIL, a.RELNAME, i.NAME as RELATIONNAME, a.RELTEL, a.RELTEL2 FROM ST_STAFFS a INNER JOIN STN_CITY b ON a.BCITY_ID=b.ID INNER JOIN STN_DIST c ON a.BCITY_ID=c.BCITY_ID AND a.BDIST_ID=c.ID INNER JOIN STN_NAT d ON a.NAT_ID=d.ID INNER JOIN STN_SOCPOS f ON a.SOCPOS_ID=f.ID INNER JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID INNER JOIN STN_DIST h ON a.ADDRCITY_ID=h.BCITY_ID AND a.ADDRDIST_ID=h.ID INNER JOIN STN_RELATION i ON a.RELATION_ID=i.ID WHERE a.ID=" + Request.QueryString["id"]);
                        ds = myObj.OracleExecuteDataSet("SELECT a.REGNO,a.CITNO,a.SOCNO,a.HEALNO, a.LNAME, a.FNAME, CASE WHEN a.GENDER=1 THEN 'Эрэгтэй' ELSE 'Эмэгтэй' END as GENDER, a.BDATE, b.NAME as CITY_NAME, c.NAME as DIST_NAME, a.BPLACE, a.MNAME, d.NAME as NAT_NAME, f.NAME as SOCPOS_NAME, a.IMAGE, g.NAME as ADDRCITY_NAME, h.NAME as ADDRDIST_NAME, a.ADDRESSNAME, a.TEL, a.TEL2, a.EMAIL, a.RELNAME, i.NAME as RELATIONNAME, a.RELTEL, a.RELTEL2 FROM ST_STAFFS a INNER JOIN STN_CITY b ON a.BCITY_ID=b.ID INNER JOIN STN_DIST c ON a.BCITY_ID=c.BCITY_ID AND a.BDIST_ID=c.ID INNER JOIN STN_NAT d ON a.NAT_ID=d.ID INNER JOIN STN_SOCPOS f ON a.SOCPOS_ID=f.ID INNER JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID INNER JOIN STN_DIST h ON a.ADDRCITY_ID=h.BCITY_ID AND a.ADDRDIST_ID=h.ID INNER JOIN STN_RELATION i ON a.RELATION_ID=i.ID WHERE a.ID=" + Request.QueryString["id"]);

                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                
                                if (dr[0].ToString().Length > 0) dashboardStaffAnketPrintRDNO1.InnerHtml = dr[0].ToString().Substring(0, 1);
                                if (dr[0].ToString().Length > 1) dashboardStaffAnketPrintRDNO2.InnerHtml = dr[0].ToString().Substring(1, 1);
                                if (dr[0].ToString().Length > 2) dashboardStaffAnketPrintRDNO3.InnerHtml = dr[0].ToString().Substring(2, 1);
                                if (dr[0].ToString().Length > 3) dashboardStaffAnketPrintRDNO4.InnerHtml = dr[0].ToString().Substring(3, 1);
                                if (dr[0].ToString().Length > 4) dashboardStaffAnketPrintRDNO5.InnerHtml = dr[0].ToString().Substring(4, 1);
                                if (dr[0].ToString().Length > 5) dashboardStaffAnketPrintRDNO6.InnerHtml = dr[0].ToString().Substring(5, 1);
                                if (dr[0].ToString().Length > 6) dashboardStaffAnketPrintRDNO7.InnerHtml = dr[0].ToString().Substring(6, 1);
                                if (dr[0].ToString().Length > 7) dashboardStaffAnketPrintRDNO8.InnerHtml = dr[0].ToString().Substring(7, 1);
                                if (dr[0].ToString().Length > 8) dashboardStaffAnketPrintRDNO9.InnerHtml = dr[0].ToString().Substring(8, 1);
                                if (dr[0].ToString().Length > 9) dashboardStaffAnketPrintRDNO10.InnerHtml = dr[0].ToString().Substring(9, 1);
                                //cit
                                if (dr[1].ToString().Length > 0) dashboardStaffAnketPrintCITNO1.InnerHtml = dr[1].ToString().Substring(0, 1);
                                if (dr[1].ToString().Length > 1) dashboardStaffAnketPrintCITNO2.InnerHtml = dr[1].ToString().Substring(1, 1);
                                if (dr[1].ToString().Length > 2) dashboardStaffAnketPrintCITNO3.InnerHtml = dr[1].ToString().Substring(2, 1);
                                if (dr[1].ToString().Length > 3) dashboardStaffAnketPrintCITNO4.InnerHtml = dr[1].ToString().Substring(3, 1);
                                if (dr[1].ToString().Length > 4) dashboardStaffAnketPrintCITNO5.InnerHtml = dr[1].ToString().Substring(4, 1);
                                if (dr[1].ToString().Length > 5) dashboardStaffAnketPrintCITNO6.InnerHtml = dr[1].ToString().Substring(5, 1);
                                if (dr[1].ToString().Length > 6) dashboardStaffAnketPrintCITNO7.InnerHtml = dr[1].ToString().Substring(6, 1);
                                if (dr[1].ToString().Length > 7) dashboardStaffAnketPrintCITNO8.InnerHtml = dr[1].ToString().Substring(7, 1);
                                if (dr[1].ToString().Length > 8) dashboardStaffAnketPrintCITNO9.InnerHtml = dr[1].ToString().Substring(8, 1);
                                //soc
                                if (dr[2].ToString().Length > 0) dashboardStaffAnketPrintSOCNO1.InnerHtml = dr[2].ToString().Substring(0, 1);
                                if (dr[2].ToString().Length > 1) dashboardStaffAnketPrintSOCNO2.InnerHtml = dr[2].ToString().Substring(1, 1);
                                if (dr[2].ToString().Length > 2) dashboardStaffAnketPrintSOCNO3.InnerHtml = dr[2].ToString().Substring(2, 1);
                                if (dr[2].ToString().Length > 3) dashboardStaffAnketPrintSOCNO4.InnerHtml = dr[2].ToString().Substring(3, 1);
                                if (dr[2].ToString().Length > 4) dashboardStaffAnketPrintSOCNO5.InnerHtml = dr[2].ToString().Substring(4, 1);
                                if (dr[2].ToString().Length > 5) dashboardStaffAnketPrintSOCNO6.InnerHtml = dr[2].ToString().Substring(5, 1);
                                //heal
                                if (dr[3].ToString().Length > 0) dashboardStaffAnketPrintHEALNO1.InnerHtml = dr[3].ToString().Substring(0, 1);
                                if (dr[3].ToString().Length > 1) dashboardStaffAnketPrintHEALNO2.InnerHtml = dr[3].ToString().Substring(1, 1);
                                if (dr[3].ToString().Length > 2) dashboardStaffAnketPrintHEALNO3.InnerHtml = dr[3].ToString().Substring(2, 1);
                                if (dr[3].ToString().Length > 3) dashboardStaffAnketPrintHEALNO4.InnerHtml = dr[3].ToString().Substring(3, 1);
                                if (dr[3].ToString().Length > 4) dashboardStaffAnketPrintHEALNO5.InnerHtml = dr[3].ToString().Substring(4, 1);
                                if (dr[3].ToString().Length > 5) dashboardStaffAnketPrintHEALNO6.InnerHtml = dr[3].ToString().Substring(5, 1);
                                if (dr[3].ToString().Length > 6) dashboardStaffAnketPrintHEALNO7.InnerHtml = dr[3].ToString().Substring(6, 1);
                                if (dr[3].ToString().Length > 7) dashboardStaffAnketPrintHEALNO8.InnerHtml = dr[3].ToString().Substring(7, 1);

                                if (dr[4].ToString() != "") dashboardStaffAnketPrintLName.InnerHtml = dr[4].ToString();
                                if (dr[5].ToString() != "") dashboardStaffAnketPrintFName.InnerHtml = dr[5].ToString();
                                if (dr[6].ToString() != "") dashboardStaffAnketPrintGender.InnerHtml = dr[6].ToString();
                                if (dr[7].ToString().Split('-')[0] != "") dashboardStaffAnketPrintBYear.InnerHtml = dr[7].ToString().Split('-')[0];
                                if (dr[7].ToString().Split('-')[1] != "") dashboardStaffAnketPrintBMonth.InnerHtml = dr[7].ToString().Split('-')[1];
                                if (dr[7].ToString().Split('-')[2] != "") dashboardStaffAnketPrintBday.InnerHtml = dr[7].ToString().Split('-')[2];
                                if (dr[8].ToString() != "") dashboardStaffAnketPrintBCity.InnerHtml = dr[8].ToString();
                                if (dr[9].ToString() != "") dashboardStaffAnketPrintBDist.InnerHtml = dr[9].ToString();
                                if (dr[10].ToString() != "") dashboardStaffAnketPrintBPlace.InnerHtml = dr[10].ToString();
                                if (dr[11].ToString() != "") dashboardStaffAnketPrintMName.InnerHtml = dr[11].ToString();
                                if (dr[12].ToString() != "") dashboardStaffAnketPrintNat.InnerHtml = dr[12].ToString();
                                if (dr[13].ToString() != "") dashboardStaffAnketPrintSoc.InnerHtml = dr[13].ToString();
                                if (dr[14].ToString() != "") dashboardStaffAnketPrintImage.Attributes["src"] = "../files/staffs/" + dr[14].ToString();
                                if (dr[15].ToString() != "") dashboardStaffAnketPrintAddrCity.InnerHtml = dr[15].ToString();
                                if (dr[16].ToString() != "") dashboardStaffAnketPrintAddrDist.InnerHtml = dr[16].ToString();
                                if (dr[17].ToString() != "") dashboardStaffAnketPrintAddress.InnerHtml = dr[17].ToString();
                                if (dr[18].ToString() != "") dashboardStaffAnketPrintTel.InnerHtml = dr[18].ToString();
                                if (dr[19].ToString() != "")
                                {
                                    if (dr[18].ToString() != "") dashboardStaffAnketPrintTel.InnerHtml += ", " + dr[19].ToString();
                                    else dashboardStaffAnketPrintTel.InnerHtml = dr[19].ToString();
                                }
                                if (dr[20].ToString() != "") dashboardStaffAnketPrintEmail.InnerHtml = dr[20].ToString();
                                if (dr[21].ToString() != "") dashboardStaffAnketPrintRelName.InnerHtml = dr[21].ToString() + " /" + dr[22].ToString() + "/";
                                if (dr[23].ToString() != "") dashboardStaffAnketPrintRelTel.InnerHtml = dr[23].ToString();
                                if (dr[24].ToString() != "")
                                {
                                    if (dr[23].ToString() != "") dashboardStaffAnketPrintRelTel.InnerHtml += ", " + dr[24].ToString();
                                    else dashboardStaffAnketPrintRelTel.InnerHtml = dr[24].ToString();
                                }
                            }
                        }
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT b.NAME as RELATIONNAME, a.LNAME||' '||a.FNAME, a.BYEAR, c.NAME||', '||d.NAME, a.CURRENTWORK FROM ST_STAFFSFAMILY a INNER JOIN STN_RELATION b ON a.RELATION_ID=b.ID INNER JOIN STN_CITY c ON a.BCITY_ID=c.ID INNER JOIN STN_DIST d ON a.BCITY_ID=d.BCITY_ID AND a.BDIST_ID=d.ID WHERE a.TP=1 AND a.STAFFS_ID=" + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[1].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[2].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[3].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[4].ToString() + "</td></tr>";
                            }
                        }
                        dashboardStaffAnketFamily1.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT b.NAME as RELATIONNAME, a.LNAME||' '||a.FNAME, a.BYEAR, c.NAME||', '||d.NAME, a.CURRENTWORK FROM ST_STAFFSFAMILY a INNER JOIN STN_RELATION b ON a.RELATION_ID=b.ID INNER JOIN STN_CITY c ON a.BCITY_ID=c.ID INNER JOIN STN_DIST d ON a.BCITY_ID=d.BCITY_ID AND a.BDIST_ID=d.ID WHERE a.TP=2 AND a.STAFFS_ID=" + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[1].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[2].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[3].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[4].ToString() + "</td></tr>";
                            }
                        }
                        dashboardStaffAnketFamily2.InnerHtml = strMyVal;
                        strQry = "SELECT a.INSTITUTENAME||' /'||c.NAME||', '||d.NAME||'/', a.FROMYR, a.TOYR, a.PROFESSIONDESC||' /'||b.NAME||', '||a.CERTIFICATENO||'/' FROM ST_EDUCATION a INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID LEFT JOIN STN_CITY c ON a.CITY_ID=c.ID LEFT JOIN STN_DIST d ON a.DIST_ID=d.ID AND d.BCITY_ID=a.CITY_ID WHERE a.STAFFS_ID=" + Request.QueryString["id"];
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[1].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[2].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[3].ToString() + "</td></tr>";
                            }
                        }
                        dashboardStaffAnketEducationTable.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT b.NAME as EDUTP_NAME, a.INSTITUTENAME, a.DEGREEYR, a.CERTIFICATENO FROM ST_PHD a INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID WHERE a.STAFFS_ID=" + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[1].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[2].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[3].ToString() + "</td></tr>";
                            }
                        }
                        dashboardStaffAnketPhdTable.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet(@"SELECT a.COUNTRYCITYNAME, a.DURATIONDATE, a.STUDYTIME_NAME, a.SUBJECTDESC, a.CERTIFICATE
FROM (
  SELECT 
    b.NAME||', '||a.ORGNAME as COUNTRYCITYNAME, 
    a.FROMDATE||' - '||a.TODATE as DURATIONDATE, 
    TO_CHAR(c.NAME) as STUDYTIME_NAME, 
    a.SUBJECTDESC, 
    TO_CHAR(CASE WHEN a.CERTIFICATEDATE!=null THEN a.CERTIFICATENO||' /'||a.CERTIFICATEDATE||'/' ELSE a.CERTIFICATENO END) as CERTIFICATE 
  FROM ST_TRAINING a 
  INNER JOIN STN_STUDYLOCATION b ON a.STUDYLOCATION_ID=b.ID 
  INNER JOIN STN_STUDYTIME c ON a.STUDYTIME_ID=c.ID 
  WHERE a.STAFFS_ID="+ Request.QueryString["id"] + @"
  UNION ALL
  SELECT 
    a.COUNTRYNAME||', '||a.CITYNAME as COUNTRYCITYNAME, 
    a.FROMDATE||' - '||a.TODATE as DURATIONDATE, 
    TO_CHAR(TO_CHAR(a.DAYNUM)||' өдөр') as STUDYTIME_NAME, 
    a.SUBJECTNAME as SUBJECTDESC, 
    TO_CHAR(a.TUSHAALNO) as CERTIFICATE
  FROM ST_TOMILOLT a
  INNER JOIN ST_TOMILOLT_STAFFS b ON a.ID=b.TOMILOLT_ID
  WHERE a.TOMILOLTYPE_ID=1 AND a.TOMILOLTDIRECTION_ID IN (1,4,7) AND b.STAFFS_ID=" + Request.QueryString["id"] + @"
) a
ORDER BY a.DURATIONDATE DESC");
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[1].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[2].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[3].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[4].ToString() + "</td></tr>";
                            }
                        }
                        dashboardStaffAnketTrainingTable.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet(@"SELECT b.NAME as POSDEGREEDTL_NAME, c.NAME as RANKPOSDEGREE_NAME, a.DECISIONDESC||', '||a.DECISIONDATE, a.CERTIFICATENO FROM ST_JOBTITLEDEGREE a INNER JOIN STN_POSDEGREEDTL b ON a.POSDEGREEDTL_ID=b.ID INNER JOIN STN_RANKPOSDEGREE c ON a.RANKPOSDEGREE_ID=c.ID WHERE a.STAFFS_ID=" + Request.QueryString["id"]+@" UNION ALL
SELECT c.NAME as POSDEGREEDTL_NAME, d.NAME as RANKPOSDEGREE_NAME, b.DECISIONDESC||', '||b.DT as DECISIONDATE, b.CERTIFICATENO
FROM ST_ZEREGDEV_STAFFS a
INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID = b.ID
INNER JOIN STN_POSDEGREEDTL c ON b.POSDEGREEDTL_ID = c.ID
INNER JOIN STN_RANKPOSDEGREE d ON b.RANKPOSDEGREE_ID = d.ID
WHERE a.STAFFS_ID = " + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[1].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[2].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[3].ToString() + "</td></tr>";
                            }
                        }
                        dashboardStaffAnketJobtitledegreeTable.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT b.NAME as SCIENCEDEGREE_NAME, a.INSTITUTENAME, a.DEGREEYR, a.CERTIFICATENO FROM ST_SCIENCEDEGREE a INNER JOIN STN_SCIENCEDEGREE b ON a.SCIENCEDEGREE_ID=b.ID WHERE a.STAFFS_ID=" + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[1].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[2].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[3].ToString() + "</td></tr>";
                            }
                        }
                        dashboardStaffAnketSciencedegreeTable.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT COL, EVAL FROM ST_SKILLS WHERE STAFFS_ID=" + Request.QueryString["id"] + " ORDER BY COL");
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                if (dr[1].ToString() == "1") strMyVal = "<li style=\"display:inline; padding:5px; width: 20px;height: 20px;-moz-border-radius: 50%;-webkit-border-radius: 50%;border-radius: 50%;border: 1px solid #808080;\">1</li><li style=\"display:inline; padding:5px;\">2</li><li style=\"display:inline; padding:5px;\">3</li>";
                                else if (dr[1].ToString() == "2") strMyVal = "<li style=\"display:inline; padding:5px;\">1</li><li style=\"display:inline; padding:5px; width: 20px;height: 20px;-moz-border-radius: 50%;-webkit-border-radius: 50%;border-radius: 50%;border: 1px solid #808080;\">2</li><li style=\"display:inline; padding:5px;\">3</li>";
                                else if (dr[1].ToString() == "3") strMyVal = "<li style=\"display:inline; padding:5px;\">1</li><li style=\"display:inline; padding:5px;\">2</li><li style=\"display:inline; padding:5px; width: 20px;height: 20px;-moz-border-radius: 50%;-webkit-border-radius: 50%;border-radius: 50%;border: 1px solid #808080;\">3</li>";
                                switch (dr[0].ToString())
                                {
                                    case "1": dashboardStaffAnketSkillsD1.InnerHtml = strMyVal; break;
                                    case "2": dashboardStaffAnketSkillsD2.InnerHtml = strMyVal; break;
                                    case "3": dashboardStaffAnketSkillsD3.InnerHtml = strMyVal; break;
                                    case "4": dashboardStaffAnketSkillsD4.InnerHtml = strMyVal; break;
                                    case "5": dashboardStaffAnketSkillsD5.InnerHtml = strMyVal; break;
                                    case "6": dashboardStaffAnketSkillsD6.InnerHtml = strMyVal; break;
                                    case "7": dashboardStaffAnketSkillsD7.InnerHtml = strMyVal; break;
                                    case "8": dashboardStaffAnketSkillsD8.InnerHtml = strMyVal; break;
                                    case "9": dashboardStaffAnketSkillsD9.InnerHtml = strMyVal; break;
                                    case "10": dashboardStaffAnketSkillsD10.InnerHtml = strMyVal; break;
                                    case "11": dashboardStaffAnketSkillsD11.InnerHtml = strMyVal; break;
                                    case "12": dashboardStaffAnketSkillsD12.InnerHtml = strMyVal; break;
                                    case "13": dashboardStaffAnketSkillsD13.InnerHtml = strMyVal; break;
                                    case "14": dashboardStaffAnketSkillsD14.InnerHtml = strMyVal; break;
                                    case "15": dashboardStaffAnketSkillsD15.InnerHtml = strMyVal; break;
                                    case "16": dashboardStaffAnketSkillsD16.InnerHtml = strMyVal; break;
                                    case "17": dashboardStaffAnketSkillsD17.InnerHtml = strMyVal; break;
                                    case "18": dashboardStaffAnketSkillsD18.InnerHtml = strMyVal; break;
                                    case "19": dashboardStaffAnketSkillsD19.InnerHtml = strMyVal; break;
                                    case "20": dashboardStaffAnketSkillsD20.InnerHtml = strMyVal; break;
                                    case "21": dashboardStaffAnketSkillsD21.InnerHtml = strMyVal; break;
                                    case "22": dashboardStaffAnketSkillsD22.InnerHtml = strMyVal; break;
                                    case "23": dashboardStaffAnketSkillsD23.InnerHtml = strMyVal; break;
                                    case "24": dashboardStaffAnketSkillsD24.InnerHtml = strMyVal; break;
                                    case "25": dashboardStaffAnketSkillsD25.InnerHtml = strMyVal; break;
                                    case "26": dashboardStaffAnketSkillsD26.InnerHtml = strMyVal; break;
                                    case "27": dashboardStaffAnketSkillsD27.InnerHtml = strMyVal; break;
                                    case "28": dashboardStaffAnketSkillsD28.InnerHtml = strMyVal; break;
                                    case "29": dashboardStaffAnketSkillsD29.InnerHtml = strMyVal; break;
                                    case "30": dashboardStaffAnketSkillsD30.InnerHtml = strMyVal; break;
                                }
                            }
                        }
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT COL, NAME, EVAL FROM ST_ANOTHERSKILLS WHERE STAFFS_ID=" + Request.QueryString["id"] + " ORDER BY COL");
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                if (dr[2].ToString() == "1") strMyVal = "<li style=\"display:inline; padding:5px; width: 20px;height: 20px;-moz-border-radius: 50%;-webkit-border-radius: 50%;border-radius: 50%;border: 1px solid #808080;\">1</li><li style=\"display:inline; padding:5px;\">2</li><li style=\"display:inline; padding:5px;\">3</li>";
                                else if (dr[2].ToString() == "2") strMyVal = "<li style=\"display:inline; padding:5px;\">1</li><li style=\"display:inline; padding:5px; width: 20px;height: 20px;-moz-border-radius: 50%;-webkit-border-radius: 50%;border-radius: 50%;border: 1px solid #808080;\">2</li><li style=\"display:inline; padding:5px;\">3</li>";
                                else if (dr[2].ToString() == "3") strMyVal = "<li style=\"display:inline; padding:5px;\">1</li><li style=\"display:inline; padding:5px;\">2</li><li style=\"display:inline; padding:5px; width: 20px;height: 20px;-moz-border-radius: 50%;-webkit-border-radius: 50%;border-radius: 50%;border: 1px solid #808080;\">3</li>";
                                switch (dr[0].ToString())
                                {
                                    case "1": dashboardStaffAnketAnotherSkillsD1Name.InnerHtml = dr[1].ToString(); dashboardStaffAnketAnotherSkillsD1Val.InnerHtml = strMyVal; break;
                                    case "2": dashboardStaffAnketAnotherSkillsD2Name.InnerHtml = dr[1].ToString(); dashboardStaffAnketAnotherSkillsD2Val.InnerHtml = strMyVal; break;
                                    case "3": dashboardStaffAnketAnotherSkillsD3Name.InnerHtml = dr[1].ToString(); dashboardStaffAnketAnotherSkillsD3Val.InnerHtml = strMyVal; break;
                                }
                            }
                        }
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT b.NAME as LANGUAGE_NAME, a.LISTEN_GRADE_ID, a.SPEAK_GRADE_ID, a.READ_GRADE_ID, a.WRITE_GRADE_ID FROM ST_LANGUAGESKILLS a INNER JOIN STN_LANGUAGE b ON a.LANGUAGE_ID=b.ID WHERE a.STAFFS_ID=" + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            string strMyVal1 = "", strMyVal2 = "", strMyVal3 = "", strMyVal4 = "";
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                if (dr[1].ToString() == "1") strMyVal1 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[1].ToString() == "2") strMyVal1 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[1].ToString() == "3") strMyVal1 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td>";
                                if (dr[2].ToString() == "1") strMyVal2 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[2].ToString() == "2") strMyVal2 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[2].ToString() == "3") strMyVal2 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td>";
                                if (dr[3].ToString() == "1") strMyVal3 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[3].ToString() == "2") strMyVal3 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[3].ToString() == "3") strMyVal3 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td>";
                                if (dr[4].ToString() == "1") strMyVal4 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[4].ToString() == "2") strMyVal4 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td>";
                                else if (dr[4].ToString() == "3") strMyVal4 = "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td>";
                                strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr[0].ToString() + "</td>" + strMyVal1 + strMyVal2 + strMyVal3 + strMyVal4 + "</tr>";
                            }
                        }
                        dashboardStaffAnketLanguageskillTable.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT b.NAME as SOFTWARE_NAME, a.GRADE_ID FROM ST_SOFTWARE a INNER JOIN STN_SOFTWARE b ON a.SOFTWARE_ID=b.ID INNER JOIN STN_GRADE c ON a.GRADE_ID=c.ID WHERE a.STAFFS_ID=" + Request.QueryString["id"]);
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                if (dr["GRADE_ID"].ToString() == "1") strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["SOFTWARE_NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td></tr>";
                                else if (dr["GRADE_ID"].ToString() == "2") strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["SOFTWARE_NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td></tr>";
                                else if (dr["GRADE_ID"].ToString() == "3") strMyVal += "<tr><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["SOFTWARE_NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\"></td><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">+</td></tr>";
                            }
                        }
                        dashboardStaffAnketSoftwareTable.InnerHtml = strMyVal;
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet("SELECT OFFICE_ID, GRADE_ID FROM ST_OFFICE WHERE STAFFS_ID=" + Request.QueryString["id"] + " ORDER BY OFFICE_ID");
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                if (dr["OFFICE_ID"].ToString() == "1") {
                                    if(dr["GRADE_ID"].ToString() == "3") dashboardStaffAnketOfficeD1T1.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "2") dashboardStaffAnketOfficeD1T2.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "1") dashboardStaffAnketOfficeD1T3.InnerHtml = "+";
                                }
                                else if (dr["OFFICE_ID"].ToString() == "2")
                                {
                                    if (dr["GRADE_ID"].ToString() == "3") dashboardStaffAnketOfficeD2T1.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "2") dashboardStaffAnketOfficeD2T2.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "1") dashboardStaffAnketOfficeD2T3.InnerHtml = "+";
                                }
                                else if (dr["OFFICE_ID"].ToString() == "3")
                                {
                                    if (dr["GRADE_ID"].ToString() == "3") dashboardStaffAnketOfficeD3T1.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "2") dashboardStaffAnketOfficeD3T2.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "1") dashboardStaffAnketOfficeD3T3.InnerHtml = "+";
                                }
                                else if (dr["OFFICE_ID"].ToString() == "4")
                                {
                                    if (dr["GRADE_ID"].ToString() == "3") dashboardStaffAnketOfficeD4T1.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "2") dashboardStaffAnketOfficeD4T2.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "1") dashboardStaffAnketOfficeD4T3.InnerHtml = "+";
                                }
                                else if (dr["OFFICE_ID"].ToString() == "5")
                                {
                                    if (dr["GRADE_ID"].ToString() == "3") dashboardStaffAnketOfficeD5T1.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "2") dashboardStaffAnketOfficeD5T2.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "1") dashboardStaffAnketOfficeD5T3.InnerHtml = "+";
                                }
                                else if (dr["OFFICE_ID"].ToString() == "6")
                                {
                                    if (dr["GRADE_ID"].ToString() == "3") dashboardStaffAnketOfficeD6T1.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "2") dashboardStaffAnketOfficeD6T2.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "1") dashboardStaffAnketOfficeD6T3.InnerHtml = "+";
                                }
                                else if (dr["OFFICE_ID"].ToString() == "7")
                                {
                                    if (dr["GRADE_ID"].ToString() == "3") dashboardStaffAnketOfficeD7T1.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "2") dashboardStaffAnketOfficeD7T2.InnerHtml = "+";
                                    else if (dr["GRADE_ID"].ToString() == "1") dashboardStaffAnketOfficeD7T3.InnerHtml = "+";
                                }
                            }
                        }
                        strMyVal = "";
                        ds = myObj.OracleExecuteDataSet(@"SELECT ORGNAME, TITLE, FROMDATE, TODATE
FROM(
  SELECT a.ORGNAME, a.TITLE, a.FROMDATE, a.TODATE FROM ST_EXPHISTORY a WHERE a.STAFFS_ID = "+ Request.QueryString["id"] + @"
  UNION ALL
  SELECT
    'САНГИЙН ЯАМ: ' || CASE WHEN TO_NUMBER(TO_CHAR(TO_DATE(a.DT, 'YYYY-MM-DD'), 'YYYY')) < 2015 THEN a.DESCRIPTION ELSE d.INITNAME || ' - ' || c.INITNAME END as ORGNAME
    , f.NAME as TITLE
    , a.DT as FROMDATE
    , a.ENDDT as ENDDT
  FROM ST_STBR a
  INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
  INNER JOIN ST_BRANCH c ON a.BRANCH_ID = c.ID
  INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID
  INNER JOIN STN_POS f ON a.POS_ID = f.ID
  WHERE b.ACTIVE = 1 AND a.STAFFS_ID = " + Request.QueryString["id"] + @"
)
ORDER BY FROMDATE, TODATE");
                        if (ds.Tables[0].Rows.Count != 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["ORGNAME"].ToString() + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TITLE"].ToString() + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["FROMDATE"].ToString() + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TODATE"].ToString() + "</td>";
                                strMyVal += "</tr>";
                            }
                        }
                        dashboardStaffAnketExphistoryTable.InnerHtml = strMyVal;
                        myObj.DBDisconnect();

                        strMyVal = myObj.OracleExecuteScalar("SELECT RTRIM(xmlagg (xmlelement (e, ' '||a.TITLEDESC || ',')).extract('//text()'), ',') PHD_DESCS FROM ST_PHD a INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID WHERE a.EDUTP_ID=2 AND a.STAFFS_ID=" + Request.QueryString["id"]).ToString();
                        if (strMyVal != "") dashboardStaffAnketPhdDesc.InnerHtml = strMyVal;
                        strMyVal = myObj.OracleExecuteScalar("SELECT RTRIM(xmlagg (xmlelement (e, ' '||a.TITLEDESC || ',')).extract('//text()'), ',') SCD_DESCS FROM ST_PHD a INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID WHERE a.EDUTP_ID=1 AND a.STAFFS_ID=" + Request.QueryString["id"]).ToString();
                        if (strMyVal != "") dashboardStaffAnketPhdDesc.InnerHtml = strMyVal;
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
    }
}