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
package com.systinet.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.form.SystinetRequestVo;
//import com.hlcform.util.Debug;





public class SystinetDao {
	private static final String dbName = "java:/ELMTMSSQLDS";
	//start systinet digiblitz technoglogies
		private static final String dbName1 = "java:/HPSOAMSSQLDS";
		//end systinet digiblitz technoglogies
    private Connection con = null;
    private Connection con1 = null;
    private PreparedStatement prepStmt = null;
    private ResultSet rs = null;
	
	
    
    
     //=====================BPM/WS start================================================
    
    public boolean insertBundlesReq(SystinetRequestVo vo,String reqName)
    {
    	boolean inser=false;
    	
    	  makeConnection();
          try {
              String insertStatement = "insert into tblbundleseditreq(req_id,req_title,date_ws,date_req,cur_ver,mod_ver,req_pri,req_desc,req_name, artifact_id,stage_name,stage_no) values (?,?,?,?,?,?,?,?,?,?,?,?)";
              
              prepStmt = con.prepareStatement(insertStatement);
              
              
              prepStmt.setString(1, vo.getReqId());
              prepStmt.setString(2, vo.getReqTitle());
              prepStmt.setString(3, vo.getDate1());
              prepStmt.setString(4, vo.getDate2());
              prepStmt.setString(5, vo.getCurVersion());
              prepStmt.setString(6, vo.getModVersion());
              prepStmt.setString(7, vo.getReqPri());
              prepStmt.setString(8, vo.getReqDesc());
              prepStmt.setString(9, reqName);
              prepStmt.setString(10,vo.getArtUid() );
              prepStmt.setString(11, vo.getStageName());
              prepStmt.setInt(12, vo.getStageNo());
              int cnt = prepStmt.executeUpdate();
              if(cnt>=1){
             
            	  inser=true;
            	  
              }
              System.out.println("SystinetDao insertUserDetails() Status :" + inser);
              prepStmt.close();
              releaseConnection();
          } catch(SQLException sql){
              releaseConnection();
              System.out.println("SQL Exception in SystinetDao.insertBundlesReq():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection();
              System.out.println("General Exception  in SystinetDao.insertBundlesReq():" + e.getMessage());
          }
    	
    	
    	return inser;
    }
    
    public ArrayList listRequestView(String date, String typeReq, String RrqId ,String reqPri)
    {
    	boolean inser=false;
    	ArrayList list=new ArrayList();
    	
    	  makeConnection();
          try {
              StringBuffer listStatement = new StringBuffer(); 
              listStatement.append(" select req_id,req_title,date_ws,req_pri,req_desc,req_name, status from tblbundleseditreq where id  is not null  ");
              
              StringBuffer whereStmt = new StringBuffer();
              
              if(date!=null && !date.isEmpty()) whereStmt.append(" and date_ws like '%"+date+"%' ");
              if(typeReq!=null && !typeReq.isEmpty()) whereStmt.append(" and req_name like '%"+typeReq+"%' ");
              if(RrqId!=null && !RrqId.isEmpty()) whereStmt.append(" and req_id like '%"+RrqId+"%' ");
              if(reqPri!=null && !reqPri.isEmpty()) whereStmt.append(" and req_pri like '%"+reqPri+"%'");
              
           //   if(whereStmt.toString() != null)
            	//  listStatement.append(" where ");
              
              listStatement.append(whereStmt.toString());
              System.out.println("Statement String : "+listStatement);
            	  
              
              int ii = 1;
              prepStmt = con.prepareStatement(listStatement.toString());
              rs=prepStmt.executeQuery();
              while(rs.next())
              {
            	  String req_id=rs.getString(1);
            	  String req_title=rs.getString(2);
            	  String date_ws=rs.getString(3);
            	  String req_pri=rs.getString(4);
            	  String req_desc=rs.getString(5);
            	  String req_name=rs.getString(6);
            	  String status=rs.getString(7);
            	  if(req_name.equalsIgnoreCase("BP")){
            		  req_name="Business process"; 
            	  }
            	  if(req_name.equalsIgnoreCase("O")){
            		  req_name="Others"; 
            	  }
            	  if(req_name.equalsIgnoreCase("WS")){
            		  req_name="Web Service"; 
            	  }
            	  
            	  if(req_name.equalsIgnoreCase("AR")){
            		  req_name="Artifact"; 
            	  }
            	 
            	 // String temp[]={req_id,req_title,date_ws,req_pri,req_desc,req_name,status};
            	  String temp[]={Integer.toString(ii),date_ws,req_id,req_name,req_desc,req_pri,status};
            	  ii++;
            	  list.add(temp);
              }
             
             
              
              System.out.println("SystinetDao insertUserDetails() Status :" + inser);
              prepStmt.close();
              releaseConnection();
          } catch(SQLException sql){
              releaseConnection();
              System.out.println("SQL Exception in SystinetDao.insertBundlesReq():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection();
              System.out.println("General Exception  in SystinetDao.insertBundlesReq():" + e.getMessage());
          }
    	
    	
    	return list;
    }
    
    
    public ArrayList getNewRequestSubmitted() throws SQLException {
  
        makeConnection();
        try{
            
        ScheduledExecutorService executorService = Executors.newScheduledThreadPool(1);
        executorService.scheduleWithFixedDelay(new Runnable() {
        	
                    private Date lastTimeChecked =  new Date(12/12/30);

					public void run() {
                    	Date now = new Date(0);
                    	PreparedStatement statement;
						try {
							statement = con.prepareStatement("SELECT * FROM tblbundleseditreq WHERE Lastupdate BETWEEN"+lastTimeChecked+"AND"+now);
							statement.setDate(1, this.lastTimeChecked );
	                    	statement.setDate(2, now);
	                    	ResultSet rs = statement.executeQuery();
	                    	while (rs.next()) {
	                    	    
	                    	}
	                    	this.lastTimeChecked = now;                    	
	                               rs.close();
	                               statement.close();
	                               releaseConnection();
	                        
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
                    
                }, 10, 5, TimeUnit.SECONDS);
    } catch(Exception e){
        releaseConnection();
      
    }
        
		return null;
    }
    
    
    public boolean chgStatusWSBPM(String lifecycleId,String artifactId)
    {
    	boolean update=true;
    	
    	  makeConnection();
          try {
              String updStatement = "update tblsystinetbpmprocess set status = ? where  lifecycleId= ? and artifactId= ? ";
              
              prepStmt = con.prepareStatement(updStatement);
              
              prepStmt.setString(1, "Pending");
              prepStmt.setString(2, lifecycleId);
              prepStmt.setString(3, artifactId);
     
              int cnt = prepStmt.executeUpdate();
              if(cnt>=1)update=true;
             
            
              System.out.println("SystinetDao chgStatusWSBPM() Status :" + update);
              prepStmt.close();
              releaseConnection();
          } catch(SQLException sql){
              releaseConnection();
              System.out.println("SQL Exception in SystinetDao.chgStatusWSBPM():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection();
              System.out.println("General Exception  in SystinetDao.chgStatusWSBPM():" + e.getMessage());
          }
    	
    	
    	return update;
    }
    
   
    
    
    public ArrayList Stagename(String lifecycleId, String artifactId)
    {
    	boolean inser=false;
    	ArrayList list=new ArrayList();
    	int Stage=0;
    	  makeConnection();
          try {
             String selectStmt="select count(*) count from tblvoting where processId= ? and ArtifactId=?";
            	  
            // id,artfUuid,artfName,artfTypeId,artfTypeName,artfVersion,status,modName
              
              prepStmt = con.prepareStatement(selectStmt);
              prepStmt.setString(1, lifecycleId);
              prepStmt.setString(2, artifactId);
              rs=prepStmt.executeQuery();
              while(rs.next())
              {
            	  String stagevalue=rs.getString(1);
            	  Stage=Integer.valueOf(stagevalue);
            	  System.out.println("Stage"+Stage);
              }
              
             
              
              prepStmt.close();
              
              Stage++;
           	 
           	   String selectStmt3="select stageName,stage from tblLifecycleprocessinsert where id= ? and stage=? ";
           	   
           	   prepStmt = con.prepareStatement(selectStmt3);
                  prepStmt.setString(1, lifecycleId);
                  prepStmt.setInt(2, Stage);
                  rs=prepStmt.executeQuery();
                  System.out.println("Stage else rs "+rs);
                  
                  while(rs.next())
                  {
               	  System.out.println( "else rs "+rs.getString(1));
                	  String stagename=rs.getString(1);
                	 String Stagevalue=rs.getString(2);
                	 System.out.println("stagename else "+stagename);
                	 String[] Stagelist={stagename,Stagevalue};
                	list.add(Stagelist);
                	
                  System.out.println("SystinetDao listWsBpm() Status :" + inser);
                
                  }
              
                  prepStmt.close();
              
            
            
              
              releaseConnection();
          } catch(SQLException sql){
              releaseConnection();
              System.out.println("SQL Exception in SystinetDao.listWsBpm():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection();
              System.out.println("General Exception  in SystinetDao.listWsBpm():" + e.getMessage());
          }
    	
    	
    	return list;
    }
       
    
    
    public boolean updateStatus(String reqId, String artifactUuid, String status, String StageName)
    {
    	boolean update=false;
    	
    	  makeConnection();
          try {
              String updStatement = "update tblbundleseditreq set status = ? where  req_id= ? and artifact_id= ? and stage_name= ?";
              
              prepStmt = con.prepareStatement(updStatement);
              
              prepStmt.setString(1, status);
              prepStmt.setString(2, reqId);
              prepStmt.setString(3, artifactUuid);
              prepStmt.setString(4, StageName);
           
              
              int cnt = prepStmt.executeUpdate();
              if(cnt>=1)update=true;
             
              System.out.println("SystinetDao updateStatus() updStatement :==========" +"id=========="+reqId+"modName========="+ updStatement);
              System.out.println("SystinetDao updateStatus() Status :" + update);
              prepStmt.close();
              releaseConnection();
          } catch(SQLException sql){
              releaseConnection();
              System.out.println("SQL Exception in SystinetDao.updateStatus():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection();
              System.out.println("General Exception  in SystinetDao.updateStatus():" + e.getMessage());
          }
    	
    	
    	return update;
    }
	
	 public boolean updateArtifactStatus(String lifecycleId, String artifactId,String status)
    {
		 boolean update=false;
		 
		 System.out.println("lifecycleId"+lifecycleId);
		 System.out.println("artifactId"+artifactId);
		 System.out.println("status"+status);
	    	
   	  makeConnection();
         try {
             String updStatement = "update tblsystinetbpmprocess set status = ? where lifecycleId= ? and artifactId= ?";
             
             prepStmt = con.prepareStatement(updStatement);
             
             prepStmt.setString(1, status);
             prepStmt.setString(2, lifecycleId);
             prepStmt.setString(3, artifactId);
    
             int cnt = prepStmt.executeUpdate();
             if(cnt>=1)update=true;
            
           
             System.out.println("SystinetDao updateArtifactStatus() Status :" + update);
             prepStmt.close();
             releaseConnection();
         } catch(SQLException sql){
             releaseConnection();
             System.out.println("SQL Exception in SystinetDao.updateArtifactStatus():" + sql.getMessage());
         } catch(Exception e){
             releaseConnection();
             System.out.println("General Exception  in SystinetDao.updateArtifactStatus():" + e.getMessage());
         }
   	
   	
   	return update;
    }
    
    public ArrayList listWsBpm(String artifacttype)
    {
    	boolean inser=false;
    	ArrayList list=new ArrayList();
    	
    	  makeConnection();
          try {
             String selectStmt="select processname,BPversion,status,artifactId,lifecycleId,processdescription from tblsystinetbpmprocess where artifacttype= ? ";
            	  
            // id,artfUuid,artfName,artfTypeId,artfTypeName,artfVersion,status,modName
              
              prepStmt = con.prepareStatement(selectStmt);
              prepStmt.setString(1, artifacttype);
              rs=prepStmt.executeQuery();
              int id =1;
              while(rs.next())
              {
            	  String processname=rs.getString(1);
            	  String BPversion=rs.getString(2);
            	  String status=rs.getString(3);
            	  String artifactId=rs.getString(4);
            	  String lifecycleId=rs.getString(5);
            	  String procesDecs=rs.getString(6);
            	  
            	String idno=String.valueOf(id); 
            	
            	System.out.println(processname+"----------"+BPversion+"----------"+status+"--------"+artifactId+"--------"+lifecycleId);
        	  String temp[]={idno,processname,BPversion,status,artifactId,lifecycleId,procesDecs};
            	  list.add(temp);
            	  id++;
              }
             
             
              
              System.out.println("SystinetDao listWsBpm() Status :" + inser);
              prepStmt.close();
              releaseConnection();
          } catch(SQLException sql){
              releaseConnection();
              System.out.println("SQL Exception in SystinetDao.listWsBpm():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection();
              System.out.println("General Exception  in SystinetDao.listWsBpm():" + e.getMessage());
          }
    	
    	
    	return list;
    }
    
    public ArrayList getLifecycleProc(String artifactType)
    {
    	
    	ArrayList lifeList=new ArrayList();
    	
    	  makeConnection();
          try {
             String selectStmt="select distinct id,lifecycleProName from tblLifecycleprocessinsert where addArtifacttype= ? ";
            	          
              prepStmt = con.prepareStatement(selectStmt);
              prepStmt.setString(1, artifactType);           
              rs=prepStmt.executeQuery();
              while(rs.next())
              {
            	  String id=rs.getString(1);
            	  String name=rs.getString(2);
            	  
            	
            	  String temp[]={id,name};
            	  lifeList.add(temp);
            	  
            	  
                  System.out.println("lifecycleId in systinetDAO"+id);
                  System.out.println("lifecycleName in systinetDAO"+name);	  
              }
            
              
              System.out.println("SystinetDao getLifecycleProc() Status :" + lifeList.size());
              prepStmt.close();
              releaseConnection();
          } catch(SQLException sql){
              releaseConnection();
              System.out.println("SQL Exception in SystinetDao.getLifecycleProc():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection();
              System.out.println("General Exception  in SystinetDao.getLifecycleProc():" + e.getMessage());
          }
    	
    	
    	return lifeList;
    }
    
    //==========ArtifactUUID===========================
    
    public String getArtifactUUid(String artifactName)
    {  
    	String artfuuid=null;
    	makeConnection1();
          try {
        	  String selectStmt="select distinct artfUuid from ry_userEvent_artifacts  where artfName = ?";          	  
              
            
              prepStmt = con1.prepareStatement(selectStmt);
              prepStmt.setString(1, artifactName);
              rs=prepStmt.executeQuery();
              while(rs.next())
              {
            	 // String id=rs.getString(1);
            	   artfuuid=rs.getString(1);
            	 
              }
             
             
              
              System.out.println("SystinetDao getArtifactUUid() Status :" + artfuuid);
              prepStmt.close();
              releaseConnection1();
          } catch(SQLException sql){
              releaseConnection1();
              System.out.println("SQL Exception in SystinetDao.getArtifactUUid():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection1();
              System.out.println("General Exception  in SystinetDao.getArtifactUUid():" + e.getMessage());
          }
    	
    	
    	return artfuuid;
    }
    
    public boolean isLifecycleExist(String lifecycleId)
    {  
    	boolean result=false;
    	String name="";
    	makeConnection1();
          try {
        	  String selectStmt="select name from rylf_process where baseUuid = ?";          	  
              
            
              prepStmt = con1.prepareStatement(selectStmt);
              prepStmt.setString(1, lifecycleId);
              rs=prepStmt.executeQuery();
              while(rs.next())
              {
            	
            	  name =rs.getString(1);
            	  
            	  result=true; 
              }
             
             
              
              System.out.println("SystinetDao isLifecycleExist() Name :" + name);
              prepStmt.close();
              releaseConnection1();
          } catch(SQLException sql){
              releaseConnection1();
              System.out.println("SQL Exception in SystinetDao.isLifecycleExist():" + sql.getMessage());
          } catch(Exception e){
              releaseConnection1();
              System.out.println("General Exception  in SystinetDao.isLifecycleExist():" + e.getMessage());
          }
    	
    	
    	return result;
    }
    
    
	    //start systinet digiblitz technoglogies
	    public boolean wsproceesSubmit(ArrayList wsprolist,String artifactSysUUID)
	    {
	     
	    	boolean insert=false;
	           System.out.println("wsprolist.size()"+wsprolist.size());	
	           String id=null;
	           
	           if(wsprolist!=null && wsprolist.size()!=0){  
	             makeConnection();
	             try {            
                  String artifacttype="businessServiceArtifact";                    
	                     Iterator  wsType = wsprolist.iterator();	                    
	                      while (wsType.hasNext()) {
	                        
	                          String []strType = (String[]) wsType.next();
	                         
	                         String name=strType[0];
	                         System.out.println("the name of ws inside dao" +name);
	                       String cons=strType[1];
	                       String desc=strType[2];
	                       String criticality=strType[3];
	                       String version=strType[4];
	                       String wsdlname=strType[5];
	                       String wsdlpath=strType[6];
	                       String wsdldesc=strType[7];
	                       String wsdlcriticality=strType[8];
	                       String wsdlversion=strType[9];
	                       String wsdltrname=strType[10];
	                       String wsdllocation=strType[11];
	                       String docname=strType[12];
	                       String docdesc=strType[13];
	                       String docpath=strType[14];
	                       String doclocat=strType[15];
	                       
	                       String lifecycleID= null;
	                       
	                       String insertStatement = "insert into tblsystinetbpmprocess(processname,consumable,processdescription," +
	                       		"criticality,filename,filepath,filedescription,filecriticality,fileversion,filetargetnamespace,filelocation,docname,docdescription,docfrompath,doctopath,artifacttype,artifactId,lifecycleId,BPversion) " +
	                               "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	                       
	                       prepStmt = con.prepareStatement(insertStatement);	                       
	                       
	                      
	                       prepStmt.setString(1,name );
	                       prepStmt.setString(2,cons );
	                       prepStmt.setString(3, desc);
	                       prepStmt.setString(4, criticality);
	                       prepStmt.setString(5, wsdlname);
	                       prepStmt.setString(6, wsdlpath);
	                       prepStmt.setString(7,wsdldesc );
	                       prepStmt.setString(8, wsdlcriticality);
	                       prepStmt.setString(9, wsdlversion);
	                       prepStmt.setString(10,wsdltrname );
	                       prepStmt.setString(11, wsdllocation);
	                       prepStmt.setString(12,docname );
	                       prepStmt.setString(13,docdesc );
	                       prepStmt.setString(14,docpath );
	                       prepStmt.setString(15,doclocat );
	                       prepStmt.setString(16,artifacttype );
	                       prepStmt.setString(17,artifactSysUUID );
	                       prepStmt.setString(18,lifecycleID );
	                       prepStmt.setString(19,version );
	                      
	                       System.out.println("prepStmt"+prepStmt);
	                       
	                       int cnt = prepStmt.executeUpdate();
	                       System.out.println("Record Inserted succefully into tblsystinetbpmprocess "+cnt);
	                       insert = true;
	                       
	                       System.out.println("SystinetDAO bpproceesSubmit() Status :" + insert);
	                       
	                      }
	             
	                       prepStmt.close();
	                       releaseConnection();       
	             
	    
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.chgStatusWSBPM():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.chgStatusWSBPM():" + e.getMessage());
	          }
	           }
	     
	     return insert;
	    }
	    
	    
	    public boolean lifeCycleInsert( ArrayList lifecyclelist,String processId)
	    {
	     boolean insert=false;
	   //  System.out.println("ssssssss111111111111");
	       makeConnection();
	          try {
	           ArrayList lifecyclist = lifecyclelist;
	           
	           if(lifecyclist!=null){
	               Iterator  bpType = lifecyclist.iterator();
	                // int id=1;
	                while (bpType.hasNext()) {
	                	 String []strType = (String[]) bpType.next();
	                	 System.out.println("before insert");
	                	 String lifecycleProName=strType[0];
	 	             	String numofStage=strType[1];
	 	             	String dateofCreation=strType[2];
	 	             	System.out.println("dateofCreation:::::::::::::::::::::::::"+dateofCreation);
	 	             	String createdBy=strType[3];
	 	             	System.out.println("createdBy:::::::::::::::::::::::::"+createdBy);
	 	             	String stage=strType[4];
	 	             	System.out.println("stage:::::::::::::::::::::::::"+stage);
	 	             	String stageName=strType[5];
	 	             	String input=strType[6];
	 	             	String process=strType[7];
	 	             	String voter=strType[8];
	 	             	String output=strType[9];
	 	             	String descripition=strType[10];
	 	                 String addArtifacttype=strType[11]; 
	 	                 String votes=strType[12]; 
	                	//String insertStatement = "insert into tblLifecycleprocessinsert(id,lifecycleProName)values(?,?)";
	     	           
	                	String insertStatement = "insert into tblLifecycleprocessinsert(id,lifecycleProName,numofStage,createdBy,dateofCreation,stage,stageName,input,process,voter,output,descripition,addArtifacttype,votes) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	                     prepStmt = con.prepareStatement(insertStatement);
	                     
	                     prepStmt.setString(1, processId);
	                     prepStmt.setString(2, lifecycleProName);
	                     prepStmt.setString(3, numofStage);
	                     prepStmt.setString(4, createdBy);
	                     prepStmt.setString(5, dateofCreation);
	                     prepStmt.setString(6, stage);
	                     prepStmt.setString(7, stageName);
	                     prepStmt.setString(8, input);
	                     prepStmt.setString(9, process);
	                     prepStmt.setString(10, voter);
	                     prepStmt.setString(11, output);
	                     prepStmt.setString(12, descripition);
	                     prepStmt.setString(13, addArtifacttype);
	                     prepStmt.setString(14, votes);
	                     prepStmt.executeUpdate();   
	                    System.out.println("AFTER insert");
	                 //id++;
	                 prepStmt.close();
	                }
	           }

	              
	                
	              
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.chgStatusWSBPM():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.chgStatusWSBPM():" + e.getMessage());
	          }
	     
	     
	     return insert;
	    }
	    
	    public  HashMap <Integer,String[]> selectvoting()
	    {
	    	  System.out.println("Inside listProcessView()");
	    	  HashMap <Integer,String[]> BundlesBPMData=new HashMap();
	    	
	    	  makeConnection();
	          try {
	            String selectStmt="select ProcessId,StageName,StageValue,ArtifactId,ArtifactName,ArtifactDescription,DORequest,Comments,stage,req_id from tblvoting where Status='pending' and requestname='bp'";          	  
	              
	              
	              prepStmt = con.prepareStatement(selectStmt);
	            
	              rs=prepStmt.executeQuery();
	              int id=1;
	              while(rs.next())
	              {
	            	  String ProcessId=rs.getString(1);
	                  String StageName=rs.getString(2);
	            	  String StageValue=rs.getString(3);
	            	  String ArtifactId=rs.getString(4);
	            	  String ArtifactName=rs.getString(5);
	            	  String ArtifactDescription=rs.getString(6);
	            	  String DORequest=rs.getString(7);
	            	  String Comments=rs.getString(8);
	            	  String stageNo=rs.getString(9);
	            	  String reqId=rs.getString(10);
	            	  String temp[]={ArtifactName,ArtifactDescription,DORequest,StageName,Comments,ProcessId,ArtifactId,StageValue,stageNo,reqId};
	            	  BundlesBPMData.put(id,temp);
	            	  id++;
	            	 
	              }
	             
	             
	              
	           
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.listProcessView():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.listProcessView():" + e.getMessage());
	          }
	    	
	    	
	    	return BundlesBPMData;
	    }
	    public  HashMap <Integer,String[]> selectvotingws()
	    {
	    	  System.out.println("Inside listProcessView()");
	    	  HashMap <Integer,String[]> BundlesBPMData=new HashMap();
	    	
	    	  makeConnection();
	          try {
	            String selectStmt="select ProcessId,StageName,StageValue,ArtifactId,ArtifactName,ArtifactDescription,DORequest,Comments,stage,req_id from tblvoting where Status='pending' and requestname='ws'";          	  
	              
	              
	              prepStmt = con.prepareStatement(selectStmt);
	            
	              rs=prepStmt.executeQuery();
	              int id=1;
	              while(rs.next())
	              {
	            	  String ProcessId=rs.getString(1);
	                  String StageName=rs.getString(2);
	            	  String StageValue=rs.getString(3);
	            	  String ArtifactId=rs.getString(4);
	            	  String ArtifactName=rs.getString(5);
	            	  String ArtifactDescription=rs.getString(6);
	            	  String DORequest=rs.getString(7);
	            	  String Comments=rs.getString(8);
	            	  String stageNo=rs.getString(9);
	            	  String reqId=rs.getString(10);
	            	  String temp[]={ArtifactName,ArtifactDescription,DORequest,StageName,Comments,ProcessId,ArtifactId,StageValue,stageNo,reqId};
	            	  BundlesBPMData.put(id,temp);
	            	  id++;
	            	 
	              }
	             
	             
	              
	           
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.listProcessView():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.listProcessView():" + e.getMessage());
	          }
	    	
	    	
	    	return BundlesBPMData;
	    }
	    
	    
	    
	    public boolean bpproceesSubmit( ArrayList bpprolist, String artifactSysUUID)
	    {
	    	   boolean insert=false;
	           System.out.println("bpprolist.size()"+bpprolist.size());	
	           String id=null;
	           
	           if(bpprolist!=null && bpprolist.size()!=0){  
	             makeConnection();
	             try {            
                     String artifacttype="hpsoaProcessArtifact";                    
	                     Iterator  bpType = bpprolist.iterator();	                    
	                      while (bpType.hasNext()) {
	                        
	                          String []strType = (String[]) bpType.next();
	                         
	                         String name=strType[0];
	                         System.out.println("the name of bp inside dao" +name);
	                       String cons=strType[1];
	                       String desc=strType[2];
	                       String criticality=strType[3];
	                       String version=strType[4];
	                       String bpname=strType[5];
	                       String bppath=strType[6];
	                       String bpdesc=strType[7];
	                       String bpcriticality=strType[8];
	                       String bpversion=strType[9];
	                       String bptrname=strType[10];
	                       String bplocation=strType[11];
	                       String docname=strType[12];
	                       String docdesc=strType[13];
	                       String docpath=strType[14];
	                       String doclocat=strType[15];
	                   
	                       String lifecycleID= null;
	                       
	                       String insertStatement = "insert into tblsystinetbpmprocess(processname,consumable,processdescription," +
	                       		"criticality,filename,filepath,filedescription,filecriticality,fileversion,filetargetnamespace,filelocation,docname,docdescription,docfrompath,doctopath,artifacttype,artifactId,lifecycleId,BPversion) " +
	                               "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	                       
	                       prepStmt = con.prepareStatement(insertStatement);	                       
	                       
	                      
	                       prepStmt.setString(1,name );
	                       prepStmt.setString(2,cons );
	                       prepStmt.setString(3, desc);
	                       prepStmt.setString(4, criticality);
	                       prepStmt.setString(5, bpname);
	                       prepStmt.setString(6, bppath);
	                       prepStmt.setString(7,bpdesc );
	                       prepStmt.setString(8, bpcriticality);
	                       prepStmt.setString(9, bpversion);
	                       prepStmt.setString(10,bptrname );
	                       prepStmt.setString(11, bplocation);
	                       prepStmt.setString(12,docname );
	                       prepStmt.setString(13,docdesc );
	                       prepStmt.setString(14,docpath );
	                       prepStmt.setString(15,doclocat );
	                       prepStmt.setString(16,artifacttype );
	                       prepStmt.setString(17,artifactSysUUID );
	                       prepStmt.setString(18,lifecycleID );
	                       prepStmt.setString(19,version );
	                      
	                       System.out.println("prepStmt"+prepStmt);
	                       
	                       int cnt = prepStmt.executeUpdate();
	                       System.out.println("Record Inserted succefully into tblsystinetbpmprocess "+cnt);
	                       insert = true;
	                       
	                       System.out.println("SystinetDAO bpproceesSubmit() Status :" + insert);
	                       
	                      }
	             
	                       prepStmt.close();
	                       releaseConnection();  
	                      }
	                      
	           
	              catch(SQLException sql){
	                 releaseConnection();
	                 System.out.println("SQL Exception in SystinetDao.bpproceesSubmit():" + sql.getMessage());
	             } catch(Exception e){
	                 releaseConnection();
	                  e.printStackTrace();
	             }
	             }         
	           return insert;
	          }
	     
	 
	     
	     
	    
	    public ArrayList listProcessView(String arttype)
	    {
	    	  System.out.println("Inside listProcessView()");
	    	ArrayList list=new ArrayList();
	    	
	    	  makeConnection();
	          try {
	           // String selectStmt="select distinct artfuuid,artfname,artftypeid,artftypename,artfversion from ry_userEvent_artifacts  where artftypename = ?";
	        	  String selectStmt="select id,artfName,artfVersion,governStatus from tblwsbpmlist where modname= ?";         
	              
	              
	              prepStmt = con.prepareStatement(selectStmt);
	              prepStmt.setString(1, arttype);
	              rs=prepStmt.executeQuery();
	              while(rs.next())
	              {
	            	 String id=rs.getString(1);
	                       	            	
	            	  String artftypename=rs.getString(2);
	            	  String artfversion=rs.getString(3);
	            	  String governStat=rs.getString(4);
	            	  
	            	  String temp[]={id,artftypename,artfversion,governStat};
	            	  list.add(temp);
	              }
	             
	             
	              
	           
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.listProcessView():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.listProcessView():" + e.getMessage());
	          }
	    	
	    	
	    	return list;
	    }
	    
	    
	    public boolean updateArtifactMapDetails(String artifactUuid, String lifecyleId)
	    {
	    	boolean update=false;
	    	
	    	  makeConnection();
	          try {
	              String updStatement = "update tblsystinetbpmprocess set lifecycleId = ? where  artifactId= ? ";
	              
	              prepStmt = con.prepareStatement(updStatement);
	              
	              prepStmt.setString(1, lifecyleId);
	              prepStmt.setString(2, artifactUuid);
	             	              
	              int cnt = prepStmt.executeUpdate();
	              if(cnt>=1)update=true;
	             
	              System.out.println("SystinetDao updateArtifactMapDetails() updStatement :==========" +"id=========="+lifecyleId+"updateStatement========="+ updStatement);
	              System.out.println("SystinetDao updateArtifactMapDetails() Status :" + update);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.updateArtifactMapDetails():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.updateArtifactMapDetails():" + e.getMessage());
	          }
	    	
	    	
	    	return update;
	    }
	    
	    public boolean insertRequestDetails(String artifactUuid, String lifecyleId, String stageName, String stageNameValue, String status, String reqName, String stageNo, String reqId, String artifactName, String description)
	    {
	    	boolean insertReq=false;
	    	
	    	  makeConnection();
	          try {
	        	  
	        	  System.out.println("Inside DAO artifactUUID ="+artifactUuid+"  stageName="+stageName+"  lifecycleId="+lifecyleId+"  stageNameValue="+stageNameValue+"  status="+status+"  reqName="+reqName+"  stageNo="+stageNo);
	                	  
	        	  String insertStatement = "insert into tblvoting(processId,stageName,stageValue,Status,ArtifactId,requestname,stage,req_id,ArtifactName, ArtifactDescription) " +
                          "values (?,?,?,?,?,?,?,?,?,?)";
                  
                  prepStmt = con.prepareStatement(insertStatement);
                  
                  
                  prepStmt.setString(1,lifecyleId);
                  prepStmt.setString(2,stageName);
                  prepStmt.setString(3,stageNameValue);
                  prepStmt.setString(4, status);
                  prepStmt.setString(5, artifactUuid);
                  prepStmt.setString(6, reqName);
                  prepStmt.setString(7, stageNo);
                  prepStmt.setString(8, reqId);
                  prepStmt.setString(9, artifactName);
                  prepStmt.setString(10, description);
                 
                 
                  System.out.println("prepStmt"+prepStmt);
                  
                   prepStmt.executeUpdate();
                  prepStmt.close();
	            
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.insertRequestDetails():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.insertRequestDetails():" + e.getMessage());
	          }
	    	
	    	
	    	return insertReq;
	    }
	 
	    public ArrayList getStageDetails(String lifecyleId)
	    {
	    	
	    	ArrayList stageList=new ArrayList();
	    	
	    	  makeConnection();
	          try {
	             String selectStmt="select stage, stageName,numofStage from tblLifecycleprocessinsert where id= ? ";
	            	          
	              prepStmt = con.prepareStatement(selectStmt);
	              prepStmt.setString(1, lifecyleId);           
	              rs=prepStmt.executeQuery();
	              while(rs.next())
	              {
	            	  String stage=rs.getString(1);
	            	  String name=rs.getString(2);
	            	  String totStage=rs.getString(3);
	            	         	
	            	  String temp[]={stage,name,totStage};
	            	  stageList.add(temp);
	              }
	             
	             
	              
	              System.out.println("SystinetDao getStageDetails() Status :" + stageList.size());
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.getStageDetails():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.getStageDetails():" + e.getMessage());
	          }
	    	
	    	
	    	return stageList;
	    }
	    
	    
	    
	    public boolean changeBPapprovedstatus(String ProcessId,String StageName,String ArtifactId)
	    {
	    	boolean update=false;
	    	
	    	  makeConnection();
	          try {
	              String updStatement = "update tblvoting set status = ? where  ArtifactId= ? and processId=? and stageName=?";
	              
	              prepStmt = con.prepareStatement(updStatement);
	              
	              prepStmt.setString(1, "Approved");
	              prepStmt.setString(2, ArtifactId);
	              prepStmt.setString(3, ProcessId);
	              prepStmt.setString(4, StageName);
	             	              
	              int cnt = prepStmt.executeUpdate();
	              if(cnt>=1)update=true;
	             
	              System.out.println("SystinetDao changeBPapprovedstatus() updStatement :==========" +"id=========="+ProcessId+"updateStatement========="+ updStatement);
	              System.out.println("SystinetDao changeBPapprovedstatus() Status :" + update);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.changeBPapprovedstatus():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.changeBPapprovedstatus():" + e.getMessage());
	          }
	    	
	    	
	    	return update;
	    }   
	    
	    
	    public String getNextStage(String lifecycleId, String stageNo)
	    {
	    	String stageName="";
	    	
	    	  makeConnection();
	          try {
	             String selectStmt="select stageName from tblLifecycleprocessinsert where id= ? and stage=?";
	            	          
	              prepStmt = con.prepareStatement(selectStmt);
	              prepStmt.setString(1, lifecycleId);    
	              prepStmt.setString(2, stageNo);    
	              rs=prepStmt.executeQuery();
	              if(rs.next())
	              {
	            	   stageName=rs.getString(1);
	            	 
	            	
	              }
	             
	             
	              
	              System.out.println("SystinetDao getNextStage() Status :" + stageName);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.getNextStage():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.getNextStage():" + e.getMessage());
	          }
	    	
	    	
	    	return stageName;
	    }
	    
	    public boolean changeBPdeniedstatus(String ProcessId,String StageName,String ArtifactId)
	    {
	    	boolean update=false;
	    	
	    	  makeConnection();
	          try {
	              String updStatement = "update tblvoting set status = ? where  ArtifactId= ? and processId=? and stageName=?";
	              
	              prepStmt = con.prepareStatement(updStatement);
	              
	              prepStmt.setString(1, "Pending");
	              prepStmt.setString(2, ArtifactId);
	              prepStmt.setString(3, ProcessId);
	              prepStmt.setString(4, StageName);
	             	              
	              int cnt = prepStmt.executeUpdate();
	              if(cnt>=1)update=true;
	             
	              System.out.println("SystinetDao changeBPdeniedstatus() updStatement :==========" +"id=========="+ProcessId+"updateStatement========="+ updStatement);
	              System.out.println("SystinetDao changeBPdeniedstatus() Status :" + update);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.changeBPdeniedstatus():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.changeBPdeniedstatus():" + e.getMessage());
	          }
	    	
	    	
	    	return update;
	    }    
	    
	    
	    public boolean changeWSapprovedstatus(String ProcessId,String StageName,String ArtifactId)
	    {
	    	boolean update=false;
	    	
	    	  makeConnection();
	          try {
	              String updStatement = "update tblvoting set status = ? where  ArtifactId= ? and processId=? and stageName=?";
	              
	              prepStmt = con.prepareStatement(updStatement);
	              
	              prepStmt.setString(1, "Approved");
	              prepStmt.setString(2, ArtifactId);
	              prepStmt.setString(3, ProcessId);
	              prepStmt.setString(4, StageName);
	             	              
	              int cnt = prepStmt.executeUpdate();
	              if(cnt>=1)update=true;
	             
	              System.out.println("SystinetDao changeWSapprovedstatus() updStatement :==========" +"id=========="+ProcessId+"updateStatement========="+ updStatement);
	              System.out.println("SystinetDao changeWSapprovedstatus() Status :" + update);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.changeWSapprovedstatus():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.changeWSapprovedstatus():" + e.getMessage());
	          }
	    	
	    	
	    	return update;
	    }  
		 
	    public boolean changeWSdeniedstatus(String ProcessId,String StageName,String ArtifactId)
	    {
	    	boolean update=false;
	    	
	    	  makeConnection();
	          try {
	              String updStatement = "update tblvoting set status = ? where  ArtifactId= ? and processId=? and stageName=?";
	              
	              prepStmt = con.prepareStatement(updStatement);
	              
	              prepStmt.setString(1, "Pending");
	              prepStmt.setString(2, ArtifactId);
	              prepStmt.setString(3, ProcessId);
	              prepStmt.setString(4, StageName);
	             	              
	              int cnt = prepStmt.executeUpdate();
	              if(cnt>=1)update=true;
	             
	              System.out.println("SystinetDao changeWSdeniedstatus() updStatement :==========" +"id=========="+ProcessId+"updateStatement========="+ updStatement);
	              System.out.println("SystinetDao changeWSdeniedstatus() Status :" + update);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.changeWSdeniedstatus():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.changeWSdeniedstatus():" + e.getMessage());
	          }
	    	
	    	
	    	return update;
	    }  
	    
	    
	    public boolean updateWSBPM(String artifactUuid, String govStatus, String artifactName)
	    {
	    	boolean update=false;
	    	
	    	  makeConnection();
	          try {
	              String updStatement = "update tblWSBPMList set Id = ?, governStatus = ? where  artfName= ? ";
	              
	              prepStmt = con.prepareStatement(updStatement);
	              
	              prepStmt.setString(1, artifactUuid);
	              prepStmt.setString(2, govStatus);
	              prepStmt.setString(3, artifactName);
	             	              
	              int cnt = prepStmt.executeUpdate();
	              if(cnt>=1)update=true;
	             
	              System.out.println("SystinetDao updateWSBPM() updStatement :==========" +"id=========="+artifactUuid+"updateStatement========="+ updStatement);
	              System.out.println("SystinetDao updateWSBPM() Status :" + update);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.updateWSBPM():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.updateWSBPM():" + e.getMessage());
	          }
	    	
	    	return update;
	    }   
	    
	    public boolean updateWSBPMgovStatus(String artifactUuid, String govStatus)
	    {
	    	boolean update=false;
	    	
	    	  makeConnection();
	          try {
	              String updStatement = "update tblWSBPMList set governStatus = ? where  id= ? ";
	              
	              prepStmt = con.prepareStatement(updStatement);
	              
	              prepStmt.setString(1, govStatus);
	              prepStmt.setString(2, artifactUuid);
	            
	             	              
	              int cnt = prepStmt.executeUpdate();
	              if(cnt>=1)update=true;
	             
	              System.out.println("SystinetDao updateWSBPMgovStatus() updStatement :==========" +"id=========="+artifactUuid+"updateStatement========="+ updStatement);
	              System.out.println("SystinetDao updateWSBPMgovStatus() Status :" + update);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.updateWSBPMgovStatus():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.updateWSBPMgovStatus():" + e.getMessage());
	          }
	    	
	    	
	    	return update;
	    }
	    
	    public String getProcUuid(String artifactId)
	    {
	    	String ProcesUId="";
	    	 System.out.println("SystinetDao ProcessUuid :" + artifactId);
	    	 
	    	  makeConnection();
	          try {
	             String selectStmt="select lifecycleId from tblsystinetbpmprocess where artifactId=?";
	            	          
	              prepStmt = con.prepareStatement(selectStmt);
	              prepStmt.setString(1, artifactId);    
	                
	              rs=prepStmt.executeQuery();
	              if(rs.next())
	              {
	            	  ProcesUId=rs.getString(1);
	            	 
	            	
	              }
	             
	              System.out.println("SystinetDao getProcUuid() ProcesId :" + ProcesUId);
	              prepStmt.close();
	              releaseConnection();
	          } catch(SQLException sql){
	              releaseConnection();
	              System.out.println("SQL Exception in SystinetDao.getProcUuid():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection();
	              System.out.println("General Exception  in SystinetDao.getProcUuid():" + e.getMessage());
	          }
	    	
	    	
	    	return ProcesUId;
	    } 
	    
	    
	    
	    public String getProcessId(String ProcessUuid)
	    {
	    	String ProcesId="";
	    	 System.out.println("SystinetDao ProcessUuid :" + ProcessUuid);
	    	 
	    	  makeConnection1();
	          try {
	             String selectStmt="select id from rylf_process where baseUuid=?";
	            	          
	              prepStmt = con1.prepareStatement(selectStmt);
	              prepStmt.setString(1, ProcessUuid);    
	                
	              rs=prepStmt.executeQuery();
	              if(rs.next())
	              {
	            	  ProcesId=rs.getString(1);
	            	 
	            	
	              }
	             
	              System.out.println("SystinetDao getProcessId() ProcesId :" + ProcesId);
	              prepStmt.close();
	              releaseConnection1();
	          } catch(SQLException sql){
	              releaseConnection1();
	              System.out.println("SQL Exception in SystinetDao.getProcessId():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection1();
	              System.out.println("General Exception  in SystinetDao.getProcessId():" + e.getMessage());
	          }
	    	
	    	
	    	return ProcesId;
	    }  
	    
	    
	    
	    public String getStateId(String stageName, String ProcessId)
	    {
	    	String stateId="";
	    	 System.out.println("SystinetDao stageName :" + stageName);
	    	 System.out.println("SystinetDao ProcessId :" + ProcessId);
	    	  makeConnection1();
	          try {
	             String selectStmt="select id from rylf_state where name= ? and fk_rylf_process=?";
	            	          
	              prepStmt = con1.prepareStatement(selectStmt);
	              prepStmt.setString(1, stageName);    
	              prepStmt.setString(2, ProcessId);    
	              rs=prepStmt.executeQuery();
	              if(rs.next())
	              {
	            	  stateId=rs.getString(1);
	            	 
	            	
	              }
	             
	              System.out.println("SystinetDao getStateId() Status :" + stateId);
	              prepStmt.close();
	              releaseConnection1();
	          } catch(SQLException sql){
	              releaseConnection1();
	              System.out.println("SQL Exception in SystinetDao.getStateId():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection1();
	              System.out.println("General Exception  in SystinetDao.getStateId():" + e.getMessage());
	          }
	    	
	    	
	    	return stateId;
	    }
	    
	    public String getTaskId(String stateId)
	    {
	    	String TaskUUID="";
	    	 System.out.println("SystinetDao stateId :" + stateId);
	    	  makeConnection1();
	          try {
	             String selectStmt="select baseUuid from rylf_stateData where fk_rylf_state=?";
	            	          
	              prepStmt = con1.prepareStatement(selectStmt);
	              prepStmt.setString(1, stateId);    
	                
	              rs=prepStmt.executeQuery();
	              if(rs.next())
	              {
	            	  TaskUUID=rs.getString(1);
	            	 
	            	
	              }
	             
	              System.out.println("SystinetDao getTaskId() TaskId :" + TaskUUID);
	              prepStmt.close();
	              releaseConnection1();
	          } catch(SQLException sql){
	              releaseConnection1();
	              System.out.println("SQL Exception in SystinetDao.getTaskId():" + sql.getMessage());
	          } catch(Exception e){
	              releaseConnection1();
	              System.out.println("General Exception  in SystinetDao.getTaskId():" + e.getMessage());
	          }
	    	
	    	
	    	return TaskUUID;
	    }
	        
	    
	    
	    
	    
	    
		 private void makeConnection1() {
		        try {
		            InitialContext ic = new InitialContext();
		            DataSource ds = (DataSource) ic.lookup(dbName1);
		            con1 = ds.getConnection();
		          
		        } catch (Exception ex) {
		        	 System.out.println("Unable to connect to database1. " + ex.getMessage());
		        }
		    }
		 
		 
		 private void makeConnection() {
		        try {
		            InitialContext ic = new InitialContext();
		            DataSource ds = (DataSource) ic.lookup(dbName);
		            con = ds.getConnection();
		          
		        } catch (Exception ex) {
		        	 System.out.println("Unable to connect to database. " + ex.getMessage());
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
		            //prepStmt.close();
		            //rs.close();
		            if(!con.isClosed()){
		                con.close();
		            }
		            System.out.println(" Closing a connection...");
		        } catch (SQLException ex) {
		        	 System.out.println("releaseConnection: " + ex.getMessage());
		        }
		    }
		    
		    private void releaseConnection1() {
		        try {
		            //prepStmt.close();
		            //rs.close();
		            if(!con1.isClosed()){
		                con1.close();
		            }
		            System.out.println(" Closing a connection1...");
		        } catch (SQLException ex) {
		        	 System.out.println("releaseConnection1: " + ex.getMessage());
		        }
		    }
		 
	   // end systinet digiblitz technoglogies
}
