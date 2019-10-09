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
package com.hlchorse.service;

import com.hlchorse.service.util.DBHelper;
import com.hlchorse.service.util.Debug;
import com.hlchorse.service.util.HLCHorseServiceTypeMaster;
import javax.ejb.*;
import java.util.Date;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

/**
 * This is the bean class for the ArabianSeaHorseServiceTypeBean enterprise bean.
 * Created Aug 29, 2006 4:59:18 PM
 * @author harmohan
 */
public class HLCArabianSeaHorseServiceTypeBean implements EntityBean, HLCArabianSeaHorseServiceTypeLocalBusiness {
    private EntityContext context;
    private static final String dbName = "java:/ELMTMSSQLDS";
    private Connection con = null;
    private PreparedStatement prepStmt = null;
    private ResultSet rs = null;
    
    /*==============HorseServiceTypeMaster Variable ==========================*/
    private String horseServiceTypeId;
    private String horseServiceTypeName;
    private String horseServiceTypeAmount;
    private String transaction_type_id;
    private String userTypeId;
    private int activeStatus;
    
     /**=========================Object Creation=========================*/
    HLCHorseServiceTypeMaster objHorseService = new HLCHorseServiceTypeMaster();
    
    //*==================Setter Method====================================*/
    public void setHorseServiceTypeId(String horseServiceTypeId) {
            this.horseServiceTypeId  = horseServiceTypeId ;
    }
    public void setHorseServiceTypeName(String horseServiceTypeName) {
            this.horseServiceTypeName = horseServiceTypeName;
    }
    public void setHorseServiceTypeAmount(String horseServiceTypeAmount ) {
             this.horseServiceTypeAmount = horseServiceTypeAmount;
    }
    
    
    public String getHorseServiceTypeId(){
            return horseServiceTypeId;
    }
    public String getHorseServiceTypeName(){
            return horseServiceTypeName;
    }
    public String getHorseServiceTypeAmount(){
            return horseServiceTypeAmount;
    }
    public void setUserTypeId(String user_type_id){
        this.userTypeId=user_type_id;
    }
    public String getUserTypeId(){
        return userTypeId;
    }
    public void setActiveStatus(int active_status){
        this.activeStatus=active_status;
    }
    public int getActiveStatus(){
        return activeStatus;
    }
    
    // <editor-fold defaultstate="collapsed" desc="EJB infrastructure methods. Click the + sign on the left to edit the code.">
    // TODO Add code to acquire and use other enterprise resources (DataSource, JMS, enterprise beans, Web services)
    // TODO Add business methods
    // TODO Add create methods
    /**
     * @see javax.ejb.EntityBean#setEntityContext(javax.ejb.EntityContext)
     */
    public void setEntityContext(EntityContext aContext) {
        context = aContext;
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbActivate()
     */
    public void ejbActivate() {
        
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbPassivate()
     */
    public void ejbPassivate() {
        
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbRemove()
     */
    public void ejbRemove() {
        Debug.print("ArabianSeaHorseServiceTypeBean ejbRemove");

        try {
            makeConnection();
            String deleteStatement = "delete from " + DBHelper.USEA_SERVICETYPE_MASTER   + "  where service_type_id = ? ";
            PreparedStatement prepStmt = con.prepareStatement(deleteStatement);
            prepStmt.setString(1, horseServiceTypeId);
            int cnt = prepStmt.executeUpdate();
            System.out.println("Successfully Delete the HORSE_SERVICETYPE_MASTER record : "+cnt);
            prepStmt.close();
            releaseConnection();
        } catch (Exception ex) {
            throw new EJBException("ArabianSeaHorseServiceTypeBean ejbRemove: " + ex.getMessage());
        }
    }
    
    /**
     * @see javax.ejb.EntityBean#unsetEntityContext()
     */
    public void unsetEntityContext() {
        context = null;
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbLoad()
     */
    public void ejbLoad() {
       Debug.print("ArabianSeaHorseServiceTypeBean ejbLoad");
        this.horseServiceTypeId = (String) context.getPrimaryKey();
        try {
        makeConnection();
        String selectStatement = "SELECT * FROM " +DBHelper.USEA_SERVICETYPE_MASTER+" WHERE service_type_id = ?";
        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1, horseServiceTypeId);
        ResultSet rs = prepStmt.executeQuery();
        if (rs.next()) {
                this.horseServiceTypeId = rs.getString(1);
                this.horseServiceTypeName = rs.getString(2);
                this.horseServiceTypeAmount = rs.getString(3);
        } 
        Debug.print("horseServiceTypeId : "+horseServiceTypeId);
        Debug.print("horseServiceTypeName : "+horseServiceTypeName);
        Debug.print("horseServiceTypeAmount : "+horseServiceTypeAmount);
        prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
        } finally {
            releaseConnection();
        }
       System.out.println("ejbLoad for ArabianSeaHorseServiceTypeBean");
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbStore()
     */
    public void ejbStore() {
        try {
            System.out.println("ejbStore for ArabianSeaHorseServiceTypeBean");
            makeConnection();
            String updateStatement = "update " + DBHelper.USEA_SERVICETYPE_MASTER  + 
            " set service_type_name = ?, service_type_amount = ?  where service_type_id = ?";
            PreparedStatement prepStmt = con.prepareStatement(updateStatement);
            prepStmt.setString(1, horseServiceTypeName);
            prepStmt.setDouble(2, Double.parseDouble(horseServiceTypeAmount));
            prepStmt.setString(3, horseServiceTypeId);
            int rowCount = prepStmt.executeUpdate();
            Debug.print("ejbStore Sucessfully Updated." + rowCount);
            prepStmt.close();
        } catch (Exception ex) {
           throw new EJBException("ejbStore: " + ex.getMessage());
           // ex.printStackTrace();
        }finally {
            releaseConnection();
        }
    }
    
    // </editor-fold>
    
    public String ejbCreate(HLCHorseServiceTypeMaster objHorseService) throws CreateException {
         
        Debug.print("HorseServiceTypeMaster ejbCreate"); 
        if(objHorseService==null){
                throw new EJBException("ejbCreate: objHorseService argument is null or empty");
        }
        this.userTypeId=objHorseService.getUserTypeId();//12042011
        this.horseServiceTypeId = objHorseService.getHorseServiceTypeId();
        this.horseServiceTypeName = objHorseService.getHorseServiceTypeName();
        this.horseServiceTypeAmount = objHorseService.getHorseServiceTypeAmount();
        this.transaction_type_id = objHorseService.getTransaction_type_id();
        this.activeStatus=objHorseService.getActiveStatus();//12042011
        
        Debug.print("transaction_type_id in entity bean :"+transaction_type_id);
        
        try {
             makeConnection();
             String insertStatement = "insert into " + DBHelper.USEA_SERVICETYPE_MASTER+ " ( " +
                "service_type_name, service_type_amount, transaction_type_id,user_type_id,active_status ) values ( ?, ?, ?,?,? )";//12042011
             prepStmt = con.prepareStatement(insertStatement);
             prepStmt.setString(1, horseServiceTypeName);
             prepStmt.setString(2, horseServiceTypeAmount);
             prepStmt.setString(3, transaction_type_id);
             prepStmt.setString(4, userTypeId);
             prepStmt.setInt(5, activeStatus);
             
             int cnt = prepStmt.executeUpdate();
             System.out.println("successfully inserted into HorseServiceTypeMaster  : "+cnt);
             prepStmt.close();
             
        } catch (Exception ex) {
            releaseConnection();
            throw new EJBException("ejbCreate: HorseServiceTypeMaster  --- " + ex.getMessage());
        }finally {
            releaseConnection();
        }
        return null;
    }
    
    public void ejbPostCreate(HLCHorseServiceTypeMaster objHorseService) {
        Debug.print("HorseServiceTypeMaster ejbPostCreate"); 
    }
    
    public String ejbFindByPrimaryKey(String horseServiceTypeId) throws FinderException {
         boolean result = false;
         PreparedStatement prepStmt = null;
         try {
            makeConnection();
            String selectStatement = "SELECT service_type_id FROM " + DBHelper.USEA_SERVICETYPE_MASTER + " WHERE service_type_id = ?";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, horseServiceTypeId);
            ResultSet rs = prepStmt.executeQuery();
            if( rs.next()) {
                this.horseServiceTypeId = rs.getString(1);
                //this.contactTypeName = rs.getString(2);
            }
            Debug.print("In primeryKey method horseServiceTypeId : "+horseServiceTypeId);
            prepStmt.close();
           // releaseConnection();
         }catch (Exception e){
             releaseConnection();
             e.printStackTrace();
         }finally {
             releaseConnection();
         }
            return horseServiceTypeId;
    }
    
    //Debugs Starts by Lakshmi
   //public Collection ejbFindByHorseTypeName(String horseServiceTypeName,String userTypeId) throws ObjectNotFoundException {
   public Collection ejbFindByHorseTypeName(String horseServiceTypeId,String horseServiceTypeName,String userTypeId) throws ObjectNotFoundException {
        this.horseServiceTypeId =horseServiceTypeId;
        //Debugs Ends by Lakshmi
        this.horseServiceTypeName =horseServiceTypeName;
        ArrayList array = new ArrayList();
        try {
            makeConnection();
            //Debugs Starts by Lakshmi
            if(horseServiceTypeId==null){
                Debug.print("if statement");
            String selectStatement = "SELECT service_type_id FROM  " +DBHelper.USEA_SERVICETYPE_MASTER +
                    "  WHERE service_type_name = ? and user_type_id=?";//12042011
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, horseServiceTypeName);
            prepStmt.setString(2, userTypeId);
            }
       else{
                Debug.print("else statement");
                String selectStatement = "SELECT service_type_id FROM  " +DBHelper.USEA_SERVICETYPE_MASTER +
                    " WHERE service_type_id!=? and service_type_name = ? and user_type_id=?";//12042011
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, horseServiceTypeId);
            prepStmt.setString(2, horseServiceTypeName);
            prepStmt.setString(3, userTypeId);
       }
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                array.add(rs.getString(1));
             } 
             prepStmt.close();
               return array;             
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
    }
    
    public Collection ejbFindByHorseServiceTypeDatails() throws ObjectNotFoundException {
        
        ArrayList array = new ArrayList();
        try {
            makeConnection();
            String selectStatement = "SELECT horse_service_type_id,horse_service_type_name,horse_service_type_amount FROM  " +DBHelper.USEA_HORSE_SERVICETYPE_MASTER;
            prepStmt = con.prepareStatement(selectStatement);
            
             
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                array.add(rs.getString(1));
                array.add(rs.getString(2));
                array.add(rs.getString(3));
             } 
             prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return array;
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