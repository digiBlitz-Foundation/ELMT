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

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!--/*  Program Name    : frmAdvDimensionEdit.jsp
 *  Created Date    : September 4, 2006, 4:24 PM
 *  Author          : Punitha.R
 *  Version         : 1.4
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */
--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>
<script language="javascript" type="text/javascript">
function myValidate(){
	if(document.myform.txtItemName.value==""){
		alert("Please Enter Item Name");
		document.myform.txtItemName.focus();
		return false;
	}
	if((document.myform.txtItemName.value.indexOf('  ')!=-1)||(document.myform.txtItemName.value.indexOf(' ')==0)){
	alert("Enter valid Item Name");
	document.myform.txtItemName.focus();
	return false;
	}
	if(document.myform.txtItemName.value.length > 255){
	alert("Enter Item Name within 255 characters");
	document.myform.txtItemName.focus();
	return false;
	}
	chosen="";
	len = document.myform.orgStatus.length ;
	for(i=0;i<len;i++){
	if(document.myform.orgStatus[i].checked)
	{ chosen= document.myform.orgStatus[i].value; }
	}
	if(chosen==""){
	alert("Please Select Organizer Edit status");
	return false;
	}
	return true;
}
</script>
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
			<td width="250" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			
<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>

			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="2" class="tblMainHead"><strong>Online Event Entries </strong>:Edit  Item </td>
  </tr>
  <tr>
    <td colspan="2" class="tblDescrp">
     
		 </td>
  </tr>
 
 <!-- ==================================================Edit Dimension Details==============================================-->
  <tr>
    <td height="20">
		
		  <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
		  
		   <tr>
              <td colspan="2" class="tabHead">Required fields are marked with an asterisk*</td>
            </tr>
				<% String statuscheck = (String)request.getAttribute("err");
				
				if(statuscheck!=null && statuscheck.equals("st")){
				%>
				<tr>
				<td colspan="2" class="styleError" height="20">&nbsp;<strong>Item Name Already Exists. Try Again</strong></td>
				</tr>
				<%
				}
				%>
            <tr>
              <td colspan="2" class="tblRowHead">Edit/Update Item :</td>
            </tr>
			<%
					 ArrayList itemDetails=(ArrayList)request.getAttribute("singleDet");
					 if(itemDetails!=null && itemDetails.size()!=0){ 
					 Iterator it = itemDetails.iterator();
					  while(it.hasNext()){
						    String [] itemDetail  = (String[])it.next();
							String itemId = itemDetail[0];
							String itemName = itemDetail[1];
							String orgStatus = String.valueOf(itemDetail[2]);
							String itemStatus= String.valueOf(itemDetail[3]);
							
					%>
		  <form name="myform" id="myform" method="post" action="./OEEPriceItem.do" onsubmit="return myValidate();" >
			<input type="hidden" name="cmd" value="updateItem"/>
			<input type="hidden" name="itemId" value="<%=itemId%>">
            <tr>
			
              <td class="tableLeft">Item Name :</td>
              <td class="tableRight"><input type="text" name="txtItemName" class="textboxOne" value="<%=itemName%>" size="25" />
                  <span class="asterisk">*</span></td>
            </tr>
			<tr>
					<td class="tableLeft">  Editable By Organizer:</td>
					<td class="tableRight">
				<%if(orgStatus!=null && orgStatus.trim().length()!=0){
				  if(orgStatus.equalsIgnoreCase("true")){ %> 
				<input type="radio" size="10" name="orgStatus" checked value="true" /> Yes
				<input type="radio" size="10" name="orgStatus" value="false" /> No
				<%}else if(orgStatus.equalsIgnoreCase("false")){%>
				<input type="radio" size="10" name="orgStatus" value="true" /> Yes
				<input type="radio" size="10" name="orgStatus" checked value="false" /> No
				<%}}else{%>
				<input type="radio" size="10" name="orgStatus" value="true" /> Yes
				<input type="radio" size="10" name="orgStatus" value="false" /> No
				<%}%>
				<span class="asterisk">*</span></td>
				</tr>
				<%}}%>
			<tr>
              <td class="tableLeft">&nbsp;</td>
              <td class="tableRight"><input name="advDimButton" type="submit" class="gradBtn" value="Update" onclick="" />
                &nbsp;
                <input name="advDimButton" type="button" class="gradBtn" value="Cancel" onclick="javascript:history.back(-1);" />
              </td>
            </tr>
			</form>
          </table>
	</td>
  </tr>
  
  <!-- ==================================================List Dimension Details==============================================-->
 
  
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


�

</body>
</html>