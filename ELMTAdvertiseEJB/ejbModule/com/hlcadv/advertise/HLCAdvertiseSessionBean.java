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
/*  Program Name    : AdvertiseSessionBean.java
 *  Created Date    : Aug 26, 2006 10:29:43 AM
 *  Author          : Suresh.K
 *  Version         : 1.20
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.hlcadv.advertise;


import com.hlcadv.masters.HLCDimensionDetailLocal;
import com.hlcadv.masters.HLCDimensionDetailLocalHome;
import com.hlcadv.masters.HLCDimensionLocal;
import com.hlcadv.masters.HLCDimensionLocalHome;
import com.hlcadv.masters.HLCDisplaySubTypeMasterLocal;
import com.hlcadv.masters.HLCDisplaySubTypeMasterLocalHome;
import com.hlcadv.masters.HLCDisplayTypeMasterLocal;
import com.hlcadv.masters.HLCDisplayTypeMasterLocalHome;
import com.hlcadv.masters.HLCIssueMasterLocal;
import com.hlcadv.masters.HLCIssueMasterLocalHome;
import com.hlcadv.masters.HLCMapPriceLocal;
import com.hlcadv.masters.HLCMapPriceLocalHome;
import com.hlcadv.masters.HLCMediaMasterLocal;
import com.hlcadv.masters.HLCMediaMasterLocalHome;
import com.hlccommon.util.HLCAdsDetailedVO;
import com.hlccommon.util.HLCAdvertisementVO;
import com.hlccommon.util.Debug;
import com.hlccommon.util.HLCManifestVO;
import javax.ejb.*;
import java.sql.*;
import javax.naming.*;
import java.rmi.*;
import java.util.*;
import com.hlccommon.util.HLCAdvertiserVO;
import com.hlcadv.advertise.dao.HLCAdvertiseDAO;



/**
 * This is the bean class for the AdvertiseSessionBean enterprise bean.
 * Created Aug 26, 2006 10:29:43 AM
 * @author suresh
 */
public class HLCAdvertiseSessionBean implements SessionBean, HLCAdvertiseSessionRemoteBusiness {
    private SessionContext context;
    private InitialContext ic;
    private Connection con;
    
    private HLCMediaMasterLocalHome objMediaHome;
    private HLCMediaMasterLocal objMediaRemote;
    
    private HLCDimensionLocalHome objDimHome;
    private HLCDimensionLocal objDimRemote;
    
    private HLCIssueMasterLocalHome objIssueHome;
    private HLCIssueMasterLocal objIssueRemote;
    
    private HLCDisplayTypeMasterLocalHome objTypeHome;
    private HLCDisplayTypeMasterLocal objTypeRemote;

    private HLCDisplaySubTypeMasterLocalHome objSubTypeHome;
    private HLCDisplaySubTypeMasterLocal objSubTypeRemote;
    
    private HLCDimensionDetailLocalHome objDimDetHome;
    private HLCDimensionDetailLocal objDimDetRemote;
    
    private HLCMapPriceLocalHome objMapHome;
    private HLCMapPriceLocal objMapRemote;
    
    private HLCAdvertiseLocalHome objAdsHome;
    private HLCAdvertiseLocal objAdsRemote;  
    
    
    private HLCAdsDetailLocalHome objAdsDetHome;
    private HLCAdsDetailLocal objAdsDetRemote;

    
    
    private String mediaId;
    public String mediaName;
    private String dimensionTypeId;
    public String dimensionTypeName;
    private String issueId;
    public String issueName;
    
    private String displayTypeId;
    private String displayTypeName;
    
    private String displaySubTypeId;
    private String displaySubTypeName;
    
    private String dimensionId;
    
    private String advMapId;
    private String advertisementId;
    
    
   
    
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
  * @Method Name    :ejbCreate.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void  value.
  * @throws         :CreateException.
  */
    public void ejbCreate() throws CreateException {
        try{
            InitialContext jndiContext = getInitialContext();
            Object objMedia = jndiContext.lookup("HLCMediaMasterLocalHome");
            objMediaHome = (HLCMediaMasterLocalHome)objMedia;
            
            Object objDim = jndiContext.lookup("HLCDimensionLocalHome");
            objDimHome = (HLCDimensionLocalHome)objDim;
            
            Object objIssue = jndiContext.lookup("HLCIssueMasterLocalHome");
            objIssueHome = (HLCIssueMasterLocalHome)objIssue;
            
            Object objType = jndiContext.lookup("HLCDisplayTypeMasterLocalHome");
            objTypeHome = (HLCDisplayTypeMasterLocalHome)objType;
            
            Object objSubType = jndiContext.lookup("HLCDisplaySubTypeMasterLocalHome");
            objSubTypeHome = (HLCDisplaySubTypeMasterLocalHome)objSubType;
            
            Object objDimDetType = jndiContext.lookup("HLCDimensionDetailLocalHome");
            objDimDetHome = (HLCDimensionDetailLocalHome)objDimDetType;
            
            Object objAds = jndiContext.lookup("HLCAdvertiseLocalHome");
            objAdsHome = (HLCAdvertiseLocalHome)objAds;
            
            Object objMapPrice = jndiContext.lookup("HLCMapPriceLocalHome");
            objMapHome = (HLCMapPriceLocalHome)objMapPrice;
            
            Object objAdsDet = ic.lookup("HLCAdsDetailLocalHome");
            objAdsDetHome = (HLCAdsDetailLocalHome)objAdsDet;  
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
/*===================================Media Master =============================================*/
/**
  * @Method Name    :createMedia.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaName , String mediaDescription.
  * @return         :boolean  value.
  * @throws         :RemoteException.
  */
    public boolean createMedia(String mediaName , String mediaDescription) throws RemoteException{
        Debug.print("AdvertiseSessionBean createMedia");
        boolean result = false;
        try{
            if (mediaNameExists(mediaName) == false) {
                Debug.print("This name is already Exists");
                result = false;
                // throw new EJBException("PlanName Already Exist" + planName);
            }
            else{
                objMediaRemote = objMediaHome.create(mediaName,mediaDescription);
                result =  true;
            }
        }
        catch(Exception exp){
            //throw new EJBException("createMedia Details: " + exp.getMessage());
            exp.printStackTrace();
        }
        finally{
            return result;
        }   
    }
    
/**
  * @Method Name    :editMedia.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId , String mediaName, String mediaDescription.
  * @return         :boolean  value.
  * @throws         :RemoteException.
  */
    
    public boolean editMedia(String mediaId, String mediaName , String mediaDescription) throws RemoteException{
        Debug.print("AdvertiseSessionBean editMedia");
        boolean result = false;
        try{
            if (mediaId == null ) {
                throw new EJBException("Media ID can't be empty");
            }
            if (mediaNameEditExists(mediaId,mediaName) == false) {
                Debug.print("AdvertiseSessionBean editMedia This name is already Exists");
                result = false;
               // throw new EJBException("PlanName Already Exist" + planName);
            }
            else{
                if (mediaExists(mediaId) == false) {
                    Debug.print("Media ID does not Exists" + mediaId);
                    //throw new EJBException("Media ID does not Exists" + mediaId);
                    result = false;
                }
                else{
                    objMediaRemote.setMediaName(mediaName);
                    objMediaRemote.setMediaDescription(mediaDescription);
                    result = true;
                }
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        finally{
            return result;
        }
    }

/**
  * @Method Name    :getMediaDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId.
  * @return         :String[]  value.
  * @throws         :RemoteException, FinderException.
  */

    public String[] getMediaDetails(String mediaId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getMediaDetails");
        if (mediaExists(mediaId) == false) {
            //throw new EJBException("Media ID doesnot Exists" + mediaId);
            return null;
        }
       else{
           String mediaIdVal =  objMediaRemote.getMediaId();
           String mediaName =  objMediaRemote.getMediaName();
           String mediaDesc =  objMediaRemote.getMediaDescription();
           String mediaStatus =String.valueOf(objMediaRemote.isActiveStatus());
           String media [] = {mediaIdVal,mediaName,mediaDesc,mediaStatus};
           return media;
       }
    }

/**
  * @Method Name    :getAllMediaDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
  */
    public Vector getAllMediaDetails( ) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllMediaDetails");
        Vector mediaList = new Vector();
        Collection result = objMediaHome.findByAll();
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCMediaMasterLocal objMedialocalRemote = (HLCMediaMasterLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllMediaDetails");
            String mediaIdVal  = objMedialocalRemote.getMediaId();
            String mediaName =  objMedialocalRemote.getMediaName();
            String mediaDesc =  objMedialocalRemote.getMediaDescription();
            String mediaStatus = String.valueOf(objMedialocalRemote.isActiveStatus());
            String media [] = {mediaIdVal,mediaName,mediaDesc,mediaStatus};
            mediaList.add(media);
        }
        return mediaList;
    }
    
/**
  * @Method Name    :deleteMedia.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
  */
    public boolean deleteMedia(String mediaId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean deleteMedia");
        Debug.print("Plan ID:" + mediaId);
        boolean result = false;
        if (mediaId == null) {
            throw new EJBException("Media ID can't be empty");
        }
        if (mediaExists(mediaId) == false) {
            throw new EJBException("Media ID Not Exists" + mediaId);
        }
        try {
            objMediaRemote.remove();
            result = true;
        } catch (Exception ex) {
              throw new EJBException("deleteMedia: " + ex.getMessage());
        }
        finally{
            return result;
        }   
    }

/**
  * @Method Name    :mediaExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean mediaExists(String mediaId) {
        Debug.print("AdvertiseSessionBean mediaExists");
        if (mediaId != this.mediaId) {
            try {
                objMediaRemote = objMediaHome.findByPrimaryKey(mediaId);
                this.mediaId = mediaId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Media Id :" + mediaId);
        return true;
    }
    
/**
  * @Method Name    :mediaNameExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaName.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean mediaNameExists(String mediaName) {
        Debug.print("AdvertiseSessionBean mediaNameExists");
        boolean result = true;
        if (!(mediaName.equalsIgnoreCase(this.mediaName))) {
            try {
               ArrayList  mName = (ArrayList) objMediaHome.findByMediaName(mediaName);
               Iterator e = mName.iterator();
               while(e.hasNext()){
                   HLCMediaMasterLocal objMediaLocalRemote = (HLCMediaMasterLocal)e.next();
                   String meName = objMediaLocalRemote.getMediaName();
                   if(meName.equalsIgnoreCase(mediaName)){
                       this.mediaName = mediaName;
                       result = false;
                       Debug.print("Inside  mediaNameExists:" + mediaName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Media Name Outer Most" + result);
        return result;
    }
    
 /**
  * @Method Name    :mediaNameEditExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String mediaName.
  * @return         :boolean value.
  * @throws         :Null.
  */   
    private boolean mediaNameEditExists(String mediaId, String mediaName) {
        Debug.print("AdvertiseSessionBean mediaNameEditExists");
        boolean result = true;
        if (!(mediaName.equalsIgnoreCase(this.mediaName))) {
            try {
               ArrayList  mName = (ArrayList) objMediaHome.findByEditMediaName(mediaId,mediaName);
               Iterator e = mName.iterator();
               while(e.hasNext()){
                   HLCMediaMasterLocal objMediaLocalRemote = (HLCMediaMasterLocal)e.next();
                   String meName = objMediaLocalRemote.getMediaName();
                   if(meName.equalsIgnoreCase(mediaName)){
                       this.mediaName = mediaName;
                       result = false;
                       Debug.print("Inside  mediaNameExists:" + mediaName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Edit Media Name Outer Most:" + result);
        return result;
    }
        
 
/*===================================End of Media Master =============================================*/    

/*===================================Dimension Master =============================================*/    
 /**
  * @Method Name    :createDimension.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeName.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */   
    public boolean createDimension(String dimensionTypeName ) throws RemoteException{
        Debug.print("AdvertiseSessionBean createDimension");
        boolean result = false;
        try{
            if (dimNameExists(dimensionTypeName) == false) {
                Debug.print("This name is already Exists");
                result = false;
                // throw new EJBException("PlanName Already Exist" + planName);
            }
            else{
                objDimRemote = objDimHome.create(dimensionTypeName);
                result =  true;
            }
        }
        catch(Exception exp){
            //throw new EJBException("createMedia Details: " + exp.getMessage());
            exp.printStackTrace();
        }
        finally{
            return result;
        }   
    } 

 /**
  * @Method Name    :editDimension.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeId, String dimensionTypeName.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */   
    public boolean editDimension(String dimensionTypeId, String dimensionTypeName) throws RemoteException{
        Debug.print("AdvertiseSessionBean editDimension");
        boolean result = false;
        try{
            if (dimensionTypeId == null ) {
                throw new EJBException("Dimension ID can't be empty");
            }
            
            if (dimNameEditExists(dimensionTypeId,dimensionTypeName) == false) {
                Debug.print("AdvertiseSessionBean editMedia This name is already Exists");
                result = false;
               // throw new EJBException("PlanName Already Exist" + planName);
            }
            else{
                if (dimensionExists(dimensionTypeId) == false) {
                    Debug.print("Dimension ID does not Exists" + dimensionTypeId);
                    //throw new EJBException("Dimension ID does not Exists" + dimensionTypeId);
                    result = false;
                }
                else{
                    objDimRemote.setDimensionTypeName(dimensionTypeName);
                    result = true;
                }
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        finally{
            return result;
        }
    }

 /**
  * @Method Name    :getDimensionDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeId.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
  */   
    public String[] getDimensionDetails(String dimensionTypeId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getMediaDetails");
        if (dimensionExists(dimensionTypeId) == false) {
            throw new EJBException("Media ID doesnot Exists" + dimensionTypeId);
        }
       dimensionTypeId =  objDimRemote.getDimensionTypeId();
       String dimensionTypeName =  objDimRemote.getDimensionTypeName();
       String dimStatus =String.valueOf(objDimRemote.isActiveStatus());
       String dimension [] = {dimensionTypeId,dimensionTypeName,dimStatus};
       return dimension;
    }
    
 /**
  * @Method Name    :getDisplayDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeId.
  * @return         :AdvertisementVO value.
  * @throws         :RemoteException, FinderException.
  */       
        public HLCAdvertisementVO getDisplayDetails(String dimensionTypeId) throws RemoteException,FinderException{
        
          Debug.print("AdvertiseSessionBean getMediaDetails");
       
         return new HLCAdvertiseDAO().getDimensionDetails(dimensionTypeId);
        }
        
 /**
  * @Method Name    :getAllDimensionDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
  */         
    public Vector getAllDimensionDetails( ) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllDimensionDetails");
        Vector dimList = new Vector();
        Collection result = objDimHome.findByAll();
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCDimensionLocal objDimlocalRemote = (HLCDimensionLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllDimensionDetails");
            dimensionTypeId =  objDimlocalRemote.getDimensionTypeId();
            String dimensionTypeName =  objDimlocalRemote.getDimensionTypeName();
            String dimStatus = String.valueOf(objDimlocalRemote.isActiveStatus());
            String dimension [] = {dimensionTypeId,dimensionTypeName,dimStatus};
            dimList.add(dimension);
        }
        return dimList;
    }
    
 /**
  * @Method Name    :deleteDimension.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeId.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
  */   
    public boolean deleteDimension(String dimensionTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean deleteDimension");
        Debug.print("Dimesion ID:" + dimensionTypeId);
        boolean result = false;
        if (dimensionTypeId == null) {
            throw new EJBException("Dimension ID can't be empty");
        }
        if (dimensionExists(dimensionTypeId) == false) {
            throw new EJBException("Dimension ID does not  Exists" + dimensionTypeId);
        }
        try {
            objDimRemote.remove();
            result = true;
        } catch (Exception ex) {
              throw new EJBException("deleteDimension: " + ex.getMessage());
        }
        finally{
            return result;
        }   
    }
    
 /**
  * @Method Name    :dimensionExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeId.
  * @return         :boolean value.
  * @throws         :Null.
  */  
    private boolean dimensionExists(String dimensionTypeId) {
        Debug.print("AdvertiseSessionBean dimensionExists");
        if (dimensionTypeId != this.dimensionTypeId) {
            try {
                objDimRemote = objDimHome.findByPrimaryKey(dimensionTypeId);
                this.dimensionTypeId = dimensionTypeId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Dimension Id :" + dimensionTypeId);
        return true;
    }
   
 /**
  * @Method Name    :dimNameExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeName.
  * @return         :boolean value.
  * @throws         :Null.
  */  
    private boolean dimNameExists(String dimensionTypeName) {
        Debug.print("AdvertiseSessionBean dimNameExists");
        boolean result = true;
        if (!(dimensionTypeName.equalsIgnoreCase(this.dimensionTypeName))) {
            try {
               ArrayList  dName = (ArrayList) objDimHome.findByDimensionTypeName(dimensionTypeName);
               Iterator e = dName.iterator();
               while(e.hasNext()){
                   HLCDimensionLocal objDimLocalRemote = (HLCDimensionLocal)e.next();
                   String dimName = objDimLocalRemote.getDimensionTypeName();
                   if(dimName.equalsIgnoreCase(dimensionTypeName)){
                       this.dimensionTypeName = dimensionTypeName;
                       result = false;
                       Debug.print("Inside  dimNameExists:" + dimensionTypeName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Dimension Name Outer Most" + result);
        return result;
    }

 /**
  * @Method Name    :dimNameEditExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionTypeId, String dimensionTypeName.
  * @return         :boolean value.
  * @throws         :Null.
  */  
    private boolean dimNameEditExists(String dimensionTypeId, String dimensionTypeName) {
        Debug.print("AdvertiseSessionBean dimNameEditExists");
        boolean result = true;
        if (!(dimensionTypeName.equalsIgnoreCase(this.dimensionTypeName))) {
            try {
               ArrayList  dName = (ArrayList) objDimHome.findByDimensionEditTypeName(dimensionTypeId,dimensionTypeName);
               Iterator e = dName.iterator();
               while(e.hasNext()){
                   HLCDimensionLocal objDimLocalRemote = (HLCDimensionLocal)e.next();
                   String dimName = objDimLocalRemote.getDimensionTypeName();
                   if(dimName.equalsIgnoreCase(dimensionTypeName)){
                       this.dimensionTypeName = dimensionTypeName;
                       result = false;
                       Debug.print("Inside  dimNameEditExists:" + dimensionTypeName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("EditDimension Name Outer Most" + result);
        return result;
    }
/*===================================End of Dimension Master =============================================*/    
    
    /*===================================Issue Master =============================================*/ 
/**
  * @Method Name    :createIssue.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String issueName,String mediaId.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */  
    public boolean createIssue(String issueName,String mediaId) throws RemoteException{
        Debug.print("AdvertiseSessionBean createIssue");
        boolean result = false;
        try{
            if (issueNameExists(issueName) == false) {
                Debug.print("This name is already Exists");
                result = false;
            }
            else{
                objIssueRemote = objIssueHome.create(issueName, mediaId);
                result =  true;
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        finally{
            return result;
        }   
    }   
    
/**
  * @Method Name    :editIssue.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String issueId, String issueName,String mediaId.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean editIssue(String issueId, String issueName,String mediaId) throws RemoteException{
        Debug.print("AdvertiseSessionBean editIssue");
        boolean result = false;
        try{
            if (issueId == null ) {
                throw new EJBException("Issue ID can't be empty");
            }
            if (issueNameEditExists(issueId,issueName) == false) {
                Debug.print("AdvertiseSessionBean editIssue This name is already Exists");
                result = false;
               // throw new EJBException("PlanName Already Exist" + planName);
            }
            else{
                if (issueExists(issueId) == false) {
                    //throw new EJBException("Issue ID does not Exists" + dimensionTypeId);
                    Debug.print("Issue ID does not Exists" + issueId);
                    result = false;
                }
                else{
                    objIssueRemote.setIssueName(issueName);
                    objIssueRemote.setMediaId(mediaId);
                    result = true;
                }
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        finally{
            return result;
        }
    }
 
/**
  * @Method Name    :getIssueDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String issueId.
  * @return         :String[] value.
  * @throws         :RemoteException, FinderException.
  */
    public String[] getIssueDetails(String issueId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getIssueDetails");
        if (issueExists(issueId) == false) {
            throw new EJBException("Issue ID doesnot Exists" + issueId);
        }
       issueId =  objIssueRemote.getIssueId();
       String issueNa =  objIssueRemote.getIssueName();
       String mediaId = objIssueRemote.getMediaId();
       String issueStatus =String.valueOf(objIssueRemote.isActiveStatus());
       String issue [] = {issueId,issueNa,mediaId,issueStatus};
       return issue;
    }

/**
  * @Method Name    :getAllIssueDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
  */
    public Vector getAllIssueDetails( ) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllIssueDetails");
        Vector issueList = new Vector();
        Collection result = objIssueHome.findByAll();
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCIssueMasterLocal objIssuelocalRemote = (HLCIssueMasterLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllIssueDetails");
            issueId =  objIssuelocalRemote.getIssueId();
            String issueNa =  objIssuelocalRemote.getIssueName();
            String mediaId = objIssuelocalRemote.getMediaId();
            String issueStatus = String.valueOf(objIssuelocalRemote.isActiveStatus());
            String issue [] = {issueId,issueNa,mediaId,issueStatus};
            issueList.addElement(issue);
        }
        return issueList;
    }
    
/**
  * @Method Name    :getIssueByMedia.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
  */
    public Vector getIssueByMedia(String mediaId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getIssueByMedia");
        Vector issueList = new Vector();
        Collection result = objIssueHome.findByMediaId(mediaId);
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCIssueMasterLocal objIssuelocalRemote = (HLCIssueMasterLocal)e.next();
            Debug.print("AdvertiseSessionBean getIssueByMedia");
            issueId =  objIssuelocalRemote.getIssueId();
            issueName =  objIssuelocalRemote.getIssueName();
            String mediaIdVal = objIssuelocalRemote.getMediaId();
            String issueStatus = String.valueOf(objIssuelocalRemote.isActiveStatus());
            String issue [] = {issueId,issueName,mediaIdVal,issueStatus};
            issueList.addElement(issue);
        }
        return issueList;
     }

/**
  * @Method Name    :deleteIssue.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String issueId.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
  */
    public boolean deleteIssue(String issueId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean deleteIssue");
        Debug.print("Issue ID:" + issueId);
        boolean result = false;
        if (issueId == null) {
            throw new EJBException("Issue ID can't be empty");
        }
        if (issueExists(issueId) == false) {
            throw new EJBException("Issue ID does not  Exists" + issueId);
        }
        try {
            objIssueRemote.remove();
            result = true;
        } catch (Exception ex) {
              throw new EJBException("deleteIssue: " + ex.getMessage());
        }
        finally{
            return result;
        }   
    }
   
/**
  * @Method Name    :issueExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String issueId.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean issueExists(String issueId) {
        Debug.print("AdvertiseSessionBean issueExists");
        if (issueId != this.issueId) {
            try {
                objIssueRemote = objIssueHome.findByPrimaryKey(issueId);
                this.issueId = issueId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Issue Id :" + issueId);
        return true;
    }
   
/**
  * @Method Name    :issueNameExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String issueId.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean issueNameExists(String issueName) {
        Debug.print("AdvertiseSessionBean issueNameExists");
        boolean result = true;
        if (!(issueName.equalsIgnoreCase(this.issueName))) {
            try {
               ArrayList  iName = (ArrayList) objIssueHome.findByIssueName(issueName);
               Iterator e = iName.iterator();
               while(e.hasNext()){
                   HLCIssueMasterLocal objIssueLocalRemote = (HLCIssueMasterLocal)e.next();
                   String issueNameRs = objIssueLocalRemote.getIssueName();
                   
                   if(issueNameRs.equalsIgnoreCase(issueName)){
                       this.issueName = issueName;
                       result = false;
                       Debug.print("Issue Name alreay exists:" + issueName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Issues Name Outer Most" + result);
        return result;
    }
  
/**
  * @Method Name    :issueNameEditExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String issueId, String issueName.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean issueNameEditExists(String issueId, String issueName) {
        Debug.print("AdvertiseSessionBean issueNameEditExists");
        boolean result = true;
        Debug.print("issueNameEditExists  issueName:" + issueName);
        Debug.print("issueNameEditExists  this.issueName:" + this.issueName);
        if (!(issueName.equalsIgnoreCase(this.issueName))) {
            try {
               ArrayList  iName = (ArrayList) objIssueHome.findByIssueEditName(issueId,issueName);
               Debug.print("issueNameEditExists  issueName:" + issueName);
               Iterator e = iName.iterator();
               if(e.hasNext()){
                   Debug.print("issueNameEditExists  issueName:" + issueName);
                  // IssueMasterLocal objIssueLocalRemote = (IssueMasterLocal)e.next();
                  // String issueNameRs = objIssueLocalRemote.getIssueName();
                 //  if(issueNameRs.equalsIgnoreCase(issueName)){
                       //this.issueName = issueName;
                       result = false;
                       Debug.print("issueNameEditExists Issue Name alreay exists result:" + result);
                    //   break;
                //   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             Debug.print("issueNameEditExists  else Part:" + issueName);
             result = false;
        }
        Debug.print("Edit Issues Name Outer Most" + result);
        return result;
    }
/*===================================End of Issue Master =============================================*/    
    
    /*===================================Display Type Master =============================================*/
    
/**
  * @Method Name    :createDisplayType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeName , String mediaId, String displayTypeDescription.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean createDisplayType(String displayTypeName , String mediaId, String displayTypeDescription) throws RemoteException {
        Debug.print("AdvertiseSessionBean createDisplayType");
        boolean result = false;
        try{
            if (displayTypeNameExists(displayTypeName) == false) {
                Debug.print("This name is already Exists");
                result = false;
            }
            else{
                objTypeRemote = objTypeHome.create(displayTypeName, mediaId, displayTypeDescription );
                Debug.print("After Insertion");
                result =  true;
            }
        }
        catch(Exception exp){
            Debug.print("Exception in createDisplay:" + exp.getMessage());
            exp.printStackTrace();
        }
        finally{
            return result;
        }   
     }  
    
/**
  * @Method Name    :editDisplayType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeId, String displayTypeName , String mediaId, String displayTypeDescription.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean editDisplayType(String displayTypeId, String displayTypeName , String mediaId, String displayTypeDescription) throws RemoteException{
        Debug.print("AdvertiseSessionBean editDisplayType");
        boolean result = false;
        try{
            if (displayTypeId == null ) {
                throw new EJBException("Display ID can't be empty");
            }
            
            if (displayTypeEditNameExists(displayTypeId,displayTypeName) == false) {
                Debug.print("AdvertiseSessionBean displayTypeEditNameExists This name is already Exists");
                result = false;
               // throw new EJBException("PlanName Already Exist" + planName);
            }
            else{
            if (displayTypeExists(displayTypeId) == false) {
                    //throw new EJBException("Display ID does not Exists" + displayTypeId);
                    Debug.print("Display ID does not Exists" + displayTypeId);
                    result = false;
                }
                else{
                    objTypeRemote.setDisplayTypeName(displayTypeName);
                    objTypeRemote.setMediaId(mediaId);
                    objTypeRemote.setDisplayTypeDescription(displayTypeDescription);
                    result = true;
                }
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        finally{
            return result;
        }
    }
    
/**
  * @Method Name    :getDisplayTypeDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeId.
  * @return         :String[] value.
  * @throws         :RemoteException, FinderException.
  */
    public String[] getDisplayTypeDetails(String displayTypeId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getDisplayTypeDetails");
        if (displayTypeExists(displayTypeId) == false) {
            throw new EJBException("Display ID doesnot Exists" + displayTypeId);
        }
       Debug.print("AdvertiseSessionBean After getDisplayTypeDetails");
       displayTypeId =  objTypeRemote.getDisplayTypeId();
        Debug.print("AdvertiseSessionBean Success");
       String displayTypeName =  objTypeRemote.getDisplayTypeName();
        Debug.print("AdvertiseSessionBean Success");
       String mediaId = objTypeRemote.getMediaId();
        Debug.print("AdvertiseSessionBean Success");
       String displayTypeDescription =  objTypeRemote.getDisplayTypeDescription();
        Debug.print("AdvertiseSessionBean Success");
       String dispStatus =String.valueOf(objTypeRemote.isActiveStatus());
        Debug.print("AdvertiseSessionBean Success");
       String dispType [] = {displayTypeId,displayTypeName,mediaId,displayTypeDescription,dispStatus};
        Debug.print("AdvertiseSessionBean Success");
       return dispType;
    }

/**
  * @Method Name    :getAllDisplayTypeDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
  */
    public Vector getAllDisplayTypeDetails( ) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
        Vector typeList = new Vector();
        Collection result = objTypeHome.findByAll();
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCDisplayTypeMasterLocal objTypelocalRemote = (HLCDisplayTypeMasterLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
            displayTypeId =  objTypelocalRemote.getDisplayTypeId();
            String displayTypeName =  objTypelocalRemote.getDisplayTypeName();
            String mediaId = objTypelocalRemote.getMediaId();
            String displayTypeDescription =  objTypelocalRemote.getDisplayTypeDescription();
            String dispStatus =String.valueOf(objTypelocalRemote.isActiveStatus());
            String dispType [] = {displayTypeId,displayTypeName,mediaId,displayTypeDescription,dispStatus};
            typeList.add(dispType);
        }
        return typeList;
    }
    
    
    
  /*  public String getDisplaySubTypeFromType(String displaySubTypeId) throws RemoteException,FinderException{
        
        getDisplaySubTypeFromType(String displaySubTypeId)
    }
    */
/**
  * @Method Name    :getMediaDisplayTypeDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
  */
    public Vector getMediaDisplayTypeDetails(String mediaId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
        Vector typeList = new Vector();
        Collection result = objTypeHome.findByMedia(mediaId);
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCDisplayTypeMasterLocal objTypelocalRemote = (HLCDisplayTypeMasterLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
            displayTypeId =  objTypelocalRemote.getDisplayTypeId();
            String displayTypeName =  objTypelocalRemote.getDisplayTypeName();
            String mediaIdVal = objTypelocalRemote.getMediaId();
            String displayTypeDescription =  objTypelocalRemote.getDisplayTypeDescription();
            String dispStatus =String.valueOf(objTypelocalRemote.isActiveStatus());
            String dispType [] = {displayTypeId,displayTypeName,mediaIdVal,displayTypeDescription,dispStatus};
            typeList.add(dispType);
        }
        return typeList;
    }
    
/**
  * @Method Name    :deleteDisplayType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeId.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
  */
    public boolean deleteDisplayType(String displayTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean deleteDisplayType");
        Debug.print("Issue ID:" + issueId);
        boolean result = false;
        if (displayTypeId == null) {
            throw new EJBException("Diplay Type ID can't be empty");
        }
        if (displayTypeExists(displayTypeId) == false) {
            //throw new EJBException("Diplay Type ID does not  Exists" + displayTypeId);
            result = false;
        }
        else{
            try {
                objTypeRemote.remove();
                result = true;
            } catch (Exception ex) {
                  result = false;
                  throw new EJBException("deleteDisplayType: " + ex.getMessage());
            }
            finally{
                return result;
            }
        }
        return result;
    }
    
/**
  * @Method Name    :displayTypeExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeId.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean displayTypeExists(String displayTypeId) {
        Debug.print("AdvertiseSessionBean displayTypeExists");
        if (displayTypeId != this.displayTypeId) {
            try {
                objTypeRemote = objTypeHome.findByPrimaryKey(displayTypeId);
                 Debug.print("AdvertiseSessionBean displayTypeExists" + displayTypeId );
                this.displayTypeId = displayTypeId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Display Id :" + displayTypeId);
        return true;
    }
    
/**
  * @Method Name    :displayTypeNameExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeName.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean displayTypeNameExists(String displayTypeName) {
        Debug.print("AdvertiseSessionBean displayTypeNameExists");
        boolean result = true;
        if (!(displayTypeName.equalsIgnoreCase(this.displayTypeName))) {
            try {
               ArrayList  dtName = (ArrayList) objTypeHome.findByDisplayTypeName(displayTypeName);
               Iterator e = dtName.iterator();
               while(e.hasNext()){
                   HLCDisplayTypeMasterLocal objTypeLocalRemote = (HLCDisplayTypeMasterLocal)e.next();
                   String TypeNameRs = objTypeLocalRemote.getDisplayTypeName();
                   if(TypeNameRs.equalsIgnoreCase(displayTypeName)){
                       this.displayTypeName = displayTypeName;
                       result = false;
                       Debug.print("Display Name alreay exists:" + displayTypeName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Display Name Outer Most Loop:" + result);
        return result;
    }
    
/**
  * @Method Name    :displayTypeEditNameExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeId, String displayTypeName.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean displayTypeEditNameExists(String displayTypeId, String displayTypeName) {
        Debug.print("AdvertiseSessionBean displayTypeEditNameExists");
        boolean result = true;
        if (!(displayTypeName.equalsIgnoreCase(this.displayTypeName))) {
            try {
               ArrayList  dtName = (ArrayList) objTypeHome.findByDisplayTypeEditName(displayTypeId, displayTypeName);
               Iterator e = dtName.iterator();
               while(e.hasNext()){
                   HLCDisplayTypeMasterLocal objTypeLocalRemote = (HLCDisplayTypeMasterLocal)e.next();
                   String TypeNameRs = objTypeLocalRemote.getDisplayTypeName();
                   if(TypeNameRs.equalsIgnoreCase(displayTypeName)){
                       this.displayTypeName = displayTypeName;
                       result = false;
                       Debug.print("displayTypeEditNameExists  Display Name alreay exists:" + displayTypeName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Edit Display Name Outer Most Loop:" + result);
        return result;
    }
/*===================================End of Display Type Master =============================================*/    
 

/*===================================Display Sub Type Master =============================================*/    
/**
  * @Method Name    :createDisplaySubType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeName , String displayTypeId, String displaySubTypeDescription.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean createDisplaySubType(String displaySubTypeName , String displayTypeId, String displaySubTypeDescription) throws RemoteException{  
        Debug.print("AdvertiseSessionBean createDisplaySubType");
        boolean result = false;
        try{
            if (displaySubTypeNameExists(displaySubTypeName) == false) {
                Debug.print("This name is already Exists");
                result = false;
            }
            else{
                objSubTypeRemote = objSubTypeHome.create(displaySubTypeName , displayTypeId, displaySubTypeDescription);
                Debug.print("After Insertion");
                result =  true;
            }
        }
        catch(Exception exp){
            Debug.print("Exception in createDisplaySubType:" + exp.getMessage());
            exp.printStackTrace();
        }
        finally{
            return result;
        }   
     }
    
/**
  * @Method Name    :editDisplaySubType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeId, String displaySubTypeName , String displayTypeId, String displaySubTypeDescription.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean editDisplaySubType(String displaySubTypeId, String displaySubTypeName , String displayTypeId, String displaySubTypeDescription) throws RemoteException{
        Debug.print("AdvertiseSessionBean editDisplaySubType");
        boolean result = false;
        try{
            if (displaySubTypeId == null ) {
                throw new EJBException("Display Sub Type ID can't be empty");
            }
            if (displaySubTypeEditNameExists(displaySubTypeId,displaySubTypeName) == false) {
                Debug.print("AdvertiseSessionBean editDisplaySubType This name is already Exists");
                result = false;
               // throw new EJBException("PlanName Already Exist" + planName);
            }
            else{
                if (displaySubTypeExists(displaySubTypeId) == false) {
                   // throw new EJBException("Display Sub Type ID does not Exists" + displaySubTypeId);
                    result = false;
                }
                else{
                    objSubTypeRemote.setDisplaySubTypeName(displaySubTypeName);
                    objSubTypeRemote.setDisplayTypeId(displayTypeId);
                    objSubTypeRemote.setDisplaySubTypeDescription(displaySubTypeDescription);
                    result = true;
                }
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        finally{
            return result;
        }
    }
    
/**
  * @Method Name    :getDisplaySubTypeDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeId.
  * @return         :String[] value.
  * @throws         :RemoteException, FinderException.
*/
    public String[] getDisplaySubTypeDetails(String displaySubTypeId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getDisplayTypeDetails");
       if (displaySubTypeExists(displaySubTypeId) == false) {
            throw new EJBException("Display ID doesnot Exists" + displaySubTypeId);
       }
       displaySubTypeId =  objSubTypeRemote.getDisplaySubTypeId();
       String displaySubTypeName =  objSubTypeRemote.getDisplaySubTypeName();
       String displayTypeId = objSubTypeRemote.getDisplayTypeId();
       String displaySubTypeDescription =  objSubTypeRemote.getDisplaySubTypeDescription();
       String dispStatus =String.valueOf(objSubTypeRemote.isActiveStatus());
       String dispSubType [] = {displaySubTypeId,displaySubTypeName,displayTypeId,displaySubTypeDescription,dispStatus};
       return dispSubType;
    }
    
/**
  * @Method Name    :getDisplayTypeFromSubType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeId.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
*/
    public Vector getDisplayTypeFromSubType(String displayTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getDisplayTypeFromSubType");
        Vector typeList = new Vector();
        Collection result = objSubTypeHome.findByDisplayTypeId(displayTypeId);
        Iterator e = result.iterator();
        while(e.hasNext()){
           HLCDisplaySubTypeMasterLocal objSubTypelocalRemote = (HLCDisplaySubTypeMasterLocal)e.next();
           Debug.print("AdvertiseSessionBean getDisplayTypeFromSubType");
           displaySubTypeId =  objSubTypelocalRemote.getDisplaySubTypeId();
           String displaySubTypeName =  objSubTypelocalRemote.getDisplaySubTypeName();
           String displayTypeIdVal = objSubTypelocalRemote.getDisplayTypeId();
           String displaySubTypeDescription =  objSubTypelocalRemote.getDisplaySubTypeDescription();
           String dispStatus =String.valueOf(objSubTypelocalRemote.isActiveStatus());
           String dispSubType [] = {displaySubTypeId,displaySubTypeName,displayTypeIdVal,displaySubTypeDescription,dispStatus};
           typeList.addElement(dispSubType);
        }
        return typeList;
    }

    
/**
  * @Method Name    :getAllDisplaySubTypeDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
*/
    public Vector getAllDisplaySubTypeDetails( ) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
        Vector subTypeList = new Vector();
        Collection result = objSubTypeHome.findByAll();
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCDisplaySubTypeMasterLocal objSubTypelocalRemote = (HLCDisplaySubTypeMasterLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllDisplaySubTypeDetails");
            displaySubTypeId =  objSubTypelocalRemote.getDisplaySubTypeId();
            String displaySubTypeName =  objSubTypelocalRemote.getDisplaySubTypeName();
            String displayTypeId = objSubTypelocalRemote.getDisplayTypeId();
            String displaySubTypeDescription =  objSubTypelocalRemote.getDisplaySubTypeDescription();
            String dispStatus =String.valueOf(objSubTypelocalRemote.isActiveStatus());
            String dispSubType [] = {displaySubTypeId,displaySubTypeName,displayTypeId,displaySubTypeDescription,dispStatus};
            subTypeList.add(dispSubType);
        }
        return subTypeList;
    }
    
/**
  * @Method Name    :deleteDisplaySubType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
*/
    public boolean deleteDisplaySubType(String displaySubTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean deleteDisplaySubType");
        Debug.print("Display Sub Type ID:" + displaySubTypeId);
        boolean result = false;
        if (displaySubTypeId == null) {
            throw new EJBException("Diplay Sub Type ID can't be empty");
        }
        if (displaySubTypeExists(displaySubTypeId) == false) {
            //throw new EJBException("Diplay Type ID does not  Exists" + displayTypeId);
            result = false;
        }
        else{
            try {
                objSubTypeRemote.remove();
                result = true;
            } catch (Exception ex) {
                  result = false;
                  throw new EJBException("deleteDisplaySubType: " + ex.getMessage());
            }
            finally{
                return result;
            }
        }
        return result;
    }

/**
  * @Method Name    :displaySubTypeExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeId.
  * @return         :boolean value.
  * @throws         :Null.
*/
    private boolean displaySubTypeExists(String displaySubTypeId) {
        Debug.print("AdvertiseSessionBean displayTypeExists");
        if (displaySubTypeId != this.displaySubTypeId) {
            try {
                objSubTypeRemote = objSubTypeHome.findByPrimaryKey(displaySubTypeId);
                 Debug.print("AdvertiseSessionBean displayTypeExists" + displaySubTypeId );
                this.displaySubTypeId = displaySubTypeId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Display Sub Type Id :" + displaySubTypeId);
        return true;
    }
    
/**
  * @Method Name    :displaySubTypeNameExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeName.
  * @return         :boolean value.
  * @throws         :Null.
*/
    private boolean displaySubTypeNameExists(String displaySubTypeName) {
        Debug.print("AdvertiseSessionBean displaySubTypeNameExists");
        boolean result = true;
        if (!(displaySubTypeName.equalsIgnoreCase(this.displaySubTypeName))) {
            try {
               ArrayList  dstName = (ArrayList) objSubTypeHome.findByDisplaySubTypeName(displaySubTypeName);
               Iterator e = dstName.iterator();
               while(e.hasNext()){
                   HLCDisplaySubTypeMasterLocal objSubTypeLocalRemote = (HLCDisplaySubTypeMasterLocal)e.next();
                   String SubTypeNameRs = objSubTypeLocalRemote.getDisplaySubTypeName();
                   if(SubTypeNameRs.equalsIgnoreCase(displaySubTypeName)){
                       this.displaySubTypeName = displaySubTypeName;
                       result = false;
                       Debug.print("Display Sub Type Name alreay exists:" + displaySubTypeName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Display Sub Type Name Outer Most Loop:" + result);
        return result;
    }
    
/**
  * @Method Name    :displaySubTypeEditNameExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeId, String displaySubTypeName.
  * @return         :boolean value.
  * @throws         :Null.
*/
    private boolean displaySubTypeEditNameExists(String displaySubTypeId, String displaySubTypeName) {
        Debug.print("AdvertiseSessionBean displaySubTypeEditNameExists");
        boolean result = true;
        if (!(displaySubTypeName.equalsIgnoreCase(this.displaySubTypeName))) {
            try {
               ArrayList  dstName = (ArrayList) objSubTypeHome.findByDisplaySubEditTypeName(displaySubTypeId,displaySubTypeName);
               Iterator e = dstName.iterator();
               while(e.hasNext()){
                   HLCDisplaySubTypeMasterLocal objSubTypeLocalRemote = (HLCDisplaySubTypeMasterLocal)e.next();
                   String SubTypeNameRs = objSubTypeLocalRemote.getDisplaySubTypeName();
                   if(SubTypeNameRs.equalsIgnoreCase(displaySubTypeName)){
                       this.displaySubTypeName = displaySubTypeName;
                       result = false;
                       Debug.print("displaySubTypeEditNameExists Name alreay exists:" + displaySubTypeName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Edit Display Sub Type Name Outer Most Loop:" + result);
        return result;
    }
/*===================================End of Display Sub Type Master =============================================*/    

    
/*===================================Dimension Detail Master =============================================*/   
/**
  * @Method Name    :createDimDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displaySubTypeId , String dimensionTypeId, String mediaId, String dimensionName, String height, String width,  String units,  String imagePath.
  * @return         :boolean value.
  * @throws         :RemoteException.
*/
    public boolean createDimDetails(String displaySubTypeId , String dimensionTypeId, String mediaId, String dimensionName, String height,
             String width,  String units,  String imagePath) throws RemoteException {  
        
        Debug.print("AdvertiseSessionBean createDimDetails");
        boolean result = false;
        try{
           /* if (dimDetNameExists(displaySubTypeName) == false) {
                Debug.print("This name is already Exists");
                result = false;
            }
            else{
          */  
                objDimDetRemote = objDimDetHome.create(displaySubTypeId , dimensionTypeId, mediaId, dimensionName, height,
                                    width,  units,  imagePath);
                Debug.print("After Insertion");
                result =  true;
           // }
        }
        catch(Exception exp){
            Debug.print("Exception in createDimDetails:" + exp.getMessage());
            exp.printStackTrace();
        }
        finally{
            return result;
        }   
     }   
    
/**
  * @Method Name    :editDimDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionId, String displaySubTypeId , String dimensionTypeId, String mediaId, String dimensionName, String height, String width,  String units,  String imagePath.
  * @return         :boolean value.
  * @throws         :RemoteException.
*/
    public boolean editDimDetails(String dimensionId, String displaySubTypeId , String dimensionTypeId, String mediaId, String dimensionName, String height,
             String width,  String units,  String imagePath) throws RemoteException {
        Debug.print("AdvertiseSessionBean editDimDetails");
        boolean result = false;
        try{
            if (dimensionId == null ) {
                throw new EJBException("Dimension Details can't be empty");
            }
            if (dimDetExists(dimensionId) == false) {
               // throw new EJBException("Display Sub Type ID does not Exists" + displaySubTypeId);
                result = false;
            }
            else{
                objDimDetRemote.setDisplaySubTypeId(displaySubTypeId);
                objDimDetRemote.setDimensionTypeId(dimensionTypeId);
                objDimDetRemote.setMediaId(mediaId);
                objDimDetRemote.setDimensionName(dimensionName);
                objDimDetRemote.setHeight(height);
                objDimDetRemote.setWidth(width);
                objDimDetRemote.setUnits(units);
                objDimDetRemote.setImagePath(imagePath);
                result = true;
            }
        }
        catch(Exception exp){
            exp.printStackTrace();
        }
        finally{
            return result;
        }
    }
    
/**
  * @Method Name    :getDimDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionId.
  * @return         :String[] value.
  * @throws         :RemoteException, FinderException.
*/
     public String[] getDimDetails(String dimensionId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getDimDetails");
        if (dimDetExists(dimensionId) == false) {
            throw new EJBException("Display ID doesnot Exists" + dimensionId);
        }
        String displaySubTypeId =  objDimDetRemote.getDisplaySubTypeId();
        String dimensionTypeId =  objDimDetRemote.getDimensionTypeId();
        String mediaId = objDimDetRemote.getMediaId();
        String dimensionName = objDimDetRemote.getDimensionName();
        String height = objDimDetRemote.getHeight();
        String width =  objDimDetRemote.getWidth();
        String units = objDimDetRemote.getUnits();
        String imagePath = objDimDetRemote.getImagePath();
        String dimId = objDimDetRemote.getDimensionId();
        
        String displaySubTypeVal[] =  getDisplaySubTypeDetails(displaySubTypeId);
        String displayTypeId = null;
        
        if(displaySubTypeVal!=null) {
            displayTypeId = displaySubTypeVal[2];
        }
        String dimDet [] = {dimId,displaySubTypeId,dimensionTypeId,mediaId,dimensionName,height,width,units,imagePath,displayTypeId};
       return dimDet;
    }
     
/**
  * @Method Name    :getAllDimDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
*/
    public Vector getAllDimDetails() throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllDimDetails");
        Vector dimDetList = new Vector();
        Collection result = objDimDetHome.findByAll();
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCDimensionDetailLocal objDimDetlocalRemote = (HLCDimensionDetailLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllDisplaySubTypeDetails");
            String displaySubTypeId =  objDimDetlocalRemote.getDisplaySubTypeId();
            String dimensionTypeId =  objDimDetlocalRemote.getDimensionTypeId();
            String mediaId = objDimDetlocalRemote.getMediaId();
            String dimensionName = objDimDetlocalRemote.getDimensionName();
            String height = objDimDetlocalRemote.getHeight();
            String width =  objDimDetlocalRemote.getWidth();
            String units = objDimDetlocalRemote.getUnits();
            String imagePath = objDimDetlocalRemote.getImagePath();
             String displaySubTypeVal[] =  getDisplaySubTypeDetails(displaySubTypeId);
            String displayTypeId = null;

            if(displaySubTypeVal!=null) {
                displayTypeId = displaySubTypeVal[2];
            }
            

            String dimDet [] = {displaySubTypeId,dimensionTypeId,mediaId,dimensionName,height,width,units,imagePath,displayTypeId};
            dimDetList.add(dimDet);
        }
        return dimDetList;
    }
  /**
  * @Method Name    :searchDimByMediaAndSubTypeId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String subTypeId.
  * @return         :List value.
  * @throws         :RemoteException, FinderException.
*/  
     public List searchDimByMediaAndSubTypeId(String mediaId, String subTypeId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean searchDimByMediaAndSubTypeId");
        List results = new HLCAdvertiseDAO().SearchMediaTypeAndDisplayType(mediaId,subTypeId);       
        return results;
    }
     
/**
  * @Method Name    :getDimensionDetailBySubTypeAdvertisement.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String subTypeId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */   
    public ArrayList getDimensionDetailBySubTypeAdvertisement(String mediaId, String subTypeId) throws RemoteException {
        Debug.print("AdvertiseSessionBean getDimensionDetailBySubTypeAdvertisement");
        ArrayList results = new HLCAdvertiseDAO().getDimensionDetailBySubTypeAdvertisement(mediaId, subTypeId);
        return results;
    }
    
/**
  * @Method Name    :deleteDimDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionId.
  * @return         :ArrayList value.
  * @throws         :RemoteException, FinderException.
  */    
    public boolean deleteDimDetails(String dimensionId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean deleteDimDetails");
        Debug.print("Dimension Detail ID:" + displaySubTypeId);
        boolean result = false;
        if (dimensionId == null) {
            throw new EJBException("Dimension Detail ID can't be empty");
        }
        if (dimDetExists(dimensionId) == false) {
            //throw new EJBException("Diplay Type ID does not  Exists" + displayTypeId);
            result = false;
        }
        else{
            try {
                objDimDetRemote.remove();
                result = true;
            } catch (Exception ex) {
                  result = false;
                  throw new EJBException("Dimension Detail: " + ex.getMessage());
            }
            finally{
                return result;
            }
        }
        return result;
    }
/**
  * @Method Name    :dimDetExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String dimensionId.
  * @return         :boolean value.
  * @throws         :Null.
  */    
    private boolean dimDetExists(String dimensionId) {
        Debug.print("AdvertiseSessionBean displayTypeExists");
        if (dimensionId != this.dimensionId) {
            try {
                objDimDetRemote = objDimDetHome.findByPrimaryKey(dimensionId);
                 Debug.print("AdvertiseSessionBean displayTypeExists" + dimensionId );
                this.dimensionId = dimensionId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Dimension Detail Id :" + dimensionId);
        return true;
    }
    
    
    /*private boolean dimDetNameExists(String dimensionName) {
        Debug.print("AdvertiseSessionBean dimDetNameExists");
        boolean result = true;
        if (!(dimensionName.equals(this.dimensionName))) {
            try {
               ArrayList  ddName = (ArrayList) objDimDetHome.findByDisplaySubTypeName(displaySubTypeName);
               Iterator e = ddName.iterator();
               while(e.hasNext()){
                   DisplaySubTypeMasterLocal objSubTypeLocalRemote = (DisplaySubTypeMasterLocal)e.next();
                   String SubTypeNameRs = objSubTypeLocalRemote.getDisplaySubTypeName();
                   if(SubTypeNameRs.equals(displaySubTypeName)){
                       this.displaySubTypeName = displaySubTypeName;
                       result = false;
                       Debug.print("Display Sub Type Name alreay exists:" + displaySubTypeName);
                       break;
                   }
               }
            } catch (Exception ex) {
                 result = false;
                 Debug.print("Exception:" + ex.getMessage());
            }
        }
        else{
             result = false;
        }
        Debug.print("Display Sub Type Name Outer Most Loop:" + result);
        return result;
    }*/
/*===================================End of Dimension Detail Master =============================================*/    
    
    
/*===================================Map Price  Master =============================================*/   
/**
  * @Method Name    :createMapPrice.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String displayTypeId , String displaySubTypeId, String frequencyId, String mediaId, String price.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */ 
    public boolean createMapPrice(String displayTypeId , String displaySubTypeId, String frequencyId, String mediaId, String price) throws RemoteException {  
    Debug.print("AdvertiseSessionBean createMapPrice");
    boolean result = false;
    try{
/*        if (displaySubTypeNameExists(displaySubTypeName) == false) {
            Debug.print("This name is already Exists");
            result = false;
        }
        else{
  */ 
            objMapRemote = objMapHome.create(displayTypeId , displaySubTypeId, frequencyId, mediaId, price);
            Debug.print("After Insertion");
            result =  true;
        //}
    }
    catch(Exception exp){
        Debug.print("Exception in createDisplaySubType:" + exp.getMessage());
        exp.printStackTrace();
    }
    finally{
        return result;
    }   
    }  
    
/**
  * @Method Name    :editMapPrice.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advMapId, String displayTypeId , String displaySubTypeId, String frequencyId, String mediaId, String price.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */ 
    public boolean editMapPrice(String advMapId, String displayTypeId , String displaySubTypeId, String frequencyId, String mediaId, String price) throws RemoteException {
    Debug.print("AdvertiseSessionBean editMapPrice");
    boolean result = false;
    try{
        if (advMapId == null ) {
            throw new EJBException("MapPrice ID can't be empty");
        }
        if (mapPriceExists(advMapId) == false) {
           // throw new EJBException("Display Sub Type ID does not Exists" + displaySubTypeId);
            result = false;
        }
        else{
            objMapRemote.setDisplayTypeId(displayTypeId);
            objMapRemote.setDisplaySubTypeId(displaySubTypeId);
            objMapRemote.setFrequencyId(frequencyId);
            objMapRemote.setMediaId(mediaId);
            objMapRemote.setPrice(price);
            result = true;
        }
    }
    catch(Exception exp){
        exp.printStackTrace();
    }
    finally{
        return result;
    }
    }
    
/**
  * @Method Name    :getMapPriceDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advMapId.
  * @return         :String[] value.
  * @throws         :RemoteException, FinderException.
  */ 
    public String[] getMapPriceDetails(String advMapId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getMapPriceDetails");
        if (mapPriceExists(advMapId) == false) {
            throw new EJBException("Map Price ID doesnot Exists" + advMapId);
        }
       advMapId =  objMapRemote.getAdvMapId();
       String displaySubTypeId =  objMapRemote.getDisplaySubTypeId();
       String displayTypeId = objMapRemote.getDisplayTypeId();
       String frequencyId =  objMapRemote.getFrequencyId();
       String mediaId =  objMapRemote.getMediaId();
       String price =  objMapRemote.getPrice();
       
       String mapPrice [] = {advMapId, displaySubTypeId, displayTypeId, frequencyId, mediaId, price};
       return mapPrice;
    }
    
/**
  * @Method Name    :getAllMapPriceDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Vector value.
  * @throws         :RemoteException, FinderException.
  */ 
    public Vector getAllMapPriceDetails() throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
        Vector mapPriceList = new Vector();
        Collection result = objMapHome.findByAll();
        Iterator e = result.iterator();
        while(e.hasNext()){
            HLCMapPriceLocal objMaplocalRemote = (HLCMapPriceLocal)e.next();
            Debug.print("AdvertiseSessionBean getAllMapPriceDetails");
            advMapId =  objMaplocalRemote.getAdvMapId();
            String displaySubTypeId =  objMaplocalRemote.getDisplaySubTypeId();
            String displayTypeId = objMaplocalRemote.getDisplayTypeId();
            String frequencyId =  objMaplocalRemote.getFrequencyId();
            String mediaId =  objMaplocalRemote.getMediaId();
            String price =  objMaplocalRemote.getPrice();
       
            String mapPrice [] = {advMapId,displaySubTypeId,displayTypeId,frequencyId,mediaId,price};

            mapPriceList.add(mapPrice);
        }
        return mapPriceList;
    }
    
/**
  * @Method Name    :getAllMapByMedIssDisTyDisSubType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId,String frequencyId,String displayTypeId, String displaySubTypeId.
  * @return         :ArrayList value.
  * @throws         :RemoteException, FinderException.
  */   
    public ArrayList getAllMapByMedIssDisTyDisSubType(String mediaId,String frequencyId,String displayTypeId, String displaySubTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getAllMapByMedIssDisTyDisSubType");
        ArrayList mapPriceList = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objMapHome.findByMapDetails(mediaId, frequencyId, displayTypeId, displaySubTypeId);
            Iterator e = result.iterator();
             while(e.hasNext()){
                HLCMapPriceLocal objMaplocalRemote = (HLCMapPriceLocal)e.next();
                Debug.print("AdvertiseSessionBean getAllMapByMedIssDisTyDisSubType");
                advMapId =  objMaplocalRemote.getAdvMapId();
                displaySubTypeId =  objMaplocalRemote.getDisplaySubTypeId();
                displayTypeId = objMaplocalRemote.getDisplayTypeId();
                frequencyId =  objMaplocalRemote.getFrequencyId();
                mediaId =  objMaplocalRemote.getMediaId();
                String price =  objMaplocalRemote.getPrice();

                String mapPriceVal [] = {advMapId,displaySubTypeId,displayTypeId,frequencyId,mediaId,price};
                mapPriceList.add(mapPriceVal);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return mapPriceList;
    }
    
/**
  * @Method Name    :getAllMapByMedDisTyDisSubType.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String displayTypeId, String displaySubTypeId.
  * @return         :ArrayList value.
  * @throws         :RemoteException, FinderException.
  */    
       public ArrayList getAllMapByMedDisTyDisSubType(String mediaId, String displayTypeId, String displaySubTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getAllMapByMedDisTyDisSubType");
        ArrayList mapPriceList = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objMapHome.findByMapMediaDetails(mediaId, displayTypeId, displaySubTypeId);
            Iterator e = result.iterator();
             while(e.hasNext()){
                HLCMapPriceLocal objMaplocalRemote = (HLCMapPriceLocal)e.next();
                Debug.print("AdvertiseSessionBean getAllMapByMedDisTyDisSubType");
                advMapId =  objMaplocalRemote.getAdvMapId();
                displaySubTypeId =  objMaplocalRemote.getDisplaySubTypeId();
                displayTypeId = objMaplocalRemote.getDisplayTypeId();
                String frequencyId =  objMaplocalRemote.getFrequencyId();
                mediaId =  objMaplocalRemote.getMediaId();
                String price =  objMaplocalRemote.getPrice();   

                String mapPriceVal [] = {advMapId,displaySubTypeId,displayTypeId,frequencyId,mediaId,price};
                mapPriceList.add(mapPriceVal);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return mapPriceList;
    }
    
    
    
 /**
  * @Method Name    :deleteMapPriceDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advMapId.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
  */      
    public boolean deleteMapPriceDetails(String advMapId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean deleteMapPriceDetails");
        Debug.print("Map Price ID:" + advMapId);
        boolean result = false;
        if (advMapId == null) {
            throw new EJBException("Map Price ID can't be empty");
        }
        if (mapPriceExists(advMapId) == false) {
            //throw new EJBException("Diplay Type ID does not  Exists" + displayTypeId);
            result = false;
        }
        else{
            try {
                objMapRemote.remove();
                result = true;
            } catch (Exception ex) {
                  result = false;
                  throw new EJBException("deleteMapPriceDetails: " + ex.getMessage());
            }
            finally{
                return result;
            }
        }
        return result;
    }
    
/**
  * @Method Name    :mapPriceExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advMapId.
  * @return         :boolean value.
  * @throws         :Null.
  */
    private boolean mapPriceExists(String advMapId) {
        Debug.print("AdvertiseSessionBean mapPriceExists");
        if (advMapId != this.advMapId) {
            try {
                objMapRemote = objMapHome.findByPrimaryKey(advMapId);
                 Debug.print("AdvertiseSessionBean mapPriceExists" + advMapId );
                this.advMapId = advMapId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Map Price Id :" + advMapId);
        return true;
    }
/*===================================End of Map Price Master =============================================*/    
    
/*=================================== Advertise Handling =============================================*/   
/**
  * @Method Name    :createAdvertiser.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :AdvertiserVO objAdvt, ArrayList adsDet.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean createAdvertiser(HLCAdvertiserVO objAdvt, ArrayList adsDet) throws RemoteException {  
        Debug.print("AdvertiseSessionBean createAdvertiser");
        boolean result = false;
        try{
            if(objAdvt==null || adsDet==null){
                result =false;
                 Debug.print("AdvertiseSessionBean createAdvertiser Object NULL");
            } else{
                Debug.print("AdvertiseSessionBean createAdvertiser ArraVal: " + adsDet);
                objAdsRemote = objAdsHome.create(objAdvt, adsDet);
                result = true;
            }
        } catch(Exception exp){
            result =  false;
            Debug.print("AdvertiseSessionBean createAdvertiser Exception:" + exp);
            exp.printStackTrace();
        } finally{
             Debug.print("AdvertiseSessionBean createAdvertiser result" + result);
            return result;
        }
    }
    
/**
  * @Method Name    :editAdvertiser.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :AdvertiserVO objAdvt, ArrayList adsDet.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */    
    public boolean editAdvertiser(HLCAdvertiserVO objAdvt, ArrayList adsDet) throws RemoteException {
    Debug.print("AdvertiseSessionBean editAdvertiser ID" + objAdvt.getAdvertisementId());
    boolean result = false;
    try{
       if (objAdvt != null && objAdvt.getAdvertisementId() == "") {
           // throw new EJBException("Advertisement ID can't be empty");
            result = false;
        }
        if (AdsExists(objAdvt.getAdvertisementId()) == false) {
            //throw new EJBException("Event ID Not Exists" + eventId);
           result = false;
        }
        else{
            objAdsRemote.setUserId(objAdvt.getUserId());
            objAdsRemote.setMediaId(objAdvt.getMediaId());
            objAdsRemote.setAdvertiser(objAdvt.getAdvertiser());
            objAdsRemote.setAdAgency(objAdvt.getAdAgency());
            objAdsRemote.setAgencyFirstName(objAdvt.getAgencyFirstName());
            objAdsRemote.setAgencyMiddleName(objAdvt.getAgencyMiddleName());
            objAdsRemote.setAgencyLastName(objAdvt.getAgencyLastName());
            objAdsRemote.setAgencyPhone(objAdvt.getAgencyPhone());
            objAdsRemote.setAgencyFax(objAdvt.getAgencyFax()); 
            objAdsRemote.setAgencyEmail(objAdvt.getAgencyEmail());
            objAdsRemote.setAgencyAddress(objAdvt.getAgencyAddress());
            objAdsRemote.setAgencySuite(objAdvt.getAgencySuite());
            objAdsRemote.setAgencyCity(objAdvt.getAgencyCity());
            objAdsRemote.setAgencyState(objAdvt.getAgencyState());
            objAdsRemote.setAgencyCountry(objAdvt.getAgencyCountry());
            objAdsRemote.setAgencyZip(objAdvt.getAgencyZip());
            objAdsRemote.setInvoiceTo(objAdvt.getInvoiceTo());
            objAdsRemote.setComments(objAdvt.getComments());
            objAdsRemote.setAdvPosted(objAdvt.isAdvPosted());
            objAdsRemote.setAdvPostedDate(objAdvt.getAdvPostedDate());
            objAdsRemote.setMaterialComingFrom(objAdvt.getMaterialComingFrom());
            objAdsRemote.setMaterialComingDate(objAdvt.getMaterialComingDate());
            objAdsRemote.setAdvSuppliedOn(objAdvt.getAdvSuppliedOn());
            objAdsRemote.setSalesPersonId(objAdvt.getSalesPersonId());
            objAdsRemote.setRequestStatus(objAdvt.getRequestStatus());
            objAdsRemote.setActiveStatus(objAdvt.isActiveStatus());
            objAdsRemote.setAdsDetails(adsDet);
            Debug.print("AdsSessBean ArraVal update: " + adsDet);
            result = true;
        }
    }
    catch(Exception exp){
        exp.printStackTrace();
    }
    finally{
        return result;
    }
    }
    
/**
  * @Method Name    :getAdvertiserDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advertisementId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */ 
    public ArrayList getAdvertiserDetails(String advertisementId) throws RemoteException,FinderException {
       Debug.print("AdvertiseSessionBean getAdvertiserDetails");
            HLCAdvertiserVO objAdsVO;
            ArrayList alAds = new ArrayList();
            if (advertisementId == null) {
                throw new EJBException("Advertiser ID can't be empty");
            }

            if (AdsExists(advertisementId) == false) {
                throw new EJBException("Advertiser ID Not Exists" + advertisementId);
            }
            else{
                objAdsVO = objAdsRemote.getAdvertiseDetails();
                
                String[] mediaNames = getMediaDetails(objAdsVO.getMediaId());
                String mediaName = mediaNames[1];
                objAdsVO.setMediaId(mediaName);
                ArrayList al = objAdsRemote.getAdsDetails();
                ArrayList adsNamingDet = new HLCAdvertiseDAO().getPriceDetailForAdvertisement(objAdsVO.getAdvertisementId());
                alAds.add(objAdsVO);
                alAds.add(al);
                alAds.add(adsNamingDet);
            }
            Debug.print("VaigaiSessionBean getAdvertiserDetails" + alAds);
            return alAds;
    }
    
    
/**
  * @Method Name    :getAllAdvertiserDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */ 
    public ArrayList getAllAdvertiserDetails() throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getAllAdvertiserDetails");
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByAll();
            Iterator e = result.iterator();
            while(e.hasNext()){
               HLCAdvertiseLocal localAdsRemote = (HLCAdvertiseLocal)e.next();
               HLCAdvertiserVO objAdsVO = localAdsRemote.getAdvertiseDetails();
               ArrayList adsDet = localAdsRemote.getAdsDetails();
               ArrayList al = new ArrayList();
               al.add(objAdsVO);
               al.add(adsDet);
               adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return adsAllDet;
    }
    
/**
  * @Method Name    :getAllAdvertiserStatusDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String requestStatus.
  * @return         :ArrayList value.
  * @throws         :RemoteException, FinderException.
  */ 
    public ArrayList getAllAdvertiserStatusDetails(String requestStatus) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getAllAdvertiserStatusDetails");
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByAdsRequestStatus(requestStatus);
            Iterator e = result.iterator();
            while(e.hasNext()){
               HLCAdvertiseLocal localAdsRemote = (HLCAdvertiseLocal)e.next();
               HLCAdvertiserVO objAdsVO = localAdsRemote.getAdvertiseDetails();
               ArrayList adsDet = localAdsRemote.getAdsDetails();
                ArrayList al = new ArrayList();
               al.add(objAdsVO);
               al.add(adsDet);
               adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return adsAllDet;
    }
    
    /**
  * @Method Name    :getAllAdvertiserMediaBasedStatusDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String requestStatus.
  * @return         :ArrayList value.
  * @throws         :RemoteException, FinderException.
  */ 
        public ArrayList getAllAdvertiserMediaBasedStatusDetails(String mediaId,String requestStatus) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getAllAdvertiserMediaBasedStatusDetails");
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByAdsMediaBasedRequestStatus( mediaId, requestStatus);
            Iterator e = result.iterator();
            Debug.print("ArralyList in getAllAdvertiserMediaBasedStatusDetails Result: " + result);
            while(e.hasNext()){
                HLCAdvertiseLocal localAdsRemote = (HLCAdvertiseLocal)e.next();
                HLCAdvertiserVO objAdsVO = localAdsRemote.getAdvertiseDetails();
                ArrayList adsDet = localAdsRemote.getAdsDetails();
                ArrayList al = new ArrayList();
                al.add(objAdsVO);
                al.add(adsDet);
                adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        Debug.print("==============Final Value: ===============" + adsAllDet);
        return adsAllDet;
    }
    
/**
  * @Method Name    :advertisementStatusChange.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advertisementId, String status.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */  
    public boolean advertisementStatusChange(String advertisementId, String status) throws RemoteException{
        Debug.print(" AdvertiseSessionBean advertisementStatusChange:" + advertisementId);
        boolean result = false;
        if (advertisementId == null ) {
           // throw new EJBException("advertisementId ID can't be empty");
           Debug.print("advertisementId ID can't be empty");
            result = false;
        }
        if (AdsExists(advertisementId) == false) {
            //throw new EJBException("Schedule ID Not Exists" + scheduleId);
            Debug.print("Schedule ID Not Exists" + advertisementId);
            result = false;
        }
        else{
            objAdsRemote.setRequestStatus(status);
        }
        return true;
    }
    
    

/**
  * @Method Name    :searchByMedia.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */  

     public ArrayList searchByMedia(String mediaId) throws RemoteException {
        Debug.print("AdvertiseSessionBean searchByMedia");
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByAdsMediaId(mediaId);
            Iterator e = result.iterator();
            while(e.hasNext()){
               HLCAdvertiseLocal localAdsRemote = (HLCAdvertiseLocal)e.next();
               HLCAdvertiserVO objAdsVO = localAdsRemote.getAdvertiseDetails();
               ArrayList adsDet = localAdsRemote.getAdsDetails();
                ArrayList al = new ArrayList();
               al.add(objAdsVO);
               al.add(adsDet);
               adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return adsAllDet;
     } 
     
/**
  * @Method Name    :searchByAgency.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String agency.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */  
     public ArrayList searchByAgency(String agency) throws RemoteException {
        Debug.print("AdvertiseSessionBean searchByAgency");
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByAdsAgency(agency);
            Iterator e = result.iterator();
            while(e.hasNext()){
               HLCAdvertiseLocal localAdsRemote = (HLCAdvertiseLocal)e.next();
               HLCAdvertiserVO objAdsVO = localAdsRemote.getAdvertiseDetails();
               ArrayList adsDet = localAdsRemote.getAdsDetails();
               ArrayList al = new ArrayList();
               al.add(objAdsVO);
               al.add(adsDet);
               adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return adsAllDet;
     }
     
/**
  * @Method Name    :searchByUser.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String userId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */  
     public ArrayList searchByUser(String userId) throws RemoteException {
        Debug.print("AdvertiseSessionBean searchByUser");
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByUser(userId);
            Iterator e = result.iterator();
            while(e.hasNext()){
               HLCAdvertiseLocal localAdsRemote = (HLCAdvertiseLocal)e.next();
               HLCAdvertiserVO objAdsVO = localAdsRemote.getAdvertiseDetails();
               ArrayList adsDet = localAdsRemote.getAdsDetails();
                ArrayList al = new ArrayList();
               al.add(objAdsVO);
               al.add(adsDet);
               adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return adsAllDet;
     }   
   
/**
  * @Method Name    :viewAllAdsForUser.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String userId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */  
     public ArrayList viewAllAdsForUser(String userId) throws RemoteException{
        Debug.print("AdvertiseSessionBean viewAllAdsForUser");
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByUserAds(userId);
            Iterator e = result.iterator();
            while(e.hasNext()){
               HLCAdvertiseLocal localAdsRemote = (HLCAdvertiseLocal)e.next();
               HLCAdvertiserVO objAdsVO = localAdsRemote.getAdvertiseDetails();
               String[] mediaNames = getMediaDetails(objAdsVO.getMediaId());
                String mediaName = mediaNames[1];
                objAdsVO.setMediaId(mediaName);
               
               ArrayList adsDet = localAdsRemote.getAdsDetails();
               ArrayList al = new ArrayList();
               al.add(objAdsVO);
               al.add(adsDet);
               adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return adsAllDet;
     }
     
     
    
   /* public ArrayList getAllAdvertiserStatusDetails(String requestStatus) throws RemoteException,FinderException{
        Debug.print("SponsorSessionBean getAllAdvertiserStatusDetails");
        ArrayList al = new ArrayList();
        ArrayList adsAllDet = new ArrayList();
        try{
            ArrayList result =  (ArrayList)objAdsHome.findByAdsRequestStatus(requestStatus);
            Iterator e = result.iterator();
            while(e.hasNext()){
               AdvertiseLocal localAdsRemote = (AdvertiseLocal)e.next();
               AdvertiserVO objAdsVO = localAdsRemote.getAdvertisetDetails();
               ArrayList adsDet = localAdsRemote.getAdsDetails();
               al.add(objAdsVO);
               al.add(adsDet);
               adsAllDet.add(al);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return adsAllDet;
    }
    */
    
/**
  * @Method Name    :deleteAdvertiserDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String userId.
  * @return         :boolean value.
  * @throws         :RemoteException, FinderException.
  */  
    public boolean deleteAdvertiserDetails(String advertisementId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean deleteAdvertiserDetails");
        Debug.print("Adsvertise  ID:" + advertisementId);
        boolean result = false;
        if (advertisementId == null) {
             Debug.print("AdvertiseSessionBean deleteAdvertiserDetails can't be empty");
             result = false;
        }
        if (AdsExists(advertisementId) == false) {
            //throw new EJBException("Diplay Type ID does not  Exists" + displayTypeId);
             Debug.print("AdvertiseSessionBean does not  Exists");
            result = false;
        }
        else{
            try {
                objAdsRemote.remove();
                result = true;
            } catch (Exception ex) {
                  result = false;
                  throw new EJBException("deleteAdvertiserDetails: " + ex.getMessage());
            }
            finally{
                return result;
            }
        }
        return result;
    }
    
/**
  * @Method Name    :AdsExists.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advertisementId.
  * @return         :boolean value.
  * @throws         :Null.
  */  
    private boolean AdsExists(String advertisementId) {
        Debug.print("AdvertiseSessionBean AdsExists");
        if (advertisementId != this.advertisementId) {
            try {
                objAdsRemote = objAdsHome.findByPrimaryKey(advertisementId);
                Debug.print("AdvertiseSessionBean AdsExists" + advertisementId );
                this.advertisementId = advertisementId;
            } catch (Exception ex) {
                return false;
            }
        }
        Debug.print("Ads Id :" + advertisementId);
        return true;
    }

/**
  * @Method Name    :getFrequencyDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advertisementId.
  * @return         :List value.
  * @throws         :RemoteException,FinderException.
  */  
    public List getFrequencyDetails() throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getFrequencyDetails");
        List results = new HLCAdvertiseDAO().getFrequencyDetails();
        return results;
    }
    
/**
  * @Method Name    :getFrequencyDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId.
  * @return         :List value.
  * @throws         :RemoteException,FinderException.
  */  
    public List getFrequencyDetails(String mediaId) throws RemoteException,FinderException {
        Debug.print("AdvertiseSessionBean getFrequencyDetails");
        List results = new HLCAdvertiseDAO().getFrequencyDetails(mediaId);
        return results;
    }
    
/**
  * @Method Name    :getPriceDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String dispId, String subTypeId.
  * @return         :List value.
  * @throws         :RemoteException,FinderException.
  */
    public List getPriceDetails(String mediaId, String dispId, String subTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getPriceDetails");
        List results = new HLCAdvertiseDAO().getPriceDetails(mediaId, dispId, subTypeId);
        return results;
    }
    
/**
  * @Method Name    :getMapIdDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String dispId, String subTypeId.
  * @return         :List value.
  * @throws         :RemoteException,FinderException.
  */
     public List getMapIdDetails(String mediaId, String dispId, String subTypeId) throws RemoteException,FinderException{
        Debug.print("AdvertiseSessionBean getMapIdDetails");
        List results = new HLCAdvertiseDAO().getMapIdDetails(mediaId, dispId, subTypeId);
        return results;
    }
    
/**
  * @Method Name    :getPriceFromMap.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mapId, int dispId.
  * @return         :int value.
  * @throws         :Null.
  */
    public int getPriceFromMap(String mapId, int dispId){
        Debug.print("AdvertiseSessionBean getPriceFromMap");
        int  price = new HLCAdvertiseDAO().getPriceFromMap(mapId, dispId);
        return price;
    }
  
/**
  * @Method Name    :getAdvertisementDetailsByAdsId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String adsId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */
    public ArrayList getAdvertisementDetailsByAdsId(String adsId) throws RemoteException {
        Debug.print("AdvertiseSessionBean getAdvertisementDetailsByAdsId:" + adsId);
        ArrayList results = new HLCAdvertiseDAO().getAdvertisementDetailsByAdsId(adsId);
        return results;
    }
    
/**
  * @Method Name    :createManifest.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advDetailId, String advertisementId, String issueId, String  advMapId, String dimensionId, String placement, String  splInstructions, String pageNo.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean createManifest(String advDetailId, String advertisementId, String issueId, String  advMapId, 
            String dimensionId, String placement, String  splInstructions, String pageNo) throws RemoteException{
        Debug.print("AdvertiseSessionBean createManifest:");
        boolean result = new HLCAdvertiseDAO().insertManifest(advDetailId, advertisementId, issueId,  advMapId, 
            dimensionId, placement,  splInstructions, pageNo);
        return result;
    }
    
/**
  * @Method Name    :editManifest.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advManifestId, String issueId, String dimensionId, String placement, String  splInstructions, String pageNo.
  * @return         :boolean value.
  * @throws         :RemoteException.
  */
    public boolean editManifest(String advManifestId, String issueId, 
            String dimensionId, String placement, String  splInstructions, String pageNo) throws RemoteException {
        Debug.print("AdvertiseSessionBean editManifest:");
        boolean result = new HLCAdvertiseDAO().updateManifest(advManifestId, issueId, 
             dimensionId, placement, splInstructions, pageNo);
        return result;
    }
    
/**
  * @Method Name    :getAdsDetailsByAdsDetId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advDetailId.
  * @return         :AdsDetailedVO value.
  * @throws         :RemoteException.
  */
    public HLCAdsDetailedVO getAdsDetailsByAdsDetId(String advDetailId) throws RemoteException{
        Debug.print("AdvertiseSessionBean getAdsDetailsByAdsDetId:" + advDetailId);
        HLCAdsDetailedVO results = new HLCAdvertiseDAO().getAdsDetailsByAdsDetId(advDetailId);
        return results;
    }
    
/**
  * @Method Name    :getAllManifesttDetailsByAdsId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advertisementId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */
    public ArrayList getAllManifesttDetailsByAdsId(String advertisementId) throws RemoteException {
        Debug.print("AdvertiseSessionBean getAllManifesttDetailsByAdsId:" + advertisementId);
        ArrayList results = new HLCAdvertiseDAO().getAllManifesttDetailsByAdsId(advertisementId);
        return results;
    }
    
/**
  * @Method Name    :getManifesttDetailsByManifestId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advManifestId.
  * @return         :ManifestVO value.
  * @throws         :RemoteException.
  */
    public HLCManifestVO getManifesttDetailsByManifestId(String advManifestId) throws RemoteException {
        Debug.print("AdvertiseSessionBean getManifesttDetailsByAdsId:" + advManifestId);
        HLCManifestVO results = new HLCAdvertiseDAO().getManifesttDetailsByManifestId(advManifestId);
        return results;
    }
    
/**
  * @Method Name    :getManifesttDetailsByAdsDetId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advDetailId.
  * @return         :ManifestVO value.
  * @throws         :RemoteException.
  */
    public HLCManifestVO getManifesttDetailsByAdsDetId(String advDetailId) throws RemoteException {
        Debug.print("AdvertiseSessionBean getManifesttDetailsByAdsDetId:" + advDetailId);
        HLCManifestVO results = new HLCAdvertiseDAO().getManifesttDetailsByAdsDetId(advDetailId);
        return results;
    }

/**
  * @Method Name    :getAllManifestDetailForUser.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String advertisementId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */
     public ArrayList getAllManifestDetailForUser(String advertisementId) throws RemoteException {
        Debug.print("AdvertiseSessionBean getAllManifestDetailForUser:" + advertisementId);
        ArrayList results = new HLCAdvertiseDAO().getAllManifestDetailForUser(advertisementId);
        return results;
     }
    
/**
  * @Method Name    :getPriceDetailsByMediaIdDispId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String mediaId, String dispId.
  * @return         :ArrayList value.
  * @throws         :RemoteException.
  */ 
    public ArrayList getPriceDetailsByMediaIdDispId(String mediaId, String dispId) throws RemoteException{
        Debug.print("AdvertiseSessionBean getPriceDetailsByMediaIdDispId");
        ArrayList priceList = new ArrayList();
        try{
            Collection result = objSubTypeHome.findByDisplayTypeId(dispId);
            Iterator e = result.iterator();
            while(e.hasNext()){
               HLCDisplaySubTypeMasterLocal objSubTypelocalRemote = (HLCDisplaySubTypeMasterLocal)e.next();
               Debug.print("AdvertiseSessionBean getPriceDetailsByMediaIdDispId");
               displaySubTypeId =  objSubTypelocalRemote.getDisplaySubTypeId();
               String displaySubTypeName =  objSubTypelocalRemote.getDisplaySubTypeName();
               String displayTypeIdVal = objSubTypelocalRemote.getDisplayTypeId();
               String displaySubTypeDescription =  objSubTypelocalRemote.getDisplaySubTypeDescription();
               String dispSubType [] = {displaySubTypeId,displaySubTypeName,displayTypeIdVal,displaySubTypeDescription,};
               ArrayList pList =  (ArrayList)new HLCAdvertiseDAO().getPriceDetails(mediaId,dispId,displaySubTypeId);
               priceList.add(dispSubType);
               priceList.add(pList);
            }
        }
        catch(Exception e){
            Debug.print("Exception :" + e);
        }
        return priceList;
    }

 /*===================================End of Advertise =============================================*/    
/*===================================Intial Context =============================================*/     
/**
  * @Method Name    :getInitialContext.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :InitialContext value.
  * @throws         :javax.naming.NamingException.
  */ 
    public InitialContext getInitialContext() throws javax.naming.NamingException {
        if( this.ic == null ) {
            ic = new InitialContext();
        }
        System.out.println("AdvertiseSessionBean: This is from getInitialContext()");
        return ic;
    }
/*===================================End of Intial Context =============================================*/        
}