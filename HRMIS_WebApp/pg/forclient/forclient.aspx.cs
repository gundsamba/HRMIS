using HRWebApp.cs;
//using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg.forclient
{
    public partial class forclient : System.Web.UI.Page
    {
        //OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["HRMISDBCONN"].ConnectionString);
        //MySqlConnection conmysql = new MySqlConnection(ConfigurationManager.ConnectionStrings["MOFGOVMNConn"].ConnectionString);
        //OracleCommand cmd;
        //MySqlCommand cmdmysql;
        //OracleDataAdapter adapter = new OracleDataAdapter();
        //MySqlDataAdapter adaptermysql = new MySqlDataAdapter();
        //DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string strVal = "";
            //try
            //{
            //    //section2
            //    strVal = "";
            //    string strLastDate = "";
            //    strVal = "";
            //    cmdmysql = new MySqlCommand();
            //    cmdmysql.CommandType = CommandType.Text;
            //    cmdmysql.CommandText = "SELECT DATE_FORMAT(post_date,'%Y-%m-%d') as dt FROM mof_posts WHERE post_type = 'pendinginvestment' AND post_date=(SELECT MAX(post_date) FROM mof_posts WHERE post_type = 'pendinginvestment')";
            //    cmdmysql.Connection = conmysql;
            //    adaptermysql.SelectCommand = cmdmysql;
            //    ds = new DataSet();
            //    adaptermysql.Fill(ds);
            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        strLastDate = ds.Tables[0].Rows[0][0].ToString();
            //        section2Year.InnerHtml = strLastDate.Split('-')[0].ToString();
            //        section2Month.InnerHtml = strLastDate.Split('-')[1].ToString();
            //        section2Day.InnerHtml = strLastDate.Split('-')[2].ToString();
            //    }
            //    else {
            //        section2Year.InnerHtml = "0000";
            //        section2Month.InnerHtml = "00";
            //        section2Day.InnerHtml = "00";
            //    }
            //    strVal = "";
            //    cmdmysql = new MySqlCommand();
            //    cmdmysql.CommandType = CommandType.Text;
            //    cmdmysql.CommandText = "SELECT post_content FROM mof_posts WHERE post_type = 'pendinginvestment' AND post_date=(SELECT MAX(post_date) FROM mof_posts WHERE post_type = 'pendinginvestment')";
            //    cmdmysql.Connection = conmysql;
            //    adaptermysql.SelectCommand = cmdmysql;
            //    ds = new DataSet();
            //    adaptermysql.Fill(ds);
            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        divsection2Content.InnerHtml = ds.Tables[0].Rows[0][0].ToString().Replace("&nbsp;&nbsp;", "");
            //    }
            //    else
            //    {
            //        divsection2Content.InnerHtml = "<i>Мэдээлэл олдсонгүй...</i>";
            //    }

            //    ////section3
            //    //strVal = "";
            //    //cmd = new OracleCommand();
            //    //cmd.CommandType = CommandType.Text;
            //    //cmd.CommandText = "SELECT YR||'~'||FILE_NAME FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=3 AND YR=(SELECT MAX(YR) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=3)";
            //    //cmd.Connection = con;
            //    //adapter.SelectCommand = cmd;
            //    //ds = new DataSet();
            //    //adapter.Fill(ds);
            //    //if (ds.Tables[0].Rows.Count != 0)
            //    //{
            //    //    forclientSection3File.Src = "assets/files/" + ds.Tables[0].Rows[0][0].ToString().Split('~')[1];
            //    //}
            //    //else
            //    //{
            //    //    forclientSection3File.Src = "assets/files/no_data.pdf";
            //    //}

            //    //section4
            //    strVal = "";
            //    cmd = new OracleCommand();
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = "SELECT YR||'~'||FILE_NAME FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=4 AND YR=(SELECT MAX(YR) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=4)";
            //    cmd.Connection = con;
            //    adapter.SelectCommand = cmd;
            //    ds = new DataSet();
            //    adapter.Fill(ds);
            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        forclientSection4File.Src = "assets/files/" + ds.Tables[0].Rows[0][0].ToString().Split('~')[1];
            //    }
            //    else
            //    {
            //        forclientSection4File.Src = "assets/files/no_data.pdf";
            //    }

            //    //section5
            //    strVal = "";
            //    cmd = new OracleCommand();
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = @"SELECT YR||'~'||MNTH||'~'||FILE_NAME FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=5 AND YR=(SELECT MAX(YR) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=5) AND MNTH=(SELECT MAX(MNTH) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=5 AND YR=(SELECT MAX(YR) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=5))";
            //    cmd.Connection = con;
            //    adapter.SelectCommand = cmd;
            //    ds = new DataSet();
            //    adapter.Fill(ds);
            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        forclientSection5File.Src = "assets/files/" + ds.Tables[0].Rows[0][0].ToString().Split('~')[1];
            //    }
            //    else
            //    {
            //        forclientSection5File.Src = "assets/files/no_data.pdf";
            //    }

            //    //section 6
            //    strVal = "";
            //    cmd = new OracleCommand();
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = "SELECT ID, NAME FROM ST_BRANCH WHERE BRANCH_TYPE_ID=1 AND ISACTIVE=1 ORDER BY SORT";
            //    cmd.Connection = con;
            //    adapter.SelectCommand = cmd;
            //    ds = new DataSet();
            //    adapter.Fill(ds);
            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        foreach (DataRow dr in ds.Tables[0].Rows)
            //        {
            //            strVal += "<div class=\"col-md-12\">";
            //            strVal += "<input type=\"button\" value=\""+dr["NAME"].ToString()+ "\" class=\"btn\" style=\"background-color: #4e7a8c; width: 100%; color: #FFF; margin-bottom: 10px;\" data-target=\"#forclientModal\" data-toggle=\"modal\" onclick=\"setGazarInModal(this, '" + dr["ID"].ToString() + "')\" />";
            //            strVal += "</div>";
            //        }
            //    }
            //    forclientSection6Div.InnerHtml = strVal;

            //    //section7
            //    strVal = "";
            //    cmd = new OracleCommand();
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = "SELECT YR||'~'||FILE_NAME FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=7 AND YR=(SELECT MAX(YR) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=7)";
            //    cmd.Connection = con;
            //    adapter.SelectCommand = cmd;
            //    ds = new DataSet();
            //    adapter.Fill(ds);
            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        forclientSection7File.Src = "assets/files/" + ds.Tables[0].Rows[0][0].ToString().Split('~')[1];
            //    }
            //    else
            //    {
            //        forclientSection7File.Src = "assets/files/no_data.pdf";
            //    }

            //    //section8
            //    strVal = "";
            //    cmd = new OracleCommand();
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = "SELECT YR||'~'||FILE_NAME FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=8 AND YR=(SELECT MAX(YR) FROM ST_INTRACTIVEDATA WHERE INTRACTIVEDATA_TYPE=8)";
            //    cmd.Connection = con;
            //    adapter.SelectCommand = cmd;
            //    ds = new DataSet();
            //    adapter.Fill(ds);
            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        forclientSection8File.Src = "assets/files/" + ds.Tables[0].Rows[0][0].ToString().Split('~')[1];
            //    }
            //    else
            //    {
            //        forclientSection8File.Src = "assets/files/no_data.pdf";
            //    }
            //}
            //catch (NullReferenceException ex)
            //{
            //}
            //catch (cs.HRMISException ex)
            //{
            //    using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/hrmisexlogs.txt")))
            //    {
            //        w.WriteLine("Алдаа : INTRACTIVE");
            //        w.Write("  Message:{0}", ex.Message);
            //        w.WriteLine("  StackTrace:{0}", ex.StackTrace);
            //        w.WriteLine("--------------------------------------------------------------------------------");
            //    }
            //    //cs.WriteLogForEx.WriteLog(ex);
            //    HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
            //    Response.Redirect("~/#pg/error500.aspx");
            //}
            //catch (Exception ex)
            //{
            //    using (StreamWriter w = File.AppendText(System.Web.HttpContext.Current.Server.MapPath("~/files/exception/hrmisexlogs.txt")))
            //    {
            //        w.WriteLine("Алдаа : INTRACTIVE");
            //        w.Write("  Message:{0}", ex.Message);
            //        w.WriteLine("  StackTrace:{0}", ex.StackTrace);
            //        w.WriteLine("--------------------------------------------------------------------------------");
            //    }
            //    //cs.WriteLogForEx.WriteLog(ex);
            //    HttpContext.Current.Session["error500"] = "Message: " + ex.Message + "<br/>StackTrace: " + ex.StackTrace;
            //    Response.Redirect("~/#pg/error500.aspx");
            //}
            //finally
            //{
            //    con.Close();
            //    conmysql.Close();
            //    //con.Dispose();
            //}
            
        }
    }
}