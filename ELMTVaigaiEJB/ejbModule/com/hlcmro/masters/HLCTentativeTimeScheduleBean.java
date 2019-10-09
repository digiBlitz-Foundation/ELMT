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
/*  Program Name    : TentativeTimeScheduleBean.java
 *  Created Date    : Aug 29, 2006 7:31:37 PM
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
package com.hlcmro.masters;

import com.hlcmro.exception.HLCMissingPrimaryKeyException;
import com.hlcmro.util.DBHelper;
import com.hlcmro.util.Debug;
import com.hlcmro.util.HLCEJBAllJNDIs;
import javax.ejb.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;
import java.util.Date;

/**
 * This is the bean class for the TentativeTimeScheduleBean enterprise bean.
 * Created Aug 29, 2006 7:31:37 PM
 * @author suresh
 */
public class HLCTentativeTimeScheduleBean implements EntityBean, HLCTentativeTimeScheduleLocalBusiness {
    private EntityContext context;
    private String timeScheduleId;
    private String eventId;
    private Date day;
    private String phase;
    private String time;
    private Connection con;
    
    //getter
    public String getTimeScheduleId() {
        return timeScheduleId;
    }
    public String getEventId() 	{
        return eventId;
    }
    public Date getDay() 	{
        return day;
    }
    public String getPhase() {
        return phase;
    }
    public String getTime() {
        return time;
    }

    //setter
    public void setTimeScheduleId(String timeScheduleId) {
        this.timeScheduleId = timeScheduleId;
    }
    public void setEventId(String eventId) {
        this.eventId = eventId ;
    }
    public void setDay(Date day) {
        this.day = day;
    }
    public void setPhase(String phase) {
        this.phase = phase;
    }
    public void setTime(String time) {
        this.time = time;
    }
   
    public String ejbCreate(String eventId,Date day,String phase,String time) throws CreateException{
        Debug.print("TentativeTimeScheduleBean ejbCreate");
        this.eventId = eventId;
        this.day = day ;
        this.phase = phase ;
        this.time = time ;
        try {
            insertRowTTSDetails();
        } catch (Exception ex) {
            throw new EJBException("ejbCreate: " + ex.getMessage());
        }
        Debug.print("Primary Key: After Insertion" + timeScheduleId);
        return  timeScheduleId;
    }
    
    public void ejbPostCreate(String eventId,Date day,String phase,String time) throws CreateException{
        Debug.print("TentativeTimeScheduleBean ejbPostCreate");
    }
    
    public void setEntityContext(EntityContext aContext) {
        context = aContext;
    }
    
    public void ejbActivate() {
        Debug.print("TentativeTimeScheduleBean ejbActivate");
        timeScheduleId = (String)context.getPrimaryKey();
    }
    
    public void ejbPassivate() {
        Debug.print("TentativeTimeScheduleBean ejbPassivate");
        timeScheduleId = "";   
    }
    
    public void ejbRemove() {
        Debug.print("TentativeTimeScheduleBean ejbRemove");
        try {
            deleteRow(timeScheduleId);
        } catch (Exception ex) {
            throw new EJBException("ejbRemove: " + ex.getMessage());
        }
    }
       
    public void unsetEntityContext() {
         Debug.print("TentativeTimeScheduleBean unsetEntityContext");
        context = null;
    }
    
    public void ejbLoad() { 
        Debug.print("TentativeTimeScheduleBean ejbLoad");
        try {
            loadTTSDetails();
        } catch (Exception ex) {
            throw new EJBException("ejbLoad: " + ex.getMessage());
        }
    }
    
    public void ejbStore() {
        Debug.print("TentativeTimeScheduleBean ejbStore");

        try {
            storeTTSDetails();
        } catch (Exception ex) {
            throw new EJBException("ejbStore: " + ex.getMessage());
        }
    }
     
   public String ejbFindByPrimaryKey(String timeScheduleId) throws FinderException {
        Debug.print("TentativeTimeScheduleBean ejbFindByPrimaryKey");

        boolean result;

        try {
            result = selectByPrimaryKey(timeScheduleId);
        } catch (Exception ex) {
            throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
        }

        if (result) {
            return timeScheduleId;
        } else {
            throw new ObjectNotFoundException("Row for id " + timeScheduleId + " not found.");
        }
    }
       /*********************** Database Routines *************************/
/**
  * @Method Name    :selectByPrimaryKey.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String timeScheduleId.
  * @return         :boolean value.
  * @throws         :SQLException.
  */
  private boolean selectByPrimaryKey(String timeScheduleId) throws SQLException {
        Debug.print("TentativeTimeScheduleBean selectByPrimaryKey:" + timeScheduleId);
        boolean result = false;          
        makeConnection();
        try {
            String selectStatement = "SELECT time_schedule_id from " + DBHelper.USEA_MRO_TENTATIVE_TIME_SCHEDULE  + " WHERE time_schedule_id = ?";
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, timeScheduleId);

            ResultSet rs = prepStmt.executeQuery();
            result = rs.next();
            prepStmt.close();
            releaseConnection();
            Debug.print("TentativeTimeScheduleBean selectByPrimaryKey" + result);
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in selectByPrimaryKey:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in selectByPrimaryKey:" + e.getMessage());
        }
         return result;
    }
    
/**
  * @Method Name    :ejbFindByAll.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Collection value.
  * @throws         :FinderException.
  */  
  public Collection ejbFindByAll() throws FinderException {
        Debug.print("TentativeTimeScheduleBean ejbFindAll");
        Vector ttsList = new Vector();
        makeConnection();
   	try {
            String selectStatement = "select time_schedule_id from " + DBHelper.USEA_MRO_TENTATIVE_TIME_SCHEDULE ;
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()){
                ttsList.addElement(rs.getString(1));
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
        } 
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
        }
        return ttsList;
}

/**
  * @Method Name    :ejbFindByEventId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String eventId.
  * @return         :Collection value.
  * @throws         :FinderException.
  */   
  public Collection ejbFindByEventId(String eventId) throws FinderException{
        Debug.print("TentativeTimeScheduleBean ejbFindByEventId");
        Vector eventList = new Vector();
        makeConnection();
   	try {
            String selectStatement = "select time_schedule_id from " + DBHelper.USEA_MRO_TENTATIVE_TIME_SCHEDULE + " where event_id = ?";
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setFloat(1,Float.parseFloat(eventId));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()){
                eventList.addElement(rs.getString(1));
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
        } 
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in ejbFindByEventId:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in ejbFindByEventId:" + e.getMessage());
        }
        return eventList;
  }
   
/**
  * @Method Name    :getNextId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :String value.
  * @throws         :SQLException ,MissingPrimaryKeyException.
  */   
  private String getNextId() throws SQLException ,HLCMissingPrimaryKeyException {
        Debug.print("TentativeTimeScheduleBean getNextId");
        makeConnection();
        String nextId = null;
        try{
            String selectStatement = "select newid() as timeScheduleId";
            Debug.print("TentativeTimeScheduleBean getNextId:" + selectStatement);
            PreparedStatement prepSelect = con.prepareStatement(selectStatement);
            ResultSet rs = prepSelect.executeQuery();
            rs.next();
            nextId = rs.getString(1);
            rs.close();
            prepSelect.close();
            releaseConnection();
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in getNextId:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in getNextId:" + e.getMessage());
        }        
        return nextId;
    }
  
/**
  * @Method Name    :insertRowTTSDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :SQLException ,MissingPrimaryKeyException.
  */   
  private void insertRowTTSDetails() throws SQLException,HLCMissingPrimaryKeyException {
        Debug.print("TentativeTimeScheduleBean insertRowTTSDetails");
        
        this.timeScheduleId = getNextId();
        
        makeConnection();
        try{
            String insertStatement =
                "insert into " + DBHelper.USEA_MRO_TENTATIVE_TIME_SCHEDULE  + "(time_schedule_id, event_id, day, phase, time) " +
                 " values ( ? , ? , ? , ?, ?)";
            PreparedStatement prepStmt = con.prepareStatement(insertStatement);
            prepStmt.setString(1, timeScheduleId);
            prepStmt.setInt(2, Integer.parseInt(eventId));
           
            if(day==null){
                prepStmt.setDate(3, null);
            }
            else{
                prepStmt.setDate(3, DBHelper.toSQLDate(day));
            }
           
            prepStmt.setString(4, phase);
            prepStmt.setString(5, time);
            prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in insertRowTTSDetails:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in insertRowTTSDetails:" + e.getMessage());
        }        
    }

/**
  * @Method Name    :loadTTSDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :SQLException.
  */  
  private void loadTTSDetails() throws SQLException {
        Debug.print("TentativeTimeScheduleBean loadTTSDetails");
        timeScheduleId = (String)context.getPrimaryKey();

        Debug.print("TentativeTimeScheduleBean loadTTSDetails Primary Key:" + timeScheduleId );
        makeConnection();
        try{
            String selectStatement =
                "select  event_id, day, phase, time from " + DBHelper.USEA_MRO_TENTATIVE_TIME_SCHEDULE  + " where time_schedule_id = ? ";
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, timeScheduleId);
            ResultSet rs = prepStmt.executeQuery();
            if (rs.next()) {
                this.eventId = rs.getString(1);
		this.day = rs.getDate(2);
		this.phase = rs.getString(3);
		this.time = rs.getString(4);

                prepStmt.close();
                releaseConnection();
            } else {
                prepStmt.close();
                releaseConnection();
                throw new NoSuchEntityException("Row for id " + timeScheduleId + " not found in database.");
            }
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in loadTTSDetails:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in loadTTSDetails:" + e.getMessage());
        }        
    }
    
/**
  * @Method Name    :storeTTSDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :SQLException.
  */  
  private void storeTTSDetails() throws SQLException {
        Debug.print("TentativeTimeScheduleBean storeTTSDetails");
        makeConnection();
        try{
            String updateStatement =
                    "update " + DBHelper.USEA_MRO_TENTATIVE_TIME_SCHEDULE  + " set event_id = ? , day = ? ," + 
                    " phase = ?, time = ?  where time_schedule_id = ? ";
            PreparedStatement prepStmt = con.prepareStatement(updateStatement);
            prepStmt.setInt(1, Integer.parseInt(eventId));
            
           if(day==null){
            prepStmt.setDate(2, null);
            }
            else{
                prepStmt.setDate(2, DBHelper.toSQLDate(day));
            }
            prepStmt.setString(3, phase);
            prepStmt.setString(4, time);
            prepStmt.setString(5, timeScheduleId);
            
            int rowCount = prepStmt.executeUpdate();
            Debug.print("Sucessfully Updated." + rowCount);
            prepStmt.close();
            releaseConnection();
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in storeTTSDetails:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in storeTTSDetails:" + e.getMessage());
        }        
    }
   
/**
  * @Method Name    :deleteRow.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String timeScheduleId.
  * @return         :void value.
  * @throws         :SQLException.
  */   
  private void deleteRow(String timeScheduleId) throws SQLException {
         Debug.print("TentativeTimeScheduleBean deleteRow");

        makeConnection();
        try{
            String deleteStatement = "delete from " + DBHelper.USEA_MRO_TENTATIVE_TIME_SCHEDULE  + "  where time_schedule_id = ? ";
            PreparedStatement prepStmt = con.prepareStatement(deleteStatement);

            prepStmt.setString(1, timeScheduleId);
            prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in deleteRow:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in deleteRow:" + e.getMessage());
        }        
    }
       
/**
  * @Method Name    :makeConnection.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :Null.
  */  
  private void makeConnection() {
    Debug.print("TentativeTimeScheduleBean : makeConnection");
    try {
        InitialContext ic = new InitialContext();
        DataSource ds = (DataSource) ic.lookup(HLCEJBAllJNDIs.USEA_DB);
        con = ds.getConnection();
    } catch (Exception ex) {
        throw new EJBException("Unable to connect to database. " + ex.getMessage());
    }
}

/**
  * @Method Name    :releaseConnection.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :Null.
  */  
  private void releaseConnection() {
    Debug.print("TentativeTimeScheduleBean releaseConnection");
    try {
        con.close();
    } catch (SQLException ex) {
        throw new EJBException("releaseConnection: " + ex.getMessage());
    }
  }
}