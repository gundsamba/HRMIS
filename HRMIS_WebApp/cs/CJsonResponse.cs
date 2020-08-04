using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace HRWebApp.cs
{
    public class CJsonResponse
    {
        public class JsonResponseDataD
        {
            public string __type { get; set; }
            public int RetType { get; set; }
            public string RetDesc { get; set; }
            public List<Dictionary<string, string>> RetData { get; set; }
        }
        public class JsonResponseData
        {
            public JsonResponseDataD d { get; set; }
        }
        public string JsonResponse(int RetType, string RetDesc, DataTable RetData = null)
        {
            List<Dictionary<string, string>> ListRows = new List<Dictionary<string, string>>();
            Dictionary<string, string> DicRow;
            if (RetData != null)
            {
                if (RetData.Rows.Count != 0)
                {
                    foreach (DataRow dr in RetData.Rows)
                    {
                        DicRow = new Dictionary<string, string>();
                        foreach (DataColumn col in RetData.Columns)
                        {
                            DicRow.Add(col.ColumnName, dr[col].ToString());
                        }
                        ListRows.Add(DicRow);
                    }
                }
            }
            var objJsonData = new JsonResponseDataD
            {
                __type = "MoF.HRMIS.Service.Local",
                RetType = RetType,
                RetDesc = RetDesc,
                RetData = ListRows
            };
            var objJsonResponseData = new JsonResponseData
            {
                d = objJsonData
            };
            return (new JavaScriptSerializer().Serialize(objJsonResponseData));
        }
    }
}