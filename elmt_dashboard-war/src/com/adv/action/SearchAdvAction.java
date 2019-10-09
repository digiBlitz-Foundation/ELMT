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
/*  Program Name    : ActionAdvertisement.java
 *  Created Date    : September 1, 2006, 10:25 AM
 *  Author          : Punitha.R
 *  Version         : 1.3
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */
package com.adv.action;
//import com.adv.actionform.FormAdvertisement;
import com.adv.actionform.AdvertisementFormVO;
import com.adv.actionform.SearchAdvtForm;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlccommon.util.HLCAdvertisementVO;
import com.hlccommon.util.Debug;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.util.MessageResources;

import java.io.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.util.Properties;
import java.util.*;

public class SearchAdvAction extends DispatchAction {
 
    
   public ActionForward search(ActionMapping mapping, ActionForm  form,HttpServletRequest request, HttpServletResponse response)
		throws Exception {     
		   Debug.print("ActionAdvertise.search() called ...."); 
		    HLCAdvertiseSessionRemote advRemote = initializeEJB(request);

                  SearchAdvtForm searchAdvForm = (SearchAdvtForm)form;

                  if(request.getAttribute("mediaType")!=null)
		    searchAdvForm.setSelMediaType((String)request.getAttribute("mediaType"));
		  if(request.getAttribute("displayType")!=null)
		    searchAdvForm.setSelDisplayType((String)request.getAttribute("displayType"));

		  
		   String offset =  request.getParameter("offset");
		   String rowSize =  request.getParameter("rowSize");
		   
		   Debug.print("mediaType="+searchAdvForm.getSelMediaType());
		   Debug.print("displayType="+searchAdvForm.getSelDisplayType());
		   Debug.print("offset="+offset);
		   Debug.print("rowSize="+rowSize);

		   List mediaLists = advRemote.searchDimByMediaAndSubTypeId(searchAdvForm.getSelMediaType(),
                           searchAdvForm.getSelDisplayType());			
                   
                   for (Iterator it = mediaLists.iterator(); it.hasNext();) {
                        HLCAdvertisementVO advVO = (HLCAdvertisementVO) it.next();
                        Debug.print("Advertisement Object ="+advVO);                       
                   }
                   
                   Debug.print("mediaLists :"+mediaLists); 
		   
                 searchAdvForm.setResults(mediaLists) ;
                 // request.setAttribute("MediaSearchDetails",mediaListDetails);
                  
                  Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
		  request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));   
              if(searchAdvForm.getSelMediaType()!=null && searchAdvForm.getSelMediaType().trim().length()>0)   {  
                  Vector displayType = (Vector)advRemote.getMediaDisplayTypeDetails(searchAdvForm.getSelMediaType());  
                 request.setAttribute("DisplayTypeDetails",getDropDown(displayType));
              }    
		 request.setAttribute(mapping.getName(),searchAdvForm);	
		   return mapping.findForward("frmAdvDimensionDetailsList");       
	  } 
          
          /**
           *  Loading search page initially prompting to the user for search
           */
            public ActionForward initSearch(ActionMapping mapping, ActionForm  form,HttpServletRequest request, HttpServletResponse response)
		throws Exception {     
		   Debug.print("ActionAdvertise.initSearch() called ...."); 
		  HLCAdvertiseSessionRemote advRemote = initializeEJB(request);
                  Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();                 
		  request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));
                  Vector dispDimensionType =(Vector)advRemote.getAllDimensionDetails();
                  request.setAttribute("DispDimensionDetails",getDropDown(dispDimensionType));
		  return mapping.findForward("frmAdvDimensionDetailsList");       
	  } 

         /**
          * Getting the EJB Remote object to access the bean
          */
        
        private HLCAdvertiseSessionRemote initializeEJB(HttpServletRequest request) throws Exception{  
            
            
                MessageResources mr=getResources(request);
                String namingfactory=mr.getMessage("ejbclient.namingfactory");
                String contextfactory=mr.getMessage("ejbclient.contextfactory");
                String urlprovider=mr.getMessage("ejbclient.urlprovider");
                String lookupip=mr.getMessage("ejbclient.ip");
                String jndiname=mr.getMessage("jndi.advertise");

                System.setProperty(namingfactory,contextfactory);
                System.setProperty(urlprovider,lookupip);
                Context jndiContext = new InitialContext();
                Object objref = jndiContext.lookup(jndiname);       
                 HLCAdvertiseSessionRemoteHome advHome = (HLCAdvertiseSessionRemoteHome)PortableRemoteObject
                         .narrow(objref,HLCAdvertiseSessionRemoteHome.class);
                HLCAdvertiseSessionRemote advRemote = advHome.create(); 
               return  advRemote; 
            
        } 
        
        /*
         *  Convert the vector into array list
         */
        private ArrayList getDropDown(Vector mediaLists){
           ArrayList dropDwonLists = new ArrayList();
                  for (Iterator it = mediaLists.iterator(); it.hasNext();) {
                      String[] keyValue = (String[]) it.next();
                     dropDwonLists.add(new LabelValueBean(keyValue[1],keyValue[0]));                  
                  }    
       return dropDwonLists; 
     }   
        
        
          
    
  }
//=========================================THE END========================================================================================
       