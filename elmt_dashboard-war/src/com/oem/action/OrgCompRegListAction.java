/*
 * OrgCompRegListAction.java
 *
 * Created on November 21, 2007, 5:35 PM
 */

package com.oem.action;

import com.hlccommon.util.Debug;
import com.hlcutil.HLCPriceMatrixVO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.*;
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
import java.util.Properties;
import java.util.Date;
import java.text.*;
import org.apache.struts.util.MessageResources;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcutil.HLCCompRegistrationVO;
import org.apache.struts.upload.FormFile;
import java.io.BufferedOutputStream;

/**
 *
 * @author Vidhya
 * @version
 */
public class OrgCompRegListAction extends Action {
    
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
            String jndiName=mr.getMessage("jndi.mqm");
            String jndiname=mr.getMessage("jndi.pc");
            
            System.setProperty(namingfactory,contextfactory);
            System.setProperty(urlprovider,lookupip);
            Context jndiContext = new InitialContext();
            
            Object krishnaObj = jndiContext.lookup(jndiname);
            HLCKrishnaStatelessRemoteHome krishnaHome = (HLCKrishnaStatelessRemoteHome)
            javax.rmi.PortableRemoteObject.narrow(krishnaObj,HLCKrishnaStatelessRemoteHome.class);
            HLCKrishnaStatelessRemote calRemote = krishnaHome.create();
            
            Object qualObj = jndiContext.lookup(jndiName);
            HLCMembershipQualificationMatrixRemoteHome qhome = (HLCMembershipQualificationMatrixRemoteHome)
            javax.rmi.PortableRemoteObject.narrow(qualObj,HLCMembershipQualificationMatrixRemoteHome.class);
            HLCMembershipQualificationMatrixRemote qremote = qhome.create();
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            String filePath=mr.getMessage("horseComp_uploadPath");
            if(cmd!=null){
                          
                if(cmd.equals("initList")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    return mapping.findForward("frmOEMOrgCompRegList");
                }
                if(cmd.equals("initEventTitleList")){
                    String year=request.getParameter("year");
                    String organizerId=(String)session.getAttribute("memberId");
                    ArrayList eventTitles=new ArrayList();
                    eventTitles=qremote.getEventTiles(year,organizerId);
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("tempYear",year);
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    return mapping.findForward("frmOEMOrgCompRegList");
                }
                if(cmd.equals("ListDetails")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String tempYear=request.getParameter("selYear");
                    int year=Integer.parseInt(tempYear);
                    String eventID=request.getParameter("selTitle");
                    String status=request.getParameter("acStatus");
                    String organizerId=(String)session.getAttribute("memberId");
                    Debug.print("year: "+year);
                    Debug.print("eventID: "+eventID);
                    Debug.print("status: "+status);
                    Debug.print("organizerId: "+organizerId);
                    ArrayList compRegDetails=new ArrayList();
                    ArrayList eventTitles=new ArrayList();
                    
                    eventTitles=qremote.getEventTiles(tempYear,organizerId);
                    compRegDetails=qremote.getOrgCompRegList(year,eventID,status,organizerId);
                    
                    request.setAttribute("compRegDetails",compRegDetails);
                    request.setAttribute("tempYear",tempYear);
                    request.setAttribute("eventID",eventID);
                    request.setAttribute("status",status);
                    request.setAttribute("eventTitles",eventTitles);
                    return mapping.findForward("frmOEMOrgCompRegList");
                }
                
               else if(cmd!=null && cmd.equalsIgnoreCase("compRegView")){
                Debug.print("OrgCompRegListAction calling Process:eventView....");
                String registrationId = request.getParameter("registrationId");
                Debug.print("registrationId in OrgCompRegListAction :"+registrationId);
               
                HLCCompRegistrationVO objRegVO = new HLCCompRegistrationVO();
                if(registrationId!=null && registrationId.trim().length()!=0){
                    objRegVO = qremote.getSingleCompRegDetails(registrationId);
                }
                request.setAttribute("singleCompRegDetails",objRegVO);
                return mapping.findForward("frmOEMOrgCompRegView");
            }
              
             else if(cmd.equals("uplView")){
                            String filePath1 = request.getParameter("fPath");
                            Debug.print("filePath1" + filePath1);
                                int lastIndex = filePath1.lastIndexOf("\\") ;
                                String url ="";
                                if(lastIndex!=-1){
                                url = filePath1.substring(lastIndex+1,filePath1.length());
                                Debug.print("url in servlet" + url);
                                }
                            String type = filePath1.substring(filePath1.lastIndexOf(".")+1,filePath1.length());
                            Debug.print("type" + type);                       
                            String dirPath = filePath;//get it from the configuration  
                            String tempPath = dirPath + "/"+ url;
                            Debug.print("tempPath" + tempPath);
                            File file = new File(tempPath);
                            Debug.print("file" + file);                          
                            outputImage(file,filePath1,response);
                            return null;
                 }   
            
         else if(cmd!=null && cmd.equalsIgnoreCase("initEventApprove")){
                Debug.print("OrgCompRegListAction calling Process:initEventApprove....");
               String registrationId = request.getParameter("registrationId");
                Debug.print("registrationId in OrgCompRegListAction :"+registrationId);
                HLCCompRegistrationVO objRegVO = new HLCCompRegistrationVO();
                if(registrationId!=null && registrationId.trim().length()!=0){
                    objRegVO = qremote.getSingleCompRegDetails(registrationId);
                }
                request.setAttribute("singleCompRegDetails",objRegVO);
                return mapping.findForward("frmOEMOrgCompRegApprove");
            } 
         else if(cmd!=null && cmd.equalsIgnoreCase("compRegApprove")){
                String quaStatus = request.getParameter("qualifyStatus");
                Debug.print("quaStatus in OrgCompRegListAction"+quaStatus);
                String comments = request.getParameter("quaComments");
                Debug.print("comments in OrgCompRegListAction"+comments);
                String registrationId = request.getParameter("registrationId");
                Debug.print("registrationId in OrgCompRegListAction :"+registrationId);
                boolean result = false;
                if(registrationId!=null && registrationId.trim().length()!=0 && quaStatus!=null && quaStatus.trim().length()!=0){
                    result = qremote.approveSingleCompRegDetails(registrationId, quaStatus, comments);
                }
                if(result){
                    request.setAttribute("approveStatus","approveSuccess");
                    return mapping.findForward("CompRegApproveSuccess");
                }else{
                    request.setAttribute("approveStatus","approveFailed");
                    return mapping.findForward("CompRegApproveSuccess");
                }
            }       
 
            }
                       
        }
                   
           catch(Exception e){
            e.printStackTrace();
        }
        return null;
    
    }
    public void outputImage(File thumbfile, String filePath1, HttpServletResponse response) throws FileNotFoundException, IOException {
        if (thumbfile == null) {
            Debug.print("Extra path info was null; should be a resource to view");
        }
        
        //response.reset();
        //response.setContentType("text/plain");
        response.setContentType("application/octet-stream");
        //response.setContentType("application/" + type);
        response.setHeader("Content-Disposition", "attachment;filename=\"" + filePath1 + "\"");
        //response.setHeader("Content-Disposition","attachment; filename=\"" + thumbfile + "\"");
        
        OutputStream os = response.getOutputStream();
        FileInputStream fin = new FileInputStream(thumbfile);
        byte[] buf = new byte[4096];
        int count = 0;
        while(true) {
            //  byte[] buf = new byte[4 * 1024]; // 4K buffer
            // int bytesRead;
            // while ((bytesRead = in.read(buf)) != -1) {
            //out.write(buf, 0, bytesRead);
            
            int n = fin.read(buf);
            if(n == -1) {
                break;
            }
            count = count + n;
            os.write(buf,0,n);
        }
        os.flush();
        os.close();
        fin.close();
    }
  
}


