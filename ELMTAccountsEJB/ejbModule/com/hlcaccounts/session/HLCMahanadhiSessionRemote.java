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
/*  Program Name    : MahanadhiSessionLocal.java
 *  Created         : May 13, 2007 12:36:35 PM
 *  Author          : Karthieyan.M
 *  Version         : 1.00
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
 
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.hlcaccounts.session;

import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;
import com.hlcaccounts.util.HLCAccountsMasterVO;
import com.hlcaccounts.util.HLCItemMaster;

import java.rmi.RemoteException;
import java.util.ArrayList;
import javax.ejb.EJBObject;
import java.util.Date;
import java.util.HashMap;


/**
 * This is the local interface for MahanadhiSession enterprise bean.
 */
public interface HLCMahanadhiSessionRemote extends EJBObject, HLCMahanadhiSessionRemoteBusiness {
    public ArrayList listAccTxnDetails(java.util.Date transaction_date, boolean sync_status) throws RemoteException;
    public boolean insertAccountTxnDetails(HLCAccTransactionVO accTxnVO) throws RemoteException;
    public ArrayList selectClassMaster() throws RemoteException;
    public ArrayList selectAccountMaster() throws RemoteException;
    public boolean insertAccTxnTypeDetails(HLCAccTxnTypeDetailVO accTxnTypVO) throws RemoteException;
    public HLCAccTxnTypeDetailVO getMemberAccTxnTypeDetails(String membershipTypeId) throws RemoteException;
    public HLCAccTxnTypeDetailVO getDonationAccTxnTypeDetails(String donationTypeId) throws RemoteException;
    public HLCAccTxnTypeDetailVO getArmBandAccTxnTypeDetails() throws RemoteException;
    public HLCAccTxnTypeDetailVO getPhoneServChgAccTxnTypeDetails(String servTypId) throws RemoteException;
    public boolean updatePaymentStatusAccTxnDetails(String paymentId) throws RemoteException;
    public ArrayList getAccTxnDetailsOnPaymentId(String paymentId) throws RemoteException;
    public boolean updateRecouncilAccTxnDetails(HLCAccTransactionVO accTxnVO) throws RemoteException;
    public boolean updateRecouncilActiveStatusAccTxnDetails(String paymentId) throws RemoteException;
    
    //Suresh Here
    public ArrayList getMembershipTranctionDetails(Date transDate, String paymentMode, String userId) throws RemoteException;
    public boolean updateQBStatus(Date transDate,  String paymentMode, boolean qbStatus, boolean contQBStatus, String userId, String ipAddress) throws RemoteException;
    public boolean updateQBSynStatus(Date transDate,  String paymentMode, String userId, String ipAddress) throws RemoteException;
    public HLCAccTransactionVO getAccTransctionDetails(String transactionId) throws RemoteException;
    public ArrayList getParentTranactionIds(String paymentId) throws RemoteException;
    public double getReconcileAmount(String paymentId) throws RemoteException;
    
    public ArrayList getServiceTypeMaster() throws RemoteException;
    public ArrayList getItemMaster() throws RemoteException;
    public ArrayList getSubItemName(String serviceTypeName) throws RemoteException;
    public boolean createAccItemDetails(HLCItemMaster itemVO) throws RemoteException;
    public HLCItemMaster getItemDetails(String itemId) throws RemoteException;
    public boolean updateAccItemDetails(String itemId, String serviceTypeName, String itemNo,
            String parentItemNo, String itemDesc, float rate, String accountNo) throws RemoteException;
    
    public String createAccountDetails(HLCAccountsMasterVO accMasterVO) throws RemoteException;
    public HLCAccountsMasterVO getAccountsDetails(String accountId) throws RemoteException;
    public String updateAccountsDetails(HLCAccountsMasterVO accMasterVO) throws RemoteException;
    public ArrayList getAllAccountTypeMaster() throws RemoteException;
    public ArrayList getSubAccountList(String accountType) throws RemoteException;
    
    public String createItemNoFromAccMaster(String itemNo) throws RemoteException;
    public boolean isTransactionExists(String transaction_name,String item_no,String class_name) throws RemoteException;
    public ArrayList listAccTxnTypeDetailsOnClass(String class_name) throws RemoteException;
    public boolean updateAccTxnTypeDetails(HLCAccTxnTypeDetailVO accTxnTypVO) throws RemoteException;
    public HLCAccTxnTypeDetailVO selectAccTransactionTypeDetail(String transaction_type_id) throws RemoteException;    
    public HLCAccTxnTypeDetailVO getOverPayAccTransactionTypeDetail() throws RemoteException;
    public HLCAccTxnTypeDetailVO getAccTransactionTypeDetailBasedOnTran_Name(String transaction_name) throws RemoteException;
    public ArrayList selectSyncronizedQBTransctionDetails(Date transDate, String paymentMode) throws RemoteException;
    public ArrayList searchQBTransctionDetails(Date transDate, String checkNo) throws RemoteException;
    public boolean updateAccTxnDetailsMissingCheck(String paymentId,boolean active_status) throws RemoteException;
    public boolean updateRecouncilTxnDateOnTxnId(String txnId) throws RemoteException;
    public boolean insertMembershipRefundDetails(String userId, String comments, float balanceAmount) throws RemoteException;
      
    public boolean createClass(String classname) throws RemoteException;
    public ArrayList getClassDetails() throws RemoteException;
    public ArrayList getClassNameDetailsById(String classId) throws RemoteException;
    public boolean editClassName(String classId,String className) throws RemoteException;
    
    //=======================Area Rider Program====================================================
    public HLCAccTxnTypeDetailVO getAccTransacTypDetsForAreaRiderProg(String transacTypId) throws RemoteException;
    
    //=======================Event Org Endorsed Form====================================================
    public HLCAccTxnTypeDetailVO getAccTransacTypDetsForEveOrgEndorsed(String transacTypId) throws RemoteException;
    public ArrayList getDailyPaymentDetails(int year, int month, String paymentMode) throws RemoteException;
    public ArrayList getMonthlyPaymentDetails(int year, String paymentMode) throws RemoteException;
    public ArrayList getAreaPaymentDetails(int year) throws RemoteException;
    public ArrayList getMemberRegistrationDetails(String year) throws RemoteException;
    public HashMap getYearBasedSalesAmount() throws RemoteException;
    public double getTotalDonationAmount(Date startDate,Date endDate) throws RemoteException;
    public ArrayList getTotalDonationAmountForAllDonationItems(Date startDate,Date endDate) throws RemoteException;   
    public double getDonationAmountSpecificDonationItem(Date startDate,Date endDate,String donation_id) throws RemoteException;
}