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
    public partial class staffsdataaddStafflistModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModifyDB myObj = new ModifyDB();
            GetTableData myObjGetTableData = new GetTableData();
            DataSet ds = null;
            string strQry = "";
            try
            {
                strQry = "SELECT NVL(b.IMAGE,'male.png') as IMAGE, b.LNAME, b.FNAME, d.NAME, CASE WHEN f.ID=f.FATHER_ID THEN f.INITNAME ELSE g.INITNAME||' - '||f.INITNAME END as NEGJ FROM ST_SHAGNAL_STAFFS a INNER JOIN ST_STAFFS b ON a.STAFFS_ID=b.ID INNER JOIN ST_STBR c ON b.ID=c.STAFFS_ID INNER JOIN STN_POS d ON c.POS_ID=d.ID INNER JOIN ST_BRANCH f ON c.BRANCH_ID=f.ID INNER JOIN ST_BRANCH g ON f.FATHER_ID=g.ID WHERE a.SHAGNAL_ID=" + Request.QueryString["id"] + " AND c.ISACTIVE=1 ORDER BY d.SORT, b.LNAME, b.FNAME";
                ds = myObj.OracleExecuteDataSet(strQry);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    staffsdataaddStafflistModalTableDiv.InnerHtml = "<table class=\"table table-hover table-striped\"><thead><tr><th><i class=\"fa fa-fw fa-file-photo-o text-muted hidden-md hidden-sm hidden-xs\"></i></th><th>Овог</th><th>Нэр</th><th>Албан тушаал</th><th>Харьялагдах нэгж</th></tr></thead><tbody>";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        staffsdataaddStafflistModalTableDiv.InnerHtml += "<tr><td class=\"no-padding\" style=\"padding-left:5px!important;\"><img src=\"../files/staffs/" + dr["IMAGE"].ToString() + "\" class=\"stafflistimage\" /></td><td>" + dr[1].ToString() + "</td><td>" + dr[2].ToString() + "</td><td>" + dr[3].ToString() + "</td><td>" + dr[4].ToString() + "</td></tr>";
                    }
                    staffsdataaddStafflistModalTableDiv.InnerHtml += "</tbody></table>";
                }
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