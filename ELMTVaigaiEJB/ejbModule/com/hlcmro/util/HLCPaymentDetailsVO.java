/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hlcmro.util;
import java.util.*;
import java.io.*;
/**
 *
 * @author admin
 */
public class HLCPaymentDetailsVO implements Serializable{
    private String paymentId;
        private String userId;
        private String ccName;
        private String ccType;
        private long ccNumber;
        private int ccExpMonth;
        private int ccExpYear;
        private int ccCvvid;
        private String bankName;
        private Date checkDate;
        private long checkNumber;
        private double amount;
        private Date paymentDate;
        private String paymentStatus;
        private String sslResult;
        private String sslResultMessage;
        private String sslTxnId;
        private String sslApprovalCode;
        private String sslCvv2Response;
        private String sslAvsResponse;
        private String sslTransactionType;
        private String sslInvoiceNo;
        private String sslEmail;
        private String checkName;
        private String chkNumber;
        private String ipAddrss;
        
        public HLCPaymentDetailsVO(){}
   
        public HLCPaymentDetailsVO(String paymentId, String userId,String ccName,
             String ccType, long ccNumber, int ccExpMonth,int ccExpYear,
            int ccCvvid, String bankName, Date checkDate, long checkNumber,double amount,
            Date paymentDate,String paymentStatus, String sslResult, 
                String sslResultMessage,  String sslTxnId, String sslApprovalCode,
                String sslCvv2Response, String sslAvsResponse, String sslTransactionType, 
                String sslInvoiceNo, String sslEmail, String ipAddrss){

            this.paymentId = paymentId;
            this.userId = userId;
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
            this.paymentDate = paymentDate;
            this.paymentStatus = paymentStatus;
            
            this.sslResult = sslResult;
            this.sslResultMessage = sslResultMessage;
            this.sslTxnId = sslTxnId;
            this.sslApprovalCode = sslApprovalCode;
            this.sslCvv2Response = sslCvv2Response;
            this.sslAvsResponse = sslAvsResponse;
            this.sslTransactionType = sslTransactionType;
            this.sslInvoiceNo =  sslInvoiceNo;
            this.sslEmail = sslEmail;
            this.ipAddrss=ipAddrss;
        }

        // getters
        public String getPaymentId() {
            return paymentId;
        }
        public String getUserId() {
            return userId;
        }
 
        public String getCcName() {
            return ccName;
        }
        public String getCcType() {
            return ccType;
        }
        public long getCcNumber() {
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
        public long getCheckNumber() {
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
    
        public void setCcName(String ccName) {
            this.ccName = ccName;
        }
        public void setCcType(String ccType) {
            this.ccType = ccType;
        }
        public void setCcNumber(long ccNumber) {
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
        public void setCheckNumber(long checkNumber) {
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
        

    public String getCheckName() {
        return checkName;
    }

    public void setCheckName(String checkName) {
        this.checkName = checkName;
    }

    public void setChkNumber(String chkNumber) {
        this.chkNumber = chkNumber;
    }

    public String getChkNumber() {
        return chkNumber;
    }

    public void setIpAddrss(String ipAddrss) {
        this.ipAddrss = ipAddrss;
    }

    public String getIpAddrss() {
        return ipAddrss;
    }
    

}