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
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
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
	if(document.organizerList.year.value==""){
		alert("Select a Year");
		document.organizerList.year.focus();
		return false;
	}
	return true;
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
  <tr>
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
  <%!
  		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
		String dateFormat(java.util.Date fieldName){					
		Calendar cal = Calendar.getInstance();
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(fieldName);
		cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						
		int tempDay = gc.get(Calendar.DAY_OF_WEEK);
		String holiday = null;
			switch(tempDay){
			case Calendar.SUNDAY:
				holiday ="SUN";
				break;
			case Calendar.MONDAY:
				holiday ="MON";
				break;
			case Calendar.TUESDAY:
				holiday ="TUE";
				break;
			case Calendar.WEDNESDAY:
				holiday ="WED";
				break;
			case Calendar.THURSDAY:
				holiday ="THU";
				break;
			case Calendar.FRIDAY:
				holiday ="FRI";
				break;
			case Calendar.SATURDAY:
				holiday ="SAT";
				break;
			}
			String dispDate = "N/A";
			if(fieldName!=null ){
				dispDate = sd1.format(cal.getTime()).toString()+" ("+holiday+")";
			}
			return dispDate;
		}
  %>
				
<table  border="0" width="100%" cellpadding="0" cellspacing="0"  align="center" class="tblInnerContainer">
  <tr>
    <td colspan="5" class="tblMainHead">
	Online Entries Provisional Calendar: <span class="styleBoldTwo">Organizer List</span></td>
	</tr><tr>
	<td colspan="5" >
	<strong>&nbsp; Click on Event Id to set/view Price Details for that Event.</strong></td>
  </tr>
 <tr>
 	<td>
<%
	java.util.Date orgDate = new java.util.Date();
	int currentYear = 1900+orgDate.getYear();
	String selYear = (String)request.getAttribute("selYear");
	String acStatus = (String)request.getAttribute("acStatus");
	String approveStatus = (String)request.getAttribute("approveStatus");
	String dispAppStatus = "";
	if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveSuccess")){
		dispAppStatus = "Approval Status Changed Successfully";
	} else if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveFailed")){
		dispAppStatus = "Approval Status Cannot be Changed";
	}
	int selectedYear = 0;
	if(selYear!=null && selYear.trim().length()!=0){
		selectedYear = Integer.parseInt(selYear);
	}
%>	
		 <table border="0" cellpadding="3" align="center" cellspacing="1" class="formLayout">
		<form name="organizerList" action="OECalendar.do" method="post" onsubmit="return onValidate();">
		<input type="hidden" name="cmd" value="viewList" />
		<%if(approveStatus!=null && approveStatus.trim().length()!=0){%>
		<tr>
		  <td height="25" colspan="8" class="styleError"><%=dispAppStatus%></td>
		</tr>
		<%}%>
		<tr>
		<td colspan="8" align="left"><strong>Year:</strong> &nbsp;
		<select name="year" id="year" class="selectboxOne" >
		<option selected="selected" value="" >Select One</option>
		<%
			for(int i=2000; i<(currentYear+2); i++){
				if(selectedYear!=0 && selectedYear==i){
		%>
		<option value="<%=i%>" selected="selected"><%=i%></option>
		<%}else{%>
		<option value="<%=i%>"><%=i%></option>
		<%
			}
		}
		%>
		</select><span class="asterisk">*</span>
		
				<!--&nbsp;&nbsp;<strong>Area Chair Status:</strong> &nbsp;
		<select name="acStatus" id="acStatus" class="selectboxOne" >
			<option selected="selected" value="" >Select One</option>
			<%
				String[] status = new String[]{"Approved","Pending","Rejected"};
				for(int k =0; k<status.length; k++){
					if(acStatus!=null && acStatus.equalsIgnoreCase(status[k])){
			%>
			<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
			<%}else{%>
			<option value="<%=status[k]%>"><%=status[k]%></option>
			<%}}%>
		</select>&nbsp;&nbsp;-->
		<input type="submit" name="submit" value="Submit" class="oneBtn"/>				</td>
			</tr>
			</form>
		  <tr>
			<td class="tblRowHeadTwo">Event Date</td>
			<td class="tblRowHeadTwo">Event Title</td>
			<td class="tblRowHeadTwo">Event Id</td>
			<td class="tblRowHeadTwo">Area Name</td>
			<td class="tblRowHeadTwo">Location</td>
			<td class="tblRowHeadTwo">Edit</td>
			<td class="tblRowHeadTwo">Approve</td>
			<td class="tblRowHeadTwo">Renewal Status</td>
			<td class="tblRowHeadTwo">Status</td>
		   </tr>

			<%
				HLCCalendarVO calVO = new HLCCalendarVO();
				ArrayList organizerList = (ArrayList)request.getAttribute("organizerList");
				if(organizerList!=null && organizerList.size()!=0){
					Iterator itr = organizerList.iterator();
					while(itr.hasNext()){
						calVO = (HLCCalendarVO)itr.next();
						String provisionId = calVO.getCalenderId();
						String startDate = dateFormat(calVO.getBeginDate());
						String endDate = dateFormat(calVO.getEndDate());
						String eventTitle = calVO.getEventTitle();
						String areaName = calVO.getAreaName();
						String stateName = calVO.getStateName();
						String orgStatus = calVO.getOrgApprovalStatus();
						String renewalStatus = calVO.getRenewStat().toString();
						System.out.println("renewalStatus"+renewalStatus);
						String eventId = calVO.getEventId();
						String areaStatus = calVO.getArearChairApproStatus();
						String rStat = "";
						if(renewalStatus.equalsIgnoreCase("true")){
						 rStat = "No";
						 }
						else {
						rStat = "Yes";}
						
			%>
		  <tr>
			<td bgcolor="#E3E1D2" class="alignCenter"><%=startDate%></td>
			<td bgcolor="#E3E1D2" class="alignCenter"><a href="OECalendar.do?cmd=singleEventView&provisionalId=<%=provisionId%>"><%=eventTitle%></a></td>	
			<td bgcolor="#E3E1D2" class="alignCenter"><a href="OEEAddPrice.do?cmd=initOrgView&eventId=<%=eventId%>"><%=eventId%></a></td>	
			<td bgcolor="#E3E1D2" class="alignCenter"><%=areaName%></td>	
			<td bgcolor="#E3E1D2" class="alignCenter"><%=stateName%></td>	
			<td bgcolor="#E3E1D2" class="alignCenter"><input type="button" name="process" value="Edit" class="oneBtn" onclick="location.href='calender.do?method=initUpdate&provisionalId=<%=provisionId%>'"/></td>
			<td bgcolor="#E3E1D2" class="alignCenter"><input type="button" name="process" value="Approve" class="oneBtn" onclick="location.href='OECalendar.do?cmd=singleEventApprove&provisionalId=<%=provisionId%>'" /></td>
			<td bgcolor="#E3E1D2" class="alignCenter"><%=rStat%></td>
			<td bgcolor="#E3E1D2" class ="alignCenter"><%=areaStatus%></td>
		   </tr>
			<%
				}
			}else{
			%>
	  		<tr>
			<td height="19" bgcolor="#E3E1D2" colspan="9" align="center"><strong>No Records Found</strong></td>
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