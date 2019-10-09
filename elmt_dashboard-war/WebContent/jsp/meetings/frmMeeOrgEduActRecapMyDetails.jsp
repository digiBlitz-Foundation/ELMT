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
<%@ page import="java.text.*"%>
<%@ page import="com.hlccommon.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeEduActRecap.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<%

SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
HLCOraganizerRecapVO objOrgRecap = (HLCOraganizerRecapVO) session.getAttribute("DispOrgRecapDetails");
String recapId = objOrgRecap.getRecapId();
if(recapId.equals("") || recapId==null ){
out.print("Sorry you are not able to view the record");
}
String memeberId = (String)session.getAttribute("memberId");
if(memeberId==null)
memeberId = "NA";

HLCActivityOrganizerVO objActivityDet = (HLCActivityOrganizerVO) session.getAttribute("ActivityOrganizerVODet");


	ArrayList listContact = (ArrayList) session.getAttribute("dynamicOrgDetails");
	
		String prefix1 = "";
		String first_name = "";
		String middle_name = "";
		String last_name = "";
		String sufix = "";
		String email_id = "";
		String suite = "";
		String address1 = "";
		String address2 = "";
		String city = "";
		String state = "";
		String country = "";
		String zip = "";
		String phone_no = "";
		String mobile_no = "";
		String fax_no = "";
		
		if(listContact !=null && listContact.size()!=0){
			Iterator it = listContact.iterator();
			while(it.hasNext()){
				prefix1 = (String)it.next();
				if(prefix1==null)
				prefix1 = "";
				first_name  = (String)it.next();
				if(first_name==null)
				first_name = "";
				middle_name  = (String)it.next();
				if(middle_name==null)
				middle_name = "";
				last_name = (String)it.next();
				if(last_name==null)
				last_name = "";
				sufix =  (String)it.next();
				if(sufix==null)
				sufix = "";
				email_id  = (String)it.next();
				if(email_id==null)
				email_id = "";
				suite =  (String)it.next();
				if(suite==null)
				suite = "";
				address1 =  (String)it.next();
				if(address1==null)
				address1 = "";
				address2 = (String)it.next();
				if(address2==null)
				address2 = "NA";
				city = (String)it.next();
				if(city==null)
				city = "";
				state =  (String)it.next();
				if(state==null)
				state = "";
				country = (String)it.next();
				if(country==null)
				country = "";
				zip = (String)it.next();
				if(zip==null)
				zip = "";
				phone_no = (String)it.next();
				if(phone_no==null)
				phone_no = "";
				mobile_no = (String)it.next();
				if(mobile_no==null)
				mobile_no = "";
				fax_no = (String)it.next();
				if(fax_no==null)
				fax_no = "NA";
			}
		}

%>
<body>
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
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
		<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				   <tr>
					<td colspan="2" class="tblMainHead">
						Meetings: <span class="styleBoldTwo"> Educational Activity Recap Approval </span></td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">
					 <strong>The details you are viewing is of the Educational Activity Recap placed by the Organizer whose details are seen below.<br />
					<br />
					</strong>Please fill-in the required dates and submit it to <strong>Approve</strong> the application. <br />
					<br />
					 
					</td>
				  </tr>
				  <tr>
					<td>
					
						<form name="frmMeeEduActRecap" id="myform" action="">
						<input type="hidden" name="recapProcess" value="approval"/>
						<input type="hidden" name="orgRecapId" value="<%=recapId%>" />
							
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						  <tr> 
							<td colspan="2" class="tblRowHead"> Basic Information: </td>
						  </tr>
						  
						
						  <tr> 
							<td class="tableLeft">Name Of Activity:</td>
							<th class="tableRight"><%=objActivityDet.getActivityName()%></th>
						  </tr>
						  <%
						  String actDate ="";
						  if(objActivityDet.getActivityDate()!=null){
						    actDate = sdf.format(objActivityDet.getActivityDate());
						  }
						  
						  %>
						  <tr> 
							<td class="tableLeft"> Date(s)held: :</td>
							<td class="tableRight"><%=actDate%></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Location Of Activity :</td>
							<td class="tableRight"><%=objActivityDet.getLocation()%></td>
						  </tr>
						   <%
						 				String finalArea ="";
										String areaName="";
										String getUseaAreaId = objActivityDet.getUseaAreaId();
										ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
										if(areaDetails!=null && areaDetails.size()!=0){
										Iterator areaIt = areaDetails.iterator();
										while(areaIt.hasNext()){
										String[] areaDet =(String[])areaIt.next();
										String areaId = areaDet[0];
										 areaName = areaDet[2];
										if(areaId.equals(getUseaAreaId)){
										finalArea = areaName;
										
									}
							  }
							}
							  %>                                                                                 
						
						  <tr> 
							<td class="tableLeft">Area:</td>
							<td class="tableRight"><%=finalArea%>&nbsp;</td>
						  </tr>
						  <tr>
							<td colspan="2" class="tblRowHead">Organizer Information</td>
						  <tr>
							<td class="tableLeft"> Memberl ID:</td>
							<td class="tableRight"><span class="styleBoldOne"><%=memeberId%></span></td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Organizer Name:</td>
							<td class="tableRight"><%=first_name%>&nbsp;<%=middle_name%> &nbsp; <%=last_name%> &nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Address:</td>
							<td class="tableRight"><%=address1%> <%=address2%>&nbsp;</td>
						  </tr>
						 <tr>
							<td class="tableLeft"> Address:</td>
							<td class="tableRight"><%=address2%>&nbsp;</td>
						  </tr>
						  <tr> 
							<td class="tableLeft">City:</td>
							<td class="tableRight"><%=city%>&nbsp;</td>
						  </tr>
						  
						  <tr> 
							<td height="27" class="tableLeft">State: </td>
							<td class="tableRight"><%=state%>&nbsp;</td>
						  </tr>
						  
							<tr> 
							<td class="tableLeft">Country:</td>
							<td class="tableRight"><%=country%>&nbsp;</td>
						  </tr>

						  
						  <tr> 
							<td class="tableLeft"> Zip: </td>
							<td class="tableRight"><%=zip%>&nbsp;</td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Phone:</td>
							<td class="tableRight"><%=phone_no%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Fax: </td>
							<td class="tableRight"><%=fax_no%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Email ID: </td>
							<td class="tableRight"><%=email_id%>&nbsp;</td>
						  </tr>
						  <tr>
							<td colspan="2" class="tblRowHead"> Activity Information </td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number Of Riders Participating:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfRiders()%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of Instructors:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfInstructors()%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of Current members:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfCurrentMembers()%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of New members:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfNewMembers()%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of Renewing members:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfRenewingMembers()%></td>
						  </tr>
						   <tr>
							<td colspan="2" class="tblRowHead"> New User Member Information </td>
						  </tr>
						  <tr>
							<td class="tableLeft">Individual Full members:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfFullMembers()%></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Junior members:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfJuniorMembers()%></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Non-competing members:</td>
							<td class="tableRight"><%=objOrgRecap.getNoOfNonCompetingMembers()%></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Amount:</td>
							<th class="tableRight">$<span class="styleBoldOne"> <%=objOrgRecap.getTotalAmount()%></span></th>
						  </tr>
						  <tr>
							<td colspan="2" class="tblRowHead"> Comments And Suggestions </td>
						  </tr>
						  <tr>
							<td class="tableLeftTxtArea">Comments about your Activity:</td>
							<td class="tableRight"><%=objOrgRecap.getComments()%></td>
						  </tr>
						  <tr>
							<td class="tableLeft">May we publish all or part of your comments in Eventing USA?</td>
							<td class="tableRight"><%=String.valueOf(objOrgRecap.isPublishComments())%></td>
						  </tr>
						  <tr>
							<td class="tableLeftTxtArea">Suggestions for Educational Activities and/or forms, procedures improvement :</td>
							<td class="tableRight"><%=objOrgRecap.getSuggestions()%></td>
						  </tr>
						    <tr>
							<td colspan="2" class="tblRowHead"> Approval Status </td>
						  </tr>
						  <%
						  		String requestStatus = objOrgRecap.getRequestStatus();
								java.util.Date reportDate = objOrgRecap.getActivityReportDate();
								java.util.Date closeDate = objOrgRecap.getCloseDate();
								 
								 
						  %>
						  
						  <tr>
							<td class="tableLeft">Status:</td>
							<td class="tableRight"><span class="styleboldOne"><%=requestStatus%></span></td>
						  </tr>
							<tr>
							<td class="tableLeft">Report Date </td>
							<td class="tableRight"><span class="styleboldOne">
							<%
							if(reportDate==null){
								out.println("Not Assigned");
							}
							else{
							out.println(sdf.format(reportDate));
							}
							%>
							</span></td>
						  </tr>
						  
						    <tr>
							<td class="tableLeft">Close Date </td>
							<td class="tableRight"><span class="styleboldOne">
							
							<%
								if(closeDate==null){
								out.println("Not Assigned");
								}
								else{
								out.println(sdf.format(closeDate));
								}
							%>
							</span></td>
						  </tr>
						
						  <tr> 
							<td colspan="2" class="alignCenter">
							<input type="button" value="Back" class="gradBtn" onclick="javascript:history.back(-1);" />
							</td>
						  </tr>
						  <tr> 
							<td colspan="2" class="alignCenter">&nbsp;<!-- DO NOT DELETE THIS ROW --></td>
						  </tr>
						</table>
						</form>
					</td>
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

</body>
</html>