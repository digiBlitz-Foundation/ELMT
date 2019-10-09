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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeICPAssessment.js" type="text/javascript" ></script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />

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
						Meetings: <span class="styleBoldTwo">Organizer ICP Registration Listing</span>
					</td>
				  </tr>
				  <tr>
					<td colspan="5" class="tblDescrp">
					ICP Registerations placed by you are listed below. To view the details,
					click on the <strong>'View'</strong> button beside each record.
					</td>
				  </tr>
				 
				 <tr>
					<td>
						 <table border="0" cellpadding="3" align="center" cellspacing="1" class="formLayout">
				
						 <tr>
							<td colspan="5" class="tableSpan">
											</td>
						  </tr>
						  <tr>
							<td height="27" class="tblRowHead">Organizer ID </td>
							<td width="80" class="tblRowHead">Assessment Level</td>
							<td width="80" class="tblRowHead">Date of Event </td>
							<td width="120" class="tblRowHead">Date of Registration </td>
							<td width="88" class="tblRowHead">Approval Status</td>
							<td width="65" class="tblRowHead">View</td>
						  </tr>
						<logic:present name="FormAdminOrgListing" property="results">
						 <bean:size id="size" name="FormAdminOrgListing" property="results"/>
						 <logic:equal name="size" value="0">
								<tr>
								   <td colspan="5"  align="center"><B>No Records Found</B></td>
								</tr>
						 </logic:equal>                 
						 <logic:greaterThan name="size" value="0">
							<logic:iterate id="searchList" name="FormAdminOrgListing" property="results">
							   <html:form action="/listAdminOrg.do">
								  <html:hidden property="method" value="viewOrg"/>
									  <input type="hidden" name="icpMeetingId" value='<bean:write name="searchList" property="icpMeetingId"/>'/>
									  <tr>
										<td class="listCellBg"><bean:write name="searchList" property="hostMemberId"/></td>
										<td class="listCellBg"><bean:write name="searchList" property="assesmentLevel"/></td>
										<td class="listCellBg"><bean:write name="searchList" property="assesmentDate"/></td>
										 
										<td class="listCellBg"><bean:write name="searchList" property="addDate"/></td>		
										<td class="listCellBg"><bean:write name="searchList" property="requestStatus"/></td>
										
										<bean:define id="status" name="searchList" property="requestStatus" type="java.lang.String" />
										<bean:define id="meetingId" name="searchList" property="icpMeetingId" type="java.lang.String"/>
										<% if(status.equalsIgnoreCase("Approved")){	%>
											<td class="listCellBg"><input name="viewButton" type="button" class="oneBtn" value="view" onclick="javascript:location.href('listAdminOrg.do?method=viewOrg&icpMeetingId=<%=meetingId%>');"/>												
											<%
											}
											else if(status.equalsIgnoreCase("Rejected")){
											 %>
											<td class="listCellBg"><input name="viewButton" type="button" class="twoBtn" value="Edit" onclick="javascript:location.href('ICPOrgListApp.do?process=edit&icpMeetingId=<%=meetingId%>');"/>												
											<%	}
											else{	%>
											<td class="listCellBg"><input name="viewButton" type="button" class="oneBtn" value="view" onclick="javascript:location.href('listAdminOrg.do?method=viewOrg&icpMeetingId=<%=meetingId%>');" />														
										<%	}	%>
										</td>
									  </tr>
									</html:form>
								</logic:iterate>                    
						   </logic:greaterThan>     
						</logic:present>			
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