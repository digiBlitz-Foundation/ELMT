#-------------------------------------------------------------------------------
# * * Copyright: 2019 digiBlitz Foundation
#  * * 
#  * * License: digiBlitz Public License 1.0 (DPL) 
#  * * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
#  * * 
#  * * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
#  * * 
#  * * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
#  * * 
#  * * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
#-------------------------------------------------------------------------------
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!--/*  Program Name    : frmAdvDimensionEdit.jsp
 *  Created Date    : September 4, 2006, 4:24 PM
 *  Author          : Punitha.R
 *  Version         : 1.4
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */
--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script src="javascripts/frmOECOrganizerEdit.js" type="text/javascript"></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>

<body>
<%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%! String dateCheck(Date fieldName){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String detValue = "";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
    }
    %>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "../../include/header.jsp" %>
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%@ include file = "../../include/infobar.jsp" %>
		<!-- INFO BAR ENDS HERE -->	
	</td>
  </tr>
  <tr>
    <td class="tableCommonBg">
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="250" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			
<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>

			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="2" class="tblMainHead"><strong>Online Entries </strong>:Event Details </td>
  </tr>
  <tr>
    <td colspan="2" class="tblDescrp">		 </td>
  </tr>
 
 <!-- ==================================================Edit Dimension Details==============================================-->
  <tr>
    <td height="20"><table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
      <tr>
        <td colspan="3" class="tabHead">Required fields are marked with an asterisk <span class="asterisk">*</span></td>
      </tr>
      <% 
	  String orgList = (String)request.getAttribute("orgList");
	  String statuscheck = (String)request.getAttribute("err");
				
				if(statuscheck!=null && statuscheck.equals("st")){
				%>
      <tr>
        <td colspan="3" class="styleError" height="20">&nbsp;<strong> Try Again!</strong></td>
      </tr>
      <%
				}
				%>
      <tr>
        <td colspan="3" class="tblRowHead">Edit/Update Event Details:</td>
      </tr>
      <%
		HLCCalendarVO calVO = new HLCCalendarVO();
		
		calVO = (HLCCalendarVO)request.getAttribute("singleEventDetails");
		String forReadOnly = "";
		String forCalOne = "#";
		String forCalTwo = "#";
		String provisionId = calVO.getCalenderId();
		Date startDate = calVO.getBeginDate();
		String tempDt =(startDate.toString()); 
		Date endDate = calVO.getEndDate();
		Date entryBeginDte = calVO.getEntryStrtDate();
		Date entryEndDte = calVO.getEntryEndDate();
		Date extDueDte = calVO.getExtDueDate();
		String eventTitle = calVO.getEventTitle();
		String selAreaId1 = calVO.getAreaId();
		String selStateId1 = calVO.getStateId();
		String orgStatus = calVO.getOrgApprovalStatus();
		String renewalStatus = calVO.getRenewStat().toString();
		String eventId = calVO.getEventId();
		String eventDesc = calVO.getEventDesc();
		String eventLevels = calVO.getEventLevel();
		String orgComments = calVO.getOrgComments();
		String acStatus = calVO.getArearChairApproStatus();
        String acComments = calVO.getAreaChairCommt();
        String usStatus = calVO.getApprovalStatus();
        String usComments = calVO.getStaffComments();
		boolean rStat = false;
		if(renewalStatus.equalsIgnoreCase("true"))	rStat =true;
		else rStat = false;
		
		long stTime = calVO.getBeginDate().getTime();
		long eTime = calVO.getEndDate().getTime();
		long diffTime = eTime - stTime;
		int noDays = (int)(diffTime/(1000*60*60*24));
		int tempNo=noDays+1;
		String noOfDays=new Integer(tempNo).toString();
		String modifyBy="";
		if(acStatus!=null && acStatus.equalsIgnoreCase("approved")){
			forReadOnly = "return false";
			forCalTwo = "#";
			forCalOne = "#";
		}else{
			forCalTwo = "javascript:cal2.popup();";
			forCalOne = "javascript:cal1.popup();";
		}
  %>
			
      <form name="frmOECOrganizerEdit" id="frmOECOrganizerEdit" method="post" action="./calender.do"  onsubmit="return myvalidate();">
        <input type="hidden" name="method" value="updateOrg"/>
        <input type="hidden" name="provisionId" value="<%=provisionId%>" />
		<input type="hidden" name="noOfDays" value="<%=noOfDays%>" />
		<input type="hidden" name="modifyBy" value="<%=modifyBy%>" />
		<input type="hidden" name="compYear" value="<%=tempDt.substring(0,4)%>"/>
		<input type="hidden" name="temporgList" value="<%=orgList%>"/>
		  <tr>
          <td class="tableLeft">Event Title :</td>
          <td colspan="2" class="tableRight"><input  type="text" name="txtEventTitle" id="txtEventTitle"  class="textboxOne" value="<%=nullCheck(eventTitle)%>" size="25" maxlength="20" />
              <span class="asterisk">*</span></td>
        </tr>
        <tr>
          <td class="tableLeft">Event Begin Date :</td>
          <td colspan="2" class="tableRight"><input  type="text" name="startDate1" id="startDate1" readonly="readonly" class="textboxOne" value="<%=dateCheck(startDate)%>" size="25" maxlength="20" />
              <a href="<%=forCalOne%>"><img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /></a> <span class="asterisk">*</span></td>
        </tr>
        <tr>
          <td class="tableLeft">Event End Date :</td>
          <td colspan="2" class="tableRight"><input  type="text" name="endDate" id="endDate" readonly="readonly" class="textboxOne" value="<%=dateCheck(endDate)%>" size="25" maxlength="20" />
              <a href="<%=forCalTwo%>"><img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /></a> <span class="asterisk">*</span></td>
        </tr>
          <tr>
          <td class="tableLeft">Area Name :</td>
          <td colspan="2" class="tableRight">
		  				  <select name="selAreaId" id="selAreaId" class="selectboxOne" >
						  <option selected="selected" value=" ">Select One</option>
							<%
							ArrayList areaList = (ArrayList)request.getAttribute("selectAreaDetails");
							if(areaList!=null && areaList.size()!=0){
							Iterator it1 = areaList.iterator();				
							while(it1.hasNext()){
							String sr1[] = (String[])it1.next();
							String selAreaId2 = sr1[0];
							String selArea  = sr1[2];
							if(selAreaId1.equals(selAreaId2)){				
							%>
						   <option value="<%=selAreaId2%>" selected="selected"> <%=selArea%> </option>
							<%
							}else{
							%>
							<option value="<%=selAreaId2%>"> <%=selArea%> </option>	 
							<%}}}%>
							</select>
						<span class="asterisk">*</span>&nbsp;
				</td>
				</tr>
       <tr>
          <td class="tableLeft">State Name :</td>
          <td colspan="2" class="tableRight">
		  				  <select name="selStateId" id="selStateId" class="selectboxOne" >
						  <option selected="selected" value=" ">Select One</option>
							<%


							ArrayList stateList = (ArrayList)request.getAttribute("selectStateDetails");
							if(stateList!=null && stateList.size()!=0){
							Iterator it1 = stateList.iterator();				
							while(it1.hasNext()){
							String sr1[] = (String[])it1.next();
							String selStateId = sr1[0];
							String selState  = sr1[1];
							if(selStateId.equals(selStateId1)){				
							%>
						   <option value="<%=selStateId%>" selected="selected"> <%=selState%> </option>
							<%
							}else{
							%>
							<option value="<%=selStateId%>"> <%=selState%> </option>	 
							<%}}}%>
							</select>
						<span class="asterisk">*</span>&nbsp;
				</td>
				</tr>
	<tr>
          <td class="tableLeft">Entry Reg. Begin Date :</td>
          <td colspan="2" class="tableRight"><input  type="text" name="entryBeginDate" id="entryBeginDate" readonly="readonly" class="textboxOne" value="<%=dateCheck(entryBeginDte)%>" size="25" maxlength="20" />
              <a href="javascript:cal3.popup();"><img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /></a> <span class="asterisk">*</span></td>
        </tr>			
				
	<tr>
          <td class="tableLeft">Entry Reg. End Date :</td>
          <td colspan="2" class="tableRight"><input  type="text" name="entryEndDate" id="entryEndDate" readonly="readonly" class="textboxOne" value="<%=dateCheck(entryEndDte)%>" size="25" maxlength="20" />
              <a href="javascript:cal4.popup();"><img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /></a> <span class="asterisk">*</span></td>
        </tr>			
				
	<tr>
          <td class="tableLeft">Extended Due Date</td>
          <td colspan="2" class="tableRight"><input  type="text" name="extDueDate" id="extDueDate" readonly="readonly" class="textboxOne" value="<%=dateCheck(extDueDte)%>" size="25" maxlength="20" />
              <a href="javascript:cal5.popup();"><img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0" /></a></td>
        </tr>			
				
        <tr>
          <td  colspan="2" class="tableLeft">Event Levels :
		  <span class="asterisk">*</span></td>
		  <td colspan="2" class="tableRight" >Championship Details :</td>
          </tr>
          <%! String x1; %>
			
			<% 
            int countVal=0;           
			int chksfx=0;
			String cbx="divlevel";
			boolean entIdStatus=false;
			boolean chStatus=false;
			String eventcnt="";
			java.util.Vector allTypesVect=new Vector();
			allTypesVect=(java.util.Vector)request.getAttribute("allTypesVect");
			Enumeration itrators= (Enumeration)allTypesVect.elements();
			int i=0;
			countVal=allTypesVect.size();
			while(itrators.hasMoreElements()){
			String[] s = (String[]) itrators.nextElement();                                    
			String code=s[4];
			String selEventId=s[2];
			String selEventTypeId=s[1];
			String mid=s[0];
			String cnct=selEventId+"#"+code+"#"+selEventTypeId;
			i++;
			ArrayList eventList1 = (ArrayList)request.getAttribute("selectedEventDetails");
						if(eventList1!=null && eventList1.size()!=0){
							Iterator it = eventList1.iterator();
							while(it.hasNext()){
								entIdStatus = false;
								String sr[] = (String[])it.next();
								String selectEventId = sr[0];
								String selectEvTypeId = sr[2];
								String champStatus =sr[5];
								boolean champSts=Boolean.parseBoolean(champStatus);
								eventcnt=selectEventId+"#"+selectEvTypeId;
								if(selEventTypeId.equals(selectEvTypeId)){
									if(selEventId.equals(selectEventId)){
									entIdStatus = true;
									if(champSts==true){
									chStatus=true;
									}else if(champSts==false){
									chStatus=false;
									}
									break;
									
									
									}
								}
				   			 }
					   }
			%>   
			    <%
				String cbxname=cbx+Integer.toString(chksfx);
				if(!(s[3].equals(x1))){
				x1=s[3];
				%>
					<tr>
		
          
		  <td class="tblRowHead" ><%=x1%></td>
		  <td class="tblRowHead" >&nbsp;</td>
		  <td class="tblRowHead" >&nbsp;</td>
		  </tr>
		  <%}%>
		  <%if(entIdStatus==true){
		  
		  %>
		   <tr>
		  <td class="tableLeft" >&nbsp;</td>
          <td class="tableLeft" ><input type="checkbox" size="10" name="txtEvent<%=i%>" id="txtEvent<%=i%>" value="<%=cnct%>" checked="checked" onclick="<%=forReadOnly%>"/><%=code%> </td>
		  <%if(chStatus==true){ %>
          <td class="tableLeft"><input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" onclick="<%=forReadOnly%>" checked="true"/>
            Yes
            <input type="radio" size="10" name="champ<%=i%>" value="no" onclick="<%=forReadOnly%>" />
            No </td>
			<%}else{%>
			<td class="tableLeft"><input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" onclick="<%=forReadOnly%>" />
            Yes
            <input type="radio" onclick="<%=forReadOnly%>" size="10" name="champ<%=i%>" value="no" />
            No </td></tr>
			<%}%>
          <%
			}else{
			 
				%><tr>
	<td class="tableLeft" >&nbsp;</td>
        <td class="tableLeft"><input type="checkbox" size="10" name="txtEvent<%=i%>" id="txtEvent<%=i%>" value="<%=cnct%>" onclick="<%=forReadOnly%>"/>
              <%=code%></td>
          <td class="tableLeft"><input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" onclick="<%=forReadOnly%>" />
            Yes
            <input type="radio" size="10" name="champ<%=i%>" value="no" onclick="<%=forReadOnly%>" />
            No </td></tr>
          <%}
			chksfx++; 
			%>
        <%}%>
			<input type="hidden" name="countVal" value="<%=countVal%>"/>
			<input type="hidden" name="allTypesVect" id="allTypesVect" value="<%=allTypesVect.size()%>" />       
		
        <tr>
          <td class="tableLeft">Renewal Status :</td>
          <td colspan="2" class="tableRight">
		  <%System.out.println("rStat"+rStat);
		  if(rStat==false){%>
		  
		  <input type="radio" size="10" name="renStatus" value="true" /> Yes
		  <input type="radio" size="10" name="renStatus" value="false" checked="true"/> No 
		  <%}else{%>
		  <input type="radio" size="10" name="renStatus" value="true"  checked="true"/> Yes
		  <input type="radio" size="10" name="renStatus" value="false" /> No 
		  <%}%>
              </td>
        </tr>
		<tr>
          <td class="tableLeft">Organizer Comments :</td>
          <td colspan="2" class="tableRight"><textarea id="txtOrgComm" name="txtOrgComm" rows="5" class="textboxOne" cols="25"><%=nullCheck(orgComments)%></textarea>
              </td>
        </tr>
        <tr>
          <td class="tableLeft">&nbsp;</td>
          <td colspan="2" class="tableRight"><input name="editButton" type="submit" class="gradBtn" value="Update"  />
            &nbsp;
            <input name="advDimButton" type="button" class="gradBtn" value="Cancel" onclick="javascript:history.back(-1);" />          </td>
        </tr>
      </form>
    </table></td>
  </tr>
  
  <!-- ==================================================List Dimension Details==============================================-->
 
  
  <tr>
    <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
  </tr>
</table>
			<!-- CONTENTS END HERE -->		
			</td>
		  </tr>
	  </table>
	
	</td>
  </tr>
  <tr>
    <td class="footerBg">
		<!-- FOOTER STARTS HERE -->
			<%@ include file = "../../include/footer.jsp" %>
		<!-- FOOTER ENDS HERE -->
	</td>
  </tr>
</table>
<script language="javascript">
    var cal1 = new calendar2(document.forms['frmOECOrganizerEdit'].elements['startDate1']);
	 cal1.year_scroll = true; 

	 cal1.time_comp = false;
	 
    var cal2= new calendar2(document.forms['frmOECOrganizerEdit'].elements['endDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;	
	
	
	 var cal3 = new calendar2(document.forms['frmOECOrganizerEdit'].elements['entryBeginDate']);
	 cal3.year_scroll = true; 
	 cal3.time_comp = false;
	 
    var cal4= new calendar2(document.forms['frmOECOrganizerEdit'].elements['entryEndDate']);
	cal4.year_scroll = true;
	cal4.time_comp = false;	
	
		 
    var cal5= new calendar2(document.forms['frmOECOrganizerEdit'].elements['extDueDate']);
	cal5.year_scroll = true;
	cal5.time_comp = false;	

</script>

</body>
</html>