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
/*  Program Name    : SponsorSessionBean.java
 *  Created Date    : Aug 23, 2006 3:15:52 PM
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
package com.hlcspnr.plan;

import com.hlcspnr.exception.HLCMissingPrimaryKeyException;
import com.hlcspnr.util.DBHelper;
import com.hlcspnr.util.Debug;
import com.hlcspnr.util.HLCEJBAllJNDIs;
import javax.ejb.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;


/**
 * This is the bean class for the SponsorPlanBean enterprise bean.
 * Created Aug 23, 2006 3:15:52 PM
 * @author suresh
 */
public class HLCSponsorPlanBean implements EntityBean, HLCSponsorPlanLocalBusiness {
    private EntityContext context;
    private String planId;
    private String planName;
    private String planDescription;
    private String planAmount;
    private Collection collPlan;
    private Connection con;
    
   
    
    public void setPlanId(String planId){
        this.planId = planId;
    }
    public void setPlanName(String planName){
        this.planName = planName;
    }
    
    public void setPlanDescription(String planDescription){
        this.planDescription = planDescription;
    }
    public void setPlanAmount(String planAmount){
        this.planAmount = planAmount;
    }
    
    public String getPlanId(){
        return planId;
    }
    public String getPlanName(){
        return planName;
    }
    
    public String getPlanDescription(){
        return planDescription;
    }
    public String getPlanAmount(){
        return planAmount;
    }
    
     public String ejbCreate(String planName , String planDescription , String planAmount) throws CreateException{
            this.planName =planName;
            this.planDescription = planDescription;
            this.planAmount = planAmount;
            try {
                insertRowPlan();
            } catch (Exception ex) {
                throw new EJBException("ejbCreate: " + ex.getMessage());
            }
            Debug.print("Primary Key: After Insertion" + planId);
            return  planId;
        }

    public void ejbPostCreate(String planName , String planDescription , String planAmount) throws CreateException{
        Debug.print("SponsorPlanBean ejbPostCreate");
    }
        
          
    public void setEntityContext(EntityContext aContext) {
        context = aContext;
    }
    
     public void ejbActivate() {
        Debug.print("SponsorPlanBean ejbActivate");
        planId = (String)context.getPrimaryKey();
    }
    
     public void ejbPassivate() {
        Debug.print("SponsorPlanBean ejbPassivate");
        planId = "";   
   }
     
        public void ejbRemove() {
        Debug.print("SponsorPlanBean ejbRemove");

        try {
            deleteRow(planId);
        } catch (Exception ex) {
            throw new EJBException("ejbRemove: " + ex.getMessage());
        }
    }
    
   
    public void unsetEntityContext() {
        context = null;
    }
    
  
    public void ejbLoad() { 
        Debug.print("SponsorPlanBean ejbLoad");
        try {
            loadPlanDetails();
        } catch (Exception ex) {
            throw new EJBException("ejbLoad: " + ex.getMessage());
        }
    }
    
    public void ejbStore() {
        Debug.print("SponsorPlanBean ejbStore");

        try {
            storePlanDetails();
        } catch (Exception ex) {
            throw new EJBException("ejbStore: " + ex.getMessage());
        }
    }
    
    public String ejbFindByPrimaryKey(String planId) throws FinderException {
        Debug.print("SponsorPlanBean ejbFindByPrimaryKey");

        boolean result;

        try {
            result = selectByPrimaryKey(planId);
        } catch (Exception ex) {
            throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
        }

        if (result) {
            return planId;
        } else {
            throw new ObjectNotFoundException("Row for id " + planId + " not found.");
        }
    }
    
     
    /*********************** Database Routines *************************/
/**
  * @Method Name    :selectByPrimaryKey.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String planId.
  * @return         :boolean value.
  * @throws         :SQLException.
  */
  private boolean selectByPrimaryKey(String planId) throws SQLException {
        Debug.print("SponsorPlanBean selectByPrimaryKey" + planId);

        makeConnection();

        String selectStatement = "SELECT plan_id from " + DBHelper.USEA_SPNR_SPONSORPLAN  + " WHERE plan_id = ?  order by add_date desc ";
        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1, planId);

        ResultSet rs = prepStmt.executeQuery();
        boolean result = rs.next();
        prepStmt.close();
        releaseConnection();
        Debug.print("SponsorPlanBean selectByPrimaryKey" + result);
        return result;
    }
  
/**
  * @Method Name    :getPlan.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Collection value.
  * @throws         :Null.
  */  
   public Collection getPlan(){
        Debug.print("SponsorPlanBean ejbFindAll");
   	try {
            makeConnection();
            String selectStatement = "select plan_id, plan_name, plan_description, plan_amount from " + DBHelper.USEA_SPNR_SPONSORPLAN +
                    " where plan_id = ? order by add_date";
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,planId);
            ResultSet rs = prepStmt.executeQuery();

            Vector planList = new Vector();
            while (rs.next()){
                planList.addElement(rs.getString(1));
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            return planList;
        } 
        catch (SQLException e) {
            releaseConnection();
            throw new EJBException("Could not find any from sponsor plan");
        }
}
  
/**
  * @Method Name    :ejbFindByAll.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :Collection value.
  * @throws         :FinderException.
  */    
   public Collection ejbFindByAll() throws FinderException {
        Debug.print("SponsorPlanBean ejbFindAll");
        makeConnection();
   	try {
            String selectStatement = "select plan_id from " + DBHelper.USEA_SPNR_SPONSORPLAN + " order by add_date desc";
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            ResultSet rs = prepStmt.executeQuery();

            Vector planList = new Vector();
            while (rs.next()){
                planList.addElement(rs.getString(1));
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            return planList;
        } 
        catch (SQLException e) {
            releaseConnection();
            throw new EJBException("Could not find any from sponsor plan");
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
        }        
}

/**
  * @Method Name    :ejbFindByPlanId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String planId.
  * @return         :Collection value.
  * @throws         :FinderException.
  */     
     public Collection ejbFindByPlanId(String planId) throws FinderException {
        Debug.print("SponsorPlanBean ejbFindByPlanId");
        makeConnection();
   	try {
            String selectStatement = "select plan_id from " + DBHelper.USEA_SPNR_SPONSORPLAN + " where plan_id = ? order by add_date desc" ;
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,planId);
            ResultSet rs = prepStmt.executeQuery();

            Vector planList = new Vector();
            while (rs.next()){
                planList.addElement(rs.getString(1));
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            return planList;
        } 
        catch (SQLException e) {
            releaseConnection();
            throw new EJBException("Could not find any from sponsor plan");
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in ejbFindByPlanId:" + e.getMessage());
        }       
        
}
     
/**
  * @Method Name    :ejbFindByPlanName.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String planName.
  * @return         :Collection value.
  * @throws         :FinderException.
  */      
public Collection ejbFindByPlanName(String planName) throws FinderException{
        Debug.print("SponsorPlanBean findByPlanName:" + planName);
        makeConnection();
        //Vector planList = null;
   	try {
            String selectStatement = "select plan_id from " + DBHelper.USEA_SPNR_SPONSORPLAN + " where plan_name = ? order by add_date desc" ;
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,planName);
            ResultSet rs = prepStmt.executeQuery();
            ArrayList planList = new ArrayList();
            while (rs.next()){
                planList.add(rs.getString(1));
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            return planList;
        } 
        catch (SQLException e) {
            releaseConnection();
            throw new EJBException("Could not find any from sponsor  planName");
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in ejbFindByPlanName:" + e.getMessage());
        }               
}
    
/**
  * @Method Name    :ejbFindByEditPlanName.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String planId, String planName.
  * @return         :Collection value.
  * @throws         :FinderException.
  */ 
      public Collection ejbFindByEditPlanName(String planId, String planName) throws FinderException{
        Debug.print("SponsorPlanBean ejbFindByEditPlanName:" + planName);
        makeConnection();
        //Vector planList = null;
   	try {
            String selectStatement = "select plan_id from " + DBHelper.USEA_SPNR_SPONSORPLAN + " where plan_name = ? and plan_id != ? order by add_date desc" ;
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,planName);
            prepStmt.setString(2,planId);
            ResultSet rs = prepStmt.executeQuery();
            ArrayList planList = new ArrayList();
            while (rs.next()){
                planList.add(rs.getString(1));
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            return planList;
        } 
        catch (SQLException e) {
            releaseConnection();
            throw new EJBException("Could not find any from sponsor  planName");
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in ejbFindByPlanName:" + e.getMessage());
        }               
    }
     
     
     
/**
  * @Method Name    :getNextId.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :String value.
  * @throws         :SQLException ,MissingPrimaryKeyException.
  */   
    private String getNextId() throws SQLException ,HLCMissingPrimaryKeyException {
        Debug.print("SponsorPlanBean getNextId");
        makeConnection();
        String selectStatement = "select newid() as planId";
        Debug.print("SponsorPlanBean getNextId:" + selectStatement);
        PreparedStatement prepSelect = con.prepareStatement(selectStatement);
        ResultSet rs = prepSelect.executeQuery();
        rs.next();
        String nextId = rs.getString(1);
        rs.close();
        prepSelect.close();
        releaseConnection();
        Debug.print("SponsorPlanBean NEWID:" + nextId);
        return nextId;
    }
  
/**
  * @Method Name    :insertRowPlan.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :SQLException ,MissingPrimaryKeyException.
  */     
    private void insertRowPlan() throws SQLException,HLCMissingPrimaryKeyException {
        Debug.print("SponsorPlanBean insertRowPlan");
        
        this.planId = getNextId();
        
        makeConnection();
        try{
            String insertStatement =
                "insert into " + DBHelper.USEA_SPNR_SPONSORPLAN  + "(plan_id, plan_name, plan_description, plan_amount) " +
                 " values ( ? , ? , ? , ?)";
            PreparedStatement prepStmt = con.prepareStatement(insertStatement);
            prepStmt.setString(1, planId);
            prepStmt.setString(2, planName);
            prepStmt.setString(3, planDescription);
            Debug.print("pAmount:" + Float.parseFloat(planAmount));
            //prepStmt.setFloat(4, Float.parseFloat(planAmount));
            prepStmt.setString(4, planAmount);
            prepStmt.executeUpdate();
            prepStmt.close();
            releaseConnection();
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in insertRowPlan:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in insertRowPlan:" + e.getMessage());
        }        
    }
    
/**
  * @Method Name    :loadPlanDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :SQLException.
  */     
    private void loadPlanDetails() throws SQLException {
        Debug.print("SponsorPlanBean loadPlanDetails");
        planId = (String)context.getPrimaryKey();
        makeConnection();
        try{
            String selectStatement =
                "select plan_name, plan_description, plan_amount from " + DBHelper.USEA_SPNR_SPONSORPLAN  + " where plan_id = ? order by add_date";
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);

            prepStmt.setString(1, planId);

            ResultSet rs = prepStmt.executeQuery();

            if (rs.next()) {
                this.planName = rs.getString(1);
                this.planDescription = rs.getString(2);
                this.planAmount = rs.getString(3);
                prepStmt.close();
                releaseConnection();
            } else {
                prepStmt.close();
                releaseConnection();
                throw new NoSuchEntityException("Row for id " + planId + " not found in database.");
            }
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in loadPlanDetails:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in loadPlanDetails:" + e.getMessage());
        }        
    }
    
/**
  * @Method Name    :storePlanDetails.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :Null.
  * @return         :void value.
  * @throws         :SQLException.
  */      
    private void storePlanDetails() throws SQLException {
        Debug.print("SponsorPlanBean storePlanDetails");
      
        makeConnection();
        try{
            String updateStatement =
                    "update " + DBHelper.USEA_SPNR_SPONSORPLAN  + " set plan_name = ? , plan_description = ? , plan_amount = ? " + 
                    " where plan_id = ? ";

            PreparedStatement prepStmt = con.prepareStatement(updateStatement);

            prepStmt.setString(1, planName);
            prepStmt.setString(2, planDescription);
            //prepStmt.setFloat(3, Float.parseFloat(planAmount));
            prepStmt.setString(3, planAmount);
            prepStmt.setString(4, planId);
            int rowCount = prepStmt.executeUpdate();
            Debug.print("Sucessfully Updated." + rowCount);
            prepStmt.close();
            releaseConnection();
        }
        catch(SQLException sql){
            releaseConnection();
            throw new EJBException("SQL Exception in storePlanDetails:" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            throw new EJBException("General Exception  in storePlanDetails:" + e.getMessage());
        }        
    }
    
/**
  * @Method Name    :deleteRow.
  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
  * @param          :String planId.
  * @return         :void value.
  * @throws         :SQLException.
  */    
    private void deleteRow(String planId) throws SQLException {
         Debug.print("SponsorPlanBean deleteRow");

        makeConnection();
        try{
            String deleteStatement = "delete from " + DBHelper.USEA_SPNR_SPONSORPLAN  + "  where plan_id = ? ";
            PreparedStatement prepStmt = con.prepareStatement(deleteStatement);

            prepStmt.setString(1, planId);
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
            Debug.print("SponsorPlanBean : makeConnection");
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
            Debug.print("SponsorPlanBean releaseConnection");
            try {
                con.close();
            } catch (SQLException ex) {
                throw new EJBException("releaseConnection: " + ex.getMessage());
            }
        }
}