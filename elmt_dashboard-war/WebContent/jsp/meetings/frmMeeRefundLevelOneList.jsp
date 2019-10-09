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
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeICPAssessment.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>
<%@ page import="java.util.*" %> 
<script language="javascript">
function postData(dispId){
 
	frmMeeRefundRuleListing.method="post";
	frmMeeRefundRuleListing.action="./actionRefundRuleOne.do?process=list&status="+dispId;
	frmMeeRefundRuleListing.submit();
}	
</script>

<body>
<%
String  status = (String)request.getAttribute("status");
if(status==null || status.equals("")){
	status="";
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
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<table  border="0" cellpadding="0" cellspacing="0"  align="center" class="formLayout">
				  <tr>
					<td colspan="5" class="tblMainHead"><strong></strong> Meetings: <span class="styleBoldTwo">Refund Rule Detail</span></td>
				  </tr>
				  <tr>
					<td colspan="5" class="tblDescrp">
				 
					To edit a Refund Rule Type Name click on <strong>'Edit'</strong> button.</td>
				  </tr>
			 
				 <tr>
					<td>
					 <table border="0" cellpadding="3" align="center" cellspacing="1" class="formLayout">
						 <tr>
							<td colspan="5" class="tableSpan">
								
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
								   <tr>
									  <th width="75" height="15" class="alignLeft">Status: </th>
									  <th width="405" class="alignLeft">
							<form name="frmMeeRefundRuleListing" method="post" action="./actionRefundRuleOne.do" /> 		 
						<select name="status" class="selectboxOne" onchange="postData(this.value);">
						<%
							if(status.equals("")){
						%>
                        <option value="" selected="selected" >Select One</option>
						<%
							}
							else{
						%>
						 	<option value="" >Select One</option>
						<%
							}%>
						<%
							if(status.equals("activate")){
						%>
                        <option value="activate" selected="selected" >Activated</option>
						<%
							}
							else{
						%>
						 	<option value="activate" >Activated</option>
						<%
							}
							if(status.equals("deactivate")){
						%>
						<option value="deactivate" selected="selected" >Deactivated</option>
						
						<%
						}
						else{
						%>
							<option value="deactivate" >Deactivated</option>
						<%
						}
						%>
                      </select>							     </th>
								  </tr>
								</table>							</td>
						 </tr>
						 </form>
				
						  <tr>
						    <td width="123" height="27" class="tblRowHead">Refund Rule Type Name</td>
						    <td width="133" class="tblRowHead">Status</td>
						    <td width="54" class="tblRowHead">Edit</td>
						  </tr>
							<%
		   		
					 Vector refundListView=(Vector)request.getAttribute("RefundAllList");
					 if(refundListView!=null && refundListView.size()!=0){ 
					 Enumeration itRefund = refundListView.elements();
					  while(itRefund.hasMoreElements()){
						    String [] refundRuleDetail  = (String[]) itRefund.nextElement();
							String refundId = refundRuleDetail[0];
							String refundName = refundRuleDetail[1];
							String refundStatus= refundRuleDetail[2];
							String refundDate = refundRuleDetail[3];
							String val = "";
				    %>
							<form name="frmMeeRefundRuleListed" method="post" action="./actionRefundRuleOne.do" /> 
							<input name="process" type="hidden" value="view">	
							<input name="refundId" type="hidden" value="<%=refundId%>">
							<input name="refundName" type="hidden" value="<%=refundName%>" >
						  <tr>
		<td height="26" class="listCellBg"><%=refundName%></td>
		<% if(refundStatus.equalsIgnoreCase("0")){ %>
		 <td class="listCellBg"><input name="btnSubmit" type="submit"  class="oneBtn" value="Activate"  /></td>
		<%} else if(refundStatus.equalsIgnoreCase("1")){	%>
		 <td class="listCellBg"><input name="btnSubmit" type="submit"  class="oneBtn" value="Deactivate"  /></td>
	     <%}%>
		 <td class="listCellBg"><input name="btnSubmit" type="submit"  class="oneBtn" value="Edit"  /></td>
		 
		 </form>

		 
						   </tr>
						
		   
					      <%	}
									}else {
								%>
								<tr>
								  <th height="25" colspan="5">No Records are available. </th>
								</tr>
								<%}%>
								

						  <!--<tr>
							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
						   </tr>-->
						  <tr>
							<td height="19" colspan="5">&nbsp;</td>
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

�

</body>
</html>