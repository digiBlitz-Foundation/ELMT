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
<%@ page import="java.math.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script type="text/javascript" >

 
            function chk(){
	
//==================================== For Radio Button ==============================	
			
		 
				if(document.frmMeeAdminEduActRegiApprove.comments.value==""){
				alert("Enter a comments");
				document.frmMeeAdminEduActRegiApprove.comments.focus();
				return false;
				}
				if(document.frmMeeAdminEduActRegiApprove.comments.value.indexOf(' ')==0){
					alert("Please avoid  unwanted white space");
					document.frmMeeAdminEduActRegiApprove.comments.focus();
					return false;
				}

				if(document.frmMeeAdminEduActRegiApprove.comments.value.indexOf('  ')!=-1){
					alert("Please avoid  unwanted white space");
					document.frmMeeAdminEduActRegiApprove.comments.focus();
					return false;
				}
				
				if(document.frmMeeAdminEduActRegiApprove.comments.value.length>2000){
					alert("Comments is out of range");
					document.frmMeeAdminEduActRegiApprove.comments.focus();
					return false;
				}
				
	return true;
}
 
 


</script>
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
				<table width="100" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
				  <tr>
					<td>
<%
SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
//String memberId = (String)request.getAttribute("memberId");
//if(memberId==null)
//memberId = "NA";
ArrayList listContact = (ArrayList) request.getAttribute("DisplaymemberDetails");
	
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
				prefix1 = "NA";
				first_name  = (String)it.next();
				if(first_name==null)
				first_name = "NA";
				middle_name  = (String)it.next();
				if(middle_name==null || middle_name.equals(""))
				middle_name = "NA";
				last_name = (String)it.next();
				if(last_name==null)
				last_name = "NA";
				sufix =  (String)it.next();
				if(sufix==null)
				sufix = "NA";
				email_id  = (String)it.next();
				if(email_id==null)
				email_id = "NA";
				suite =  (String)it.next();
				if(suite==null)
				suite = "NA";
				address1 =  (String)it.next();
				if(address1==null)
				address1 = "NA";
				address2 = (String)it.next();
				if(address2==null)
				address2 = "NA";
				city = (String)it.next();
				if(city==null)
				city = "NA";
				state =  (String)it.next();
				if(state==null)
				state = "NA";
				country = (String)it.next();
				if(country==null)
				country = "NA";
				zip = (String)it.next();
				if(zip==null)
				zip = "NA";
				phone_no = (String)it.next();
				if(phone_no==null)
				phone_no = "NA";
				mobile_no = (String)it.next();
				if(mobile_no==null || middle_name.equals(""))
				mobile_no = "NA";
				fax_no = (String)it.next();
				if(fax_no==null || middle_name.equals(""))
				fax_no = "NA";
			}
		}
		//out.print("address2" +address2);
%>

							
					<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						<tr>
						<td colspan="2" class="tblMainHead"><strong></strong> Meetings: <span class="styleBoldTwo">Approve Sponsored Educational Activity Registration</span></td>
						</tr>
						<!-- <tr>
							<td colspan="2" class="tblDescrp"><div id="commonBG" class="textCommon" style="height:100px;"> <img src="images/usea_logo.jpg" class="imgFloatLeft" /><strong><br />
					  </strong><br />
					</div></td>
						</tr>-->
					<!--	<tr>
							<td colspan="2">
								 TABS START HERE 										
								<table cellpadding="0" cellspacing="0" border="0" class="container">
									<tr>
										<td id="tabData1" class="tabHighlight" onclick="naviTab('1')">
											<a id="link1" href="javascript:void(0);" class="active"><span class="tabHead">Part A</span></A>
										</td>
										<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
										<td id="tabData2" class="tabLowlight" onclick="naviTab('2')">
											<a id="link2" href="javascript:void(0);" class="inactive"><span class="tabHead">Part B</span></A>
										</td>
										<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
										<td id="tabData3" class="tabLowlight" onclick="naviTab('3')">
											<a id="link3" href="javascript:void(0);" class="inactive"><span class="tabHead">Part C</span></A>
										</td>
										<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
										<td id="tabData4" class="tabLowlight" onclick="naviTab('4')">
											<a id="link4" href="javascript:void(0);" class="inactive"><span class="tabHead">Part D</span></A>
										</td>
									</tr>	
								</table>
								 TABS END HERE 
							</td>
						</tr>-->
						 
						 <tr id="part1" class="holderDivOne" >
						 	<td colspan="2">
							<!--++++++++++++++++++++ Part 1 of the form starts here ++++++++++++++++++++++++++++++ -->	
							<table cellpadding="0" cellspacing="0" border="0" class="formLayout">
								<tr class="rowHead">
							<td colspan="2" class="tabHead">Required fields are marked with an asterisk*</td>
							</tr>
								 <tr> 
									<td colspan="2" class="tblRowHead"> <span class="rowHead">Activity Information: </span></td>
								  </tr>
								  	<%
									
									ArrayList dispDet = (ArrayList)request.getAttribute("DisplayOrgDetails");
										if(dispDet==null && dispDet.size()==0){
										out.print("No records are available");
										}
									HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
									Vector publication = new Vector();
									String actMeetId ="";
									String status="";
									String comments="";
									String tmp="";
									String otherSpecific="";
									String otherFacilities="";
											Iterator it = dispDet.iterator();
											while(it.hasNext()){
											objActDet = (HLCActivityOrganizerVO)it.next();
											publication = (Vector)it.next();
												actMeetId = objActDet.getActivityMeetingId();
												comments = objActDet.getComments();	
												if(objActDet.getActivityDate()!=null){
													tmp = sdf.format(objActDet.getActivityDate());
												}
												otherSpecific = objActDet.getOtherActivityType();
												if(otherSpecific==null || otherSpecific.equals("")){
												otherSpecific = "None";
												}

												otherFacilities= objActDet.getOtherFacilities();
												if(otherFacilities==null || otherFacilities.equals("")){
												otherFacilities = "None";
												}				
												Enumeration enumPub = publication.elements();
												while(enumPub.hasMoreElements()){
												
												String publicationEmail = (String)enumPub.nextElement();
												String mailingFormat =   (String)enumPub.nextElement(); 
												String mailingBy =(String) enumPub.nextElement();
												String mailingSortBy =(String) enumPub.nextElement();
												String  noOfCopies =(String)enumPub.nextElement(); 
												String Status =(String)enumPub.nextElement(); 
												System.out.print("Status:" + Status);
												%>
 <tr> 
									<td width="209" class="tableLeft">Activity Name :</td>
									<th width="291" class="tableRight"><%=objActDet.getActivityName()%></th>
								  </tr>
								  <tr> 
									<td width="209" class="tableLeft">Date of Activity:</td>
									<th width="291" class="tableRight"><%=tmp%></th>
								  </tr>
								   <%
						 				String finalArea ="";
										String areaName="";
										String getUseaAreaId = objActDet.getUseaAreaId();
										//out.print( "getUseaAreaId" + getUseaAreaId);
										ArrayList areaDetails = (ArrayList)request.getAttribute("DispAreaDetails");
										if(areaDetails!=null && areaDetails.size()!=0){
										Iterator areaIt = areaDetails.iterator();
										while(areaIt.hasNext()){
										String[] areaDet =(String[])areaIt.next();
										String areaId = areaDet[0];
									   // out.print( "areaId" + areaId);
										 areaName = areaDet[2];
										 
										if(areaId.equals(getUseaAreaId)){
										   finalArea = areaName;
										 }
									
							  }
							}
							  %>                                                                                 
						
								  <tr> 
									<td class="tableLeft">Area:</td>
									<th class="tableRight"><%=finalArea%>&nbsp;</th>
								  </tr>
								 
								  <tr>
									<td class="tableLeft"> Activity Location:</td>
									<td class="tableRight"><%=objActDet.getLocation()%></td>
								  </tr>
								  <tr>
									<td class="tableLeft"> Country:</td>
									<td class="tableRight"><%=objActDet.getCountry()%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft"> State:</td>
									<td class="tableRight"><%=objActDet.getState()%></td>
								  </tr>
								  <tr>
									<td class="tableLeft"> City:</td>
									<td class="tableRight"><%=objActDet.getCity()%></td>
								  </tr>
								  <tr>
									<td class="tableLeft"> Zip Code:</td>
									<td class="tableRight"><%=objActDet.getZip()%></td>
								  </tr>
								  <tr>
									<td colspan="2" class="tblRowHead">
									 <span class="rowHead">Organizer Information: </span></td>
								  </tr>
				  					<tr> 
									<td class="tableLeft"> Organizer's Member ID: </td>
									<th class="tableRight"><%=objActDet.getActivityOrganizerId()%></th>
								  </tr>
								  <tr>
									<td class="tableLeft">First Name:</td>
									<th class="tableRight"><%=first_name%></th>
								  </tr>
								   <tr>
									<td class="tableLeft">Middle Name:</td>
									<th class="tableRight"><%=middle_name%>&nbsp;</th>
								  </tr>
								   <tr>
									<td class="tableLeft">Last Name:</td>
									<th class="tableRight"><%=last_name%></th>
								  </tr>
								  <tr>
									<td class="tableLeft"> Address1:</td>
									<td class="tableRight"><%=address1%></td>
								  </tr>
								  <tr>
									<td class="tableLeft"> Address2:</td>
									<td class="tableRight"><%=address2%></td>
								  </tr>
								  <tr>
									<td class="tableLeft"> Country:</td>
									<td class="tableRight"><%=country%></td>
								  </tr>
								  <tr>
									<td class="tableLeft"> State:</td>
									<td class="tableRight"><%=state%></td>
								  </tr>          
								  <tr>
									<td class="tableLeft"> City:</td>
									<td class="tableRight"><%=city%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Zip:</td>
									<td class="tableRight"><%=zip%></td>
								  </tr>
								  <tr> 
									<td height="27" class="tableLeft">Phone: </td>
									<td class="tableRight"><%=phone_no%></td>
								  </tr>
								  <tr> 
									<td class="tableLeft"> Fax: </td>
									<td class="tableRight"><%=fax_no%></td>
								  </tr>
								  <tr>
									<td class="tableLeft"> E-Mail: </td>
									<td class="tableRight"><%=email_id%></td>
								  </tr>
							 </table>
							<!--++++++++++++++++++++ Part 1 of the form ends here ++++++++++++++++++++++++++++++ -->
							</td>
						 </tr>
						 
						 <tr id="part2" class="holderDivTwo">
						 	<td colspan="2">
							
							<!--++++++++++++++++++++ Part 2 of the form starts here ++++++++++++++++++++++++++++++ -->	
							<table cellpadding="0" cellspacing="0" border="0" class="formLayout">
							<%
										String activityTypeId = objActDet.getActivityTypeId();
										String activityName1 ="";
										String finalActivity="";
										String id ="";
										ArrayList activityDetails = (ArrayList)request.getAttribute("DisplayActivityTypeDetails");
										if(activityDetails!=null && activityDetails.size()!=0){
										Iterator it1 = activityDetails.iterator();
										while(it1.hasNext()){
										String[] eduDet =(String[])it1.next();
										id = eduDet[0];
										activityName1 = eduDet[1];
										if(id.equals(activityTypeId)){
										  finalActivity = activityName1;
										}
										
																
							  }
							}
							  %>
								   <tr>
									<td class="tableLeft"> Type Of Activity : </td>
									<td class="tableRight"><%=finalActivity%>&nbsp;</td>
								  	</tr>
							
								
								  <tr>
									<td class="tableLeft">Other Specific Id</td>
									<td class="tableRight"><%=otherSpecific%>&nbsp;</td>
								  </tr>
								  <%
									float pAmt = Float.parseFloat(objActDet.getActivityFees());
									java.math.BigDecimal bdAmount = new BigDecimal(pAmt);
									bdAmount = bdAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
								%>
								  <tr>
									<td class="tableLeft"> Fees Charged:  </td>
									<td class="tableRight"><strong>$</strong><%=objActDet.getActivityFees()%>&nbsp;</td>
								  </tr>
								  <tr>
									<td class="tableLeft"> Instructor(s)/Coach(es):  </td>
									<td class="tableRight"><%=objActDet.getInstructorsCoaches()%>&nbsp;</td>
								  </tr>
								  <tr>
									<td class="tableLeftTxtArea"> Facilities To Be Used Specifically:  </td>
									<td class="tableRight"><%=objActDet.getFacilities()%>&nbsp;	</td>
								  </tr>
								   <tr>
									<td class="tableLeft">Other Facilities:</td>
									<td class="tableRight"><%=otherFacilities%>&nbsp;</td>
								  </tr>
								  <tr>
									<td colspan="2" class="tblRowHead"> <span class="rowHead">Publicity And Mailing List: </span></td>
								  </tr>
								<%
								
								if(publicationEmail==null){
								 publicationEmail ="NA";
								} 
								if(mailingFormat==null){
								 mailingFormat ="NA";
								} 
								if(mailingBy==null){
								 mailingBy ="NA";
								} 
								if(Status==null){
								 Status ="NA";
								} 
								if(mailingSortBy==null){
								 mailingSortBy ="NA";
								} 
								if(noOfCopies==null){
								 noOfCopies ="NA";
								} 
								 
							
								%>
								  <tr>
									<td class="tableLeft"> Email logo (JPEG): </td>
									<td class="tableRight"><%=publicationEmail%>&nbsp;</td>
								  </tr>
								  <tr>
									<td class="tableLeft"> Complimentary Mailing List Format: </td>
									<th class="tableRight"> <%=mailingFormat%>&nbsp;</th>
								  </tr>
								  <tr>
									<td height="27" class="tableLeft"><span class="row"><span class="label">Send Mailing List by :</span></span></td>
									<td class="tableRight"><%=mailingBy%>&nbsp;</td>
								  </tr>
								 
								   <tr>
									<td class="tableLeft"> <span class="row"><span class="label">Send Mailing List Based on :</span></span></td>
									<td class="tableRight"><%=Status%>&nbsp;</td>
								  </tr>
								   <tr>
									<td class="tableLeft"> <span class="row"><span class="label">Sort Mailing List by :</span></span></td>
									<td class="tableRight"><%=mailingSortBy%>&nbsp;</td>
								  </tr>
								  <tr>
									<td class="tableLeft"> <span class="row"><span class="label">Number of copies of the colour brochure :</span></span></td>
									<th class="tableRight"><%=noOfCopies%>&nbsp;</th>
								  </tr>
								  <%}%>
							</table>
							<!--++++++++++++++++++++ Part 2 of the form ends here ++++++++++++++++++++++++++++++ -->		
							
							</td>
						 </tr>
						  
					  	 <tr id="part3" class="holderDivTwo">
						<td colspan="2">
						
						<!--++++++++++++++++++++ Part 3 of the form starts here ++++++++++++++++++++++++++++++ -->	
						<table cellpadding="0" cellspacing="0" border="0" class="formLayout">

						  <tr>
							<td colspan="2" class="tblRowHead"> <span class="rowHead">Land Owner Details : </span></td>
						  </tr>
						  <tr>
							<td class="tableLeft">Land Owner Name :</td>
							<th class="tableRight"><%=objActDet.getLandOwnerName()%></th>
						  </tr>
						  <tr>
							<td height="27" class="tableLeft">Business Name : </td>
							<th class="tableRight"><%=objActDet.getLandOwnerBusinessName()%></th>
						  </tr>
						  <tr>
							<td class="tableLeft"> Address:</td>
							<td class="tableRight"><%=objActDet.getLandOwnerAddress()%></td>
						  </tr>
						  <tr>
							<td height="27" class="tableLeft">Country: </td>
							<td class="tableRight"><%=objActDet.getLandOwnerCountry()%></td>
						  </tr>
						  <tr>
							<td class="tableLeft"> State:</td>
							<td class="tableRight"><%=objActDet.getLandOwnerState()%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft">City: </td>
							<td class="tableRight"><%=objActDet.getLandOwnerCity()%>&nbsp;</td>
						  </tr>
						   <tr>
							<td class="tableLeft">Zip: </td>
							<td class="tableRight"><%=objActDet.getLandOwnerZip()%>&nbsp;</td>
						  </tr>
						  <tr>
							<td class="tableLeft"> Tel: </td>
							<td class="tableRight"><%=objActDet.getLandOwnerPhone()%>&nbsp;</td>
						  </tr>
						   <%
							 String addPath="";
						     if(objActDet.getAdditionalSitesPath()!=null && objActDet.getAdditionalSitesPath().trim().length()!=0){
								addPath = objActDet.getAdditionalSitesPath();
							 }
							 else{
								 addPath ="NA";
							 }
						  %>
						   <tr>
							<td class="tableLeft">Additional Site Information: </td>
							<td class="tableRight"><%=addPath%>&nbsp;</td>
						  </tr>
						  <%}
 							status = objActDet.getRequestStatus();
							if(status==null){
								status = "";
							}
						%>
						</table>
						<!--++++++++++++++++++++ Part 3 of the form ends here ++++++++++++++++++++++++++++++ -->		
		
						</td>
					 </tr>
						 
						 <tr id="part4" class="holderDivTwo">
						<td colspan="2">
						
						<!--++++++++++++++++++++ Part 4 of the form starts here ++++++++++++++++++++++++++++++ -->	
							<form name="frmMeeAdminEduActRegiApprove" method="post" action="meeting.do" onsubmit="return chk();">
							<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">  
								  
									<tr>
									<td colspan="2" class="tblRowHead">&nbsp;Approval Status</td>
								  </tr>
								 
								<% 
								
									if(status.equals("Rejected")){
									if(comments==null){
									comments = "Not Given";
									}%>
								<tr> 
									<td class="tableLeftTxtArea">Status:</td><td class="tableLeftTxtArea"><span class="styleBoldOne"><%=status%></span></td>
									</tr>
								<tr> 
								
									<td class="tableLeftTxtArea">Comments:</td>
									<td class="tableRight"><%=comments%>&nbsp;</td>
								  </tr>
								 <tr>
									
								  <td class="alignCenter" colspan="2">								
									<input type="button" value="Back" class="gradBtn" onclick="javascript:history.back(-1);"/>&nbsp;</td>
								  </tr>	  
								 <% }
								 else if(status.equals("Pending")){%>
								<tr> 
									<td class="tableLeftTxtArea">Status:</td><td class="tableLeftTxtArea"><span class="styleBoldOne"><%=status%></span></td>

									</tr>
								<tr>
									<td class="tableLeft">Do you want Approve or Reject:</td>
									  <td>	
									<input name="radioStatus" type="radio" value="Approve" checked="checked" />Approve &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="radioStatus" type="radio" value="Reject" />Reject</td>
								  </tr>	  
								  <tr> 
									<td class="tableLeftTxtArea">Comments:</td>
									<td class="tableRight"><textarea name="comments" class="textAreaOne" rows="5"></textarea>
								    <span class="asterisk">*</span></td>
								  </tr>
								  <tr>
								  <td class="alignCenter" colspan="2">	
								    <input type="submit" value="Submit" class="gradBtn" />&nbsp;&nbsp;&nbsp;
									<input type="button" value="Cancel" class="gradBtn" onclick="javascript:history.back(-1);"/>&nbsp;</td></tr>
							  <%}
							   else if(status.equals("Approved")){
							   if(comments==null){
							   comments = "Not Given";
							   }%>
								<tr> 
									<td class="tableLeftTxtArea">Status:</td><td class="tableLeftTxtArea"><span class="styleBoldOne"><%=status%></span></td>
									</tr>
								<tr> 
									<td class="tableLeftTxtArea">Comments:</td>
									<td class="tableRight"><%=comments%>&nbsp;</td>
								  </tr>
								  <tr>
								  <td class="alignCenter" colspan="2">	
									<input type="button" value="Back" class="gradBtn" onclick="javascript:history.back(-1);"/>&nbsp;</td>
									</tr>
							  <%} 
							  %>
						
								<input type="hidden"  name="actMeetId" value="<%=actMeetId%>" />	
								<input type="hidden"  name="meeProcess" value="updateStatus" />	
								
								<tr>
									<td colspan="2" class="alignCenter">
							   </tr>
							   
							</table>
							 </form>
							<!--++++++++++++++++++++ Part 4 of the form ends here ++++++++++++++++++++++++++++++ -->		
						
						</td>
					 </tr>
				
					  </table>
					 
					  
					</td>
				  </tr>
				  <tr>
						<td>&nbsp; 
					   <!-- DO NOT DELETE THIS ROW -->
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