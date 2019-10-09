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
<%@ page import="com.hlcutil.*"%>
<%@ page import="com.hlcutil.HLCCompRegistrationVO"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script language="javascript" type="text/javascript">
function onValidate(){
	if(document.myform.year.value==""){
		alert("Select a Year");
		document.myform.year.focus();
		return false;
	}
	}

</script>
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
  <tr><h1></h1>
    <td class="tableCommonBg">
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
 			
<table  border="0" width="100%" cellpadding="0" cellspacing="0"  align="center" class="tblInnerContainer">
  <tr>
    <td colspan="5" class="tblMainHead">
	Online Entries : <span class="styleBoldTwo">My Event Registration Details </span></td>
  </tr>
  
  <%
	java.util.Date orgDate = new java.util.Date();
	int currentYear = 1900+orgDate.getYear();
	String yearStr = (String)request.getAttribute("year");	
	System.out.println("yearStr : "+yearStr);
	int selectedYear = 0;
	if(yearStr!=null && yearStr.trim().length()!=0){
		selectedYear = Integer.parseInt(yearStr);
	}
		
%>	
 <tr>
 	<td>
		 <table border="0" cellpadding="3" align="center" cellspacing="1" class="formLayout">
		<form name="myform" id="myform" action="ParticipantList.do" method="post" onsubmit="return onValidate();">
		<input type="hidden" name="cmd" value="partList"/>		
		<tr>
		<td colspan="8" align="center"><strong>Year:</strong>
		<select name="year" id="year" class="selectboxOne">
		<option selected="selected" value="" >Select One</option>
		<%
			for(int i=2000; i<(currentYear+2); i++){
				if(selectedYear!=0 && selectedYear==i){
                        %>
		<option value="<%=i%>" selected="selected"><%=i%></option>
		<%}else{%>
		<option value="<%=i%>"><%=i%></option>
		<%}}%>
		</select><span class="asterisk">&nbsp;*</span>	
		<input type="submit" name="submit" value="Submit" class="oneBtn"/>				</td>
			</tr>
			</form>
		  <tr>
			<td class="tblRowHeadTwo">MemberID</td>
			
			<td class="tblRowHeadTwo">Event Id </td>
			<td class="tblRowHeadTwo">Event Type </td>
			<td class="tblRowHeadTwo">Event Level</td>
			
			<td class="tblRowHeadTwo">Status</td>
			<td class="tblRowHeadTwo">View</td>
					
		   </tr>
			<%
				HLCCompRegistrationVO compVO = new HLCCompRegistrationVO();
				ArrayList myCompRegList = (ArrayList)request.getAttribute("myCompRegDetails");
				if(myCompRegList!=null && myCompRegList.size()!=0){
					Iterator itr = myCompRegList.iterator();
					while(itr.hasNext()){
						compVO = (HLCCompRegistrationVO)itr.next();
						String registrationId = compVO.getRegistrationId();
						String horseMemberId = compVO.getHorseMemberId();
						String riderId = compVO.getRiderMemberId();
						String eventId = compVO.getEventId();
						String eventType = compVO.getEventType();
						String eventLevel = compVO.getEventLevel();
						String division = compVO.getEventDivision();
						String status = compVO.getQualifystatus();
								
			%>
		  <tr>
			<td bgcolor="#E3E1D2" class="alignCenter"><%=riderId%></td>
			
			<td bgcolor="#E3E1D2" class="alignCenter"><%=eventId%></td>		
			<td bgcolor="#E3E1D2" class="alignCenter"><%=eventType%></td>	
			<td bgcolor="#E3E1D2" class="alignCenter"><%=eventLevel%></td>	
			
			<td bgcolor="#E3E1D2" class="alignCenter"><%=status%></td>		
			<td bgcolor="#E3E1D2" class="alignCenter"><input type="button" name="process" value="View" class="oneBtn" onclick="location.href='ParticipantList.do?cmd=myCompRegView&registrationId=<%=registrationId%>'" /></td>			
		   </tr>
			<%
				}
			}else{
			%>
	  		<tr>
			<td height="19" bgcolor="#E3E1D2" colspan="8" align="center"><strong>No Records Found</strong></td>
           </tr>
		   <%}%>
			
	  </table>		  </form>
	  
	
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