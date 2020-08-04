using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using static HRWebApp.cs.CMain;

namespace HRWebApp.webservice
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IServiceMain" in both code and config file together.
    [ServiceContract]
    public interface IServiceMain
    {
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GazarListForDDL();
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string HeltesListForDDL(string gazarId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffListForDDL(string gazarId, string heltesId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string OracleExecuteScalar(string qry);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void OracleExecuteNonQuery(string qry);

        //*****property.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PropertyTab1Datatable(string staffid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PropertyTab1PropertyTypeListForDDL();
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PropertyTab1UnitListForDDL();
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void PROPERTYUSE_INSERT(string P_RECEIVEDDT, string P_CODE, string P_PROPERTYTYPELIST_ID, string P_UNITLIST_ID, string P_UNITPRICE, string P_DESCRIPTION, string P_STAFFS_ID, string P_MOD_STAFFS_ID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void PROPERTYUSE_UPDATE(string P_PROPERTYLIST_ID, string P_RECEIVEDDT, string P_CODE, string P_PROPERTYTYPELIST_ID, string P_UNITLIST_ID, string P_UNITPRICE, string P_DESCRIPTION, string P_STAFFS_ID, string P_MOD_STAFFS_ID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string PropertyTab2Datatable();

        //*****srv.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SrvTab1Datatable(string tp, string staffid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SrvTab1AnswerList(string questionid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffListForSelect2(string selectedList);

        //*****amralt.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string AmraltTab2t1Datatable(string yr, string gazarid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string AmraltTab1GetAmraltDays(string yr, string staffid);

        //*****staffsdataadd.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffsdataaddTab1Datatable(string fromdate, string todate, string decision, string type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void SHAGNAL_INSERT(string P_NAME, string P_DT, string P_SHAGNALTYPE_ID, string P_SHAGNALDECISION_ID, string P_ORGDESCRIPTION, string P_PRICE, string P_GROUND, string P_TUSHAALNO, string P_TUSHAALDT, string P_FILENAME, string P_STAFFLIST, string P_STAFFID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void SHAGNAL_UPDATE(string P_ID, string P_NAME, string P_DT, string P_SHAGNALTYPE_ID, string P_SHAGNALDECISION_ID, string P_ORGDESCRIPTION, string P_PRICE, string P_GROUND, string P_TUSHAALNO, string P_TUSHAALDT, string P_FILENAME, string P_STAFFLIST, string P_STAFFID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void SHAGNAL_DELETE(string P_ID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffsdataaddTab2Datatable(string fromdate, string todate, string posdegreedtl, string rankposdegree);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void ZEREGDEV_INSERT(string P_POSDEGREEDTL_ID, string P_RANKPOSDEGREE_ID, string P_DECISIONDESC, string P_DT, string P_CERTIFICATENO, string P_UPPER, string P_FILENAME, string P_STAFFLIST, string P_STAFFID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void ZEREGDEV_UPDATE(string P_ID, string P_POSDEGREEDTL_ID, string P_RANKPOSDEGREE_ID, string P_DECISIONDESC, string P_DT, string P_CERTIFICATENO, string P_UPPER, string P_FILENAME, string P_STAFFLIST, string P_STAFFID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        void ZEREGDEV_DELETE(string P_ID);

        //*****tomilolt.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string tomiloltTab1ModalSelectstafflistForSelect2(string selectedList);

        //*****profile.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ProfileTab1t9t1Datatable(string staffid);

        //*****workingtime.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string WorkingtimeTab2Datatable(string yr, string month, string month2, string gazar, string heltes, string stid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string WorkingtimeTab3Datatable(string yr, string month, string month2, string gazar, string heltes, string stid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string WorkingtimeTab3Desc(string year, string month, string month2, string stid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string WorkingtimeTab4Datatable(string yr, string month);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string WorkingtimeTab4t2Datatable(string yr, string month, string month2, string gazar, string heltes, string stid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string WorkingtimeTab4t3Datatable(string yr);

        //*****rprt1.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string Rprt1Tab1Datatable(string gazar, string heltes, string stid);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffHousCondTab1Table(List<string> branch, List<string> condition);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffAgeGrpTab1Table(List<string> branch, List<string> type, List<string> ages);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtMonitorFillDataTab1Table(List<string> branch, List<string> type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffMoveTab1Table(List<string> branch, List<string> type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffMoveTab2Table(List<string> branch, List<string> type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffEducationTab1Table(List<string> branch, List<string> edutype, List<string> occtype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffRewardMofTab1Table(List<string> branch, List<string> shagnaltype, List<string> shagnaldescision, string begindate, string enddate);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffAttendanceTab1Table(List<string> branch, string year, string month);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ListStaffsWithPos(List<string> branch, string set1stIndexValue = null);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffAttendanceTab2Table(List<string> branch, List<string> staff, string year, string monthbegin, string monthend);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffAttendanceTab3Table(string staff, string year, string monthbegin, string monthend);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffWorkedYearTab1Table(List<string> branch, List<string> type, List<string> ages);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtTomiloltForeignTab1Table(string type, List<string> direction, List<string> budget, string begindate, string enddate);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtTomiloltForeignTab2Table(string type, List<string> direction, List<string> budget, string begindate, string enddate, List<string> branch, List<string> isreport);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtAmraltTab1Table(string year, List<string> branch, List<string> isbody);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtChuluuTimeTab1Table(string year, List<string> branch, List<string> reason, List<string> issalary);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtChuluuDayT2Tab1Table(string year, List<string> branch, List<string> reason, List<string> issalary);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtChuluuDayF3Tab1Table(string year, List<string> branch, List<string> reason, List<string> issalary);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtChuluuSickTab1Table(string year, List<string> branch, List<string> type);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtInventoryListWithQRCode(List<string> accounttype);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtInventoryListStaff(string staffid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtInventoryCountedData(string intervalid);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtStaffSalaryData(string pYear, string pStaffId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtInventoryCountTab2Table(List<string> pBranch, List<string> pStaff, string pInterval);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string RprtInventoryCountTab3Table(List<string> pBranch, List<string> pStaff, string pInterval);

        ////*****salarysettings.aspx*****//
        //[OperationContract]
        //[WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        //string SalarysettingsTab1Table(string rankpostype);
        //[OperationContract]
        //[WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        //string SalarysettingsTab2Table(string coltype);
        //[OperationContract]
        //[WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        //string SalarysettingsSaveBasicSalary(List<RankBasicSalary> pRankList);
        //[OperationContract]
        //[WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        //string SaveSalaryCol(string pId, string pColType, string pColName, string pCalculate, string pName, string pIsActive);
        //[OperationContract]
        //[WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        //string DeleteSalaryCol(string pId);

        //*****inventory.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InventoryIntervalTab1Table(string isactive);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveInventoryIntervalData(string pId, string pName, string pIsActive);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteInventoryIntervalData(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetStaffListWithBranchPos(List<string> branch);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetInventoryData(string invid, string price);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveInventoryCountData(string pInvIntervalId, string pStaffsId, string pInvId, string pInvCode, string pInvName, string pInvUnit, string pInvPrice, string pFromUserId, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetCountedInventoryCount(string pInvIntervalId, string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string IsMyInv(string pStaffId, string pPrice, string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InventoryStaffCntTab1Table(string pIntervalId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveInventiryCntStaffDesc(string pId, string pIntervalId, string pStaffId, string pInvId, string pInvPrice, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetBranchList(string pFirstIndexName);

        //*****login.aspx*****//
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string CheckLogin(string pUsername, string pPass);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveStaff(string P_ID, string P_NATIONALITY, string P_MNAME, string P_LNAME, string P_FNAME, string P_BDATE, string P_BDIST_ID, string P_BCITY_ID, string P_NAT_ID, string P_EDUTP_ID, string P_SOCPOS_ID, string P_OCCTYPE_ID, string P_OCCNAME, string P_GENDER, string P_REGNO, string P_CITNO, string P_SOCNO, string P_HEALNO, string P_ADDRCITY_ID, string P_ADDRDIST_ID, string P_ADDRESSNAME, string P_TEL, string P_TEL2, string P_EMAIL, string P_IMAGE, string P_DT, string P_BRANCH_ID, string P_POSTYPE_ID, string P_POS_ID, string P_RANK_ID, string P_TUSHAALDATE, string P_TUSHAALNO, string P_MOVE_ID, string P_DESCRIPTION, string P_STAFFID, string P_DOMAIN_USER, string P_RELNAME, string P_RELATION_ID, string P_RELADDRESSNAME, string P_RELTEL, string P_RELTEL2, string P_RELEMAIL, string P_FINGERID);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string ListMove(List<string> tp, string set1stIndexValue = null);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string StaffsTable(string pos, string gazar, string heltes, string tp);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab1T10Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab1T10Datatable1(string pId, string pStaffsId, string pCertificateNo, string pSituation, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab1T10Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab1T11Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab1T11Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab1T11Datatable1(string pId, string pStaffsId, string pDt, string pName, string pOrgdescription, string TushaalNo, string TushaalDt, string pGround);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab1T12Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab1T12Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab1T12Datatable1(string pId, string pStaffsId, string pName, string pTypeId, string pDt, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab3T2Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab3T2Datatable1(string pId, string pTbl, string pTushaalName, string pChangedTushaalDate, string pChangedTushaalNo, string pChangedTushaalName, string pChangedReason);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab3T3Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab3T3Datatable1(string pId, string pStaffsId, string pTbl, string pRankPosDegree, string pRank, string pPosDegreeDtl, string pTsolName, string pDecisionDate, string pCertificateNo, string pUnemlehNo);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab3T3Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab3T5Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab3T5Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab3T5Datatable1(string pId, string pStaffsId, string pDt, string pName, string pAmt, string pTushaalName, string pTushaalNo, string pTushaalDt, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab3T6Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab3T6Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab3T6Datatable1(string pId, string pStaffsId, string pDt, string pName, string pAmt, string pTushaalName, string pTushaalNo, string pTushaalDt, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab3T7Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab3T7Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab3T7Datatable1(string pId, string pStaffsId, string pOrgName, string pPunishedPersonName, string pTushaalName, string pTushaalNo, string pTushaalDt, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab3T8Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab3T8Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab3T8Datatable1(string pId, string pStaffsId, string pContentName, string pUpdatedDt1, string pUpdatedPersonName, string pUpdatedDt2, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string profileTab3T4Datatable1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProfileTab3T4Datatable1(string pId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string SaveProfileTab3T4Datatable1(string pId, string pStaffsId, string pYr, string pD1, string pD2, string pD3, string pD4, string pD5, string pD6, string pDesc);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_1(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_2(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_3(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_4(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_5(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_6(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_7(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket1_8(string pStaffsId);
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string GetPerFilledAnket2_0(string pStaffsId);
    }
}
