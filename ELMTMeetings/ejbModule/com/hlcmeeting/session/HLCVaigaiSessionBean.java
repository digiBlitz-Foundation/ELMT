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

import com.hlcICP.user.reg.HLCMullaiyarDamICPUserLocal;
import com.hlcICP.user.reg.HLCMullaiyarDamICPUserLocalHome;
import com.hlcmee.ann.HLCAnnualMeetingDAO;
import com.hlcmeeting.ICP.HLCMullaiyarDamICPEntityLocal;
import com.hlcmeeting.ICP.HLCMullaiyarDamICPEntityLocalHome;
import com.hlcmeeting.HLCmullaiyarDamEntityLocal;
import com.hlcmeeting.HLCmullaiyarDamEntityLocalHome;
import com.hlcmeeting.util.HLCAdditionalTcktVO;
import com.hlcmeeting.util.HLCAnnualRegisterVO;
import com.hlcmeeting.util.HLCAnnualRegistrationDetailVO;
import com.hlcmeeting.util.HLCAnnualUserVO;
import com.hlcmeeting.util.HLCCompResultVO;
import com.hlcmeeting.util.HLCCompetitionResultsDAO;
import com.hlcmeeting.util.DBHelper;
import com.hlcmeeting.util.Debug;
import com.hlcmeeting.util.HLCEventCompQualDetVO;
import com.hlcmeeting.util.HLCEventRegPendingVO;
import com.hlcmeeting.util.HLCEventRegistrationTypeDAO;
import com.hlcmeeting.util.HLCICPUserDAO;
import com.hlcmeeting.util.HLCInstructorDetailDAO;
import com.hlcmeeting.util.HLCInstructorDetails;
import com.hlcmeeting.util.HLCInstructorPriceMaster;
import com.hlcmeeting.util.HLCMapHorseRegVO;
import com.hlcmeeting.util.HLCMeeAnnualDetails;
import com.hlcmeeting.util.HLCMeeAnnualRegistrationDetails;
import com.hlcmeeting.util.HLCMeeICPUserDetails;
import com.hlcmeeting.util.HLCPaymentDetails;
import java.text.SimpleDateFormat;
import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.hlcmeeting.util.HLCPriceDetailDAO;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.HLCValidateCompRegVO;
import com.hlccommon.util.HLCCompRegVO;
import com.hlcmeeting.DAO.HLCValidateDAO;

/**
 * This is the bean class for the VaigaiSessionBean enterprise bean.
 * Created Aug 31, 2006 9:13:12 AM
 * @author harmohan
 */

public class HLCVaigaiSessionBean implements SessionBean, HLCVaigaiSessionRemoteBusiness {
    private SessionContext context;
    private InitialContext ic = null;
    private static final String dbName = "java:/ELMTMSSQLDS";
    private Connection con;
    ResultSet rs= null;
    PreparedStatement prepStmt = null;
    HLCmullaiyarDamEntityLocalHome home;
    HLCmullaiyarDamEntityLocal remote;
    
    HLCMullaiyarDamICPEntityLocalHome homeICP;
    HLCMullaiyarDamICPEntityLocal remoteICP;
    
    HLCMullaiyarDamICPUserLocalHome homeICPUser;
    HLCMullaiyarDamICPUserLocal remoteICPUser;
    
    private String userId;
    private String meetingId;
    private String icpMeetingId;
    String name = "ejb/HLCMullaiyarDamJNDI";
    
    /*======================Instructor Details=============================*/
    private String noOfdays;
    private String assesmentLevel;
    private String assesmentDate;
    private String useaAreaId;
    private String areaName;
    private String location;
    private String instructorId;
    private String hostMemberId;
    private String shippingTypeId;
    private String assessor;
    private String facilities;
    private String landOwnerName;
    private String landOwnerBusinessName;
    private String landOwnerFax;
    private String landOwnerEmail;
    private String landOwnerAddress;
    private String landOwnerCity;
    private String landOwnerState;
    private String landOwnerZip;
    private String landOwnerPhone;
    private String addDate;
    private String approvedBy;
    private String approvedDate;
    private String postingType;
    private String requestStatus;
    private String landOwnerCountry;
    private String areaId;
    private String areaCode;
    private String comments;
    
    
    private String icpMeetingName;
    private String membershipStatus;
    private String memberId;
    private String emailId;
    private String releaseId;
    
    private String firstame;
    private String lastName;
    
    private String address;
    private String country;
    private String state;
    private String city;
    private String zip;
    private String phoneNo;
    private String faxNo;
    
    private String annualMeetingId;
    private String badgeInfo;
    private String totalAmount;
    private String firstName;
    private String suite;
    private String address1;
    private String address2;
    private String mobileNo;
    
    private String noOfTickets;
    private String dueDatePrice;
    private String accomodationDetails;
    private String specificationId;
    private String userTypeId;
    
    /*------------------------Payment Details-----------------*/
    private String paymentId;
    private String ccName;
    private String ccType;
    private String ccNumber;
    private String ccExpMonth;
    private String ccExpYear;
    private String ccCvvid;
    private String bankName;
    private String CheckDate;
    private String checkNumber;
    private String checkName;
    private String amount;
    private String paymentDate;
    private String paymentStatus;
    private String sslResult;
    private String sslResultMessage;
    private String sslTxnId;
    private String sslApprovedCode;
    private String sslCvv2Response;
    private String sslAvsResponse;
    private String sslTransactionType;
    private String sslInvoiceNo;
    private String sslEmail;
    
    
    // <editor-fold defaultstate="collapsed" desc="EJB infrastructure methods. Click the + sign on the left to edit the code.">
    // TODO Add code to acquire and use other enterprise resources (DataSource, JMS, enterprise bean, Web services)
    // TODO Add business methods or web service operations
    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext aContext) {
        context = aContext;
    }
    
    /**
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() {
        
    }
    
    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() {
        
    }
    
    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() {
        
    }
    // </editor-fold>
    
    /**
     * See section 7.10.3 of the EJB 2.0 specification
     * See section 7.11.3 of the EJB 2.1 specification
     */
    public void ejbCreate() {
        try{
            InitialContext jndiContext = getInitialContext();
            Object obj = jndiContext.lookup(name);
            home = (HLCmullaiyarDamEntityLocalHome)obj;
            
            Object obj1 = jndiContext.lookup("ejb/HLCMullaiyarDamICPJNDI");
            homeICP = (HLCMullaiyarDamICPEntityLocalHome)obj1;
            
            Object obj2 = jndiContext.lookup("ejb/HLCMullaiyarDamICPUserJNDI");
            homeICPUser = (HLCMullaiyarDamICPUserLocalHome)obj2;
            
            
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    /**======================Method Related to mullaiyarDamEntityBean==================*/
    /**
     * Name         :getPriceId
     * Description  :This method will retrieve the member details for refund details table
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Collection getPriceId(String memberId) throws RemoteException, FinderException {
        Collection c = home.findByUserTypeId(memberId);
        return c;
    }
    
    //public Vector displayActivityTypeActivity() throws RemoteException;
    /**
     * Name         :displayActivityTypeActivity
     * Description  :This method will list the Activity details
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector displayActivityTypeActivity() throws RemoteException {
        Vector vObj = new Vector();
        HLCICPUserDAO objDAO = new HLCICPUserDAO();
        try {
            vObj = objDAO.listActivityTypeActivity();
        }catch(Exception e){
            Debug.print("Error While getting Activity list : "+e.getMessage());
        }
        return vObj;
    }
    
    
    /**
     * Name         :displayActivityTypeRegister
     * Description  :This method will list the Activity details
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector displayActivityTypeRegister() throws RemoteException {
        Vector vObj = new Vector();
        HLCICPUserDAO objDAO = new HLCICPUserDAO();
        try {
            vObj = objDAO.listActivityTypeRegister();
        }catch(Exception e){
            Debug.print("Error While getting Activity list : "+e.getMessage());
        }
        return vObj;
    }
    
    
    /**
     * Name         :displayActivityCategory
     * Description  :This method will list the Activity details
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector displayActivityCategory() throws RemoteException {
        Vector vObj = new Vector();
        HLCICPUserDAO objDAO = new HLCICPUserDAO();
        try {
            vObj = objDAO.listActivityCategory();
        }catch(Exception e){
            Debug.print("Error While getting Activity list : "+e.getMessage());
        }
        return vObj;
    }
    public Vector displayUseaArea() throws RemoteException {
        Vector vObj = new Vector();
        try {
            makeConnection();
            String selecStmt = "SELECT area_id,area_code,area_name FROM "+DBHelper.USEA_AREA_MASTER;
            prepStmt = con.prepareStatement(selecStmt);
            //prepStmt.setString(1,status);
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                this.areaId = rs.getString(1);
                this.areaCode = rs.getString(2);
                this.areaName = rs.getString(3);
                String [] area = {areaId,areaCode,areaName};
                vObj.add(area);
            }
            rs.close();
            releaseConnection();
        }catch(Exception e){
            
        }
        return vObj;
    }
    /**
     * Name         :displayUserType
     * Description  :This method will list the User Type Name and  Details
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector displayUserType() throws RemoteException {
        Vector vObj = new Vector();
        HLCICPUserDAO objDAO = new HLCICPUserDAO();
        try {
            vObj = objDAO.listUserType();
        }catch(Exception e){
            Debug.print("Error While getting User Type list : "+e.getMessage());
        }
        return vObj;
    }
    
   
    /*==================Start Event Registration Type Master =============================*/
    
    /**
     * Name         :displayEventRegistrationTypeMaster
     * Description  :This method will list the User Type Name and  Details
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector displayEventRegistrationTypeMaster() throws RemoteException {
        Vector vObj = new Vector();
        HLCEventRegistrationTypeDAO objDAO = new HLCEventRegistrationTypeDAO();
        try {
            vObj = objDAO.selectEventRegTypeDetails();
        }catch(Exception e){
            Debug.print("Error While getting User Type list : "+e.getMessage());
        }
        return vObj;
    }
     public Vector displayAnnualActivityTypeMaster() throws RemoteException {
        Vector vObj = new Vector();
        HLCEventRegistrationTypeDAO objDAO = new HLCEventRegistrationTypeDAO();
        try {
            vObj = objDAO.selectAnnualActivityTypeDetails();
        }catch(Exception e){
            Debug.print("Error While getting User Type list : "+e.getMessage());
        }
        return vObj;
    }
    /**
     * Name         :dispAnnualMeeForNoOfDays
     * Description  :This method will list no of days, registration date and meeting date based on annual meting name
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector dispAnnualMeeForNoOfDays(String annualMeeName) throws RemoteException {
        Vector vObj = new Vector();
        HLCEventRegistrationTypeDAO objDAO = new HLCEventRegistrationTypeDAO();
        try {
            vObj = objDAO.selectAnnualMeeForNoOfDays(annualMeeName);
        }catch(Exception e){
            Debug.print("Error While getting User Type list : "+e.getMessage());
        }
        return vObj;
    }
    
    /**
     * Name         :updateEventRegistrationTypeMaster
     * Description  :This method will update Event Registration Master table
     * @ param      :eventRegistrationTypeId,eventRegistrationTypeName,registrationDate,meetingDate,noOfDays
     * @return      :boolean
     * @throws      :RemoteException
     */
    public boolean updateEventRegistrationTypeMaster(String eventRegistrationTypeId,String eventRegistrationTypeName,String registrationDate,String meetingDate,int noOfDays) throws RemoteException {
        boolean bol = false;
        HLCEventRegistrationTypeDAO objDAO = new HLCEventRegistrationTypeDAO();
        try {
            bol = objDAO.updateEventRegType(eventRegistrationTypeId,eventRegistrationTypeName,registrationDate,meetingDate,noOfDays);
        }catch(Exception e){
            Debug.print("Error While updating event Registration Type Master : "+e.getMessage());
        }
        return bol;
    }
    
    /**
     * Name         :updateEventRegistrationTypeMaster
     * Description  :This method will update Event Registration Master table
     * @ param      :eventRegistrationTypeId,eventRegistrationTypeName,registrationDate,meetingDate,noOfDays
     * @return      :boolean
     * @throws      :RemoteException
     */
    public boolean updateStatusForAnnualConReg(String meetingId,String status, String comments) throws RemoteException {
        boolean bol = false;
        HLCEventRegistrationTypeDAO objDAO = new HLCEventRegistrationTypeDAO();
        try {
            bol = objDAO.updateStatusAnnConReg(meetingId,status,comments);
        }catch(Exception e){
            Debug.print("Error While updating event Registration Type Master : "+e.getMessage());
        }
        return bol;
    }
    
    
    /*==========================END Event Registration Type Master ===================*/
    /**
     * Name         :displaySpecification
     * Description  :This method will list the specification details
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector displaySpecification(String activityId) throws RemoteException {
        Vector vObj = new Vector();
        HLCICPUserDAO objDAO = new HLCICPUserDAO();
        try {
            vObj = objDAO.listSpecification(activityId);
        }catch(Exception e){
            Debug.print("Error While getting specification list : "+e.getMessage());
        }
        return vObj;
    }
    /**
     * Name         :displaySpecification
     * Description  :This method will list the specification details
     * @ param      :None
     * @return      :member Identification number
     * @throws      :RemoteException, FinderException
     */
    public Vector displaySpecification1() throws RemoteException {
        Vector vObj = new Vector();
        HLCICPUserDAO objDAO = new HLCICPUserDAO();
        try {
            vObj = objDAO.listSpecification1();
        }catch(Exception e){
            Debug.print("Error While getting specification list : "+e.getMessage());
        }
        return vObj;
    }
    
    public String getUserId(String email) { //throws RemoteException, FinderException {
        try {
            Collection col = home.findByMemberId(email);
            ArrayList array = new ArrayList(col);
            for (Iterator it=array.iterator(); it.hasNext( ); ) {
                // Object anObject = it.next( );
                String str = String.valueOf(it.next( ));
                String[] result = str.split(":");
                for (int x=1; x<result.length; x++){
                    System.out.println(result[x]);
                    userId = result[1];
                }
                System.out.println( "getUserId--User ID :  "+userId); //anObject.toString() );
            }
        }catch (Exception e){
            Debug.print("Error While getting user id : "+e.getMessage());
        }
        
        // Collection c = home.findByMemberId(memberId);
        return userId;
    }
    
    public Collection getUserDetails(String userId)throws RemoteException, FinderException {
        Collection c = home.findByUserDetails(userId);
        return c;
    }
    
    public Collection getMeetingDetails(String meetingId)throws RemoteException, FinderException {
        Collection c = home.findByMeetingID(meetingId);
        return c;
    }
    
    
    public String[] getDueOrAfterDatePriceForAnnual(Date currentDate, String specificationId, String userTypeId) throws RemoteException, FinderException {
        String amount = "0";
        Debug.print("VaigaiSessionBean getDueOrAfterDatePriceForAnnual() currentDate:" + currentDate);
        Debug.print("VaigaiSessionBean getDueOrAfterDatePriceForAnnual() specificationId: " + specificationId);
        Debug.print("VaigaiSessionBean getDueOrAfterDatePriceForAnnual() userTypeId: " + userTypeId);
        java.sql.Date cd =  DBHelper.toSQLDate(currentDate);
        String aftDueDatePrice = null;
        Date registrationDate = null;
        this.specificationId = specificationId;
        this.userTypeId = userTypeId;
        String priceId = null;
        
        if(specificationId!=null && specificationId.trim().length()!=0 && !specificationId.equals("0")&& userTypeId!=null && userTypeId.trim().length()!=0&& !userTypeId.equals("0")){
            try {
                makeConnection();
                
                String selectStatement =
                        "SELECT A.price_id, A.due_date_price, A.aft_due_date_price,C.registration_date FROM " +DBHelper.USEA__ANNUAL_PRICE+" A, "+
                        DBHelper.USEA_ANNUAL_SPECFICATION+" B, "+DBHelper.USEA_EVENT_REGISTRATION_MASTER+" C, "+DBHelper.USEA_ANNUAL_MEMBERTYPEMASTER+" D "+
                        " WHERE A.specification_id = B.specification_id "+
                        " AND A.mem_type_id = D.mem_type_id AND A.event_registration_type_id = C.event_registration_type_id AND A.specification_id = ? AND A.mem_type_id = ? ";
                
                Debug.print("selectStatement :"+selectStatement);
                
                prepStmt = con.prepareStatement(selectStatement);
                prepStmt.setString(1, specificationId);
                prepStmt.setString(2, userTypeId);
                rs = prepStmt.executeQuery();
                double tempDueDatePrice = 0.00d;
                double tempAftDueDatePrice = 0.00d;
                
                if (rs.next()) {
                    priceId = rs.getString(1);
                    tempDueDatePrice = rs.getDouble(2);
                    tempAftDueDatePrice = rs.getDouble(3);
                    registrationDate = rs.getDate(4);
                }
                rs.close();
                prepStmt.close();
                
                Debug.print("VaigaiSessionBean Before Checking currentDate: registrationDate" + registrationDate);
                Debug.print("VaigaiSessionBean Before Checking currentDate: currentDate" + currentDate);
                java.sql.Date cDate =  DBHelper.toSQLDate(new Date());
                java.sql.Date regDate = null;
                        
                if(registrationDate!=null)
                regDate = DBHelper.toSQLDate(registrationDate);
                
                
                if(cDate!=null && regDate!=null){
                    if (cDate.before(regDate) || cDate.equals(regDate)) {
                        amount = String.valueOf(tempDueDatePrice);
                    }else {
                        amount = String.valueOf(tempAftDueDatePrice);
                    }
                }
            } catch (SQLException sqe) {
                throw new EJBException(sqe);
                //sqe.printStackTrace();
            } finally {
                releaseConnection();
            }
            Debug.print("VaigaiSessionBean  Amount" + amount);
            //registrationDate = registrationDate.trim();
            // java.sql.Date dd =  DBHelper.toSQLDate(registrationDate );
            //java.sql.Date dd = java.sql.Date.valueOf(registrationDate);
        }
        
        String[] duePriceDet = {priceId ,amount};
        return duePriceDet;
    }
    
    public String getDueOrAfterDatePrice(Date currentDate, String specificationId, String userTypeId) throws RemoteException, FinderException {
        String amount = "0";
        Debug.print("VaigaiSessionBean getDueOrAfterDatePrice() currentDate:" + currentDate);
        Debug.print("VaigaiSessionBean getDueOrAfterDatePrice() specificationId: " + specificationId);
        Debug.print("VaigaiSessionBean getDueOrAfterDatePrice() userTypeId: " + userTypeId);
        java.sql.Date cd =  DBHelper.toSQLDate(currentDate);
        String aftDueDatePrice = null;
        Date registrationDate = null;
        this.specificationId = specificationId;
        this.userTypeId = userTypeId;
        try {
            makeConnection();
            
            String selectStatement =
                    "SELECT A.price_id, A.due_date_price, A.aft_due_date_price,C.registration_date FROM " +DBHelper.USEA__ANNUAL_PRICE+" A, "+
                    DBHelper.USEA_ANNUAL_SPECFICATION+" B, "+DBHelper.USEA_EVENT_REGISTRATION_MASTER+" C, "+DBHelper.USEA_ANNUAL_MEMBERTYPEMASTER+" D "+
                    " WHERE A.specification_id = B.specification_id  "+
                    " AND A.mem_type_id = D.mem_type_id AND A.specification_id = ?  AND A.mem_type_id = ? ";
            
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, specificationId);
            prepStmt.setString(2, userTypeId);
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                String priceId = rs.getString(1);
                dueDatePrice = rs.getString(2);
                aftDueDatePrice = rs.getString(3);
                registrationDate = rs.getDate(4);
            }
            rs.close();
            prepStmt.close();
            
            Debug.print("VaigaiSessionBean Before Checking currentDate: registrationDate" + registrationDate);
            Debug.print("VaigaiSessionBean Before Checking currentDate: currentDate" + currentDate);
            java.sql.Date cDate =  DBHelper.toSQLDate(currentDate);
            if(cDate!=null && registrationDate!=null){
                Debug.print(" Before Registration Date:" +cDate.before(registrationDate));
                Debug.print(" Equals Registration Date:" +cDate.equals(registrationDate));
                Debug.print(" Equals Registration Date:" +cDate.equals(registrationDate));
                if (cDate.before(registrationDate) || cDate.equals(registrationDate)) {
                    amount = dueDatePrice;
                }else {
                    amount = aftDueDatePrice;
                }
            }
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        //registrationDate = registrationDate.trim();
        // java.sql.Date dd =  DBHelper.toSQLDate(registrationDate );
        //java.sql.Date dd = java.sql.Date.valueOf(registrationDate);
        
        
        return amount;
    }
    
    public String[] getDueDatePrice( String specificationId, String userTypeId) throws RemoteException, FinderException {
        
        String priceId = null;
        String dueDatePrice=null;
        String arr[] = new String [2];
        this.specificationId = specificationId;
        this.userTypeId = userTypeId;
        try {
            makeConnection();
            String selectStatement =
                    "SELECT price_id, due_date_price FROM " +DBHelper.USEA__ANNUAL_PRICE+
                    " WHERE specification_id = ?  AND mem_type_id = ?  ";
            
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, specificationId);
            prepStmt.setString(2, userTypeId);
            //prepStmt.setString(3, eventRegistrationTypeId);
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                priceId = rs.getString(1);
                dueDatePrice = rs.getString(2);
                
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        arr[0] = priceId;
        arr[1] = dueDatePrice;
        return arr;
    }
    
    public boolean addPriceDetail(String specificationId,String userTypeId,String eventRegistrationTypeId,
            double dueDatePrice,double aftDueDatePrice) throws RemoteException {
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        boolean bol = false;
        boolean bol1 = false;
        try {
            bol = objPriceDAO.listRowPriceDetail(specificationId,userTypeId,eventRegistrationTypeId);
            if (bol == false) {
                bol1 = objPriceDAO.insertRowPriceDetail(specificationId,userTypeId,eventRegistrationTypeId,
                        dueDatePrice,aftDueDatePrice);
                
            }
            Debug.print(" Specification Id and usertypeId exist : "+bol);
        }catch(Exception e){
            Debug.print("Error while ading Price details");
        }
        return bol1;
    }
    public boolean addAnnualSpecificationDetails(String activityTypeId,String SpecName,String SpecDescription) throws RemoteException {
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        boolean bol1 = false;
        try {
            bol1 = objPriceDAO.insertAnnualSpecificationDetails(activityTypeId,SpecName,SpecDescription);
                   
            Debug.print(" Specification Id and usertypeId exist : "+bol1);
        }catch(Exception e){
            Debug.print("Error while ading Price details");
        }
        return bol1;
    }
    public boolean updatePriceDetail(String priceId,
            double dueDatePrice,double aftDueDatePrice) throws RemoteException {
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        boolean bol = false;
        boolean bol1 = false;
        try {
            bol1 = objPriceDAO.updateRowPriceDetail(priceId,dueDatePrice,aftDueDatePrice);
            Debug.print(" Updation for dueDatePrice and aftDueDatePrice : "+bol1);
        }catch(Exception e){
            Debug.print("Error while ading Price details");
        }
        return bol1;
    }
    
    
    //suresh here
    public boolean editPriceDetail(String priceId,
            String specificationId,String userTypeId,String eventRegistrationTypeId,
            double dueDatePrice,double aftDueDatePrice) throws RemoteException {
        Debug.print("editPriceDetail calling " + priceId);
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        boolean bol = false;
        boolean bol1 = false;
        try {
            bol = objPriceDAO.checkEditPriceDetail(priceId,specificationId,userTypeId,eventRegistrationTypeId);
            if (bol == false) {
                bol1 = objPriceDAO.editRowPriceDetail( priceId, specificationId, userTypeId, eventRegistrationTypeId,
                        dueDatePrice, aftDueDatePrice);
            }
            Debug.print(" Specification Id and usertypeId exist : "+bol);
        }catch(Exception e){
            Debug.print("Error while ading Price details");
        }
        Debug.print(" editupdatePriceDetail successfully updated.. Result : " + bol);
        return bol1;
    }
    
    public boolean addMeetingDetails(HLCMeeAnnualDetails objAnnaulDetails, HLCPaymentDetails objPayment) throws RemoteException{
    this.userId = getUserId(objAnnaulDetails.getEmail());
        Debug.print("User Id in addMeetingDetails : "+userId);
        objAnnaulDetails.setUserId(userId);
        objPayment.setUserId(userId);
        try{
            remote = home.create(objAnnaulDetails, objPayment);
        } catch(Exception exp){
            throw new EJBException("createMeeting Details: " + exp.getMessage());
        }
        return true;
    }
    
    public boolean addAnnualRegistrationDetails(HLCMeeAnnualRegistrationDetails objAnnualReg) throws RemoteException{
        Debug.print(" Inside addAnnualRegistrationDetails ");
        try{
            remote = home.create(objAnnualReg);
        } catch(Exception exp){
            throw new EJBException("createMeeting Details: " + exp.getMessage());
        }
        return true;
    }
    
    public boolean deleteMeetingDetails(String meetingId) throws RemoteException,FinderException{
        Debug.print("Vaigai Session Bean deleteMeetingDetails");
        Debug.print("Country Mail Type Id :" + meetingId);
        boolean result = false;
        if (meetingId == null) {
            throw new EJBException("Meeting ID can't be empty");
        }
        if (meetingIdExists(meetingId) == false) {
            throw new EJBException("Meeting Id Not Exists" + meetingId);
        }
        try {
            remote.remove();
            result = true;
        } catch (Exception ex) {
            throw new EJBException("remove Meeting Details: " + ex.getMessage());
        } finally{
            return result;
        }
    }
    
    /**
     * Name         :memberExists
     * Description  :This method will check for the existing of memberId and call the findByPrimaryKey method
     * @ param      :None
     * @return      :boolean value
     * @throws      :none
     */
    private boolean meetingIdExists(String meetingId) {
        boolean result =false;
        if ( !(meetingId.equals(this.meetingId)) ) {
            try {
                //  Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
                remote = home.findByPrimaryKey(meetingId);
                this.meetingId = meetingId;
                //  Debug.print("Kavery Session Bean contactTypeIdExists in side home: "+ home);
                /// Debug.print("Kavery Session Bean contactTypeIdExists in side remote: "+ remote);
                result =true;
            } catch (Exception ex) {
                result =true;
                System.out.println("Exception:" + ex);
            }
        }
        Debug.print("Kavery Session Bean meetingIdExists  "+ result);
        return result;
    }
    
    public boolean editMetingDetails(HLCMeeAnnualDetails objAnnaulDetails, HLCMeeAnnualRegistrationDetails objAnnualReg) throws RemoteException, FinderException{
        System.out.print("Meeting ID : "+objAnnaulDetails.getAnnualMeetingId());
        if (objAnnaulDetails == null && (objAnnaulDetails.getAnnualMeetingId()).equals("") ) {
            throw new EJBException("Annual Meeting ID can't be empty");
        }
        if (meetingIdExists(objAnnaulDetails.getAnnualMeetingId()) == false) {
            throw new EJBException("Member ID Not Exists : " + meetingId);
        }
        //area_id,badge_info,total_amount
        remote.setAnnualMeetingId(objAnnaulDetails.getAnnualMeetingId());
        if (objAnnaulDetails.getAreaId() != null){
            remote.setAreaId(objAnnaulDetails.getAreaId());
        }
        if (objAnnaulDetails.getBadgeInfo() != null){
            remote.setBadgeInfo(objAnnaulDetails.getBadgeInfo());
        }
        if (objAnnaulDetails.getTotalAmount() != null){
            remote.setTotalAmount(objAnnaulDetails.getTotalAmount());
        }
        
        remote.setreRuestStatus(objAnnaulDetails.getreRuestStatus());
        //no_of_tickets,price_id,accomodation_details
        if (objAnnualReg.getNoOfTickets() != null){
            remote.setNoOfTickets(objAnnualReg.getNoOfTickets());
        }
        if (objAnnualReg.getPriceId() != null){
            remote.setPriceId(objAnnualReg.getPriceId());
        }
        if (objAnnualReg.getAccomodationDetails() != null){
            remote.setAccomodationDetails(objAnnualReg.getAccomodationDetails());
        }
        
        
        return true;
    }
    
    
    /*private boolean meetingExists(String meetingId) {
        Debug.print("Vaigai Session Bean meetingExists meeting ID : "+meetingId);
     
        if ( !(meetingId.equals(this.meetingId)) ) {
            try {
                remote = home.findByPrimaryKey(meetingId);
                this.meetingId = meetingId;
            } catch (Exception ex) {
                return false;
            }
        }
        return true;
    }*/
    
    
    /**=====================Method Related to MullaiyarDamICPEntityBean==================*/
    //create(HLCInstructorDetails objInstDetail, HLCMeeAnnualRegistrationDetails objAnnualReg,  HLCPaymentDetails objPayment)
    //, HLCInstructorPriceMaster objInstPriceMas
    public String getPaymtId() throws RemoteException {
        String pymtId = null;
        try {
            pymtId = new HLCAnnualMeetingDAO().getNextId();
            Debug.print("Payment Id in the Vaigai session bean is : "+pymtId);
        }catch (Exception e){
            Debug.print("Exception in setting paymentID in addInstructorDetails:" + e);
        }
        return pymtId;
    }
    
    public boolean addInstructorDetails(HLCInstructorDetails objInstDetail, HLCPaymentDetails objPayment) throws RemoteException{
        // this.userId = getUserId(objInstDetail.getEmail());
        // Debug.print("User Id in addMeetingDetails : "+userId);
        // objPayment.setUserId(userId);
        
        
        try{
            remoteICP = homeICP.create(objInstDetail, objPayment);
        } catch(Exception exp){
            throw new EJBException("create Instructor Details: " + exp.getMessage());
        }
        return true;
    }
    
    public boolean addInstructorPriceMaster(HLCInstructorPriceMaster objInstPriceMas) throws RemoteException{
        try{
            remoteICP = homeICP.create(objInstPriceMas);
        } catch(Exception exp){
            throw new EJBException("create Instructor Price Master: " + exp.getMessage());
        }
        return true;
    }
    //findByMeetingId(String icpMeetingId)
    
    public Collection getICPMeetingDetails(String icpMeetingId)throws RemoteException, FinderException {
        Collection c = homeICP.findByMeetingId(icpMeetingId);
        return c;
    }
    
    public boolean editInstructorDetails(HLCInstructorDetails objInstDetail) throws RemoteException, FinderException {
        boolean bol = false;
        try {
            if (objInstDetail == null && (objInstDetail.getIcpMeetingId()).equals("") ) {
                throw new EJBException("ICP Meeting ID can't be empty");
            }
            HLCInstructorDetailDAO objInstDAO = new HLCInstructorDetailDAO();
            bol = objInstDAO.updateInstructorDetail(objInstDetail);
            Debug.print("Updated Succefully ......");
            
            
        }catch(Exception e){
            Debug.print("Error While updating in editInstructorDetails: "+e.getMessage());
        }
        return bol;
    }
    
    public boolean editICPRequestStatus(HLCInstructorDetails objInstructorDetails) throws RemoteException, FinderException{
        System.out.print("ICP Meeting ID : "+objInstructorDetails.getIcpMeetingId());
        if (objInstructorDetails == null && (objInstructorDetails.getIcpMeetingId()).equals("") ) {
            throw new EJBException("ICP Meeting ID can't be empty");
        }
        if (ipcMeetingIdExists(objInstructorDetails.getIcpMeetingId()) == false) {
            throw new EJBException("ICP Meeting ID Not Exists : " + icpMeetingId);
        }
        
        remoteICP.setIcpMeetingId(objInstructorDetails.getIcpMeetingId());
        remoteICP.setRequestStatus(objInstructorDetails.getRequestStatus());
        remoteICP.setApprovedBy(objInstructorDetails.getApprovedBy());
        remoteICP.setApprovedDate((Calendar.getInstance().getTime()).toString());
        remoteICP.setComments(objInstructorDetails.getComments());
        return true;
    }
    
    public boolean editStatusICPRequest(String meetingId1,String status1, String appBy, String comments) throws RemoteException, FinderException{
        System.out.print("ICP Meeting ID : "+meetingId1);
        if (meetingId1 == null  ) {
            throw new EJBException("ICP Meeting ID can't be empty");
        }
        if (ipcMeetingIdExists(meetingId1) == false) {
            throw new EJBException("ICP Meeting ID Not Exists : " + icpMeetingId);
        }
          /* private String convertToString(Date txtYesDate){
           
          if(null==txtYesDate)
              return "";
           
          SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
         return sdf.format(txtYesDate);
      }*/
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        String date = sdf.format(dt);
        
        
        
        Debug.print(" Date : "+(Calendar.getInstance().getTime()).toString());
        remoteICP.setIcpMeetingId(meetingId1);
        remoteICP.setRequestStatus(status1);
        remoteICP.setApprovedBy(appBy);
        // remoteICP.setApprovedDate(date);
        remoteICP.setComments(comments);
        return true;
    }
    
    /**
     * Name         :displayAnnaulApplicationDetail
     * Description  :This method will list the details for one application for annual meeting
     * @ param      :annual meeting ID
     * @return      :Vector
     * @throws      :RemoteException
     */
    public Vector displayAnnaulApplicationDetail(String annualMeeId) throws RemoteException {
        Vector vObj = new Vector();
        try {
            makeConnection();
           /* String selStamt = "SELECT A.annual_meeting_id, A.user_id, A.badge_info,A.total_amount, "+
            "B.first_name, B.last_name, B.email_id, C.area_name, A.request_status, A.add_date, "+
            "D.specification_name, E.mem_type_name, F.due_date_price, F.aft_due_date_price, "+
            "G.no_of_tickets,H.suite,H.address1,H.address2,H.city,H.state,H.country,H.zip,H.phone_no,H.mobile_no,H.fax_no FROM "+
            DBHelper.USEA_ANNUAL_DETAILS+" A, "+DBHelper.USEA_MMS_USERMASTER+" B, "+DBHelper.USEA_AREA_MASTER+" C, "+
            DBHelper.USEA_ANNUAL_SPECFICATION+" D, "+DBHelper.USEA_ANNUAL_MEMBERTYPEMASTER+" E, "+DBHelper.USEA__ANNUAL_PRICE+" F, "+
            DBHelper.USEA_ANNUAL_REGISTRATION+" G, "+DBHelper.USEA_CONTACT_DETAILS+" H "+
            "WHERE A.annual_meeting_id = G.meeting_id and A.user_id = B.user_id and "+
            "A.area_id = C.area_id and G.price_id = F.price_id and "+
            "F.specification_id = D.specification_id and F.mem_type_id = E.mem_type_id and "+
            "A.user_id = B.user_id AND A.area_id = C.area_id AND A.annual_meeting_id = ";*/
            
           /* String selStmt = "SELECT A.annual_meeting_id, A.user_id, A.badge_info,A.total_amount, "+
            "C.area_name, A.request_status, A.add_date, D.specification_name, E.mem_type_name, F.due_date_price, "+
            "F.aft_due_date_price, G.no_of_tickets FROM "+DBHelper.USEA_ANNUAL_DETAILS+" A, "+ DBHelper.USEA_AREA_MASTER+" C, "+
            DBHelper.USEA_ANNUAL_SPECFICATION+" D, "+DBHelper.USEA_ANNUAL_MEMBERTYPEMASTER+" E, "+DBHelper.USEA__ANNUAL_PRICE+" F, "+
            DBHelper.USEA_ANNUAL_REGISTRATION+" G WHERE A.annual_meeting_id = G.meeting_id and "+
            "A.area_id = C.area_id and G.price_id = F.price_id and "+
            "F.specification_id = D.specification_id and F.mem_type_id = E.mem_type_id and "+
            "A.area_id = C.area_id AND A.annual_meeting_id = ? ";*/
            
            
            String selectStatement = "SELECT A.annual_meeting_id, A.user_id, A.badge_info,A.total_amount, B.first_name, "+
                    "B.last_name, B.email_id, C.area_name, A.request_status, A.add_date,D.suite,D.address1,D.address2,D.city,D.state,"+
                    "D.country,D.zip,D.phone_no,D.mobile_no,D.fax_no,E.member_id FROM "+DBHelper.USEA_ANNUAL_DETAILS+" A, "+
                    DBHelper.USEA_MMS_USERMASTER+" B, "+DBHelper.USEA_AREA_MASTER+" C, "+DBHelper.USEA_CONTACT_DETAILS+" D, "+DBHelper.USEA_MMS_MEMBERDETAIL+" E "+
                    "  WHERE A.user_id = B.user_id AND A.user_id = E.user_id AND A.area_id = C.area_id AND A.user_id = D.user_id AND A.annual_meeting_id = ? ";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,annualMeeId);
            rs = prepStmt.executeQuery();
            //System.out.println("Inside the getUserAndMemberId mailId : "+mailId);
            if(rs.next()) {
                this.annualMeetingId = rs.getString(1);
                this.userId = rs.getString(2);
                this.badgeInfo = rs.getString(3);
                this.totalAmount = rs.getString(4);
                this.firstName = rs.getString(5);
                this.lastName = rs.getString(6);
                this.emailId = rs.getString(7);
                this.areaName = rs.getString(8);
                this.requestStatus = rs.getString(9);
                Date addDate1 = rs.getDate(10);
                this.suite = rs.getString(11);
                this.address1 = rs.getString(12);
                this.address2 = rs.getString(13);
                this.city = rs.getString(14);
                this.state = rs.getString(15);
                this.country = rs.getString(16);
                this.zip = rs.getString(17);
                this.phoneNo = rs.getString(18);
                this.mobileNo = rs.getString(19);
                this.faxNo = rs.getString(20);
                this.memberId = rs.getString(21);
                
                this.addDate = DBHelper.dateToString(addDate1);
                
                String annualMee[] = {annualMeetingId,userId,badgeInfo,totalAmount,firstName,lastName,emailId,areaName,requestStatus,
                addDate,suite,address1,address2,city,state,country,zip,phoneNo,mobileNo,faxNo,memberId};
                vObj.add(annualMee);
                
                
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return vObj;
    }
    
    /**
     * Name         :displayAnnaulSpecificationDetail
     * Description  :This method will list the details like specificationName, userTypeName and noOfTicket for annual meeting
     * @ param      :annual meeting ID
     * @return      :Vector
     * @throws      :RemoteException
     */
    public Vector displayAnnaulSpecificationDetail(String annualMeeId) throws RemoteException {
        Vector vObj = new Vector();
        try {
            makeConnection();
            
            String selStmt = "SELECT  D.specification_name, E.mem_type_name, F.due_date_price, "+
                    "F.aft_due_date_price, G.no_of_tickets,G.days_applied FROM "+DBHelper.USEA_ANNUAL_DETAILS+" A, "+ DBHelper.USEA_AREA_MASTER+" C, "+
                    DBHelper.USEA_ANNUAL_SPECFICATION+" D, "+DBHelper.USEA_ANNUAL_MEMBERTYPEMASTER+" E, "+DBHelper.USEA__ANNUAL_PRICE+" F, "+
                    DBHelper.USEA_ANNUAL_REGISTRATION+" G WHERE A.annual_meeting_id = G.meeting_id and "+
                    "A.area_id = C.area_id and G.price_id = F.price_id and "+
                    "F.specification_id = D.specification_id and F.mem_type_id = E.mem_type_id and "+
                    "A.area_id = C.area_id AND A.annual_meeting_id = ? ";
            
            prepStmt = con.prepareStatement(selStmt);
            prepStmt.setString(1,annualMeeId);
            rs = prepStmt.executeQuery();
            //System.out.println("Inside the getUserAndMemberId mailId : "+mailId);
            while(rs.next()) {
                String specificationName = rs.getString(1);
                Debug.print(" specificationName : "+specificationName);
                String userTypeName = rs.getString(2);
                Debug.print(" userTypeName : "+userTypeName);
                String noOfTickets = rs.getString(5);
                Debug.print(" noOfTickets : "+noOfTickets);
                String daysApplied = rs.getString(6);
                String []specDetail  = {specificationName,userTypeName,noOfTickets,daysApplied};
                vObj.add(specDetail);
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return vObj;
    }
    
    
    //Suresh Here -- List Price Details
    public ArrayList displayPriceDetails(String eventTypeId, String specificationId) throws RemoteException{
        ArrayList priceList = new ArrayList();
        try {
            makeConnection();
            
            String selStmt = "select A.price_id, A.due_date_price, A.aft_due_date_price, B.mem_type_name from " +
                    DBHelper.USEA__ANNUAL_PRICE + "  A, " + DBHelper.USEA_ANNUAL_MEMBERTYPEMASTER + " B " +
                    " where A.mem_type_id = B.mem_type_id and event_registration_type_id = ? " +
                    " and specification_id = ?" ;
            
            prepStmt = con.prepareStatement(selStmt);
            prepStmt.setString(1,eventTypeId);
            prepStmt.setString(2,specificationId);
            
            rs = prepStmt.executeQuery();
            //System.out.println("Inside the getUserAndMemberId mailId : "+mailId);
            while(rs.next()) {
                String priceDetId = rs.getString(1);
                String dueDatePrice = rs.getString(2);
                String afterDueDatePrice = rs.getString(3);
                String userTypeName = rs.getString(4);
                String [] priceDetail  = {priceDetId,dueDatePrice,afterDueDatePrice,userTypeName};
                priceList.add(priceDetail);
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return priceList;
    }
  
    
    public String[] displayPriceDetailsById(String priceId) throws RemoteException {
        String[]  priceDetail = {};
        try {
            makeConnection();
            
            String selStmt = " select A.price_id, A.specification_id, A.mem_type_id, A.event_registration_type_id, " +
                    " A.due_date_price, A.aft_due_date_price, B.mem_type_name ,C.specification_name, " +
                    " D.event_registration_type_name from " + DBHelper.USEA__ANNUAL_PRICE + " A, " +  DBHelper.USEA_ANNUAL_MEMBERTYPEMASTER + " B, " +
                    DBHelper.USEA_ANNUAL_SPECFICATION + "  C, " + DBHelper.USEA_EVENT_REGISTRATION_MASTER + " D " +
                    " where A.mem_type_id = B.mem_type_id and A.specification_id = C.specification_id and " +
                    " A.event_registration_type_id = D.event_registration_type_id and " +
                    " A.price_id =? ";
            
            prepStmt = con.prepareStatement(selStmt);
            prepStmt.setString(1,priceId);
            
            rs = prepStmt.executeQuery();
            //System.out.println("Inside the getUserAndMemberId mailId : "+mailId);
            while(rs.next()) {
                String priceDetId = rs.getString(1);
                String specId = rs.getString(2);
                String userTyId = rs.getString(3);
                String eventTypeId = rs.getString(4);
                
                String dueDatePrice = rs.getString(5);
                String afterDueDatePrice = rs.getString(6);
                String userTypeName = rs.getString(7);
                
                String specName = rs.getString(8);
                String eventName = rs.getString(9);
                
                String [] tempPriceDetail  = {priceDetId,specId,userTyId,eventTypeId, dueDatePrice, afterDueDatePrice, userTypeName, specName, eventName};
                priceDetail = tempPriceDetail;
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return priceDetail;
    }
    
    /**
     * Name         :icpMeetingId
     * Description  :This method will list all the Pending/ Active Registration Form
     * @ param      :None
     * @return      :Vector
     * @throws      :RemoteException
     */
    public Vector displayICPRegistrationForm(String status) throws RemoteException {
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
        Vector vObj = new Vector();
        try {
            makeConnection();
            String selectStatement =
                    "SELECT A.icp_meeting_id, A.assesment_level, A.assesment_date,A.no_of_days,B.area_name,"+
                    "A.location, A.instructor_id, A.host_member_id, A.shipping_type_id,A.assessor, A.facilities, A.land_owner_name, A.land_owner_business_name,"+
                    "A.land_owner_address, A.land_owner_city,A.land_owner_state, A.land_owner_country,A.land_owner_zip, A.land_owner_phone, A.land_owner_fax,A.land_owner_email,"+
                    "A.approved_by, A.approved_date, A.posting_type,A.add_date,A.request_status  FROM  " +DBHelper.USEA_INSTRUCTOR_DETAILS+
                    " A,  "+DBHelper.USEA_AREA_MASTER+" B, " + DBHelper.USEA_PAYMENT_DETAILS +
                    //For Debug Starts
                    //" C WHERE A.usea_area_id = B.area_id and A.payment_id = C.payment_id and A.request_status = ? ";
                    " C WHERE A.usea_area_id = B.area_id and A.request_status = ? ";
                    //For Debug Ends
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,status);
            
            Debug.print("Query selectStatement :Status  "+status+"   \n "+selectStatement);
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                this.icpMeetingId = rs.getString(1);
                this.assesmentLevel = rs.getString(2);
                Date assesmentDate1 = rs.getDate(3);
                this.noOfdays = rs.getString(4);
                this.useaAreaId = rs.getString(5);
// Provided the value to areaName
                this.areaName = rs.getString(5);
                this.location = rs.getString(6);
                this.instructorId = rs.getString(7);
                this.hostMemberId = rs.getString(8);
                this.shippingTypeId = rs.getString(9);
                this.assessor = rs.getString(10);
                this.facilities = rs.getString(11);
                this.landOwnerName = rs.getString(12);
                this.landOwnerBusinessName = rs.getString(13);
                this.landOwnerAddress = rs.getString(14);
                this.landOwnerCity = rs.getString(15);
                this.landOwnerState = rs.getString(16);
                this.landOwnerCountry = rs.getString(17);
                this.landOwnerZip = rs.getString(18);
                this.landOwnerPhone = rs.getString(19);
                this.landOwnerFax = rs.getString(20);
                this.landOwnerEmail = rs.getString(21);
                this.approvedBy = rs.getString(22);
                this.approvedDate = rs.getString(23);
                this.postingType = rs.getString(24);
                Date addDate1 = rs.getDate(25);
                this.requestStatus = rs.getString(26);
                
                this.assesmentDate = formatter.format(assesmentDate1);
                this.addDate = formatter.format(addDate1);
//Changed    useaAreaId  to   areaName
                String strICP[] = {icpMeetingId,assesmentLevel,assesmentDate,noOfdays,areaName,
                location,instructorId,hostMemberId,shippingTypeId,assessor,facilities,landOwnerName,
                landOwnerBusinessName,landOwnerAddress,landOwnerCity,landOwnerState,landOwnerCountry,
                landOwnerZip,landOwnerPhone,landOwnerFax,landOwnerEmail,approvedBy,approvedDate,
                postingType,addDate,requestStatus};
                vObj.add(strICP);
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return vObj;
    }
    
    /**
     * Name         :displayICPRegBasedOnMeetingId
     * Description  :This method will list all the Instructor applied for
     * @ param      :None
     * @return      :Vector
     * @throws      :RemoteException
     */
    public Vector displayICPRegBasedOnMeetingId(String icpMeetingId) throws RemoteException {
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
        Vector vObj = new Vector();
        try {
            makeConnection();
            String selectStatement =
                    
                    "SELECT A.icp_meeting_id, A.assesment_level, A.assesment_date,A.no_of_days, "+
                    "B.area_name, A.location, A.instructor_id, A.host_member_id, "+
                    " A.shipping_type_id,A.assessor, A.facilities, A.land_owner_name, "+
                    " A.land_owner_business_name,A.land_owner_address, A.land_owner_city, "+
                    "A.land_owner_state, A.land_owner_country,A.land_owner_zip, A.land_owner_phone, "+
                    "A.land_owner_fax,A.land_owner_email,A.approved_by, A.approved_date,  "+
                    "A.posting_type, A.add_date,A.request_status, B.area_name, C.first_name, C.last_name, C.email_id, "+
                    "D.address1, D.country, D.state, D.city, D.zip, D.phone_no, D.fax_no,A.comments, "+
                    " F.payment_id, F.cc_name, F.cc_type, F.cc_number, F.cc_exp_month, F.cc_exp_year, "+
                    " F.cc_cvvid, F.bank_name, F.check_date, F.check_number, F.check_name, F.amount, "+
                    " F.payment_date,F.payment_status, F.ssl_result, F.ssl_result_message, F.ssl_txn_id, "+
                    " F.ssl_approval_code, F.ssl_cvv2_response, F.ssl_avs_response, F.ssl_transaction_type, "+
                    "F.ssl_invoice_no, F.ssl_email FROM  "+
                    DBHelper.USEA_INSTRUCTOR_DETAILS+" A, "+DBHelper.USEA_AREA_MASTER+" B, "+DBHelper.USEA_MMS_USERMASTER+" C, "+
                    DBHelper.USEA_CONTACT_DETAILS+" D, "+DBHelper.USEA_MMS_MEMBERDETAIL+" E, "+DBHelper.USEA_PAYMENT_DETAILS+" F WHERE A.usea_area_id = B.area_id and "+
                    " A.host_member_id = E.member_id and E.user_id = C.user_id and C.user_id = D.user_id and "+
                    " C.contact_type_id = D.contact_type_id and A.payment_id = F.payment_id and  A.icp_meeting_id = ?";
            
            Debug.print("Query:"+selectStatement+"\n"+"params:"+icpMeetingId) ;
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,icpMeetingId);
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                this.icpMeetingId = rs.getString(1);
                this.assesmentLevel = rs.getString(2);
                Date assesmentDate1 = rs.getDate(3);
                this.noOfdays = rs.getString(4);
                this.useaAreaId = rs.getString(5);
// Provided the value to areaName
                this.areaName = rs.getString(5);
                this.location = rs.getString(6);
                this.instructorId = rs.getString(7);
                this.hostMemberId = rs.getString(8);
                this.shippingTypeId = rs.getString(9);
                this.assessor = rs.getString(10);
                this.facilities = rs.getString(11);
                this.landOwnerName = rs.getString(12);
                this.landOwnerBusinessName = rs.getString(13);
                this.landOwnerAddress = rs.getString(14);
                this.landOwnerCity = rs.getString(15);
                this.landOwnerState = rs.getString(16);
                this.landOwnerCountry = rs.getString(17);
                this.landOwnerZip = rs.getString(18);
                this.landOwnerPhone = rs.getString(19);
                this.landOwnerFax = rs.getString(20);
                this.landOwnerEmail = rs.getString(21);
                this.approvedBy = rs.getString(22);
                this.approvedDate = rs.getString(23);
                this.postingType = rs.getString(24);
                Date addDate1 = rs.getDate(25);
                this.requestStatus = rs.getString(26);
                this.areaName = rs.getString(27);
                this.firstame = rs.getString(28);
                this.lastName = rs.getString(29);
                this.emailId = rs.getString(30);
                this.address = rs.getString(31);
                this.country = rs.getString(32);
                this.state = rs.getString(33);
                this.city = rs.getString(34);
                this.zip = rs.getString(35);
                this.phoneNo = rs.getString(36);
                this.faxNo = rs.getString(37);
                this.comments = rs.getString(38);
                
                this.paymentId = rs.getString(39);
                this.ccName = rs.getString(40);
                this.ccType = rs.getString(41);
                this.ccNumber = rs.getString(42);
                this.ccExpMonth = rs.getString(43);
                this.ccExpYear = rs.getString(44);
                this.ccCvvid = rs.getString(45);
                this.bankName = rs.getString(46);
                Date checkDate1 = rs.getDate(47);
                // this.CheckDate = formatter.format(rs.getString(47));
                this.checkNumber = rs.getString(48);
                this.checkName = rs.getString(49);
                this.amount = rs.getString(50);
                Date pDate = rs.getDate(51);
                //this.paymentDate = formatter.format(rs.getString(51));
                this.paymentStatus = rs.getString(52);
                this.sslResult = rs.getString(53);
                this.sslResultMessage = rs.getString(54);
                this.sslTxnId = rs.getString(55);
                this.sslApprovedCode = rs.getString(56);
                this.sslCvv2Response = rs.getString(57);
                this.sslAvsResponse = rs.getString(58);
                this.sslTransactionType = rs.getString(59);
                this.sslInvoiceNo = rs.getString(60);
                this.sslEmail = rs.getString(61);
                
                this.CheckDate = formatter.format(checkDate1);
                this.paymentDate = formatter.format(pDate);
                this.assesmentDate = formatter.format(assesmentDate1);
                this.addDate = formatter.format(addDate1);
//Changed    useaAreaId  to   areaName
                String strICP[] = {icpMeetingId,assesmentLevel,assesmentDate,noOfdays,areaName,
                location,instructorId,hostMemberId,shippingTypeId,assessor,facilities,landOwnerName,
                landOwnerBusinessName,landOwnerAddress,landOwnerCity,landOwnerState,landOwnerCountry,
                landOwnerZip,landOwnerPhone,landOwnerFax,landOwnerEmail,approvedBy,approvedDate,
                postingType,addDate,requestStatus,areaName,firstame,lastName,emailId,address,country,state,city,zip,phoneNo,faxNo,comments,
                paymentId,ccName,ccType,ccNumber,ccExpMonth,ccExpYear,ccCvvid,bankName,CheckDate,checkNumber,checkName,
                amount,paymentDate,paymentStatus,sslResult,sslResultMessage,sslTxnId,sslApprovedCode,sslCvv2Response,
                sslAvsResponse,sslTransactionType,sslInvoiceNo,sslEmail};
                vObj.add(strICP);
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return vObj;
    }
    
    /**
     * Name         :displayICPRegBasedOnInstructorId
     * Description  :This method will list all the Instructor applied for
     * @ param      :None
     * @return      :Vector
     * @throws      :RemoteException
     */
    public Vector displayICPRegBasedOnInstructorId(String instructorId) throws RemoteException {
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
        Vector vObj = new Vector();
        try {
            makeConnection();
            String selectStatement =
                    "SELECT icp_meeting_id, assesment_level, assesment_date,no_of_days,usea_area_id,"+
                    "location, instructor_id, host_member_id, shipping_type_id,assessor, facilities, land_owner_name, land_owner_business_name,"+
                    "land_owner_address, land_owner_city,land_owner_state, land_owner_country,land_owner_zip, land_owner_phone, land_owner_fax,land_owner_email,"+
                    "approved_by, approved_date, posting_type,add_date,request_status,comments  FROM  " +DBHelper.USEA_INSTRUCTOR_DETAILS+" WHERE instructor_id = ? ";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,instructorId);
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                this.icpMeetingId = rs.getString(1);
                this.assesmentLevel = rs.getString(2);
                Date assesmentDate1 = rs.getDate(3);
                this.noOfdays = rs.getString(4);
                this.useaAreaId = rs.getString(5);
                this.areaName = rs.getString(5);
                this.location = rs.getString(6);
                this.instructorId = rs.getString(7);
                this.hostMemberId = rs.getString(8);
                this.shippingTypeId = rs.getString(9);
                this.assessor = rs.getString(10);
                this.facilities = rs.getString(11);
                this.landOwnerName = rs.getString(12);
                this.landOwnerBusinessName = rs.getString(13);
                this.landOwnerAddress = rs.getString(14);
                this.landOwnerCity = rs.getString(15);
                this.landOwnerState = rs.getString(16);
                this.landOwnerCountry = rs.getString(17);
                this.landOwnerZip = rs.getString(18);
                this.landOwnerPhone = rs.getString(19);
                this.landOwnerFax = rs.getString(20);
                this.landOwnerEmail = rs.getString(21);
                this.approvedBy = rs.getString(22);
                this.approvedDate = rs.getString(23);
                this.postingType = rs.getString(24);
                Date addDate1 = rs.getDate(25);
                this.requestStatus = rs.getString(26);
                this.comments = rs.getString("comments");
                
                this.assesmentDate = formatter.format(assesmentDate1);
                this.addDate = formatter.format(addDate1);
                String strICP[] = {icpMeetingId,assesmentLevel,assesmentDate,noOfdays,areaName,
                location,instructorId,hostMemberId,shippingTypeId,assessor,facilities,landOwnerName,
                landOwnerBusinessName,landOwnerAddress,landOwnerCity,landOwnerState,landOwnerCountry,
                landOwnerZip,landOwnerPhone,landOwnerFax,landOwnerEmail,approvedBy,approvedDate,
                postingType,addDate,requestStatus,comments};
                vObj.add(strICP);
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return vObj;
    }
    
    /**
     * Name         :displayICPRegBasedOnStatus
     * Description  :This method will list all the applied for Admin based on the status
     * @ param      :status type
     * @return      :Vector
     * @throws      :RemoteException
     */
    public Vector displayICPRegBasedOnStatus(String status) throws RemoteException {
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
        Vector vObj = new Vector();
        try {
            makeConnection();
            String selectStatement =
                    "SELECT icp_meeting_id, assesment_level, assesment_date,no_of_days,usea_area_id,"+
                    "location, instructor_id, host_member_id, shipping_type_id,assessor, facilities, land_owner_name, land_owner_business_name,"+
                    "land_owner_address, land_owner_city,land_owner_state, land_owner_country,land_owner_zip, land_owner_phone, land_owner_fax,land_owner_email,"+
                    "approved_by, approved_date, posting_type,add_date,request_status,comments  FROM  " +DBHelper.USEA_INSTRUCTOR_DETAILS+" WHERE request_status = ? ";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,status);
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                this.icpMeetingId = rs.getString(1);
                this.assesmentLevel = rs.getString(2);
                Date assesmentDate1 = rs.getDate(3);
                this.noOfdays = rs.getString(4);
                this.useaAreaId = rs.getString(5);
                this.areaName = rs.getString(5);
                this.location = rs.getString(6);
                this.instructorId = rs.getString(7);
                this.hostMemberId = rs.getString(8);
                this.shippingTypeId = rs.getString(9);
                this.assessor = rs.getString(10);
                this.facilities = rs.getString(11);
                this.landOwnerName = rs.getString(12);
                this.landOwnerBusinessName = rs.getString(13);
                this.landOwnerAddress = rs.getString(14);
                this.landOwnerCity = rs.getString(15);
                this.landOwnerState = rs.getString(16);
                this.landOwnerCountry = rs.getString(17);
                this.landOwnerZip = rs.getString(18);
                this.landOwnerPhone = rs.getString(19);
                this.landOwnerFax = rs.getString(20);
                this.landOwnerEmail = rs.getString(21);
                this.approvedBy = rs.getString(22);
                this.approvedDate = rs.getString(23);
                this.postingType = rs.getString(24);
                Date addDate1 = rs.getDate(25);
                this.requestStatus = rs.getString(26);
                this.comments = rs.getString("comments");
                
                this.assesmentDate = formatter.format(assesmentDate1);
                this.addDate = formatter.format(addDate1);
                String strICP[] = {icpMeetingId,assesmentLevel,assesmentDate,noOfdays,areaName,
                location,instructorId,hostMemberId,shippingTypeId,assessor,facilities,landOwnerName,
                landOwnerBusinessName,landOwnerAddress,landOwnerCity,landOwnerState,landOwnerCountry,
                landOwnerZip,landOwnerPhone,landOwnerFax,landOwnerEmail,approvedBy,approvedDate,
                postingType,addDate,requestStatus,comments};
                vObj.add(strICP);
            }
            rs.close();
            prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return vObj;
    }
    
    /**
     * Name         :icpMeetingId
     * Description  :This method will check for the existing of memberId and call the findByPrimaryKey method
     * @ param      :None
     * @return      :boolean value
     * @throws      :none
     */
    private boolean ipcMeetingIdExists(String icpMeetingId) {
        boolean result =false;
        Debug.print("Meeting ID : "+icpMeetingId);
        Debug.print("this.Meeting ID : "+this.icpMeetingId);
        
        // if ( !(icpMeetingId.equals(this.icpMeetingId)) ) {
        if ( icpMeetingId != this.icpMeetingId){
            try {
                Debug.print("Kavery Session Bean ipcMeetingIdExists in side loop: "+icpMeetingId);
                remoteICP = homeICP.findByPrimaryKey(icpMeetingId);
                this.icpMeetingId = icpMeetingId;
                Debug.print("Kavery Session Bean contactTypeIdExists in side homeICP: "+ homeICP);
                /// Debug.print("Kavery Session Bean contactTypeIdExists in side remote: "+ remote);
                result =true;
            } catch (Exception ex) {
                result =true;
                System.out.println("Exception:" + ex);
            }
        }
        Debug.print("Kavery Session Bean ipcMeetingIdExists  "+ result);
        return result;
    }
    
    /*===============METHODS RELATED TO ICP USER BEANS==========================*/
    
    HLCICPUserDAO objDAO = new HLCICPUserDAO();
    public boolean addICPUserDetails(HLCMeeICPUserDetails objICPUser) throws RemoteException{
        
        Debug.print("Inside the addICPUserDetails");
        
        try{
            // Vector vObj = (Vector)objDAO.getUserAndMemberId(objICPUser.getEmailId());
            // String [] userIdMemberId = (String[])vObj.elementAt(0);
            // objICPUser.setUserId(userIdMemberId[0]);
            // objICPUser.setMemberId(userIdMemberId[1]);
            Debug.print("In VaigaiSessionBean User Id : "+objICPUser.getUserId());
            Debug.print("In VaigaiSessionBean Membee Id : "+objICPUser.getMemberId());
            Debug.print("In VaigaiSessionBean Icp Meeting Id : "+objICPUser.getIcpMeetingId());
            Debug.print("In VaigaiSessionBean Icp Meeting Id : "+objICPUser.getMembershipStatus());
            remoteICPUser = homeICPUser.create(objICPUser);
        } catch(Exception exp){
            throw new EJBException("create ICPUserDetails: " + exp.getMessage());
        }
        return true;
    }
    
    public Vector displayUserList(String userId) throws RemoteException {
        Vector vObj = new Vector();
        try {
            vObj = (Vector)objDAO.listICPUserReg(userId);
        }catch(Exception e){
            
        }
        return vObj;
    }
    
    public Vector displayUserListBasedOnStatus(String status) throws RemoteException {
        Vector vObj = new Vector();
        try {
            vObj = (Vector)objDAO.listICPUserRegBasedOnStatus(status);
        }catch(Exception e){
            
        }
        return vObj;
    }
    
    public Vector displayAnnualDetailBasedOnStatus(String status) throws RemoteException {
        Vector vObj = new Vector();
        HLCEventRegistrationTypeDAO objAnnMee = new HLCEventRegistrationTypeDAO();
        try {
            vObj = objAnnMee.selectAnnualDetails(status);
        }catch(Exception e){
            Debug.print("Error while getting Annual details : "+e.getMessage());
        }
        return vObj;
    }
    
    public Vector displayAnnualDetailBasedOnUserID(String userId) throws RemoteException {
        Vector vObj = new Vector();
        HLCEventRegistrationTypeDAO objAnnMee = new HLCEventRegistrationTypeDAO();
        try {
            vObj = objAnnMee.selectAnnualDetailsBasedOnUserId(userId);
        }catch(Exception e){
            Debug.print("Error while getting Annual details based on User Id: "+e.getMessage());
        }
        return vObj;
    }
    
    public Vector displayUserBasedOnReleaseId(String releaseId) throws RemoteException {
        Vector vObj = new Vector();
        try {
            vObj = (Vector)objDAO.listICPUserRegBasedOnReleaseId(releaseId);
        }catch(Exception e){
            
        }
        return vObj;
    }
    
    //displayUserBasedOnReleaseId(String releaseId)
    public Vector displayUserDETAIL(String email) throws RemoteException {
        Vector vObj = new Vector();
        try {
            vObj = (Vector)objDAO.displayUserDetails(email);
        }catch(Exception e){
            
        }
        return vObj;
    }
    
    public Vector displayUserDETAILBasedOnMemberId(String memberId) throws RemoteException {
        Vector vObj = new Vector();
        try {
            vObj = (Vector)objDAO.displayUserDetailsBasedOnMemberId(memberId);
        }catch(Exception e){
            
        }
        return vObj;
    }
    
    //public Vector displayUserDETAILBasedOnMemberId(String memberId) throws RemoteException;
    
    public boolean editICPUserStatus(HLCMeeICPUserDetails objICPUser) throws RemoteException, FinderException{
        System.out.print("ICP User ID : "+objICPUser.getReleaseId());
        if (objICPUser == null && (objICPUser.getReleaseId()).equals("") ) {
            throw new EJBException("ICP User ID can't be empty");
        }
        if (ipcUserMemberIdExists(objICPUser.getReleaseId()) == false) {
            throw new EJBException("ICP Meeting ID Not Exists : " + releaseId);
        }
        Debug.print(" Release Id : "+objICPUser.getReleaseId());
        Debug.print(" Membership Status Id : "+objICPUser.getMembershipStatus());
        Debug.print(" Status : "+objICPUser.getRequestStatus());
        Debug.print("Comments Is :"+objICPUser.getComments());
        Debug.print(" remoteICPUser : "+remoteICPUser);
        remoteICPUser.setReleaseId(objICPUser.getReleaseId());
        remoteICPUser.setMembershipStatus(objICPUser.getMembershipStatus());
        remoteICPUser.setRequestStatus(objICPUser.getRequestStatus());
        remoteICPUser.setComments(objICPUser.getComments());
        
        return true;
    }
    /**
     * Name         :icpMeetingId
     * Description  :This method will check for the existing of memberId and call the findByPrimaryKey method
     * @ param      :None
     * @return      :boolean value
     * @throws      :none
     */
    private boolean ipcUserMemberIdExists(String releaseId) {
        boolean result =false;
        if ( !(releaseId.equals(this.releaseId)) ) {
            try {
                Debug.print("VaigaiSessionBean ipcUserMemberIdExists in side loop: "+releaseId);
                remoteICPUser = homeICPUser.findByPrimaryKey(releaseId);
                this.releaseId = releaseId;
                Debug.print("VaigaiSessionBean ipcUserMemberIdExists in side homeICP: "+ homeICP);
                /// Debug.print("Kavery Session Bean contactTypeIdExists in side remote: "+ remote);
                result =true;
            } catch (Exception ex) {
                result =true;
                System.out.println("Exception:" + ex);
            }
        }
        Debug.print("Kavery Session Bean ipcUserMemberIdExists  "+ result);
        return result;
    }
    //====================================================Suresh start Here =========================================
    public boolean createTicketDetails(String availTkt, String meetingTypeId) throws RemoteException{
        Debug.print("VaigaiSessionBean createTicketDetails  "+ meetingTypeId);
        boolean result = false;
        if(meetingTypeId!=null && meetingTypeId.trim().length()!=0){
            result = new HLCAnnualMeetingDAO().insertTicketDetails(availTkt,meetingTypeId);
        }
        return result;
    }
    
    public boolean updateTicketDetails(String annualTktId, String availTkt) throws RemoteException{
        Debug.print("VaigaiSessionBean updateTicketDetails annualTktId: "+ annualTktId);
        boolean result = false;
        if(annualTktId!=null && annualTktId.trim().length()!=0){
            result = new HLCAnnualMeetingDAO().updateTicketDetails(annualTktId,availTkt);
        }
        return result;
    }
    
    public String[] getTicketDetails(String annualTktId) throws RemoteException{
        Debug.print("VaigaiSessionBean getTicketDetails  " + annualTktId);
        String[] tkts= {};
        try {
            String tempTkts[] = (String[])new HLCAnnualMeetingDAO().selectMeetingTicket(annualTktId);
            tkts = tempTkts;
        }catch(Exception e){
            Debug.print("Exception in getTicketDetails:" + e);
        }
        return tkts;
    }
    
    public ArrayList getAllTicketDetails() throws RemoteException{
        Debug.print("VaigaiSessionBean getAllTicketDetails  ");
        ArrayList vObj = new ArrayList();
        try {
            vObj = (ArrayList)new HLCAnnualMeetingDAO().selectAllMeetingTicket();
        }catch(Exception e){
            Debug.print("Exception in getAllTicketDetails:" + e);
        }
        return vObj;
    }
    
    public ArrayList getAllSpecification() throws RemoteException{
        Debug.print("VaigaiSessionBean getAllSpecification  ");
        ArrayList vObj = new ArrayList();
        try {
            vObj = (ArrayList)new HLCAnnualMeetingDAO().selectAllSpecification();
        }catch(Exception e){
            Debug.print("Exception in getAllSpecification:" + e);
        }
        return vObj;
    }
    
    public ArrayList getAllAnnualDetails(String requestStatus) throws RemoteException {
        Debug.print("VaigaiSessionBean getAllAnnualDetails  ");
        ArrayList annualDetails = new ArrayList();
        try {
            annualDetails = (ArrayList)new HLCAnnualMeetingDAO().selectAllAnnualDetails(requestStatus);
        }catch(Exception e){
            Debug.print("Exception in getAllSpecification:" + e);
        }
        return annualDetails;
    }
    
    public ArrayList getAllAnnualDetailsForAdmin(String requestStatus) throws RemoteException {
        Debug.print("VaigaiSessionBean getAllAnnualDetailsForAdmin Status:" + requestStatus);
        ArrayList annualDetails = new ArrayList();
        try {
            annualDetails = (ArrayList)new HLCAnnualMeetingDAO().selectAllAnnualDetailsForAdminList(requestStatus);
        }catch(Exception e){
            Debug.print("Exception in getAllAnnualDetailsForAdmin:" + e.getMessage());
        }
        Debug.print("AnnualDetails.size()" + annualDetails.size()/2);
        return annualDetails;
    }
    
    public ArrayList getAllAnnualDetailsForAdminByRequestId(String requestStatus, int pNo) throws RemoteException {
        Debug.print("VaigaiSessionBean getAllAnnualDetailsForAdminByRequestId Status:" + requestStatus);
        ArrayList annualDetails = new ArrayList();
        try {
            annualDetails = (ArrayList)new HLCAnnualMeetingDAO().selectAnnualRegistrationDetailsByRequestStatus(requestStatus,pNo);
        }catch(Exception e){
            Debug.print("Exception in getAllAnnualDetailsForAdminByRequestId:" + e.getMessage());
        }
        Debug.print("getAllAnnualDetailsForAdminByRequestId.size()" + annualDetails.size());
        return annualDetails;
    }
    
    public int selectAnnualRegCount(String requestStatus) throws RemoteException{
            Debug.print("VaigaiSessionBean.selectAnnualRegCount() requestStatus:" + requestStatus);
            int rowCount = 0;
                       
            PreparedStatement prepStmt = null;
            ResultSet rs = null;
            makeConnection();
            try {
                
                 String selectStatement = " select count(*) from " +
                         DBHelper.USEA_ANNUAL_REGISTRATION + " A, " + DBHelper.USEA_MMS_USERMASTER + " B  , " +
                         " tblMeeAnnualDetails C  where A.user_id = B.user_id and A.annual_meeting_id = C.annual_meeting_id and " +
                         " A.request_status = ? ";
                
                Debug.print("selectStatement :"+selectStatement);
                 
                prepStmt = con.prepareStatement(selectStatement);
                prepStmt.setString(1,requestStatus);
                rs = prepStmt.executeQuery();
                
                if(rs.next()){
                    rowCount = rs.getInt(1);            
                }

                Debug.print("Row Count is :" + rowCount);
                rs.close();
                prepStmt.close();
                releaseConnection();
                
            }
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in VaigaiSessionBean.selectAnnualRegCount():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in VaigaiSessionBean.selectAnnualRegCount():" + e.getMessage());
        }
        return rowCount;
    }
    
    
    public ArrayList getAnnualDetailsByMeetingId(String annualMeetingId) throws RemoteException{
        Debug.print("VaigaiSessionBean getAnnualDetailsByMeetingId  " + annualMeetingId);
        ArrayList annualMeetingDetails = new ArrayList();
        try {
            annualMeetingDetails = (ArrayList)new HLCAnnualMeetingDAO().selectAnnualDetailsByMeetingId(annualMeetingId);
        }catch(Exception e){
            Debug.print("Exception in getAllSpecification:" + e);
        }
        return annualMeetingDetails;
        
    }
    
    
    
    
    public HLCAnnualRegistrationDetailVO getAnnualRegistrationDetails(String ard_id) throws RemoteException{
        Debug.print("VaigaiSessionBean getAnnualDetailsByMeetingId  " + ard_id);
        HLCAnnualRegistrationDetailVO annualMeetingDetails = new HLCAnnualRegistrationDetailVO();
        try {
            annualMeetingDetails = new HLCAnnualMeetingDAO().selectAnnualDetailsByAnnualId(ard_id);
        }catch(Exception e){
            Debug.print("Exception in getAllSpecification:" + e);
        }
        return annualMeetingDetails;
    }
    
    public ArrayList getAnnualDetailsByUserId(String userId) throws RemoteException {
        Debug.print("VaigaiSessionBean getAnnualDetailsByUserId  " + userId);
        ArrayList annualDetList  = new ArrayList();
        try {
            annualDetList = (ArrayList)new HLCAnnualMeetingDAO().selectAnnualRegistrationDetailsByUserId(userId);
        }catch(Exception e){
            Debug.print("Exception in getAllSpecification:" + e);
        }
        return annualDetList;
    }
    
    public ArrayList getMyAnnualDetails(String userId) throws RemoteException {
        Debug.print("VaigaiSessionBean getMyAnnualDetails  " + userId);
        ArrayList annualDetList  = new ArrayList();
        try {
            annualDetList = (ArrayList)new HLCAnnualMeetingDAO().selectMyAnnualDetailsByUserId(userId);
        }catch(Exception e){
            Debug.print("Exception in getMyAnnualDetails:" + e);
        }
        return annualDetList;
    }
    
    
    public ArrayList getAnnualPriceDetailsByAnnualId(String ardId) throws RemoteException {
        Debug.print("VaigaiSessionBean getAnnualPriceDetailsByAnnualId  " + ardId);
        ArrayList annualDetList  = new ArrayList();
        try {
            annualDetList = (ArrayList)new HLCAnnualMeetingDAO().selectAnnualRegistrationPriceDetailsByAnnRegId(ardId);
        }catch(Exception e){
            Debug.print("Exception in getAnnualPriceDetailsByAnnualId:" + e);
        }
        return annualDetList;
    }
    
// Hari for additional details
    
    public String registerAdditionalTickets(HLCAdditionalTcktVO tcktVO) throws RemoteException {
        boolean result = false;
        String meetingId = "";
        try{
            HLCAnnualMeetingDAO dao = new HLCAnnualMeetingDAO();
            
            Debug.print("registerAdditionalTickets ");
            
            String registrarId = tcktVO.getUser_id();
            String addTckts = tcktVO.getTickets();
            String totAmt = tcktVO.getRegi_Amount();
            String paymentId = tcktVO.getPaymentId();
            String requestStatus = "Pending";
            String badgeName = tcktVO.getBadgeInfo();
            String daysApplied = tcktVO.getDaysApplied();
            boolean poniClubStatus = tcktVO.isPoniClubStatus();
            String poniClubMemberId = tcktVO.getPoniClubMemberId();
            String clubName = tcktVO.getClubName();
            boolean accomFaciStaus = tcktVO.isAccomFaciStaus();
            String accomodation = tcktVO.getAccomodation();
            String tempMember = tcktVO.getTempMember();
            String no_tckts = tcktVO.getNo_of_tickets();
            ArrayList priceids = tcktVO.getPriceIds();
            
            // Inserting annual details
            meetingId = dao.insertAnnualDetails(registrarId, addTckts, totAmt, requestStatus, paymentId);
            Debug.print("registerAdditionalTickets Meeting Id is "+meetingId);
            
            double d_totAmt = 0;
            if(amount!=null){
                d_totAmt = Double.parseDouble(amount);
            }
            Debug.print("registerAdditionalTickets Total Amount"+ d_totAmt);
            Debug.print("registerAdditionalTickets priceids size "+ priceids.size());
            Iterator itr = priceids.iterator();
            String ard_id="";
            
            if(meetingId!=null && meetingId.trim().length()!=0){
                
                ard_id=dao.insertAnnualRegistrationDetails(meetingId, registrarId, badgeName,"", daysApplied,d_totAmt,poniClubStatus, poniClubMemberId,clubName,accomFaciStaus, accomodation, tempMember);
                
                while(itr.hasNext()){
                    String[] idsVal = (String[]) itr.next();
                    String price_id = idsVal[0];
                    String tckt = idsVal[1];
                    String tcktAmt = idsVal[2];
                    
                    // Inserting annual registration details  registrarId
                    Debug.print("registerAdditionalTickets ard_id is "+ard_id);
                    
                    if(ard_id!=null && ard_id.trim().length()!=0){
                        // Inserting annual registration price details
                        result = dao.insertAnnualRegistrationPriceDetails(ard_id, price_id, tcktAmt,Integer.parseInt(tckt), false);
                        Debug.print("registerAdditionalTickets result of price detail insertion is "+result);
                    }
                }
            }
        } 
        catch(Exception e){
            e.printStackTrace();
            Debug.print("General Exception caused "+e);
        } 
        finally{
            Debug.print("Exiting from the method registerAdditionalTickets");
        }
        
        Debug.print("Returning the meeting Id "+meetingId);
        return meetingId;
    }
// Hari End additional Details    
    
    
    public String registerAnnualMeeting(String registrarDetails[], Enumeration userVOList,
            String paymentId, String addTktUserId, ArrayList addTktList) throws RemoteException{
        Debug.print("VaigaiSessionBean registerAnnualMeeting  ");
        boolean result = false;
        HLCAnnualMeetingDAO dao = new HLCAnnualMeetingDAO();
        try{
            if(userVOList!=null && registrarDetails!=null && registrarDetails.length!=0){
                String registrarId = registrarDetails[0];
                String noOfAddTickets = registrarDetails[1];
                String totalAmount = registrarDetails[2];
                String requestStatus = registrarDetails[3];
                if(registrarId!=null && registrarId.trim().length()!=0){
                    String meetingId = dao.insertAnnualDetails(registrarId, noOfAddTickets, totalAmount, requestStatus, paymentId);
                    Debug.print("               Vaigai Session Bean meetingId:" + meetingId);
                    if(meetingId!=null && meetingId.trim().length()!=0 && !meetingId.equals("0")){
                        Enumeration enumUserList = userVOList;
                        while(enumUserList.hasMoreElements()){
                            HLCAnnualUserVO objAnnualUser = (HLCAnnualUserVO) enumUserList.nextElement();
                            
                            String  userId = objAnnualUser.getUserId();
                            Debug.print("VaigaiSessionBean registerAnnualMeeting  userId:" + userId);
                            
                            String memberId = objAnnualUser.getMemberId();
                            String membershipTypeId = objAnnualUser.getMembershipTypeId();
                            String firstName = objAnnualUser.getFirstName();
                            String lastName = objAnnualUser.getLastName();
                            Date dob = objAnnualUser.getDob();
                            String gender = objAnnualUser.getGender();
                            String emailId = objAnnualUser.getEmailId();
                            String phoneNo = objAnnualUser.getPhoneNo();
                            String mobileNo = objAnnualUser.getMobileNo();
                            String faxNo = objAnnualUser.getFaxNo();
                            String address = objAnnualUser.getAddress();
                            String city = objAnnualUser.getCity();
                            String state = objAnnualUser.getState();
                            String country = objAnnualUser.getCountry();
                            String zip = objAnnualUser.getZip();
                            
                            String badgeName = objAnnualUser.getBadgeInfo();
                            String registerId = objAnnualUser.getRegisterId();
                            String daysApplied = objAnnualUser.getDaysApplied();
                            String areaIV = objAnnualUser.getAreaIV();
                            String yEndLauncheon = objAnnualUser.getYEndLauncheon();
                            String fameDinner = objAnnualUser.getFameDinner();
                            boolean poniClubStatus = objAnnualUser.isPoniClubStatus();
                            String poniClubMemberId = objAnnualUser.getPoniClubMemberId();
                            String clubName = objAnnualUser.getClubName();
                            boolean accomFaciStaus = objAnnualUser.isAccomFaciStaus();
                            String accomodation = objAnnualUser.getAccomodation();
                            String memberTypeName = objAnnualUser.getMemberTypeName();
                            double amount = objAnnualUser.getAmount();
                            double regAmount = objAnnualUser.getRegAmount();
                            ArrayList priceList = objAnnualUser.getPriceList();
                            String tempMember = memberTypeName;
                            
                            boolean userStatus = false;
                            
                            if(addTktUserId.equals(userId)){
                                userStatus = true;
                            }
                            
                            Debug.print("       userId:" + userId);
                            Debug.print("       addTktUserId:" + addTktUserId);
                            
                            
                            if(memberTypeName != null && memberTypeName.trim().equals("New User")){
                                userId = dao.insertUserDetails(firstName, lastName, dob,  gender, emailId);
                                boolean userReuslt = dao.insertContactDetails(userId, address, city,  state, country, zip, phoneNo, mobileNo, faxNo);
                                Debug.print("new user Registration :" + userReuslt);
                                tempMember = "Non Member";
                                //tempAddTktUserId = userId;
                            }
                            String ardId = "";
                            ardId = dao.insertAnnualRegistrationDetails(meetingId, userId, badgeName,
                                    registerId, daysApplied, amount, poniClubStatus, poniClubMemberId,
                                    clubName, accomFaciStaus, accomodation, tempMember);
                            Debug.print("ardId:" + ardId);
                            
                            if(registerId!=null && registerId.trim().length()!=0 && regAmount!=0){
                                boolean tempResult = dao.insertAnnualRegistrationPriceDetails(ardId, registerId, String.valueOf(regAmount), 1, false);
                                Debug.print("     registerId result:" + tempResult);
                            }
                            
                            //String ardId ="";
                            boolean annresult = false;
                            
                            Debug.print("      addTktList.size() in Vaigai:" + addTktList.size());
                            
                            if(userStatus==true && addTktList!=null && addTktList.size()!=0){
                                Iterator itTktList = addTktList.iterator();
                                while(itTktList.hasNext()){
                                    String strTktPriceList[] = (String[])itTktList.next();
                                    if(strTktPriceList!=null && strTktPriceList.length!=0){
                                        String addPriceId = strTktPriceList[0];
                                        String actTkt = strTktPriceList[1];
                                        String totTktAmt = strTktPriceList[2];
                                        int addTkt = Integer.parseInt(actTkt);
                                        Debug.print( "       addPriceId:" + addPriceId);
                                        Debug.print( "       addTkt:" + addTkt);
                                        Debug.print( "       totTktAmt:" + totTktAmt);
                                        
                                        //String tempAddTkt[] = {actCheckBox, actTkt, totTktAmt};
                                        //String priceAmount = "0";
                                        if(addPriceId!=null && addPriceId.trim().length()!=0){
                                            boolean addTktResult = dao.insertAnnualRegistrationPriceDetails(ardId, addPriceId, totTktAmt, addTkt, true);
                                            Debug.print("Addtional Tkt result:" + addTktResult);
                                        }
                                    }
                                }
                            }
                            
                            if(priceList!=null && priceList.size()!=0 && ardId!=null && ardId.trim().length()!=0){
                                Iterator itPriceList = priceList.iterator();
                                while(itPriceList.hasNext()){
                                    String strPrice[] = (String[])itPriceList.next();
                                    if(strPrice!=null && strPrice.length!=0){
                                        String priceId = strPrice[0];
                                        String priceAmount = strPrice[1];
                                        //String priceAmount = "0";
                                        if(priceId!=null && priceId.trim().length()!=0){
                                            result = dao.insertAnnualRegistrationPriceDetails(ardId, priceId, priceAmount, 1, false);
                                            Debug.print("registerId result:" + result);
                                        }
                                    }
                                }
                            }
                        }
                        //while
                    }
                }
            }
        } catch(Exception e){
            Debug.print("Exception in registerAnnualMeeting" + e.getMessage());
        }
        return meetingId;
    }
    
    public String getNextId() throws RemoteException {
        Debug.print("VaigaiSessionBean Payment getNextId ");
        String nextPaymentId = "";
        try {
            nextPaymentId = new HLCAnnualMeetingDAO().getNextId();
        } catch(Exception e){
            Debug.print("Exception in getAllSpecification:" + e);
        }
        return nextPaymentId;
    }
    
    public boolean updateAnnualStatus(String annualMeetingId, String requestStatus, String comments) throws RemoteException{
        Debug.print("VaigaiSessionBean updateAnnualStatus  "+ annualMeetingId);
        boolean result = false;
        HLCAnnualMeetingDAO dao = new HLCAnnualMeetingDAO();
        if(annualMeetingId!=null && annualMeetingId.trim().length()!=0 && requestStatus!=null && requestStatus.trim().length()!=0){
            result = dao.updateStatus(annualMeetingId,requestStatus, comments);
            result = dao.updateMassApprovalStatus(annualMeetingId,requestStatus, comments);
        }
        return result;
    }
    
    public boolean updateRequestStatus(String ardId, String requestStatus, String comments) throws RemoteException{
        Debug.print("VaigaiSessionBean updateRequestStatus ardId: "+ ardId);
        boolean result = false;
        if(ardId!=null && ardId.trim().length()!=0 && requestStatus!=null && requestStatus.trim().length()!=0){
            result = new HLCAnnualMeetingDAO().updateRequestStatus(ardId,requestStatus, comments);
        }
        return result;
    }
    
    public HLCPaymentDetailVO getPaymentDetails(String paymentId, String userId) throws RemoteException{
        Debug.print("VaigaiSessionBean getStatusChange  "+ paymentId);
        HLCPaymentDetailVO objPayment = new HLCPaymentDetailVO();
        if(paymentId!=null && paymentId.trim().length()!=0 && userId!=null && userId.trim().length()!=0){
            try{
                objPayment = new HLCAnnualMeetingDAO().selectPaymentDetails(paymentId, userId);
            } catch(Exception e){
                Debug.print("Exception while getting payment details" + e.getMessage());
            }
        }
        return objPayment;
    }
    
    public HLCAnnualRegisterVO getAnnualRequestStatus(String annualMeetingId) throws RemoteException{
        Debug.print("VaigaiSessionBean getStatusChange  "+ annualMeetingId);
        HLCAnnualRegisterVO objAnnualUser = new HLCAnnualRegisterVO();
        if(annualMeetingId!=null && annualMeetingId.trim().length()!=0){
            try{
                objAnnualUser = new HLCAnnualMeetingDAO().selectAnnualRequestStatus(annualMeetingId);
            } catch(Exception e){
                Debug.print("Exception while getting payment details" + e.getMessage());
            }
        }
        return objAnnualUser;
    }
    
    public boolean updatePaymentStatus(String paymentId, String userId, String sslResult, String sslResultMessage,
            String  sslTxnId, String sslApprovalCode, String sslCvv2Response, String sslAvsResponse,
            String sslTransactionType, String sslInvoiceNo, String sslEmail, boolean activeStatus) throws RemoteException {
        Debug.print("VaigaiSessionBean updatePaymentStatus  paymentId:"+ paymentId);
        boolean result = false;
        if(paymentId!=null && paymentId.trim().length()!=0 && userId!=null && userId.trim().length()!=0){
            result = new HLCAnnualMeetingDAO().updatePaymentStatus(paymentId, userId, sslResult, sslResultMessage,
                    sslTxnId, sslApprovalCode, sslCvv2Response, sslAvsResponse,
                    sslTransactionType, sslInvoiceNo, sslEmail, activeStatus);
        }
        Debug.print("VaigaiSessionBean updatePaymentStatus  Result:"+ result);
        return result;
    }
    
    public String[] gettMerchantDetails() throws RemoteException{
        Debug.print("VaigaiSessionBean gettMerchantDetails ");
        String merchantDet[] = {};
        try {
            String[] tempMerchantDet = new HLCAnnualMeetingDAO().selectMerchantDetails();
            merchantDet = tempMerchantDet;
        } catch(Exception e){
            Debug.print("Exception in gettMerchantDetails:" + e);
        }
        return merchantDet;
    }
    
    public boolean updateMerchantDetails(String merchantId, String merchantLoginId, String  merchantUserId, String merchantPin) throws RemoteException{
        Debug.print("VaigaiSessionBean updateMerchantDetails  merchantId:"+ merchantId);
        boolean result = false;
        if(merchantId!=null && merchantId.trim().length()!=0 ){
            result = new HLCAnnualMeetingDAO().updateMerchantDetails(merchantId, merchantLoginId,  merchantUserId, merchantPin);
        }
        return result;
    }
    
    public String getMeetingId(String paymentId) throws RemoteException{
        Debug.print("VaigaiSessionBean getMeetingId ");
        String meetingId = null;
        try {
            if(paymentId!=null && paymentId.trim().length()!=0){
                meetingId = new HLCAnnualMeetingDAO().selectMeetingId(paymentId);
            }
        } catch(Exception e){
            Debug.print("Exception in getMeetingId:" + e);
        }
        return meetingId;
    }
    /**
     * Name         :deleteCompRegFileDetails
     * author       :punitha
     * Description  :This method will delete the Competition Reg File Details
     * @ param      :regUploadId
     * @return      :boolean
     * @throws      :RemoteException
     */
    
    public boolean deleteCompRegFileDetails(String regUploadId) throws RemoteException {
        Debug.print("Inside deleteCompRegFileDetails in session bean : ");
        Debug.print(" regUploadId in vagaisession bean : "+regUploadId);
        
        try {
            makeConnection();
            String insertStatement = "delete from tblMeeCompRegistrationFileDetails where reg_upload_id= ? ";
            prepStmt = con.prepareStatement(insertStatement);
            // prepStmt.setString(1, eventRegistrationTypeName);
            prepStmt.setString(1,regUploadId);
            
            int cnt = prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully deleted in deleteCompRegFileDetails() ......:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while deleting in deleteCompRegFileDetails : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return true;
    }
    
    /**
     * Name         :deleteCompRegMappedDatas
     * author       :punitha
     * Description  :This method will delete the Competition Reg Mapped Datas from the temp table
     * parm         :regUploadId
     * @return      :boolean
     * @throws      :RemoteException
     */
    
    public boolean deleteCompRegMappedDatas(String regUploadId) throws RemoteException {
        Debug.print("Inside deleteCompRegMappedDatas in vaigai session bean : ");
        Debug.print(" regUploadId in session bean : "+regUploadId);
        
        try {
            makeConnection();
            String insertStatement = "delete from tblMeeTempCompRegistrationDetails where reg_upload_id= ? ";
            prepStmt = con.prepareStatement(insertStatement);
            // prepStmt.setString(1, eventRegistrationTypeName);
            prepStmt.setString(1,regUploadId);
            
            int cnt = prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully deleted in deleteCompRegMappedDatas() row count .:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while deleting in deleteCompRegMappedDatas : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return true;
    }
    /**
     * Name         :insertCompResultUploadDetails
     * author       :punitha
     * Description  :This method will insert the uploaded competition result file details
     * @ param      :event_id,event_name,result_file_path,eventTypeId
     * @return      :String
     * @throws      :RemoteException
     */
    public String insertCompResultUploadDetails(String event_id,String event_name,String result_file_path,String eventTypeId) throws RemoteException {
        String result = "";
        
        Debug.print("Inside insertCompResultUploadDetails () : ");
        
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        
        try {
            result = compDao.insertCompResultUploadDetails(event_id,event_name,result_file_path,eventTypeId);
            Debug.print("compDao.insertCompResultUploadDetails() in session bean upload_id :"+result);
        } catch(Exception e){
            
            Debug.print("Error in session bean insertCompResultUploadDetails : "+e.getMessage());
        }
        
        return result;
    }
    
    /**
     * Name         :insertEventCompQualDetails
     * Description  :This method will insert the competition qualification details
     * @ param      :HLCEventCompQualDetVO
     * @return      :boolean
     * @throws      :RemoteException
     */
    public boolean insertEventCompQualDetails(HLCEventCompQualDetVO CompQualDetail) throws RemoteException {
        boolean result = false;
        
        Debug.print("Inside insertEventCompQualDetails () in session bean : ");
        
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        
        try {
            result = compDao.insertEventCompQualDetails(CompQualDetail);
            Debug.print("compDao.insertEventCompQualDetails() in session bean :"+result);
        } catch(Exception e){
            
            Debug.print("Error in session bean insertEventCompQualDetails : "+e.getMessage());
        }
        
        return result;
    }
    
    /**
     * Name         :createHorseRegUploadDetails
     * Description  :This method will insert the uploaded competition result file details
     * @ param      :event_id,event_name,result_file_path
     * @return      :String
     * @throws      :RemoteException
     */
    public String createHorseRegUploadDetails(String event_id,String eventTypeId,String registration_file_path) throws RemoteException {
        String result = "";
        Debug.print("Inside insertHorseRegUploadDetails () : " + event_id);
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        try {
            result = compDao.insertHorseRegUploadDetails(event_id,eventTypeId,registration_file_path);
            Debug.print("compDao.insertHorseRegUploadDetails() in session bean upload_id :"+result);
        } catch(Exception e){
            Debug.print("Error in session bean insertHorseRegUploadDetails : "+e.getMessage());
        }
        
        return result;
    }
    
    /**
     * Name         :getUploadHorseRegDetails
     * Description  :This method will return the uploaded competition result file details
     * @ param      :
     * @return      :ArrayList
     * @throws      :RemoteException
     */
    public ArrayList getUploadHorseRegDetails() throws RemoteException {
        Debug.print("Inside vaigaisession bean  getUploadHorseRegDetails () : ");
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        ArrayList compUploadDetail = new ArrayList();
        try {
            compUploadDetail = compDao.selectUploadHorseRegDetails();
            Debug.print("getUploadHorseRegDetails in vaigaisession bean compUploadDetail.size() : "+compUploadDetail.size());
        } catch(Exception e){
            Debug.print("Error in getUploadHorseRegDetails in vaigaisession bean : "+e.getMessage());
        }
        return compUploadDetail;
    }
    /**
     * Name         :createHorseRegMapData
     * Description  :This method will insert the mapped datas to the comp result table
     * Author       :Punitha
     * @ param      :HLCCompResultVO
     * @return      :boolean
     * @throws      :RemoteException
     */
    public boolean createHorseRegMapData(HLCMapHorseRegVO compRegVO) throws RemoteException{
        boolean stat = false;
        Debug.print("Inside getCompResultMappingTableDetails in session bean :");
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        try {
            stat = compDao.insertHorseRegMapData(compRegVO);
        } catch(Exception e){
            
            Debug.print("Error in session bean insertCompResultUploadDetails : "+e.getMessage());
        }
        return stat;
    }
    /**
     * Name         :changeMapStatus
     * Description  :This method will change the active (map)status in db.
     * @ param      :regUploadId
     * @return      :boolean
     * @throws      :RemoteException
     */
    public boolean changeMapStatus(String regUploadId) throws RemoteException{
        boolean stat = false;
        Debug.print("Inside changeMapStatus in session bean :" + regUploadId);
        try {
            makeConnection();
            String insertStatement = "UPDATE tblMeeCompRegistrationFileDetails SET  active_status = ? WHERE  reg_upload_id = ? ";
            prepStmt = con.prepareStatement(insertStatement);
            Debug.print(" insertStatement :"+insertStatement);
            
            prepStmt.setBoolean(1, true);
            prepStmt.setString(2, regUploadId);
            
            int cnt = prepStmt.executeUpdate();
            
            if(cnt>0)
                stat = true;
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully Updated into changeMapStatus vaigaiSessionBean......:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while Updating changeMapStatus vaigaiSessionBean: "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return stat;
    }
    /**
     * Name         :getCompResultMappingTableDetails
     * Description  :This method will retrieve the result set meta data for the mapping table
     * @ param      : upload_id
     * @return      :ArrayList
     * @throws      :RemoteException
     */
    public ArrayList getCompResultMappingTableDetails(String upload_id) throws RemoteException{
        Debug.print("Inside getCompResultMappingTableDetails in session bean ");
        Debug.print("Inside getCompResultMappingTableDetails in session bean upload_id :"+upload_id);
        
        ArrayList tblDetails = new ArrayList();
        
        try {
            HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
            tblDetails = compDao.getCompResultMappingTableDetails(upload_id);
            Debug.print("tblDetails.size() :"+tblDetails.size());
            
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while retrieving getCompResultMappingTableDetails in session bean : "+e.getMessage());
        }
        return tblDetails;
    }
    
    /**
     * Name         :getHorseRegMappingTableDetails
     * Description  :This method will retrieve the result set meta data for the mapping table
     * @ param      :
     * @return      :ArrayList
     * @throws      :RemoteException
     */
    public ArrayList getHorseRegMappingTableDetails() throws RemoteException{
        Debug.print("Inside getHorseRegMappingTableDetails in session bean ");
        ArrayList tblDetails = new ArrayList();
        
        try {
            HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
            tblDetails = compDao.selectHorseRegMappingTableDetails();
            Debug.print("tblDetails.size() :"+tblDetails.size());
            
        }catch(SQLException e){
            releaseConnection();
            Debug.print("Error while retrieving getHorseRegMappingTableDetails : "+e.getMessage());
        }
        return tblDetails;
    }
    
    /**
     * Name         :listCompResultUploadDetails
     * Description  :This method will return the uploaded competition result file details
     * @ param      :
     * @return      :ArrayList
     * @throws      :RemoteException
     */
    public ArrayList listCompResultUploadDetails() throws RemoteException {
        
        Debug.print("Inside listCompResultUploadDetails () in session bean : ");
        
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        ArrayList compUploadDetail = new ArrayList();
        
        try {
            compUploadDetail = compDao.listCompResultUploadDetails();
            Debug.print("compUploadDetail.size() : "+compUploadDetail.size());
        } catch(Exception e){
            
            Debug.print("Error in session bean insertCompResultUploadDetails : "+e.getMessage());
        }
        
        return compUploadDetail;
    }
    
    /**
     * Name         :listCompResultUploadDetailsOnYear
     * Description  :This method will return the uploaded competition result file details
     * @ param      :
     * @return      :ArrayList
     * @throws      :RemoteException
     */
    public ArrayList listCompResultUploadDetailsOnYear(String year) throws RemoteException {
        
        Debug.print("Inside listCompResultUploadDetails () in session bean year : "+year);
        
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        ArrayList compUploadDetail = new ArrayList();
        
        try {
            compUploadDetail = compDao.listCompResultUploadDetailsOnYear(year);
            Debug.print("compUploadDetail.size() : "+compUploadDetail.size());
            } 
        catch(Exception e){            
            Debug.print("Error in session bean listCompResultUploadDetailsOnYear : "+e.getMessage());
        }
        
        return compUploadDetail;
    }
    
    /**
     * Name         :insertCompMapData
     * Description  :This method will insert the mapped datas to the comp result table
     * @ param      :HLCCompResultVO
     * @return      :boolean
     * @throws      :RemoteException
     */
    public boolean insertCompMapData(HLCCompResultVO HLCCompResultVO) throws RemoteException{
        
        boolean stat = false;
        Debug.print("Inside getCompResultMappingTableDetails in session bean :");
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        
        try {
            stat = compDao.insertCompMapData(HLCCompResultVO);
        } catch(Exception e){
            
            Debug.print("Error in session bean insertCompResultUploadDetails : "+e.getMessage());
        }
        
        return stat;
    }
    
    /**
     * Name         :insertCompMapData
     * Description  :This method will insert the mapped datas to the comp result table
     * @ param      :HLCCompResultVO
     * @return      :boolean
     * @throws      :RemoteException
     */
    public boolean changeEventMapStatus(String uploadId) throws RemoteException{
        
        boolean stat = false;
        
        Debug.print("Inside changeEventMapStatus in session bean :");
        Debug.print("changeEventMapStatus(String uploadId) :"+uploadId);
        
        try {
            makeConnection();
            String insertStatement = "UPDATE " + DBHelper.USEA_COMP_RESULT_FILE_DETAILS + " SET  active_status = ? WHERE  upload_id = ? ";
            prepStmt = con.prepareStatement(insertStatement);
            Debug.print(" insertStatement :"+insertStatement);
            
            prepStmt.setBoolean(1, true);
            prepStmt.setString(2, uploadId);
            
            int cnt = prepStmt.executeUpdate();
            
            if(cnt>0)
                stat = true;
            
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully Updated into changeEventMapStatus......:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while Updating changeEventMapStatus : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return stat;
    }
    
    /**
     * Name         :getEventTypeDetails
     * Description  :This method will return the Event Type Details
     * @ param      :
     * @return      :ArrayList
     * @throws      :RemoteException
     */
    
    public ArrayList getEventTypeDetails() throws RemoteException {
        Debug.print("Inside getEventTypeDetails in session bean : ");
        ArrayList eventTypeDetails = new ArrayList();
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();
        
        try {
            eventTypeDetails = compDao.getEventTypeDetails();
            
        }catch(Exception e){
            Debug.print("Error while retrieving getEventTypeDetails in session bean : "+e.getMessage());
        }
        
        return eventTypeDetails;
    }
    
    /**
  * Name         :insertCompResultDetailsByQuery
  * Description  :This method will insert the uploaded competition result sdetails
  * @ param      :String
  * @return      :boolean
  * @throws      :RemoteException
  */   
    
    public boolean insertCompResultDetailsByQuery(String query) throws RemoteException {
        Debug.print("Inside insertCompResultDetailsByQuery in session bean : ");
        boolean stat = false;
        
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();        
        try {
            stat = compDao.insertCompResultDetailsByQuery(query);
            
        }catch(Exception e){
            Debug.print("Error while retrieving insertCompResultDetailsByQuery in session bean : "+e.getMessage());
        }  
        
        return stat;
    }
    
    /**
     * Name         :deleteCompResultFileDetails
     * Description  :This method will delete the Competition Result File Details
     * @ param      :
     * @return      :boolean
     * @throws      :RemoteException
     */
    
    public boolean deleteCompResultFileDetails(String uploadId) throws RemoteException {
        Debug.print("Inside deleteCompResultFileDetails in session bean : ");
        Debug.print(" uploadId in session bean : "+uploadId);
        
        try {
            makeConnection();
            String insertStatement = "delete from "+DBHelper.USEA_COMP_RESULT_FILE_DETAILS+" where upload_id= ? ";
            prepStmt = con.prepareStatement(insertStatement);
            // prepStmt.setString(1, eventRegistrationTypeName);
            prepStmt.setString(1,uploadId);
            
            int cnt = prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully deleted in deleteCompResultFileDetails() ......:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while deleting in deleteCompResultFileDetails : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return true;
    }
    
    /**
     * Name         :deleteCompResultMappedDatas
     * Description  :This method will delete the Competition Result Mapped Datas from the temp table
     * @ param      :
     * @return      :boolean
     * @throws      :RemoteException
     */
    
    public boolean deleteCompResultMappedDatas(String uploadId) throws RemoteException {
        Debug.print("Inside deleteCompResultMappedDatas in session bean : ");
        Debug.print(" uploadId in session bean : "+uploadId);
        
        try {
            makeConnection();
            String insertStatement = "delete from "+DBHelper.USEA_TEMP_COMP_RESULT+" where upload_id= ? ";
            prepStmt = con.prepareStatement(insertStatement);
            // prepStmt.setString(1, eventRegistrationTypeName);
            prepStmt.setString(1,uploadId);
            
            int cnt = prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully deleted in deleteCompResultMappedDatas() row count .:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while deleting in deleteCompResultMappedDatas : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return true;
    }
    
    /**
  * Name         :getExceptionReport
  * Description  :This method will return the validated datas for competition registration
  * @ param      :uploadId
  * @return      :ArrayList
  * @throws      :Exception
  */
    
    public ArrayList getExceptionReport(String uploadId) throws RemoteException{
        Debug.print("Inside getExceptionReport in VaigaiSessionBean uploadId: " + uploadId);
        ArrayList exceptionList = new ArrayList();
        HLCValidateDAO vDAO = new HLCValidateDAO();
        try {
            ArrayList rs = vDAO.selectCompetitionReg(uploadId);
            if(rs!=null && rs.size()!=0){
                Iterator itRs = rs.iterator();
                while(itRs.hasNext()){
                    HLCValidateCompRegVO valCompRegVO = new HLCValidateCompRegVO();
                    HLCCompRegVO comRegVO = (HLCCompRegVO) itRs.next();
                    // ====================Getting Data From TempTable=========================================
                    String horseName = comRegVO.getHorseName();
                    String horseId = comRegVO.getHorseMemberId();
                    String riderFName = comRegVO.getRiderFirstName();
                    String riderLName = comRegVO.getRiderLastName();
                    String riderMemberId = comRegVO.getRiderMemberId();
                    
                    Debug.print("horseName:" + horseName);
                    Debug.print("horseId:" + horseId);
                    Debug.print("riderMemberId::" + riderMemberId);
                    
                    valCompRegVO.setHorseName(horseName);
                    valCompRegVO.setHorseMemberId(horseId);
                    valCompRegVO.setRiderMemberId(riderMemberId);
                    valCompRegVO.setRiderFName(riderFName);
                    valCompRegVO.setRiderLName(riderLName);
                    valCompRegVO.setTmpRegistrationId(comRegVO.getTmpRegistrationId());
                    valCompRegVO.setEventId(comRegVO.getEventId());
                    valCompRegVO.setEventType(comRegVO.getEventType());
                    valCompRegVO.setEventLevel(comRegVO.getEventLevel());
                    valCompRegVO.setEventDivisionAmateur(comRegVO.getEventDivisionAmateur());
                    valCompRegVO.setEventDivisionAge(comRegVO.getEventDivisionAge());
                    valCompRegVO.setEventDivisionExperience(comRegVO.getEventDivisionExperience());
                    valCompRegVO.setHorseUsefId(comRegVO.getHorseUsefId());
                    valCompRegVO.setRiderUsefId(comRegVO.getRiderUsefId());
                    valCompRegVO.setOwnerFirstName(comRegVO.getOwnerFirstName());
                    valCompRegVO.setOwnerLastName(comRegVO.getOwnerLastName());
                    valCompRegVO.setOwnerUseaId(comRegVO.getOwnerUseaId());
                    valCompRegVO.setOwnerUsefId(comRegVO.getOwnerUsefId());
                    
                    // =============================================================
                    
                    ArrayList horseList = new ArrayList();
                    ArrayList riderList = new ArrayList();
                    ArrayList relationList = new ArrayList();
                    
                    boolean passStatus = false;
                    
                    boolean canadaStatus = false;
                    
                    if(horseId != null && riderMemberId != null)
                    {
                    if((horseId.equalsIgnoreCase("CAN") || riderMemberId.equalsIgnoreCase("CAN")))
                    {
                        Debug.print("Inside Canada Eventing Association block so no validation :");
                        Debug.print("horseId :"+horseId);
                        Debug.print("riderMemberId :"+riderMemberId);
                        
                        String riderStateCode = "";
                        relationList = new ArrayList();
                        
                        riderStateCode = getRiderStateCode(riderMemberId);
                        
                        //String[] result = {competition_name, horse_member_id ,firstName, lastName, riderId};
                        String[] result = {horseName,horseId,riderFName,riderLName,riderMemberId,riderStateCode};
                        relationList.add(result);
                        
                        valCompRegVO.setRelationList(relationList);
                        
                        canadaStatus = true;
                    }
                    }
                    
                    if(canadaStatus == false)
                    {                    
                    // ====================== Validating Horse and Rider in First Pass, Case 1 =======================================
                                       
                    if(horseName!=null && horseName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                            
                        Debug.print("getExceptionReportForHorseNameFirstPassOne Calling");
                        horseList = getExceptionReportForHorseNameFirstPassOne(horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassOne horseList.size() :"+horseList.size());
                    }
                                        
                    if(riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                                
                        Debug.print("getExceptionReportForHorseNameFirstPassOne Calling");
                        riderList = getExceptionReportForRiderFirstPassOne(riderMemberId, riderFName, riderLName);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassOne riderList.size() :"+riderList.size());
                    }
                    
                    if(horseList.size()>0 && riderList.size()>0)
                    {   
                        relationList = new ArrayList();
                        
                        Debug.print(" :::::: inside First Pass, Case 1 (horseList.size()>0 && riderList.size()>0) block ::::::");
                        
                        String[] horse = (String[])horseList.get(0);
                        String[] rider = (String[])riderList.get(0);
                        
                        String riderStateCode = "";
                        
                        riderStateCode = getRiderStateCode(rider[2]);
                        
                        String[] result = {horse[1],horse[0],rider[0],rider[1],rider[2],riderStateCode};
                        
                        relationList.add(result);
                        valCompRegVO.setRelationList(relationList);
                            
                        passStatus = true;
                        
                    }
                    
                    Debug.print("Validating Horse and Rider in First Pass, Case 1 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider in First Pass, Case 2 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseNameFirstPassTwo Calling");
                        horseList = getExceptionReportForHorseNameFirstPassTwo(horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassTwo horseList.size() :"+horseList.size());
                    }
                                        
                    if(riderFName!=null && riderFName.trim()!=null) {
                        
                        riderList = new ArrayList();
                        
                        Debug.print("getExceptionReportForRiderFirstPassTwo Calling");
                        riderList = getExceptionReportForRiderFirstPassTwo(riderMemberId, riderFName, riderLName);
                        
                        Debug.print("getExceptionReportForRiderFirstPassTwo riderList.size() :"+riderList.size());
                    }
                    
                    if(horseList.size()>0 && riderList.size()>0)
                    {
                        relationList = new ArrayList();
                        
                        Debug.print(" :::::: inside First Pass, Case 2 (horseList.size()>0 && riderList.size()>0) block ::::::");
                                                        
                        String[] horse = (String[])horseList.get(0);
                        String[] rider = (String[])riderList.get(0);
                        
                        String riderStateCode = "";
                        
                        riderStateCode = getRiderStateCode(rider[2]);
                        
                        String[] result = {horse[1],horse[0],rider[0],rider[1],rider[2],riderStateCode};
                        
                        relationList.add(result);
                        valCompRegVO.setRelationList(relationList);
                        
                        passStatus = true;                        
                    }
                    
                    }
                    
                    Debug.print("Validating Horse and Rider in First Pass, Case 2 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider in First Pass, Case 3 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseNameFirstPassThree Calling");
                        horseList = getExceptionReportForHorseNameFirstPassThree(horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassThree horseList.size() :"+horseList.size());
                    }
                                        
                    if(riderFName!=null && riderFName.trim()!=null) {
                                                
                        riderList = new ArrayList();
                        
                        Debug.print("getExceptionReportForRiderFirstPassThree Calling");
                        riderList = getExceptionReportForRiderFirstPassThree(riderMemberId, riderFName, riderLName);
                        
                        Debug.print("getExceptionReportForRiderFirstPassThree riderList.size() :"+riderList.size());
                    }
                    
                    if(horseList.size()>0 && riderList.size()>0)
                    {
                        relationList = new ArrayList();
                        
                        Debug.print(" :::::: inside First Pass, Case 3 (horseList.size()>0 && riderList.size()>0) block ::::::");
                                                
                        //String[] riderArray = {riderFName, riderLName, riderMemberId};
                        //String horseArray[] = {horseId, horseName};
                        //String[] result = {competition_name, horse_member_id ,firstName, lastName, riderId};
                        
                        String[] horse = (String[])horseList.get(0);
                        String[] rider = (String[])riderList.get(0);
                        
                        String riderStateCode = "";
                        
                        riderStateCode = getRiderStateCode(rider[2]);
                        
                        String[] result = {horse[1],horse[0],rider[0],rider[1],rider[2],riderStateCode};
                        
                        relationList.add(result);
                        valCompRegVO.setRelationList(relationList);
                        
                        passStatus = true;                        
                    }
                    
                    }
                    
                    Debug.print("Validating Horse and Rider in First Pass, Case 3 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Relationship in Second Pass, Case 1 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        relationList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseRelSecondPassOne() Calling");
                        relationList = getExceptionReportForHorseRelSecondPassOne(riderFName, riderLName, horseName);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassThree relationList.size() :"+relationList.size());
                    }
                    
                    if(relationList.size()>0)
                    {
                        Debug.print(" :::::: inside Second Pass, Case 1 (relationList.size()>0 && relationList.size()>0) block ::::::");
                        
                        ArrayList tempRelList = new ArrayList();
                        
                        for(int i=0;i<relationList.size();i++)
                        {
                            String[] tmpResult = (String[]) relationList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[4]);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[1]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],tmpResult[3],tmpResult[4],riderStateCode,ownerStateCode,tmpResult[5]};
                        
                            tempRelList.add(result);
                        }
                        
                        valCompRegVO.setRelationList(tempRelList);
                        
                        passStatus = true;                        
                    }
                    
                    }
                    
                    Debug.print("Validating Horse and Rider in Second Pass, Case 1 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Relationship in Second Pass, Case 2 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        relationList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseRelSecondPassTwo() Calling");                        
                        relationList = getExceptionReportForHorseRelSecondPassTwo(riderFName, riderLName, horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseRelSecondPassTwo relationList.size() :"+relationList.size());
                    }
                    
                    if(relationList.size()>0)
                    {
                        Debug.print(" :::::: inside Second Pass, Case 2 (relationList.size()>0 && relationList.size()>0) block ::::::");
                                                
                        ArrayList tempRelList = new ArrayList();
                        
                        for(int i=0;i<relationList.size();i++)
                        {
                            String[] tmpResult = (String[]) relationList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[4]);
                                                    
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[1]);
                            
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],tmpResult[3],tmpResult[4],riderStateCode,ownerStateCode,tmpResult[5]};
                                                    
                            tempRelList.add(result);
                        }
                        
                        valCompRegVO.setRelationList(tempRelList);
                        
                        passStatus = true;                        
                    }
                    
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Second Pass, Case 2 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Names individually in Third Pass, Case 1 =======================================
                    
                    boolean ridPassStat = false;
                    boolean horsePassStat = false;
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                             
                        horseList = getExceptionReportForHorseNameThirdPassOne(horseId,horseName);
                        Debug.print("getExceptionReportForHorseNameThirdPassOne horseList.size() :"+horseList.size());
                        
                        riderList = new ArrayList();
                        
                        riderList = getExceptionReportForRiderThirdPassOne(riderMemberId,riderFName,riderLName);
                        Debug.print("getExceptionReportForRiderThirdPassOne riderList.size() :"+riderList.size());
                    }
                    
                    ArrayList tempRidList = new ArrayList();
                    ArrayList tempHorseList = new ArrayList();
                    
                    if(riderList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 1 (riderList.size()>0) block ::::::");
                        
                        for(int i=0;i<riderList.size();i++)
                        {
                            String[] tmpResult = (String[]) riderList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[2]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],riderStateCode};
                        
                            tempRidList.add(result);
                        }
                    }
                    
                    if(horseList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 1 (horseList.size()>0) block ::::::");
                        
                        for(int i=0;i<horseList.size();i++)
                        {
                            String[] tmpResult = (String[]) horseList.get(i);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[0]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],ownerStateCode};
                        
                            //String[] result = {tmpResult[0],tmpResult[1]};
                            
                            tempHorseList.add(result);
                        }
                    }                        
                       if(horseList.size()>0)
                        {                          
                            horsePassStat = true;  
                            valCompRegVO.setHorseList(tempHorseList);
                        }
                        if(riderList.size()>0)
                        {                          
                            ridPassStat = true;
                            valCompRegVO.setRiderList(tempRidList);
                        }
                    
                        if(riderList.size()>0 && horseList.size()>0)
                        {
                            passStatus = true;
                        }
                       
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Third Pass, Case 1 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Names individually in Third Pass, Case 2 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                        riderList = new ArrayList();
                        
                        if(horsePassStat == false)
                        {
                            horseList = getExceptionReportForHorseNameThirdPassTwo(horseId,horseName);
                            Debug.print("getExceptionReportForHorseNameThirdPassTwo horseList.size() :"+horseList.size());
                        }    
                        
                        if(ridPassStat == false)
                        {
                            riderList = getExceptionReportForRiderThirdPassTwo(riderMemberId,riderFName,riderLName);
                            Debug.print("getExceptionReportForHorseNameThirdPassTwo riderList.size() :"+riderList.size());
                        }
                    }
                    
                    ArrayList tempRidList = new ArrayList();
                    ArrayList tempHorseList = new ArrayList();
                    
                    if(riderList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 2 (riderList.size()>0) block ::::::");
                        
                        for(int i=0;i<riderList.size();i++)
                        {
                            String[] tmpResult = (String[]) riderList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[2]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],riderStateCode};
                        
                            tempRidList.add(result);
                        }
                    }
                    
                    if(horseList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 2 (horseList.size()>0) block ::::::");
                        
                        for(int i=0;i<horseList.size();i++)
                        {
                            String[] tmpResult = (String[]) horseList.get(i);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[0]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],ownerStateCode};
                        
                           // String[] result = {tmpResult[0],tmpResult[1]};
                            
                            tempHorseList.add(result);
                        }
                    }
                    
                    
                    if(horseList.size()>0)
                        {                          
                            horsePassStat = true;  
                            valCompRegVO.setHorseList(tempHorseList);
                        }
                        if(riderList.size()>0)
                        {                          
                            ridPassStat = true;
                            valCompRegVO.setRiderList(tempRidList);
                        }
                    
                        if(riderList.size()>0 && horseList.size()>0)
                        {
                            passStatus = true;
                        }
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Third Pass, Case 2 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Names individually in Third Pass, Case 3 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                        riderList = new ArrayList();
                        
                        if(horsePassStat == false)
                        {
                            horseList = getExceptionReportForHorseNameThirdPassThree(horseName);
                            Debug.print("getExceptionReportForHorseNameThirdPassThree horseList.size() :"+horseList.size());
                        }
                        
                        if(ridPassStat == false)
                        {
                            riderList = getExceptionReportForRiderThirdPassThree(riderFName,riderLName);
                            Debug.print("getExceptionReportForRiderThirdPassThree riderList.size() :"+riderList.size());
                        }
                    }
                    
                    ArrayList tempRidList = new ArrayList();
                    ArrayList tempHorseList = new ArrayList();
                    
                    if(riderList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 3 (riderList.size()>0) block ::::::");
                        
                        for(int i=0;i<riderList.size();i++)
                        {
                            String[] tmpResult = (String[]) riderList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[2]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],riderStateCode};
                        
                            tempRidList.add(result);
                        }
                    }
                    
                    if(horseList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 3 (horseList.size()>0) block ::::::");
                        
                        for(int i=0;i<horseList.size();i++)
                        {
                            String[] tmpResult = (String[]) horseList.get(i);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[0]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],ownerStateCode};
                        
                           // String[] result = {tmpResult[0],tmpResult[1]};
                            
                            tempHorseList.add(result);
                        }
                    }
                    
                        if(horseList.size()>0)
                        {                          
                            horsePassStat = true;  
                            valCompRegVO.setHorseList(tempHorseList);
                        }
                        else if(valCompRegVO.getHorseList() == null)
                        {
                            valCompRegVO.setHorseList(tempHorseList);
                        }
                    
                        if(riderList.size()>0)
                        {                          
                            ridPassStat = true;
                            valCompRegVO.setRiderList(tempRidList);
                        }
                        else if(valCompRegVO.getRiderList() == null)
                        {
                            valCompRegVO.setRiderList(tempRidList);
                        }
                    
                        passStatus = true;                        
                    
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Second Pass, Case 3 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Relationship in Fourth Case if all failed =======================================
                    
                    if(passStatus == false)
                    {
                        relationList = new ArrayList();
                        valCompRegVO.setRelationList(relationList);   
                        
                        Debug.print("inside Validation failed at last pass Four :");
                    }                   
                    }                    
                    
                    exceptionList.add(valCompRegVO);                                                           
                }
            }
                        
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReport: "+e.getMessage());
        }
        return exceptionList;
    }
 
    /**
  * Name         :getExceptionReportForResult
  * Description  :This method will return the validated datas for competition result
  * @ param      :uploadId
  * @return      :ArrayList
  * @throws      :Exception
  */
    
    public ArrayList getExceptionReportForResult(String uploadId) throws RemoteException{
        Debug.print("Inside getExceptionReportForResult in VaigaiSessionBean uploadId: " + uploadId);
        ArrayList exceptionList = new ArrayList();
        HLCValidateDAO vDAO = new HLCValidateDAO();
        try {
            ArrayList rs = vDAO.selectCompetitionResultDetails(uploadId);
            if(rs!=null && rs.size()!=0){
                Iterator itRs = rs.iterator();
                while(itRs.hasNext()){
                    //HLCValidateCompRegVO valCompRegVO = new HLCValidateCompRegVO();
                    HLCCompResultVO comResVO = (HLCCompResultVO) itRs.next();
                    // ====================Getting Data From TempTable=========================================
                    String horseName = comResVO.getHorse_name();
                    String horseId = comResVO.getHorse_member_id();
                    String riderFName = comResVO.getRider_first_name();
                    String riderLName = comResVO.getRider_last_name();
                    String riderMemberId = comResVO.getRider_member_id();
                    
                    Debug.print("horseName :" + horseName);
                    Debug.print("horseId :" + horseId);
                    Debug.print("riderMemberId :" + riderMemberId);
                    Debug.print("riderFName :" + horseId);
                    Debug.print("riderLName :" + riderMemberId);
                    
                    /*valCompRegVO.setHorseName(horseName);
                    valCompRegVO.setHorseMemberId(horseId);
                    valCompRegVO.setRiderMemberId(riderMemberId);
                    valCompRegVO.setRiderFName(riderFName);
                    valCompRegVO.setRiderLName(riderLName);
                    valCompRegVO.setTmpRegistrationId(comRegVO.getTmpRegistrationId());
                    valCompRegVO.setEventId(comRegVO.getEventId());
                    valCompRegVO.setEventType(comRegVO.getEventType());
                    valCompRegVO.setEventLevel(comRegVO.getEventLevel());
                    valCompRegVO.setEventDivisionAmateur(comRegVO.getEventDivisionAmateur());
                    valCompRegVO.setEventDivisionAge(comRegVO.getEventDivisionAge());
                    valCompRegVO.setEventDivisionExperience(comRegVO.getEventDivisionExperience());
                    valCompRegVO.setHorseUsefId(comRegVO.getHorseUsefId());
                    valCompRegVO.setRiderUsefId(comRegVO.getRiderUsefId());
                    valCompRegVO.setOwnerFirstName(comRegVO.getOwnerFirstName());
                    valCompRegVO.setOwnerLastName(comRegVO.getOwnerLastName());
                    valCompRegVO.setOwnerUseaId(comRegVO.getOwnerUseaId());
                    valCompRegVO.setOwnerUsefId(comRegVO.getOwnerUsefId());*/
                    
                    // =============================================================
                    
                    ArrayList horseList = new ArrayList();
                    ArrayList riderList = new ArrayList();
                    ArrayList relationList = new ArrayList();
                    
                    boolean passStatus = false;
                    
                    boolean canadaStatus = false;
                    
                    if(horseId != null && riderMemberId != null)
                    {
                    if((horseId.equalsIgnoreCase("CAN") || riderMemberId.equalsIgnoreCase("CAN")))
                    {
                        Debug.print("Inside Canada Eventing Association block so no validation :");
                        Debug.print("horseId :"+horseId);
                        Debug.print("riderMemberId :"+riderMemberId);
                        
                        String riderStateCode = "";
                        relationList = new ArrayList();
                        
                        riderStateCode = getRiderStateCode(riderMemberId);
                        
                        String suffix="";
                        
                        //String[] result = {competition_name, horse_member_id ,firstName, lastName, riderId};
                        String[] result = {horseName,horseId,riderFName,riderLName,riderMemberId,riderStateCode,suffix};
                        relationList.add(result);
                        
                        comResVO.setRelationList(relationList);
                        
                        canadaStatus = true;
                    }
                    }
                    
                    if(canadaStatus == false)
                    {                    
                    // ====================== Validating Horse and Rider in First Pass, Case 1 =======================================
                                       
                    if(horseName!=null && horseName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                            
                        Debug.print("getExceptionReportForHorseNameFirstPassOne Calling");
                        horseList = getExceptionReportForHorseNameFirstPassOne(horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassOne horseList.size() :"+horseList.size());
                    }
                                        
                    if(riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                                
                        Debug.print("getExceptionReportForHorseNameFirstPassOne Calling");
                        riderList = getExceptionReportForRiderFirstPassOne(riderMemberId, riderFName, riderLName);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassOne riderList.size() :"+riderList.size());
                    }
                    
                    if(horseList.size()>0 && riderList.size()>0)
                    {   
                        relationList = new ArrayList();
                        
                        Debug.print(" :::::: inside First Pass, Case 1 (horseList.size()>0 && riderList.size()>0) block ::::::");
                        
                        String[] horse = (String[])horseList.get(0);
                        String[] rider = (String[])riderList.get(0);
                        
                        String riderStateCode = "";
                        
                        riderStateCode = getRiderStateCode(rider[2]);
                        
                        String[] result = {horse[1],horse[0],rider[0],rider[1],rider[2],riderStateCode,rider[3]};
                        
                        relationList.add(result);
                        comResVO.setRelationList(relationList);
                            
                        passStatus = true;
                        
                    }
                    
                    Debug.print("Validating Horse and Rider in First Pass, Case 1 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider in First Pass, Case 2 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseNameFirstPassTwo Calling");
                        horseList = getExceptionReportForHorseNameFirstPassTwo(horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassTwo horseList.size() :"+horseList.size());
                    }
                                        
                    if(riderFName!=null && riderFName.trim()!=null) {
                        
                        riderList = new ArrayList();
                        
                        Debug.print("getExceptionReportForRiderFirstPassTwo Calling");
                        riderList = getExceptionReportForRiderFirstPassTwo(riderMemberId, riderFName, riderLName);
                        
                        Debug.print("getExceptionReportForRiderFirstPassTwo riderList.size() :"+riderList.size());
                    }
                    
                    if(horseList.size()>0 && riderList.size()>0)
                    {
                        relationList = new ArrayList();
                        
                        Debug.print(" :::::: inside First Pass, Case 2 (horseList.size()>0 && riderList.size()>0) block ::::::");
                                                        
                        String[] horse = (String[])horseList.get(0);
                        String[] rider = (String[])riderList.get(0);
                        
                        String riderStateCode = "";
                        
                        riderStateCode = getRiderStateCode(rider[2]);
                        
                        String[] result = {horse[1],horse[0],rider[0],rider[1],rider[2],riderStateCode,rider[3]};
                        
                        relationList.add(result);
                        comResVO.setRelationList(relationList);
                        
                        passStatus = true;                        
                    }
                    
                    }
                    
                    Debug.print("Validating Horse and Rider in First Pass, Case 2 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider in First Pass, Case 3 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseNameFirstPassThree Calling");
                        horseList = getExceptionReportForHorseNameFirstPassThree(horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassThree horseList.size() :"+horseList.size());
                    }
                                        
                    if(riderFName!=null && riderFName.trim()!=null) {
                                                
                        riderList = new ArrayList();
                        
                        Debug.print("getExceptionReportForRiderFirstPassThree Calling");
                        riderList = getExceptionReportForRiderFirstPassThree(riderMemberId, riderFName, riderLName);
                        
                        Debug.print("getExceptionReportForRiderFirstPassThree riderList.size() :"+riderList.size());
                    }
                    
                    if(horseList.size()>0 && riderList.size()>0)
                    {
                        relationList = new ArrayList();
                        
                        Debug.print(" :::::: inside First Pass, Case 3 (horseList.size()>0 && riderList.size()>0) block ::::::");
                                                
                        //String[] riderArray = {riderFName, riderLName, riderMemberId};
                        //String horseArray[] = {horseId, horseName};
                        //String[] result = {competition_name, horse_member_id ,firstName, lastName, riderId};
                        
                        String[] horse = (String[])horseList.get(0);
                        String[] rider = (String[])riderList.get(0);
                        
                        String riderStateCode = "";
                        
                        riderStateCode = getRiderStateCode(rider[2]);
                        
                        String[] result = {horse[1],horse[0],rider[0],rider[1],rider[2],riderStateCode,rider[3]};
                        
                        relationList.add(result);
                        comResVO.setRelationList(relationList);
                        
                        passStatus = true;                        
                    }
                    
                    }
                    
                    Debug.print("Validating Horse and Rider in First Pass, Case 3 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Relationship in Second Pass, Case 1 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        relationList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseRelSecondPassOne() Calling");
                        relationList = getExceptionReportForHorseRelSecondPassOne(riderFName, riderLName, horseName);
                        
                        Debug.print("getExceptionReportForHorseNameFirstPassThree relationList.size() :"+relationList.size());
                    }
                    
                    if(relationList.size()>0)
                    {
                        Debug.print(" :::::: inside Second Pass, Case 1 (relationList.size()>0 && relationList.size()>0) block ::::::");
                        
                        ArrayList tempRelList = new ArrayList();
                        
                        for(int i=0;i<relationList.size();i++)
                        {
                            String[] tmpResult = (String[]) relationList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[4]);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[1]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],tmpResult[3],tmpResult[4],riderStateCode,ownerStateCode,tmpResult[5],tmpResult[6]};
                        
                            tempRelList.add(result);
                        }
                        
                        comResVO.setRelationList(tempRelList);
                        
                        passStatus = true;                        
                    }
                    
                    }
                    
                    Debug.print("Validating Horse and Rider in Second Pass, Case 1 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Relationship in Second Pass, Case 2 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        relationList = new ArrayList();
                                           
                        Debug.print("getExceptionReportForHorseRelSecondPassTwo() Calling");                        
                        relationList = getExceptionReportForHorseRelSecondPassTwo(riderFName, riderLName, horseName, horseId);
                        
                        Debug.print("getExceptionReportForHorseRelSecondPassTwo relationList.size() :"+relationList.size());
                    }
                    
                    if(relationList.size()>0)
                    {
                        Debug.print(" :::::: inside Second Pass, Case 2 (relationList.size()>0 && relationList.size()>0) block ::::::");
                                                
                        ArrayList tempRelList = new ArrayList();
                        
                        for(int i=0;i<relationList.size();i++)
                        {
                            String[] tmpResult = (String[]) relationList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[4]);
                                                    
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[1]);
                            
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],tmpResult[3],tmpResult[4],riderStateCode,ownerStateCode,tmpResult[5],tmpResult[6]};
                                                    
                            tempRelList.add(result);
                        }
                        
                        comResVO.setRelationList(tempRelList);
                        
                        passStatus = true;                        
                    }
                    
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Second Pass, Case 2 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Names individually in Third Pass, Case 1 =======================================
                    
                    boolean ridPassStat = false;
                    boolean horsePassStat = false;
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                                             
                        horseList = getExceptionReportForHorseNameThirdPassOne(horseId,horseName);
                        Debug.print("getExceptionReportForHorseNameThirdPassOne horseList.size() :"+horseList.size());
                        
                        riderList = new ArrayList();
                        
                        riderList = getExceptionReportForRiderThirdPassOne(riderMemberId,riderFName,riderLName);
                        Debug.print("getExceptionReportForRiderThirdPassOne riderList.size() :"+riderList.size());
                    }
                    
                    ArrayList tempRidList = new ArrayList();
                    ArrayList tempHorseList = new ArrayList();
                    
                    if(riderList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 1 (riderList.size()>0) block ::::::");
                        
                        for(int i=0;i<riderList.size();i++)
                        {
                            String[] tmpResult = (String[]) riderList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[2]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],riderStateCode,tmpResult[3]};
                        
                            tempRidList.add(result);
                        }
                    }
                    
                    if(horseList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 1 (horseList.size()>0) block ::::::");
                        
                        for(int i=0;i<horseList.size();i++)
                        {
                            String[] tmpResult = (String[]) horseList.get(i);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[0]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],ownerStateCode};
                        
                            //String[] result = {tmpResult[0],tmpResult[1]};
                            
                            tempHorseList.add(result);
                        }
                    }                        
                       if(horseList.size()>0)
                        {                          
                            horsePassStat = true;  
                            comResVO.setHorseList(tempHorseList);
                        }
                        if(riderList.size()>0)
                        {                          
                            ridPassStat = true;
                            comResVO.setRiderList(tempRidList);
                        }
                    
                        if(riderList.size()>0 && horseList.size()>0)
                        {
                            passStatus = true;
                        }
                       
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Third Pass, Case 1 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Names individually in Third Pass, Case 2 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                        riderList = new ArrayList();
                        
                        if(horsePassStat == false)
                        {
                            horseList = getExceptionReportForHorseNameThirdPassTwo(horseId,horseName);
                            Debug.print("getExceptionReportForHorseNameThirdPassTwo horseList.size() :"+horseList.size());
                        }    
                        
                        if(ridPassStat == false)
                        {
                            riderList = getExceptionReportForRiderThirdPassTwo(riderMemberId,riderFName,riderLName);
                            Debug.print("getExceptionReportForHorseNameThirdPassTwo riderList.size() :"+riderList.size());
                        }
                    }
                    
                    ArrayList tempRidList = new ArrayList();
                    ArrayList tempHorseList = new ArrayList();
                    
                    if(riderList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 2 (riderList.size()>0) block ::::::");
                        
                        for(int i=0;i<riderList.size();i++)
                        {
                            String[] tmpResult = (String[]) riderList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[2]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],riderStateCode,tmpResult[3]};
                        
                            tempRidList.add(result);
                        }
                    }
                    
                    if(horseList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 2 (horseList.size()>0) block ::::::");
                        
                        for(int i=0;i<horseList.size();i++)
                        {
                            String[] tmpResult = (String[]) horseList.get(i);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[0]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],ownerStateCode};
                        
                           // String[] result = {tmpResult[0],tmpResult[1]};
                            
                            tempHorseList.add(result);
                        }
                    }
                    
                    
                    if(horseList.size()>0)
                        {                          
                            horsePassStat = true;  
                            comResVO.setHorseList(tempHorseList);
                        }
                        if(riderList.size()>0)
                        {                          
                            ridPassStat = true;
                            comResVO.setRiderList(tempRidList);
                        }
                    
                        if(riderList.size()>0 && horseList.size()>0)
                        {
                            passStatus = true;
                        }
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Third Pass, Case 2 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Names individually in Third Pass, Case 3 =======================================
                    
                    if(passStatus == false)
                    {
                    
                    if(horseName!=null && horseName.trim()!=null && riderFName!=null && riderFName.trim()!=null) {
                        
                        horseList = new ArrayList();
                        riderList = new ArrayList();
                        
                        if(horsePassStat == false)
                        {
                            horseList = getExceptionReportForHorseNameThirdPassThree(horseName);
                            Debug.print("getExceptionReportForHorseNameThirdPassThree horseList.size() :"+horseList.size());
                        }
                        
                        if(ridPassStat == false)
                        {
                            riderList = getExceptionReportForRiderThirdPassThree(riderFName,riderLName);
                            Debug.print("getExceptionReportForRiderThirdPassThree riderList.size() :"+riderList.size());
                        }
                    }
                    
                    ArrayList tempRidList = new ArrayList();
                    ArrayList tempHorseList = new ArrayList();
                    
                    if(riderList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 3 (riderList.size()>0) block ::::::");
                        
                        for(int i=0;i<riderList.size();i++)
                        {
                            String[] tmpResult = (String[]) riderList.get(i);
                            
                            String riderStateCode = "";
                        
                            riderStateCode = getRiderStateCode(tmpResult[2]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],tmpResult[2],riderStateCode,tmpResult[3]};
                        
                            tempRidList.add(result);
                        }
                    }
                    
                    if(horseList.size()>0)
                    {
                        Debug.print(" :::::: inside Third Pass, Case 3 (horseList.size()>0) block ::::::");
                        
                        for(int i=0;i<horseList.size();i++)
                        {
                            String[] tmpResult = (String[]) horseList.get(i);
                            
                            String ownerStateCode = "";
                        
                            ownerStateCode = getOwnerStateCode(tmpResult[0]);
                        
                            String[] result = {tmpResult[0],tmpResult[1],ownerStateCode};
                        
                           // String[] result = {tmpResult[0],tmpResult[1]};
                            
                            tempHorseList.add(result);
                        }
                    }
                    
                        if(horseList.size()>0)
                        {                          
                            horsePassStat = true;  
                            comResVO.setHorseList(tempHorseList);
                        }
                        else if(comResVO.getHorseList() == null)
                        {
                            comResVO.setHorseList(tempHorseList);
                        }
                    
                        if(riderList.size()>0)
                        {                          
                            ridPassStat = true;
                            comResVO.setRiderList(tempRidList);
                        }
                        else if(comResVO.getRiderList() == null)
                        {
                            comResVO.setRiderList(tempRidList);
                        }
                    
                        passStatus = true;                        
                    
                    }                   
                    
                    Debug.print("Validating Horse and Rider in Second Pass, Case 3 passStatus :"+passStatus);
                    
                    // ====================== Validating Horse and Rider Relationship in Fourth Case if all failed =======================================
                    
                    if(passStatus == false)
                    {
                        relationList = new ArrayList();
                        comResVO.setRelationList(relationList);   
                        
                        Debug.print("inside Validation failed at last pass Four :");
                    }                   
                    }                    
                    
                    Debug.print("in VaigaiSessionBean.getExceptionReportForResult validated record No :"+exceptionList.size());
                    exceptionList.add(comResVO);                                                           
                }
            }
                        
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForResult: "+e.getMessage());
        }
        return exceptionList;
    }
    
  public ArrayList getExceptionReportForHorseNameFirstPassOne(String horseName, String horseId) throws RemoteException{
        Debug.print("Inside getExceptionReportForHorseNameFirstPassOne Called  horseName: " + horseName);
        Debug.print("Inside getExceptionReportForHorseNameFirstPassOne Called  horseId: " + horseId);
        
        ArrayList horseList = new ArrayList();
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
           
            if(horseId!=null && horseId.trim().length()!=0 && horseName!=null && horseName.trim().length()!=0){
                Debug.print("Horse ID & Horse Name are not Empty");
                
                boolean horseMemberResult = vHrDAO.isHorseMemberExist(horseId, horseName);
                if(horseMemberResult==true){
                    Debug.print("Horse Name And ID is Match");
                    
                    String horseArray[] = {horseId, horseName};
                    horseList.add(horseArray);
                } 
            }
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForHorseNameFirstPassOne: "+e.getMessage());
        }
        return horseList;
    }
   
    public ArrayList getExceptionReportForRiderFirstPassOne(String riderMemberId, String riderFName, String riderLName) throws RemoteException {
        Debug.print("Inside getExceptionReportForRiderFirstPassOne Called : ");
        ArrayList riderList = new ArrayList();
        String suffix = "";
        
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
            
            if(riderMemberId!=null && riderMemberId.trim().length()!=0 && riderFName!=null && riderFName.trim().length()!=0 &&
                    riderLName!=null && riderLName.trim().length()!=0 ){
                Debug.print("Rider Id is Match");
                boolean riderMemberResult = vHrDAO.isRiderNameIDExist(riderMemberId, riderFName, riderLName);
                if(riderMemberResult==true){
                    Debug.print("RiderMemberId, riderFName, riderLName is Match");
                    
                     makeConnection();
                try {
                    String selectStatement = "select A.sufix from tblUserMaster A,tblMemberDetails B where "+
                                             "A.user_id = B.user_id and B.member_id = ? ";
                    
                    Debug.print("Query Log :"+selectStatement);
                    
                    prepStmt = con.prepareStatement(selectStatement);
                    prepStmt.setString(1,riderMemberId);
                    
                    ResultSet rs = prepStmt.executeQuery();
                    while(rs.next()){
                        suffix =  rs.getString(1);
                        Debug.print("suffix :"+suffix);
                    }
                    rs.close();
                    prepStmt.close();
                    releaseConnection();                    
                    
                    }
                    catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in VaigaiSessionBean while getting suffix :" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception in VaigaiSessionBean while getting suffix :" + e.getMessage());
                    }
                    
                    String[] result = {riderFName, riderLName, riderMemberId, suffix};
                    riderList.add(result);
                } 
            } 
            
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForRiderFirstPassOne: "+e.getMessage());
        }
        return riderList;
    }
    
    public ArrayList getExceptionReportForHorseNameFirstPassTwo(String horseName, String horseId) throws RemoteException{
        Debug.print("Inside getExceptionReportForHorseNameFirstPassTwo Called  horseName: " + horseName);
        Debug.print("Inside getExceptionReportForHorseNameFirstPassTwo Called  horseId: " + horseId);
        ArrayList horseList = new ArrayList();
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
           
            if(horseId!=null && horseId.trim().length()!=0 && horseName!=null && horseName.trim().length()!=0){
                Debug.print("Horse ID & Horse Name are not Empty");
                
                if(horseName.length()>=3){
                        horseName = horseName.substring(0,3);
                        Debug.print("Inside SubString of Match:" + horseName);
                    }
                   
                     makeConnection();
                try {
                    String selectStatement = "select horse_member_id, competition_name from tblHorseMemberDetails " +
                            " where horse_member_id = '"+horseId+"' and competition_name like '%" + horseName.replaceAll("'", "''")+ "%'";
                    
                    Debug.print("Query Log :"+selectStatement);
                    
                    prepStmt = con.prepareStatement(selectStatement);

                    ResultSet rs = prepStmt.executeQuery();
                    while(rs.next()){
                        String horseMemberId =  rs.getString(1);
                        horseName = rs.getString(2);
                        String[] result = {horseMemberId, horseName};
                        horseList.add(result);
                    }
                    rs.close();
                    prepStmt.close();
                    releaseConnection();                    
                    
                    }
                    catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in VaigaiSessionBean.getExceptionReportForHorseNameFirstPassTwo :" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception in VaigaiSessionBean.getExceptionReportForHorseNameFirstPassTwo:" + e.getMessage());
                    }
                     
                    Debug.print("Horse Name And ID is not Match So multiple Horse Size:" + horseList.size());
                             
            }
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForHorseNameFirstPassTwo: "+e.getMessage());
        }
        return horseList;
    }    
    
    public ArrayList getExceptionReportForRiderFirstPassTwo(String riderMemberId, String riderFName, String riderLName) throws RemoteException {
        Debug.print("Inside getExceptionReportForRiderFirstPassTwo Called : ");
        ArrayList riderList = new ArrayList();
        String suffix = "";
        
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
            
            if(riderMemberId!=null && riderMemberId.trim().length()!=0 && riderFName!=null && riderFName.trim().length()!=0 &&
                    riderLName!=null && riderLName.trim().length()!=0 ){
                
                if(riderLName.length()>=3){
                        riderLName = riderLName.substring(0,3);
                        Debug.print("Inside SubString of riderLName Match:" + riderLName);
                    }
                    if(riderFName.length()>=1){
                        riderFName = riderFName.substring(0,1);
                        Debug.print("Inside SubString of riderFName Match:" + riderFName);
                    }
                    
                    makeConnection();
                    try {
                        String selectStatement = "select A.user_id, A.first_name, A.last_name, B.member_id, A.sufix from tblUserMaster A," +
                                " tblMemberDetails B where A.user_id = B.user_id and B.member_id = '"+riderMemberId+"' and  A.first_name like '" + riderFName + "%' and " +
                                " A.last_name like '" +  riderLName.replaceAll("'" , "''") + "%'";

                        Debug.print("Query Log :"+selectStatement);
                        
                        prepStmt = con.prepareStatement(selectStatement);

                        ResultSet rs = prepStmt.executeQuery();
                        while(rs.next()){
                            String userId =  rs.getString(1);
                            firstName =  rs.getString(2);
                            lastName =  rs.getString(3);
                            String riderId = rs.getString(4);
                            suffix = rs.getString(5);
                            
                            String[] result = {firstName, lastName, riderId, suffix};
                            riderList.add(result);
                        }
                        rs.close();
                        prepStmt.close();
                        releaseConnection();
                    } catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in getExceptionReportForRiderFirstPassTwo:" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception  in getExceptionReportForRiderFirstPassTwo:" + e.getMessage());
                    }                 
                
            } 
            
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForRiderFirstPassTwo: "+e.getMessage());
        }
        return riderList;
    }
    
    public ArrayList getExceptionReportForHorseNameFirstPassThree(String horseName, String horseId) throws RemoteException{
        Debug.print("Inside getExceptionReportForHorseNameFirstPassThree Called  horseName: " + horseName);
        Debug.print("Inside getExceptionReportForHorseNameFirstPassThree Called  horseId: " + horseId);
        
        ArrayList horseList = new ArrayList();
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
           
            if(horseId!=null && horseId.trim().length()!=0 && horseName!=null && horseName.trim().length()!=0){
                Debug.print("Horse ID & Horse Name are not Empty");
                
                if(horseName.length()>=3){
                        horseName = horseName.substring(0,3);
                        Debug.print("Inside SubString of horseName Match:" + horseName);
                    }
                
                boolean horseMemberResult = vHrDAO.isHorseMemberExistFuzzy(horseId, horseName);
                if(horseMemberResult==true){
                    Debug.print("Horse Name And ID is Match");
                    
                    String horseArray[] = {horseId, horseName};
                    horseList.add(horseArray);
                } 
            }
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForHorseNameFirstPassThree: "+e.getMessage());
        }
        return horseList;
    }
        
    public ArrayList getExceptionReportForRiderFirstPassThree(String riderMemberId, String riderFName, String riderLName) throws RemoteException {
        Debug.print("Inside getExceptionReportForRiderFirstThree Called : ");
        ArrayList riderList = new ArrayList();
        String suffix = "";
        
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
            
            if(riderMemberId!=null && riderMemberId.trim().length()!=0 && riderFName!=null && riderFName.trim().length()!=0 &&
                    riderLName!=null && riderLName.trim().length()!=0 ){
                Debug.print("Rider Id is Match");
                
                if(riderFName.length()>=3){
                        riderFName = riderFName.substring(0,3);
                        Debug.print("Inside SubString of riderFName Match:" + riderFName);
                    }
                
                boolean riderMemberResult = vHrDAO.isRiderNameIDExistFuzzy(riderMemberId, riderFName, riderLName);
                if(riderMemberResult==true){
                    Debug.print("RiderMemberId, riderFName, riderLName is Match");
                    
                    makeConnection();
                try {
                    String selectStatement = "select A.sufix from tblUserMaster A,tblMemberDetails B where "+
                                             "A.user_id = B.user_id and B.member_id = ? ";
                    
                    Debug.print("Query Log :"+selectStatement);
                    
                    prepStmt = con.prepareStatement(selectStatement);
                    prepStmt.setString(1,riderMemberId);
                    
                    ResultSet rs = prepStmt.executeQuery();
                    while(rs.next()){
                        suffix =  rs.getString(1);
                        Debug.print("suffix :"+suffix);
                    }
                    rs.close();
                    prepStmt.close();
                    releaseConnection();                    
                    
                    }
                    catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in VaigaiSessionBean while getting suffix :" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception in VaigaiSessionBean while getting suffix :" + e.getMessage());
                    }
                    
                    String[] result = {riderFName, riderLName, riderMemberId, suffix};
                    riderList.add(result);
                } 
            } 
            
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForRiderFirstPassThree: "+e.getMessage());
        }
        return riderList;
    }
    
    public ArrayList getExceptionReportForHorseRelSecondPassOne(String riderFName, String riderLName, String horseName) throws RemoteException {
        Debug.print("Inside getExceptionReportForHorseRelSecondPassOne Called : ");
        ArrayList relationList = new ArrayList();
        String suffix = "";
        
        try {
                                  
            makeConnection();
                  
                        String selectStatement = "select A.competition_name, A.horse_member_id, B.first_name, B.last_name, C.member_id, D.user_id, E.relationship_type_name, B.sufix from tblHorseMemberDetails A, tblUserMaster B, "
                        +"tblMemberDetails C, tblHorseMemberRelationDetails D, tblHorseRelationshipTypeMaster E where A.horse_member_id = D.horse_member_id and B.user_id = D.user_id and "
                        +"D.user_id = C.user_id and D.relationship_type_id = E.relationship_type_id and E.relationship_type_name in ('Rider','Previous Rider') and A.competition_name = '"+horseName.replaceAll("'" , "''")+"' and "
                        +"B.first_name = '" + riderFName.replaceAll("'" , "''") + "' and B.last_name = '" + riderLName.replaceAll("'" , "''") + "' ORDER BY A.competition_name";
                        
                        Debug.print("Query Log :"+selectStatement);
                        
                        prepStmt = con.prepareStatement(selectStatement);

                        ResultSet rs = prepStmt.executeQuery();
                        while(rs.next()){
                            String competition_name =  rs.getString(1);
                            String horse_member_id =  rs.getString(2);                            
                            String first_name =  rs.getString(3);
                            String last_name =  rs.getString(4);
                            String riderId = rs.getString(5);
                            String riderRelTyp = rs.getString(7);
                            suffix = rs.getString(8);
                            
                            String[] result = {competition_name, horse_member_id ,first_name, last_name, riderId, riderRelTyp, suffix};
                            relationList.add(result);
                        }
                        rs.close();
                        prepStmt.close();
                        releaseConnection();
        }
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in getExceptionReportForHorseRelSecondPassOne :" + sql.getMessage());
        }        
        catch(Exception e){
            releaseConnection();
            Debug.print("general Exception in VaigaiSessionBean.getExceptionReportForHorseRelSecondPassOne : "+e.getMessage());
        }        
        return relationList;
    }
    
    public ArrayList getExceptionReportForHorseRelSecondPassTwo(String riderFName, String riderLName, String horseName,String horseId) throws RemoteException {
        Debug.print("Inside getExceptionReportForHorseRelSecondPassTwo Called : ");
        ArrayList relationList = new ArrayList();
        String sufix= "";
        
        boolean idMatchStat = false;
        
        try {
           
            if(horseName!=null && horseName.trim().length()!=0 && riderFName!=null && riderFName.trim().length()!=0 &&
                    riderLName!=null && riderLName.trim().length()!=0 ){
                                
                if(horseName.length()>=3){
                        horseName = horseName.substring(0,3);
                        Debug.print("Inside SubString of horseName Match:" + horseName);
                    }
                
                if(riderFName.length()>=1){
                        riderFName = riderFName.substring(0,1);
                        Debug.print("Inside SubString of riderFName Match:" + riderFName);
                    }
                
                if(riderLName.length()>=3){
                        riderLName = riderLName.substring(0,3);
                        Debug.print("Inside SubString of riderLName Match:" + riderLName);
                    }
                
                        makeConnection();
                  
                        String selectStatement = "select A.competition_name, A.horse_member_id, B.first_name, B.last_name, C.member_id, D.user_id, E.relationship_type_name, B.sufix from tblHorseMemberDetails A, tblUserMaster B, "
                                +"tblMemberDetails C, tblHorseMemberRelationDetails D, tblHorseRelationshipTypeMaster E where A.horse_member_id = D.horse_member_id and B.user_id = D.user_id and "
                                +"D.user_id = C.user_id and D.relationship_type_id = E.relationship_type_id and E.relationship_type_name in ('Rider','Previous Rider') and A.competition_name like '" + horseName.replaceAll("'" , "''") + "%' and "
                                +"B.first_name like '" + riderFName + "%' and B.last_name like '" + riderLName.replaceAll("'" , "''") + "%' ORDER BY A.competition_name";

                        Debug.print("Query Log :"+selectStatement);
                        
                        prepStmt = con.prepareStatement(selectStatement);

                        ResultSet rs = prepStmt.executeQuery();
                        while(rs.next()){
                            String competition_name =  rs.getString(1);
                            String horse_member_id =  rs.getString(2);                            
                            String first_name =  rs.getString(3);
                            String last_name =  rs.getString(4);
                            String riderId = rs.getString(5);
                            String riderRelTyp = rs.getString(7);
                            sufix = rs.getString(8);
                            
                            /*if(horseId.trim() != null && horseId.trim().length()!=0)
                            {
                                if(horseId.equalsIgnoreCase(horse_member_id))
                                {
                                    idMatchStat = true;
                                }
                            }*/
                            
                            String[] result = {competition_name, horse_member_id ,first_name, last_name, riderId, riderRelTyp, sufix};
                            relationList.add(result);
                                                       
                        }
                        
                        rs.close();
                        
                        prepStmt.close();
                        releaseConnection();
                               
                        if(relationList.size() == 0)
                        {
                        //if(idMatchStat == false)
                        //{
                            
                            makeConnection();
                            
                            relationList = new ArrayList();
                            
                            Debug.print("inside if(relationList.size() == 0) block :");
                            
                            String selectStatement1 = "";
                                                       
                             if(horseId.trim() != null && horseId.trim().length()!=0)
                            {
                                 selectStatement1 = "select A.competition_name, A.horse_member_id, B.first_name, B.last_name, C.member_id, D.user_id, E.relationship_type_name, B.sufix from tblHorseMemberDetails A, tblUserMaster B, "
                                +"tblMemberDetails C, tblHorseMemberRelationDetails D, tblHorseRelationshipTypeMaster E where A.horse_member_id = D.horse_member_id and B.user_id = D.user_id and "
                                +"D.user_id = C.user_id and D.relationship_type_id = E.relationship_type_id and E.relationship_type_name = 'Rider' and D.horse_member_id = '"+horseId+"'";                                
                            }
                            else
                            {
                                selectStatement1 = "select A.competition_name, A.horse_member_id, B.first_name, B.last_name, C.member_id, D.user_id, E.relationship_type_name, B.sufix from tblHorseMemberDetails A, tblUserMaster B, "
                                +"tblMemberDetails C, tblHorseMemberRelationDetails D, tblHorseRelationshipTypeMaster E where A.horse_member_id = D.horse_member_id and B.user_id = D.user_id and "
                                +"D.user_id = C.user_id and D.relationship_type_id = E.relationship_type_id and E.relationship_type_name = 'Rider' and "
                                +"B.first_name like '" + riderFName + "%' and B.last_name like '" + riderLName.replaceAll("'" , "''") + "%' ORDER BY B.last_name";
                            }
                             
                        Debug.print("Query Log :"+selectStatement1);
                        
                        prepStmt = con.prepareStatement(selectStatement1);

                        ResultSet rs1 = prepStmt.executeQuery();
                        while(rs1.next()){
                            String competition_name =  rs1.getString(1);
                            String horse_member_id =  rs1.getString(2);                            
                            String first_name =  rs1.getString(3);
                            String last_name =  rs1.getString(4);
                            String riderId = rs1.getString(5);
                            String riderRelTyp = rs1.getString(7);
                            sufix = rs1.getString(8);
                            
                            String[] result = {competition_name, horse_member_id ,first_name, last_name, riderId, riderRelTyp, sufix};
                            relationList.add(result);                            
                        }
                        
                        rs1.close(); 
                        prepStmt.close();
                        releaseConnection();
                        
                        /*if(relationList.size() == 0)
                        {
                            makeConnection();
                            
                            Debug.print("Inside no records available for if(horseId.trim() != null && horseId.trim().length()!=0) else case :");
                            selectStatement1 = "";
                            
                            selectStatement1 = "select A.competition_name, A.horse_member_id, B.first_name, B.last_name, C.member_id, D.user_id from tblHorseMemberDetails A, tblUserMaster B, "
                                +"tblMemberDetails C, tblHorseMemberRelationDetails D, tblHorseRelationshipTypeMaster E where A.horse_member_id = D.horse_member_id and B.user_id = D.user_id and "
                                +"D.user_id = C.user_id and D.relationship_type_id = E.relationship_type_id and E.relationship_type_name = 'Rider' and "
                                +"B.first_name like '" + riderFName + "%' and B.last_name like '" + riderLName.replaceAll("'" , "''") + "%'";
                        
                            Debug.print("Query Log :"+selectStatement1);
                            
                            prepStmt = con.prepareStatement(selectStatement1);

                        ResultSet rs2 = prepStmt.executeQuery();
                        while(rs2.next()){
                            String competition_name =  rs2.getString(1);
                            String horse_member_id =  rs2.getString(2);                            
                            String first_name =  rs2.getString(3);
                            String last_name =  rs2.getString(4);
                            String riderId = rs2.getString(5);
                            
                            String[] result = {competition_name, horse_member_id ,first_name, last_name, riderId};
                            relationList.add(result);                            
                        }
                            rs2.close(); 
                            prepStmt.close();
                            releaseConnection();
                        }*/
                        
                        //}   
                        }
                        
        }
        }
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in getExceptionReportForHorseRelSecondPassTwo :" + sql.getMessage());
        }        
        catch(Exception e){
            releaseConnection();
            Debug.print("general Exception in VaigaiSessionBean.getExceptionReportForHorseRelSecondPassTwo : "+e.getMessage());
        }        
        return relationList;
    }
    
    public ArrayList getExceptionReportForHorseNameThirdPassOne(String horseId,String horseName) throws RemoteException{
        Debug.print("Inside getExceptionReportForHorseNameThirdPassOne Called  horseId: " + horseId);
        Debug.print("Inside getExceptionReportForHorseNameThirdPassOne Called  horseName: " + horseName);
        
        ArrayList horseList = new ArrayList();
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
           
            if(horseId!=null && horseId.trim().length()!=0 && horseName!=null && horseName.trim().length()!=0){
                Debug.print("Horse ID & Horse Name are not Empty");
                
                boolean horseMemberResult = vHrDAO.isHorseMemberExist(horseId, horseName);
                if(horseMemberResult==true){
                    Debug.print("Horse Name And ID is Match");
                    
                    String horseArray[] = {horseId, horseName};
                    horseList.add(horseArray);
                } 
            }
                   
        }
                    catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception in VaigaiSessionBean.getExceptionReportForHorseNameThirdPassOne:" + e.getMessage());
                    }
        
        return horseList;
    }
    
    public ArrayList getExceptionReportForRiderThirdPassOne(String riderMemberId, String riderFName, String riderLName) throws RemoteException {
        Debug.print("Inside getExceptionReportForRiderThirdPassOne Called : ");
        ArrayList riderList = new ArrayList();
        String sufix = "";
        
        try {
            HLCValidateDAO vHrDAO = new HLCValidateDAO();
            
            if(riderMemberId!=null && riderMemberId.trim().length()!=0 && riderFName!=null && riderFName.trim().length()!=0 &&
                    riderLName!=null && riderLName.trim().length()!=0 ){
                Debug.print("Rider Id is Match");
                boolean riderMemberResult = vHrDAO.isRiderNameIDExist(riderMemberId, riderFName, riderLName);
                if(riderMemberResult==true){
                    Debug.print("RiderMemberId, riderFName, riderLName is Match");
                    
                     makeConnection();
                try {
                    String selectStatement = "select A.sufix from tblUserMaster A,tblMemberDetails B where "+
                                             "A.user_id = B.user_id and B.member_id = ? ";
                    
                    Debug.print("Query Log :"+selectStatement);
                    
                    prepStmt = con.prepareStatement(selectStatement);
                    prepStmt.setString(1,riderMemberId);
                    
                    ResultSet rs = prepStmt.executeQuery();
                    while(rs.next()){
                        sufix =  rs.getString(1);
                        Debug.print("suffix :"+sufix);
                    }
                    rs.close();
                    prepStmt.close();
                    releaseConnection();                    
                    
                    }
                    catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in VaigaiSessionBean while getting suffix :" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception in VaigaiSessionBean while getting suffix :" + e.getMessage());
                    }
                    
                    String[] result = {riderFName, riderLName, riderMemberId, sufix};
                    riderList.add(result);
                } 
            } 
            
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getExceptionReportForRiderThirdPassOne: "+e.getMessage());
        }
        return riderList;
    }
    
    public ArrayList getExceptionReportForHorseNameThirdPassTwo(String horseId,String horseName) throws RemoteException{
        Debug.print("Inside getExceptionReportForHorseNameThirdPassTwo Called  horseId: " + horseId);
        Debug.print("Inside getExceptionReportForHorseNameThirdPassTwo Called  horseName: " + horseName);
        
        ArrayList horseList = new ArrayList();
        try {
            
                if(horseName!=null && horseName.trim().length()!=0){
                        Debug.print("Horse ID & Horse Name are not Empty");
                
                    if(horseName.length()>=3){
                        horseName = horseName.substring(0,3);
                        Debug.print("Inside SubString of Match:" + horseName);
                    }
                }
                
                    if(horseId!=null && horseId.trim().length()!=0){
                        Debug.print("Horse ID is not Empty");
                
                     makeConnection();
                
                    String selectStatement1 = "select horse_member_id, competition_name from tblHorseMemberDetails " +
                            " where horse_member_id = '"+horseId+"'";
                    
                    Debug.print("Query Log :"+selectStatement1);
                    
                    prepStmt = con.prepareStatement(selectStatement1);

                    ResultSet rs1 = prepStmt.executeQuery();
                    while(rs1.next()){
                        String horseMemberId =  rs1.getString(1);
                        String horseDbName = rs1.getString(2);
                        String[] result = {horseMemberId, horseDbName};
                        
                        if(horseName!=null && horseDbName!=null){
                            String tmpName = "";
                            if(horseDbName.trim().length()!=0){
                       
                            if(horseDbName.length()>=3){
                                tmpName = horseDbName.substring(0,3);
                        
                            }
                            else
                            {
                                tmpName = horseDbName;
                            }
                        }
                            
                        if(horseName.equalsIgnoreCase(tmpName))
                        {
                            horseList.add(result);
                        }
                        }
                    }
                    rs1.close();
                    prepStmt.close();
                    releaseConnection();                    
                    
                    }
                    else
                    {
                        Debug.print("Horse ID is Empty in getExceptionReportForHorseNameThirdPassTwo");
                    }
                    
        }
                    catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in VaigaiSessionBean.getExceptionReportForHorseNameThirdPassTwo :" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception in VaigaiSessionBean.getExceptionReportForHorseNameThirdPassTwo:" + e.getMessage());
                    }
        
        return horseList;
    } 
    
    public ArrayList getExceptionReportForRiderThirdPassTwo(String riderId,String riderFName, String riderLName) throws RemoteException {
        Debug.print("Inside getExceptionReportForRiderThirdPassTwo Called : ");
        ArrayList riderList = new ArrayList();
        String sufix = "";
        
                try {     
                    
                    if(riderId!=null && riderId.trim().length()!=0)
                    {     
                        makeConnection();
                    
                        String selectStatement1 = "select A.user_id, A.first_name, A.last_name, B.member_id, A.sufix from tblUserMaster A," +
                                " tblMemberDetails B where A.user_id = B.user_id and  B.member_id = '"+riderId+"'";

                        Debug.print("Query Log :"+selectStatement1);
                        
                        prepStmt = con.prepareStatement(selectStatement1);

                        ResultSet rs1 = prepStmt.executeQuery();
                        while(rs1.next()){
                            String userId =  rs1.getString(1);
                            firstName =  rs1.getString(2);
                            lastName =  rs1.getString(3);
                            String riderIdDb = rs1.getString(4);
                            sufix = rs1.getString(5);
                                    
                            String[] result = {firstName, lastName, riderIdDb, sufix};
                            
                    if(lastName!=null && lastName.trim().length()!=0){ 
                    if(lastName.equalsIgnoreCase(riderLName))
                    {
                        riderList.add(result);
                    }
                    
                    }       
                        }
                        rs1.close();
                        prepStmt.close();
                        releaseConnection();
                    } 
                
                    }catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in getExceptionReportForRiderThirdPassTwo:" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception  in getExceptionReportForRiderThirdPassTwo:" + e.getMessage());
                    }                 
            
        return riderList;
    }
    
    public ArrayList getExceptionReportForHorseNameThirdPassThree(String horseName) throws RemoteException{
        Debug.print("Inside getExceptionReportForHorseNameThirdPassThree Called  horseName: " + horseName);
        
        ArrayList horseList = new ArrayList();
        try {
                    if(horseName!=null && horseName.trim().length()!=0){
                        Debug.print("Horse ID & Horse Name are not Empty");
                
                    if(horseName.length()>=3){
                        horseName = horseName.substring(0,3);
                        Debug.print("Inside SubString of Match:" + horseName);
                    }
                   
                     makeConnection();
                
                    String selectStatement1 = "select horse_member_id, competition_name from tblHorseMemberDetails " +
                            " where competition_name like '" + horseName.replaceAll("'", "''")+ "%' ORDER BY competition_name";
                    
                    Debug.print("Query Log :"+selectStatement1);
                    
                    prepStmt = con.prepareStatement(selectStatement1);

                    ResultSet rs1 = prepStmt.executeQuery();
                    while(rs1.next()){
                        String horseMemberId =  rs1.getString(1);
                        horseName = rs1.getString(2);
                        String[] result = {horseMemberId, horseName};
                        horseList.add(result);
                    }
                    rs1.close();
                    prepStmt.close();
                    releaseConnection();                    
                    
                    }
                    
        }
                    catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in VaigaiSessionBean.getExceptionReportForHorseNameThirdPassThree :" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception in VaigaiSessionBean.getExceptionReportForHorseNameThirdPassThree:" + e.getMessage());
                    }
        
        return horseList;
    }    
    
    public ArrayList getExceptionReportForRiderThirdPassThree(String riderFName, String riderLName) throws RemoteException {
        Debug.print("Inside getExceptionReportForRiderThirdPassThree Called : ");
        ArrayList riderList = new ArrayList();
        String sufix = "";
        
                try {                                           
                        
                    if(riderFName!=null && riderFName.trim().length()!=0 &&
                    riderLName!=null && riderLName.trim().length()!=0 ){
                
                    if(riderLName.length()>=3){
                        riderLName = riderLName.substring(0,3);
                        Debug.print("Inside SubString of riderLName Match:" + riderLName);
                    }
                    if(riderFName.length()>=1){
                        riderFName = riderFName.substring(0,1);
                        Debug.print("Inside SubString of riderFName Match:" + riderFName);
                    }
                    
                        makeConnection();
                    
                        String selectStatement1 = "select A.user_id, A.first_name, A.last_name, B.member_id, A.sufix from tblUserMaster A," +
                                " tblMemberDetails B where A.user_id = B.user_id and  A.first_name like '" + riderFName + "%' and " +
                                " A.last_name like '" +  riderLName.replaceAll("'" , "''") + "%' ORDER BY A.last_name";

                        Debug.print("Query Log :"+selectStatement1);
                        
                        prepStmt = con.prepareStatement(selectStatement1);

                        ResultSet rs1 = prepStmt.executeQuery();
                        while(rs1.next()){
                            String userId =  rs1.getString(1);
                            firstName =  rs1.getString(2);
                            lastName =  rs1.getString(3);
                            String riderId = rs1.getString(4);
                            sufix = rs1.getString(5);
                            
                            String[] result = {firstName, lastName, riderId, sufix};
                            riderList.add(result);
                        }
                        rs1.close();
                        prepStmt.close();
                        releaseConnection();
                    }                    
                    }catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in getExceptionReportForRiderThirdPassThree:" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception  in getExceptionReportForRiderThirdPassThree:" + e.getMessage());
                    }                 
            
        return riderList;
    }
    
    public String getRiderStateCode(String riderId) throws RemoteException{
        
        Debug.print("Inside getRiderStateCode Called  riderId: " + riderId);
            
        String stateCode = "";
        
        try {
              makeConnection();
              String selectStatement = "select A.state_code, B.member_id from tblMeeStateMaster A, tblMemberDetails B, "+
                   "tblUserMaster C, tblContactDetails D where B.user_id = C.user_id and C.user_id = D.user_id and "+
                   "C.contact_type_id = D.contact_type_id and D.state = A.state_name and B.member_id = '"+riderId+"'";

                        Debug.print("Query Log :"+selectStatement);
                        
                        prepStmt = con.prepareStatement(selectStatement);

                        ResultSet rs = prepStmt.executeQuery();
                        while(rs.next()){
                            stateCode =  rs.getString(1);
                        }
                        rs.close();
                        prepStmt.close();
                        releaseConnection();
                    } catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in getRiderStateCode:" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception  in getRiderStateCode:" + e.getMessage());
                    } 
        
        return stateCode;
    }
    
    public String getOwnerStateCode(String memberId) throws RemoteException{
        
        Debug.print("Inside getOwnerStateCode Called  memberId: " + memberId);
            
        String stateCode = "";
        
        try {
              makeConnection();
              String selectStatement = "select A.state_code, B.horse_member_id from tblMeeStateMaster A, tblHorseMemberDetails B, "+
                   "tblUserMaster C, tblContactDetails D where B.owner_id = C.user_id and C.user_id = D.user_id and "+
                   "C.contact_type_id = D.contact_type_id and D.state = A.state_name and B.horse_member_id = '"+memberId+"'";

                        Debug.print("Query Log :"+selectStatement);
                        
                        prepStmt = con.prepareStatement(selectStatement);

                        ResultSet rs = prepStmt.executeQuery();
                        while(rs.next()){
                            stateCode =  rs.getString(1);
                        }
                        rs.close();
                        prepStmt.close();
                        releaseConnection();
                    } catch(SQLException sql){
                        releaseConnection();
                        Debug.print("SQL Exception in getOwnerStateCode:" + sql.getMessage());
                    } catch(Exception e){
                        releaseConnection();
                        Debug.print("General Exception  in getOwnerStateCode:" + e.getMessage());
                    } 
        
        return stateCode;
    }
    
    public ArrayList getHorseRelation(String horseName) throws RemoteException {
        Debug.print("VaigaiSessionBean.getHorseRelation(): ");
        ArrayList objRelationList = new ArrayList();
        HLCValidateDAO vHrDAO = new HLCValidateDAO();
        try {
            if(horseName!=null && horseName.trim().length()!=0){
                objRelationList = vHrDAO.selectHorseRelation(horseName);
            }
        }catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getHorseRelation(): "+e.getMessage());
        }
        return objRelationList;
    }
    
    public boolean validateHorseCompReg(ArrayList valHrList) throws RemoteException{
        boolean result = false;
        Debug.print("VaigaiSessionBean.validateHorseCompReg(): ");
        HLCValidateDAO vHrDAO = new HLCValidateDAO();
        try {
            if(valHrList!=null && valHrList.size()!=0){
                Iterator it = valHrList.iterator();
                int i = 1;
                
                while(it.hasNext()){
                    HLCCompRegVO compRegVO= (HLCCompRegVO)it.next();
                    
                    Debug.print("insertHorseCompRegData(compRegVO) Record No :"+i);
                    result = vHrDAO.insertHorseCompRegData(compRegVO);
                    i++;
                }
            }
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.validateHorseCompReg(): : "+e.getMessage());
        }
        return result;
    }
    
    public boolean insertValidHorseCompResult(HLCCompResultVO compResVO) throws RemoteException{
        boolean result = false;
        Debug.print("VaigaiSessionBean.insertValidHorseCompResult(): ");
        Debug.print("compResVO.toString() :"+compResVO.toString());
        
        HLCValidateDAO vHrDAO = new HLCValidateDAO();
        try {
            /*if(valHrList!=null && valHrList.size()!=0){
                Iterator it = valHrList.iterator();
                int i = 1;
                
                while(it.hasNext()){
                    HLCCompResultVO compResVO= (HLCCompResultVO)it.next();
                    
                    Debug.print("insertHorseCompRegData(compResVO) Record No :"+i);*/
            
                    result = vHrDAO.insertHorseCompResultData(compResVO);
                    
                   /* i++;
                }
            }*/
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.insertValidHorseCompResult(): : "+e.getMessage());
        }
        return result;
    }
    
    public boolean insertInvalidHorseCompResult(HLCCompResultVO compResVO) throws RemoteException{
        boolean result = false;
        Debug.print("VaigaiSessionBean.insertInvalidHorseCompResult(): ");
        Debug.print("compResVO.toString() :"+compResVO.toString());
        
        HLCValidateDAO vHrDAO = new HLCValidateDAO();
        try {
                    result = vHrDAO.insertInvalidHorseCompResult(compResVO);                    
                    
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.insertInvalidHorseCompResult(): : "+e.getMessage());
        }
        return result;
    }
        
    public boolean updateValidationStatus(String regUploadId) throws RemoteException {
        boolean result = false;
        Debug.print("VaigaiSessionBean.updateValidationStatus(): ");
        HLCValidateDAO vHrDAO = new HLCValidateDAO();
        try {
            if(regUploadId!=null && regUploadId.trim().length()!=0){
                result = vHrDAO.updateValidationStatus(regUploadId);
            }
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.updateValidationStatus(): : "+e.getMessage());
        }
        return result;
    }
    
    public boolean updateResultValidationStatus(String uploadId) throws RemoteException {
        boolean result = false;
        Debug.print("VaigaiSessionBean.updateResultValidationStatus(): ");
        HLCValidateDAO vHrDAO = new HLCValidateDAO();
        try {
            if(uploadId!=null && uploadId.trim().length()!=0){
                result = vHrDAO.updateResultValidationStatus(uploadId);
            }
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.updateResultValidationStatus(): : "+e.getMessage());
        }
        return result;
    }
    
     public String getEventTitle(String uploadId,String eventId) throws RemoteException {
         Debug.print("getEventTitle() in session bean uploadId :"+uploadId);
         Debug.print("getEventTitle() in session bean eventId :"+eventId);
         
        String eventTitle = null;
        
        try {
            makeConnection();
            String selecStmt = "SELECT event_name FROM "+DBHelper.USEA_COMP_RESULT_FILE_DETAILS+" where upload_id = ?";
            prepStmt = con.prepareStatement(selecStmt);
            prepStmt.setString(1,uploadId);
            Debug.print("Query Log based on uploadId :"+selecStmt);
            
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                eventTitle = rs.getString(1);
                
            }
            Debug.print("eventTitle based on uploadId :"+eventTitle);
            
            rs.close();
            
            if(eventTitle==null)
            {                
                String selecStmt1 = "SELECT event_title FROM "+DBHelper.USEA_EVENT_DETAILS+" where event_id = ?";
                prepStmt = con.prepareStatement(selecStmt1);
                prepStmt.setString(1,eventId);
                Debug.print("Query Log based on eventId :"+selecStmt1);
                
                rs = prepStmt.executeQuery();
                while (rs.next()) {
                    eventTitle = rs.getString(1);
                    
                }
                Debug.print("eventTitle based on eventId :"+eventTitle);
                rs.close();
                
            }
            
        }
        catch(SQLException e){
            releaseConnection();
            Debug.print("SQLException in getEventTitle() :"+e.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General exception in getEventTitle() :"+e.getMessage());
        }        
        finally
        {
            releaseConnection();
        }
        return eventTitle;
    }
     
     /**
  * Name         :updateCompResultEventDet
  * Description  :This method will update the event details on tbltempcompresults based on tblcompresultfiledetails 
  * @ param      :uploadId
  * @return      :boolean
  * @throws      :RemoteException
  */   
    
    public boolean updateCompResultEventDet(String uploadId) throws RemoteException {
        Debug.print("Inside updateCompResultEventDet in session bean : ");
        boolean stat = false;
        
        HLCCompetitionResultsDAO compDao = new HLCCompetitionResultsDAO();        
        try {
            stat = compDao.updateCompResultEventDet(uploadId);
            
        }catch(Exception e){
            Debug.print("Error while retrieving insertCompResultDetailsByQuery in session bean : "+e.getMessage());
        }  
        
        return stat;
    }
    
    public ArrayList displayAllSpecificationDetails(boolean status) throws RemoteException {
      boolean bol = false;
      ArrayList vObj = new ArrayList();
      try{
          HLCPriceDetailDAO objDAO = new HLCPriceDetailDAO();
          vObj = objDAO.loadAllSpecDetails(status);
          bol = true;
          Debug.print(" In VaigaiSessionBean while Listing Arena Size in DAO : "+bol);
      }catch(Exception e){
          Debug.print(" Error While Listing Arena Size : "+e.getMessage());
          e.printStackTrace();
      }
      return vObj;
  }      
   public ArrayList displaySingleSpecDetail(String specId) throws RemoteException {
      boolean bol = false;
      ArrayList vObj = new ArrayList();
      try{
          if (specId != null && specId.trim().length()>0 ){
              HLCPriceDetailDAO objDAO = new HLCPriceDetailDAO();
              vObj = objDAO.loadSpecDetails(specId);
              bol = true;
              Debug.print(" In VaigaiSessionBean while Listing Arena Size in DAO : "+bol);
          }
      }catch(Exception e){
          Debug.print(" Error While Listing Arena Size : "+e.getMessage());
          e.printStackTrace();
      }
      return vObj;
  } 
 public boolean editSpecDetail(String specificationId,String activityId,String specName,String specDesc) throws RemoteException {
        Debug.print("editSpecDetail calling " + specificationId);
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        //boolean bol = false;
        boolean bol1 = false;
        try {
            //bol = objPriceDAO.checkEditPriceDetail(priceId,specificationId,userTypeId,eventRegistrationTypeId);
            //if (bol == false) {
                bol1 = objPriceDAO.editAnnualspecDetail(specificationId,activityId,specName,specDesc);
            //}
            //Debug.print(" Specification Id and usertypeId exist : "+bol);
        }catch(Exception e){
            Debug.print("Error while ading Price details");
        }
        //Debug.print(" editupdatePriceDetail successfully updated.. Result : " + bol);
        return bol1;
    }  

 public boolean deleteSpecDetail(String specId) throws RemoteException {
      boolean bol = false;
      try{
          if (specId != null && specId.trim().length() > 0) {
              HLCPriceDetailDAO objDAO = new HLCPriceDetailDAO();
              bol = objDAO.deactivateSpecDetail(specId);
              Debug.print(" In VaigaiSessionBean while deleting Arena Size in DAO : "+bol);
          }
      }catch(Exception e){
          Debug.print(" Error While deleting Arena Size : "+e.getMessage());
          e.printStackTrace();
      }
      return bol;
  } 
 public boolean activateSpecDetail(String specId) throws RemoteException {
      boolean bol = false;
      try{
          if (specId != null && specId.trim().length() > 0) {
              HLCPriceDetailDAO objDAO = new HLCPriceDetailDAO();
              bol = objDAO.activateSpecDetail(specId);
              Debug.print(" In VaigaiSessionBean while activate Spec Detail in DAO : "+bol);
          }
      }catch(Exception e){
          Debug.print(" Error While activating Spec Detail : "+e.getMessage());
          e.printStackTrace();
      }
      return bol;
  } 
 
public boolean isSpecNameExist(String activityTypeId,String specName) throws RemoteException{
        Debug.print("VaigaiSessionBean .isSpecNameExist()");
        boolean result = false;
        try{
            if(activityTypeId!=null && activityTypeId.trim().length()!=0 && specName!=null && specName.trim().length()!=0){
                HLCPriceDetailDAO objDAO = new HLCPriceDetailDAO();
                result = objDAO.isSpecNameExist(activityTypeId,specName);
                Debug.print("isSpecNameExist in VaigaiSessionBean" + activityTypeId);
                Debug.print("specName in isSpecNameExist in VaigaiSessionBean" + specName);
            }
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.isSpecNameExist()" + e.getMessage());
        }
        return result;
    } 
public boolean isEditSpecNameExist(String specId,String activityTypeId,String specName) throws RemoteException{
        Debug.print("DBDITRegistrationBean .VaigaiSessionBean()");
        boolean result = false;
        try{
            if(specId!=null && specId.trim().length()!=0 && activityTypeId!=null && activityTypeId.trim().length()!=0 && specName!=null && specName.trim().length()!=0){
                HLCPriceDetailDAO objDAO = new HLCPriceDetailDAO();
                result = objDAO.isEditSpecNameExist(specId,activityTypeId,specName);
                Debug.print("activityTypeId in isEditSpecNameExist in VaigaiSessionBean" + activityTypeId);
                 Debug.print("specName in isEditSpecNameExist in VaigaiSessionBean" + specName);
            }
        } catch(Exception e){
            Debug.print("Exception in RegistrationSessionBean.VaigaiSessionBean()" + e.getMessage());
        }
        return result;
    } 
//====================================================End Here =========================================

//====================================================Hari Start Here =========================================

public ArrayList getAnnualPendingDetails(String registrar_id) throws RemoteException{
    Debug.print("getAnnualPendingDetails "+registrar_id);
    ArrayList annualPendInfo = null;
    try{
        annualPendInfo = new HLCAnnualMeetingDAO().getAnnualPendingDetails(registrar_id);
        Debug.print("Size in VaigaiSession Bean "+annualPendInfo.size());
    }
    catch(Exception e){
        Debug.print("Exception in getAnnualPendingDetails "+registrar_id);
    }
    return annualPendInfo;
}

public ArrayList getAnnualPendingListDetails(String registrar_id,String payment_id,String meetingId) throws RemoteException{
    Debug.print("getAnnualPendingListDetails "+registrar_id +" payment_id "+payment_id+" meeting Id"+meetingId);
    ArrayList annualPendInfo = null;
    try{
        annualPendInfo = new HLCAnnualMeetingDAO().getAnnualPendingListPendInfo(registrar_id,payment_id,meetingId);
        Debug.print("Size in VaigaiSession Bean "+annualPendInfo.size());
    }
    catch(Exception e){
        Debug.print("Exception in getAnnualPendingDetails "+registrar_id);
    }
    return annualPendInfo;
}

public ArrayList getAnnualMeetingDetails(String registrar_id,String payment_id) throws RemoteException{
    Debug.print("getAnnualPendingListDetails "+registrar_id +" payment_id "+payment_id);
    ArrayList annualPendInfo = null;
    try{
        annualPendInfo = new HLCAnnualMeetingDAO().getAnnualMeetingDetails(registrar_id,payment_id);
        Debug.print("Size in VaigaiSession Bean "+annualPendInfo.size());
    }
    catch(Exception e){
        Debug.print("Exception in getAnnualPendingDetails "+registrar_id);
    }
    return annualPendInfo;
}

/*
public ArrayList getAnnualPendDetInfo(String registrat_id) throws RemoteException{
    
}*/
//====================================================Hari End Here =========================================
public boolean insertProvisionalCalDetails() throws RemoteException{
  /*  try{
        Debug.print("insertProvisionalCalDetails ");
        ProvisionalDAO pdao = new ProvisionalDAO();
        int count = pdao.insertProvisionalDetails();
        if(count>0){
            return true;
        } else{
            return false;
        }
    } catch(Exception e){
        e.printStackTrace();
    }*/
    return false;
}
/***************************************************************EventRegistrationPriceDetails*****************************/
public ArrayList getAllPriceTypes() throws RemoteException {
        Debug.print("vaigaiSessionBean.getAllPriceTypes()");
        ArrayList objUsrTyp = new ArrayList();
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        try {
            objUsrTyp = objPriceDAO.selectAllPriceTypes();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return objUsrTyp;
    }
/*======================================================================================================================*/
public ArrayList getAllSeasons() throws RemoteException {
        Debug.print("vaigaiSessionBean.getAllSeasons()");
        ArrayList objUsrTyp = new ArrayList();
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        try {
            objUsrTyp = objPriceDAO.selectAllSeasons();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return objUsrTyp;
    }
/*======================================================================================================================*/
public boolean isEventRegPriceExist(String priceTypeId, String seasonId) throws RemoteException{
        Debug.print("vaigaiSessionBean.isEventRegPriceExist() :");
        Debug.print("priceId in vaigaiSessionBean isEventRegPriceExist():" + priceTypeId);
        Debug.print("seasonId in vaigaiSessionBean isEventRegPriceExist():" + seasonId);
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        boolean result=false;
        try{
            if(priceTypeId!=null && priceTypeId.trim().length()!=0 && seasonId!=null && seasonId.trim().length()!=0){
                result = objPriceDAO.isEventRegPriceExist(priceTypeId, seasonId);
                
            }
        } catch(Exception e){
            Debug.print("Exception in vaigaiSessionBean.isEventRegPriceExist()" + e.getMessage());
        }
        return result;
    }
/*======================================================================================================================*/
public boolean insertEventRegPriceDetails(String priceTypeId,String seasonId, float duePrice, float afterPrice) throws RemoteException{
        Debug.print("vaigaiSessionBean.insertEventRegPriceDetails() :");
        boolean eveDet1 = false;
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        try{
            eveDet1 = objPriceDAO.insertEventRegPriceDetails(priceTypeId, seasonId, duePrice, afterPrice);
            } catch(Exception e){
            Debug.print("Exception in vaigaiSessionBean.insertEventRegPriceDetails()" + e.getMessage());
        }
        return eveDet1;
    }
/*=======================================================================================================================*/
 public ArrayList getAllPriceDetails(String priceTypeId) throws RemoteException{
        Debug.print("vaigaiSessionBean.getAllPriceDetails() :");
        Debug.print("result in getAllPriceDetails() :"+priceTypeId);
        ArrayList vObj = new ArrayList();
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        try{
            vObj = objPriceDAO.selectAllPriceDetails(priceTypeId);
        } catch(Exception e){
            Debug.print("Exception in vaigaiSessionBean.getAllPriceDetails()" + e.getMessage());
        }
        return vObj;
    }
 /*=======================================================================================================================*/
  public ArrayList getSinglePriceDetails(String priceId) throws RemoteException{
        Debug.print("vaigaiSessionBean.getSinglePriceDetails() :");
        ArrayList vObj = new ArrayList();
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        try{
            if(priceId!=null && priceId.trim().length()!=0){
                vObj = objPriceDAO.selectSinglePriceDetails(priceId);
                
            }
        } catch(Exception e){
            Debug.print("Exception in vaigaiSessionBean.getSinglePriceDetails()" + e.getMessage());
        }
        return vObj;
    }
  /*=====================================================================================================================*/
  public boolean updateEventRegPriceDetails(String priceId,String priceTypeId,String seasonId, float duePrice, float afterPrice) throws RemoteException{
        Debug.print("KrishnaStatelesBean.updateEventRegPriceDetails() :");
        boolean result = false;
        try{
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();    
                result = objPriceDAO.updateEventRegPriceDetails(priceId,priceTypeId,seasonId,duePrice,afterPrice);

            
        } catch(Exception e){
            Debug.print("Exception in KrishnastalessBean.updateEventRegPriceDetails()" + e.getMessage());
        }
        return result;
    }
  /*=======================================================================================================================*/
  public ArrayList getEventRegDateDetails(String seasonId,int year) throws RemoteException{
        Debug.print("vaigaiSessionBean.getEventRegDateDetails() :");
        ArrayList vObj = new ArrayList();
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        try{
            vObj = objPriceDAO.selectEventRegDateDetails(seasonId,year);
           } catch(Exception e){
            Debug.print("Exception in vaigaiSessionBean.getEventRegDateDetails()" + e.getMessage());
        }
        return vObj;
    }
/*======================================================================================================================*/
public boolean insertEventRegDateDetails(String regDateId,String seasonId, Date dueDate, Date graceDate, int year) throws RemoteException{
        Debug.print("vaigaiSessionBean.insertEventRegDateDetails() :");
        boolean eveDet1 = false;
        HLCPriceDetailDAO objPriceDAO = new HLCPriceDetailDAO();
        try{
            eveDet1 = objPriceDAO.insertEventRegDateDetails(regDateId, seasonId, dueDate, graceDate, year);
            } catch(Exception e){
            Debug.print("Exception in vaigaiSessionBean.insertEventRegDateDetails()" + e.getMessage());
        }
        return eveDet1;
    }

 public ArrayList getEventRegPayPendingDets(String usrId) throws RemoteException{
    Debug.print("getEventRegPayPendingDets "+usrId);
    ArrayList objEvePenPay = null;
    try{
        objEvePenPay = new HLCAnnualMeetingDAO().getEventRegPayPendingDets(usrId);
        Debug.print("Size in VaigaiSession Bean "+objEvePenPay.size());
    }
    catch(Exception e){
        Debug.print("Exception in getEventRegPayPendingDets "+usrId);
    }
    return objEvePenPay;
}
 
 public HLCEventRegPendingVO getSingleEventRegPendingDetails(String eventId) throws RemoteException {
        HLCEventRegPendingVO eveRegPendVO = new HLCEventRegPendingVO();
        HLCAnnualMeetingDAO objDAO = new HLCAnnualMeetingDAO();
        try {
            if(eventId!=null && eventId.trim().length()!=0){
                eveRegPendVO = objDAO.getSingleEventRegPendingDetails(eventId);
            }
        }catch(Exception e){
            e.printStackTrace();  
        }
        return eveRegPendVO;
    }
 
 public boolean updatePendingPayment(HLCPaymentDetails objPayDet) throws RemoteException{
        Debug.print("VaigaiSessionBean.updatePendingPayment() :");
        boolean result = false;
        try{
            HLCAnnualMeetingDAO objDAO = new HLCAnnualMeetingDAO();
            if(objPayDet.getPaymentId()!=null && objPayDet.getPaymentId().trim().length()!=0 ){
                result = objDAO.updateRowPendingPayment(objPayDet);
                
            }
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.updatePayment()" + e.getMessage());
        }
        return result;
    }
public boolean deleteCompRegDetails(String regUploadId) throws RemoteException {
        Debug.print("Inside deleteCompRegDetails in session bean : ");
        Debug.print(" uploadId in session bean : "+regUploadId);
        
        try {
            makeConnection();
            String insertStatement = "delete from "+DBHelper.USEA_COMP_REG_DETAILS+" where reg_upload_id = ? ";
            prepStmt = con.prepareStatement(insertStatement);
            // prepStmt.setString(1, eventRegistrationTypeName);
            prepStmt.setString(1,regUploadId);
            
            int cnt = prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully deleted in deleteCompRegDetails() ......:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while deleting in deleteCompRegDetails : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return true;
    }  
public boolean deleteCompResultDetails(String uploadId) throws RemoteException {
        Debug.print("Inside deleteCompResultDetails in session bean : ");
        Debug.print(" uploadId in session bean : "+uploadId);
        
        try {
            makeConnection();
            String insertStatement = "delete from "+DBHelper.USEA_COMP_RESULT_DETAIL+" where upload_id = ? ";
            prepStmt = con.prepareStatement(insertStatement);
            // prepStmt.setString(1, eventRegistrationTypeName);
            prepStmt.setString(1,uploadId);
            
            int cnt = prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully deleted in deleteCompResultDetails() ......:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while deleting in deleteCompResultDetails : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return true;
    }

//****************************************Competition Result Upload:-Starter Count************************************************

public ArrayList getCompResultStarterCount(String eventId, String uploadId) throws RemoteException{
        ArrayList starterList= new ArrayList();
        Debug.print("VaigaiSessionBean.getCompResultStarterCount(): ");
            
        try {
             HLCValidateDAO vHrDAO = new HLCValidateDAO();
             
            starterList = vHrDAO.getCompResultStarterCount(eventId,uploadId);
            
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getCompResultStarterCount(): : "+e.getMessage());
        }
        return starterList;
    }

//************************************Competition Result Upload:-TmpResultIds********************************************************

public ArrayList getCompResultTempResIds(String eventId, String mergDiv, String uploadId) throws RemoteException{
        ArrayList starterDetList= new ArrayList();
        Debug.print("VaigaiSessionBean.getCompResultTempResIds(): ");
            
        try {
             HLCValidateDAO vHrDAO = new HLCValidateDAO();
             
            starterDetList = vHrDAO.getCompResultTempResIds(eventId,mergDiv,uploadId);
            
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getCompResultTempResIds(): : "+e.getMessage());
        }
        return starterDetList;
    }
//************************************Competition Result Upload:-ResultGroupId********************************************************

public String getCompResultGroupId(String eventId, ArrayList eveTempDets, String StarterCnt, String eveDivId, String eveSubDiv, String eveTypeId, String uploadId, String eventLevelId) throws RemoteException{
        String newGrpId="";
        Debug.print("VaigaiSessionBean.getCompResultGroupId(): ");
            
        try {
             HLCValidateDAO vHrDAO = new HLCValidateDAO();
             
            newGrpId = vHrDAO.getCompResultGroupId(eventId, eveTempDets,StarterCnt,eveDivId,eveSubDiv,eveTypeId,uploadId,eventLevelId);
            
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getCompResultGroupId(): : "+e.getMessage());
        }
        return newGrpId;
    }


public String[] getEventIds(String eventTypeName,String eventLevelName, String eventDivName) throws RemoteException{
        Debug.print("VaigaiSessionBean getEventIds ");
        String eventDet[] = {};
        try {
            String[] tempeventDet = new HLCAnnualMeetingDAO().selectEventIds(eventTypeName,eventLevelName,eventDivName);
            eventDet = tempeventDet;
        } catch(Exception e){
            Debug.print("Exception in getEventIds:" + e);
        }
        return eventDet;
    }

//************************************Competition Result Upload:-update groupId in tblMeeCompResultDetails********************************************************
public boolean updateCompResultGrpDets(String eventId, String resId, String groupId) throws RemoteException{
        Debug.print("VaigaiSessionBean.updateCompResultGrpDets() :");
        boolean result = false;
        try{
            HLCValidateDAO vHrDAO = new HLCValidateDAO();         
                result = vHrDAO.updateCompResultGrpDets(eventId,resId,groupId);
                       
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.updateCompResultGrpDets()" + e.getMessage());
        }
        return result;
    }

//************************************Competition Result Upload:-EventDivisionId********************************************************
public String getEventDivisionId(String eventDivisionName) throws RemoteException{
        String eveDivisionId="";
        Debug.print("VaigaiSessionBean.getEventDivisionId(): ");
            
        try {
             HLCValidateDAO vHrDAO = new HLCValidateDAO();
             
            eveDivisionId = vHrDAO.getEventDivisionId(eventDivisionName);
            
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getEventDivisionId(): : "+e.getMessage());
        }
        return eveDivisionId;
    }

public boolean deleteGroupResultDetails(String uploadId) throws RemoteException {
        Debug.print("Inside deleteGroupResultDetails in session bean : ");
        Debug.print(" uploadId in session bean : "+uploadId);
        
        try {
            makeConnection();
            String insertStatement = "delete from tblMeeCompGroupResultDetails where upload_id = ? ";
            prepStmt = con.prepareStatement(insertStatement);          
            prepStmt.setString(1,uploadId);            
            int cnt = prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
            Debug.print("Successfully deleted in deleteGroupResultDetails() ......:" + cnt);
        }catch(Exception e){
            releaseConnection();
            Debug.print("Error while deleting in deleteGroupResultDetails : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        return true;
    }

//************************************Competition Result Upload:-EventLevelId********************************************************
public String getEventLevelId(String eventLevelName) throws RemoteException{
        String eveLevelId="";
        Debug.print("VaigaiSessionBean.getEventLevelId(): ");
            
        try {
             HLCValidateDAO vHrDAO = new HLCValidateDAO();
             
            eveLevelId = vHrDAO.getEventLevelId(eventLevelName);
            
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getEventLevelId(): : "+e.getMessage());
        }
        return eveLevelId;
    }

public String getAnnualRegistraterId(String annualMeetingId) throws RemoteException{
        String eveLevelId="";
        Debug.print("VaigaiSessionBean.getAnnualRegistraterId(): ");
            
        try {
             HLCValidateDAO vHrDAO = new HLCValidateDAO();
             
            eveLevelId = vHrDAO.getAnnualRegistraterId(annualMeetingId);
            
        } catch(Exception e){
            Debug.print("Exception in VaigaiSessionBean.getAnnualRegistraterId(): : "+e.getMessage());
        }
        return eveLevelId;
    }
/*======================================================================================================================*/

/*************************************************************************************************************************/

    /**===================Initialization for Initial Context===============================*/
    
    public InitialContext getInitialContext() throws javax.naming.NamingException {
        if( this.ic == null ) {
            ic = new InitialContext();
        }
        System.out.println("This is from getInitialContext()");
        return ic;
    }
    
    
    
    /**
     * Name         :makeConnection
     * Description  :This method will Create a databacse connection
     * @ param      :
     * @return      :void
     * @throws      :EJBException
     */
    private void makeConnection() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            con = ds.getConnection();
        } catch (Exception ex) {
            throw new EJBException("Unable to connect to database. " + ex.getMessage());
        }
    }
    /**
     * Name         :releaseConnection
     * Description  :This method will release the databacse connection
     * @ param      :
     * @return      :void
     * @throws      :EJBException
     */
    private void releaseConnection() {
        try {
            con.close();
        } catch (SQLException ex) {
            throw new EJBException("releaseConnection: " + ex.getMessage());
        }
    }
    
}




