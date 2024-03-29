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
/*
 * PaymentDetails.java
 *
 * Created on August 24, 2006, 1:00 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.hlcmeeting.util;
import java.util.*;
import java.io.*;
/**
 *
 * @author harmohan
 */
public class HLCPaymentDetails implements Serializable{
    private String paymentId;
    private String userId;
    private String userTypeId;
    private String ccName;
    private String ccType;
    private String ccNumber;
    private int ccExpMonth;
    private int ccExpYear;
    private int ccCvvid;
    private String bankName;
    private Date checkDate;
    private String checkNumber;
    private double amount;
    private Date paymentDate;
    private String paymentStatus;
    private String checkName;
    private float checkAmount;
    
    private String sslResult;
    private String sslResultMessage;
    private String sslTxnId;
    private String sslApprovalCode;
    private String sslCvv2Response;
    private String sslAvsResponse;
    private String sslTransactionType;
    private String sslInvoiceNo;
    private String sslEmail;
    
    //========//
    
    private long pendPayccNumber;
    private long pendPayCheckNumber;
        
    /** Creates a new instance of PaymentDetails */
    public HLCPaymentDetails() {  }
    
    public HLCPaymentDetails(String paymentId, String userId,String userTypeId,String ccName,
             String ccType, String ccNumber, int ccExpMonth,int ccExpYear,
            int ccCvvid, String bankName, Date checkDate, String checkNumber,double amount,float checkAmount,
            Date paymentDate,String paymentStatus){

            this.paymentId = paymentId;
            this.userId = userId;
            this.userTypeId = userTypeId;
            this.ccName = ccName;
            this.ccType = ccType;
            this.ccNumber = ccNumber;
            this.ccExpMonth = ccExpMonth;
            this.ccExpYear = ccExpYear;
            this.ccCvvid = ccCvvid;
            this.bankName = bankName;
            this.checkDate = checkDate;
            this.checkNumber = checkNumber;
            this.amount = amount;
            this.checkAmount = checkAmount;
            this.paymentDate = paymentDate;
            this.paymentStatus = paymentStatus;
        }

        // getters
        public String getPaymentId() {
            return paymentId;
        }
        public String getUserId() {
            return userId;
        }
        public String getUserTypeId() {
            return userId;
        }
        public String getCcName() {
            return ccName;
        }
        public String getCcType() {
            return ccType;
        }
        public String getCcNumber() {
            return ccNumber;
        }
        public int getCcExpMonth() {
            return ccExpMonth;
        }
        public int getCcExpYear() {
        return ccExpYear;
        }
        public int getCcCvvid() {
            return ccCvvid;
        }
        public String getBankName() {
            return bankName;
        }
        public Date getCheckDate() {
            return checkDate;
        }
        public String getCheckNumber() {
            return checkNumber;
        }
        public double getAmount() {
            return amount;
        }
        public Date getPaymentDate() {
            return paymentDate;
        }
        public String getPaymentStatus() {
            return paymentStatus;
        }

    //Setters methods
        public void setPaymentId(String paymentId) {
            this.paymentId = paymentId;
        }
        public void setUserId(String userId) {
            this.userId = userId;
        }
        public void setUserTypeId(String userTypeId) {
            this.userTypeId = userTypeId;
        }
        public void setCcName(String ccName) {
            this.ccName = ccName;
        }
        public void setCcType(String ccType) {
            this.ccType = ccType;
        }
        public void setCcNumber(String ccNumber) {
            this.ccNumber = ccNumber;
        }
        public void setCcExpMonth(int ccExpMonth) {
            this.ccExpMonth = ccExpMonth;
        }
        public void setCcExpYear(int ccExpYear) {
            this.ccExpYear = ccExpYear;
        }
        public void setCcCvvid(int ccCvvid) {
            this.ccCvvid = ccCvvid;
        }
        public void setBankName(String bankName) {
            this.bankName = bankName;
        }
        public void setCheckDate(Date checkDate) {
            this.checkDate = checkDate;
        }
        public void setCheckNumber(String checkNumber) {
            this.checkNumber = checkNumber;
        }
        public void setAmount(double amount) {
            this.amount = amount;
        }
        public void setPaymentDate(Date paymentDate) {
            this.paymentDate = paymentDate;
        }
        public void setPaymentStatus(String paymentStatus) {
            this.paymentStatus = paymentStatus;
        }
        
        

        public String getSslResult() {
            return sslResult;
        }

        public String getSslResultMessage() {
            return sslResultMessage;
        }

        public String getSslTxnId() {
            return sslTxnId;
        }

        public String getSslApprovalCode() {
            return sslApprovalCode;
        }

        public String getSslCvv2Response() {
            return sslCvv2Response;
        }

        public String getSslAvsResponse() {
            return sslAvsResponse;
        }

        public String getSslTransactionType() {
            return sslTransactionType;
        }

        public String getSslInvoiceNo() {
            return sslInvoiceNo;
        }

        public String getSslEmail() {
            return sslEmail;
        }
        
          public void setSslResult(String sslResult) {
            this.sslResult  = sslResult;
        }

        public void setSslResultMessage(String sslResultMessage) {
            this.sslResultMessage = sslResultMessage;
        }

        public void setSslTxnId(String sslTxnId) {
            this.sslTxnId = sslTxnId;
        }

        public void setSslApprovalCode(String sslApprovalCode) {
            this.sslApprovalCode = sslApprovalCode;
        }

        public void setSslCvv2Response(String sslCvv2Response) {
            this.sslCvv2Response = sslCvv2Response;
        }

        public void setSslAvsResponse(String sslAvsResponse) {
            this.sslAvsResponse = sslAvsResponse;
        }

        public void setSslTransactionType(String sslTransactionType) {
            this.sslTransactionType = sslTransactionType;
        }

        public void setSslInvoiceNo(String sslInvoiceNo) {
            this.sslInvoiceNo = sslInvoiceNo;
        }

        public void setSslEmail(String sslEmail) {
            this.sslEmail = sslEmail;
        }

    public void setCheckName(String checkName) {
        this.checkName = checkName;
    }

    public String getCheckName() {
        return checkName;
    }
     public void setCheckAmount(float checkAmount) {
        this.checkAmount = checkAmount;
    }

    public float getCheckAmount() {
        return checkAmount;
    }
    
    public void setPendPayCheckNumber(long pendPayCheckNumber) {
        this.pendPayCheckNumber = pendPayCheckNumber;
    }
    public void setPendPayccNumber(long pendPayccNumber) {
        this.pendPayccNumber = pendPayccNumber;
    }
    public long getPendPayCheckNumber() {
        return pendPayCheckNumber;
    }
    public long getPendPayccNumber() {
        return pendPayccNumber;
    }
}
