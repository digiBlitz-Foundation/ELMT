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
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlcutil.HLCCalendarVO"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" >
function onValidate(){
	var path = document.getElementById('fileUpload').value;
	if(path==""){
		alert("Please Upload Competition Result Details");
		document.getElementById('fileUpload').focus();
		return false;
	}
	if(path != ""){
		if(navigator.platform == "Win32" || navigator.platform == "Windows" ){		
			if((path.charAt(0) != "\\" && path.charAt(1) != "\\") && (path.charAt(0) != "/" && path.charAt(1) != "/")){
				if(!path.charAt(0).match(/^[a-zA-z]/)){
					alert("Enter valid File location");
					return false;
				}
				if(path.charAt(1) == "" ||!path.charAt(1).match(/^[:]/) || !path.charAt(2).match(/^[\/\\]/)){
					alert("Enter valid File location");
					return false;
				}
			}
		}
		else if(navigator.platform == "Linux"){
			if(path.charAt(0) != "/"){
				alert("Enter valid File location");
				return false;
			}
			if(path.charAt(0) == "/" && path.charAt(1) == "/"){
				alert("Enter valid File location");
				return false;
			}
		}
	}
	return true;
}

</script>
 <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> 

</head>
<body >
<%! 

String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

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
			<!-- LEFT MENU ENDS HERE -->		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
		<%
		String orgFirstName = (String)session.getAttribute("orgFirstName");
		String orgLastName = (String)session.getAttribute("orgLastName");

			String eventId = (String)session.getAttribute("eventId");
			String riderId = (String)request.getAttribute("riderId");
			String horseMemberId = (String)request.getAttribute("horseMemberId");
			String horseName = (String)request.getAttribute("horseName");
			String divisionId = (String)request.getAttribute("divisionId");
			String evLevel = (String)request.getAttribute("evLevel");
			String chStat = (String)request.getAttribute("championshipStatus");
			
			String horseRecordCount = (String)request.getAttribute("horseRecordCount");
			String riderRecordCount = (String)request.getAttribute("riderRecordCount");
			String horseAge = (String)request.getAttribute("horseAge");
			ArrayList horseDetails = (ArrayList)request.getAttribute("horseDetails");
			ArrayList riderDetails = (ArrayList)request.getAttribute("riderDetails");
			String eventLevelName = (String)request.getAttribute("eventLevelName");
			String eventTypeName = (String)request.getAttribute("eventTypeName");

			ArrayList horseValidationDetails = (ArrayList)request.getAttribute("horseValidationDetails");
			ArrayList riderValidationDetails = (ArrayList)request.getAttribute("riderValidationDetails");

			ArrayList objProCalList = (ArrayList)request.getAttribute("selectEventDetails");
			String divisionName = divisionId.substring((1+(divisionId.indexOf("|"))),divisionId.length());
		%>
	 <html:form method="post" action="/upload.do" enctype="multipart/form-data" onsubmit="return onValidate();" >
			<input type="hidden" name="cmd" value="upload" />
 			<input type="hidden" name="riderId" value="<%=riderId%>" />
			<input type="hidden" name="eventId" value="<%=eventId%>" />
			<input type="hidden" name="horseMemberId" value="<%=horseMemberId%>" />
			<input type="hidden" name="divId" value="<%=divisionId%>" />
			<input type="hidden" name="evLevel" value="<%=evLevel%>" />
			<input type="hidden" name="chStat" value="<%=chStat%>" />
			<input type="hidden" name="horseName" value="<%=horseName%>" />
			
	<table width="100%" cellpadding="0" cellspacing="1" border="0">
		<tr>
			<td colspan="7" class="tblMainHead">Selected Event Details:</td>
		</tr>
		<tr>
			<td class="tblRowHead">Begin Date </td>
			<td class="tblRowHead">End Date </td>
			<td class="tblRowHead">Event Title</td>
			<td class="tblRowHead">Organizer Name</td>
			<td class="tblRowHead">Area Code</td>
			<td class="tblRowHead">Location</td>
			<td class="tblRowHead">Status</td>
		</tr>
		<%
			HLCCalendarVO calVO = new HLCCalendarVO();
			if(objProCalList!=null && objProCalList.size()!=0){
			Iterator itr =objProCalList.iterator();
        		while(itr.hasNext()){
					calVO =(HLCCalendarVO)itr.next();
					String evId = calVO.getEventId();
					String beginDate=dateFormat(calVO.getBeginDate());
					String endDate=dateFormat(calVO.getEndDate());
					String eventTitle=calVO.getEventTitle();
					String orgId=calVO.getOrganizerId();
					String areaCode=calVO.getAreaCode();
					String areaName=calVO.getAreaName();
					String stateName=calVO.getStateName();
					String areaChApprovStat=calVO.getOrgApprovalStatus();
					String status=calVO.getStatus();
		%>
<tr>
							<td class="listCellBg"><%=beginDate%></td>
							<td class="listCellBg"><%=endDate%></td>
							<td class="listCellBg"><a href="calender.do?method=eventView&eventId=<%=eventId%>"><%=eventTitle%></a></td>
							<td class="listCellBg"><%=orgFirstName%>&nbsp;<%=orgLastName%></td>
							<td class="listCellBg"><%=areaCode%></td>
							<td class="listCellBg"><%=stateName%></td>
							<td class="listCellBg"><%=status%>
							</td>
							</tr>		<%}}else{%>
		<tr>
			<td colspan="7" class="listCellBg"><strong>No records are available.</strong></th>
		</tr>
		<%}%>
		</table>
		<table width="100%" cellpadding="0" cellspacing="1" border="0">
		<tr>
			<td colspan="3" class="tblMainHead">Event Type:</td>
			<td colspan="4" class="tblMainHead"><%=eventTypeName%></td>
		</tr>
		<tr>
			<td colspan="3" class="tblMainHead">Event Level:</td>
			<td colspan="4" class="tblMainHead"><%=eventLevelName%></td>
		</tr>
		<tr>
			<td colspan="3" class="tblMainHead">Event Division:</td>
			<td colspan="4" class="tblMainHead"><%=divisionName%></td>
		</tr>
		<tr>
			<td colspan="3" class="tblMainHead">Horse Member ID:</td>
			<td colspan="4" class="tblMainHead"><%=horseMemberId%></td>
		</tr>
		<tr>
			<td colspan="3" class="tblMainHead">Horse Name:</td>
			<td colspan="4" class="tblMainHead"><%=horseName%></td>
		</tr>
			<tr>
				<td colspan="7" class="tblRowHead">Horse Validation Record Vs Available Validation Criteria</td>
			</tr>
			<tr>
				<td class="tblRowHead">&nbsp;</td>
				<td class="tblRowHead">Jump Penalties</td>
				<td class="tblRowHead">Time Penalties</td>
				<td class="tblRowHead">Rank Details</td>
				<td class="tblRowHead">Horse Age</td>
				<td class="tblRowHead">Membership Type</td>
				<td class="tblRowHead">Event Division</td>
			</tr>
			<%
				System.out.println("horseDetails.size(): "+horseDetails.size());
				if(horseDetails!=null && horseDetails.size()!=0){
					Iterator itr = horseDetails.iterator();
					while(itr.hasNext()){
						String hDet[] = (String[])itr.next();
                        
                        String horseMembId = hDet[0];
                        String colorCode = hDet[1];
                        String jumpPenalties = hDet[2];
                        String timePenalties = hDet[3];
                        String finalPoints = hDet[4];
                        String membTypeId = hDet[5];
						String membTypeName = hDet[8];
						
			%>
			<tr>
				<td class="listCellBg"><strong>Horse Record:</strong></td>
				<td class="listCellBg"><%=nullCheck(jumpPenalties)%></td>
				<td class="listCellBg"><%=nullCheck(timePenalties)%></td>
				<td class="listCellBg"><%=nullCheck(finalPoints)%></td>
				<td class="listCellBg"><%=nullCheck(horseAge)%></td>
				<td class="listCellBg"><%=nullCheck(membTypeName)%></td>
				<td class="listCellBg"><%=nullCheck(divisionName)%></td>
			</tr>
			<%		}
				}else{
			%>
			<tr>
				<td class="listCellBg"><strong>Horse Record:</strong></td>
				<td class="listCellBg" colspan="6"><div align="center"><strong>No Records Found</strong></div></td>
			</tr>
			<%
				}
				if(horseValidationDetails!=null && horseValidationDetails.size()!=0){
                    Iterator itv = horseValidationDetails.iterator();
                    while(itv.hasNext()){
                        String vDet[] = (String[])itv.next();
						String userTypeId = vDet[0];
						String evTypeId = vDet[1];
						String evLevelId = vDet[2];
						String eventDivisionId = vDet[3];
						String membershipTypeName = vDet[4];
						String minAge = vDet[5];
						String eventLevelRank = vDet[6];
						String qualificationPeriod = vDet[7];
						String minRank = vDet[8];
						String maxRank = vDet[9];
						String minCount = vDet[10];
						String jumpPenalty = vDet[11];
						String timePenalty = vDet[12];
						String membershipTypeId = vDet[13];
						String priority = vDet[16];
						String dvName = vDet[14];
						String maxAge = vDet[15];
			%>
			<tr>
				<td class="listCellBg"><div class="labelTabHead"><strong>Eligibility Criteria:</strong></div></td>
				<td class="listCellBg"><%=nullCheck(jumpPenalty)%></td>
				<td class="listCellBg"><%=nullCheck(timePenalty)%></td>
				<td class="listCellBg"><%=nullCheck(minRank)%>&nbsp;-&nbsp;<%=nullCheck(maxRank)%></td>
				<td class="listCellBg"><%=nullCheck(minAge)%>&nbsp;-&nbsp;<%=nullCheck(maxAge)%></td>
				<td class="listCellBg"><%=nullCheck(membershipTypeName)%></td>
				<td class="listCellBg"><%=nullCheck(dvName)%></td>
			</tr>
			<tr>
				<td colspan="4" class="tblMainHead">Horse Record Count:</td>
				<td colspan="3" class="tblMainHead"><%=horseRecordCount%></td>
			</tr>
			<tr>
				<td colspan="4" class="tblMainHead">Minimum Record Count For Qualification:</td>
				<td colspan="3" class="tblMainHead"><%=minCount%></td>
			</tr>
			<%}}else{%>

			<tr>
				<td class="listCellBg"><div class="labelTabHead"><strong>Eligibility Criteria:</strong></div></td>
				<td class="listCellBg" colspan="6"><div align="center"><strong>No Records Found</strong></div></td>
			</tr>
			<%}%>
			</table>
			<table width="100%" cellpadding="0" cellspacing="1" border="0">
			<tr>
				<td colspan="7" class="tblRowHead">Rider Validation Record Vs Available Validation Criteria</td>
			</tr>
			<tr>
				<td class="tblRowHead">&nbsp;</td>
				<td class="tblRowHead">Time Penalties</td>
				<td class="tblRowHead">Rank Details</td>
				<td class="tblRowHead">Membership Type</td>
				<td class="tblRowHead">Event Division</td>
			</tr>

			<%
				if(riderDetails!=null && riderDetails.size()!=0){
					Iterator itr = riderDetails.iterator();
					while(itr.hasNext()){
						String hDet[] = (String[])itr.next();
						String rEventId = hDet[0];
						String rEventTypeId = hDet[1];
						String rEventDivisionId = hDet[2];
						String rFinalPoints = hDet[3];
						String rJumpPenalties = hDet[4];
						String rTimePenalties = hDet[5];
						String rMembershipTypeId = hDet[6];
						String rMembershipTypeName = hDet[7];
			%>
			<tr>
				<td class="listCellBg"><strong>Rider Record:</strong></td>
				<td class="listCellBg"><%=nullCheck(rTimePenalties)%></td>
				<td class="listCellBg"><%=nullCheck(rFinalPoints)%></td>
				<td class="listCellBg"><%=nullCheck(rMembershipTypeName)%></td>
				<td class="listCellBg"><%=nullCheck(divisionName)%></td>
			</tr>

			<%}}else{%>
			<tr>
				<td class="listCellBg"><strong>Rider Record:</strong></td>
				<td class="listCellBg" colspan="4"><div align="center"><strong>No Records Found</strong></div></td>
			</tr>
			<%}
				if(riderValidationDetails!=null && riderValidationDetails.size()!=0){
					Iterator itv = riderValidationDetails.iterator();
					while(itv.hasNext()){
						String vDet[] = (String[])itv.next();
						String rUserTypeId = vDet[0];
						String rEvTypeId = vDet[1];
						String rEvLevelId = vDet[2];
						String rEventDivisionId = vDet[3];
						String rMembershipTypeName = vDet[4];
						String rMinAge = vDet[5];
						String rEventLevelRank = vDet[6];
						String rQualificationPeriod = vDet[7];
						String rMinRank = vDet[8];
						String rMaxRank = vDet[9];
						String rMinCount = vDet[10];
						String rJumpPenalty = vDet[11];
						String rTimePenalty = vDet[12];
						String rMembershipTypeId = vDet[13];
						String rPriority = vDet[16];
						String rDivName = vDet[14];
						String rMaxAge = vDet[15];
			%>
			<tr>
				<td class="listCellBg"><div class="labelTabHead"><strong>Eligibility Criteria:</strong></div></td>
				<td class="listCellBg"><%=nullCheck(rTimePenalty)%></td>
				<td class="listCellBg"><%=nullCheck(rMinRank)%>&nbsp;-&nbsp;<%=nullCheck(rMaxRank)%></td>
				<td class="listCellBg"><%=nullCheck(rMembershipTypeName)%></td>
				<td class="listCellBg"><%=nullCheck(rDivName)%></td>
			</tr>
			<tr>
				<td colspan="3" class="tblMainHead">Rider Record Count:</td>
				<td colspan="2" class="tblMainHead"><%=riderRecordCount%></td>
			</tr>
			<tr>
				<td colspan="3" class="tblMainHead">Minimum Record Count For Qualification:</td>
				<td colspan="2" class="tblMainHead"><%=rMinCount%></td>
			</tr>

			<%}}else{%>
			<tr>
				<td class="listCellBg"><div class="labelTabHead"><strong>Eligibility Criteria:</strong></div></td>
				<td class="listCellBg" colspan="4"><div align="center"><strong>No Records Found</strong></div></td>
			</tr>
			<%}%>
			<tr>
			<td colspan="7" align="center" class="listCellBg"><a href="OEEAddTrainer.do?process=initTrainer&horseMemberId=<%=horseMemberId%>&eventTypeId=<%=eventId%>&horseName=<%=horseName%>" class="linkFive">Change Event & Divisional Details</a>&nbsp;&nbsp;<a href="OEEDemo.do?process=UserListing" class="linkFive">Upgrade or Edit Membership Details</a></td>
			</tr>
			  <tr>
				 <td class="listCellBg"> Result File:</td>
				 <td class="listCellBg" colspan="6">
					<html:file  property="fileUpload" styleClass="textboxOne" size="18" />	
					<span class="asterisk">*</span>
				 </td>
			  </tr>
			  <tr>
				 <td colspan="7" class="alignCenter">
				 <input type="submit" name="redir" id="redir" value="Upload & Select Another Horse" class="gradBtn"/>
				 <input type="submit" name="redir" id="redir" value="Upload & Proceed To Payment" class="gradBtn" />
				 </td>
			  </tr>
			  
		</table>
			  </html:form> 
	<!-- CONTENTS END HERE -->			</td>
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