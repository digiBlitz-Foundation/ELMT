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
package com.hlcnonhlc.stateless;

import com.hlcnonhlc.org.master.HLCArabianSeaNonHLCOrgMasterLocal;
import com.hlcnonhlc.org.master.HLCArabianSeaNonHLCOrgMasterLocalHome;
import com.hlcnonhlc.org.util.DBHelper;
import com.hlcnonhlc.org.util.Debug;
import com.hlcnonhlc.org.util.HLCNonHLCOrgMaster;
import javax.ejb.*;
import java.rmi.RemoteException;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;
import java.util.*;

/**
 * This is the bean class for the KaveryNonUSEAOrgSessionBean enterprise bean.
 * Created Aug 30, 2006 11:09:36 AM
 * @author harmohan
 */
public class HLCKaveryNonHLCOrgSessionBean implements SessionBean, HLCKaveryNonHLCOrgSessionRemoteBusiness {
    private SessionContext context;
    private InitialContext ic = null;
    private static final String dbName = "java:/ELMTMSSQLDS";
    private Connection con;
    private ResultSet rs= null;
    private PreparedStatement prepStmt = null;
    private String name = "ejb/HLCArabianSeaNonHLCJNDI";
    
    private String  nonuseaOrgId;
    private String nonuseaOrgName;
    
    HLCArabianSeaNonHLCOrgMasterLocalHome home;
    HLCArabianSeaNonHLCOrgMasterLocal remote;
    
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
        home = (HLCArabianSeaNonHLCOrgMasterLocalHome)obj;
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
  /**
  * Name         :addContactTypeMaster
  * Description  :This method will insert record into the Membership Refund Details table
  * @ param      :passing object of type of the class MembershipRefundDetails
  * @return      :void
  * @throws      :RemoteException, EJBException
  */      
    public boolean addNonUSEAOrgMaster(HLCNonHLCOrgMaster objNonUSEA) throws RemoteException {
       boolean result = false;
       result = getNonUSEAOrgId(objNonUSEA.getNonuseaOrgName());
       if (!result){
           return false;
       } 
        try{
             remote = home.create(objNonUSEA); 
        }
        catch(Exception exp){
             throw new EJBException("createNonUSEAOrgMaster : " + exp.getMessage());
        }
       return true;
    }
/**
  * Name         :editContactTypeMaster
  * Description  :This method will retrieve the member details for refund details table
  * @ param      :None
  * @return      :member Identification number
  * @throws      :RemoteException, FinderException
  */     
     public boolean editNonUSEAOrgMaster(HLCNonHLCOrgMaster objNonUSEA) throws RemoteException, FinderException{
       System.out.print("NonUSEAOrg ID : "+objNonUSEA.getNonuseaOrgId());
       System.out.print("NonUSEAOrg ID : "+objNonUSEA.getNonuseaOrgId());
       if ((objNonUSEA.getNonuseaOrgName().length()) > 79){
           Debug.print("Character Size is more then 80");
           return false;
       }
       boolean result = false;
       result = getNonUSEAOrgId(objNonUSEA.getNonuseaOrgName());
       System.out.println(" Receiving Result : "+result);
       if (!result){
           Debug.print("Name Exist in database : No TWO Name Allowed in same database "+result);
           return false;
       } 
        if (objNonUSEA == null && (objNonUSEA.getNonuseaOrgId().equals("")) ) {
                throw new EJBException("NonUSEAOrg ID can't be empty");
            }
        if (nonUSEAOrgIdExists(objNonUSEA.getNonuseaOrgId()) == false) {
            //throw new EJBException("Contact Type ID Not Exists : " + contactTypeId);
                 Debug.print("Kavery Session Bean nonUSEAOrgIdExists inside edit "+ nonuseaOrgId);
               result = false;
        }
        else if (result == true){
            Debug.print("Kavery Session Bean nonUSEAOrgIdExists inside edit true part: "+ objNonUSEA.getNonuseaOrgId());               
            //remote.setContactTypeId(objContact.getContactTypeId());
            remote.setNonuseaOrgId(objNonUSEA.getNonuseaOrgId());
            remote.setNonuseaOrgName(objNonUSEA.getNonuseaOrgName());
            result = true;
        }
           return result;
     }    
     
     public boolean deleteNonUSEAOrgMaster(String nonuseaOrgId) throws RemoteException,FinderException{
        Debug.print("Kavery Session Bean deleteNonUSEAOrgMaster");
        Debug.print("Contact Type Id :" + nonuseaOrgId);
        boolean result = false;
        if (nonuseaOrgId == null) {
            throw new EJBException("contactTypeId can't be empty");
        }
        if (nonUSEAOrgIdExists(nonuseaOrgId) == false) {
            throw new EJBException("NonUSEAOrgId Not Exists" + nonuseaOrgId);
        }
        try {
            remote.remove();
            result = true;
        } catch (Exception ex) {
              throw new EJBException("removeNonUSEAOrgName: " + ex.getMessage());
        }
        finally{
            return result;
        }   
    }

    
/**
  * Name         :getRefundDetails
  * Description  :This method will retrieve the member details for refund details table
  * @ param      :None
  * @return      :member Identification number
  * @throws      :RemoteException, FinderException
  */     
    public boolean getNonUSEAOrgId(String nonuseaOrgName)  {
        String nonUseaId = null;
        
         try{
             Debug.print("before");
            ArrayList result =  (ArrayList)home.findByNonUSEAOrgName(nonuseaOrgName);
            Debug.print("after");
            if(result!=null){
                Debug.print("100");
                Iterator e = result.iterator();
                Debug.print("101");
                if(e.hasNext()){
                   HLCArabianSeaNonHLCOrgMasterLocal localSpRemote = (HLCArabianSeaNonHLCOrgMasterLocal)e.next();
                   Debug.print("102");
                   nonUseaId = localSpRemote.getNonuseaOrgId();
                   Debug.print("103");
                }
            } Debug.print("Inside getNonUSEAOrgId nonUseaId : "+nonUseaId);
        }
        catch(Exception e){
            Debug.print("Exception in getNonUSEAOrgId:" + e);
        }
         if (nonUseaId != null){
            return false;
         }else {
            return true;
         }
     }    

    
    
    public ArrayList getNonUSEAOrgDetails() throws RemoteException, FinderException {
        Vector V = new Vector();
        V = null;
        ArrayList A = new ArrayList();
        Collection col = home.findByNonUSEAOrgDetails();
                 ArrayList array = new ArrayList(col);
                for (Iterator it=array.iterator(); it.hasNext( ); ) { 
                   // Object anObject = it.next( ); 
                    String str = String.valueOf(it.next( )); 
                    String[] result = str.split(":");
                     for (int x=1; x<result.length; x++){
                         System.out.println(result[x]);
                         A.add(result[1]);
                     }

                   System.out.println( nonuseaOrgId); //anObject.toString() ); 
                }
       // Collection c = home.findByNonUSEAOrgDetails();
        return A;
    }  
    
    public Vector displayNonUSEAOrgDetails() throws RemoteException, FinderException {
        Vector V = new Vector();
        try {
            makeConnection();
            String selectStatement = "SELECT other_org_id, other_org_name FROM  " +DBHelper.NON_USEA_ORG_MASTER;
            prepStmt = con.prepareStatement(selectStatement);
             
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                String nonuseaId = rs.getString(1);
                String nonuseaName = rs.getString(2);
                String str[] = {nonuseaId, nonuseaName};
                V.add(str);
             } 
             prepStmt.close();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {
            releaseConnection();
        }
        return V;
    }
    
/**
  * Name         :memberExists
  * Description  :This method will check for the existing of memberId and call the findByPrimaryKey method
  * @ param      :None
  * @return      :boolean value
  * @throws      :none
  */         
   private boolean nonUSEAOrgIdExists(String nonuseaOrgId) {
        boolean result =false;
//Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
        if ( (nonuseaOrgId !=this.nonuseaOrgId) ) {
            try {
              //  Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
                remote = home.findByPrimaryKey(nonuseaOrgId);
                this.nonuseaOrgId = nonuseaOrgId;
                 Debug.print("Kavery Session Bean nonUSEAOrgIdExists in side home: "+ home);
                Debug.print("Kavery Session Bean nonUSEAOrgIdExists in side remote: "+ remote);
                 result =true;
            } catch (Exception ex) {
               result =true;
               System.out.println("Exception:" + ex);
            }
        }
        Debug.print("Kavery Session Bean nonUSEAOrgIdExists  "+ result);
        return result;
    }    
/**
  * Name         :getInitialContext
  * Description  :This method will Initialize the naming context for the container
  * @ param      :None
  * @return      :InitialContext
  * @throws      :NamingException
  */  
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