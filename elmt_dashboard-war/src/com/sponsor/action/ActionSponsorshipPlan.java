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
/*  Program Name    : ActionSponsorshipPlan.java
 *  Created Date    : 
 *  Author          : Punitha.R
 *  Version         : 1.10
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.sponsor.action;

import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

import com.hlcspnr.sponsor.HLCSponsorSessionRemoteHome;
import com.hlcspnr.sponsor.HLCSponsorSessionRemote;
import com.hlcspnr.sponsor.*;
import com.hlcspnr.plan.*;
import com.hlcspnr.util.*;
import javax.naming.Context;
import javax.naming.*;
import java.util.Properties;
import java.util.*;

public class ActionSponsorshipPlan extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
         try{
            Properties p =new Properties();
            p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
            p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
            p.setProperty( "java.naming.provider.url", "localhost:11199" );
            Context jndiContext = new InitialContext(p);
            Object obj=jndiContext.lookup("ejb/HLCSponsorSessionBean");
            HLCSponsorSessionRemoteHome home = (HLCSponsorSessionRemoteHome)
            javax.rmi.PortableRemoteObject.narrow(obj,HLCSponsorSessionRemoteHome.class);
            HLCSponsorSessionRemote remote = home.create();
           
            HttpSession session =request.getSession(true); 
            
            String process = request.getParameter("process");
            
            boolean result=false;

//================================================simple redirects jsp page =====================================================================================                      
            if(process.equals("newaddSpoPlan")){
                return mapping.findForward("sponsoradd");
            }
//================================================Add new Sponsor Plan=====================================================================================            
            if(process.equals("addSpoPlan")){   
                   try{
                    String plan_name = request.getParameter("planName");
                    if(plan_name!=null){
                        plan_name = plan_name.trim();
                    }
                    String plan_amount = request.getParameter("planAmount");  
                    String plan_description = request.getParameter("planDescription");
                    result = remote.createPlan(plan_name,plan_description,plan_amount);
                   
                        if(result==true){
                           return mapping.findForward("successplan"); 
                        }
                        else{
                        request.setAttribute("err","st");
                        return mapping.findForward("sponsoradd"); 
                            }   
                       }
                  catch(Exception e){
                      System.out.println("Exception while adding new plan" + e);;
                   }
             }
//================================================Edit & Update Sponsor Plan=====================================================================================                        
            else if(process.equals("editSpoPlan")){
                String plan_id = request.getParameter("planEditId");
                String planName = request.getParameter("planName");
                String planAmount = request.getParameter("planAmount");
                String planDescription  = request.getParameter("planDescription");
                 if(planName!=null){
                        planName = planName.trim();
                    }
                float amt = Float.parseFloat(planAmount);  
                BigDecimal des = new BigDecimal(amt);
                des = des.setScale(2, BigDecimal.ROUND_HALF_UP);
                boolean resultedit = remote.editSponsorPlan(plan_id,planName,planDescription,String.valueOf(des));
                if(resultedit==true){
                    return mapping.findForward("successUpdate");
               }
               else{
                        request.setAttribute("err","st");
                        return mapping.findForward("sponsoredit"); 
                      }   
            }
//================================================Edit Sponsor Plan=====================================================================================                                  
           else if(process.equals("manupPlan")){
                String proButton = request.getParameter("butValue");
                Debug.print("proButton" + proButton);
                String planId = request.getParameter("planId");
                Debug.print("planId" +  planId );
                session.setAttribute("editsponplan",null);
                    if(proButton.equals("Edit")){
                            String plan [] = (String[] )remote.getPlanDetails(planId);
                            session.setAttribute("editsponplan",null);                       
                            session.setAttribute("editsponplan",plan);
                            return mapping.findForward("sponsoredit");
                      }
                
//================================================Delete Sponsor Plan=====================================================================================                                        
                     else if(proButton.equals("Delete")){
                                             
                            String plan [] = (String[] )remote.getPlanDetails(planId);
                            request.setAttribute("deletesponplan",null);                       
                            request.setAttribute("deletesponplan",plan);
                            return mapping.findForward("sponsordelete");
                        }
                }


//===============================================Confirm Delete Sponsor Plan=====================================================================================                                        

       else if(process.equals("confirmDelete")){
                 try{
                        String ButtonPlan = request.getParameter("ButtonPlan");
                        String planId = request.getParameter("planId");

                            if(ButtonPlan.equals("Confirm Delete")){

                                boolean resultDelete = remote.deleteSponsorPlan(planId);
                                 try{
                                    if(resultDelete == true){
                                            Vector v = (Vector)remote.getAllPlanDetails();
                                            Debug.print("delete vector" + v);
                                            session.setAttribute("listsponplan",null);                       
                                            session.setAttribute("listsponplan",v);
                                            return mapping.findForward("sponsorlist");
                                    }
                                    else{
                                            request.setAttribute("errStat","eConfirmDelete");
                                            return mapping.findForward("sponsorlist"); 
                                    }
                                }
                                catch(Exception edeleteconfirm){
                                    Debug.print("unable to delete this record" + edeleteconfirm);

                                }
                             }
                                //if(resultDelete == false){

                         else if(ButtonPlan.equals("Cancel")){
                                    return mapping.findForward("sponsorlist"); 
                             }
                 }catch(Exception edelete){
                     Debug.print("Exception occurs while deleting" + edelete);
                 }
            }
//================================================Show Sponsor Plan===============================================================================                           
            else if(process.equals("lispoplan")){
                Vector v = (Vector)remote.getAllPlanDetails();
                Debug.print("Vector value" + v);
                session.setAttribute("listsponplan",null);                       
                session.setAttribute("listsponplan",v);
                return mapping.findForward("sponsorlist");
            }
//================================================Try block end====================================================================================                                
        }
//================================================Catch block=======================================================================                          
        catch( Exception e ){
            System.out.println("Exception is : " + e);
        }
//================================================Redirect page=======================================================================                                   
         return null;
     }
    
 }
