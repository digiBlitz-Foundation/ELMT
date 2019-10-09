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
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmUserReg.js" type="text/javascript" ></script>
<script src="javascripts/frmMemberCreateLogin.js" type="text/javascript" ></script>

<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>
<body>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "../../include/login_header.jsp" %>
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%//@ include file = "../../include/infobar.jsp" %>
		<!-- INFO BAR ENDS HERE -->	
	</td>
  </tr>
  <tr>
    <td class="tableCommonBg">
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="260" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
				<table width="70%" border="0" cellpadding="0" cellspacing="0" class="tblInnerContainer">
				  <tr>
					<td colspan="2" class="tblMainHead"><strong></strong> Member SignUp: <span class="styleBoldTwo">Create Dashboard Login </span></td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">Existing Members can create their Dashboard login details here.	</td>
				  </tr>
						  <tr>
							<td>
							
							<form name="frmUserSignup" id="myform" method="post" action="MemberSignupDetails.do" onsubmit="return myvalidate();">		  
							<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">  
								  <tr>
									<td colspan="2" class="tblRowHead">&nbsp;Member  Detail </td>
								  </tr>
								  
								  <tr>
									<td class="tableLeft">Member ID:</td>
									<td class="tableRight"> <input type="text" name="membid" id="chsUserName" class="textboxOne"  size="20" onblur="HLCMemberDetails();" />
									  <span class="asterisk">*</span></td>
								  </tr>
								  <input type="hidden" name="process" value="sign" />
					
								  <tr class="tableInner">
									<td class="tableLeft">First Name:</td>
									<td class="tableRight"><input type="text" name="fname" id="fname" class="textboxOne" size="20" />
										<span class="asterisk">*</span> </td>
								  </tr>
								 
								 <tr class="tableInner">
									<td class="tableLeft">Last Name:</td>
									<td class="tableRight"><input type="text" name="lname" id="lname" class="textboxOne" size="20" />
										<span class="asterisk">*</span> </td>
								  </tr>
								  <tr>
										<td class="tableLeft"> Date of Birth:</td>
										<td class="tableRight">
											<select name="birthmonth" id="select" class="selectboxOne">
												  <option value="" selected="selected">Month</option>
												  <option value="01">January</option>
												  <option value="02">February</option>
												  <option value="03">March</option>
												  <option value="04">April</option>
												  <option value="05">May</option>
												  <option value="06">June</option>
												  <option value="07">July</option>
												  <option value="08">August</option>
												  <option value="09">September</option>
												  <option value="10">October</option>
												  <option value="11">November</option>
												  <option value="12">December</option>
										  </select>
										  <select name="birthday" id="select" class="selectboxOne">
												  <option value="" selected="selected">Day</option>
												  <option value="01">01</option>
												  <option value="02">02</option>
												  <option value="03">03</option>
												  <option value="04">04</option>
												  <option value="05">05</option>
												  <option value="06">06</option>
												  <option value="07">07</option>
												  <option value="08">08</option>
												  <option value="09">09</option>
												  <option value="10">10</option>
												  <option value="11">11</option>
												  <option value="12">12</option>
												  <option value="13">13</option>
												  <option value="14">14</option>
												  <option value="15">15</option>
												  <option value="16">16</option>
												  <option value="17">17</option>
												  <option value="18">18</option>
												  <option value="19">19</option>
												  <option value="20">20</option>
												  <option value="21">21</option>
												  <option value="22">22</option>
												  <option value="23">23</option>
												  <option value="24">24</option>
												  <option value="25">25</option>
												  <option value="26">26</option>
												  <option value="27">27</option>
												  <option value="28">28</option>
												  <option value="29">29</option>
												  <option value="30">30</option>
												  <option value="31">31</option>
											</select>
											<select name="birthyear" id="select" class="selectboxOne">
												  <option value="" selected="selected" >Year</option>
													<%
                                                                                                  java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                                                                  //int day = c.get(Calendar.DAY);
                                                                                                  //int month = c.get(Calendar.MONTH);
                                                                                                  int year5 = c5.get(java.util.Calendar.YEAR);
                                                                                                  //String date = day+" / "+month+" / "+year;
                                                                                                  System.out.println("Current Date = "+year5);

                                                                                                  for(int f=1900;f<=year5;f++) 
                                                                                                  {%>
                                                                                                  <option  value="<%=f%>"><%=f%></option>
                                                                                                  <%}
                                                                                                  %>
											</select>
										<span class="asterisk">*</span>												</td>
								</tr>
								 <tr class="tableInner">
				
									<td class="tableLeft">e-Mail:</td>
									<td class="tableRight"><input type="text" name="email" id="email" class="textboxOne" size="20" />
										<span class="asterisk">*</span> </td>
								  </tr>
								  <tr class="tableInner">
									<td class="tableLeft">Zipcode:</td>
									<td class="tableRight"><input type="text" name="zip" id="zip" class="textboxOne" size="20" />
										<span class="asterisk">*</span> </td>
								  </tr>
								  	 
								<tr>
									<td colspan="2" class="alignCenter"><input type="submit" value="Continue" class="gradBtn" /></td>
							   </tr>				 
								<tr>
									<td colspan="2" height="25" class="alignCenter">&nbsp;</td>
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