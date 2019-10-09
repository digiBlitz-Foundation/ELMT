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

        <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
        <script language="javascript">
function postData()
{

                var typId = document.frmAddBreedDet.uType.value ;
                //var memType = document.frmAddBreedDet.membTxt.value;


                strURL = "./RegHorseListing.do?process=reqFrmList&uTypeId="+typId;
                window.location.href = strURL;

 }
 function addRow() {
	              
                var typId = document.frmAddBreedDet.uType.value ;
                strURL = "./RegHorseListing.do?process=requFrmList&uTypeId="+typId;
                window.location.href = strURL;

            }


function editRow(tableID)

            {
				var breedId = document.frmRoleMgtListRole.uType.value ;
               if(breedId==""){
                    alert("Please select valid  Species");
					return;
                }
				
                var requestId;
                var chkCnt=0;
                var vFlag = false;
var chk=document.getElementById('chk');
                if(chk==null && breedId!="")
                {
                    alert("No Records Found");
                    return;
                }

                var chkBoxCnt = document.frmRoleMgtListRole.chk.length;
                if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
                {
                    for(var i=0;i<chkBoxCnt;i++)
                    {
                        if(document.frmRoleMgtListRole.chk[i].checked==true)
                        {
                           requestId = document.frmRoleMgtListRole.chk[i].value;
                            chkCnt++;
                        }

                    }
                }
                else
                {

                        if(document.frmRoleMgtListRole.chk.checked==true)
                        {
                           requestId = document.frmRoleMgtListRole.chk.value;
                            chkCnt++;
                        }

                }
				//Starts for checkbox 
                if(chkCnt>1)
                {
                    for(var j=0;j<chkBoxCnt;j++)
                    {
                        vFlag = true;
                        document.frmRoleMgtListRole.chk[j].checked = false;
                        document.frmRoleMgtListRole.chkAll.checked = false;
                    }
                }
                //Ends for checkbox
                if(chkCnt==0){

                    alert("Please check one record to edit.");
                    return;
                }

                if(vFlag == true)
                {
                    alert("Only one record can be edited.Please check one record to edit.");
                    return;
                }

                strURL = "./RegHorseListing.do?requestId="+requestId+"&process=edit&Submit2=Edit";
                window.location.href = strURL;


            }
function checkAll()
{

         if(document.frmRoleMgtListRole.chk!=null){
       var chkBoxCnt = document.frmRoleMgtListRole.chk.length;

       if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
       {
            for(var i=0;i<chkBoxCnt;i++)
            {

                 if(document.frmRoleMgtListRole.chkAll.checked==true)
                 {

                         document.frmRoleMgtListRole.chk[i].checked = true;
                 }
                 else
                 {
                        document.frmRoleMgtListRole.chk[i].checked = false;
                 }
            }
       }
       else
       {
             if(document.frmRoleMgtListRole.chkAll.checked==true)
             {

                     document.frmRoleMgtListRole.chk.checked = true;
             }
             else
             {
                    document.frmRoleMgtListRole.chk.checked = false;
             }
        }
	}   
}
function deleteRow(tableID) {

var breedId = document.frmRoleMgtListRole.uType.value ;
if(breedId==""){
                    alert("Please select valid  Species");
					return;
                }
	 var breedId;
	 var chkCnt=0;
	 var vFlag = 0;
	 var cannotDelete=0;
	 var canDelete = 0;

	 var chk=document.getElementById('chk');
                if(chk==null && breedId!="")
                {
                    alert("No Records Found");
                    return;
                }
	 var chkBoxCnt = document.frmRoleMgtListRole.chk.length;

            if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
            {
                for(var i=0;i<chkBoxCnt;i++)
		{

                	if(document.frmRoleMgtListRole.chk[i].checked==true)
			{


                          if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
		                {
			 document.frmRoleMgtListRole.process.value = 'delete';
                         document.frmRoleMgtListRole.uType.value = document.frmAddBreedDet.uType.value;
			 document.frmRoleMgtListRole.submit();

		                }
                           return;
			}

                }
            }
            else
            {
                	if(document.frmRoleMgtListRole.chk.checked==true)
			{
                            if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
		                {
			 document.frmRoleMgtListRole.process.value = 'delete';
                         document.frmRoleMgtListRole.uType.value = document.frmAddBreedDet.uType.value;
			 document.frmRoleMgtListRole.submit();

		                }
                            return;
			}

            }
         if(chkCnt==0)
               {

                    alert("Please check the record(s) to be deleted.");
                    return;
                }
  }


        </script>
        <!--End:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
    </head>
    <%

                String uTypeId1 = (String) request.getAttribute("uTypeId");

                if (uTypeId1 != null && !uTypeId1.equals("") && uTypeId1.trim().length() > 0) {

                }
                else
                    {
                         uTypeId1 = "";
                        
                    }


    %>

    <body>

        <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
            <tr>
                <td class="alignTop"><!-- HEADER STARTS HERE -->
                    <%@ include file = "../../include/header.jsp" %>
                    <!-- HEADER ENDS HERE -->
                </td>
            </tr>
            <tr>
                <td class="infoBar"><!-- INFO BAR STARTS HERE -->
                    <%@ include file = "../../include/infobar.jsp" %>
                    <!-- INFO BAR ENDS HERE -->
                </td>
            </tr>
            <tr>
                <td class="tableCommonBg"><table width="760px" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
                        <tr>
                           <!--<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<!--<%//@ include file = "../../include/menu-roles-leftmenu.jsp" %>
                        </td>
			<!-- LEFT MENU ENDS HERE -->
                            <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                <td width="700" class="subDeptTablePad"><!-- CONTENTS START HERE -->
                                    <table  border="1" cellpadding="0" cellspacing="0" width="100%" align="center" class="formLayout">
                                        <form name="frmAddBreedDet" id="myform" action="">
                      <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->                         <tr>
    <td colspan="2" class="tblMainHead">
	Human/Non-Human Relationships - Details: <span class="styleBoldTwo">Listings </span></td>
  </tr>   <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                            <tr> <td colspan="4" class="tblDescrp">
                                                    <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                  You are viewing the list of Human/Non-Human Relationships created by you.<br/> To create a Human/Non-Human Relationship click  <strong>Add</strong> button.<br/>To edit a Human/Non-Human Relationship select the checkbox before each record and then click on the <strong>Edit</strong> button.<br/> To delete Human/Non-Human Relationships select the checkbox(s) before each record and then click on the<strong>Delete</strong> button.</td></tr>

				   <tr>
	  <td height="30">
	  <table border="0" cellpadding="0" align="center" cellspacing="0" width="600">
                                         <tr>
	 <td>
 <strong>Species:</strong>
                                            <select name="uType" class="selectboxOne" onchange="postData(); " >
                                                <option selected="selected" value="">Select One</option>

                                                 <%
                                                            Vector vUType = (Vector) session.getAttribute("displayUserTypeDetails");
                                                            if (vUType != null && vUType.size() != 0) {
                                                                Enumeration eUtype = vUType.elements();
                                                                //String [] userType = {ID, name };
                                                                while (eUtype.hasMoreElements()) {
                                                                    String[] strType = (String[]) eUtype.nextElement();
                                                                    String uTypeID = strType[0];
                                                                    String uTypeName = strType[1];
                                                                    if (uTypeID.equals(uTypeId1)) {

                                                %>
                                                <option value="<%=uTypeID%>" selected="selected" ><%=uTypeName%></option>
                                                <%
                                                 } else {
                                                %>
                                                <option value="<%=uTypeID%>" ><%=uTypeName%></option>
                                                <%
                                                                    }
                                                                }
                                                            }
                                                %>
                                            </select></td>
                                            <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->

                                            </form>
                                            <%-- <td colspan="5" class="tblMainHead">  Roles &amp; Privileges: <span class="styleBoldTwo">Role Listings  </span></td>--%>

                                            <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                            
                                            <!--  <td colspan="5" class="tblDescrp"><br />
                                              You are viewing the list of <strong>Roles</strong> created by you. To	edit	a	role	click on the <strong>Edit</strong> button beside each record. To deactivate a role click on the <strong>'Deactivate'</strong> button beside the corresponding record. </td>
                                            </tr>-->
                                            <!--StartBreed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                            <td align = "right">
                                            <input type="button" value="Add" onclick="addRow()" class="gradBtn" align="right"/>
                                            <input type="button" value="Edit" onclick="editRow('dataTable')" class="gradBtn" align="right"/>
                                            <input type="button" value="Delete" onclick="deleteRow('dataTable')" class="gradBtn" align="right"/>
                                            </td>
										</tr>
											 </table>
	                                          </td>
                                        </tr>

                                        <!--End:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                        <tr>
                                            <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                            <!--<td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="formLayout">-->

                                            <td><table id="dataTable" width="600" border="0" align="center" cellpadding="0" cellspacing="1">
                                                    <!--End:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->

                                                    <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                    <!--<tr>
                                                      <td width="278" height="27" class="tblRowHead">Name of Role </td>
                                                      <td width="93" colspan="2" class="tblRowHead">Edit</td>
                                                    </tr>-->
                                                    <tr> <form name="frmRoleMgtListRole" id="frmRoleMgtListRole" action="RegHorseListing.do" >
                                                        <td width="18" height="27" class="tblRowHeadTwo"><input type="checkbox" name="chkAll" onClick = "checkAll()"/></td>
                                                        <td width="278" height="27" class="tblRowHeadTwo">Relationship</td>
                                                        <td width="50" height="27" class="tblRowHeadTwo">Active</td>
                                                        <td width="50" height="27" class="tblRowHeadTwo">Inactive</td>

                                                 <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->



                                                         <input type="hidden" name="process" value="delete" />
                                                         <input type="hidden" name="uType" value="<%=uTypeId1%>"/>

                                                    <!--End:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                            <%
							ArrayList reqList = (ArrayList)request.getAttribute("reqList");
							if(reqList!=null && reqList.size()!=0){
							Iterator itr = 	reqList.iterator();
							while(itr.hasNext()) {
								HLCRequestHorseDetVO objReqList = (HLCRequestHorseDetVO) itr.next();
								String requestId = objReqList.getRequestId();
								String horseMembername = objReqList.getHorseMemberId();
								String status = objReqList.getPaymentId();
                                                                System.out.println("satheesh"+requestId);
								%>
                                                                         <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                         <input type="hidden" name="requestId" value="<%=requestId%>" />
                                                  <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                        <tr>
                                                            <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                            <%--<td height="26" class="listCellBg"><%=horseMembername%></td>
							<td colspan="2" class="listCellBg"><input name="Submit2" type="submit" class="oneBtn" value="Edit" /></td>--%>
                                                            <!--<td class="listCellBg"><input name="Submit2" type="submit" class="twoBtn" value="Deactivate" /></td> -->
                                                            <td  class="listCellBg" style="text-align:center"><input type="checkbox"  id="chk" name="chk"  onClick="multiChkBoxValidation('dataTable')" value="<%=requestId%>"/></td>
                                                            <td height="26" class="listCellBg"  style="text-align:center;word-wrap:break-word"><%=horseMembername%></td>

                                                            <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                             <%

                                                                        if(Integer.parseInt(status)==1)
                                                                        {
                                                                            %>
                                                                            <td  width="40" class="listCellBg"style="text-align:center" ><input type="radio" name=<%=requestId%>value="1" checked="true" disabled="true" /></td>
                                                                            <td width="40" class="listCellBg" style="text-align:center"><input type="radio"  name=<%=requestId%> value="0" disabled="true"/></td>
                                                                               <%
                                                                            }
                                                                else
                                                                    {
                                                                    %>
                                                                    <td width="40" class="listCellBg"style="text-align:center" ><input type="radio"  value="1" name=<%=requestId%> disabled="true"/></td>
                                                                            <td width="40" class="listCellBg" style="text-align:center"><input type="radio"  name=<%=requestId%> value="0" checked="true" disabled="true"/></td>
                                                                              <% } %>

                                                            <!--Breed For  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                        </tr>

                                                        <% }
                                                                   } else {%>
                                                        <tr>

                                                            <td height="20" colspan="5"  class="listCellBg"><div class="alignCenter"><strong>No Records Found</strong></div></td>
                                                        </tr>
                                                        <% }%>
                                                        </form>
                                                        </tr>
                                                    <!--
					  		<tr>
							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="#" class="linkThree">Prev</a> | <a href="#" class="linkThree">Next</a>			</td>
						   </tr>
						 -->

                                                    <!--Start:[Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->

                                                    <!--  <tr id = "createRole" style = "display:none">-->
                                                    <!--<td colspan="2" class="listCellBg">-->
                                                    <!--<div id = "createRole" style = "display:none">-->

                                                    <!--</div>
                                                        </td>-->

                                                    <!--End:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->

                                              <!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                                    <tr>
                                                         <% String statuscheck = (String)request.getAttribute("err");
					                    if(statuscheck!=null && statuscheck.equals("st")){
					                  %>

					                 <tr>
					                 <td colspan="2" class="styleError"><strong>Breed Details Can not Delete. Try  Again.</strong></td>
					                </tr>
					                        <%
					                           }
					                       %>
                                                        <!--<tr>-->

                                                        <!--</tr>-->

                                                      <td height="19" colspan="5">&nbsp;</td>
                                                    </tr>
                                                </table></td>
                                        </tr>
                                    </table>
                                    <!-- CONTENTS END HERE -->
                                </td>
                        </tr>
                    </table></td>
            </tr>
            <tr>
                <td class="footerBg"><!-- FOOTER STARTS HERE -->
                    <%@ include file = "../../include/footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
                </td>
            </tr>
        </table>
    </body>
</html>