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
    public partial class modalStaffAnketPrint2 : System.Web.UI.Page
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
                        string strQry = @"SELECT 
    a.LNAME, 
    a.FNAME, 
    CASE WHEN d.ID<>d.FATHER_ID THEN e.NAME||'-'||d.NAME ELSE d.NAME END as BRANCHNAME,
    f.NAME as ""POSITION"",
    i.NAME as ANGILAL, 
    j.NAME as ZEREGLEL, 
    b.TUSHAALDATE, 
    b.TUSHAALNO 
FROM ST_STAFFS a 
INNER JOIN ST_STBR b ON a.ID=b.STAFFS_ID AND b.ISACTIVE=1 
INNER JOIN STN_MOVE c ON b.MOVE_ID=c.ID 
INNER JOIN ST_BRANCH d ON b.BRANCH_ID=d.ID
LEFT JOIN ST_BRANCH e ON d.FATHER_ID=e.ID
LEFT JOIN STN_POS f ON b.POS_ID=f.ID
LEFT JOIN ST_RANK j ON b.RANK_ID=j.ID
LEFT JOIN STN_RANKPOSDEGREE i ON j.RANKPOSDEGREE_ID=i.ID
WHERE c.ACTIVE=1 AND a.ID=" + strStaffId;
                        DataSet ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            labelLastname.InnerHtml = ds.Tables[0].Rows[0]["LNAME"].ToString();
                            labelFirstname.InnerHtml = ds.Tables[0].Rows[0]["FNAME"].ToString();
                            tdBranchName.InnerHtml = ds.Tables[0].Rows[0]["BRANCHNAME"].ToString();
                            tdPositionName.InnerHtml = ds.Tables[0].Rows[0]["POSITION"].ToString();
                            tdPositionAngilal.InnerHtml = ds.Tables[0].Rows[0]["ANGILAL"].ToString();
                            tdPositionZereglel.InnerHtml = ds.Tables[0].Rows[0]["ZEREGLEL"].ToString();
                            if(ds.Tables[0].Rows[0]["TUSHAALNO"].ToString()!="") tdPositionTushaalNo.InnerHtml = "Төрийн нарийн бичгийн даргын "+ ds.Tables[0].Rows[0]["TUSHAALNO"].ToString() +" тоот тушаал";
                            tdPositionTushaalDate.InnerHtml = ds.Tables[0].Rows[0]["TUSHAALDATE"].ToString();

                            labelSignatureLastname.InnerHtml = ds.Tables[0].Rows[0]["LNAME"].ToString().ToUpper().Substring(0, 1) + ds.Tables[0].Rows[0]["LNAME"].ToString().ToLower().Remove(0, 1);
                            labelSignatureFistname.InnerHtml = ds.Tables[0].Rows[0]["FNAME"].ToString().ToUpper().Substring(0, 1) + ds.Tables[0].Rows[0]["FNAME"].ToString().ToLower().Remove(0, 1);
                        }
                        string strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT ID, TBL, TITLE, DT, TUSHAALNAME, TUSHAALNO, CHANGEDTUSHAALDATE, CHANGEDTUSHAALNAME, CHANGEDTUSHAALNO, CHANGEDREASON
FROM(
  SELECT
    a.ID
    , 'ST_EXPHISTORY' as TBL
    , TO_CHAR(a.TITLE) as TITLE
    , a.FROMDATE as DT
    , a.FROMTUSHAALNAME as TUSHAALNAME
    , TO_CHAR(a.FROMTUSHAALNO) as TUSHAALNO
    , a.CHANGEDFROMTUSHAALDATE as CHANGEDTUSHAALDATE
    , a.CHANGEDFROMTUSHAALNAME as CHANGEDTUSHAALNAME
    , a.CHANGEDFROMTUSHAALNO as CHANGEDTUSHAALNO
    , a.CHANGEDFROMREASON as CHANGEDREASON
  FROM ST_EXPHISTORY a 
  WHERE a.ORGTYPE_ID=1 AND a.STAFFS_ID = " + strStaffId + @" 
  UNION ALL
  SELECT
    a.ID
    , 'ST_STBR' as TBL
    , TO_CHAR(f.NAME) as TITLE
    , a.DT
    , a.TUSHAALNAME
    , TO_CHAR(a.TUSHAALNO) as TUSHAALNO
    , a.CHANGEDTUSHAALDATE
    , a.CHANGEDTUSHAALNAME
    , a.CHANGEDTUSHAALNO
    , a.CHANGEDREASON
  FROM ST_STBR a
  INNER JOIN STN_MOVE b ON a.MOVE_ID = b.ID
  INNER JOIN ST_BRANCH c ON a.BRANCH_ID = c.ID
  INNER JOIN ST_BRANCH d ON c.FATHER_ID = d.ID
  INNER JOIN STN_POS f ON a.POS_ID = f.ID
  WHERE b.ACTIVE = 1 AND a.STAFFS_ID = " + strStaffId + @"
)
ORDER BY DT ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\">";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + i.ToString() + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TITLE"].ToString() + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DT"].ToString(); ;
                                if (dr["TUSHAALNAME"].ToString() != "") strMyVal += ", " + dr["TUSHAALNAME"].ToString();
                                if (dr["TUSHAALNO"].ToString() != "") strMyVal += ", " + dr["TUSHAALNO"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CHANGEDTUSHAALDATE"].ToString();
                                if(dr["CHANGEDTUSHAALNAME"].ToString() != "") strMyVal += ", "+ dr["CHANGEDTUSHAALNAME"].ToString();
                                if (dr["CHANGEDTUSHAALNO"].ToString() != "") strMyVal += ", " + dr["CHANGEDTUSHAALNO"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CHANGEDREASON"].ToString() + "</td>";
                                strMyVal += "</tr>";
                                i++;
                            }
                            tbodyTomilgoo.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = @"SELECT ID, STAFFS_ID, RANKPOSDEGREE_NAME, RANK_NAME, POSDEGREEDTL_NAME, TSOLNAME, DECISIONDATE, CERTIFICATENO, UNEMLEHNO, ISDEL, TBL
FROM (
    SELECT a.ZEREGDEV_ID as ID, a.STAFFS_ID, d.NAME as RANKPOSDEGREE_NAME, e.NAME as RANK_NAME, c.NAME as POSDEGREEDTL_NAME, a.TSOLNAME, b.DT as DECISIONDATE, b.CERTIFICATENO, a.UNEMLEHNO, 0 as ISDEL, 'ST_ZEREGDEV_STAFFS' as TBL
    FROM ST_ZEREGDEV_STAFFS a
    INNER JOIN ST_ZEREGDEV b ON a.ZEREGDEV_ID = b.ID
    INNER JOIN STN_POSDEGREEDTL c ON b.POSDEGREEDTL_ID = c.ID
    INNER JOIN STN_RANKPOSDEGREE d ON b.RANKPOSDEGREE_ID = d.ID
    LEFT JOIN ST_RANK e ON a.RANK_ID=e.ID
    WHERE a.STAFFS_ID = " + strStaffId + @"
    UNION ALL
    SELECT a.ID, a.STAFFS_ID, c.NAME as RANKPOSDEGREE_NAME, e.NAME as RANK_NAME, b.NAME as POSDEGREEDTL_NAME, a.TSOLNAME, a.DECISIONDATE, a.CERTIFICATENO, a.UNEMLEHNO, 1 as ISDEL, 'ST_JOBTITLEDEGREE' as TBL
    FROM ST_JOBTITLEDEGREE a
    INNER JOIN STN_POSDEGREEDTL b ON a.POSDEGREEDTL_ID = b.ID
    INNER JOIN STN_RANKPOSDEGREE c ON a.RANKPOSDEGREE_ID = c.ID
    LEFT JOIN ST_RANK e ON a.RANK_ID=e.ID
    WHERE a.STAFFS_ID = " + strStaffId + @"
)
ORDER BY DECISIONDATE ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\">";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["RANKPOSDEGREE_NAME"].ToString();
                                if (dr["RANK_NAME"].ToString() != "") strMyVal += ", " + dr["RANK_NAME"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["POSDEGREEDTL_NAME"].ToString();
                                if (dr["TSOLNAME"].ToString() != "") strMyVal += ", " + dr["TSOLNAME"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DECISIONDATE"].ToString();
                                if (dr["CERTIFICATENO"].ToString() != "") strMyVal += ", " + dr["CERTIFICATENO"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["UNEMLEHNO"].ToString() + "</td>";
                                strMyVal += "</tr>";
                                i++;
                            }
                            tbodyZeregDev.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = "SELECT ID, STAFFS_ID, DT, \"NAME\", AMT, TUSHAALNAME, TUSHAALNO, TUSHAALDT, \"DESC\" FROM ST_INCENTIVES WHERE STAFFS_ID=" + strStaffId + " ORDER BY DT ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\">";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + dr["DT"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["NAME"].ToString();
                                if (dr["AMT"].ToString() != "") strMyVal += ", ₮" + dr["AMT"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TUSHAALNAME"].ToString();
                                if (dr["TUSHAALDT"].ToString() != "") strMyVal += ", " + dr["TUSHAALDT"].ToString();
                                if (dr["TUSHAALNO"].ToString() != "") strMyVal += ", " + dr["TUSHAALNO"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td>";
                                strMyVal += "</tr>";
                                i++;
                            }
                            tbodyUramshuulal.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = "SELECT ID, STAFFS_ID, DT, \"NAME\", AMT, TUSHAALNAME, TUSHAALNO, TUSHAALDT, \"DESC\" FROM ST_COMPENSATION WHERE STAFFS_ID=" + strStaffId + " ORDER BY DT ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\">";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + dr["DT"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["NAME"].ToString();
                                if (dr["AMT"].ToString() != "") strMyVal += ", ₮" + dr["AMT"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TUSHAALNAME"].ToString();
                                if (dr["TUSHAALDT"].ToString() != "") strMyVal += ", " + dr["TUSHAALDT"].ToString();
                                if (dr["TUSHAALNO"].ToString() != "") strMyVal += ", " + dr["TUSHAALNO"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td>";
                                strMyVal += "</tr>";
                                i++;
                            }
                            tbodyNuhuhtulbur.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = "SELECT ID, STAFFS_ID, ORGNAME, PUNISHEDPERSONNAME, TUSHAALNAME, TUSHAALNO, TUSHAALDT, \"DESC\" FROM ST_SHIITGEL WHERE STAFFS_ID=" + strStaffId + " ORDER BY ID ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\">";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["ORGNAME"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["PUNISHEDPERSONNAME"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["TUSHAALNAME"].ToString();
                                if (dr["TUSHAALDT"].ToString() != "") strMyVal += ", " + dr["TUSHAALDT"].ToString();
                                if (dr["TUSHAALNO"].ToString() != "") strMyVal += ", " + dr["TUSHAALNO"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td>";
                                strMyVal += "</tr>";
                                i++;
                            }
                            tbodyShiitgel.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = "SELECT ID, STAFFS_ID, CONTENTNAME, UPDATEDT1, UPDATEDPERSONNAME, UPDATEDT2, \"DESC\" FROM ST_ANKETMONITOR WHERE STAFFS_ID=" + strStaffId + " ORDER BY ID ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\">";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["CONTENTNAME"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + dr["UPDATEDT1"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["UPDATEDPERSONNAME"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + dr["UPDATEDT2"].ToString();
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td>";
                                strMyVal += "</tr>";
                                i++;
                            }
                            tbodyHuviinHereg.InnerHtml = strMyVal;
                        }
                        strMyVal = "";
                        ds.Clear();
                        strQry = "SELECT ID, STAFFS_ID, YR, D1, D2, D3, D4, D5, D6, \"DESC\" FROM ST_ANKETSALARY WHERE STAFFS_ID=" + strStaffId + " ORDER BY YR ASC";
                        ds = myObj.OracleExecuteDataSet(strQry);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int i = 1;
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                strMyVal += "<tr style=\"font-style:italic; font-size:11pt;\" style=\"font-style:italic; font-size:11pt;\">";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:center; vertical-align:top;\">" + dr["YR"].ToString()+"</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:right; vertical-align:top;\">" + String.Format("{0:n}", Int32.Parse(dr["D1"].ToString()))+"</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:right; vertical-align:top;\">" + String.Format("{0:n}", Int32.Parse(dr["D2"].ToString())) + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:right; vertical-align:top;\">" + String.Format("{0:n}", Int32.Parse(dr["D3"].ToString())) + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:right; vertical-align:top;\">" + String.Format("{0:n}", Int32.Parse(dr["D4"].ToString())) + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:right; vertical-align:top;\">" + String.Format("{0:n}", Int32.Parse(dr["D5"].ToString())) + "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:right; vertical-align:top;\">";
                                if(dr["D6"].ToString() != "") strMyVal += String.Format("{0:n}", Int32.Parse(dr["D6"].ToString()));
                                strMyVal += "</td>";
                                strMyVal += "<td style=\"border: 1px solid #000; padding: 5px; text-align:left; vertical-align:top;\">" + dr["DESC"].ToString() + "</td>";
                                strMyVal += "</tr>";
                                i++;
                            }
                            tbodyAnketSalary.InnerHtml = strMyVal;
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