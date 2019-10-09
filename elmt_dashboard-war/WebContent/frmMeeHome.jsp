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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Integrated Enterprise Dashboard</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeAnnualConvRegister.js" type="text/javascript" ></script>
<!--<link href="css/core-ie.css" type="text/css" rel="stylesheet" />-->

</head>

<body>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "include/header.jsp" %>
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%@ include file = "include/infobar.jsp" %>
		<!-- INFO BAR ENDS HERE -->	
	</td>
  </tr>
  <tr>
    <td class="tableCommonBg">
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "include/menu-meetings.jsp" %>
			<!-- LEFT MENU ENDS HERE -->
			&nbsp;
		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
				  <tr>
					<td colspan="2">
					
						<form name="frmMeeAnnualConvRegister" id="myform" action="">
					
							
						<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  class="formLayout">
							<tr>
								<td colspan="2" class="tblMainHead"><strong>HLC</strong> Meetings:  <span class="styleBoldTwo">Meetings Home</span></td>
							</tr>
							<tr>
								<td colspan="2" class="tblDescrp"><img src="images/usea_logo.jpg" width="100" height="99" /></td>
							</tr>
							<tr> 
								<td colspan="2" class="tblRowHead">Available Links</td>
							</tr>
							<tr> 
								<td colspan="2" class="alignCenter">
								  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
									  <tr>
										<td rowspan="2" valign="top">
										
											<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
												  <tr>
													<td height="20" class="alignLeft"><span class="textBold">&nbsp;&nbsp;&nbsp;Organizer Section </span> </td>
												  </tr>
												  
												  <tr>
													<td height="20" class="menuLinkbg" align="left"><span class="textBold">&curren; Education Sub-System</span></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="meeting.do?meeProcess=orgOwnList" class="linkFour">Oranizer Own List</a></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="eduActivity.do?activityProcess=initEduOrg" class="linkFour">Activity- Registration Form</a></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="meeting.do?meeProcess=userDetList" class="linkFour">Show User List</a></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="EventOrgRenewal.do?eventProcess=showOrg" class="linkFour">Own Endorsed Form Details</a></td>
												  </tr>
												   <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="EventOrgRenewal.do?eventProcess=newReq" class="linkFour"> Endorsed Form REG</a></td>
												  </tr>
												   <tr>
													<td height="20" class="menuLinkbg" align="left"><span class="textBold">&curren; Activity Recap</span></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="recap.do?recapProcess=initRecapOrg" class="linkFour">Activity Organizer Recap Form</a></td>
												  </tr>
												   <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="recap.do?recapProcess=viewListRecapAdmin" class="linkFour">Admin Activity List Page </a></td>
												  </tr>
												   <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="recap.do?recapProcess=viewListRecapOrg" class="linkFour">Organizer Activity List Page </a></td>
												  </tr>
											</table>
										
										</td>
										<td valign="top">
											<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
												  <tr>
													<td height="20" class="alignLeft"><span class="textBold">&nbsp;&nbsp;&nbsp;Admin Section </span> </td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left"><span class="textBold">&curren; Event Sub-System</span></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="EventOrgRenewal.do?eventProcess=initShow" class="linkFour">View Endorsed Form Details</a></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left"><span class="textBold">&curren; Educational Sub-System</span></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="meeting.do?meeProcess=newAdmin" class="linkFour">View Status </a>  </td>
												  </tr>
											</table>
										</td>
									  </tr>
									  <tr>
										<td valign="top">
											<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
												  <tr>
													<td height="20" class="alignLeft"><span class="textBold">&nbsp;&nbsp;&nbsp;User Section </span> </td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left"><span class="textBold">&curren; Education Sub-System</span></td>
												  </tr>
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="meeting.do?meeProcess=userStatus" class="linkFour">Own List</a></td></tr>
													<tr><td height="20" class="menuLinkbg" align="left">&raquo; <a href="meeting.do?meeProcess=statusApproved" class="linkFour">Available Meetings</a></td>
												  </tr>
												  	<tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="./OfficialsDet.do?offProcess=add" class="linkFour">Create Official</a></td></tr>
													<tr><td height="20" class="menuLinkbg" align="left">&raquo; <a href="./OfficialsDet.do?offProcess=list&status=" class="linkFour">List Available Officials</a></td>
												  </tr>	
												  
												  <!--
												  <tr>
													<td height="20" class="menuLinkbg" align="left">&raquo; <a href="EventOrgRenewal.do?eventProcess=initMapStateZip" class="linkFour">Mapping Area State Zip</a></td>
												  </tr>
													<tr>
													  <td height="20" class="menuLinkbg" align="left">&raquo;<a href="EventOrgRenewal.do?eventProcess=initMapAreaAndAreaChair" class="linkFour">Mapping AreaChair and Area Person</a></td>
												  </tr>
													<tr>
													  <td height="20" class="menuLinkbg" align="left">&raquo;<a href="EventOrgRenewal.do?eventProcess=mapAreaAndAreaChairListing" class="linkFour">Listing AreaChair and Area Person</a></td>
												  </tr>
												  -->
											</table>
										</td>
									  </tr>
									  <tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									  </tr>
								  </table>
							  </td>
							</tr>
							
					  </table>
					  </form>
				  <tr>
						<td >&nbsp; 
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
			<%@ include file = "include/footer.jsp" %>
		<!-- FOOTER ENDS HERE -->
	</td>
  </tr>
</table>

</body>
</html>