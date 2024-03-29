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
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
 
 <link href="/css/core-ie.css" type="text/css" rel="stylesheet" />
</head> 
<%
String amt= (String) session.getAttribute("amount");
String payId = (String) session.getAttribute("payId");
String badgeName = (String) session.getAttribute("bdgeNme");
String meetingId = (String) session.getAttribute("meetId");
session.removeAttribute("amount");
session.removeAttribute("payId");
session.removeAttribute("bdgeNme");
session.removeAttribute("meetId");
%>
<body >
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
		<form name="horseSuccess" action="" method="post">		
<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="2" class="tblMainHead">
		<span class="styleBoldTwo"> Annaul Payment Confirmation..	</span></td>
  </tr>
  				<%
						String totalAmount =(String)request.getAttribute("totalAmount");
						DecimalFormat myFormatter = new DecimalFormat("###,###.00");
						double finalAmt = Double.parseDouble(amt);
						System.out.print("finalAmt" + finalAmt);
						
		      			String output  = myFormatter.format(finalAmt);
						System.out.print("output" + output);
				%> 
   
 
		<%
		String paymode = (String) session.getAttribute("paymode");
		if(paymode!=null){
		if(paymode.trim().equalsIgnoreCase("CardPay")){
		%>
	
 				<tr>
						<td colspan="2" class="tblDescrp"> 
						 
							 You have successfully made a payment of<strong> $<%=output%></strong> towards the Annual Registration. <br />
							   <br />
							    <br />
							    You will receive an email from <strong>info@digiblitz.com</strong> regarding this transaction.<br /> 
							  <br />
    						  	  <input name="button" type="button" class="gradBtn" value="Home" onclick="location.href='./index.jsp'" />
						</td>
					  </tr>
		<%
		}
		else{
		%>
		<tr>
		<td>
		<table align="center" cellpadding="2" cellspacing="3" width="100%">
			<th colspan="2"><span class="tblMainHead">Details of the Check Payment for Annaul Regisrtation:</span></th>
			<tr>
				<td><span class="alignLeft"><strong>Meeting Id:</strong></span></td>
				<td> <span class="styleBoldOne"><%=meetingId%></span></td>
			</tr>			
			<tr>
				<td><span class="alignLeft"><strong>Badge Name:</strong></span></td>
				<td><span class="styleBoldOne"><%=badgeName%></span></td>
			</tr>
			 <tr>
				<td><span class="alignLeft"><strong>Total Amount:</strong></span></td>
				<td> <span class="styleBoldOne"><%=amt%></span></td>
			</tr>
			<tr>
				<td><span class="alignLeft"><strong>Registration Status:</strong></span></td>
				<td> <span class="styleBoldOne">Pending Until Check Is Processed</span></td>
			</tr>
		
			<tr>
			<td colspan="5"><br /><em></em>
				If paying by check please mail your payment <span class="styleBoldOne">(<%=amt%>)</span> to: <br />
			</td></tr>
			<tr>
			  <td colspan="2" class="tableSpan">
				<br />
				<strong>
				<br />
				Annual Meeting Registration
				<br />
				525 Old Waterford Road NW
				<br />
				Leesburg, VA 20176												    </strong><br />
				<br />
				<strong>Note:</strong> Your registration status will be pending until check is processed.												  <br />
			  <br /></td>
		  </tr>	
			<tr>
			<td colspan="5">
				<strong> Note:</strong> Your upgrade status will be pending until check is processed.		<br />
			</td>
			</tr>
			<%
			}
			%>
			</table>	
			</td>
			</tr>	
		<%}
		%>
					  
  
  <tr>
    <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
  </tr>
</table>
</form>
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
