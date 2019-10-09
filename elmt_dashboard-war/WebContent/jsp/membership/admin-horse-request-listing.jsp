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
<%@ page import="java.text.*"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script language="javascript">
function horsrTrnsEdit(payId){
	strURL = "./RegHorseListing.do?process=adminChangeTransacDet&pid="+payId;
	window.location.href = strURL;	
}
function postData(status) {
	if(status==""){
		alert("Select Any one Status");
	}
	else{
		strURL = "./RegHorseListing.do?process=requestFrmList&status="+status;
		window.location.href = strURL; 	
	}
}

</script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
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
   <%! SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
   String dateCheck(Date fieldName){
        String detValue = "NG";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
    }
    
    %>
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
				
				
					<table width="545"  border="0"  align="center" cellpadding="0" cellspacing="0" 
class="tblInnerContainer">
					  <tr>
						<td colspan="5" class="tblMainHead">
						Membership: <span class="styleBoldTwo">Admin Non-Human Member Registration 
Listing </span></td>
					  </tr>
					  <tr>
						<td colspan="5" class="tblDescrp">
							The Non-Human Member's request with are listed as follows. <br />
							<br />
							To Approve a Non-Human Member's account, click on the 
<strong>'Approve'</strong> button beside it.</td>
					  </tr>
					 
					 <tr>
						<td>
							 <table width="523" border="0" align="center" cellpadding="0" 
cellspacing="1" class="formLayout">
							 <%
								 String status = (String) request.getAttribute("status");
								 if(status==null) status = "";
							 %>
					   <form name="frmmemRegiList">
					   		<input type="hidden" name="process" value="requestFrmList"/>
								<tr>
								<td height="25" colspan="5"  bgcolor="#ffffff" 
class="alignLeft">&nbsp;&nbsp;<strong>Status:</strong>
								  <select name="status" class="selectboxOne"  
onchange="postData(this.value);">
                                    <option value="" selected="selected">Select One</option>
									<%
										if(status.equalsIgnoreCase("true")) { 
									%>
                                    <option  value="true" selected="selected">Processed</option>
									<%
									}
									else{
									%>
	                                   <option  value="true">Processed</option>
									<%
									}
									%>
									<%
									if(status.equalsIgnoreCase("false")) { 
									%>
                                    <option  value="false" selected="selected">Pending</option>
									<%
									}
									else{
									%>
	                                   <option  value="false">Pending</option>
									<%
									}
									%>
                                  </select></td>
						       </tr>
						</form>
						  <tr>
								<td width="111" height="27" class="tblRowHeadTwo">Non-Human 
Member Id</td>
								<td width="147" class="tblRowHeadTwo">Registered By </td>	
															
								<td width="124" class="tblRowHeadTwo">Date Of Registration 
</td>
								<td width="113" class="tblRowHeadTwo">Approve </td>
								<td width="112" class="tblRowHeadTwo">Transaction 
Details</td>
								<!--<td width="91" class="tblRowHeadTwo">Renew</td>
								-->
							   </tr>
						      
						<%
							ArrayList reqList = (ArrayList)request.getAttribute("reqList");
							if(reqList!=null && reqList.size()!=0){
							Iterator itr = 	reqList.iterator();
							while(itr.hasNext()) {
								HLCRequestHorseDetVO objReqList = (HLCRequestHorseDetVO) 
itr.next();
								String requestId = objReqList.getRequestId();
								String horseMemberId = objReqList.getHorseMemberId();
								Date reqDate = objReqList.getReqDate();
								String regBy = objReqList.getRequestedBy();
								String paymentId = objReqList.getPaymentId();
								%>
								<form name="testfrm" action="AdminHorseEdit.do" 
method="post">
								 <input type="hidden" name="process" value="reqHrFrmView"/>
									<input type="hidden" name="memid" 
value="<%=horseMemberId%>"/>
									<input type="hidden" name="requestId" 
value="<%=requestId%>"/>
									 <tr>
										<td height="26" bgcolor="#E3E1D2" 
class="alignCenter"><a href="./RegHorseListing.do?process=processDesc&memid=<%=horseMemberId%>"><%=horseMemberId%></a></td>
										<td bgcolor="#E3E1D2" 
class="alignCenter"><%=regBy%></td>								
										<td bgcolor="#E3E1D2" 
class="alignCenter"><%=dateCheck(reqDate)%></td>
										<td bgcolor="#E3E1D2" class="alignCenter">
										<%
										String  enableStatus = "";
										if(status.equalsIgnoreCase("true")) { 
											enableStatus= "disabled";
										}
										%>
											<input type="submit" name="click" 
value="Approve"  <%=enableStatus%>  class="twoBtn"/>
											
										</td>
										<td bgcolor="#E3E1D2" 
class="alignCenter"><input type="button" name="click" value="Edit" class="twoBtn" 
onclick="horsrTrnsEdit('<%=paymentId%>');"/></td>
								  </tr>
							</form>
							<%
							}
							} else
							{
						   %>
							  <tr>
								<td height="25" colspan="4" class="alignCenter"><strong>No 
Records Found!</strong></td>
							   </tr>
							<% } %>
							  <tr>
								<td height="19" colspan="4">&nbsp;</td>
							   </tr>
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