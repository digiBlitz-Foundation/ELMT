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
package com.hlcspnr.sponsor;

import com.hlcspnr.util.HLCSponsorDetails;
import javax.ejb.EJBObject;
import java.rmi.*;
import javax.ejb.*;
import java.util.*;
import java.sql.SQLException;


/**
 * This is the remote interface for SponsorSession enterprise bean.
 */

public interface HLCSponsorSessionRemote extends EJBObject, HLCSponsorSessionRemoteBusiness {
    public boolean createSponsorRequest(HLCSponsorDetails objSponsor) throws RemoteException;  
    public void editSponsorRequest(HLCSponsorDetails objSponsor) throws RemoteException, FinderException;
    public HLCSponsorDetails getSponsorDetails(String sponsorId) throws RemoteException,FinderException; 
    public boolean deleteSponsor(String sponsorId) throws RemoteException,FinderException;
    public void salesPersonUpdate(String sponsorId,Date contractDtartDate,Date contractEndDate, String negoAmount, String filePath) throws RemoteException,FinderException;
    public boolean statusUpdation(String sponsorId, String requestStatus) throws RemoteException,FinderException;
    public boolean statusUpdationForReject(String sponsorId, String requestStatus) throws RemoteException,FinderException;
    public void salesPersonAssign(String sponsorId,String salesPersonId) throws RemoteException,FinderException;
    
    public Vector getAllRequestStatusSponsors(String requestStatus) throws RemoteException,FinderException;
    //public Vector getAllRequestStatusSalesPerson(String salesPersonId,) throws RemoteException,FinderException;    
    
    public Vector getAllRequestStatusSponsorsSalesPerson(String salesPersonId, String requestStatus) throws RemoteException,FinderException;

    public Vector getAllPendingSponsorsForAdmin() throws RemoteException,FinderException;
    
    
    public boolean createPlan(String planName , String planDescription , String planAmount) throws RemoteException;  
    public Collection getAllPlanDetails( ) throws RemoteException,FinderException;
    public String[] getPlanDetails(String planId) throws RemoteException,FinderException;
    public boolean editSponsorPlan(String planId, String planName , String planDescription , String planAmount) throws RemoteException, FinderException;
    public boolean deleteSponsorPlan(String planId) throws RemoteException,FinderException;
    public String getPlanName(String planId) throws RemoteException,FinderException;
    

    public Vector getScheduleTypeMaster() throws RemoteException,FinderException,SQLException;
    public boolean createPaymentSchedule(String sponsorId,String scheduleTypeId,
            Date dueDate,float dueAmount , boolean continueStatus,
            String frequencyRate, String paymentStatus, Vector specialBill) throws RemoteException;
    
    public boolean paymentScheduleStatusChange(String scheduleId,String status) throws RemoteException;
    public Collection getPaymentSchedule(String sponsorId) throws RemoteException;    
    public Vector getPaymentScheduleDetails(String scheduleId) throws RemoteException,FinderException;
    
    //Searching Options for Sponsorship 
    
    public Vector getByPlanId(String planId) throws RemoteException;
    public Vector getByCompanyName(String companyName) throws RemoteException;
    public Vector getBySalesPersonId(String salesPersonId) throws RemoteException;
    public Vector getByDates(Date fromDate, Date toDate) throws RemoteException;
    public Vector getMySposorDetails(String userId) throws RemoteException;
}