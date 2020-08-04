using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRWebApp.pg.forclient
{
    /// <summary>
    /// Summary description for forClientUploadFile
    /// </summary>
    public class forClientUploadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection SelectedFiles = context.Request.Files;
                for (int i = 0; i < SelectedFiles.Count; i++)
                {
                    HttpPostedFile PostedFile = SelectedFiles[i];
                    string FileName = context.Server.MapPath("~/pg/forclient/assets/files/" + context.Request.QueryString["filename"]);
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