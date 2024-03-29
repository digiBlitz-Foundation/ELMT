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
<%@ page import="com.hlcmeeting.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.hlccommon.util.HLCHorseRegisterationVO"%>
<%@ page import="com.hlchorse.form.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmHorseReg.js" type="text/javascript" ></script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>
<%! 
	DecimalFormat result  = new DecimalFormat("0.00");
	String amtFormat(String amtVal){
	String amountValue = "0.00";
		if(amtVal!=null && amtVal.trim().length()!=0){
		System.out.print(Double.parseDouble(amtVal));
		amountValue = result.format(Double.parseDouble(amtVal));
		}
	return amountValue;
}

%>
<%! 
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%! String dateCheck(Date fieldName){
	String detValue = "N/A";
		if(fieldName!=null){
		 detValue = sdf.format(fieldName);
		}
	return detValue;
}

%>
<%! float floatCheck(float fieldName){
	float floateValue = 0;
		if(fieldName!=0.0){
		 floateValue = fieldName;
		}
	return floateValue;
}
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
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="260" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
		<div class="cmmnForm">
		<div class="colspan">
			<strong>Membership:</strong> <span class="styleBoldTwo">Annual Registration Payment Failed Details </span> 
		</div>
		<div class="rowHead">Annual Meeting Information Section:</div>
						
<%
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
 	ArrayList pendInfo = (ArrayList) request.getAttribute("pendInfo");
	Iterator itr = pendInfo.iterator();
	while(itr.hasNext()){
	
	HLCAnnualDetVO detailVO  = (HLCAnnualDetVO) itr.next();
	
	String badgeName =  detailVO.getBadge_name();
	String ccName =  detailVO.getCc_name();
	String ccType =  detailVO.getCc_type();
	String daysApplied =  detailVO.getDays_applied();
	String meetingId =  detailVO.getMeetId();
	String paymentId =  detailVO.getPayment_id();
	String registId =  detailVO.getRegistrat_id();
   	String remarks =  detailVO.getRemarks();
	String reqstatus =  detailVO.getRequest_status();
	String txnId =  detailVO.getSsl_txn_id();
	float totalAmt =  detailVO.getTotal_amount();
%>
					
				<div class="row">
					<span class="label">Meeting ID:</span>
					<span class="formX"><span class="styleBoldOne"><%=nullCheck(meetingId)%></span></span>
			  	</div>
				<div class="row">
					<span class="label">Badge Name:</span>
					<span class="formX"><span class="styleBoldOne"><%=nullCheck(badgeName)%></span></span>
			  	</div>
			    <div class="row">
					<span class="label">Days Applied:</span>
					<%
					if(daysApplied==null || daysApplied.trim().length()==0){
						daysApplied="Full Registration";
					}
					%>
					<span class="formX"><span class="styleBoldOne"><%=daysApplied%></span></span>
	            </div>
				<div class="row">
					<span class="label">Request Status: </span>
					<span class="formX"><strong><%=nullCheck(reqstatus)%></strong></span>
				</div>
				<div class="row">
					<span class="label">Remarks:</span>
					<span class="formX"><span class="styleBoldOne"><%=nullCheck(remarks)%></span></span>
				</div>								
				<div class="rowHead">Annual Meeting Payment Information:</div>	
				<div class="row">
						<span class="label">Name On Card:</span>
						<span class="formX"><%=nullCheck(ccName)%></span>
				</div>
				<div class="row">
						<span class="label">Card Type:</span>
 						<span class="formX"><%=nullCheck(ccType)%></span>
				</div>
				<div class="row">
						<span class="label">Transaction Id:</span>
						<span class="formX"><%=nullCheck(txnId)%></span>
				</div>
				<div class="row">
						<span class="label">Amount($):</span>
						<span class="formX"><%=totalAmt%></span>
				</div>
  					<form name="annualfailPayDet" action="AnnualPendDet.do" method="post">
					<input type="hidden" name="execute" value="payProceed"  />
					<input type="hidden" name="meet_id" value="<%=meetingId%>" />
					<input type="hidden" name="pa_id" value="<%=paymentId%>" />
					<input type="hidden" name="registId" value="<%=registId%>" />
					<input type="hidden" name="badgeName" value="<%=badgeName%>"/>
					<input type="hidden" name="amt" value="<%=totalAmt%>" />
					<div class="row">
						<span class="label">&nbsp;</span>
						<span class="formX"> <input type="submit" value="Pay Amount" name="back" class="gradBtn" /></span>
			  		</div>
					</form>
					</tr>
			<%
			}
			%>
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
