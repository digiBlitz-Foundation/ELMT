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
<%@ page import="java.lang.*"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Integrated Enterprise Dashboard</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeEduActRecap.js" type="text/javascript" ></script>
<script src="javascripts/frmrRoleMEditValidate.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
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
				<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				   <tr>
					<td colspan="2" class="tblMainHead">
						MFG Roles &amp; Privileges: <span class="styleBoldTwo"> Edit Roles </span>
					</td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">
					<img src="images/usea_logo.jpg" class="imgFloatLeft" />
					You can <strong>Edit/Update</strong> the <strong> Role</strong> created by you as given below. <br />
					<br />					</td>
				  </tr>
				  <tr>
					<td>
					  <%  
							String roleId = "";
							String roleName = ""; 
							String[] s = (String[])request.getAttribute("roleDetails");
							//out.print("Role Details:" + s);
							if(s!=null){
								roleId = s[0];
								roleName = s[1]; 
							}
						%>
					
				<form name="frmRoleMgtRoleEdit" id="frmRoleMgtRoleEdit" method="post" action="roles.do" onsubmit="return myvalidate();">
						<input type="hidden" name="roleProcess"	value="editRole"/>	
						<input type="hidden" name="roleId" value="<%=roleId%>"/>
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						  <tr> 
							<td colspan="2" class="tblRowHead"> Edit This Role: </td>
						  </tr>
						    <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
						  %>
						  <tr> 
							<td colspan="2" class="tableLeft">This Role Name Already Exist</td>
 						  </tr>
						  <%
						  }
						  %>
								
							<tr> 
							<td class="tableLeft"> Role Name:</td>
							<td class="tableRight">
							<input name="rolename" id="rolename" type="text" class="textboxOne" value="<%=roleName%>" size="25" /></td>
							</tr>
						  <tr> 
							<td colspan="2" class="alignCenter">
							<input type="submit" value="Update" class="gradBtn" />
						    <input name="button" type="reset" class="gradBtn" value="Cancel" /></td>
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


�

</body>
</html>