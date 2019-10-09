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
<script src="javascripts/frmCntryMailAmount.js" type="text/javascript" ></script>


<script language="javascript">
function postData(year){
 	if(document.frmCntryMailAmount.year.value=="Select One"){
    alert("Select any Year");
	document.frmCntryMailAmount.year.focus();
	return false;
	}else{
	document.frmCntryMailAmount.method="post";
	document.frmCntryMailAmount.action="./countrymail.do?countryProcess=memb&year="+year;
	document.frmCntryMailAmount.submit();
	}
	return true;
}	
</script>
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
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="2" class="tblMainHead">
	Membership: <span class="styleBoldTwo">Country Mailing Price Master</span></td>
  </tr>
  <tr>
    <td colspan="2" class="tblDescrp">
		<strong>Fill in the following information to assign an amount for a given Country mailing Type.</strong> <br />
	</td>
  </tr>
  <tr>
  	<td>
	
		<form name="frmCntryMailAmount" id="frmCntryMailAmount" method="post" action="countrymail.do" onSubmit="return myvalidate();">
		<input type="hidden" name="countryProcess" value="insert" />
	
			<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				  <tr>
					<td colspan="2" class="tblRowHead">
						Assign Country Mailing Price</td>
				  </tr>
			  <tr>
					  <td colspan="2">Fields marked with an asterisk (<span class="asterisk">*</span>) are required.</td>
		  </tr>
		  
				  <% 
				  try{
				  String statuscheck = (String)request.getAttribute("err");
					if(statuscheck!=null && statuscheck.equals("st")){
					%>
					<tr>
					<td colspan="2" class="styleError"><strong>Mail Type Name Already Exists. Try it Again.</strong></td>
					</tr>
					<%	} 	%>
					
				 <tr>
				<td class="tableLeft">Membership Year:</td>					
				<td class="tableRight">
				<select name="year" id="year" class="selectboxOne" onchange="postData(this.value);">
				<option selected="selected" value="Select One" >Select One</option>		
				  <% String yearStr = (String) request.getAttribute("year");
					   Calendar cal = Calendar.getInstance();
					   for (int i= 2007;i<=(cal.get(Calendar.YEAR)+1);i++){
					   if(yearStr != null && yearStr.equalsIgnoreCase(new Integer(i).toString())){
					   %>
					   <option selected="selected" value="<%=i%>"><%=i%></option>
					   <%}else{%>
					   <option value="<%=i%>"><%=i%></option>
					   <%}
					   }%>
				
					</select>&nbsp;<span class="asterisk">&nbsp;*</span>
				
				</td></tr>	  

					
					
					
				  <tr>
				<td class="tableLeft">Membership  Type  name:</td>					
				<td class="tableRight"><select name="memberMailtypId" id="memberMailtypId" class="selectboxOne">
				
				<option selected="selected" value="Select One" >Select One</option>							
					<%
					Vector objMemb = (Vector)request.getAttribute("objMemb");
					
					 if(objMemb!=null && objMemb.size()!=0){
					 System.out.println("Vector Size is"+objMemb.size()); 
					Enumeration e = objMemb.elements();				
	              while(e.hasMoreElements()){
						
							String sr[] = (String[])e.nextElement();
						    String membershipTypeId = sr[0];
                            String membershipTypeName = sr[1];
                        //Debug.print("JSP membershipTypeId"+membershipTypeId);
                        //Debug.print("JSP membershipTypeName"+membershipTypeName);
						%>
				<option value="<%=membershipTypeId%>"><%= membershipTypeName%></option>	
				 	<% }} }
					catch(Exception e){
					System.out.println("error in jsp");
					e.printStackTrace();
					}
					%>		
				</select><span class="asterisk">&nbsp;*</span></td>
				</tr>
				  <tr>
					<td class="tableLeft">Country Mail Type  name:</td>
					<td class="tableRight"><input name="countryMailTypeName" type="text" class="textboxOne" /><span class="asterisk">*</span></td>
				  </tr>
				  <tr>
					<td class="tableLeft"> Amount(<strong>$</strong>):</td>
					<td class="tableRight"><input name="countryMailPrice" type="text" class="textboxOne" /><span class="asterisk">*</span></td>
				  </tr>
				   <tr>
					<td class="tableLeft">&nbsp;</td>
					<td class="tableRight"><input type="submit" class="gradBtn" value="Create" />&nbsp;&nbsp;
					<input  type="reset" class="gradBtn" value="Cancel" /></td>
					
				  </tr>
			</table>
			
		</form>
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