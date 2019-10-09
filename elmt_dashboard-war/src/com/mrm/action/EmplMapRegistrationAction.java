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
package com.mrm.action;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.util.*;
import com.hlcrole.management.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hlccommon.util.Debug;
import com.hlcform.stateless.*;
import com.hlcform.util.*;
import com.mrm.actionform.InsertUserRegActionForm;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;

import org.apache.struts.util.MessageResources;
import org.jasypt.util.text.BasicTextEncryptor;
public class EmplMapRegistrationAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    	  String fwd="";
	 try {
	     BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
         textEncryptor.setPassword("sa");

         MessageResources mr = getResources(request);

         String namingfactory = mr.getMessage("ejbclient.namingfactory");
         String contextfactory = mr.getMessage("ejbclient.contextfactory");
         String urlprovider = mr.getMessage("ejbclient.urlprovider");
         String lookupip = mr.getMessage("ejbclient.ip");
         String jndiname = mr.getMessage("jndi.usrreg");

         System.setProperty(namingfactory, contextfactory);
         System.setProperty(urlprovider, lookupip);
         Context jndiContext = new InitialContext();
         Object objref = jndiContext.lookup(jndiname);

         HLCkaverystatelessRemoteHome home = (HLCkaverystatelessRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref, HLCkaverystatelessRemoteHome.class);
         HLCkaverystatelessRemote remote = home.create();

         String source = request.getParameter("source");
         String jndiname2 = mr.getMessage("jndi.rolemanagement");
         
         Object objref2 = jndiContext.lookup(jndiname2);
         Debug.print("ActionRoleMangement.jndiname:" + jndiname2);

         HLCBrahmaputraSessionRemoteHome roleHome = (HLCBrahmaputraSessionRemoteHome) PortableRemoteObject.narrow(objref2, HLCBrahmaputraSessionRemoteHome.class);
         HLCBrahmaputraSessionRemote roleRemote = roleHome.create();
         System.setProperty(namingfactory, contextfactory);
         System.setProperty(urlprovider, lookupip);
         HLCEmployeeDetails objEmpMaster = new HLCEmployeeDetails();
         InsertUserRegActionForm usrbean = (InsertUserRegActionForm) form;
         String process = request.getParameter("process");
       
         
         if (process!=null && process.equals("insertEmpDet")) {
        	 
         System.out.println("inside insertEmpDet");
         
         objEmpMaster.setPrefix(usrbean.getUSelect());
         objEmpMaster.setFirstName(usrbean.getFname());
         objEmpMaster.setMiddleName(usrbean.getMname());
         objEmpMaster.setLastName(usrbean.getLname());
         objEmpMaster.setSufix(usrbean.getSname());
         objEmpMaster.setEmailId(request.getParameter("email"));
         objEmpMaster.setEmployeeId(request.getParameter("empId"));
         objEmpMaster.setLoginName(request.getParameter("usrname"));         
         String str=request.getParameter("password");
         String encryptedPWD = textEncryptor.encrypt(str);
         objEmpMaster.setPassword(encryptedPWD);
        
         StringBuffer lobList = new StringBuffer();
         StringBuffer deptList = new StringBuffer();
         StringBuffer repSupList = new StringBuffer();
         StringBuffer repSupDepIdList = new StringBuffer();
         StringBuffer supEmailList = new StringBuffer();
         StringBuffer supEmailSendList = new StringBuffer();
         String counBaseLoc = request.getParameter("counBaseLoc");
         String baseLoc = request.getParameter("baseLoc");
         String curCoun = request.getParameter("curCoun");
         String curLoc = request.getParameter("curLoc");
        String deptName = request.getParameter("deptName");
        String roleName = request.getParameter("roleName");       
        
         String roleSpilt = request.getParameter("role");         
         String cntValue[] = roleSpilt.split("#");
         String role = cntValue[0];
         String lob[] = request.getParameterValues("lob");
         String dept[] = request.getParameterValues("dept");
         String repSup[]= request.getParameterValues("repSup");
         String supEmail[] = request.getParameterValues("supEmail");
         
        
       
          System.out.println("deptName=="+deptName+"==roleName="+roleName);
         int chkCount = 1;
         //Base Country List 
         for (int i = 0; i < lob.length; i++) {
        	 if(chkCount<lob.length)
        	 {
        		 lobList=lobList.append(lob[i]).append(",");
        	
        	 }
        	 else
        	 {
        		 lobList = lobList.append(lob[i]);
        	 }
        	 chkCount++;
        	 
         }
         
       //Base Country Location List 
         chkCount = 1;
         for (int i = 0; i < dept.length; i++) {
        	 if(chkCount<dept.length)
        	 {
        		 deptList=deptList.append(dept[i]).append(",");
        	
        	 }
        	 else
        	 {
        		 deptList = deptList.append(dept[i]);
        	 }
        	 chkCount++;
        	 
         }
         
       //Current Country List 
         chkCount = 1;
         String spiltSupDep="";
         String[] supDepCom;
         String supName="";
         String supDepId="";
         for (int i = 0; i < repSup.length; i++) {
       
        	 if(chkCount<repSup.length)
        		 
        	 {
        		 spiltSupDep=repSup[i].toString();
        		 supDepCom=spiltSupDep.split("_");
        		 supName=supDepCom[0];
        		 supDepId=supDepCom[1];
        		 repSupList=repSupList.append(supName).append(",");
        		 repSupDepIdList=repSupDepIdList.append(supDepId).append(",");
        		 
        	
        	 }
        	 else
        	 {
        		 spiltSupDep=repSup[i].toString();
        		 supDepCom=spiltSupDep.split("_");
        		 supName=supDepCom[0];
        		 supDepId=supDepCom[1];
        		 repSupList = repSupList.append(supName);
        		 repSupDepIdList=repSupDepIdList.append(supDepId).append(",");
        	 }
        	 chkCount++;
        	 
         }
         
         //Current Country Location List 
         chkCount = 1;
         for (int i = 0; i < supEmail.length; i++) {
        	 if(chkCount<supEmail.length)
        	 {
        		 supEmailList=supEmailList.append(supEmail[i]).append(",");
        		 //supEmailSendList=supEmailSendList.append("\"").append(supEmail[i]).append("\"").append(",");
        	
        	 }
        	 else
        	 {
        		 supEmailList = supEmailList.append(supEmail[i]);
        		// supEmailSendList=supEmailSendList.append("\"").append(supEmail[i]).append("\"");
        	 }
        	 chkCount++;
        	 
         }
         
     
         System.out.println("lobList===="+lobList.toString()+"deptList======"+deptList.toString()+"repSupList===="+repSupList.toString()+"supEmailList=="+supEmailList.toString()+"=====supEmailSendList"+supEmailSendList.toString());
         objEmpMaster.setCounBaseLoc(counBaseLoc);
         objEmpMaster.setDesig(role);
         objEmpMaster.setBaseLoc(baseLoc);
         objEmpMaster.setCurCoun(curCoun);
         objEmpMaster.setCurLoc(curLoc);
         objEmpMaster.setLob(lobList.toString());
         objEmpMaster.setDept(deptList.toString());
         objEmpMaster.setSupName(repSupList.toString());
         objEmpMaster.setSupEmail(supEmailList.toString());
         
         String userId = remote.addEmpRegistration(objEmpMaster);
         boolean chkInsertMap=false;
         //boolean chkInsertMap = remote.addUsrSupMapping
         
         StringTokenizer stSup=new StringTokenizer(objEmpMaster.getSupName(),",");
         StringTokenizer stSupEmail=new StringTokenizer(objEmpMaster.getSupEmail(),",");
         StringTokenizer stDept=new StringTokenizer(repSupDepIdList.toString(),",");
         
         Debug.print("repSup[0].toString()=="+objEmpMaster.getSupName()+"==supEmail[0].toString()=="+objEmpMaster.getSupEmail());
       
         while(stSup.hasMoreTokens() && stSupEmail.hasMoreTokens()&& stDept.hasMoreTokens()){
        	 
        	  chkInsertMap = remote.addUserSupMapping(userId,stSup.nextToken().toString(),stSupEmail.nextToken().toString(),role,stDept.nextToken().toString());
        	 
         }
         System.out.println("chkInsertMap=="+chkInsertMap);
         boolean rolestat = roleRemote.createDefaultRole(userId, role);
         if(chkInsertMap==true)
         {
        	  /* =====================================
             *
             * Sending confirmation E-mail
             *
             * ====================================*/
        	// String supEmail1=objEmpMaster.getSupEmail;();
        	
        	 
            String emailid = request.getParameter("email");
          
            String[] toEmailId={emailid};      
            EmailContent userEmail = new EmailContent();
            userEmail.setTo(toEmailId);
            //email.setFrom("anandv@digiblitz.com");
            userEmail.setFrom("info_elmt@digiblitz.com");
            userEmail.setSubject("Your Account Info !");

            String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                    " <tr>" +
                    " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                    " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                    "<tr>" +
                    "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"ELMT Online Services Email Template\" width=\"515\" height=\"55\" /></td> " +
                    " </tr>" +
                    "  <tr>" +
                    "<td valign=\"top\">" +
                    "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                    "<tr>" +
                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                    "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                    "<span class=\"boldTxt\">Dear " + usrbean.getFname() + "</span>,<br /><br />" +
                    "<p>Please save this email for your records. Your account information is as follows:.<p>" + "<p>----------------------------<p>" + "<p>Employee No :" + request.getParameter("empId") +"<p>UserName :" + request.getParameter("usrname") + "<p> password: " + request.getParameter("password") + "<p> ----------------------------<p>" +
                    /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                    "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                    "Thank you for using the service provided by <span class=\"boldTxt\">Enterprise Landscape Management & Transformation</span>.</p>" +
                    "Thank You <br />" +
                    "------------------ <br />" +
                    "<span class=\"boldRedTxt\">ELMT Team</span></td>" +
                    "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                    "</tr>" +
                    "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                    "</tr>" +
                    " </table>" +
                    "</td></tr>" +
                     " <tr>" +
                    "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                    "</tr>" +
                    "</table>";


            userEmail.setBody(content);
            //email.setAttachments();

            EmailEngine emailEngine = new EmailEngine();
           boolean emailFlag = emailEngine.sendMimeEmail(userEmail);
            
           
            EmailContent superEmail= new EmailContent();
           //String toMailIds[] = {emailid};
           superEmail.setTo(supEmail);
           //superEmail.setTo(toMailIds);
            
            superEmail.setFrom("info_etl@digiblitz.com");
            superEmail.setSubject("Request for User Registration Approval!");

            String supContent = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                    " <tr>" +
                    " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                    " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                    "<tr>" +
                    "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"ELT Online Services Email Template\" width=\"515\" height=\"55\" /></td> " +
                    " </tr>" +
                    "  <tr>" +
                    "<td valign=\"top\">" +
                    "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                    "<tr>" +
                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                    "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                    "<span class=\"boldTxt\">Dear Supervisor </span>,<br /><br />" +
                    "<p>Please save this email for your records. User Registration details which require your approval are below :.<p>" + "<p>----------------------------<p>" + "<p>Employee No :" + request.getParameter("empId") +"<p>UserName :" + request.getParameter("usrname") + "<p> password: " + request.getParameter("password") + 
                    "<p>User Role :" + request.getParameter("roleName") +"<p>Department :" + request.getParameter("deptName") + "<p>----------------------------<p>" +
                    /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                    "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                    "Please login into ELMT system to Approve </span>.</p>" +
                    "Thank you for using the service provided by <span class=\"boldTxt\">Enterprise Landscape Management & Transformation</span>.</p>" +
                    "Thank You <br />" +
                    "------------------ <br />" +
                    "<span class=\"boldRedTxt\">ELMT Team</span></td>" +
                    "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                    "</tr>" +
                    "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                    "</tr>" +
                    " </table>" +
                    "</td></tr>" +
                     " <tr>" +
                    "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                    "</tr>" +
                    "</table>";


            superEmail.setBody(supContent);
            //email.setAttachments();
            EmailEngine supEmailEngine = new EmailEngine();
            boolean emailFlag1 = supEmailEngine.sendMimeEmail(superEmail);
            Debug.print("Email sent sucessfully :" + emailFlag1);
         }

         fwd="frmEmpRegSucc";
         
         }
	 }
	 catch(Exception ex) {
         System.err.println("Caught an exception.");
         ex.printStackTrace();
	 }
	    return mapping.findForward(fwd);
	    }
}