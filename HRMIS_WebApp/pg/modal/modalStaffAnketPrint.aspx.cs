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
    public partial class modalStaffAnketPrint : System.Web.UI.Page
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
                    if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
                    {
                        string strStaffId = Request.QueryString["id"];
                        string strQry = @"SELECT a.REGNO, 
    a.IMAGE, 
    a.NATIONALITY, 
    a.MNAME, 
    a.LNAME, 
    a.FNAME, 
    a.BDATE, 
    b.NAME as BIRTH_AIMAG_NAME, 
    c.NAME as BIRTH_SOUM_NAME, 
    a.BPLACE, 
    d.NAME as NAT_NAME,
    g.NAME as ADDRCITY_NAME, 
    h.NAME as ADDRDIST_NAME, 
    a.ADDRESSNAME, f.NAME as SOCPOS_NAME, a.TEL, a.TEL2, a.EMAIL, a.RELNAME, i.NAME as RELATIONNAME, a.RELTEL, a.RELTEL2, 
    a.MILITARY_ISCLOSED 
FROM ST_STAFFS a 
INNER JOIN STN_CITY b ON a.BCITY_ID=b.ID 
INNER JOIN STN_DIST c ON a.BCITY_ID=c.BCITY_ID AND a.BDIST_ID=c.ID 
INNER JOIN STN_NAT d ON a.NAT_ID=d.ID 
INNER JOIN STN_SOCPOS f ON a.SOCPOS_ID=f.ID 
INNER JOIN STN_CITY g ON a.ADDRCITY_ID=g.ID 
INNER JOIN STN_DIST h ON a.ADDRCITY_ID=h.BCITY_ID AND a.ADDRDIST_ID=h.ID 
INNER JOIN STN_RELATION i ON a.RELATION_ID=i.ID 
WHERE a.ID=" + strStaffId;
                        DataSet ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            //rd
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 0) tdRDNO1.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(0, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 1) tdRDNO2.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(1, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 2) tdRDNO3.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(2, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 3) tdRDNO4.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(3, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 4) tdRDNO5.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(4, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 5) tdRDNO6.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(5, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 6) tdRDNO7.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(6, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 7) tdRDNO8.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(7, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 8) tdRDNO9.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(8, 1);
                            if (ds.Tables[0].Rows[0]["REGNO"].ToString().Length > 9) tdRDNO10.InnerHtml = ds.Tables[0].Rows[0]["REGNO"].ToString().Substring(9, 1);
                            //image
                            if (ds.Tables[0].Rows[0]["IMAGE"].ToString() != "") imgAvatar.Attributes["src"] = "../files/staffs/" + ds.Tables[0].Rows[0]["IMAGE"].ToString();
                            labelNationality.InnerHtml = ds.Tables[0].Rows[0]["NATIONALITY"].ToString();
                            labelMiddleName.InnerHtml = ds.Tables[0].Rows[0]["MNAME"].ToString();
                            labelLastName.InnerHtml = ds.Tables[0].Rows[0]["LNAME"].ToString();
                            labelFirstName.InnerHtml = ds.Tables[0].Rows[0]["FNAME"].ToString();
                            labelBirthYear.InnerHtml = ds.Tables[0].Rows[0]["BDATE"].ToString().Split('-')[0];
                            labelBirthMonth.InnerHtml = ds.Tables[0].Rows[0]["BDATE"].ToString().Split('-')[1];
                            labelBirthDay.InnerHtml = ds.Tables[0].Rows[0]["BDATE"].ToString().Split('-')[2];
                            labelBirthAimag.InnerHtml = ds.Tables[0].Rows[0]["BIRTH_AIMAG_NAME"].ToString();
                            labelBirthSoum.InnerHtml = ds.Tables[0].Rows[0]["BIRTH_SOUM_NAME"].ToString();
                            labelBirthPlace.InnerHtml = ds.Tables[0].Rows[0]["BPLACE"].ToString();
                            labelUndesUgsaa.InnerHtml = ds.Tables[0].Rows[0]["NAT_NAME"].ToString();

                            labelAddrAimag.InnerHtml = ds.Tables[0].Rows[0]["ADDRCITY_NAME"].ToString();
                            labelAddrSoum.InnerHtml = ds.Tables[0].Rows[0]["ADDRDIST_NAME"].ToString();
                            labelAddrHome.InnerHtml = ds.Tables[0].Rows[0]["ADDRESSNAME"].ToString();
                            labelTel.InnerHtml = ds.Tables[0].Rows[0]["TEL"].ToString();
                            labelTel2.InnerHtml = ds.Tables[0].Rows[0]["TEL2"].ToString();
                            labelEmail.InnerHtml = ds.Tables[0].Rows[0]["EMAIL"].ToString();
                            labelRelName.InnerHtml = ds.Tables[0].Rows[0]["RELNAME"].ToString();
                            labelRelationName.InnerHtml = ds.Tables[0].Rows[0]["RELATIONNAME"].ToString();

                            labelSignatureLastname.InnerHtml = ds.Tables[0].Rows[0]["LNAME"].ToString().ToUpper().Substring(0, 1)+ ds.Tables[0].Rows[0]["LNAME"].ToString().ToLower().Remove(0,1);
                            labelSignatureFistname.InnerHtml = ds.Tables[0].Rows[0]["FNAME"].ToString().ToUpper().Substring(0, 1) + ds.Tables[0].Rows[0]["FNAME"].ToString().ToLower().Remove(0, 1);

                            if (ds.Tables[0].Rows[0]["MILITARY_ISCLOSED"].ToString() == "1") tdMilitaryIsClosed1.InnerHtml = "✔";
                            else if (ds.Tables[0].Rows[0]["MILITARY_ISCLOSED"].ToString() == "0") tdMilitaryIsClosed0.InnerHtml = "✔";
                        }
                        string strMyVal = "";
                        ds.Clear();
                        strQry = "SELECT b.NAME as RELATIONNAME, a.LNAME||' '||a.FNAME as FULLNAME, a.BYEAR, c.NAME||', '||d.NAME as BIRTHPLACE, a.CURRENTWORK FROM ST_STAFFSFAMILY a INNER JOIN STN_RELATION b ON a.RELATION_ID=b.ID INNER JOIN STN_CITY c ON a.BCITY_ID=c.ID INNER JOIN STN_DIST d ON a.BCITY_ID=d.BCITY_ID AND a.BDIST_ID=d.ID WHERE a.TP=1 AND a.STAFFS_ID=" + strStaffId;
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["RELATIONNAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["FULLNAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["BYEAR"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["BIRTHPLACE"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CURRENTWORK"].ToString() + "</td></tr>";
                            }
                            dashboardStaffAnketFamily1.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = "SELECT b.NAME as RELATIONNAME, a.LNAME||' '||a.FNAME as FULLNAME, a.BYEAR, c.NAME||', '||d.NAME as BIRTHPLACE, a.CURRENTWORK FROM ST_STAFFSFAMILY a INNER JOIN STN_RELATION b ON a.RELATION_ID=b.ID INNER JOIN STN_CITY c ON a.BCITY_ID=c.ID INNER JOIN STN_DIST d ON a.BCITY_ID=d.BCITY_ID AND a.BDIST_ID=d.ID WHERE a.TP=2 AND a.STAFFS_ID=" + strStaffId;
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["RELATIONNAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["FULLNAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["BYEAR"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["BIRTHPLACE"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CURRENTWORK"].ToString() + "</td></tr>";
                            }
                            dashboardStaffAnketFamily2.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT 
    CASE WHEN ISGAVE=1 THEN 'Өгсөн' ELSE 'Өгөөгүй' END as ISGAVE, 
    ISSWEAR, 
    TESTDATE, 
    CASE WHEN ISSPECIAL=1 THEN 'Өгсөн' ELSE 'Өгөөгүй' END as ISSPECIAL, 
    CASE WHEN ISRESERVE=1 THEN 'Байгаа' ELSE 'Байхгүй' END as ISRESERVE
FROM ST_STATES 
WHERE STAFFS_ID=" + strStaffId;
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            tdIsTuriinAlbaShalgalt.InnerHtml = ds.Tables[0].Rows[0]["ISGAVE"].ToString();
                            tdIsTuriinAlbaTusgaiShalgalt.InnerHtml = ds.Tables[0].Rows[0]["ISSPECIAL"].ToString();
                            tdIsNuutsud.InnerHtml = ds.Tables[0].Rows[0]["ISRESERVE"].ToString();
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT 
    a.INSTITUTENAME, 
    CASE WHEN a.FROMMNTH IS NOT NULL THEN TO_CHAR(a.FROMYR)||', '||TO_CHAR(a.FROMMNTH) ELSE TO_CHAR(a.FROMYR) END as FROMYRMNTH, 
    a.FROMYR, 
    a.FROMMNTH, 
    CASE WHEN a.TOMNTH IS NOT NULL THEN TO_CHAR(a.TOYR)||', '||TO_CHAR(a.TOMNTH) ELSE TO_CHAR(a.TOYR) END as TOYRMNTH, 
    a.TOYR, 
    a.TOMNTH, 
    a.PROFESSIONDESC, 
    CASE WHEN a.CERTIFICATENO IS NOT NULL THEN b.NAME||' /'||a.CERTIFICATENO||'/' ELSE b.NAME END as GERCHILGEE
FROM ST_EDUCATION a 
INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID 
WHERE a.STAFFS_ID=" + strStaffId+" " +
"ORDER BY a.FROMYR ASC, a.TOYR ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["INSTITUTENAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["FROMYRMNTH"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TOYRMNTH"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["PROFESSIONDESC"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["GERCHILGEE"].ToString() + "</td></tr>";
                            }
                            dashboardStaffAnketEducationTable.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT 
    b.NAME as EDUTP_NAME, 
    a.INSTITUTENAME, 
    CASE WHEN a.DEGREEMNTH IS NOT NULL THEN TO_CHAR(a.DEGREEYR)||', '||TO_CHAR(a.DEGREEMNTH) ELSE TO_CHAR(a.DEGREEYR) END as DEGREEYRMNTH, 
    a.DEGREEYR, 
    a.DEGREEMNTH, 
    a.CERTIFICATENO 
FROM ST_PHD a 
INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID 
WHERE a.STAFFS_ID=" + strStaffId + @" 
ORDER BY a.DEGREEYR ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["EDUTP_NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["INSTITUTENAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DEGREEYRMNTH"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CERTIFICATENO"].ToString() + "</td></tr>";
                            }
                            dashboardStaffAnketPhdTable.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT RTRIM(xmlagg (xmlelement (e, ' '||a.TITLEDESC || ',')).extract('//text()'), ',') PHD_DESCS 
FROM ST_PHD a 
INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID 
WHERE a.EDUTP_ID=2 AND a.STAFFS_ID=" + strStaffId + @" 
ORDER BY a.DEGREEYR ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0) dashboardStaffAnketPhdDesc.InnerHtml = ds.Tables[0].Rows[0]["PHD_DESCS"].ToString();
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT RTRIM(xmlagg (xmlelement (e, ' '||a.TITLEDESC || ',')).extract('//text()'), ',') SCD_DESCS 
FROM ST_PHD a 
INNER JOIN STN_EDUTP b ON a.EDUTP_ID=b.ID 
WHERE a.EDUTP_ID=1 AND a.STAFFS_ID=" + strStaffId + @" 
ORDER BY a.DEGREEYR ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0) dashboardStaffAnketScdDesc.InnerHtml = ds.Tables[0].Rows[0]["SCD_DESCS"].ToString();
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT a.COUNTRYCITYNAME, a.DURATIONDATE, a.STUDYTIME_NAME, a.SUBJECTDESC, a.CERTIFICATE
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
  WHERE a.STAFFS_ID=" + strStaffId + @" 
  UNION ALL
  SELECT 
    a.COUNTRYNAME||', '||a.CITYNAME as COUNTRYCITYNAME, 
    a.FROMDATE||' - '||a.TODATE as DURATIONDATE, 
    TO_CHAR(TO_CHAR(a.DAYNUM)||' өдөр') as STUDYTIME_NAME, 
    a.SUBJECTNAME as SUBJECTDESC, 
    TO_CHAR(a.TUSHAALNO) as CERTIFICATE
  FROM ST_TOMILOLT a
  INNER JOIN ST_TOMILOLT_STAFFS b ON a.ID=b.TOMILOLT_ID
  WHERE a.TOMILOLTYPE_ID=1 AND a.TOMILOLTDIRECTION_ID IN (1,4,7) AND b.STAFFS_ID=" + strStaffId + @" 
) a
ORDER BY a.DURATIONDATE DESC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["COUNTRYCITYNAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DURATIONDATE"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["STUDYTIME_NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["SUBJECTDESC"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CERTIFICATE"].ToString() + "</td></tr>";
                            }
                            dashboardStaffAnketTrainingTable.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT b.NAME as SCIENCEDEGREE_NAME, a.INSTITUTENAME, a.DEGREEYR, a.DEGREEDATE, a.CERTIFICATENO 
FROM ST_SCIENCEDEGREE a 
INNER JOIN STN_SCIENCEDEGREE b ON a.SCIENCEDEGREE_ID=b.ID 
WHERE a.STAFFS_ID=" + strStaffId + @"
ORDER BY a.DEGREEYR ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["SCIENCEDEGREE_NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["INSTITUTENAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DEGREEDATE"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CERTIFICATENO"].ToString() + "</td></tr>";
                            }
                            dashboardStaffAnketSciencedegreeTable.InnerHtml = strMyVal;
                        }

                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT CERTIFICATENO, SITUATION, ""DESC"" FROM ST_MILITARY WHERE STAFFS_ID=" + strStaffId + @" ORDER BY ID ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + i.ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CERTIFICATENO"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["SITUATION"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td></tr>";
                                i++;
                            }
                            tbodyMilitary.InnerHtml = strMyVal;
                        }

                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT DT, NAME, ""DESC"", GROUND
FROM(
    SELECT
        b.DT, b.NAME, b.ORGDESCRIPTION || ', ' || b.TUSHAALDT || ', ' || b.TUSHAALNO as ""DESC"", b.GROUND
    FROM ST_SHAGNAL_STAFFS a
    INNER JOIN ST_SHAGNAL b ON a.SHAGNAL_ID = b.ID
    INNER JOIN STN_SHAGNALTYPE c ON b.SHAGNALTYPE_ID = c.ID
    INNER JOIN STN_SHAGNALDECISION d ON b.SHAGNALDECISION_ID = d.ID
    WHERE a.STAFFS_ID = " + strStaffId + @"
    UNION ALL
    SELECT DT, NAME, ORGDESCRIPTION || ', ' || TUSHAALDT || ', ' || TUSHAALNO as ""DESC"", GROUND FROM ST_BONUS WHERE STAFFS_ID = " + strStaffId + @"
)
ORDER BY DT ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + dr["DT"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["GROUND"].ToString() + "</td></tr>";
                            }
                            tbodyShagnal.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT ORGNAME, BRANCH, TITLE, FROMDATE, TODATE
FROM(
  SELECT 
    TO_CHAR(a.ORGNAME) as ORGNAME
    , TO_CHAR(a.BRANCHNAME) as BRANCH
    , TO_CHAR(a.TITLE) as TITLE
    , CASE WHEN a.FROMTUSHAALNO IS NOT NULL THEN TO_CHAR(a.FROMDATE||', '||a.FROMTUSHAALNO) ELSE TO_CHAR(a.FROMDATE) END as FROMDATE
    , CASE WHEN a.TOTUSHAALNO IS NOT NULL THEN TO_CHAR(a.TODATE||', '||a.TOTUSHAALNO) ELSE TO_CHAR(a.TODATE) END as TODATE 
  FROM ST_EXPHISTORY a WHERE a.STAFFS_ID = " + strStaffId + @"
  UNION ALL
  SELECT
    'Монгол Улсын Сангийн яам' as ORGNAME
    , CASE WHEN TO_NUMBER(TO_CHAR(TO_DATE(a.DT, 'YYYY-MM-DD'), 'YYYY')) < 2015 THEN TO_CHAR(a.DESCRIPTION) ELSE TO_CHAR(d.NAME || ' - ' || c.NAME) END as BRANCH
    , TO_CHAR(f.NAME) as TITLE
    , CASE WHEN a.TUSHAALNO IS NOT NULL THEN TO_CHAR(a.DT||', '||a.TUSHAALNO) ELSE TO_CHAR(a.DT) END as FROMDATE
    , TO_CHAR(a.ENDDT) as TODATE
  FROM ST_STBR a
  INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
  INNER JOIN ST_BRANCH c ON a.BRANCH_ID = c.ID
  INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID
  INNER JOIN STN_POS f ON a.POS_ID = f.ID
  WHERE b.ACTIVE = 1 AND a.STAFFS_ID = " + strStaffId + @"
)
ORDER BY FROMDATE ASC, TODATE ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["ORGNAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["BRANCH"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TITLE"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["FROMDATE"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TODATE"].ToString() + "</td></tr>";
                            }
                            tbodyTurshlaga.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT 
    a.ID, 
    a.NAME, 
    a.SELFCREATED_TYPE_ID, 
    b.NAME as SELFCREATED_TYPE_NAME, 
    a.DT, 
    a.""DESC"" 
FROM ST_SELFCREATED a
INNER JOIN STN_SELFCREATED_TYPE b ON a.SELFCREATED_TYPE_ID = b.ID
WHERE a.STAFFS_ID = " + strStaffId + @"
ORDER BY a.ID ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\"><td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + i.ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["SELFCREATED_TYPE_NAME"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DT"].ToString() + "</td><td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td></tr>";
                                i++;
                            }
                            tbodyButeel.InnerHtml = strMyVal;
                        }
                    }
                    else Response.Redirect("~/");
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