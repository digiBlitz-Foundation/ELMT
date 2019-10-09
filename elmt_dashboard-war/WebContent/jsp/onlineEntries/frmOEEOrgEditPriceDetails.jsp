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
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmOEEOrgEditPriceDetails.js" type="text/javascript" ></script>

<link href="css/core-ie.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%! 
String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>




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
				
<table  border="0" width="100%" cellpadding="0" cellspacing="0"  align="center" class="tblInnerContainer">
  <tr>
    <td colspan="13" class="tblMainHead">
	Online Entries : <span class="styleBoldTwo">Edit Price Details</span></td>
  </tr>
  <%    String eventId=(String)request.getAttribute("eventId");
  		String itemID = (String)request.getAttribute("itemId");
		String updateStatus = (String)request.getAttribute("updateStatus");
		String iStatus = "";
	    if(updateStatus!=null && updateStatus.equalsIgnoreCase("success")) iStatus = "Price Details Updated Successfully";
		else if(updateStatus!=null && updateStatus.equalsIgnoreCase("failed")) iStatus = "Price Details Not Updated";
			
  %>
 <tr>
 	<td>
		 <table border="0" cellpadding="0" align="center" cellspacing="1" class="formLayout">
		 <%
		 	if(updateStatus!=null && updateStatus.trim().length()!=0){
		 %>
		 <tr>
		 <td class="styleError" colspan="13"><%=iStatus%></td>
		 </tr>
		 <%}%> 
	
		  <form name="frmInsertPrice" id="frmInsertPrice" action="OEEAddPrice.do" method="post" onsubmit="return myValidate();">
		  <input type="hidden" name="cmd" value="updatePriceByOrg"/>
		  <input type="hidden" name="eventId" value="<%=eventId%>"/>
		  <input type="hidden" name="itemId" value="<%=itemID%>"/>
		 <tr>
		 <td colspan="12">
		 Item Name:&nbsp;&nbsp;
		 
			<%  ArrayList itemDetails = (ArrayList)request.getAttribute("itemDetails"); 
				if(itemDetails!=null && itemDetails.size()!=0){
					Iterator itr= itemDetails.iterator();
					while(itr.hasNext()){
						String[] s = (String[]) itr.next();
						String itemId = s[0];
						String itemName1 = s[1];
						if(itemID!=null && itemID.equalsIgnoreCase(itemId)){
			%>
			<%=itemName1%>
			<%}}}%>
		 </select>
		  </td>
		  </tr> 
		  
			<tr>
			<td class="tblRowHeadTwo">Event Level</td>
			<td class="tblRowHeadTwo">Due Date Price&nbsp;&nbsp;</td>
			<td class="tblRowHeadTwo">After-Due Date Price </td>
			<td class="tblRowHeadTwo">Deposit Amount</td>
			<!--<td class="tblRowHeadTwo">Type</td>-->
			
			</tr>
			<%
			String eventcnt="";
			ArrayList eventType = (ArrayList)request.getAttribute("eventType");
			if(eventType!=null && eventType.size()!=0){
			
			%>
		   <%   
				Iterator itr = eventType.iterator();

					int i=0;
					int j=0;
					while(itr.hasNext()){
						String [] uDet = (String[])itr.next();
						String eventTyId = uDet[0];
						String eventTypeName =uDet[1];
						i++;
						%>
					<tr>
					<td  colspan="14"class="tblMainHead"><%=eventTypeName%></td>
					</tr>
						<%
						ArrayList eventLevel = (ArrayList)request.getAttribute("HLCEventDetails");
						HLCPriceMatrixVO priceVO = new HLCPriceMatrixVO();
						if(eventLevel!=null && eventLevel.size()!=0){
						Iterator it = eventLevel.iterator();
						
						while(it.hasNext()){
							priceVO = (HLCPriceMatrixVO)it.next();
							String priceId=priceVO.getPriceId();
							String eventTyId1 = priceVO.getEventTypeId();
							String eventTypeName1 =priceVO.getEventTypeName();
							String eventLeId = priceVO.getEventLevelId();
							String eventLevelName =priceVO.getEventLevelName();
							String duePrice=String.valueOf(priceVO.getDueDatePrice()); 
							String afterDuePrice=String.valueOf(priceVO.getAfterDueDatePrice()); 
							String depAmt=String.valueOf(priceVO.getDepositPrice()); 
							
						if(eventTyId1.equals(eventTyId)){
						j++;
			%>
<input type="hidden" name="noChampSize" id="noChampSize" value="<%=eventLevel.size()%>"/>
<input type="hidden" name="eventcnt<%=j%>" id="eventcnt<%=j%>" value="<%=eventcnt%>"/>
<input type="hidden" name="priceId<%=j%>" id="priceId<%=j%>" value="<%=priceId%>"/>
<%System.out.println("priceId :"+priceId);%>
<%System.out.println("noChampSize :"+eventLevel.size());%>
	
<tr>
<td class="alignCenter"><%=eventLevelName%></td>
			
<td class="alignCenter"><input type="text" name="txtDue<%=j%>" id="txtDue<%=j%>" class="textboxOne" value="<%=duePrice%>" size="20"  /></td>

<td class="alignCenter"><input type="text" name="txtAfterDue<%=j%>" id="txtAfterDue<%=j%>" value="<%=afterDuePrice%>" class="textboxOne" size="20"  /></td>
<td class="alignCenter"><input type="text" name="txtDepAmt<%=j%>" id="txtDepAmt<%=j%>" value="<%=depAmt%>" class="textboxOne" size="20" /></td>
	
 </tr>
   
		   <%}}}}}else{%>
	  		<tr>
			<td height="19" bgcolor="#E3E1D2" colspan="8" align="center"><strong>No Records Found</strong></td>
           </tr>
		   <%}%>
	
	<tr>
	<td  colspan="14"class="tblMainHead">Championship Details :</td>
	</tr>
	
		 <tr>
			<td class="tblRowHeadTwo">Event Level</td>
			<td class="tblRowHeadTwo">Due Date Price&nbsp;&nbsp;</td>
			<td class="tblRowHeadTwo">After-Due Date Price </td>
			<td class="tblRowHeadTwo">Deposit Amount</td>
			
		   </tr>
		   
		   <%
		    String champcnt="";
			ArrayList eventTypeChamp = (ArrayList)request.getAttribute("eventTypeChamp");
			if(eventTypeChamp!=null && eventTypeChamp.size()!=0){
			%>
			<%
				Iterator itr = eventTypeChamp.iterator();
				int k=0;
				int m=0;
				while(itr.hasNext()){
					String [] uDet = (String[])itr.next();
					String eventTyId = uDet[0];
					String eventTypeName =uDet[1];
				k++;
				%>
				<tr>
				<td  colspan="14"class="tblMainHead"><%=eventTypeName%></td>
				</tr>
				<%
				ArrayList eventLevelChamp = (ArrayList)request.getAttribute("champDetails");
				HLCPriceMatrixVO priceVO = new HLCPriceMatrixVO();
						if(eventLevelChamp!=null && eventLevelChamp.size()!=0){
						Iterator it = eventLevelChamp.iterator();
							while(it.hasNext()){
							priceVO = (HLCPriceMatrixVO)it.next();
							String CpriceId=priceVO.getPriceId();
							String eventTyId1 = priceVO.getEventTypeId();
							String eventTypeName1 =priceVO.getEventTypeName();
							String eventLeId = priceVO.getEventLevelId();
							String eventLevelName =priceVO.getEventLevelName();
							String duePrice=String.valueOf(priceVO.getDueDatePrice()); 
							String afterDuePrice=String.valueOf(priceVO.getAfterDueDatePrice()); 
							String depAmt=String.valueOf(priceVO.getDepositPrice()); 
						   
						if(eventTyId1.equals(eventTyId)){
						m++;
			%>
 <input type="hidden" name="champSize" id="champSize" value="<%=eventLevelChamp.size()%>"/>
 <input type="hidden" name="champcnt<%=m%>" id="champcnt<%=m%>" value="<%=champcnt%>"/>
 <input type="hidden" name="CpriceId<%=m%>" id="CpriceId<%=m%>" value="<%=CpriceId%>"/>
 <%System.out.println("champSize :"+eventLevelChamp.size());%>
 <%System.out.println("CpriceId :"+CpriceId);%>
<tr>
<td class="alignCenter"><%=eventLevelName%></td>
			
<td class="alignCenter"><input type="text" name="txtDueC<%=m%>" id="txtDueC<%=m%>" class="textboxOne" value="<%=duePrice%>" size="20"  /></td>
	
<td class="alignCenter"><input type="text" name="txtAfterDueC<%=m%>" id="txtAfterDueC<%=m%>" class="textboxOne" value="<%=afterDuePrice%>" size="20"  /></td>	

<td class="alignCenter"><input type="text" name="txtDepAmtC<%=m%>" id="txtDepAmtC<%=m%>" class="textboxOne" value="<%=depAmt%>" size="20"  /></td>	


		   </tr>
		  <%}}}}}else{%>
	  		<tr>
			<td height="19" bgcolor="#E3E1D2" colspan="8" align="center"><strong>No Records Found</strong></td>
           </tr>
		   <%}%>
		  	     <tr>
					<td colspan="12" align="center">
					<input type="submit" name="appButton" id="appButton" value="Update" class="gradBtn"  />	</td>
				  </tr>
				   </form>
	  </table>
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