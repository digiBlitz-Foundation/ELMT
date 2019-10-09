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
package com.hlcmro.display;

import javax.ejb.EJBObject;
import java.util.*;
import java.rmi.*;

/**
 * This is the remote interface for OrganizerFormDisplay enterprise bean.
 */
public interface HLCVaigaiStatelessRemote extends EJBObject {
/*===========================TYPE AND LEVEL MAPPING==========================================================*/    
    public String createNewType(String strEvtTyName) throws RemoteException;
   
    public String createNewLevel(String strEvtLevName, String strEvtLevCode, String strEvtLevJump) throws RemoteException;
   
    public Vector getAllTypes() throws RemoteException;
   
    public Vector getAllLevels() throws RemoteException;
   
    public Vector getType(String uniEvtTyID) throws RemoteException;
   
    public Vector getLevel(String uniEvtLevID)  throws RemoteException;
  
    public String editType(String uniEvtTyID, String strEvtTyName) throws RemoteException;
  
    public String editLevel(String uniEvtLevID, String strEvtLevName, String strEvtLevCode, String strEvtLevJump)
    throws RemoteException;
   
    public int deleteType(String uniEvtTyID) throws RemoteException;
  
    public int deleteLevel(String uniEvtLevID) throws RemoteException; 
 
    public void generateMapForTypeLEvel(String uniEvtTyID, Vector uniEvtLevIDs) throws RemoteException;
  
    public Vector getAllMappingLevels(String uniEvtTyID) throws RemoteException;
    
    public Vector getAllMapTyLe() throws RemoteException;
     public Vector getAllMapRuleSubRule() throws RemoteException;
    
  /*===========================TYPE AND LEVEL MAPPING==========================================================*/    
    public String createRuleType(String strRuleTyName) throws RemoteException;
  
    public String createSubRuleType(String strSubRuleName, String strSubRuletxtStatus) throws RemoteException;
  
    public Vector getAllRuleTypes() throws RemoteException; 
 
    public Vector getAllSubRuleTypes() throws RemoteException; 
 
    public Vector getRuleType(String uniRuleTyID) throws RemoteException; 
 
    public Vector getSubRuleType(String uniSubRuleTyID) throws RemoteException;
  
    public String editRuleType(String uniRuleTyID, String strSubRuleName) throws RemoteException;
  
    public String editSubRuleType(String uniSubRuleID, String strSubRuleName, String strSubRuletxtStatus) throws RemoteException;
  
    public int deleteRuleType(String uniRuleTyID) throws RemoteException;
  
    public int deleteSubRuleType(String uniSubRuleID) throws RemoteException;
  
    public void generateMapForRuleToSubRule(String uniRuleTyID, Vector uniSubRuleID) throws RemoteException;
   
    public Vector getAllMappingRules(String uniRuleTyID)throws RemoteException;
   
    /*=====================================================================================
     *   Author:Sharma 
    /*===================================================================================================*/
    
    /*------------------------Table For Cross-Country Routine----------------------------*/
    
     public int insertCrossCountry(int event_id, String organizer_id,
            String division, String length, String speed, String course_description, String add_information) throws RemoteException;
     public int updateCrossCountry(String cross_country_id, int event_id, String organizer_id, String division, String length, 
            String speed, String course_description, String add_information) throws RemoteException;
     public Vector selectCrossCountry(String cross_country_id) throws RemoteException;
      public int deleteCrossCountry(String cross_country_id) throws RemoteException;
          
    /*-----------------------Table For Distance & speed Routine-------------------------------*/
      
      public int insertDistanceSpeed (String event_level_name, 
              String event_level_code, String jumping_effort, boolean active_status, String add_date) throws RemoteException;
     // public int updateDistanceSpeed (String event_level_id, String event_level_name, 
      //        String event_level_code, String jumping_effort, boolean active_status, String add_date) throws RemoteException;
      public Vector selectDistanceSpeed() throws RemoteException;
     // public int deleteDistanceSpeed(String event_levelid) throws RemoteException;
      
      /*---------------------Table for Other Information-------------------------------------*/
      public Vector selectOtherInformation(String Other_id) throws RemoteException;
      
      
      /*-------------------Dressage Test For Horse---------------------------------------*/
      
      public Vector selectDressageHorseTrials() throws RemoteException;
      public int insertDressageHorseTrials( String arena_size_name, boolean active_status, String add_date) throws RemoteException;      
      
      
      /*------------------Table for Arena Size--------------------------------------------*/
      public ArrayList getAreaPriceMaster() throws RemoteException;
      public Vector selectArenaSize() throws RemoteException;
      public int insertArenaSize( String arena_size_name, boolean active_status, String add_date) throws RemoteException;
      
        /*------------------Judges Details--------------------------------------------*/
        public ArrayList selectJudgesDetails() throws RemoteException;
        public ArrayList selectOfficialDetails(String eventId) throws RemoteException;
}