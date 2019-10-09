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
package com.hlcpayment;

import com.hlccommon.util.HLCPaymentDetailVO;
import javax.ejb.EJBLocalObject;
import java.util.Date;


/**
 * This is the local interface for Payment enterprise bean.
 */
public interface HLCPaymentLocal extends EJBLocalObject, HLCPaymentLocalBusiness {
        public HLCPaymentDetailVO getPaymentDetailVO();
        public void setPaymentId(String paymentId);
        public void setUserId(String userId);
        public void setCcName(String ccName);
        public void setCcType(String ccType);
        public void setCcNumber(String ccNumber);
        public void setCcExpMonth(int ccExpMonth);
        public void setCcExpYear(int ccExpYear);
        public void setCcCvvid(int ccCvvid);
        public void setBankName(String bankName);
        public void setCheckDate(Date checkDate);
        public void setCheckNumber(String checkNumber);
        public void setAmount(double amount);
        public void setPaymentDate(Date paymentDate);
        public void setPaymentStatus(String paymentStatus);
        
        public void setSslResult(String sslResult);
        public void setSslResultMessage(String sslResultMessage);
        public void setSslTxnId(String sslTxnId);
        public void setSslApprovalCode(String sslApprovalCode);
        public void setSslCvv2Response(String sslCvv2Response);
        public void setSslAvsResponse(String sslAvsResponse);
        public void setSslTransactionType(String sslTransactionType);
        public void setSslInvoiceNo(String sslInvoiceNo);
        public void setSslEmail(String sslEmail);
        public void setCheckAmount(float checkAmount);
        
        public void setParentPaymentId(String parentPaymentId);
        public void setIpAddress(String ipAddress);
        public void setPendingAmount(float pendingAmount);
        
}