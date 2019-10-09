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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmGrossAmtMast.js" type="text/javascript" ></script>
<script language="javascript">
	function validatePriceList(){
		if(document.frmMeePriceMaster.eventTypeId.value==""){
			alert("Please select any one Event Type.");
			document.frmMeePriceMaster.eventTypeId.focus();
			return false;
		}
		
		if(document.frmMeePriceMaster.specId.value==""){
			alert("Please select any one Specification.");
			document.frmMeePriceMaster.specId.focus();
			return false;
		}
		if(document.frmMeePriceMaster.selUserType.value==""){
			alert("Please select any one User Type.");
			document.frmMeePriceMaster.selUserType.focus();
			return false;
		}
		
		if(document.frmMeePriceMaster.duePrice.value==""){
			alert("The Normal Amount Field can't be blank");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
	
		if(!Number(document.frmMeePriceMaster.duePrice.value)){
			alert("Enter valid Normal Amount");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
		if(document.frmMeePriceMaster.duePrice.value.indexOf('.')>7){
			alert("Enter valid Normal Amount");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
		if((document.frmMeePriceMaster.duePrice.value.indexOf('.'))==-1){
			if(document.frmMeePriceMaster.duePrice.value.length>7){
				alert("Enter valid Normal Amount");
				document.frmMeePriceMaster.duePrice.focus();
				return false;
			}
		}
			
		if(!(document.frmMeePriceMaster.duePrice.value=="")){
			if((document.frmMeePriceMaster.duePrice.value.indexOf('.'))!=-1){
				fstr=document.frmMeePriceMaster.duePrice.value;
				fstr1=document.frmMeePriceMaster.duePrice.value.lastIndexOf('.');
				mm = (fstr.substring(fstr1,document.frmMeePriceMaster.duePrice.value.length));
				str=(Number(mm.length));
				if((str)>3){
					alert("Normal Amount is not valid");
					document.frmMeePriceMaster.duePrice.focus();
					return false;
				}
			}
		}


		if(document.frmMeePriceMaster.afterPrice.value==""){
			alert("The After Due Amount Field can't be blank");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
	
		if(!Number(document.frmMeePriceMaster.afterPrice.value)){
			alert("Enter valid After Due Amount");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
		if(document.frmMeePriceMaster.afterPrice.value.indexOf('.')>7){
			alert("Enter valid After Due Amount");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
		if((document.frmMeePriceMaster.afterPrice.value.indexOf('.'))==-1){
			if(document.frmMeePriceMaster.afterPrice.value.length>7){
				alert("Enter valid After Due Amount");
				document.frmMeePriceMaster.afterPrice.focus();
				return false;
			}
		}
			
		if(!(document.frmMeePriceMaster.afterPrice.value=="")){
			if((document.frmMeePriceMaster.afterPrice.value.indexOf('.'))!=-1){
				fstr=document.frmMeePriceMaster.afterPrice.value;
				fstr1=document.frmMeePriceMaster.afterPrice.value.lastIndexOf('.');
				mm = (fstr.substring(fstr1,document.frmMeePriceMaster.afterPrice.value.length));
				str=(Number(mm.length));
				if((str)>3){
					alert("After Due Amount is not valid");
					document.frmMeePriceMaster.afterPrice.focus();
					return false;
				}
			}
		}

		
		return true;
	}

</script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> --> 
</head>
<%
	String priceDetails[] = (String[])request.getAttribute("priceDetails");
	String priceDetId = priceDetails[0];
	String specId = priceDetails[1];
	String userTyId = priceDetails[2];
	String eventTypeId = priceDetails[3];
	
	String dueDatePrice = priceDetails[4];
	String afterDueDatePrice = priceDetails[5];
	String userTypeName = priceDetails[6];
	
	String specName = priceDetails[7];
	String eventName = priceDetails[8];
// {priceDetId,specId,userTyId,eventTypeId, dueDatePrice, afterDueDatePrice, userTypeName, specName, eventName};
%>
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

<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">


  <tr>
    <td colspan="2" class="tblMainHead"><strong></strong> Meetings: <span class="styleBoldTwo">Price Detail Master </span></td>
  </tr>
 
  <tr>
  	<td>
	
<form name="frmMeePriceMaster" id="frmMeePriceMaster" action="addPriceMasterList.do" method="post" onsubmit="return validatePriceList();" >
	<input type="hidden" name="priceMasterProcess" value="editPriceMaster">
	<input name="priceDetId" type="hidden" value="<%=priceDetId%>">

			<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				  <tr>
					<td colspan="2" class="tblRowHead">Edit A Price Detail:</td>
				  </tr>
				  <% String statuscheck = (String)request.getAttribute("err");
					if(statuscheck!=null && statuscheck.equals("st")){
					%>
					<tr>
					<td colspan="2" class="styleError"><strong>Specification Id And Activity Id Already Exists. Try  Again.</strong></td>
					</tr>
					<%
					}
					%>
				  
				   <tr>
				     <td class="tableLeft">Event Type :</td>
				     <td class="tableRight">
						<select name="eventTypeId" id="eventTypeId" class="selectboxOne" >
						<option selected="selected" value="">Select One</option>
						<%
						Vector eventTypeList = (Vector)request.getAttribute("eventTypeList");
						if(eventTypeList!=null && eventTypeList.size()!=0){
						Enumeration itEventType = eventTypeList.elements();
						while(itEventType.hasMoreElements()){
							String[] eduDet =(String[])itEventType.nextElement();
							String ETid = eduDet[0];
							String activityName1 = eduDet[1];
							if(eventTypeId.equals(ETid)){
						%>
						
						<option value="<%=ETid%>" selected="selected"><%=activityName1%></option>
					 <%
					 }
					 else{
					 %>
					 <option value="<%=ETid%>"><%=activityName1%></option>
					 <%
					 }
			  }
			}
			  %>
			</select>

				 	 <span class="asterisk">*</span>					 </td>
		     	  </tr>
				  <tr>
				     <td class="tableLeft">Specification:</td>
				     <td class="tableRight">
					<select name="specId" id="specId" class="selectboxOne" >
					<option selected="selected" value="">Select One</option>
					<%
						Vector specList = (Vector)request.getAttribute("specList");
						if(specList!=null && specList.size()!=0){
						Enumeration it = specList.elements();
						while(it.hasMoreElements()){
						String[] speciList =(String[])it.nextElement();
						String specificationId = speciList[0];
						String specificationName = speciList[1];
						//String [] speciList  = {specificationId,specificationName};
						if(specId.equals(specificationId)){
												%>
						<option value="<%=specificationId%>" selected="selected"><%=specificationName%></option>
					 <%
					 }
					 else{
					 %>
					 <option value="<%=specificationId%>"><%=specificationName%></option>
					 <%
					 }
					  }
					}
					  %>							
			 </select>
				 	 <span class="asterisk">*</span>	
				 					 </td>
		     	  </tr>

				  <tr>
				     <td class="tableLeft">User Type :</td>
				     <td class="tableRight">
					 
					 	<select name="selUserType" id="selUserTypeId" class="selectboxOne">
							<option selected="selected" value="">Select One</option>
							<%
							Vector userTypeDetail = (Vector)request.getAttribute("userTypeVec");
							if(userTypeDetail!=null && userTypeDetail.size()!=0){
							Enumeration it1 = userTypeDetail.elements();
							while(it1.hasMoreElements()){
							String[] eduDet1 =(String[])it1.nextElement();
							String userTypeId = eduDet1[0];
							String userTypeNameLocal = eduDet1[1];
							if(userTyId.equals(userTypeId)){
							%>
							
							<option value="<%=userTypeId%>" selected="selected"><%=userTypeNameLocal%></option>
						 <%
						 }
						 else{
						 %>
						 	<option value="<%=userTypeId%>"><%=userTypeNameLocal%></option>
						 <%
						 }
						  }
						}
					  %>
				</select>
					
							
				 	 <span class="asterisk">*</span> </td>
		     	  </tr>
				  <tr>
					<td class="tableLeft">Normal Price :</td>
					<td class="tableRight"><strong>$</strong>
                        <input name="duePrice" type="text" class="textboxOne" size="8" value="<%=dueDatePrice%>" />
                    	<span class="asterisk">*</span>
					</td>
				  </tr>
			      <tr>
					<td class="tableLeft">After Due Date Price :</td>
					<td class="tableRight">
					<strong>$</strong> <input name ="afterPrice" type="text" class="textboxOne" size="8" value="<%=afterDueDatePrice%>" />
				 	 <span class="asterisk">*</span>
					</td>
				  </tr>

			      <tr>
					<td class="tableLeft">&nbsp;</td>
					<td class="tableRight">
					<input type="submit" value="Update" class="gradBtn"  />
					&nbsp;
					<input type="button" value="Cancel" class="gradBtn" onclick="javascript:history.back(-1);" />					</td>
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