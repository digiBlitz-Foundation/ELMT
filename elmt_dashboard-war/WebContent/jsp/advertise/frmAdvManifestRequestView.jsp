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
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!--/*  Program Name    : frmAdvManifestRequestView.jsp
 *  Created Date    : September 4, 2006, 4:24 PM
 *  Author          : Punitha.R
 *  Version         : 1.6
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
<title>Integrated Enterprise Dashboard</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmSponsReg.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
</head>

<script language="javascript">

function postData(){
var form = document.getElementById('frmAdvDispLst'); 
mid = form.media.value;
if(mid==""){
document.form.displayStatus.selectedIndex = 0;
alert("Please select media type");
document.form.media.focus();
return false;
}
else if(mid!=null){  
	var form = document.getElementById('frmAdvDispLst'); 
	form.advProcess.value = "viewAdsManifest";
    form.method="post";
    form.action="./advertiseAdmin.do?mid="+mid;
    form.submit();
}

return true;
}

function postDataView(processVal){
	var form = document.getElementById('frmAdvDispLst');
	form.advProcess.value = processVal;
    form.method="post";
    form.action="advertiseAdmin.do";
    form.submit();
}

</script>

<%
String  mId = (String)request.getAttribute("mid");
if(mId==null || mId.equals("")){
	mId="";
}
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
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
			<td width="250" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			
<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>

			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->

<table  border="0" cellpadding="0" cellspacing="0"  align="center" class="tblInnerContainer">
  <tr>
    <td colspan="5" class="tblMainHead">
	HLC Advertisement: <span class="styleBoldTwo">Admin - Advertisement Request List &amp; Manifest Update and View</span></td>
  </tr>
  <tr>
    <td colspan="5" class="tblDescrp">
		The Advertisement requests are listed below. <br />
		<br />
		Select a media type to list out all the Approved advertisement requests. To view a manifest click on the <strong>View</strong> button. To manage a manifest click o nthe <strong>Manage</strong> button.   <br />
		<br />		<br />
	</td>
  </tr>
 
 <tr>
 	<td>
		<table border="0" cellpadding="3" align="center" cellspacing="1" class="formLayout">
		  <tr>
			<td colspan="5" class="tableSpan">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<th height="20" width="130" valign="top" class="alignRight">&nbsp;Color Legends:&nbsp; </th>
					
					<td valign="middle" class="alignLeft">
						<span class="legendOne">&nbsp;</span> &nbsp;Manage Manifest					</td>
					
				    <td valign="middle" class="alignLeft">
						<span class="legendTwo">&nbsp;</span> &nbsp;View					</td>
				  </tr>
				</table>			</td>
		  </tr>
		  <tr>
		   	<td colspan="6" class="tableSpan">
			<form name="frmAdvDispLst"  id="frmAdvDispLst">
			<input name="advProcess" type="hidden" value="viewAdsReqest">
				<table width="100%" align="left" border="0" cellspacing="0" cellpadding="0">
				   <tr>
					  <td width="128" height="20" valign="top" class="alignRight">&nbsp;Media Type: </td>
					  <td colspan="3" valign="middle" class="alignLeft">
					  <select name="media" class="selectboxOne"  onchange="return postData();">
								<option selected="selected" value="">Select One</option>
								<%
									Vector vMedia = (Vector)session.getAttribute("mediaList");
									if(vMedia!=null && vMedia.size()!=0){
										Enumeration emedia = vMedia.elements();
										String mediaId = "";
										String mediaName = "";
										String mediaDesc  = "";
										String mediaStatus = "";
										while(emedia.hasMoreElements()){
											String[] s = (String [])emedia.nextElement();
											mediaId = s[0];
											mediaName = s[1];
											mediaDesc  = s[2];
											mediaStatus = s[3];
											if(mediaId.equals(mId)){
									%>
									<option value="<%=mediaId%>" selected="selected"><%=mediaName%></option>
									<%}
									else{
									%>
									 <option value="<%=mediaId%>"><%=mediaName%></option>
									<%		
									}
									}
									}%>
							 </select>					  </td>
					  <th width="48" height="20" valign="top" class="alignLeft"></th>
					  <td width="206" colspan="3" valign="middle" class="alignLeft">					  </td>
				  </tr>
				</table>
			  </form>			</td>
		   </tr>
<!--		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
		      <a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			 </td>
		   </tr>
-->
		  <tr>
		    <td width="79" class="tblRowHeadTwo">Advertiser </td>
			<td width="93" class="tblRowHeadTwo">Advertising Agency </td>
			<td width="108" class="tblRowHeadTwo">Date Of Request </td>
			<td width="61" class="tblRowHeadTwo">View Manifest </td>
			<td width="63" class="tblRowHeadTwo">Manage Manifest </td>
		   </tr>
		   <%
			ArrayList vManifestList = (ArrayList)session.getAttribute("activeAdsList");
			if(vManifestList!=null && vManifestList.size()!=0){
						Iterator eDispLst = vManifestList.iterator();
						while(eDispLst.hasNext()){
						 	HLCAdvertiserVO objAdv = (HLCAdvertiserVO)eDispLst.next();
							String advertisementId = objAdv.getAdvertisementId();
							String userId = objAdv.getUserId();
							String advertiser = objAdv.getAdvertiser();
							String adAgency = objAdv.getAdAgency();
							String advReqDate = "";
							if(objAdv.getAddDate()!=null){
								advReqDate = sdf.format(objAdv.getAddDate());
							}
						//Debug.print("===============================");
					%>
						<form name="frmAdvReqView" action="advertiseAdmin.do" method="post" />
						<input name="advProcess" type="hidden" value="manageManifest">
						<input name="advId" value="<%=advertisementId%>" type="hidden" />
						  <tr>
							<td bgcolor="#E3E1D2" class="alignCenter"><a href="advertiseAdmin.do?advProcess=viewAdsDetail&advId=<%=advertisementId%>" class="linkFive"><%=advertiser%></a></td>
							<td bgcolor="#E3E1D2" class="alignCenter"><%=adAgency%></td>
							<td height="26" bgcolor="#E3E1D2" class="alignCenter"><%=advReqDate%></td>
							<td bgcolor="#E3E1D2" class="alignCenter">
							<input type="submit" name="manifest" value="Manifest" class="oneBtn" />
							</td>
							<td bgcolor="#E3E1D2" class="alignCenter">
							<input type="submit" name="manifest" value="Manage" class="twoBtn" />
							</td>
						   </tr>
						</form>
		   	<%}	
					 }
					else {
					%>
					<tr>
					  <th height="25" colspan="5" align="center">No records are available. </th>
					</tr>
					<%}%>
<!--		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;

			<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
		   </tr>
-->

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
</body>
</html>
