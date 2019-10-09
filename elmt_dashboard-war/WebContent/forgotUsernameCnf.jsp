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
<script src="javascripts/basic.js" type="text/javascript" ></script>
 <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>

<body>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		 <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="headerTab">
		  <tr>
			<td bgcolor="#EDEDED" class="alignTop">
				<!-- top navibar Starts Here -->
				<table width="740" border="0" align="center" cellpadding="0" cellspacing="0" id="topNavibarTab">
				  <tr>
					<td width="78" class="alignTop"><img src="images/btn_MainNavHome.jpg" width="78" height="17" border="0" usemap="#Map" class="imgFloatLeftTwo"/></td>
					<td width="10" class="alignTop"><span class="divider">|</span></td>
					<td width="78" class="alignTop"><img src="images/btn_MainNavAbout.jpg" width="78" height="17" border="0" usemap="#Map2" class="imgFloatLeftTwo"/></td>
					<td width="245" class="alignTop">&nbsp;</td>
					<td width="230" class="alignTop">
						<div class="alignRight"> 
						
								
							<span class="welcome">Welcome Guest !</span> 
							<span class="divider">|</span> 
							
							
							
						</div>
					</td>
					<td width="110" class="alignLeft">
						<span class="date">&nbsp;
							<SCRIPT LANGUAGE="JavaScript">
								if(navigator.appName == "Netscape") {
									document.write(isnDays[today.getDay()+1]+", "+isnMonths[today.getMonth()+1]+" "+today.getDate()+", "+ (today.getYear()+1900));
								}else{
								document.write(isnDays[today.getDay()+1]+", "+isnMonths[today.getMonth()+1]+" "+today.getDate()+", "+today.getYear());
								}  
							</SCRIPT>
						</span>
					</td>
				  </tr>
				</table>
				<!-- top navibar Ends Here -->
			</td>
		  </tr>
		  <tr>
		    <td class="logoRow"><table width="758" border="0" align="center" cellpadding="0" cellspacing="0" id="logoTimeHolderTab">
              <tr>
                <td class="logo">
				<div class="titlePad"><img src="images/title.jpg" width="279" height="30" /></div>
				<a href="#">
                <div class="tabPad"></div>
                </a></td>
              </tr>
            </table></td>
	      </tr>
		  
		  
</table>

<map name="Map" id="Map">
<area shape="rect" coords="2,0,77,15" href="index.jsp" alt="HLC Home" />
</map>

<map name="Map2" id="Map2">
<area shape="rect" coords="2,0,77,15" href="#" alt="About HLC" />
</map>
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%--@ include file = "include/infobar.jsp" --%>
		<!-- INFO BAR ENDS HERE -->	
	</td>
  </tr>
  <tr>
    <td class="tableCommonBg">
	<!-- CENTER TABLE STARTS HERE -->	
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
		  <tr>
			<td colspan="2" class="cenTablePad">
			<!-- Welcome Tab Starts Here -->	
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="welcomeTab">
				  <tr>
					<td width="11" class="welTabLftTopCrnr"></td>
					<td colspan="2" class="loginTabLeft"></td>
					<td width="11" class="welTabRghtTopCrnr"></td>
				  </tr>
				  <tr>
					<td rowspan="2" class="welTabLft">&nbsp;</td>
					<td rowspan="2" class="loginTabLeft"> <span class="styleBoldTwo">User Details Retrieval Confirmation </span><br />
					<br />
					  <br />
						 
						 <!-- Descrip Tab Starts Here -->
						 
						 <table width="410" border="0" align="left" cellpadding="0" cellspacing="0" id="welcomeTab">
							  <tr>
								<td class="loginTabLftTopCrnr"></td>
								<td class="loginDescBg"></td>
								<td class="loginTabRghtTopCrnr"></td>
							  </tr>
							  <tr>
								<td class="loginTabLft">&nbsp;</td>
								<td class="loginDescBg"><span class="textBold">Dear User</span>,<br />
							    <br />
							    Your account details has been sucessfully sent to your EMail! .<br />
							    <br />
							    Thank You,<br />
							    <span class="styleBoldOne">HLC TEAM</span> </td>
								<td class="loginTabRght">&nbsp;</td>
							  </tr>
							  <tr>
								<td class="loginTabLftBotCrnr"></td>
								<td class="loginTabBot"></td>
								<td class="loginTabRghtBotCrnr"></td>
							  </tr>
					  </table>
						 
						 <!-- Descrip Tab Ends Here -->
						 
					</td>
					<td height="80" bgcolor="#FBFBEF" align="left"><img src="images/img_welcome.jpg" class="imgWelcFloatRight" /></td>
					<td rowspan="2" class="welTabRght">&nbsp;</td>
				  </tr>
				  <tr>
				    <td valign="top" bgcolor="#FBFBEF">
					<!-- Login Tab Starts Here -->
					<!-- Login Tab Starts Here --></td>
				  </tr>
				  <tr>
					<td class="welTabLftBotCrnr"></td>
					<td colspan="2" class="welTabBot"></td>
					<td class="welTabRghtBotCrnr"></td>
				  </tr>
				</table>
			<!-- Welcome Tab Ends Here -->
			</td>
		  </tr>
		</table>
	<!-- CENTER TABLE ENDS HERE -->
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