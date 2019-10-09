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
package com.hlcform.user;

import javax.ejb.EJBLocalObject;
import java.util.*;


/**
 * This is the local interface for ArabianSeaEntityUser enterprise bean.
 */
public interface HLCArabianSeaEntityUserLocal extends EJBLocalObject, HLCArabianSeaEntityUserLocalBusiness {
    
     //==================User Master Setter Method====================
     public void setActiveStatus(Boolean activeStatus);
    public void setUserTypeId(String userTypeId);
    public void setContactTypeId(String contactTypeId);
    public void setUserCode(String userCode);
    public void setContactType(String contactType);
    public void setPrefix(String prefix);
    public void setFirstName(String firstName);
    public void setMiddleName(String middleName);
    public void setLastName(String lastName);
    public void setSufix(String sufix);
    public void setDob(String dob);
    public void setGender(String gender);
    public void setEmailId(String emailId);
    public void setPassword(String password);
    public void setSecretQuestion(String secretQuestion);
    public void setSecretAnswer(String secretAnswer);
    public void setPrefAddress(String CommAddr);
     
    //=======================Contact Details Setter Method==================================
   // public void setContactId(String contactId){this.contactId=contactId;}
   // public void setContactTypeId(String contactTypeId){this.contactTypeId=contactTypeId;}
    public void setUserId(String userId);
    public void setSuite(String suite);
    public void setAddress1(String address1);
    public void setAddress2(String address2);
    public void setCity(String city);
    public void setState(String state);
    public void setCountry(String country);
    public void setZip(String zip);
    public void setPhoneNo(String phoneNo);
    public void setMobileNo(String mobileNo);
    public void setFaxNo(String faxNo);
    
    //============================Member Details Setter Method==========================
    public void setMemberId(String memberId);
   // public void setUserId(String userId);
    public void setMembershipTypeId(String membershipTypeId);
    public void setNonuseaOrgId(String nonuseaOrgId);
    public void setNonUseaOrgMemberId(String nonuseaOrgMemberId);
    public void setCountryMailTypeId(String countryMailTypeId);
    public void setFamilyAddOns(String familyAddOns);
    public void setParentMemberId(String parentMemberId);
    public void setEndowmentTrustAmount(String endowmentTrustAmount);
   // public void setAddDate(Date addDate){this.addDate=addDate;}
    public void setStatusId(String statusId);
    public void setExpiryDate(Date expiryDate);
    public void setLoginName(String loginName);
    public void setUsefAmateur(String usefAmateur);
    public void setNonUseaMailingStatus(boolean nonUseaMailingStatus);
    public void setNonUseaEmailStatus(boolean nonUseaEmailStatus);
   
}
