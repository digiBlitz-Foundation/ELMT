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
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeICPAssessment.js" type="text/javascript" ></script>
<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
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
				<table  border="0" cellpadding="0" cellspacing="0"  align="center" class="formLayout">
				  <tr>
					<td colspan="5" class="tblMainHead">
						Meetings: <span class="styleBoldTwo">List of EDU Meetings</span>
					</td>
				  </tr>
				  <tr>
					<td colspan="5" class="tblDescrp"><br />
					EDU Meetings placed by Organizers are listed below. To view the details,
					click on the <strong>'View'</strong> button beside each record and to apply for the meeting click on the <strong>'Apply'</strong> button.					</td>
				  </tr>
				 
				 <tr>
					<td>
						<table border="0" cellpadding="0" align="center" cellspacing="1" class="formLayout">
						
						  <tr>
							<td width="80" height="27" class="tblRowHead">Meeting ID </td>
							<td width="122" class="tblRowHead">Activity Name </td>
							<td width="86" class="tblRowHead">Date to be Held </td>
							<td width="86" class="tblRowHead">View</td>
							<td width="90" class="tblRowHead">Apply</td>
						  </tr>
						  
							<%
						
		           
          	SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
         	String meetingId ="";
		    String activityDate ="";
			String requestDate ="";
			String meetingName ="";
			ArrayList vPendingAds = (ArrayList)request.getAttribute("displayApprovedDetails");
			if(vPendingAds!=null && vPendingAds.size()!=0){
						Iterator e = vPendingAds.iterator();
						ArrayList finalList = new ArrayList();
						while(e.hasNext()){
						 ArrayList exaVal = (ArrayList)e.next();
						 Iterator enumPub1 = exaVal.iterator();
						 while(enumPub1.hasNext()){
								HLCActivityOrganizerVO objActDet = (HLCActivityOrganizerVO)enumPub1.next();
									Vector publication = (Vector)enumPub1.next();
									 meetingName =objActDet.getActivityName();							
									 meetingId =	objActDet.getActivityMeetingId();
									 if(objActDet.getActivityDate()!=null){
									 activityDate = sdf.format(objActDet.getActivityDate());
									 }
									 if(objActDet.getAddDate()!=null){
									 requestDate =  sdf.format(objActDet.getAddDate());
									 }
					
					%>
				
							
							
					   <form name="frmMembRegi" id="myform" method="post" class="formcss" action="meeting.do">
					   <input type="hidden" name="orgMeetingId" value="<%=meetingId%>" />
					     <input type="hidden" name="meeProcess" value="showOrgMee" />
						  <tr>
							<td height="26" class="listCellBg"><%=meetingId%></td>
							<td class="listCellBg"><%=meetingName%></td>
							<td class="listCellBg"><%=activityDate%></td>
							<td class="listCellBg"><input name="butName" type="submit" class="oneBtn" value="View" /></td>
							<td class="listCellBg"><input name="butName" type="submit" class="twoBtn" value="Apply" /></td>
						  </tr>
                       </form>	
  
                                           
							<%}
							}
							}
							else {
					%>
					<tr>
					  <th height="25" colspan="5">No records are available. </th>
					</tr>
					<%}%> 
						  <!--<tr>
							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
						   </tr>-->
						  <tr>
							<td height="19" colspan="6">&nbsp;</td>
						   </tr>
					  </table>
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

