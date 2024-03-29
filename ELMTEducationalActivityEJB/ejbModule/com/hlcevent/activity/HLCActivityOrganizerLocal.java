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
package com.hlcevent.activity;

import com.hlccommon.util.HLCActivityOrganizerVO;
import javax.ejb.EJBLocalObject;
import java.util.*;

/**
 * This is the local interface for ActivityOrganizer enterprise bean.
 */
public interface HLCActivityOrganizerLocal extends EJBLocalObject, HLCActivityOrganizerLocalBusiness {
    
    public HLCActivityOrganizerVO getActivityOrganizerDetails();
    //Setters methods
    //public void setActivityMeetingId(long activityMeetingId);
    public void setActivityName(String activityName);
    public void setActivityDate(Date activityDate);
    public void setNoOfDays(String noOfDays);
    public void setUseaAreaId(String useaAreaId);
    public void setLocation(String location);
    public void setState(String state);
    
    public void setCountry(String country);
    public void setCity(String city);
    public void setZip(String zip);
    
    public void setActivityOrganizerId(String activityOrganizerId);
    public void setActivityTypeId(String activityTypeId);
    public void setOtherActivityType(String otherActivityType);
    public void setActivityFees(String activityFees);
    public void setInstructorsCoaches(String instructorsCoaches);
    public void setFacilities(String facilities);
    public void setOtherFacilities(String otherFacilities);
    public void setLandOwnerName(String landOwnerName);
    public void setLandOwnerBusinessName(String landOwnerBusinessName);
    public void setLandOwnerAddress(String landOwnerAddress);
    public void setLandOwnerCity(String landOwnerCity);
    public void setLandOwnerState(String landOwnerState);
    public void setLandOwnerCountry(String landOwnerCountry);
    public void setLandOwnerZip(String landOwnerZip);
    public void setLandOwnerPhone(String landOwnerPhone);
    public void setAdditionalSites(boolean additionalSites);
    public void setAdditionalSitesPath(String additionalSitesPath);
    public void setAddDate(Date addDate);
    public void setApprovedBy(String ApprovedBy);
    public void setApprovedDate(Date approvedDate);
    public void setPostingType(String postingType);
    public void setActiveStatus(boolean activeStatus);
    public void setRequestStatus(String requestStatus);
    public void setComments(String comments);
    public void setPaymentId(String paymentId);
         
    public Vector getPublicationDetails();
    public void setPublicationDetails(Vector vectPublication);
}
