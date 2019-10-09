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
package com.systinet.info;


import com.form.SystinetRequestVo;
import com.form.SystinetUserRegVo;

import javax.ejb.*;

import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.util.*;
import java.sql.*;
import java.util.Date;
import com.hp.systinet.lifecycle.remote.model.StageCategory;
import com.hp.systinet.lifecycle.remote.model.Task;
import com.hp.systinet.lifecycle.remote.model.VotingStatus;

/**
 * This is the remote interface for kaverystateless enterprise bean.
 */

public interface SystinetStatelessRemote extends EJBObject, SystinetStatelessRemoteBusiness {
    

       
        //===================BPM/WS start======================
       
        public boolean insertSystinetUser(SystinetUserRegVo vo) throws RemoteException;
        public ArrayList viewWsBPMList(String reqnmae) throws RemoteException;
        public  ArrayList Stagename(String lifecycleId,String artifactId) throws RemoteException;
        public boolean insertRequestValues(SystinetRequestVo vo,String reqName) throws RemoteException;
        public  ArrayList viewBPReqList(String date, String typeReq,String RrqId,String reqPri)  throws RemoteException;
        
        public boolean createBPArtifact ( ArrayList bpList, ArrayList bpPopList, ArrayList docList) throws RemoteException, Exception;
        public boolean createBSArtifact (ArrayList wsprocess, ArrayList wsdlWSprocess,ArrayList docWSprocess) throws RemoteException,Exception;
        public String createWsdlArtifact (ArrayList docWSprocess) throws RemoteException,Exception	;
        public String createWSArtifact( ArrayList wsdlWSprocess) throws RemoteException,Exception;
        public String createBusProcArtifact ( ArrayList bpList, ArrayList bpPopList, ArrayList docList) throws RemoteException, Exception;
       public String createBusSerArtifact (ArrayList wsprocess, ArrayList wsdlWSprocess,ArrayList docWSprocess) throws RemoteException,Exception;
       public boolean moveFileForVersioning (String fromPath,String toPath) throws RemoteException, Exception;	
        //===================BPM/WS end======================
            
     //==============Dhivya:Lifecycle Process Creation:Starts Here==================
        public String createLifecycleinSystinet(String lifecycleProName,String descripition,String rootArtifact,Collection<String> subArti,StageCategory initialStageName) throws RemoteException, MalformedURLException;
        public boolean addStageToProcess(String processId, StageCategory frmStageName, Collection<StageCategory> toStageName) throws RemoteException, MalformedURLException;  
        public boolean setvotingDetails(String processId, StageCategory frmStageName, VotingStatus votedef) throws RemoteException, MalformedURLException; 
        public boolean setTaskDetails(String processId, StageCategory frmStageName, Task taskdet) throws RemoteException, MalformedURLException; 
        public boolean publishProcess(String processId) throws RemoteException, MalformedURLException;
        public boolean addlifeCycleprocess(ArrayList lifecyclelist, String processId)throws RemoteException, MalformedURLException;
      
        //==========Ends Here====================================
        
        //========Dhivya:Artifact:Starts Here=====================================
        public String getArtifactUUid(String artifactName) throws RemoteException, MalformedURLException;
        public boolean isLifecycleExist(String lifecycleId) throws RemoteException, MalformedURLException;
        public ArrayList getLifecycleProc(String artifactType) throws RemoteException, MalformedURLException;
        public boolean startGovern(String artifactUuid, String lifecyleId)throws RemoteException, MalformedURLException;
        public boolean updateArtifactMapDetails(String artifactUuid, String lifecyleId)throws RemoteException, MalformedURLException;
        public boolean requestApproval(String artifactUuid, String message)throws RemoteException, MalformedURLException;
        public ArrayList getStageDetails(String lifecyleId) throws RemoteException, MalformedURLException;
        public boolean insertRequestDetails(String artifactUuid, String lifecyleId, String stageName, String stageNameValue, String status, String reqName, String stageNo, String reqId,String artifactName, String description)throws RemoteException, MalformedURLException;
        public boolean voting(String artifactUuid, String approMsg, boolean status, String StageName)throws RemoteException, MalformedURLException;
        public String getNextStage(String lifecycleId, String stageNo)throws RemoteException, MalformedURLException;
        public boolean updateStatus(String reqId, String artifactUuid, String status, String StageName)throws RemoteException, MalformedURLException;
       public boolean updateArtifactStatus(String lifecycleId, String artifactId,String status)throws RemoteException, MalformedURLException;
       public boolean chgStatusWSBPM(String lifecycleId, String artifactId)throws RemoteException, MalformedURLException;
       public boolean endGovern(String artifactUuid)throws RemoteException, MalformedURLException;
       public boolean updateWSBPM(String artifactUuid, String govStatus, String artifactName)throws RemoteException, MalformedURLException;
       public boolean updateWSBPMgovStatus(String artifactUuid, String govStatus)throws RemoteException, MalformedURLException;
       
       public String getProcUuid(String artifactUuid)throws RemoteException, MalformedURLException;
       public String getProcessId(String processUuid)throws RemoteException, MalformedURLException;
       public String getStateId(String stageName, String procesId)throws RemoteException, MalformedURLException;
       public String getTaskId(String stateId)throws RemoteException, MalformedURLException;
       
       //============Ends Here================================
        
        
      //start systinet digiblitz technoglogies
        public  ArrayList listProcessView(String arttype)  throws RemoteException;
        public void govWSBPMValue(String id,String name,String value) throws RemoteException;
        public  String wsproceesSubmit(ArrayList wsprocess, ArrayList wsdlWSprocess,ArrayList docWSprocess, String artifactSysUUID)  throws RemoteException,Exception; 
        public boolean changeapprovedstatus() throws RemoteException;
       
        //===================BPM/WS end======================
        //22-2-13 start
        public HashMap votingList() throws RemoteException;
        public void callEndGov()  throws RemoteException;
        //end
   
        public boolean changedeniedstatus() throws RemoteException;

        public String bpproceesSubmit(ArrayList bplist, ArrayList bppoplist,ArrayList docList, String artifactSysUUID) throws RemoteException;
        //end systinet digiblitz technoglogies
           
        public HashMap BPvotingList() throws RemoteException;
        public HashMap WSvotingList() throws RemoteException;
        //===================BPM/WS end======================
        public boolean changeBPapprovedstatus(ArrayList approve) throws RemoteException;
        public boolean changeWSapprovedstatus(ArrayList approve) throws RemoteException;
        public boolean changeWSdeniedstatus(ArrayList approve) throws RemoteException;
        public boolean changeBPdeniedstatus(ArrayList approve) throws RemoteException;

}
