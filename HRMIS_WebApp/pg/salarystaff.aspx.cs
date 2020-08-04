using HRWebApp.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRWebApp.pg
{
    public partial class salarystaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HRMIS_UserID"] == null) Response.Redirect("~/login");
            else setDatas();
        }
        protected void setDatas()
        {
            ModifyDB myObj = new ModifyDB();
            CSession sessionClass = new CSession();
            CMain mainClass = new CMain();
            GetTableData myObjGetTableData = new GetTableData();
            try
            {
                int currYear = 2019;
                var userData = sessionClass.getCurrentUserData();
                string strQry = @"SELECT MONTH_VALUE, WORK_DAY, TSALIN, BUILD_TSALIN, B_TOTAL, A_TOTAL, N_TOTAL
	, TOTAL_A1, TOTAL_A2, TOTAL_A3, TOTAL_A4, TOTAL_A5, TOTAL_A6, TOTAL_A7, TOTAL_A8, TOTAL_A9, TOTAL_A10, TOTAL_A11, TOTAL_A12, TOTAL_A13, TOTAL_A14, TOTAL_A15, TOTAL_A16, TOTAL_A17, TOTAL_A18, TOTAL_A19, TOTAL_A20, TOTAL_A21, TOTAL_A22, TOTAL_A23, TOTAL_A24, TOTAL_A25, TOTAL_A26, TOTAL_A27, TOTAL_A28, TOTAL_A29, TOTAL_A30, TOTAL_A31, TOTAL_A32, TOTAL_A33, TOTAL_A34, TOTAL_A35
    , TOTAL_L1, TOTAL_L2, TOTAL_L3, TOTAL_L4, TOTAL_L5, TOTAL_L6, TOTAL_L7, TOTAL_L8, TOTAL_L9, TOTAL_L10, TOTAL_L11, TOTAL_L12, TOTAL_L13, TOTAL_L14, TOTAL_L15, TOTAL_L16, TOTAL_L17, TOTAL_L18, TOTAL_L19, TOTAL_L20, TOTAL_L21, TOTAL_L22, TOTAL_L23, TOTAL_L24, TOTAL_L25, TOTAL_L26, TOTAL_L27, TOTAL_L28, TOTAL_L29, TOTAL_L30, TOTAL_L31, TOTAL_L32, TOTAL_L33, TOTAL_L34, TOTAL_L35
    , SUM_TSALIN, FIRST_LESS, LESS_TSALIN, SUB_TSALIN, END_TSALIN FROM ST_STAFFSALARY WHERE YEAR_VALUE="+ currYear.ToString() + @" AND REGNO = '"+ mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' ORDER BY MONTH_VALUE";
//                string strQry = @"SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE1 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE2 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE3 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE4 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE5 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE6 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE7 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE8 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE9 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE10 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//UNION ALL 
//SELECT a.MONTH_VALUE, a.WORK_DAY, a.TSALIN, a.BUILD_TSALIN, a.B_TOTAL, a.A_TOTAL, a.N_TOTAL
//	, a.TOTAL_A1, a.TOTAL_A2, a.TOTAL_A3, a.TOTAL_A4, a.TOTAL_A5, a.TOTAL_A6, a.TOTAL_A7, a.TOTAL_A8, a.TOTAL_A9, a.TOTAL_A10, a.TOTAL_A11, a.TOTAL_A12, a.TOTAL_A13, a.TOTAL_A14, a.TOTAL_A15, a.TOTAL_A16, a.TOTAL_A17, a.TOTAL_A18, a.TOTAL_A19, a.TOTAL_A20, a.TOTAL_A21, a.TOTAL_A22, a.TOTAL_A23, a.TOTAL_A24, a.TOTAL_A25, a.TOTAL_A26, a.TOTAL_A27, a.TOTAL_A28, a.TOTAL_A29, a.TOTAL_A30, a.TOTAL_A31, a.TOTAL_A32, a.TOTAL_A33, a.TOTAL_A34, a.TOTAL_A35
//    , a.TOTAL_L1, a.TOTAL_L2, a.TOTAL_L3, a.TOTAL_L4, a.TOTAL_L5, a.TOTAL_L6, a.TOTAL_L7, a.TOTAL_L8, a.TOTAL_L9, a.TOTAL_L10, a.TOTAL_L11, a.TOTAL_L12, a.TOTAL_L13, a.TOTAL_L14, a.TOTAL_L15, a.TOTAL_L16, a.TOTAL_L17, a.TOTAL_L18, a.TOTAL_L19, a.TOTAL_L20, a.TOTAL_L21, a.TOTAL_L22, a.TOTAL_L23, a.TOTAL_L24, a.TOTAL_L25, a.TOTAL_L26, a.TOTAL_L27, a.TOTAL_L28, a.TOTAL_L29, a.TOTAL_L30, a.TOTAL_L31, a.TOTAL_L32, a.TOTAL_L33, a.TOTAL_L34, a.TOTAL_L35
//    , a.SUM_TSALIN, a.FIRST_LESS, a.LESS_TSALIN, a.SUB_TSALIN, a.END_TSALIN
//FROM TSALIN_TABLE11 a
//INNER JOIN ORGANIZATION b ON a.ORG_ID=b.REC_ID
//WHERE a.MONTH_PRT=1 AND b.REGISTER_CODE = _none'" + mainClass.Iso8859_To_Win1251(userData.USR_REGNO) + @"' 
//";
                //DataSet ds = myObj.OleDBExecuteDataSet(strQry, true);
                DataSet ds = myObj.OracleExecuteDataSet(strQry);
                string[] arrSalNemegdel = new string[] { "TOTAL_A1", "TOTAL_A2", "TOTAL_A3", "TOTAL_A4", "TOTAL_A5", "TOTAL_A6", "TOTAL_A7", "TOTAL_A8", "TOTAL_A9", "TOTAL_A10", "TOTAL_A11", "TOTAL_A12", "TOTAL_A13", "TOTAL_A14", "TOTAL_A15", "TOTAL_A16", "TOTAL_A17", "TOTAL_A18", "TOTAL_A19", "TOTAL_A20", "TOTAL_A21", "TOTAL_A22", "TOTAL_A23", "TOTAL_A24", "TOTAL_A25", "TOTAL_A26", "TOTAL_A27", "TOTAL_A28", "TOTAL_A29", "TOTAL_A30", "TOTAL_A31", "TOTAL_A32", "TOTAL_A33", "TOTAL_A34", "TOTAL_A35" };
                string[] arrSalSuutgal = new string[] { "TOTAL_L1", "TOTAL_L2", "TOTAL_L3", "TOTAL_L4", "TOTAL_L5", "TOTAL_L6", "TOTAL_L7", "TOTAL_L8", "TOTAL_L9", "TOTAL_L10", "TOTAL_L11", "TOTAL_L12", "TOTAL_L13", "TOTAL_L14", "TOTAL_L15", "TOTAL_L16", "TOTAL_L17", "TOTAL_L18", "TOTAL_L19", "TOTAL_L20", "TOTAL_L21", "TOTAL_L22", "TOTAL_L23", "TOTAL_L24", "TOTAL_L25", "TOTAL_L26", "TOTAL_L27", "TOTAL_L28", "TOTAL_L29", "TOTAL_L30", "TOTAL_L31", "TOTAL_L32", "TOTAL_L33", "TOTAL_L34", "TOTAL_L35" };
                string[] arrSalNemegdelName = new string[] { "Хоол", "Тээврийн хөлс", "Тогтмол нэмэгдэл", "Хүнд хортой", "Хавсран ажилласан", "Нэг өдрийн цалин", "Удаан жил", "Урамшуулал", "Цалингийн зөрүү", "Илүү цаг", "ТХоол", "Баярын илүү цаг", "Шөнийн илүү цаг", "Тасаг нэгжийн нэмэгдэл", "Ашгийн зөрүү", "Цолны нэмэгдэл", "Шагналт нэмэгдэл", "Профессорын нэмэгдэл", "Ур чадварын нэмэгдэл", "Зэргийн нэмэгдэл", "Ахлахын нэмэгдэл", "Зөвлөхийн нэмэгдэл", "ТАХ нэмэгдэл", "нэмэгдэл", "ХАОАТ-н зөрүү", "Тусгай албаны нэмэгдэл", "Онцгойн албаны нэмэгдэл", "Эх барихын нэмэгдэл", "Эд хариуцагчийн нэмэгдэл", "Балансын шагнал", "Клиникин эрхлэгчийн нэмэгдэл", "Анги даалт", "Дэвтэр засалт", "Үр дүнгийн шагнал", "Утасны нэмэгдэл" };
                string[] arrSalSuutgalName = new string[] { "НДШ", "Ашиг", "Шүүхийн шийдвэрлийн гүйцэтгэл", "ҮЭ-н татвар", "Цалингийн зөрүү", "Хадгаламж", "Гэнэтийн осол", "Урьдчилгаа", "Хоолны талон", "Тушаалаар хасагдсан", "Шийтгэл", "Нэг өдрийн цалин", "Даатгалын хураамж", "Орон сууц", "Түлээ", "TOTAL_L16", "TOTAL_L17", "TOTAL_L18", "TOTAL_L19", "TOTAL_L20", "TOTAL_L21", "TOTAL_L22", "TOTAL_L23", "TOTAL_L24", "TOTAL_L25", "TOTAL_L26", "TOTAL_L27", "TOTAL_L28", "TOTAL_L29", "TOTAL_L30", "TOTAL_L31", "TOTAL_L32", "TOTAL_L33", "TOTAL_L34", "TOTAL_L35" };
                double[] arrSalNemegdelSum = new double[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                double[] arrSalSuutgalSum = new double[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        for (int i = 0; i < arrSalNemegdel.Length; i++)
                        {
                            arrSalNemegdelSum[i] += Convert.ToDouble(dr[arrSalNemegdel[i]].ToString());
                            arrSalSuutgalSum[i] += Convert.ToDouble(dr[arrSalSuutgal[i]].ToString());
                        }
                    }
                    int iNemegdelCnt = 0, iSuutgalCnt = 0;
                    for (int i = 0; i < arrSalNemegdelSum.Length; i++)
                    {
                        if (arrSalNemegdelSum[i] > 0) iNemegdelCnt++;
                        if (arrSalSuutgalSum[i] > 0) iSuutgalCnt++;
                    }
                    iNemegdelCnt++;
                    iSuutgalCnt++;
                    string strContent = string.Empty;
                    strContent += @"<table class=""table table-bordered table-striped margin-bottom-0""><thead>
<tr>
<th colspan=""3"" class=""text-center"">Ерөнхий мэдээлэл</th>
<th rowspan=""2"" class=""text-center"">Бодогдсон цалин</th>
<th colspan=""" + iNemegdelCnt.ToString() + @""" class=""text-center"">Бодогдсон цалин болон нэмэгдлүүд</th>
<th colspan=""" + iSuutgalCnt.ToString() + @""" class=""text-center"">Суутгал болон суутгалын дүн</th>
<th rowspan=""2"" class=""text-center"">Урьдчилгаа</th>
<th rowspan=""2"" class=""text-center"">Гарт олгох</th>
<th rowspan=""2"" class=""text-center"">Нийт олгох</th>
</tr>
<tr>
<th class=""text-center"">Сар</th>
<th class=""text-center"">Хоног</th>
<th class=""text-center"">Үндсэн цалин</th>";
                    for (int i = 0; i < arrSalNemegdelSum.Length; i++)
                    {
                        if (arrSalNemegdelSum[i] > 0)
                        {
                            strContent += @"<th class=""text-center"">" + arrSalNemegdelName[i] + "</th>";
                        }
                    }
                    strContent += @"<th class=""text-center"">Бүгд дүн</th>";
                    for (int i = 0; i < arrSalSuutgalSum.Length; i++)
                    {
                        if (arrSalSuutgalSum[i] > 0)
                        {
                            strContent += @"<th class=""text-center"">" + arrSalSuutgalName[i] + "</th>";
                        }
                    }
                    strContent += @"<th class=""text-center"">Суутгалын дүн</th>
</tr>";
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        strContent += @"<tr>
<td class=""text-center"">" + dr["MONTH_VALUE"].ToString() + @"</td>
<td class=""text-center"">" + dr["WORK_DAY"].ToString() + @"</td>
<td class=""text-right"">" + Convert.ToDouble(dr["TSALIN"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + @"</td>
<td class=""text-right"">" + Convert.ToDouble(dr["BUILD_TSALIN"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + @"</td>";
                        for (int i = 0; i < arrSalNemegdelSum.Length; i++)
                        {
                            if (arrSalNemegdelSum[i] > 0)
                            {
                                strContent += @"<td class=""text-right"">" + Convert.ToDouble(dr[arrSalNemegdel[i]].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + "</td>";
                            }
                        }
                        strContent += @"<td class=""text-right"">" + Convert.ToDouble(dr["SUM_TSALIN"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + @"</td>";
                        for (int i = 0; i < arrSalSuutgalSum.Length; i++)
                        {
                            if (arrSalSuutgalSum[i] > 0)
                            {
                                strContent += @"<td class=""text-right"">" + Convert.ToDouble(dr[arrSalSuutgal[i]].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + "</td>";
                            }
                        }
                        strContent += @"<td class=""text-right"">" + Convert.ToDouble(dr["FIRST_LESS"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + @"</td>";
                        strContent += @"<td class=""text-right"">" + Convert.ToDouble(dr["SUB_TSALIN"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + @"</td>";
                        strContent += @"<td class=""text-right"">" + Convert.ToDouble(dr["END_TSALIN"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + @"</td>";
                        strContent += @"<td class=""text-right"">" + Convert.ToDouble(dr["LESS_TSALIN"].ToString()).ToString("C", CultureInfo.CurrentCulture).ToString().Replace("$", "") + @"</td>";
                        strContent += @"</tr>";
                    }
                    divTableData.InnerHtml = strContent;
                }
                else divTableData.InnerHtml = " <h5>"+ currYear.ToString() + " оны цалингийн картын мэдээлэл олдсонгүй.</h5>";
                spanStaffInfo.InnerHtml = userData.USR_GAZARINITNAME + "-ын " + userData.USR_POSNAME + " " + userData.USR_LNAME.Substring(0, 1) + "." + userData.USR_FNAME;
            }
            catch (cs.HRMISException ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                divContentInfo.Attributes.Add("class", "row");
                divContentContent.Attributes.Add("class", "well hide");
            }
            catch (Exception ex)
            {
                myObjGetTableData.exeptionMethod(ex);
                divContentInfo.Attributes.Add("class", "row");
                divContentContent.Attributes.Add("class", "well hide");
            }
        }
    }
}