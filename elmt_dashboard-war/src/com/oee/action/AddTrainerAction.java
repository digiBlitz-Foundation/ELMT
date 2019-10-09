/*
 * AddTrainerAction.java
 *
 * Created on November 13, 2007, 3:04 PM
 */

package com.oee.action;

import com.hlcaccounts.session.*;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.mrm.actionform.InsertHorseRegActionForm;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import java.lang.Double;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.*;
import java.lang.String;
import javax.servlet.http.HttpSession;
import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import java.util.Properties;
import java.util.Date;
import java.text.*;
import org.apache.struts.util.MessageResources;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
/**
 *
 * @author Vidhya
 * @version
 */
public class AddTrainerAction extends Action {
    
    public ActionForward execute(ActionMapping mapping, ActionForm  form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        try{
            HttpSession session=request.getSession();
            MessageResources mr=getResources(request);
            
            String namingfactory=mr.getMessage("ejbclient.namingfactory");
            String contextfactory=mr.getMessage("ejbclient.contextfactory");
            String urlprovider=mr.getMessage("ejbclient.urlprovider");
            String lookupip=mr.getMessage("ejbclient.ip");
            
            String jname=mr.getMessage("jndi.usrreg");
            String jndiName=mr.getMessage("jndi.mqm");
            
            System.setProperty(namingfactory,contextfactory);
            System.setProperty(urlprovider,lookupip);
            Context jndiContext = new InitialContext();
            
            Object oef = jndiContext.lookup(jname);
            HLCkaverystatelessRemoteHome userhome = (HLCkaverystatelessRemoteHome)
            javax.rmi.PortableRemoteObject.narrow(oef,HLCkaverystatelessRemoteHome.class);
            HLCkaverystatelessRemote userremote = userhome.create();
            
            Object krishnaObj = jndiContext.lookup(jndiName);
            HLCMembershipQualificationMatrixRemoteHome qhome = (HLCMembershipQualificationMatrixRemoteHome)
            javax.rmi.PortableRemoteObject.narrow(krishnaObj,HLCMembershipQualificationMatrixRemoteHome.class);
            HLCMembershipQualificationMatrixRemote qremote = qhome.create();
            
            Object krishObj = jndiContext.lookup(mr.getMessage("jndi.pc"));
            HLCKrishnaStatelessRemoteHome krishnaHome = (HLCKrishnaStatelessRemoteHome)
            javax.rmi.PortableRemoteObject.narrow(krishObj,HLCKrishnaStatelessRemoteHome.class);
            HLCKrishnaStatelessRemote calRemote = krishnaHome.create();
            
            String process = request.getParameter("process");
            
            
            if(process!=null){
                if(process.equals("initTrainer")){
                    String eventTypeId = (String)session.getAttribute("eventTypeId");
                    String horseMemberId=request.getParameter("horseMemberId");
                    String compYear = (String)session.getAttribute("compYear");
                    String horseName = request.getParameter("horseName");
                    String riderId=qremote.getRiderId(horseMemberId);
                    String ownerId=qremote.getOwnerId(horseMemberId);
                    String userName=qremote.getUserNameBasedOnuserId(ownerId);
                    request.setAttribute("horseMemberId",horseMemberId);
                    request.setAttribute("riderId",riderId);
                    request.setAttribute("userName",userName);
                    boolean result = qremote.isTrainerDetailsExist(horseMemberId);
                    
                    ArrayList selectEventDetails = new ArrayList();
                    if(eventTypeId!=null && eventTypeId.trim().length()!=0 ){
                        selectEventDetails=calRemote.searchEventDetailsListAdmin(eventTypeId,null,null,Integer.parseInt(compYear));
                    }
                    request.setAttribute("selectEventDetails",selectEventDetails);
                    request.setAttribute("horseName",horseName);
                    if(result) return mapping.findForward("frmValidationProcess");
                    else return mapping.findForward("frmOEETrainerDet");
                }
                
                else if(process.equalsIgnoreCase("insertTrainer")){
                    String newAddressId = "";
                    String newCountryId = "";
                    String newStateId = "";
                    String newCityId = "";
                    String newZipId = "";
                    String newEmailId = "";
                    String newPhoneId = "";
                    String newFaxId = "";
                    String regFor = "";
                    String addOwnerUserId = "";
                    String firstName = "";
                    String lastName = "";
                    String ownerUserId = "";
                    String userNameId3 = "";
                    String regAddFor="";
                    String userNameOne ="";
                    String compAddFor = "";
                    String riderId = "";
                    String companyName="";
                    String loginName ="";
                    String finalPrimaryPh="";
                    String finalFax="";
                    String eventTypeId = (String)session.getAttribute("eventTypeId");
                    String horseMemberId=request.getParameter("horseMemberId");
                    String compYear = (String)session.getAttribute("compYear");
                    String horseName = (String)request.getParameter("horseName");
                    request.setAttribute("horseMemberId",horseMemberId);
                    request.setAttribute("horseName",horseName);
                    
                    ArrayList selectEventDetails = new ArrayList();
                    if(eventTypeId!=null && eventTypeId.trim().length()!=0 ){
                        selectEventDetails=calRemote.searchEventDetailsListAdmin(eventTypeId,null,null,Integer.parseInt(compYear));
                    }
                    request.setAttribute("selectEventDetails",selectEventDetails);
                    String riderPrimeId = request.getParameter("riderId");
                    riderId = request.getParameter("ownerUseaNoTwo");
                    regFor= request.getParameter("regAddFor");
                    ownerUserId = request.getParameter("addOwnerUserId");
                    String userId =(String)session.getAttribute("userId");
                    String trainerId = "";
                    trainerId = qremote.getTrainerId();
                    boolean trainResult=false;
                    request.setAttribute("riderPrimeId",riderPrimeId);
                    if((riderId==null || riderId.trim().length()==0)  && (regFor==null || regFor.trim().length()==0)){
                        request.setAttribute("horseMemberId",horseMemberId);
                        return mapping.findForward("frmOEETrainerDet");
                    }else{
                        if(regFor.equals("mem1")){
                            userNameOne = request.getParameter("ownerUseaNoTwo");
                            ownerUserId = (String)userremote.getUserIdBasedOnMemberId(userNameOne);
                            
                            boolean result=false;
                            result=qremote.updateHorseDetails(horseMemberId,ownerUserId);
                            if(result==true){
                                trainResult=qremote.insertHorseRelationDetails(horseMemberId,ownerUserId,trainerId);
                                return mapping.findForward("frmOEETrainerDetSuccess");
                            } else{
                                return mapping.findForward("frmOEETrainerDet");
                            }
                        } else if(regFor.equals("rid")){
                            userNameOne = request.getParameter("userNameId2");
                            ownerUserId = (String)userremote.getUserIdBasedOnMemberId(userNameOne);
                            boolean result=false;
                            result=qremote.updateHorseDetails(horseMemberId,ownerUserId);
                            if(result==true){
                                trainResult=qremote.insertHorseRelationDetails(horseMemberId,ownerUserId,trainerId);
                                return mapping.findForward("frmOEETrainerDetSuccess");
                            } else{
                                return mapping.findForward("frmOEETrainerDet");
                            }
                            
                        } else if(regFor.equals("acc")){
                            userNameOne = request.getParameter("userNameId3");
                            ownerUserId = qremote.getUserIdBasedOnuserName(userNameOne);
                            boolean result=false;
                            result=qremote.updateHorseDetails(horseMemberId,ownerUserId);
                            if(result==true){
                                trainResult=qremote.insertHorseRelationDetails(horseMemberId,ownerUserId,trainerId);
                                return mapping.findForward("frmOEETrainerDetSuccess");
                            } else{
                                return mapping.findForward("frmOEETrainerDet");
                            }
                            
                        } else if(regFor.equals("own")){
                            userNameOne = request.getParameter("txtUserName");
                            ownerUserId = qremote.getUserIdBasedOnuserName(userNameOne);
                            boolean result=false;
                            result=qremote.updateHorseDetails(horseMemberId,ownerUserId);
                            if(result==true){
                                trainResult=qremote.insertHorseRelationDetails(horseMemberId,ownerUserId,trainerId);
                                return mapping.findForward("frmOEETrainerDetSuccess");
                            } else{
                                return mapping.findForward("frmOEETrainerDet");
                            }
                            
                        } else if(regFor.equals("cmp")){
                            compAddFor = request.getParameter("ecmp1");
                            if(compAddFor.equals("yes")){
                                loginName = request.getParameter("existAddCompNameId1");
                                ownerUserId = qremote.getUserIdBasedOnuserName(loginName);
                                boolean result=false;
                                result=qremote.updateHorseDetails(horseMemberId,ownerUserId);
                                if(result==true){
                                    trainResult=qremote.insertHorseRelationDetails(horseMemberId,ownerUserId,trainerId);
                                    return mapping.findForward("frmOEETrainerDetSuccess");
                                } else{
                                    return mapping.findForward("frmOEETrainerDet");
                                }
                            } else if(compAddFor.equals("no")){
                                loginName = request.getParameter("newAddFirstNameIdComp");
                                newAddressId = request.getParameter("newAddAddressIdComp");
                                newCountryId = request.getParameter("newAddCountryIdComp");
                                newStateId = request.getParameter("newAddStateIdComp");
                                newCityId = request.getParameter("newAddCityIdComp");
                                newZipId = request.getParameter("newAddZipIdComp");
                                newEmailId = request.getParameter("newAddEmailIdComp");
                                newPhoneId = request.getParameter("newAddPhoneIdComp");
                                newFaxId = request.getParameter("newAddFaxIdComp");
                                firstName = request.getParameter("cpAddFirstNameIdComp");
                                lastName = request.getParameter("cpAddLastNameIdComp");
                                if(newPhoneId!=null){
                                    StringTokenizer strTkns = new StringTokenizer(newPhoneId,"[](),.-{}");
                                    
                                    while(strTkns.hasMoreTokens()){
                                        try{
                                            String phNo = (String)strTkns.nextToken();
                                            if(phNo!=null && phNo.trim().length()!=0){
                                                Debug.print("ph no Added from Stokenizer:" + phNo);
                                                finalPrimaryPh=finalPrimaryPh+phNo;
                                            }
                                        } catch(Exception e){
                                            Debug.print("ph no tokanizing exception:" + e);
                                        }
                                    }
                                }
                                if(newFaxId!=null){
                                    StringTokenizer strTkns = new StringTokenizer(newFaxId,"[](),.-{}");
                                    while(strTkns.hasMoreTokens()){
                                        try{
                                            String faxNo = (String)strTkns.nextToken();
                                            if(faxNo!=null && faxNo.trim().length()!=0){
                                                finalFax=finalFax+faxNo;
                                            }
                                        } catch(Exception e){
                                            Debug.print("ph no tokanizing exception:" + e);
                                        }
                                    }
                                }
                                boolean conResult=false;
                                boolean result=false;
                                String contactId = "";
                                contactId = qremote.getContactTypeId();
                                String comOwnerId=qremote.insertUserDetails(loginName,firstName,lastName,newEmailId,contactId);
                                if(comOwnerId!=null){
                                    conResult=qremote.insertContactDetails(comOwnerId,newAddressId,newCountryId,newStateId,newCityId,newZipId,finalPrimaryPh,finalFax,contactId);
                                }
                                if(conResult==true){
                                    result=qremote.updateHorseDetails(horseMemberId,comOwnerId);
                                    trainResult=qremote.insertHorseRelationDetails(horseMemberId,comOwnerId,trainerId);
                                    return mapping.findForward("frmOEETrainerDetSuccess");
                                } else{
                                    return mapping.findForward("frmOEETrainerDet");
                                }
                            }
                        }
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}