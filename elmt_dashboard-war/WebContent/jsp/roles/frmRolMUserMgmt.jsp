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
<jsp:directive.page import="java.util.*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Business Service Center</title>

<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/Login.js" type="text/javascript" ></script>
<link href="css/core-ie.css" type="text/css" rel="stylesheet" /> 
<script language="javascript">
function focus_login()
{
	document.form1.textfield.focus();
}
</script>

<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-base.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-topbar.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-sidebar.css" />

<script type="text/javascript" src="js/ddlevelsmenu.js">

/***********************************************
* All Levels Navigational Menu- (c) Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>


</head>

<body onLoad="focus_login();">
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "../../include/header.jsp"%> 
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
		
		<!-- HEADER ENDS HERE -->
		
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<table width="760" border="0" cellpadding="0" cellspacing="0" id="infoBarTab">

			  <tr>
				
				<td class="infoTopPad" width="2%">				</td>
				<td class="infoTopPad" width="90%" height="25"><span class="styleBoldTwo">Admin &gt; View Management </span></td>
				<td class="infoTopPad" width="8%" align="center">
	</td>
				
			  </tr>
	  </table>
		<!-- INFO BAR ENDS HERE -->	
	</td>
  </tr>

  <tr>
    <td class="tableCommonBg">
		
		<table width="760" height="400" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<!--< %@ include file = "../../include/menu-messages-member.jsp" % >-->
			


  

				<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" id="fullHeight" class="menuTableBg">
				  <tr>
					<td class="alignTop"><br />
						<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="leftMenuTab">
						  <tr>
							<td class="menuTabLft"></td>
							<td class="menuTabTwoBg">
								
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">

                                  <tr>
                                    <td height="20" class="alignLeft"><span class="textBold">&nbsp;</span> </td>
                                  </tr>
								  
									<tr>
										<td height="25">
										
										<!-- code for side bar starts here --><!-- code for side bar starts here -->									  </td>
								  </tr>
									 
									  															  								  
                                </table>

							</td>
							<td class="menuTabRght"></td>
						  </tr>
						  <tr>
							<td class="menuTabLftBotCrnr"></td>
							<td class="menuTabBot"></td>
							<td class="menuTabRghtBotCrnr"></td>
						  </tr>
						</table>

						<br />
					

					</td>
				  </tr>
				</table>

			<!-- LEFT MENU ENDS HERE -->

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