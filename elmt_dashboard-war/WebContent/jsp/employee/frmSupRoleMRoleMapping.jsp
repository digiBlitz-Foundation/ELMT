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
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="java.util.*" errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<script language="javascript">

function checkAll(chkBoxName) {
	//alert(chkBoxName);
	//alert(chkBoxName.substring(0,chkBoxName.length-3));
	var chkBoxNameChk = chkBoxName.substring(0,chkBoxName.length-3);
     el = document.forms['frmRoleEntPriv'].elements;
     for (i=0; i < el.length; i++) {
       if(el[i].type == "checkbox") {
          if(el[i].checked== true && el[i].value== chkBoxName) {
            //alert("ok");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox" && el[j].name == chkBoxNameChk) {
                  void(el[j].checked=1);
               }
            }
            break;
          }
          if(el[i].checked== false && el[i].value== chkBoxName) {
            //alert("uncheck");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox" && el[j].name == chkBoxNameChk) {
			   	// alert(el[j].name);
                  void(el[j].checked=0);
               }
            }
          } 
       }
     }
 }
 
function checkAll (index,frmRoleEntPriv) {

		     var cntPerm =0;
			var cntPriv =0;

				 for(var j =0;j<document.frmRoleEntPriv.chk.length;j++)
				 {
						var chkPerm = document.frmRoleEntPriv.chk[j].value;
						var privPerm = chkPerm.substring(0,chkPerm.indexOf('!'));

						if(privPerm == frmRoleEntPriv)
						{

 							 if(document.frmRoleEntPriv.chkAll[index].checked ==true )
							 {
									document.frmRoleEntPriv.chk[j].checked = true;

									for(k=0;k<document.frmRoleEntPriv.subPermChk.length;k++)
									{
										//alert(chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length)+"=="+document.frmRoleEntPriv.subPermChk[k].value.substring(0,document.frmRoleEntPriv.subPermChk[k].value.indexOf('#')));
										//alert(chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length)+'===='+document.frmRoleEntPriv.subPermChk[k].value.substring(0,document.frmRoleEntPriv.subPermChk[k].value.indexOf('#')));
										var chkSubPerm = document.frmRoleEntPriv.subPermChk[k].value;
										var priPrem=chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length);
										var suPrem=chkSubPerm.substring(0,chkSubPerm.indexOf('#'));
										if(priPrem==suPrem)
										{
											document.frmRoleEntPriv.subPermChk[k].checked = true;
										}

									}
							 }

							 if(document.frmRoleEntPriv.chkAll[index].checked ==false )
							 {
									document.frmRoleEntPriv.chk[j].checked = false;

									for(k=0;k<document.frmRoleEntPriv.subPermChk.length;k++)
									{
										//alert(chkPerm.substring(chkPerm.indexOf('!'),chkPerm.length)+"=="+document.frmRoleEntPriv.subPermChk[k].value.substring(0,document.frmRoleEntPriv.subPermChk[k].value.indexOf('#')));
										var chkSubPerm = document.frmRoleEntPriv.subPermChk[k].value;
										var priPrem=chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length);
										var suPrem=chkSubPerm.substring(0,chkSubPerm.indexOf('#'));
										if(priPrem==suPrem)
										{
											document.frmRoleEntPriv.subPermChk[k].checked = false;
										}

									}
							 }

						}


				 }
      }


function chkPrivilege(obj,privId,permId)
{

    var permSubPermId = new Array();

	for(var i=0; i<document.frmRoleEntPriv.subPermChk.length;i++)
	{
		permSubPermId = document.frmRoleEntPriv.subPermChk[i].value.split('#');
		if(permId==permSubPermId[0])
		{
			if(obj.checked==true)
				document.frmRoleEntPriv.subPermChk[i].checked=true;
			else
				document.frmRoleEntPriv.subPermChk[i].checked=false;
		}
	}

	var privIndex = 0;
	var vFlag = false;
	var chkPermArray = new Array();
	//var chkPermlist = new generic.list();
	//var chkPermlist= new list();
	var permIndex =0;
	var cntt=0;
	//alert(obj.value);

	for(var i =0;i<document.frmRoleEntPriv.chkAll.length;i++)
	{
		var allPrivId = document.frmRoleEntPriv.chkAll[i].value;
		if(allPrivId == privId+'all')
		{
			document.frmRoleEntPriv.chkAll[i].checked = true;
			privIndex = i;

		}
	}



		for(var j =0;j<document.frmRoleEntPriv.chk.length;j++)
		{
			if(privId==document.frmRoleEntPriv.chk[j].value.substring(0,document.frmRoleEntPriv.chk[j].value.indexOf('!')))
			{
				chkPermArray[permIndex]=j;
			permIndex++;
			}
		}

		var cnt = 0;
        for(var k =0;k<chkPermArray.length;k++)
		{
			if(document.frmRoleEntPriv.chk[chkPermArray[k]].checked==false)
			{
				vFlag = true;
				cnt++;
			}
		}


		if(vFlag==true && chkPermArray.length==cnt)
		{
			document.frmRoleEntPriv.chkAll[privIndex].checked = false;
		}


}

function chkPermission(obj, permId, subPermId)
{

 var privPermId = new Array();

	for(var i=0; i<document.frmRoleEntPriv.chk.length;i++)
	{
		privPermId = document.frmRoleEntPriv.chk[i].value.split('!');
		if(permId==privPermId[1])
		{
			if(obj.checked==true)
			{
				document.frmRoleEntPriv.chk[i].checked=true;
				chkPrivilege(document.frmRoleEntPriv.chk[i],privPermId[0],permId);
			}
			else
			{
				document.frmRoleEntPriv.chk[i].checked=false;
				chkPrivilege(document.frmRoleEntPriv.chk[i],privPermId[0],permId);
			}
		}
	}

	for(var i=0; i<document.frmRoleEntPriv.subPermChk.length;i++)
	{
		permSubPermId = document.frmRoleEntPriv.subPermChk[i].value.split('#');
		if(permId==permSubPermId[0])
		{
			if(obj.checked==true)
				document.frmRoleEntPriv.subPermChk[i].checked=true;
			else
				document.frmRoleEntPriv.subPermChk[i].checked=false;
		}
	}




}

 function checkMain(mainChkBoxName){
 	//alert(mainChkBoxName);
	var chkValue = "uncheck";
	var chkBoxNameChk = mainChkBoxName.substring(0,mainChkBoxName.length-3);
	el = document.forms['frmRoleEntPriv'].elements;
	
 	for (j=0; j < el.length; j++) {
	   if(el[j].type == "checkbox" && el[j].name == chkBoxNameChk && el[j].checked == true) {
		  //alert("Final Value:" + chkBoxNameChk);
		  //document.getElementById(mainChkBoxName).checked=1;
		  chkValue = "checked"
	   }
	}
	
	if(chkValue == "uncheck"){
		 document.getElementById(mainChkBoxName).checked=0;
	}
	else{
		 document.getElementById(mainChkBoxName).checked=1;
	}
 }
 
 
 
function DelAll(){
	var chkValue = "";
	e = document.forms['frmRoleEntPriv'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
			var chkBoxNameChk = e[i].value.substring(e[i].value.length-3,e[i].value.length);
			//alert(chkBoxNameChk);
			 if(e[i].checked == true && chkBoxNameChk != "all") {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}
		//alert(chkValue);
		document.frmRoleEntPriv.PrivPermIds.value = chkValue;
}

function entPrivValidate(){
	if(document.frmRoleEntPriv.roleId.value==""){
		alert("Select any one Role.");
		document.frmRoleEntPriv.roleId.focus();
		return false;
	}
	if(document.frmRoleEntPriv.entityId.value==""){
		alert("Select any one Entity.");
		document.frmRoleEntPriv.entityId.focus();
		return false;
	}
	DelAll();
	return true;
}

	
	
function postData(rProcess){
	if(document.frmRoleEntPrivSelect.roleId.value!=""){
		//alert(rProcess);
		document.frmRoleEntPrivSelect.roleProcess.value = rProcess;
		//alert(frmRewalList.eventProcess.value);
		document.frmRoleEntPrivSelect.method="post";
		document.frmRoleEntPrivSelect.action="roles.do";
		document.frmRoleEntPrivSelect.submit();
	}
}
function postData(rProcess,roleId,roleName,uName){



	if(rProcess=="initSupRoleEntPriv"){
		if(document.frmRoleEntPrivSelect.roleId.value!=""){

			document.frmRoleEntPrivSelect.roleProcess.value = rProcess;
			//alert(frmRewalList.eventProcess.value);
			document.frmRoleEntPrivSelect.method="post";
			document.frmRoleEntPrivSelect.action="roles.do";
			document.frmRoleEntPrivSelect.submit();
		}
	}
	else{



	//if(document.frmRoleEntPrivSelect.roleId.value!=""){
		//alert(rProcess);

		document.frmRoleEntPrivSelect.roleProcess.value = rProcess;
		document.frmRoleEntPrivSelect.roleId.value = roleId;
		document.frmRoleEntPrivSelect.roleName.value = roleName;
		document.frmRoleEntPrivSelect.uName.value = uName;
		//alert(frmRewalList.eventProcess.value);
		document.frmRoleEntPrivSelect.method="post";
		document.frmRoleEntPrivSelect.action="roles.do";
		document.frmRoleEntPrivSelect.submit();
	}
	//}
/*else{
		if(rProcess=="initSelectRoleEnt"){
			alert("Select any one Role");
			document.frmRoleEntPrivSelect.roleId.focus();
		}
		else{
			alert("Select any one Entity");
			document.frmRoleEntPrivSelect.roleId.focus();
		}
	}*/
}
</script>
<body>

<%
	String roleId = (String) request.getAttribute("roleId");
String roleName = (String) request.getAttribute("roleName");
String uName = (String) request.getAttribute("uName");
	if(roleId==null){
		roleId = "";
	}
	
	String entityId = (String) request.getAttribute("entityId");
	if(entityId==null){
		entityId = "";
	}
String privilegeID = (String) request.getAttribute("privilegeID");
	if(privilegeID==null){
		privilegeID = "";
	}

	//String privId = "";

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
			<%--<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->

<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>--%>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<table border="1" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				   <tr>
					<td colspan="2" class="tblMainHead">
						 Modules &amp; Privileges: <span class="styleBoldTwo"> Role Mapping </span>					</td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">
					<!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />-->Check the required <strong>'Permissions'</strong> to be given for a selected <strong>'Privilege</strong>' and corresponding <strong>'Module'</strong>. Please select at least one required permission for the corresponding privilege otherwise Privilege and Permission will not be mapped. 
<br />
										</td>
				  </tr>
				  <tr>
					<td>
						
						
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						  <tr> 
							<td colspan="2" class="tblRowHead"> Map  Permissions: </td>
						  </tr>
						  <form name="frmRoleEntPrivSelect" id="frmRoleEntPrivSelect" method="post" >
						<input type="hidden" name="roleProcess" value="" />
						<input type="hidden" name="roleId" value="" />
						<input type="hidden" name="uName" value="" />
						<input type="hidden" name="roleName" value="" />
						<input type="hidden" name="empRolMap" value="empRolMap" />
						  <tr>
						    <td class="tableLeft">User Name:</td>
						    <td class="tableRight"><span class="alignLeft"><%=uName%></span></td>
						 
						   <tr>
						    <td class="tableLeft">Role Name:</td>
						    <td class="tableRight"><span class="alignLeft"><%=roleName%></span></td>
						  
					      </tr>
						  <tr> 
							<td class="tableLeftTxtArea"> Select A Module:</td>
							<td class="tableRight"><span class="alignLeft">
							<select name="entityId" id="entityId" class="selectboxOne" onchange="postData('initSelectSupRoleEntPriv','<%=roleId%>','<%=roleName%>','<%=uName%>');">
                                <option selected="selected" value="">Select One</option>
								<%
									ArrayList arrayMapRoleEntList = (ArrayList)request.getAttribute("mapDetails");
									if(arrayMapRoleEntList!=null && arrayMapRoleEntList.size()!=0){
										Iterator itRoleEntList = arrayMapRoleEntList.iterator();
										while(itRoleEntList.hasNext()){
											String[] mapEntList = (String [])itRoleEntList.next();
											//{mapEntityId, roleIdVal, entityId, roleName, entityName};
											String entId = mapEntList[2];
											String entityName = mapEntList[4];
											if(entityId.equals(entId)){
											%>
												
													<option value="<%=entId%>" selected="selected"><%=entityName%></option>
												<%	
												}
												else{
												%>
													<option value="<%=entId%>"><%=entityName%></option>
												<%
											}
										}
									}
								%>
								</select>
							</span></td>
						  </tr>
						  </form>
						  <form name="frmRoleEntPriv" id="frmRoleEntPriv" method="post" onsubmit="return entPrivValidate();">
							<input type="hidden" name="roleProcess" value="mapSupRoleEntityPrivPerms" />
							<input type="hidden" name="PrivPermIds" value="sury" />
							<input type="hidden" name="roleId" value="<%=roleId%>" />
							<input type="hidden" name="entityId" value="<%=entityId%>" />
							<input type="hidden" name="empRolMap" value="empRolMap" />
							<input type="hidden" name="uName" value="<%=uName%>" />
							<input type="hidden" name="roleName" value="<%=roleName%>" />
						    
						  <tr>
						    <td colspan="2" class="tableSpan">
										<%
										
										// Get All Permission
										String viewId = "";
										String deleteId = "";
										String createId = "";
										String editId = "";


                                   ArrayList arrayMapEntPrivList = (ArrayList)request.getAttribute("allMapPrivDetails");
										if(arrayMapEntPrivList!=null && arrayMapEntPrivList.size()!=0){
											Iterator itEntPrivList = arrayMapEntPrivList.iterator();
											int privIndex = 0;
											while(itEntPrivList.hasNext()){
												String[] mapEntPrivList = (String [])itEntPrivList.next();
												//{mapPrivilegeId, entityIdVal, privilegeId, entityName, privilegeName};
												String privMapCheck = mapEntPrivList[0];
                                                String privId = mapEntPrivList[1];
												String privilegeName = mapEntPrivList[2];

											%>
									<table width="70%" border="0" cellspacing="1" cellpadding="0" class="tableInner">
										<tr>
											<!--For Debug Starts-->
											<td class="tblMainHead" style="width:18Px;">
											<%--<td class="tblMainHead">
											<input  type="checkbox"  id="<%=privilegeName%>all"  <%=priStatus%> value="<%=privilegeName%>all" alt="Select or Deselect All" onClick="checkAll('<%=privilegeName%>all');" >--%>
											<%--<input  type="checkbox"  id="<%=privId%>all"  <%=priStatus%> value="<%=privId%>all" alt="Select or Deselect All" onClick="checkAll('<%=privId%>all');" >--%>
										<% if(privMapCheck.equalsIgnoreCase("map"))
											{%>
												<input  type="checkbox"  id="<%=privId%>all"  checked ="true" value="<%=privId%>all" alt="Select or Deselect All" name="chkAll" onClick="checkAll('<%=privIndex%>','<%=privId%>');" >
										<%
										}
										else
										{
										%>
											<input  type="checkbox"  id="<%=privId%>all"  value="<%=privId%>all" alt="Select or Deselect All" name="chkAll" onClick="checkAll('<%=privIndex%>','<%=privId%>');" >
										<%
										}
										%>
																								 </td>
											<td class="tblMainHead" colspan="2"><%=privilegeName%></td>
										</tr>

													<%
													ArrayList arrayPermList = (ArrayList)request.getAttribute("allMapPermDetails");
														if(arrayPermList!=null && arrayPermList.size()!=0){
															Iterator itPermList = arrayPermList.iterator();
															while(itPermList.hasNext()){
																String [] perList = (String [])itPermList.next(); //{permissionId, permissionName};
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
																String permMapCheck=perList[0];
																String privilegeId = perList[1];
																String permissionId = perList[2];
																String accessName = perList[3];
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
													%>


                                                                                                        <%
													//System.out.println("privilegeID.equals(privId) "+privilegeId+"==equals="+privId);
													if(privilegeId.equals(privId))
													{
                                                                                                            ArrayList arraySubPermList = (ArrayList)request.getAttribute("allSubPerm");
														if(arraySubPermList!=null && arraySubPermList.size()!=0){
															Iterator itSubPermList = arraySubPermList.iterator();
														if(permMapCheck.equalsIgnoreCase("Map"))
														{

														%>
															<tr>
													<td class="listCellBg"></td>
													<td class="listCellBg" style="width:18Px;">
															<input  type="checkbox" value="<%=privId%>!<%=permissionId%>" checked="true" name="chk" onClick="chkPrivilege(this,'<%=privId%>','<%=permissionId%>')"/>
															</td>
														</td><td class="listCellBg"><%=accessName%></td>
                                                                                                           </tr>
                                                                                                                <%
															while(itSubPermList.hasNext()){
																String [] subPerList = (String [])itSubPermList.next(); //{permissionId, permissionName};
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
																String permId=subPerList[0];
																String subPermId = subPerList[1];
                                                                                                                                String status = subPerList[2];

																	if(permId.equals(permissionId))
																	{
                                                                                                                                            if(status.equals("1"))
                                                                                                                                                {
																%>
																	<tr>
																	<td class="listCellBg"></td>
																	<td class="listCellBg" ></td>
																	<td class="listCellBg"><input  type="checkbox" value="<%=permId%>#<%=subPermId%>" name = "subPermChk" checked = "true" onClick="chkPermission(this,'<%=permId%>','<%=subPermId%>')"/><%=subPermId%> </td>
																	</tr>
																<%
																	}
																else
																		{
																	%>
																																			<tr>
																	<td class="listCellBg"></td>
																	<td class="listCellBg" ></td>
																	<td class="listCellBg"><input  type="checkbox" value="<%=permId%>#<%=subPermId%>" name = "subPermChk" onClick="chkPermission(this,'<%=permId%>','<%=subPermId%>')"/><%=subPermId%> </td>
																	</tr>

																	<%
																		}

														}
														}
																%>


														   <% }
														   else
															{%>
															<tr>
															<td class="listCellBg"></td>
													<td class="listCellBg" style="width:18Px;">
														   <input  type="checkbox" value="<%=privId%>!<%=permissionId%>" name="chk" onClick="chkPrivilege(this,'<%=privId%>','<%=permissionId%>')"/>
														   </td>
														</td><td class="listCellBg"><%=accessName%></td>
													   </tr>
                                                                                                                                                                                                                                                                              <%
															while(itSubPermList.hasNext()){
																String [] subPerList1 = (String [])itSubPermList.next(); //{permissionId, permissionName};
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
																String permId1=subPerList1[0];
																String subPermId1 = subPerList1[1];
                                                                                                                                String status1 = subPerList1[2];
																	if(permId1.equals(permissionId))
																	{
                                                                                                                                            if(permMapCheck.equalsIgnoreCase("Map"))
                                                                                                                                                {
																%>
																	<tr>
																	<td class="listCellBg"></td>
																	<td class="listCellBg" ></td>
																	<td class="listCellBg"><input  type="checkbox" value="<%=permId1%>#<%=subPermId1%>" name = "subPermChk" checked = "true" onClick="chkPermission(this,'<%=permId1%>','<%=subPermId1%>')"/><%=subPermId1%> </td>
																	</tr>
																<%
																	}
																else
																		{
																	%>
																																			<tr>
																	<td class="listCellBg"></td>
																	<td class="listCellBg" ></td>
																	<td class="listCellBg"><input  type="checkbox" value="<%=permId1%>#<%=subPermId1%>" name = "subPermChk" onClick="chkPermission(this,'<%=permId1%>','<%=subPermId1%>')"/><%=subPermId1%> </td>
																	</tr>

																	<%

																	}
																	}
														   }
														}
																%>

															 <%

														}
														%>


												<%
													   }
															   }%>
											<%
											//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
											}
											privIndex++;
											}
											%>
											</table>
											<%
											//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping

									}
									else{
									%>
										<table width="70%" border="0" cellspacing="1" cellpadding="0" class="tableInner">
											<tr>
												<td class="tblMainHead" colspan="2">
													No Privileges are Available.
												</td>
											</tr>
										</table>
									<%
									}
								%>
							</td>
					      </tr>
						  <tr>
							<td colspan="2" class="alignCenter">
							<input type="submit" value="Submit" class="gradBtn" />
						    <input name="button" type="reset" class="gradBtn" value="Clear" onClick ="postData('initSupRoleEntPriv');"/>
							  <input name="button" type="button" class="gradBtn" value="Back To List" onclick="javascript:location.href='SearchList.do?searchProcess=searchEmp'" />
							</td>
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


�

</body>
</html>