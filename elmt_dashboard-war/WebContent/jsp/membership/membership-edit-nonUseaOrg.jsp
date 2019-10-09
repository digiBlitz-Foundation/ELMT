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
<script src="javascripts/frmAddNonUseaOrg.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
<script language="javascript">
//-------------------------------------Non-HLC Edit Organization Name------------------------------------------------------------


function myvalidateEdit(){

if(document.frmAddNonUseaOrg.hlctyp.value=="" || (document.frmAddNonUseaOrg.hlctyp.value.indexOf(' ')==0))
   {alert(" Non-HLC Organization Name cannot be empty ");
     document.frmAddNonUseaOrg.hlctyp.focus();
    return false; }
	
	if((document.frmAddNonUseaOrg.hlctyp.value.length >80 ))
 {alert("Non-HLC Organization Name exceeds the maximum of 80 characters");
  document.frmAddNonUseaOrg.hlctyp.focus();
 return false;}
 
 
    return true;
    }
	</script>

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
	HLC Membership: <span class="styleBoldTwo">Edit New Non Organization</span>	</td>
  </tr>
  <tr>
    <td colspan="2" class="tblDescrp"><strong>Edit Non Organization Name </strong><br />
	</td>
  </tr>
  <tr>
  	<td>
	
	<form name="frmAddNonUseaOrg" id="frmAddNonUseaOrg" method="post" action="./nonhlc.do" onsubmit="return myvalidateEdit();"/>
		
		    
			<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				  <tr>
					<td colspan="2" class="tblRowHead">
						Edit Non Organization </td>
				  </tr>
				  <tr>
					  <td colspan="2">Fields marked with an asterisk (*) are required.</td>
				  </tr>			
			<%
				String errSt = (String)request.getAttribute("err");
				if(errSt.equals("st")){
			%>	
			 <tr> 	<td height="25" colspan="2" class="styleError">Name Exists already!</td>	</tr>				  
			<%
				}
                String[] edit=(String[])request.getAttribute("nonUseaEdPage");
            %>			
				  <tr>
					<td class="tableLeft">Non-HLC Organization Name:</td>
                <td class="tableRight"><input name="hlctyp" type="text" value="<%=edit[1]%>" class="textboxOne">&nbsp;<span class="asterisk">&nbsp;*</span></td>
                     <input name="hlctypid" type="hidden" value="<%=edit[0]%>" class="textboxOne" >
                         
				  </tr>
				   <tr>
					<td class="tableLeft">&nbsp;</td>
					<td class="tableRight"><input name="process" type="submit" class="gradBtn" value="Update" />
					<input  type="button"  class="gradBtn" value="Cancel" onclick="javascript:history.back(-1);" /></td>
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