using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRWebApp.pg
{
    /// <summary>
    /// Summary description for UploadFile
    /// </summary>
    public class UploadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection SelectedFiles = context.Request.Files;
                for (int i = 0; i < SelectedFiles.Count; i++)
                {
                    HttpPostedFile PostedFile = SelectedFiles[i];
                    string FileName = context.Server.MapPath("~/files/" + context.Request.QueryString["folder"] + "/" + context.Request.QueryString["filename"]);
                    PostedFile.SaveAs(FileName);
                }
            }
            else
            {
                throw new cs.HRMISException("Файл сонгогдоогүй байна.");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}