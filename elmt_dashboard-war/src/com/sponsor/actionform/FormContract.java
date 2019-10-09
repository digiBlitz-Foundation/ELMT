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
/*  Program Name    : FormContract.java
 *  Created Date    : October 5, 2006, 5:47 PM
 *  Author          : Punitha.R
 *  Version         : 1.1
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */


package com.sponsor.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;
/**
 *
 * @author punitha
 * @version
 */

public class FormContract extends org.apache.struts.action.ActionForm implements Serializable{
   
        private String  salesPersonId;
        private String  finalCost;
        private String  contractStartDate;
        private String  contractEndDate;
        private String  imagePath;
        private FormFile fileUpload;
    
     public FormContract(){}

    public void reset(ActionMapping mapping, HttpServletRequest request) {
        super.reset(mapping,request);
        this.salesPersonId=null;
        this.finalCost=null;
        this.contractStartDate=null;
        this.contractEndDate=null;
        this.imagePath=null;
        this.fileUpload=null;
    }
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        return null;
    }

    public FormFile getFileUpload() {
        return fileUpload;
    }
    public String getSalesPersonId() {
        return salesPersonId;
    }
    public String getImagePath() {
        return imagePath;
    }
    public String getFinalCost() {
        return finalCost;
    }
    public String getContractStartDate() {
        return contractStartDate;
    }
    public String getContractEndDate() {
        return contractEndDate;
    }
    
    public void setFileUpload(FormFile fileUpload) {
        this.fileUpload = fileUpload;
    }
    public void setContractStartDate(String contractStartDate) {
        this.contractStartDate = contractStartDate;
    }
    public void setContractEndDate(String contractEndDate) {
        this.contractEndDate = contractEndDate;
    }
    public void setSalesPersonId(String salesPersonId) {
        this.salesPersonId = salesPersonId;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public void setFinalCost(String finalCost) {
        this.finalCost = finalCost;
    }

    public String toString(){
  
   StringBuffer buffer = new StringBuffer()
   .append(" finalCost= "+this.finalCost+"\n")
   .append(" salesPersonId= "+this.salesPersonId+"\n")
   .append(" contractStartDate= " +this.contractStartDate+"\n")
   .append(" contractEndDate= " +this.contractEndDate+"\n")
   .append(" fileUpload= " +this.fileUpload);
  
  return buffer.toString();
  }
}