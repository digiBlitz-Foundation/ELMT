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
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
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
<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<script language="javascript">
	function privPerValidate(){
		if(document.frmMeeRoleMgnPriPerm.privId.value==""){
			alert("Select any one privilege.");
			document.frmMeeRoleMgnPriPerm.privId.focus();
			return false;
		}
		return true;
	}
	
	
	function postData(){
		if(document.frmMeeRoleMgnPriPermSelect.privId.value!=""){
			document.frmMeeRoleMgnPriPermSelect.roleProcess.value = "privPermissionSelect";
			//alert(frmRewalList.eventProcess.value);
			document.frmMeeRoleMgnPriPermSelect.method="post";
			document.frmMeeRoleMgnPriPermSelect.action="roles.do";
			document.frmMeeRoleMgnPriPermSelect.submit();
		}
		else{
			document.frmMeeRoleMgnPriPermSelect.privId.focus();
		}
	}
</script>
<body>

<%
	String privId = (String) request.getAttribute("privId");
	if(privId==null){
		privId = "";
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
				<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				   <tr>
					<td colspan="2" class="tblMainHead">
						Roles &amp; Privileges: <span class="styleBoldTwo"> Permissions Mapping For Privileges </span>
					</td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">
					<!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />-->
					Check the required <strong>'Permissions'</strong> to be given for a selected <strong>'Privilege</strong>' and corresponding <strong>'Entity'</strong>. Fill the required Name for the link to be show and it's relevant Link URL too. <br />
					<br />
					<br />					</td>
				  </tr>
				  <tr>
					<td>
					
						
							
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						  <tr> 
							<td colspan="2" class="tblRowHead"> Map  Permissions: </td>
						  </tr>
						  <form name="frmMeeRoleMgnPriPermSelect"  action="roles.do" >
						<input type="hidden" name="roleProcess" value="" />
						  <tr> 
							<td class="tableLeftTxtArea"> Select A Privilege:</td>
							<td class="tableRight"><span class="alignLeft">
							<select name="privId" id="privId" class="selectboxOne" onchange="postData();">
							<option selected="selected" value="">Select One</option>
							<%
									ArrayList arrayPrivList = (ArrayList)request.getAttribute("privillegeDetails");
									if(arrayPrivList!=null && arrayPrivList.size()!=0){
										Iterator itPrivList = arrayPrivList.iterator();
										while(itPrivList.hasNext()){
											String[] priList = (String [])itPrivList.next(); //{privilegeId, privilegeName, privilegePath};
											String privilegeId = priList[0];
											String privilegeName = priList[1];
											if(privId.equals(privilegeId)){
											%>
											<option value="<%=privilegeId%>" selected="selected"><%=privilegeName%></option>
											 <%
											 }
											 
											 else{
											 %>
											 <option value="<%=privilegeId%>"><%=privilegeName%></option>
											 <%
											 }
										}
									}
							%>
							</select>
							</span></td>
						  </tr>
						  </form>
						  
						 <form name="frmMeeRoleMgnPriPerm"  action="roles.do" onsubmit="return privPerValidate();">
						<input type="hidden" name="roleProcess" value="mappingPrivPermission" />
						<input type="hidden" name="privId" value="<%=privId%>"/>
						  <%
						    String viewId = "";
							String deleteId = "";
							String createId = "";
							String editId = "";
							String viewName = "";
							String viewURL = "";
							String editName = "";
							String editURL = "";
							String createName = "";
							String createUrl = "";
							String deleteName = "";
							String deleteURL = "";
							String mapCreateId = "";
							String mapEditId = "";
							String mapViewId = "";
							String mapDeleteId = "";
							//String editStatus = "";
							String perm1 = "";
							String perm2 = "";
							String perm3 = "";
							String perm4 = "";
							String perm5 = "";
							String perm6 = "";
							String perm7 = "";
							String perm8 = "";

							String permName1 = "";
							String permURL1 = "";
							String permName2 = "";
							String permURL2 = "";
							String permName3 = "";
							String permURL3 = "";
							String permName4 = "";
							String permURL4= "";
							String permName5 = "";
							String permURL5 = "";
							String permName6 = "";
							String permURL6 = "";
							String permName7 = "";
							String permURL7= "";
							String permName8 = "";
							String permURL8 = "";

						
							String mapPermId1 = "";
							String mapPermId2 = "";
							String mapPermId3 = "";
							String mapPermId4 = "";
							String mapPermId5 = "";
							String mapPermId6 = "";
							String mapPermId7 = "";
							String mapPermId8 = "";
							
							String editStatus = "";
							
																												
							// Get Selected PrivMapid
							ArrayList arrayMapPriPermList = (ArrayList)request.getAttribute("mapDetails");
							if(arrayMapPriPermList!=null && arrayMapPriPermList.size() !=0){
								Iterator itMapPrivPermList = arrayMapPriPermList.iterator();
									while(itMapPrivPermList.hasNext()){
										editStatus = "editMapPrivPerm";
										String[] mapPrivPer = (String [])itMapPrivPermList.next(); 
										//{mapPermissionId, permissionName, accessName, accessUrl};
										String mapId = mapPrivPer[0];
										String accessName = mapPrivPer[2];
										String accessUrl = mapPrivPer[3];
										String mapPermissionName = mapPrivPer[1];
										if(mapPermissionName.equalsIgnoreCase("View")) {
											mapViewId = mapId;
											viewName = accessName;
											viewURL = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("Delete")) {
											mapDeleteId = mapId;
											deleteName = accessName;
											deleteURL = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("Add")) {
											mapCreateId = mapId;
											createName = accessName;
											createUrl = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("Edit")) {
											mapEditId = mapId;
											editName = accessName;
											editURL = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission1")) {
											mapPermId1 = mapId;
											permName1 = accessName;
											permURL1 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission2")) {
											mapPermId2 = mapId;
											permName2 = accessName;
											permURL2 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission3")) {
											mapPermId3 = mapId;
											permName3 = accessName;
											permURL3 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission4")) {
										mapPermId4 = mapId;
											permName4 = accessName;
											permURL4 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission5")) {
											mapPermId5 = mapId;
											permName5 = accessName;
											permURL5 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission6")) {
											mapPermId6 = mapId;
											permName6 = accessName;
											permURL6 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission7")) {
											mapPermId7 = mapId;
											permName7 = accessName;
											permURL7 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission8")) {
											mapPermId8 = mapId;
											permName8 = accessName;
											permURL8 = accessUrl;
										}
									}
							}
							
							// Get All Permission
							ArrayList arrayPermList = (ArrayList)request.getAttribute("permissionDetails");
								if(arrayPermList!=null && arrayPermList.size()!=0){
									Iterator itPermList = arrayPermList.iterator();
									while(itPermList.hasNext()){
										String [] perList = (String [])itPermList.next(); //{permissionId, permissionName};
										String permissionId = perList[0];
										String permissionName = perList[1];
										if(permissionName.equalsIgnoreCase("View")) viewId = permissionId;
										if(permissionName.equalsIgnoreCase("Delete")) deleteId = permissionId;
										if(permissionName.equalsIgnoreCase("Add")) createId = permissionId;
										if(permissionName.equalsIgnoreCase("Edit")) editId = permissionId;
										if(permissionName.equalsIgnoreCase("permission1")) perm1 = permissionId;
										if(permissionName.equalsIgnoreCase("permission2")) perm2 = permissionId;
										if(permissionName.equalsIgnoreCase("permission3")) perm3 = permissionId;
										if(permissionName.equalsIgnoreCase("permission4")) perm4 = permissionId;
										if(permissionName.equalsIgnoreCase("permission5")) perm5 = permissionId;
										if(permissionName.equalsIgnoreCase("permission6")) perm6 = permissionId;
										if(permissionName.equalsIgnoreCase("permission7")) perm7 = permissionId;
										if(permissionName.equalsIgnoreCase("permission8")) perm8 = permissionId;
									}
								}
								//	out.print("editStatus:" + editStatus);
								if(editStatus.equals("editMapPrivPerm")){
								%>
								
								
									
									<input type="hidden" name="editStatus" value="editMapPrivPerm" />
									
									
									<%if(mapViewId!=null && mapViewId!=""){ %>
									<input type="hidden" name="viewId" value="<%=mapViewId%>" />
									<%}else{ %>
									<input type="hidden" name="viewId" value="<%=viewId%>" />
									<%} %>
									
									<%if(mapEditId!=null && mapEditId!=""){ %>
									<input type="hidden" name="editId" value="<%=mapEditId%>" />
									<%}else{ %>
									<input type="hidden" name="editId" value="<%=editId%>" />
									<%} %>
									
									<%if(mapDeleteId!=null && mapDeleteId!=""){ %>
									<input type="hidden" name="deleteId" value="<%=mapDeleteId%>" />
									<%}else{ %>
									<input type="hidden" name="deleteId" value="<%=deleteId%>" />
									<%} %>
									
									<%if(mapCreateId!=null && mapCreateId!=""){ %>
									<input type="hidden" name="createId" value="<%=mapCreateId%>" />
									<%}else{ %>
									<input type="hidden" name="createId" value="<%=createId%>" />
									<%} %>
									
									<%if(mapPermId1!=null && mapPermId1!=""){ %>
									<input type="hidden" name="permissionId1" value="<%=mapPermId1%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId1" value="<%=perm1%>" />
									<%} %>
									
									<%if(mapPermId2!=null && mapPermId2!=""){ %>
									<input type="hidden" name="permissionId2" value="<%=mapPermId2%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId2" value="<%=perm2%>" />
									<%} %>
									
									<%if(mapPermId3!=null && mapPermId3!=""){ %>
									<input type="hidden" name="permissionId3" value="<%=mapPermId3%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId3" value="<%=perm3%>" />
									<%} %>
									
									<%if(mapPermId4!=null && mapPermId4!=""){ %>
									<input type="hidden" name="permissionId4" value="<%=mapPermId4%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId4" value="<%=perm4%>" />
									<%} %>
									
									<%if(mapPermId5!=null && mapPermId5!=""){ %>
									<input type="hidden" name="permissionId5" value="<%=mapPermId5%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId5" value="<%=perm5%>" />
									<%} %>
									
									<%if(mapPermId6!=null && mapPermId6!=""){ %>
									<input type="hidden" name="permissionId6" value="<%=mapPermId6%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId6" value="<%=perm6%>" />
									<%} %>
									
									<%if(mapPermId7!=null && mapPermId7!=""){ %>
									<input type="hidden" name="permissionId7" value="<%=mapPermId7%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId7" value="<%=perm7%>" />
									<%} %>
									
									<%if(mapPermId8!=null && mapPermId8!=""){ %>
									<input type="hidden" name="permissionId8" value="<%=mapPermId8%>" />
									<%}else{ %>
									<input type="hidden" name="permissionId8" value="<%=perm8%>" />
									<%} %>
								<%
								}
								else{
								%>
									<input type="hidden" name="editStatus" value=" " />
									<input type="hidden" name="viewId" value="<%=viewId%>" />
									<input type="hidden" name="deleteId" value="<%=deleteId%>" />
									<input type="hidden" name="createId" value="<%=createId%>" />
									<input type="hidden" name="editId" value="<%=editId%>" />
									<input type="hidden" name="permissionId1" value="<%=perm1%>" />
									<input type="hidden" name="permissionId2" value="<%=perm2%>" />
									<input type="hidden" name="permissionId3" value="<%=perm3%>" />
									<input type="hidden" name="permissionId4" value="<%=perm4%>" />
									<input type="hidden" name="permissionId5" value="<%=perm5%>" />
									<input type="hidden" name="permissionId6" value="<%=perm6%>" />
									<input type="hidden" name="permissionId7" value="<%=perm7%>" />
									<input type="hidden" name="permissionId8" value="<%=perm8%>" />
								<%
								}
						  %>
						  <tr>
						    <td colspan="2" class="alignCenter">
							
								<table width="100%" border="0" cellspacing="1" cellpadding="0" class="formLayout">
								  <tr>
									<td width="23%" class="tblRowHead">Permission </td>
									<td width="34%" class="tblRowHead">Application Name </td>
									<td width="37%" class="tblRowHead">Application URL </td>
								  </tr>
								    <tr>
									<td class="listCellBg">Permission1</td>
									<td class="listCellBg">
									
									<input name="viewName" type="text" class="textboxOne" size="25" value="<%=viewName%>" />
									</td>
									<td class="listCellBg">
									<input name="viewURL" type="text" class="textboxOne" size="35" value="<%=viewURL%>"/>
									</td>
								  </tr>
								  <tr>
									<td class="listCellBg">Permission2</td>
									<td class="listCellBg">
									<input name="editName" type="text" class="textboxOne" size="25" value="<%=editName%>" />
									</td>
									<td class="listCellBg">
									<input name="editURL" type="text" class="textboxOne" size="35" value="<%=editURL%>"/>
									</td>
								  </tr>
								  <tr>
									<td class="listCellBg">Permission3</td>
									<td class="listCellBg">
									<input name="createName" type="text" class="textboxOne" size="25" value="<%=createName%>"/>
									</td>
									<td class="listCellBg">
									<input name="createUrl" type="text" class="textboxOne" size="35" value="<%=createUrl%>"/>
									</td>
								  </tr>
								  <tr>
									<td class="listCellBg">Permission4</td>
									<td class="listCellBg">
									<input name="deleteName" type="text" class="textboxOne" size="25" value="<%=deleteName%>"/>
									</td>
									<td class="listCellBg">
									<input name="deleteURL" type="text" class="textboxOne" size="35" value="<%=deleteURL%>"/>
									</td>
								  </tr>
								  <tr>
									<td class="listCellBg">Permission5</td>
									<td class="listCellBg">
									
									<input name="perName1" type="text" class="textboxOne" size="25" value="<%=permName1%>" />
									</td>
									<td class="listCellBg">
									<input name="perURL1" type="text" class="textboxOne" size="35" value="<%=permURL1%>"/>
									</td>
								  </tr>
								  <tr>
									<td class="listCellBg">Permission6</td>
									<td class="listCellBg">
									<input name="perName2" type="text" class="textboxOne" size="25" value="<%=permName2%>" />
									</td>
									<td class="listCellBg">
									<input name="perURL2" type="text" class="textboxOne" size="35" value="<%=permURL2%>"/>
									</td>
								  </tr>
								  <tr>
									<td class="listCellBg">Permission7</td>
									<td class="listCellBg">
									<input name="perName3" type="text" class="textboxOne" size="25" value="<%=permName3%>"/>
									</td>
									<td class="listCellBg">
									<input name="perURL3" type="text" class="textboxOne" size="35" value="<%=permURL3%>"/>
									</td>
								  </tr>
								  <tr>
									<td class="listCellBg">Permission8</td>
									<td class="listCellBg">
									<input name="perName4" type="text" class="textboxOne" size="25" value="<%=permName4%>"/>
									</td>
									<td class="listCellBg">
									<input name="perURL4" type="text" class="textboxOne" size="35" value="<%=permURL4%>"/>
									</td>
								  </tr>
								   <tr>
									<td class="listCellBg">Permission9</td>
									<td class="listCellBg">
									<input name="perName5" type="text" class="textboxOne" size="25" value="<%=permName5%>"/>
									</td>
									<td class="listCellBg">
									<input name="perURL5" type="text" class="textboxOne" size="35" value="<%=permURL5%>"/>
									</td>
								  </tr>
								   <tr>
									<td class="listCellBg">Permission10</td>
									<td class="listCellBg">
									<input name="perName6" type="text" class="textboxOne" size="25" value="<%=permName6%>"/>
									</td>
									<td class="listCellBg">
									<input name="perURL6" type="text" class="textboxOne" size="35" value="<%=permURL6%>"/>
									</td>
								  </tr>
								   <tr>
									<td class="listCellBg">Permission11</td>
									<td class="listCellBg">
									<input name="perName7" type="text" class="textboxOne" size="25" value="<%=permName7%>"/>
									</td>
									<td class="listCellBg">
									<input name="perURL7" type="text" class="textboxOne" size="35" value="<%=permURL7%>"/>
									</td>
								  </tr>
								   <tr>
									<td class="listCellBg">Permission12</td>
									<td class="listCellBg">
									<input name="perName8" type="text" class="textboxOne" size="25" value="<%=permName8%>"/>
									</td>
									<td class="listCellBg">
									<input name="perURL8" type="text" class="textboxOne" size="35" value="<%=permURL8%>"/>
									</td>
								  </tr>
								</table>
							
							</td>
					      </tr>
						  <tr> 
							<td colspan="2" class="alignCenter">
							<input type="submit" value="Submit" class="gradBtn" />
						    <input name="button" type="submit" class="gradBtn" value="Cancel" /></td>
						  </tr>
						  </form>
						  <tr> 
							<td colspan="2" class="alignCenter">&nbsp;<!-- DO NOT DELETE THIS ROW --></td>
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