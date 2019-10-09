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
package com.hlcmsg.session;

import com.hlcmsg.DAO.HLCGroupUserDAO;
import com.hlcmsg.DAO.HLCMessageGroupDAO;
import com.hlcmsg.DAO.HLCMsgDataBaseDAO;
import com.hlcmsg.DAO.HLCMsgGroupMessageDAO;
import com.hlcmsg.distribution.HLCMessagedistributionEntityLocal;
import com.hlcmsg.distribution.HLCMessagedistributionEntityLocalHome;
import com.hlcmsg.entity.HLCMessagingEntityLocal;
import com.hlcmsg.entity.HLCMessagingEntityLocalHome;
import com.hlcmsg.util.DBHelper;
import com.hlcmsg.util.Debug;
import com.hlcmsg.util.HLCGroup;
import com.hlcmsg.util.HLCGroupMessage;
import com.hlcmsg.util.HLCGroupUser;
import com.hlcmsg.util.HLCMessageDAO;
import com.hlcmsg.util.HLCMsgContactListMaster;
import com.hlcmsg.util.HLCMsgDistributionListMaster;
import com.hlcmsg.util.HLCMsgPaginationVO;
import com.hlcmsg.util.HLCUserMaster;
import com.hlcmsg.util.HLClMsgDBRequestDetailsVO;
import javax.ejb.*;
import javax.transaction.UserTransaction ;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

/**
 * This is the bean class for the MessageSessionBean enterprise bean.
 * Created Sep 4, 2006 12:04:24 PM
 * @author harmohan
 */

public class HLCMessageSessionBean implements SessionBean, HLCMessageSessionRemoteBusiness {
    private SessionContext context;
    private InitialContext ic = null;
    private static final String dbName = "java:/ELMTMSSQLDS";
    private Connection con;
    ResultSet rs= null;
    PreparedStatement prepStmt = null;
    HLCMessagingEntityLocalHome home;
    HLCMessagingEntityLocal remote;
    
    HLCMessagedistributionEntityLocalHome distHome;
    HLCMessagedistributionEntityLocal distRemote;
    
    private String contactlistId;
    private String listId;
    
    HLCMsgContactListMaster objContactList = new HLCMsgContactListMaster();
    HLCMsgDistributionListMaster objDistList = new HLCMsgDistributionListMaster();
    
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
            Object obj = jndiContext.lookup("ejb/HLCMsgEntityJNDI");
            home = (HLCMessagingEntityLocalHome)obj;
            
            Object obj1 = jndiContext.lookup("ejb/HLCMsgDistJNDI");
            distHome = (HLCMessagedistributionEntityLocalHome)obj1;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public boolean addContactList(HLCMsgContactListMaster objContactList)throws RemoteException {
        try{
             remote = home.create(objContactList);
        }
        catch(Exception exp){
             throw new EJBException("createMessageList Details: " + exp.getMessage());
        }
        return true;
    }
    //displayContactList
    public Vector displayContactListBasedOnContactListID(String contactListId) throws RemoteException, FinderException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        Vector vObj = null;
        try {
            vObj = objDAO.selectContactListId(contactListId);
        }catch(Exception e){
            Debug.print(" Error In displayContactListBasedOnContactListID : "+e.getMessage());
        }
       return vObj;
    }
    
   public HLCMsgContactListMaster displayContactListBasedOnContactListIDVO(String contactListId) throws RemoteException, FinderException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        HLCMsgContactListMaster objCont = new HLCMsgContactListMaster();
        try {
            objCont = objDAO.selectContactListIdVO(contactListId);
        }catch(Exception e){
            Debug.print(" Error In displayContactListBasedOnContactListID : "+e.getMessage());
        }
       return objCont;
    }
    
    public Vector displayContactListBasedOnChar(String ch) throws RemoteException, FinderException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        Vector vObj = null;
        try {
            vObj = objDAO.selectContactListBasedOnChar(ch);
        }catch(Exception e){
            Debug.print(" Error In displayContactListBasedOnChar : "+e.getMessage());
        }
       return vObj;
    }
    
    public List getStateByAreaId(String areaId) throws RemoteException { 
        Debug.print("VaigaiSessionBean getStateByAreaId");
        HLCMessageDAO dao = new HLCMessageDAO();
        List results = dao.selectStateByAreaId(areaId);
        return results;    
     }
    
    public Vector displayContactListBasedOnUserId(String userId) throws RemoteException, FinderException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        Vector vObj = null;
        try {
            vObj = objDAO.selectContactListBasedOnUserId(userId);
        }catch(Exception e){
            Debug.print(" Error In displayContactListBasedOnUserId : "+e.getMessage());
        }
       return vObj;
    }
    
    public List displayContactListVO(String userId) throws RemoteException, FinderException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        List list = null;
        try {
            list = objDAO.selectContactListVO(userId);
        }catch(Exception e){
            Debug.print(" Error In displayContactListBasedOnUserId : "+e.getMessage());
        }
       return list;
    }
    
    public boolean deleteDistListBasedOnListName(String listName) throws RemoteException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        boolean bol = false;
        try {
            bol = objDAO.deleteDistMasterBasedOnDistName(listName);
        }catch(Exception e){
            Debug.print(" Error In displayContactListBasedOnUserId : "+e.getMessage());
        }
       return bol;
    }
    
    public boolean deleteDistMasterBasedOnContactId(String contactId) throws RemoteException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        boolean bol = false;
        try {
            bol = objDAO.deleteDistMasterBasedOnContactId(contactId);
        }catch(Exception e){
            Debug.print(" Error In deleteDistMasterBasedOnContactId : "+e.getMessage());
        }
       return bol;
    }
    

/**
  * Name         :editcontactListMaster
  * Description  :This method will retrieve the member details for refund details table
  * @ param      :None
  * @return      :member Identification number
  * @throws      :RemoteException, FinderException
  */     
     public boolean editContactListMaster(HLCMsgContactListMaster objContactList) throws RemoteException, FinderException, SQLException {
           System.out.print("Country Mail Type Id : "+objContactList.getContactlistId());
           boolean result = false;
           
                if (objContactList == null && (objContactList.getContactlistId().equals("")) ) {
                  throw new EJBException("Country Mail Type ID can't be empty");
                }
                if (contactListTypeIdExists(objContactList.getContactlistId()) == false) {
                    HLCMessageDAO objDAO = new HLCMessageDAO();
                     try{
                        result = objDAO.updatecontactListOnContactId(objContactList);
                        Debug.print("Message Session Bean contactTypeIdExists inside edit "+ contactlistId);
                    }
                     catch(SQLException sqlExcep){
                         Debug.print("SQL Exception "+sqlExcep);
                     }
                }
                else{
                    Debug.print("Message Session Bean contactTypeIdExists inside edit true part: "+ objContactList.getContactlistId());  

                    Debug.print("First Name :"+objContactList.getFirstName());
                    remote.setContactlistId(objContactList.getContactlistId());
                    if (isNotNull(objContactList.getFirstName())){
                        remote.setFirstName(objContactList.getFirstName());
                    }
                    if (isNotNull(objContactList.getMiddleName())){
                        remote.setMiddleName(objContactList.getMiddleName());
                    }
                    if (isNotNull(objContactList.getLastName())){
                        remote.setLastName(objContactList.getLastName());
                    }
                    if (isNotNull(objContactList.getNickName())){
                        remote.setNickName(objContactList.getNickName());
                    }
                    if (isNotNull(objContactList.getEmailId())){
                        remote.setEmailId(objContactList.getEmailId());
                    }
                    if (isNotNull(objContactList.getAlternateEmailId())){
                        remote.setAlternateEmailId(objContactList.getAlternateEmailId());
                    }
                    if (isNotNull(objContactList.getPhoneNo())){
                        remote.setPhoneNo(objContactList.getPhoneNo());
                    }
                    if (isNotNull(objContactList.getMobileNo())){
                        remote.setMobileNo(objContactList.getMobileNo());
                    }
                    if (isNotNull(objContactList.getFaxNo())){
                        remote.setFaxNo(objContactList.getFaxNo());
                    }
                    if (isNotNull(objContactList.getStreet())){
                        remote.setStreet(objContactList.getStreet());
                    }
                    if (isNotNull(objContactList.getCity())){
                        remote.setCity(objContactList.getCity());
                    }
                    if (isNotNull(objContactList.getState())){
                        remote.setState(objContactList.getState());
                    }
                    if (isNotNull(objContactList.getCountry())){
                        remote.setCountry(objContactList.getCountry());
                    }
                    if (isNotNull(objContactList.getZip())){
                        remote.setZip(objContactList.getZip());
                    }
                    result = true;
               }
                return result;
        }     
     
     public boolean deleteContactListMaster(String contactlistId) throws RemoteException,FinderException{
        Debug.print("Message Session Bean deleteContactListMaster");
        //this.contactlistId = contactlistId.trim();
        Debug.print("Country Mail Type Id :" + contactlistId);
        //UserTransaction ut = context.getUserTransaction();

        boolean result = false;
        if (contactlistId == null) {
            throw new EJBException("countryMailTypeId can't be empty");
        }
        if (contactListTypeIdExists(contactlistId) == false) {
            throw new EJBException("contactListTypeIdExists Not Exists " + contactlistId);
        }
        try {
           // ut.begin();
            remote.remove();
            result = true;
           // ut.commit();
        } catch (Exception ex) {
              throw new EJBException("remove contactListTypeId: " + ex.getMessage());
        }
        finally{
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
   private boolean contactListTypeIdExists(String contactlistId) {
        boolean result =false;
        if ( !(contactlistId.equals(this.contactlistId)) ) {
            try {
              //  Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
                remote = home.findByPrimaryKey(contactlistId);
                this.contactlistId = contactlistId;
                // Debug.print("Message Session Bean contactListTypeIdExists in side home: "+ home);
                //Debug.print("Message Session Bean contactListTypeIdExists in side remote: "+ remote);
                 result =true;
            } catch (Exception ex) {
               result =true;
               System.out.println("Exception:" + ex);
            }
        }
        Debug.print("Message Session Bean contactListTypeIdExists  "+ result);
        return result;
    }      
   
   private boolean isNotNull(String data) {      
          return (data!=null && data.trim().length()>0) ? true :false;      
   } 
   
   /*===================Distribution List ==================================*/
   /* public Collection displayDistributiontList(String listName) throws RemoteException, FinderException {
       Collection col = distHome.findByDistribitionListName( listName);
       return col;
    }*/
  
/**
  * Name         :displayDistribitionListNameAndNoOfMembers
  * Description  :This method will list the distribution list and no of member in that list NAME
  * @ param      : list name
  * @return      :Vector
  * @throws      :RemoteException, FinderException
  */          
    public Vector displayDistribitionListNameAndNoOfMembers(String userId) throws RemoteException, FinderException { 
        HLCMessageDAO objDAO = new HLCMessageDAO();
        Vector vObj = null;
        try {
            vObj = objDAO.selectDistribitionListNameAndNoOfMembers(userId);
        }catch(Exception e){
            Debug.print(" Error In displayDistribitionListNameAndNoOfMembers : "+e.getMessage());
        }
       return vObj;
    }   
    //public Vector selectMemberAdded(String listName) throws SQLException
   public Vector displayAddressBook(String userId) throws RemoteException, FinderException {
       HLCMessageDAO objDAO = new HLCMessageDAO();
        Vector vObj = null;
        try {
            vObj = objDAO.selectAddressBook(userId);
        }catch(Exception e){
            Debug.print(" Error In displayAddressBook : "+e.getMessage());
        }
       return vObj;
   }
   
   public Vector displayMemberAdded(String listName) throws RemoteException, FinderException {
       HLCMessageDAO objDAO = new HLCMessageDAO();
        Vector vObj = null;
        try {
            vObj = objDAO.selectMemberAdded(listName);
        }catch(Exception e){
            Debug.print(" Error In displayAddressBook : "+e.getMessage());
        }
       return vObj;
   }
   
    //public Vector selectDistribitionListName(String listName) throws SQLException
   public Vector displayDistList(String listName) throws RemoteException, FinderException {
       HLCMessageDAO objDAO = new HLCMessageDAO();
        Vector vObj = null;
        try {
            vObj = objDAO.selectDistribitionListName(listName);
        }catch(Exception e){
            Debug.print(" Error In displayContactList : "+e.getMessage());
        }
       return vObj;
   }
    
    public boolean addDisttList(HLCMsgDistributionListMaster objDistList)throws RemoteException {
        try{
             distRemote = distHome.create(objDistList);
        }
        catch(Exception exp){
             throw new EJBException("createDistributionList Details: " + exp.getMessage());
        }
        return true;
    }
    //
/**
  * Name         :getContactDetails
  * Description  :This method will retrieve the contact details form Message contact List Master table
 **               and stored base
  * @ param      :None
  * @return      :List
  * @throws      :RemoteException
  */ 
    public HLCMsgPaginationVO getContactDetails(String sortableName,int offset, int rowSize, String userId) throws RemoteException {
        HLCMessageDAO objDAO = new HLCMessageDAO();
        HLCMsgPaginationVO pageVO = new HLCMsgPaginationVO();
        
        try{
             pageVO = (HLCMsgPaginationVO)objDAO.selectContactDetails(sortableName,offset, rowSize, userId);
             Debug.print("Result in Session Bean : "+pageVO);
        }
        catch(Exception exp){
           
             throw new EJBException("createDistributionList Details: " + exp.getMessage());
        }
        return pageVO;
    }
/**
  * Name         :getAvailableGroup
  * Description  :This method will retrieve the contact details form Message contact List Master table
 **               and stored base
  * @ param      :None
  * @return      :List
  * @throws      :RemoteException
  */ 
    public ArrayList getAvailableGroup(String userID) throws RemoteException {
        ArrayList Avail_Group = null;
        HLCMessageGroupDAO groupDAO = new HLCMessageGroupDAO ();
        try{
               if(userID != null && userID.trim().length()!=0){
                   Avail_Group = groupDAO.selectAvailableGroups(userID);
               }
        }
        catch(Exception exp){
             throw new EJBException("Reading the available Groups for the current user: " + exp.getMessage());
        }
        return Avail_Group;
    }    
/**
  * Name         :editDistributionListMaster
  * Description  :This method will retrieve the member details for refund details table
  * @ param      :None
  * @return      :member Identification number
  * @throws      :RemoteException, FinderException
  */     
     public boolean editDistributionListMaster(HLCMsgDistributionListMaster objDistList) throws RemoteException, FinderException{
           System.out.print("Country Mail Type Id : "+objDistList.getListId());
           boolean result = false;
        if (objDistList == null && (objDistList.getListId().equals("")) ) {
                throw new EJBException("Distribution List Id can't be empty");
            }
        if (distributionListIdExists(objDistList.getListId()) == false) {
            //throw new EJBException("Contact Type ID Not Exists : " + contactTypeId);
               Debug.print("Message Session Bean contactTypeIdExists inside edit "+ listId);
               result = false;
        }
        else{
            Debug.print("Message Session Bean distributionListIdExists inside edit true part: "+ objDistList.getListId()); 
            
            if (isNotNull(objDistList.getContactlistId())){
                distRemote.setContactlistId(objDistList.getContactlistId());
            }
            if (isNotNull(objDistList.getListId())){
                distRemote.setListId(objDistList.getListId());
            }
            if (isNotNull(objDistList.getListName())){
                distRemote.setListName(objDistList.getListName());
            }
            
            
            
            
            result = true;
        }
           return result;
     }
     
     
    public ArrayList displayDistribitionListNameAndmailId(String userId) throws RemoteException, FinderException {
         Debug.print("MessageSessionBean in displayDistribitionListNameAndmailId : calling ");
        HLCMessageGroupDAO objDAO = new HLCMessageGroupDAO();
        ArrayList vObj = null;
        try {
            vObj = (ArrayList)objDAO.selectDistribitionListNameAndmailId(userId);
        }catch(Exception e){
            Debug.print(" Error In displayDistribitionListNameAndmailId : "+e.getMessage());
        }
        return vObj;
    }     
/**
  * Name         :distributionListIdExists
  * Description  :This method will check for the existing of memberId and call the findByPrimaryKey method
  * @ param      :None
  * @return      :boolean value
  * @throws      :none
  */         
   private boolean distributionListIdExists(String listId) {
        boolean result =false;
        if ( !(listId.equals(this.listId)) ) {
            try {
              //  Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
                distRemote = distHome.findByPrimaryKey(listId);
                this.listId = listId;
                // Debug.print("Message Session Bean contactListTypeIdExists in side home: "+ home);
                //Debug.print("Message Session Bean contactListTypeIdExists in side remote: "+ remote);
                 result =true;
            } catch (Exception ex) {
               result =true;
               System.out.println("Exception:" + ex);
            }
        }
        Debug.print("Message Session Bean distributionListIdExists  "+ result);
        return result;
    }     
   
   public boolean deleteDistributionListMaster(String listId) throws RemoteException,FinderException{
        Debug.print("Message Session Bean deleteDistributionListMaster");
        //this.contactlistId = contactlistId.trim();
        Debug.print("distribution List  Id :" + listId);
        //UserTransaction ut = context.getUserTransaction();

        boolean result = false;
        if (listId == null) {
            throw new EJBException("DistributionListMaster ID can't be empty");
        }
        if (distributionListIdExists(listId) == false) {
            throw new EJBException("DistributionListMaster ID Not Exists " + listId);
        }
        try {
           // ut.begin();
            distRemote.remove();
            result = true;
           // ut.commit();
        } catch (Exception ex) {
              throw new EJBException("remove DistributionListMaster: " + ex.getMessage());
        }
        finally{
            return result;
        }   
    }
    
   /*=======================Message Grouping====================================*/
   
    public HLCGroup createGroup(HLCGroup objGrpMst)throws RemoteException {
        HLCMessageGroupDAO objMsgDAO = new HLCMessageGroupDAO();
        HLCGroup objMGM = new HLCGroup();
        HLCGroup objGRP = new HLCGroup();
        boolean result = false;
        if (isNotNull(objGrpMst.getCategoryId())){
            objMGM.setCategoryId(objGrpMst.getCategoryId());
        }
        if (isNotNull(objGrpMst.getUserId())){
            objMGM.setUserId(objGrpMst.getUserId());
        }
        if (isNotNull(objGrpMst.getGroupName())){
            objMGM.setGroupName(objGrpMst.getGroupName());
        }
        if (isNotNull(objGrpMst.getGroupDesc())){
            objMGM.setGroupDesc(objGrpMst.getGroupDesc());
        }
        if (isNotNull(objGrpMst.getGroupType())){
            objMGM.setGroupType(objGrpMst.getGroupType());
        }
        if (isNotNull(objGrpMst.getModeratorId())){
            objMGM.setModeratorId(objGrpMst.getModeratorId());
        }
        
        try{
             result = objMsgDAO.insertRowMsgGroupMaster(objMGM);
             Debug.print("  Group Created : "+result);
             if (result == true){
                objGRP =  objMsgDAO.selectGroupDetails(objGrpMst.getGroupName()) ;
             }
        }
        catch(Exception exp){
             throw new EJBException("createDistributionList Details: " + exp.getMessage());
        }
        return objGRP;
    }
/**
  * Name         :updateGroup
  * Description  :This method will update the Group Master based on group Id
  * @ param      :Group VO
  * @return      :boolean
  * @throws      :RemoteException
  */       
    public boolean updateGroup(HLCGroup objGrpMst)throws RemoteException {
        HLCMessageGroupDAO objMsgDAO = new HLCMessageGroupDAO();
        HLCGroup objMGM = new HLCGroup();
        boolean result = false;
        if (isNotNull(objGrpMst.getGroupId())){
            objMGM.setGroupId(objGrpMst.getGroupId());
        }
        if (isNotNull(objGrpMst.getGroupName())){
            objMGM.setGroupName(objGrpMst.getGroupName());
        }
        if (isNotNull(objGrpMst.getGroupDesc())){
            objMGM.setGroupDesc(objGrpMst.getGroupDesc());
        }
         
        try{
             result = objMsgDAO.updateMsgGroupMaster(objMGM);
        }
        catch(Exception exp){
             throw new EJBException("updateGroup Details: " + exp.getMessage());
        }
       
        return result;
    }
    //Retrieve the groupDetails : Group getGroupDetails(groupId);(not only ids and we need name for categoryId and also categoryname)
/**
  * Name         :getGroupDetails
  * Description  :This method will list the Category name and Category Id 
  * @ param      : list name
  * @return      :Vector
  * @throws      :SQLException
  */        
   public HLCGroup getGroupDetailsBasedOnGroupId(String groupId) throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGMDAO = new HLCMessageGroupDAO();
        HLCGroup objGRP = new HLCGroup();
        try {
            objGRP = objMGMDAO.selectGroupDetailsBasedOnGroupId(groupId);
            Debug.print("Contant of Group In session Bean : "+objGRP);
        }catch(Exception e){
            Debug.print(" Error In getGroupDetails : "+e.getMessage());
        }
       return objGRP;
   }    
   
/**
  * Name         :getGroupDetails
  * Description  :This method will deactivate the group name
  * @ param      :groupName
  * @return      :boolean
  * @throws      :RemoteException, FinderException
  */        
   public boolean deactivateGroupStatus(String groupId) throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGMDAO = new HLCMessageGroupDAO();
        boolean bol = false;
        try {
            bol = objMGMDAO.deactiveGroupStatus(groupId);
            Debug.print("Group Deactivation In session Bean : "+bol);
        }catch(Exception e){
            Debug.print(" Error In deactivateGroupStatus in Session Bean : "+e.getMessage());
        }
       return bol;
   }   
/**
  * Name         :deleteMsgGroupUser
  * Description  :This method will delete a user from the group based on group id and email id
  * @ param      :groupId, emailId
  * @return      :boolean
  * @throws      :RemoteException, FinderException
  */        
   public boolean deleteMsgGroupUser(String groupId, String email) throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGMDAO = new HLCMessageGroupDAO();
        boolean bol = false;
        try {
            bol = objMGMDAO.deleteGroupUser(groupId,email);
            Debug.print("Group Deleted In session Bean : "+bol);
        }catch(Exception e){
            Debug.print(" Error In deactivateGroupStatus in Session Bean : "+e.getMessage());
        }
       return bol;
   }    
    
/**
  * Name         :displayCategory
  * Description  :This method will list the Category name and Category Id 
  * @ param      : list name
  * @return      :Vector
  * @throws      :SQLException
  */        
   public List displayCategory() throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGMDAO = new HLCMessageGroupDAO();
        List list = null;
        try {
            list = objMGMDAO.selectCategory();
            Debug.print("List Contant In session Bean : "+list);
        }catch(Exception e){
            Debug.print(" Error In displayCategory : "+e.getMessage());
        }
       return list;
   }
   //boolean isValidGroupName(String groupName);
/**
  * Name         :isValidGroupName
  * Description  :This method will list the Category name and Category Id 
  * @ param      : list name
  * @return      :Vector
  * @throws      :SQLException
  */        
   public boolean isValidGroupName(String userId, String groupName) throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGMDAO = new HLCMessageGroupDAO();
        boolean bol = false;
        try {
            bol = objMGMDAO.isValidGroupName(userId, groupName);
            Debug.print("Record Exist In session Bean : "+bol);
        }catch(Exception e){
            Debug.print(" Error In displayCategory : "+e.getMessage());
        }
       return bol;
   }
   //selectGroupMyGroupBasedOnOwnerId(String ownerId)
/**
  * Name         :getGroupDetails
  * Description  :This method will list the Detail about the group based on groupName
  * @ param      :ownerId
  * @return      :List
  * @throws      :RemoteException, FinderException
  */        
   public List getGroupMyGroupsList(String ownerId) throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGMDAO = new HLCMessageGroupDAO();
        List list = null;
        boolean bol = false;
        try {
            list = objMGMDAO.selectGroupMyGroupBasedOnOwnerId(ownerId);
            Debug.print("Content of MyGroups In session Bean : "+list);
        }catch(Exception e){
            Debug.print(" Error In getGroupMyGroups : "+e.getMessage());
        }
       return list;
   }   
   
   
/**
  * Name         :getGroupDetails
  * Description  :This method will list the Detail about the group based on groupName
  * @ param      :groupName
  * @return      :Group VO
  * @throws      :RemoteException, FinderException
  */        
   public HLCGroup getGroupDetails(String groupName) throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGMDAO = new HLCMessageGroupDAO();
        HLCGroup objGRP = new HLCGroup();
        boolean bol = false;
        try {
            objGRP = objMGMDAO.selectGroupDetails(groupName);
            Debug.print("Group Detail In session Bean : "+objGRP);
        }catch(Exception e){
            Debug.print(" Error In getGroupDetails : "+e.getMessage());
        }
       return objGRP;
   }   

   /*=======================End OF Message Grouping=============================*/
   
   /*=======================Message Group User ==================================*/
   //boolean isValidEmail(String emailId) 
   public boolean createGroupUser(HLCGroupUser objGrpUsr)throws RemoteException {
        HLCGroupUserDAO objMGUDAO = new HLCGroupUserDAO();
        HLCGroupUser objMGU = new HLCGroupUser();
        boolean result = false;
        if (isNotNull(objGrpUsr.getOwnerId())){
            objMGU.setOwnerId(objGrpUsr.getOwnerId());
        }
        if (isNotNull(objGrpUsr.getUserId())){
            objMGU.setUserId(objGrpUsr.getUserId());
        }
        if (isNotNull(objGrpUsr.getGroupId())){
            objMGU.setGroupId(objGrpUsr.getGroupId());
        }
        if (isNotNull(objGrpUsr.getJoinDate())){
            objMGU.setJoinDate(objGrpUsr.getJoinDate());
        }

        try{
             result = objMGUDAO.insertRowMsgGroupUser(objMGU);
        }
        catch(Exception exp){
             throw new EJBException("createGroupUser Details: " + exp.getMessage());
        }
        return result;
    }

 /*  public boolean createUserInvite(InsertInviteGroupForm inviteGroupForm)throws RemoteException {
        GroupUserDAO objMGUDAO = new GroupUserDAO();
        GroupUser objMGU = new GroupUser();
        boolean result = false;
        if (isNotNull(objGrpUsr.getOwnerId())){
            objMGU.setOwnerId(objGrpUsr.getOwnerId());
        }
        if (isNotNull(objGrpUsr.getUserId())){
            objMGU.setUserId(objGrpUsr.getUserId());
        }
        if (isNotNull(objGrpUsr.getGroupId())){
            objMGU.setGroupId(objGrpUsr.getGroupId());
        }
        if (isNotNull(objGrpUsr.getJoinDate())){
            objMGU.setJoinDate(objGrpUsr.getJoinDate());
        }

        try{
             result = objMGUDAO.insertRowMsgGroupUser(objMGU);
        }
        catch(Exception exp){
             throw new EJBException("createGroupUser Details: " + exp.getMessage());
        }
        return result;
    }   */
/**
  * Name         :getUserId
  * Description  :This method will list the Category name and Category Id 
  * @ param      : list name
  * @return      :Vector
  * @throws      :SQLException
  */        
   public String getUserIdEmail(String emailId) throws RemoteException, FinderException {
        HLCGroupUserDAO objMGDAO = new HLCGroupUserDAO();
        String userId = null;
        try {
            userId = objMGDAO.getUserIdemailId(emailId);
            Debug.print("Record Exist In session Bean : "+userId);
        }catch(Exception e){
            Debug.print(" Error In isValidEmail : "+e.getMessage());
        }
       return userId;
   }     
   
/**
  * Name         :isValidGroupName
  * Description  :This method will list the Category name and Category Id 
  * @ param      : list name
  * @return      :Vector
  * @throws      :SQLException
  */        
   public boolean isValidEmail(String emailId) throws RemoteException, FinderException {
        HLCGroupUserDAO objMGDAO = new HLCGroupUserDAO();
        boolean bol = false;
        try {
            bol = objMGDAO.isValidEmailInDAO(emailId);
            Debug.print("Record Exist In session Bean : "+bol);
        }catch(Exception e){
            Debug.print(" Error In isValidEmail : "+e.getMessage());
        }
       return bol;
   }  
   //public GroupMessage selectPostedMessages(String messageId) throws SQLException
/**
  * Name         :getGroupMyMessages
  * Description  :This method will list the message_id, subject and mesage description based on message Id
  * @ param      :messageId
  * @return      :GroupMessage
  * @throws      :RemoteException,FinderException
  */        
   public HLCGroupMessage getPostedMessages(String messageId) throws RemoteException, FinderException {
        HLCMsgGroupMessageDAO objMGMDAO = new HLCMsgGroupMessageDAO();
       HLCGroupMessage objGM = new HLCGroupMessage();
        try {
            objGM = objMGMDAO.selectPostedMessages(messageId);
            Debug.print("Content for myMessage In session Bean : "+objGM);
        }catch(Exception e){
            Debug.print(" Error In getPostedMessages : "+e.getMessage());
        }
       return objGM;
   }    
/**
  * Name         :selectMessagesAndReplies
  * Description  :This method will list the message_id, subject and mesage description based on groupId and parentMessageId
  * @ param      :groupId, parentMessageId
  * @return      :List
  * @throws      :SQLException
  */          
   // public List selectMessagesAndReplies(String groupId, String parentMessageId )   
    public List getMessagesAndReplies(String groupId, String parentMessageId) throws RemoteException, FinderException {
        HLCMsgGroupMessageDAO objMGMDAO = new HLCMsgGroupMessageDAO();
        List list = null;
        try {
            list = objMGMDAO.selectMessagesAndReplies(groupId,parentMessageId);
            Debug.print("Content for MessagesAndReplies In session Bean : "+list);
        }catch(Exception e){
            Debug.print(" Error In getPostedMessages : "+e.getMessage());
        }
       return list;
   }    
    //public String[] getEmailBasedOnGroupName(String groupName) throws RemoteException;
/**
  * Name         :getEmailBasedOnGroupName
  * Description  :This method will return list of email id based on group name
  * @ param      :groupName
  * @return      :String array
  * @throws      :RemoteException
  */        
   public List getEmailBasedOnGroupName(String groupName) throws RemoteException {
        HLCMsgGroupMessageDAO objMGMDAO = new HLCMsgGroupMessageDAO();
        List str = null;
        try {
            str = objMGMDAO.selectEmailByGroupName(groupName);
            Debug.print("get email id based on groupName In session Bean : "+str);
        }catch(Exception e){
            Debug.print(" Error In getEmailBasedOnGroupName : "+e.getMessage());
        }
       return str;
   } 
   
/**
  * Name         :addUserGroupUser
  * Description  :This method will list message detail for a particular owner
  * @ param      :userMaster VO
  * @return      :List
  * @throws      :SQLException
  */      
   
   public HLCUserMaster addUserGroupUser(HLCUserMaster objUsr, HLCUserMaster secContact) throws RemoteException {
       boolean bol = false;
       HLCGroupUserDAO objDAO = new HLCGroupUserDAO();
       HLCUserMaster userObj = new HLCUserMaster();
        try {
            bol = objDAO.insertUserDetails(objUsr);
            Debug.print("Inserted into user Master In session Bean : "+bol);
            
            userObj = objDAO.selectUserDetail(objUsr.getEmailId());
            
            objUsr.setUserId(userObj.getUserId());
            secContact.setUserId(userObj.getUserId());
            
            bol = objDAO.insertRowContactDetails(objUsr);
            Debug.print("Inserted Primary Contact details In session Bean : "+bol);
            
            if (secContact.getContactType().equalsIgnoreCase("Secondary")){
                bol = objDAO.insertRowContactDetails(secContact);
                Debug.print("Inserted Secondary Contact details In session Bean : "+bol);
            }
            
            bol = objDAO.insertGroupUser(objUsr);
            Debug.print("Inserted into Group User In session Bean : "+bol);
            
        
            
        }catch(Exception e){
            e.printStackTrace();
            Debug.print(" Error In addUserGroupUser : "+e.getMessage());
        }
       
       return userObj;
   }
   
/**
  * Name         :getGroupMyMessages
  * Description  :This method will list message detail for a particular owner
  * @ param      :fromUserId, subject, groupId
  * @return      :List
  * @throws      :RemoteException,FinderException
  */        
   public List getGroupMyMessages(String fromUserId,String subject,String groupId) throws RemoteException, FinderException {
        HLCMsgGroupMessageDAO objMGMDAO = new HLCMsgGroupMessageDAO();
        List list = new ArrayList();
        try {
            list = objMGMDAO.selectGroupMyMessages(fromUserId,subject,groupId);
            Debug.print("List content for myMessage In session Bean : "+list);
        }catch(Exception e){
            Debug.print(" Error In getGroupMyMessages : "+e.getMessage());
        }
       return list;
   } 
//public List getGroupMyMembers(String fromUserId,String subject,String groupId) throws RemoteException, FinderException;  
/**
  * Name         :getGroupMyMembers
  * Description  :This method will list message detail for a particular owner
  * @ param      :fromUserId, subject, groupId
  * @return      :List
  * @throws      :RemoteException,FinderException
  */        //selectGroupMyMember(String ownerId,String subject,String groupId)
   public List getGroupMyMembers(String ownerId,String subject,String groupId) throws RemoteException, FinderException {
        HLCMsgGroupMessageDAO objMGMDAO = new HLCMsgGroupMessageDAO();
        List list = new ArrayList();
        try {
            list = objMGMDAO.selectGroupMyMember(ownerId,subject,groupId);
            Debug.print("List content for myMember In session Bean : "+list);
        }catch(Exception e){
            Debug.print(" Error In getGroupMyMembers : "+e.getMessage());
        }
       return list;
   }    
/**
  * Name         :getGroupName
  * Description  :This method will list the Category name and Category Id 
  * @ param      :userId
  * @return      :List
  * @throws      :RemoteException,FinderException
  */        
   public List getGroupName(String userId) throws RemoteException, FinderException {
        HLCGroupUserDAO objMGDAO = new HLCGroupUserDAO();
        List list = null;
        try {
            list = objMGDAO.selectGroupName(userId);
            Debug.print("List content In session Bean : "+list);
        }catch(Exception e){
            Debug.print(" Error In getGroupName : "+e.getMessage());
        }
       return list;
   }     
   
/**
  * Name         :searchByGroup
  * Description  :This method will list the group detail based on Category Id and Group name
  * @ param      :categoryId, groupName
  * @return      :List
  * @throws      :SQLException
  */    
   public List searchByGroup(String categoryId,String groupName) throws RemoteException, FinderException {
        HLCMessageGroupDAO objMGDAO = new HLCMessageGroupDAO();
        List list = null;
        try {
            list = objMGDAO.searchByGroupAndCategoryId(categoryId,groupName);
            Debug.print("Contain of List In session Bean : "+list);
        }catch(Exception e){
            Debug.print(" Error In Session Bean searchByGroup : "+e.getMessage());
        }
       return list;
   }  
   //MsgGroupMessageDAO
   
   /*=======================End of Message Group Users===========================*/
   
   /*=======================Message Group Message=====================================*/
   // public boolean insertGroupMessage(GroupMessage objGM) throws SQLException
  // group_id,from_user_id,to_user_id,subject,message_desc,parent_message_id,poster_ip,attach_file_path)
   public boolean createGroupMessage(HLCGroupMessage objGM)throws RemoteException {
        HLCMsgGroupMessageDAO objMGMDAO = new HLCMsgGroupMessageDAO();
        HLCGroupMessage objGMBean = new HLCGroupMessage();
        boolean result = false;
        if (isNotNull(objGM.getGroupId())){
            objGMBean.setGroupId(objGM.getGroupId());
        }
        if (isNotNull(objGM.getFromUserId())){
            objGMBean.setFromUserId(objGM.getFromUserId());
        }
        if (isNotNull(objGM.getToUserId())){
            objGMBean.setToUserId(objGM.getToUserId());
        }
        if (isNotNull(objGM.getSubject())){
            objGMBean.setSubject(objGM.getSubject());
        }
        if (isNotNull(objGM.getMessageDesc())){
            objGMBean.setMessageDesc(objGM.getMessageDesc());
        }
        if (isNotNull(objGM.getParentMessageId())){
            objGMBean.setParentMessageId(objGM.getParentMessageId());
        }
        if (isNotNull(objGM.getPosterIp())){
            objGMBean.setPosterIp(objGM.getPosterIp());
        }
        if (isNotNull(objGM.getAttachFilePath())){
            objGMBean.setAttachFilePath(objGM.getAttachFilePath());
        }

        try{
             result = objMGMDAO.insertGroupMessage(objGMBean);
        }
        catch(Exception exp){
             throw new EJBException("createGroupMessage Details: " + exp.getMessage());
        }
        return result;
    }
/**
  * Name         :isValidOwner
  * Description  :This method will check whether the a valid owner or not based on user id
  * @ param      :categoryId, groupName
  * @return      :List
  * @throws      :SQLException
  */    
   public boolean isValidOwner(String userId)  throws RemoteException, FinderException {
        HLCMsgGroupMessageDAO objMGMDAO = new HLCMsgGroupMessageDAO();
        boolean bol = false;
        try {
            bol = objMGMDAO.isValidOwnerBasedOnUserId(userId);
            Debug.print("isValidOwner In session Bean : "+bol);
        }catch(Exception e){
            Debug.print(" Error In Session Bean searchByGroup : "+e.getMessage());
        }
       return bol;
   }     
   
   
   /*=======================End of Message Group Message=====================================*/
   
    /*==================Database Addresses ======================================*/
    //displayMSGDataBase(String userId)
    public List getMembershipTypes() throws RemoteException, FinderException{
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        List lst = null;
        try {
            lst = objDAO.displayMembershipTypeDetails();
            Debug.print("membership details In session Bean : "+lst);
        }catch(Exception e){
            Debug.print(" Error In Session Bean getMembershipTypes : "+e.getMessage());
        }
       return lst;
    }
    
   public List getAdminMsgDownloadReqList() throws RemoteException, FinderException{
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        List lst = null;
        try {
            lst = objDAO.displayAdminMSGDataBase();
            Debug.print("My Database Download Request Listings for admin  In session Bean : "+lst);
        }catch(Exception e){
            Debug.print(" Error In Session Bean getAdminMsgDownloadReqList : "+e.getMessage());
        }
       return lst;
    }
    
    public List getMsgDownloadReqList(String userId) throws RemoteException, FinderException{
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        List lst = null;
        try {
            lst = objDAO.displayMSGDataBase(userId);
            Debug.print("My Database Download Request Listings  In session Bean : "+lst);
        }catch(Exception e){
            Debug.print(" Error In Session Bean getMsgDownloadReqList : "+e.getMessage());
        }
       return lst;
    }

    public String getEmailId(String userId) throws RemoteException, FinderException{
        HLCMessageGroupDAO objDAO = new HLCMessageGroupDAO();
        String emailId = null;
        try {
            emailId = objDAO.getEmailId(userId);
            Debug.print("Email Id  In session Bean : "+emailId);
        }catch(Exception e){
            Debug.print(" Error In Session Bean getMsgDownloadReqList : "+e.getMessage());
        }
       return emailId;
    }
    
    public boolean updateRequestStatus(String  dbReqId, String status, String comments) throws RemoteException {
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        HLClMsgDBRequestDetailsVO objMDB = new HLClMsgDBRequestDetailsVO();
        boolean bol = false;
        try {
                bol = objDAO.updateDBRequest(dbReqId, status, comments);
                Debug.print("My Database Download Request Update Status  In session Bean : "+bol);
            }catch(Exception e){
                Debug.print(" Error In Session Bean updateRequestStatus : "+e.getMessage());
            }
        return bol;
    }
    
    public HLClMsgDBRequestDetailsVO getMsgDownloadReqListDetail(String dbReqId) throws RemoteException, FinderException{
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        HLClMsgDBRequestDetailsVO objMDB = new HLClMsgDBRequestDetailsVO();
        if (dbReqId != null && dbReqId.length() > 0){
            try {
                objMDB = objDAO.displayMSGDataBaseDetail(dbReqId);
                Debug.print("My Database Download Request Detail  In session Bean : "+objMDB);
            }catch(Exception e){
                Debug.print(" Error In Session Bean getMsgDownloadReqList : "+e.getMessage());
            }
        }else {
            Debug.print(" Db Registration Id cannot be null");
        }
       return objMDB;
    }
    // public List getUserDetails(String dbReqId)
    public List getUserDetailForDownload(String[] dbReqId) throws RemoteException, FinderException {
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        List lst = null;
        try {
            lst = objDAO.getUserDetails(dbReqId);
            Debug.print("user details in List  In session Bean : "+lst);
        }catch(Exception e){
            Debug.print(" Error In Session Bean getUserDetailForDownload : "+e.getMessage());
        }
       return lst;
    }
    
     public List getMembershipStatus() throws RemoteException, FinderException {
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        List lst = null;
        try {
            lst = objDAO.displayMembershipStatus();
            Debug.print("membership status In session Bean : "+lst);
        }catch(Exception e){
            Debug.print(" Error In Session Bean getMembershipStatus : "+e.getMessage());
        }
       return lst;
    }
    
    public List SearchAndListDBAddress(String fromZipCode, String toZipCode, String memberTypeId, String statusId) throws RemoteException, FinderException {
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        List lst = null;
        try {
            lst = objDAO.getSearchAndListDBAddress(fromZipCode,toZipCode,memberTypeId,statusId);
            Debug.print("Search & List Database Addresses  In session Bean : "+lst);
        }catch(Exception e){
            Debug.print(" Error In Session Bean SearchAndListDBAddress : "+e.getMessage());
        }
       return lst;
    }
    //lMsgDBRequestDetailsVO
    public boolean createMsgDBRequestDetails(HLClMsgDBRequestDetailsVO objMBDRD) throws RemoteException, FinderException{
        HLCMsgDataBaseDAO objDAO = new HLCMsgDataBaseDAO();
        boolean bol = false;
        if (objMBDRD.getUserId() != null) {
            try {

                bol = objDAO.addMsgDBRequestDetails(objMBDRD);
                Debug.print("createMsgDBRequestDetails In session Bean : "+bol);
            }catch(Exception e){
                Debug.print(" Error In Session Bean createMsgDBRequestDetails : "+e.getMessage());
            }
        }
        Debug.print("  \n"+objMBDRD);
       return bol;
    }
    
     public boolean setModeratorByGroupId(String modUserId, String groupId)throws RemoteException {
            Debug.print("ArabianSeaEntityBean insertRowContactDetails");
             System.out.print("modUserId    : "+modUserId);
                Debug.print("groupId : "+groupId);
                
            boolean stat = false;
            
             try {
                makeConnection();
                
                String insertStatement = 
                   "update " + DBHelper.USEA_MSG_GROUPMASTER + " set moderator_id = ? where group_id = ?";
                        
                prepStmt = con.prepareStatement(insertStatement);
                System.out.println("Inside the Contact Details ....\n\n ");
                prepStmt.setString(1, modUserId);
                prepStmt.setString(2, groupId);
                
                int cnt = prepStmt.executeUpdate();
                System.out.print("Record Inserted succefully  "+cnt);
                               if(cnt>0)
                                   stat = true;
                prepStmt.close();
                releaseConnection();
                
          }catch (SQLException e){
            releaseConnection();
            e.printStackTrace();
          }
            catch (Exception ex){
            releaseConnection();
            ex.printStackTrace();
          }
          return stat;
        }
     
     
     /**
  * Name         :makeConnection
  * Description  :This method will create the databacse connection
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
    
    /*==================END of Database Addresses ======================================*/
   
    
    /**===================Initialization for Initial Context===============================*/
    
    public InitialContext getInitialContext() throws javax.naming.NamingException {
        if( this.ic == null ) {
            ic = new InitialContext();
        }
        System.out.println("This is from getInitialContext()");
        return ic;
    }

    public String getContactlistId() {
        return contactlistId;
    }
    
}