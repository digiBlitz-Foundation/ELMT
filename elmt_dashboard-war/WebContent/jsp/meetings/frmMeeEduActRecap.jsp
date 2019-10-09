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
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcmro.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmRecapValid.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 



<script language="javascript">


function postData(){
if(document.frmMeeEduActRecap.activityName.value!=""){
 
	frmMeeEduActRecap.recapProcess.value = "initRecapOrgSelect";
	//alert(frmRewalList.eventProcess.value);
    frmMeeEduActRecap.method="post";
    frmMeeEduActRecap.action="recap.do";
    frmMeeEduActRecap.submit();
 
}
}
</script>

</head>

<%
//session.setAttribute("MemberId","100001");

String memberId = (String) session.getAttribute("memberId");


if(memberId==null){
memberId = "Memebr Id Not Exist";
response.sendRedirect("index.jsp");
}


String meetingId = (String)request.getAttribute("meetingId");
if(meetingId==null)
meetingId = "";

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
				address2 = "";
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
				fax_no = "";
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
						Meetings: <span class="styleBoldTwo"> Educational Activity Recap Form</span>
					</td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp"><strong>User, please take your time and register to avail the privileges that accompanies with it.</strong> 
					 
					<br />
				  <strong>Note:</strong>Upon registration of any Educational Activity please return this Activity Recap Form, together with all original signed
							Release Forms (one for each rider and instructor), any membership applications and fees. DO NOT SEND CASH!
							Forms are to be forwarded as soon as possible after each Activity, but no later than thirty (30) days after the Activity is
							completed or canceled if the Activity is not held. If you have questions, please contact at 703-779-0440 Ext: 3003.
							Mail ALL forms and fees to:Education, 525 Old Waterford Road N.W., Leesburg, Virginia 20176
							Activity Recaps are used to inform and aid the Education and Insurance Committees and Board in making decisions
							about sponsorship of activities. Accuracy and timeliness of the information is important! Please verify that all names and
							dates for the activity are consistent among the forms you have submitted. The Activity Recaps should have the same name and
							dates as your Application. Also, we seek your input so please give us your comments on the back of this form.
					  <br />
					</td>
				  </tr>
				  <tr>
					<td>
					
						<form name="frmMeeEduActRecap" action="recap.do" onsubmit="return myvalidate();">
						
							
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						 <tr class="rowHead">
							<td colspan="2" class="tblRowHead">Required fields are marked with an asterisk* </td>
							</tr>
						  <tr> 
							<td colspan="2" class="tblRowHead"> Basic Information: </td>
						  </tr>
						 	
						  <tr> 
							<td class="tableLeft">Name Of Activity:</td>
							<td class="tableRight">
							<select name="activityName" id="selActivityId" class="selectboxOne" onchange="postData();" >
							<option selected="selected" value="">Select One</option>
							<%
									SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
									String meetingIdVal ="";
									String meetingName ="";
									ArrayList vPendingAds = (ArrayList)session.getAttribute("displayApprovedDetails");
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
															 meetingIdVal =	objActDet.getActivityMeetingId();
															 if(meetingId.equals(meetingIdVal)){
			
					%>
							<option value="<%=meetingIdVal%>" selected="selected"><%=meetingName%></option>
								 <%
								 }
								 else{
								 %>
 							<option value="<%=meetingIdVal%>" ><%=meetingName%></option>
								 <%
								 }
								 }
							  }
							}
							%>
						</select>
						<%String actDate = "";
							//Date actDate = null;
							String location = "";
							String getUseaAreaId = "";
							String finalArea ="";
							String areaName="";
							String areaId ="";
							HLCActivityOrganizerVO objActDetSelect = (HLCActivityOrganizerVO)request.getAttribute("ActivityOrganizerVODet");
								//out.println("Value:" + objActDetSelect);
								if(objActDetSelect!=null) {
											location = objActDetSelect.getLocation();
											getUseaAreaId = objActDetSelect.getUseaAreaId();
											//out.print("getUseaAreaId" + getUseaAreaId);
												if(objActDetSelect.getActivityDate()!=null){
												actDate = sdf.format(objActDetSelect.getActivityDate());
												}
										 
												
												ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
												if(areaDetails!=null && areaDetails.size()!=0){
														Iterator areaIt = areaDetails.iterator();
														while(areaIt.hasNext()){
																String[] areaDet =(String[])areaIt.next();
																areaId = areaDet[0];
																areaName = areaDet[2];
																//out.print("areaName" + areaId);
																	if(areaId.equals(getUseaAreaId)){
																		finalArea = areaName;
																	}
														}
												}
							}
							                  
						%>
						<span class="asterisk">*</span>
						</td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Date(s)held(MM/DD/YYYY): </td>
							<td class="tableRight">
							<input name="textbox7" type="text" class="textboxOne" size="25" readonly value="<%=actDate%>" />
							</td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Was This a Data Change :</td>
							<td class="tableRight">
								<input name="activityDateChangeStatus" id="radio1" type="radio" checked="checked" value="yes" />Yes
								<input name="activityDateChangeStatus" id="radio1" type="radio" value="no" />No 
							</td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Location Of Activity :</td>
							<td class="tableRight">
							<input name="textbox8" type="text" class="textboxOne" size="25" readonly value="<%=location%>" /></td>
						  </tr>
						                                                                     
						  
						  <tr> 
							<td class="tableLeft">Area:</td>
							<td class="tableRight">
							<input name="textbox8" type="text" class="textboxOne" size="25" readonly value="<%=finalArea%>" /></td>
						  </tr>
						  <tr>
							<td colspan="2" class="tblRowHead">Organizer Information</td>
						  <tr>
							<td class="tableLeft"> Memberl ID:</td>
							<td class="tableRight">
							<input name="textbox6" type="text" class="textboxOne" size="25" readonly value="<%=memberId%>" /></td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Organizer First Name:</td>
							<td class="tableRight">
							<input name="textbox62" type="text" class="textboxOne" size="25" readonly value="<%=first_name%>" />
							</td>
						  </tr>
						    <tr>
							<td class="tableLeft"> Organizer Middle Name:</td>
							<td class="tableRight">
							<input name="textbox62" type="text" class="textboxOne" size="25" readonly value="<%=middle_name%>" />
							</td>
						  </tr>
						  
						    <tr>
							<td class="tableLeft"> Organizer Last Name:</td>
							<td class="tableRight">
							<input name="textbox62" type="text" class="textboxOne" size="25" readonly value="<%=last_name%>"/>
							</td>
						  </tr>
						  
						  <tr>
							<td class="tableLeft"> Address1:</td>
							<td class="tableRight">
							<input name="textbox63" type="text" class="textboxOne" readonly size="25"value="<%=address1%>" /></td>
						  </tr>
							 <tr>
							<td class="tableLeft"> Address2:</td>
							<td class="tableRight"><input name="textbox63" type="text" class="textboxOne" readonly size="25" value="<%=address2%>" /></td>
						  </tr>						  
						  <tr> 
							<td class="tableLeft">Country:</td>
							<td class="tableRight"><input name="textbox32" type="text" class="textboxOne" readonly size="25"  value="<%=country%>"/></td>
						  </tr>
						  <tr> 
							<td height="27" class="tableLeft">State : </td>
							<td class="tableRight"><input name="textbox6321" type="text" class="textboxOne" readonly size="25" value="<%=state%>" /></td>
						  </tr>
						  <tr> 
							<td class="tableLeft">City:</td>
							<td class="tableRight"><input name="textbox632" type="text" class="textboxOne" readonly size="25" value="<%=city%>"/></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Zip: </td>
							<td class="tableRight"><input name="textbox633" type="text" class="textboxOne"  readonly size="25" value="<%=zip%>"/></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Phone:</td>
							<td class="tableRight"><input name="textbox634" type="text" class="textboxOne" readonly size="25" value="<%=phone_no%>"/></td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Fax: </td>
							<td class="tableRight"><input name="textbox635" type="text" class="textboxOne" readonly size="25" value="<%=fax_no%>"/></td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Email ID: </td>
							<td class="tableRight"><input name="textbox635" type="text" class="textboxOne" readonly size="25" value="<%=email_id%>"/></td>
						  </tr>
						  <tr>
							<td colspan="2" class="tblRowHead"> Activity Information </td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number Of Riders Participating:</td>
							<td class="tableRight"><input name="noOfRiders" id="ridernum" type="text" class="textboxOne" maxlength="7" size="25" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of Instructors:</td>
							<td class="tableRight"><input name="noOfInstructors" id="instnum"  type="text" class="textboxOne" maxlength="7" size="25" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of Current members:</td>
							<td class="tableRight"><input name="noOfCurrentMembers" id="uesanum"  type="text" class="textboxOne" maxlength="7" size="25" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of New members:</td>
							<td class="tableRight"><input name="noOfNewMembers" id="newhlcnum" type="text" class="textboxOne" maxlength="7" size="25" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Number of Renewing members:</td>
							<td class="tableRight"><input name="noOfRenewingMembers" id="renewhlcnum"  type="text" class="textboxOne" maxlength="7" size="25" />
						    <span class="asterisk">*</span></td>
						  </tr>
						   <tr>
							<td colspan="2" class="tblRowHead"> New User Member Information </td>
						  </tr>
						  <tr>
							<td class="tableLeft">Individual Full members:</td>
							<td class="tableRight"><input name="noOfFullMembers" id="hlcfullnum" type="text" class="textboxOne" maxlength="7" size="20" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Junior members:</td>
							<td class="tableRight"><input name="noOfJuniorMembers" id="hlcjunum" type="text" class="textboxOne" maxlength="7" size="20" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Non-competing members:</td>
							<td class="tableRight"><input name="noOfNonCompetingMembers" id="noncomnum" type="text" class="textboxOne" maxlength="7" size="20" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Total Amount(<strong>$</strong>):</td>
							<td class="tableRight"><input name="totalAmount" id="totamt" type="text" class="textboxOne"  size="18" />
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td colspan="2" class="tblRowHead"> Comments And Suggestions </td>
						  </tr>
						  <tr>
							<td class="tableLeftTxtArea">Comments about your Activity:</td>
							<td class="tableRight"><textarea  name="comments" id="comments" class="textAreaOne" rows="5"></textarea>
						    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">May we publish all or part of your comments in Eventing USA?</td>
							<td class="tableRight">
								<input name="publishComments" id="radio2"  type="radio" value="yes" />Yes	  
								<input name="publishComments" id="radio2"  type="radio" value="no" /> No
								
								<input type="hidden" name="recapProcess" value="createRecapOrg"/>
							
							    <span class="asterisk">*</span></td>
						  </tr>
						  <tr>
							<td class="tableLeftTxtArea">Suggestions for Educational Activities and/or forms, procedures improvement :</td>
							<td class="tableRight"> 
							  <textarea name="suggestions"  id="suggestions" class="textAreaOne" rows="5"></textarea>
						    <span class="asterisk">*</span>							</td>
						  </tr>
						  <tr> 
							<td colspan="2" class="alignCenter"><input type="submit" value="Submit" class="gradBtn" />&nbsp;&nbsp;&nbsp;
							<input type="button" value="Cancel" class="gradBtn" onclick="javascript:history.back(-1);" /></td>
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