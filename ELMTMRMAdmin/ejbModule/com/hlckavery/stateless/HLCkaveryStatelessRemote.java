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
package com.hlckavery.stateless;

import com.hlcmrm.util.HLCBreedVO;
import com.hlcmrm.util.HLCContactTypeMaster;
import com.hlcmrm.util.HLCDonationVO;
import com.hlcmrm.util.HLCHorseColorVO;
import com.hlcmrm.util.HLCPublicationVO;
import javax.ejb.EJBObject;
import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;

/**
 * This is the remote interface for kaveryStateless enterprise bean.
 */
public interface HLCkaveryStatelessRemote extends EJBObject, HLCkaveryStatelessRemoteBusiness {
    public boolean addContactTypeMaster(HLCContactTypeMaster objContact) throws RemoteException;
    public boolean editContactTypeMaster(HLCContactTypeMaster objContact) throws RemoteException, FinderException;
    //Start:[ContactMgt] For Contact Type Addition, Editing and Deletion changes dated 30-Mar-2011
    public ArrayList getAllContactType() throws RemoteException;
     public ArrayList getAllDemographicType() throws RemoteException;
    //public boolean deleteContactTypeMaster(String contactTypeId) throws RemoteException,FinderException;
    public boolean deleteContactTypeMaster(String chkConIdArr[]) throws RemoteException,FinderException;
    //End:[ContactMgt] For Contact Type Addition, Editing and Deletion changes dated 30-Mar-2011
    public Collection getContactTypeDetails() throws RemoteException, FinderException;
    public Vector displayContactTypedetails() throws RemoteException, FinderException;
    public String [] getContactTypedetailsById(String contactTypeId) throws RemoteException, FinderException;
    public boolean activateDonation(String donationId) throws RemoteException;
    public boolean deactivateDonation(String donationId) throws RemoteException;
    
    //suresh Here
    public boolean createDonation(String donationName, String donationPrice, String transaction_type_id, boolean precheckStatus, int priority) throws RemoteException;
    public boolean editDonation(String donationId, String donationName, String donationPrice, String transaction_type_id, boolean precheckStatus,int priority) throws RemoteException;
    public ArrayList getAllDonationDetails() throws RemoteException;
    public ArrayList getAllDonationDetailsBasedOnStatus(boolean status) throws RemoteException;
    public HLCDonationVO getDonationDetailsById(String donationId) throws RemoteException;
    
    public boolean createHorseColor(String colorDesc) throws RemoteException;
  /* <!--Start:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011 by Deepa-->*/
     public boolean createDemographic(String Demo,String DemoDesc,String Type,boolean status) throws RemoteException;
	 public boolean editDemo(String demoId, String Demographic,String desc,String demoType,boolean status) throws RemoteException;
	  public ArrayList getAllDemoDetails() throws RemoteException;
	  public HLCHorseColorVO getDemoById(String demoId) throws RemoteException;
        public boolean deletedemo(String chkdemoIdArr[]) throws RemoteException;
 /* <!--End:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011 by Deepa-->*/
    public boolean editHorseColor(String colorId, String colorDesc) throws RemoteException;
      /* <!--Start:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011-->*/
   // public boolean editDemo(String demoId, String Demographic,String desc,String demoType,boolean status) throws RemoteException;
      /* <!--End:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011-->*/
    public ArrayList getAllHorseColorDetails() throws RemoteException;
      /* <!--Start:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011-->*/
  // public ArrayList getAllDemoDetails() throws RemoteException;
     /* <!--End:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011-->*/
    public HLCHorseColorVO getHorseColorDetailsById(String colorId) throws RemoteException;
      /* <!--Start:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011-->*/
   // public HLCHorseColorVO getDemoById(String demoId) throws RemoteException;
      //  public boolean deletedemo(String chkdemoIdArr[]) throws RemoteException;
          /* <!--End:[DemographicDetails] For Demographic Type Addition, Editing and Deletion changes dated 11-Apr-2011-->*/
    
    //Start:[BreedMgt] For breed Addition, Editing and Deletion changes dated 10-Mar-2011 by Satheesh
  
    public boolean createHorseBreed(String breedDesc,String breedStatus,String breedSpecieId) throws RemoteException;
    
    public boolean editHorseBreed(String breedDesc,String breedStatus,String breedId) throws RemoteException;
    public ArrayList getAllHorseBreedDetails() throws RemoteException;
    public HLCBreedVO getHorseBreedDetailsById(String breedId) throws RemoteException;
    
    public Vector displayUserTypeDetails() throws RemoteException , FinderException;
    
    public ArrayList getAllHorseBreedDetailsByspecieId(String uTypeId) throws RemoteException;
   
     public boolean deleteBreed(String chkRoleIdArr[])throws RemoteException;
     //End:[BreedMgt] For breed Addition, Editing and Deletion changes dated 10-Mar-2011 by Satheesh
    
    public boolean createPublication(String publicationName) throws RemoteException;
    public boolean editPublication(String publicationId, String publicationName) throws RemoteException;
    public ArrayList getAllPublicationDetails() throws RemoteException;
    public HLCPublicationVO getPublicationDetailsById(String publicationId) throws RemoteException;
    public ArrayList getAllHorseSpeciesDetails(String uTypeId) throws RemoteException;




   //=============Dhivya Here: Demographic Category{Non Human}============================

    public ArrayList getAllTypeDetails() throws RemoteException;
    public ArrayList getAllSpeciesDetails() throws RemoteException;
    public ArrayList getDemographicListForNonHuman(String speciesId) throws RemoteException;
    public boolean createDemographicCategoryForNonHuman(String speciesId, String demo, String demoDesc, String TypId, String demoStatus) throws RemoteException;
    public ArrayList getDemographicDetailsForNonHuman(String nonHumanDemoId) throws RemoteException;
    public boolean updateDemographicCategoryForNonHuman(String speciesId, String nonHumanDemoId, String demo,String demoDesc, String TypId, String demoStatus) throws RemoteException;
    public boolean deleteDemographicCategoryForNonHuman(String chkNonHumanDemoIdArr[])throws RemoteException;
  /*  public int demographicCategoryRowCount(String speciesId) throws RemoteException;
    public ArrayList getDemographicCategoryForPagination(String speciesId, int pNo) throws RemoteException;*/

//==============================Ends here==========================================================

   //==========Dhivya Here: Species Breed Management===================================

 public String getSpeciesName(String speciesId) throws RemoteException;

  //====================End Here===========================================================

  //Starts:[SpeciesMgt] For Species Addition, Editing and Deletion changes dated 10-Mar-2011
    public boolean createHorseSpecies(String speciesname,String speciesStatus) throws RemoteException;
    public boolean deleteSpecies(String chkRoleIdArr[])throws RemoteException;
     public boolean editHorseSpecies(String SpeciesName,String speciesStatus,String speciesId) throws RemoteException;
public ArrayList getAllHorseSpeciesDetails() throws RemoteException;
public HLCBreedVO getHorseSpeciesDetailsById(String speciesId) throws RemoteException;

        public ArrayList getAllHorseSpeciesDetailsByspecieId(String speciesId) throws RemoteException;
   //Ends:[SpeciesMgt] For Species Addition, Editing and Deletion changes dated 10-Mar-2011

    // Starts:[MemMgnt] For Breed Characteristic Detail Management Dated:21-4-2011
    public Vector getBreedCharacterCategory(String uTypeId) throws RemoteException, FinderException;
    public Vector getAllBreedCharacterDetails(String  uTypeId, String charId)  throws RemoteException;
    public boolean createBreedCharDetails(String charDet,String charId, String status) throws RemoteException;
    public Vector getBreedCharacterEditDetails(String characterdetId)  throws RemoteException;
    public boolean updateBreedCharDetail(String characterdetid,String charDet,String status,String charId) throws RemoteException;
     public boolean deleteBrdCharDet(String[] chkCharIdArr)throws RemoteException;
 // Ends:[MemMgnt] For Breed Characteristic Detail Management Dated:21-4-2011
//Satheesh-Start- MMMA_0008:For each species, allow for customer definition of breed characteristic categories
   
 public Vector displayUserTypeDetail() throws RemoteException , FinderException;
 public ArrayList getAllSpeciesCharDetailsByspecieId(String uTypeId) throws RemoteException;
 public boolean createSpeciesChar(String charDesc,String charStatus,String charSpecieId) throws RemoteException;
 public HLCBreedVO getSpeciesCharDetailsById(String charId) throws RemoteException;
 public boolean editSpeciesChar(String charDesc,String charStatus,String charId,String uTypeId) throws RemoteException;
 public boolean deleteChar(String chkRoleIdArr[])throws RemoteException;
//Satheesh-End- MMMA_0008:For each species, allow for customer definition of breed characteristic categories

  //==========Dhivya Here: Breed Characteristics [Category and Details Management])===============

 public String getCharacteristicName(String charId) throws RemoteException;

  //====================End Here===========================================================


}
