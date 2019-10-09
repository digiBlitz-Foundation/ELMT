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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
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
function myValidate(){
	if(document.approveUStaffList.qualifyStatus.value==""){
		alert("Select any Approval Status");
		document.approveUStaffList.qualifyStatus.focus();
		return false;
	}
	if(document.approveUStaffList.quaComments.value.length>1024){
		alert("Comments cannot exceed 1024 characters");
		document.approveUStaffList.quaComments.focus();
		return false;
	}
	return true;
}
</script>
</head>
<%! 

String  nullCheck(String fieldName){
	String retValue = "<b>N/A</b>";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

<%! 

String  nullCheck1(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
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
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
<table border="0" width="100%" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="2" class="tblMainHead">
		 Online Entries Organizer View </td>
  </tr>
  <tr>
  	<td>
			<table border="0" width="100%" cellpadding="0" align="center" cellspacing="0" class="formLayout">
   <%
		HLCCompRegistrationVO regVO = new HLCCompRegistrationVO();
		
		regVO = (HLCCompRegistrationVO)request.getAttribute("singleCompRegDetails");
		
		String registrationId = regVO.getRegistrationId();
		String qualiStatus = regVO.getQualifystatus();
		String eventTitle = regVO.getEventTitle();
		String eventId = regVO.getEventId();
		String eventTyp = regVO.getEventType();
		String orgId = regVO.getOrganizerId();
		int compYear = regVO.getCompetitionYear();
		String eventLevel = regVO.getEventLevel();
		String evtDivName = regVO.getEventDivision();
        String evtSubDivName = regVO.getEventSubDivision();
        String horseId = regVO.getHorseMemberId();
		String horseName = regVO.getHorseName();
		String riderId = regVO.getRiderMemberId();
        String riderFstName = regVO.getRiderFirstName();
		String riderLastName = regVO.getRiderLastName();				
		String ownerId = regVO.getOwnerHLCId();
		String ownerFstName = regVO.getOwnerFirstName();
		String ownerLastName = regVO.getOwnerLastName();
		String qualifyPath = regVO.getQualFilePath();
		int lastIndex = qualifyPath.lastIndexOf("\\") ;
				String tempPath ="";
				if(lastIndex!=-1){
				tempPath = qualifyPath.substring(lastIndex+1,qualifyPath.length());
                    }		
		System.out.println("qualifyPath"+qualifyPath);
		System.out.println("tempPath"+tempPath);
		String comments = regVO.getQuaComments();				
	    System.out.println("comments in jsp :"+comments); 
  %>
			
				  <tr>
					<td colspan="2" class="tblRowHead">Approve Competition Registration Details: </td>
				  </tr>
				 <tr>
					<td width="55%" class="tableLeft">Qualify Status</td>
					<td width="45%" class="tableRight"><%=nullCheck(qualiStatus)%></td>
				  </tr>  
				  <tr>
					<td width="55%" class="tableLeft">Event Title:</td>
					<td width="45%" class="tableRight"><%=nullCheck(eventTitle)%></td>
				  </tr>
				   <tr>
				     <td class="tableLeft">Event ID: </td>
				     <td class="tableRight"><%=nullCheck(eventId)%></td>
		      </tr>	
			   <tr>
				     <td class="tableLeft">Event Type: </td>
				     <td class="tableRight"><%=nullCheck(eventTyp)%></td>
		      </tr>	
				  
				   
				   <tr>
				     <td class="tableLeft">Competition Year : </td>
				     <td class="tableRight"><%=compYear%></td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Event Level : </td>
				     <td class="tableRight"><%=nullCheck(eventLevel)%></td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Event Division : </td>
				     <td class="tableRight"><%=nullCheck(evtDivName)%></td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Event Sub Division : </td>
				     <td class="tableRight"><%=nullCheck(evtSubDivName)%></td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Horse ID : </td>
				     <td class="tableRight"><%=nullCheck(horseId)%></td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Horse Name : </td>
				     <td class="tableRight"><%=nullCheck(horseName)%></td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Rider ID : </td>
				     <td class="tableRight"><%=nullCheck(riderId)%></td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Rider Name : </td>
				     <td class="tableRight"><%=nullCheck(riderFstName+" "+riderLastName)%></td>
		      </tr>
			 
			  <tr>
				     <td class="tableLeft">Owner Name: </td>
				     <td class="tableRight"><%=nullCheck(ownerFstName+" "+ownerLastName)%></td>
		      </tr>
			<%
			if(qualifyPath!=null && qualifyPath.trim().length()!=0){
			%>  
			   <tr>
				     <td class="tableLeft">Qualification Proof : </td>
				     <td class="tableRight"><a href="OEMOrgCompReg.do?cmd=uplView&fPath=<%=qualifyPath%>">DownLoad Here</a></td>
		      </tr>
			  <%}%>
			  
			  <form name="approveUStaffList" id="approveUStaffList" action="OEMOrgCompReg.do" method="post" onsubmit="return myValidate()">
			  <input type="hidden" name="cmd" value="compRegApprove" />
			  <input type="hidden" name="registrationId" value="<%=registrationId%>" />
			  <tr>
				     <td class="tableLeft">Approval Status: </td>
				     <td class="tableRight">
					 	<select name="qualifyStatus" id="qualifyStatus" class="selectboxOne" >
							<option selected="selected" value="" >Select One</option>
								<%	String[] status = new String[]{"Approved","Pending","Rejected"};
									for(int k =0; k<status.length; k++){
										if(qualiStatus!=null && qualiStatus.equalsIgnoreCase(status[k])){
								%>
							<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
								<%}else{%>
							<option value="<%=status[k]%>"><%=status[k]%></option>
								<%}}%>
						</select><span class="asterisk">&nbsp;*</span>	
					</td>
		      </tr>
			  <tr>
				     <td class="tableLeft">Approval Comments: </td>
				     <td class="tableRight"><textarea name="quaComments" id="quaComments"><%=nullCheck1(comments)%></textarea>	</td>
		      </tr>
			  
				   <tr>
					<td colspan="2" align="center">
					<input type="submit" name="appButton" id="appButton" value="Submit" class="gradBtn"  />
					<input type="button" onclick="javascript:history.back(-1);" value="Back" class="gradBtn"  />
					</td>
				  </tr>
				  </form>
			</table>
	</td>
  </tr>
  
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

</body>
</html>