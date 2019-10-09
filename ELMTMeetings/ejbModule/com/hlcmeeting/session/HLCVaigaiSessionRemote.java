/*******************************************************************************
 * * * Copyright: 2019 digiBlitz Foundation
 *  * * 
 *  * * License: digiBlitz Public License 1.0 (DPL) 
 *  * * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 *  * * 
 *  * * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 *  * * 
 *  * * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 *  * * 
 *  * * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.hlcmeeting.session;

import com.hlcmeeting.util.HLCAdditionalTcktVO;
import com.hlcmeeting.util.HLCAnnualRegisterVO;
import com.hlcmeeting.util.HLCAnnualRegistrationDetailVO;
import com.hlcmeeting.util.HLCCompResultVO;
import com.hlcmeeting.util.HLCEventCompQualDetVO;
import com.hlcmeeting.util.HLCEventRegPendingVO;
import com.hlcmeeting.util.HLCInstructorDetails;
import com.hlcmeeting.util.HLCInstructorPriceMaster;
import com.hlcmeeting.util.HLCMapHorseRegVO;
import com.hlcmeeting.util.HLCMeeAnnualDetails;
import com.hlcmeeting.util.HLCMeeAnnualRegistrationDetails;
import com.hlcmeeting.util.HLCMeeICPUserDetails;
import com.hlcmeeting.util.HLCPaymentDetails;
import javax.ejb.EJBObject;
import javax.ejb.FinderException;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.*;
import java.util.ArrayList;
import com.hlccommon.util.HLCPaymentDetailVO;

/**
 * This is the remote interface for VaigaiSession enterprise bean.
 */
public interface HLCVaigaiSessionRemote extends EJBObject, HLCVaigaiSessionRemoteBusiness {
    /*==============================ANNUAL MEETINGS METHODS==========================*/
    //1.method to show specification type based on activity type in the form (Registration & Activity)
    public Vector displaySpecification(String activityId) throws RemoteException;

    public Vector displaySpecification1() throws RemoteException;

    public int selectAnnualRegCount(String requestStatus) throws RemoteException;

    //2.method to pull price (due_date_price & aft_due_date_price) based on specification id & user type id in the form.
    public String[] getDueOrAfterDatePriceForAnnual(Date currentDate, String specificationId, String userTypeId) throws RemoteException, FinderException;

    public String getDueOrAfterDatePrice(Date currentDate, String specificationId, String userTypeId) throws RemoteException, FinderException;
    //3.method to pull only due_date_price for only Activity type related specifications (i.e per ticket price)
    public String[] getDueDatePrice(String specificationId, String userTypeId) throws RemoteException, FinderException;

    //4.method to insert the Annual Meeting details of Annual Meeting Registartion form
    public boolean addMeetingDetails(HLCMeeAnnualDetails objAnnaulDetails, HLCPaymentDetails objPayment) throws RemoteException;

    //5.have method to insert price details to Annual Registration Details table (meeting_id is the foreign key from AnnualDetails table)
    public boolean addAnnualRegistrationDetails(HLCMeeAnnualRegistrationDetails objAnnualReg) throws RemoteException;

    //6.method to list the details of all applications � for Admin (based on status)
    public Vector displayAnnualDetailBasedOnStatus(String status) throws RemoteException;

    //7.method to view the details of one application and update the status.
    public Vector displayAnnaulApplicationDetail(String annualMeetingId) throws RemoteException;

    public Vector displayAnnaulSpecificationDetail(String annualMeeId) throws RemoteException;

    public boolean editMetingDetails(HLCMeeAnnualDetails objAnnaulDetails, HLCMeeAnnualRegistrationDetails objAnnualReg) throws RemoteException, FinderException;

    //8.method to list the details of all applications � for User (based on User_id)
    public Vector displayAnnualDetailBasedOnUserID(String userId) throws RemoteException;

//******//9.method to view the details of one application � for User based on annual_meeting_id
    //Use same mothod as No.7 for user too..
    //10.method to update the date of Annual Meeting for Admin based on event_registration_type_id. (Table - tblMeeEventRegistrationTypeMaster)
    public boolean updateEventRegistrationTypeMaster(String eventRegistrationTypeId, String eventRegistrationTypeName, String registrationDate, String meetingDate, int noOfDays) throws RemoteException;

    //11.method to insert price details to (tblMeeAnnualPriceDetails). While inserting
    //   you should check whether entry is existing for same specification_id and user_type_id.
    //   If existing � don�t insert. If not insert.
    public boolean addPriceDetail(String specificationId, String userTypeId, String eventRegistrationTypeId,
            double dueDatePrice, double aftDueDatePrice) throws RemoteException;

    //12.method to update only the price based on specification_id & user_type_id.
    public boolean updatePriceDetail(String priceId,
            double dueDatePrice, double aftDueDatePrice) throws RemoteException;
    //13. Method to display the no of days, registration date and meeting date..
    public Vector dispAnnualMeeForNoOfDays(String annualMeeName) throws RemoteException;
    //14. Method will result activity_type_id, specification_id and specification_name based on Registration and Activity
    public Vector displayActivityTypeRegister() throws RemoteException;

    public Vector displayActivityTypeActivity() throws RemoteException;
    //15. Update the status and comments
    public boolean updateStatusForAnnualConReg(String meeting_id, String status, String comments) throws RemoteException;

    public Vector displayActivityCategory() throws RemoteException;

    //public Vector displayMembershipType() throws RemoteException;

    public Vector displayUserType() throws RemoteException;
    public Vector displayUseaArea() throws RemoteException;

    public Vector displayEventRegistrationTypeMaster() throws RemoteException;

    public Collection getPriceId(String memberId) throws RemoteException, FinderException;
    //public Collection getUserId(String memberId) throws RemoteException, FinderException;
    public Collection getUserDetails(String userId) throws RemoteException, FinderException;

    public Collection getMeetingDetails(String meetingId) throws RemoteException, FinderException;

    public boolean deleteMeetingDetails(String meetingId) throws RemoteException, FinderException;

    /*=========================ICP DETAILS METHODS==================================*/
    //1.method to insert the details of ICP Registartion form for Organizer.
    public boolean addInstructorDetails(HLCInstructorDetails objInstDetail, HLCPaymentDetails objPayment) throws RemoteException;

    //1.1 Method to generate Unique ID for PaymentId
    public String getPaymtId() throws RemoteException;

    //2.method to list all application based on Instructor ID.
    public Vector displayICPRegBasedOnInstructorId(String instructorId) throws RemoteException;

    //2.1. Method to list all application for the admin based on the status
    public Vector displayICPRegBasedOnStatus(String status) throws RemoteException;

    //3.method to view the application details based on Meeting ID � for Organizer.
    public Vector displayICPRegBasedOnMeetingId(String icpMeetingId) throws RemoteException;

    //4.method to list applications based on Status for Admin
    public Vector displayICPRegistrationForm(String status) throws RemoteException;

    //5.method to view the details of one application based on meeting ID � for Admin and update the status, comments , approved by & approved date.
    public boolean editStatusICPRequest(String meetingId, String status, String appBy, String comments) throws RemoteException, FinderException;

    //6.method to modify the entire application details for Organizer � if the application is Rejected by Admin.
    //While Updating the record the status should get updated to Pending again.
    public boolean editInstructorDetails(HLCInstructorDetails objInstDetail) throws RemoteException, FinderException;

    //7.method to insert the details of ICP User Registartion form for Normal User.
    public boolean addICPUserDetails(HLCMeeICPUserDetails objICPUser) throws RemoteException;

    //8.method to list all application based on User ID.
    public Vector displayUserList(String userId) throws RemoteException;

    //9.method to view the application details based on release_id � for Normal User.
    public Vector displayUserBasedOnReleaseId(String releaseId) throws RemoteException;

    //10.method to list User applications based on Status for Organizer.
    public Vector displayUserListBasedOnStatus(String status) throws RemoteException;

    //11.method to view the details of one application based on release_id  � for Organizer and update the status.
    public boolean editICPUserStatus(HLCMeeICPUserDetails objICPUser) throws RemoteException, FinderException;

    public boolean addInstructorPriceMaster(HLCInstructorPriceMaster objInstPriceMas) throws RemoteException;

    public Collection getICPMeetingDetails(String icpMeetingId) throws RemoteException, FinderException;

    public boolean editICPRequestStatus(HLCInstructorDetails objInstructorDetails) throws RemoteException, FinderException;

    // public boolean editMetingDetails(HLCMeeAnnualDetails objAnnaulDetails, HLCMeeAnnualRegistrationDetails objAnnualReg) throws RemoteException, FinderException;
    /*===============ICP User Details=============================================*/
    public Vector displayUserDETAIL(String email) throws RemoteException;

    public Vector displayUserDETAILBasedOnMemberId(String memberId) throws RemoteException;

    /*=====================Price Detail Master table //suresh here ==============================*/
    public ArrayList displayPriceDetails(String eventTypeId, String specificationId) throws RemoteException;

    public String[] displayPriceDetailsById(String priceId) throws RemoteException;

    public boolean editPriceDetail(String priceId,
            String specificationId, String userTypeId, String eventRegistrationTypeId,
            double dueDatePrice, double aftDueDatePrice) throws RemoteException;

    public boolean createTicketDetails(String availTkt, String meetingTypeId) throws RemoteException;

    public boolean updateTicketDetails(String annualTktId, String availTkt) throws RemoteException;

    public String[] getTicketDetails(String annualTktId) throws RemoteException;

    public ArrayList getAllTicketDetails() throws RemoteException;

    public ArrayList getAllSpecification() throws RemoteException;

    //Suresh Here Annual Convention Meeting
    public ArrayList getAllAnnualDetails(String requestStatus) throws RemoteException;

    public ArrayList getAnnualDetailsByMeetingId(String annualMeetingId) throws RemoteException;

    public ArrayList getAnnualDetailsByUserId(String userId) throws RemoteException;

    public ArrayList getMyAnnualDetails(String userId) throws RemoteException;

    public String registerAnnualMeeting(String registrarDetails[], Enumeration userVOList, String paymentId,
            String addTktUserId, ArrayList addTktList) throws RemoteException;

    public ArrayList getAnnualPriceDetailsByAnnualId(String ardId) throws RemoteException;

    public HLCAnnualRegistrationDetailVO getAnnualRegistrationDetails(String ardId) throws RemoteException;

    public boolean updateAnnualStatus(String annualMeetingId, String requestStatus, String comments) throws RemoteException;

    public String getNextId() throws RemoteException;

    public HLCPaymentDetailVO getPaymentDetails(String paymentId, String userId) throws RemoteException;

    public HLCAnnualRegisterVO getAnnualRequestStatus(String annualMeetingId) throws RemoteException;

    public boolean updatePaymentStatus(String paymentId, String userId, String sslResult, String sslResultMessage,
            String sslTxnId, String sslApprovalCode, String sslCvv2Response, String sslAvsResponse,
            String sslTransactionType, String sslInvoiceNo, String sslEmail, boolean activeStatus) throws RemoteException;
    // Hari here
    public ArrayList getAnnualPendingDetails(String registrar_id) throws RemoteException;

    public ArrayList getAnnualPendingListDetails(String registrar_id, String payment_id, String meetingId) throws RemoteException;

    public ArrayList getAnnualMeetingDetails(String registrar_id, String payment_id) throws RemoteException;

    public String registerAdditionalTickets(HLCAdditionalTcktVO tcktVO) throws RemoteException;
    //public ArrayList getPriceIdOnSpecificationId(String sepcification_Id,String mem_type_id) throws RemoteException;
    // End here
    public String[] gettMerchantDetails() throws RemoteException;

    public boolean updateMerchantDetails(String merchantId, String merchantLoginId, String merchantUserId, String merchantPin) throws RemoteException;

    public String getMeetingId(String paymentId) throws RemoteException;

    public ArrayList getAllAnnualDetailsForAdmin(String requestStatus) throws RemoteException;

    public ArrayList getAllAnnualDetailsForAdminByRequestId(String requestStatus, int pNo) throws RemoteException;

    public boolean updateRequestStatus(String ardId, String requestStatus, String comments) throws RemoteException;

    public String insertCompResultUploadDetails(String event_id, String event_name, String result_file_path, String eventTypeId) throws RemoteException;

    public ArrayList listCompResultUploadDetails() throws RemoteException;

    public ArrayList listCompResultUploadDetailsOnYear(String year) throws RemoteException;

    public ArrayList getCompResultMappingTableDetails(String upload_id) throws RemoteException;

    public boolean insertCompMapData(HLCCompResultVO HLCCompResultVO) throws RemoteException;

    public boolean changeEventMapStatus(String uploadId) throws RemoteException;

    public boolean deleteCompResultFileDetails(String uploadId) throws RemoteException;

    public boolean deleteCompResultMappedDatas(String uploadId) throws RemoteException;

    public boolean deleteCompRegMappedDatas(String regUploadId) throws RemoteException;

    public String createHorseRegUploadDetails(String event_id, String eventTypeId, String registration_file_path) throws RemoteException;

    public ArrayList getUploadHorseRegDetails() throws RemoteException;

    public ArrayList getEventTypeDetails() throws RemoteException;

    public ArrayList getHorseRegMappingTableDetails() throws RemoteException;

    public boolean createHorseRegMapData(HLCMapHorseRegVO compRegVO) throws RemoteException;

    public boolean changeMapStatus(String regUploadId) throws RemoteException;

    public ArrayList getExceptionReport(String uploadId) throws RemoteException;

    public ArrayList getHorseRelation(String horseName) throws RemoteException;

    public boolean validateHorseCompReg(ArrayList valHrList) throws RemoteException;

    public boolean deleteCompRegFileDetails(String regUploadId) throws RemoteException;

    public boolean insertEventCompQualDetails(HLCEventCompQualDetVO CompQualDetail) throws RemoteException;

    public boolean updateValidationStatus(String regUploadId) throws RemoteException;

    public boolean insertCompResultDetailsByQuery(String query) throws RemoteException;

    public ArrayList getExceptionReportForResult(String uploadId) throws RemoteException;

    public boolean insertValidHorseCompResult(HLCCompResultVO compResVO) throws RemoteException;

    public boolean insertInvalidHorseCompResult(HLCCompResultVO compResVO) throws RemoteException;

    public boolean updateResultValidationStatus(String uploadId) throws RemoteException;

    public String getEventTitle(String uploadId, String eventId) throws RemoteException;

    public boolean updateCompResultEventDet(String uploadId) throws RemoteException;

    /********************************************CRUD Operation for Specification Master**************************************************/
    public ArrayList displayAllSpecificationDetails(boolean activeStatus) throws RemoteException;

    public ArrayList displaySingleSpecDetail(String specId) throws RemoteException;

    public boolean addAnnualSpecificationDetails(String activityTypeId, String SpecName, String SpecDescription) throws RemoteException;

    public Vector displayAnnualActivityTypeMaster() throws RemoteException;

    public boolean editSpecDetail(String specificationId, String activityId, String specName, String specDesc) throws RemoteException;

    public boolean deleteSpecDetail(String specId) throws RemoteException;

    public boolean activateSpecDetail(String specId) throws RemoteException;

    public boolean isSpecNameExist(String activityTypeId, String specName) throws RemoteException;

    public boolean isEditSpecNameExist(String specId, String activityTypeId, String specName) throws RemoteException;

    /**************************************************************************************************************************************/
    //Provisional Calander Entry
    // public boolean insertProvisionalCalDetails() throws RemoteException;
    /***************************************************Event RegistrationPriceCRUD********************************************************************************/
    public ArrayList getAllPriceTypes() throws RemoteException;

    public ArrayList getAllSeasons() throws RemoteException;

    public boolean isEventRegPriceExist(String priceTypeId, String seasonId) throws RemoteException;

    public boolean insertEventRegPriceDetails(String priceTypeId, String seasonId, float duePrice, float afterPrice) throws RemoteException;

    public ArrayList getAllPriceDetails(String priceTypeId) throws RemoteException;

    public ArrayList getSinglePriceDetails(String priceId) throws RemoteException;

    public boolean updateEventRegPriceDetails(String priceId, String priceTypeId, String seasonId, float duePrice, float afterPrice) throws RemoteException;

    public ArrayList getEventRegDateDetails(String seasonId, int year) throws RemoteException;

    public boolean insertEventRegDateDetails(String regDateId, String seasonId, Date dueDate, Date graceDate, int year) throws RemoteException;

    /**************************************************************************************************************************************************************/
    /********************************************Event Registration pending Payment**********/
    public ArrayList getEventRegPayPendingDets(String usrId) throws RemoteException;

    public HLCEventRegPendingVO getSingleEventRegPendingDetails(String eventId) throws RemoteException;

    public boolean updatePendingPayment(HLCPaymentDetails objPayDet) throws RemoteException;

    public boolean deleteCompRegDetails(String regUploadId) throws RemoteException;

    public boolean deleteCompResultDetails(String uploadId) throws RemoteException;

    public String[] getEventIds(String eventTypeName, String eventLevelName, String eventDivName) throws RemoteException;

    //*******************************************Competition Result Upload Starter Count********************************************
    public ArrayList getCompResultStarterCount(String eventId, String uploadId) throws RemoteException;

    public ArrayList getCompResultTempResIds(String eventId, String mergDiv, String uploadId) throws RemoteException;

    public String getCompResultGroupId(String eventId, ArrayList eveTempDets, String StarterCnt, String eveDivId, String eveSubDiv, String eveTypeId, String uploadId, String eventLevelId) throws RemoteException;

    public boolean updateCompResultGrpDets(String eventId, String resId, String groupId) throws RemoteException;

    public String getEventDivisionId(String eventDivisionName) throws RemoteException;

    public boolean deleteGroupResultDetails(String uploadId) throws RemoteException;

    public String getEventLevelId(String eventLeveName) throws RemoteException;
    public String getAnnualRegistraterId(String annualMeetingId) throws RemoteException;
    
}