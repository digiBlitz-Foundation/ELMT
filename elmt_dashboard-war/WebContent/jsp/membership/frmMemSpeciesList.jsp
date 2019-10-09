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
<!--
* Program Name     :   frmMemSpeciesList.jsp
 * Created Date     :   April 8, 2011
 * Author           :   Kalai
 * Version          :   1.0
This JSP file is used to List the new Species-->
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@page import="com.hlcmrm.util.HLCBreedVO"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><%=(String) session.getAttribute("title")%></title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <script src="javascripts/basic.js" type="text/javascript" ></script>
<!--<script src="javascripts/validate.js" type="text/javascript" ></script>-->
        <!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->

       
        <script language="javascript">
function addRow() {
                
                strURL = "./BreedDetails.do?breedProcess=insertAddspecies";
                window.location.href = strURL;
            
            }
<!--Start:Breed  Addition, Editing and Deletion changes dated 10-Mar-2011-->
function editRow(tableID)

            {
                var breedId;
                var chkCnt=0;
                var vFlag = false;
                var chkBoxCnt = document.frmRoleMgtListRole.chk.length;
                if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
                {
                    for(var i=0;i<chkBoxCnt;i++)
                    {
                        if(document.frmRoleMgtListRole.chk[i].checked==true)
                        {
                            breedId = document.frmRoleMgtListRole.chk[i].value;
                            chkCnt++;
                        }

                       
                    }
                }
                else
                {
                       
                        if(document.frmRoleMgtListRole.chk.checked==true)
                        {
                            breedId = document.frmRoleMgtListRole.chk.value;
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

                    alert("Please check one record to edit");
                    return;
                }

                if(vFlag == true)
                {
                    alert("Only one record can be edited.Please check one record to edit.");
                    return;
                }
              
                strURL = "./BreedDetails.do?speciesId="+breedId+"&breedProcess=editSpecies&Submit2=Edit";
                window.location.href = strURL;
               
            
            }
        
 /*function deleteRow(tableID) {

         
	
	 var chkCnt=0;
	 var vFlag = 0;
	 var cannotDelete=0;
	 var canDelete = 0;
	 var chkBoxCnt = document.frmRoleMgtListRole.chk.length;

            if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
            {
                for(var i=0;i<chkBoxCnt;i++)
		{
                   
                	if(document.frmRoleMgtListRole.chk[i].checked==true)
			{
                           
        
                          if(confirm(" The checked records will be deleted\n Are you sure you want to delete these Breed details?"))
		                {
			 document.frmRoleMgtListRole.breedProcess.value = 'deleteSpecies';
                        
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
                            if(confirm(" The checked records will be deleted\n Are you sure you want to delete these Breed details?"))
		                {
			 document.frmRoleMgtListRole.breedProcess.value = 'deleteSpecies';
                        
			 document.frmRoleMgtListRole.submit();

		                }
                            return;
			}

            }
         if(chkCnt==0)
               {

                    alert("Please Check one record to Proceed");
                    return;
                }
  }*/
    function deleteRow(tableID) {


	var chkCnt=0;
	var vFlag = 0;
	var cannotDelete=0;
	var canDelete = 0;
	var chkBoxCnt = document.frmRoleMgtListRole.chk.length;
	if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmRoleMgtListRole.chk[i].checked==true)
			{
				   if(document.frmRoleMgtListRole.flag[i].value==0)
				   {
					cannotDelete++;
					document.frmRoleMgtListRole.chk[i].checked = false;
					//Debug Starts for check all
                                document.frmRoleMgtListRole.chkAll.checked = false;
								//Debug Ends for check all
				   }

				   if(document.frmRoleMgtListRole.flag[i].value==1)
				   {
					canDelete++;
				   }
			}

			if(cannotDelete > 0 && canDelete > 0)
			{
							vFlag = 1;
			}
			else if(cannotDelete > 0 && canDelete == 0)
			{
							vFlag = 2;
			}
			else if(cannotDelete == 0 && canDelete == 0)
			{
							vFlag = 3;
			}
			else if(cannotDelete == 0 && canDelete > 0)
			{
							vFlag = 4;

			}
		}
	}
	else
	{
			if(document.frmRoleMgtListRole.chk.checked==true)
			{
				   if(document.frmRoleMgtListRole.flag.value==0)
				   {
					cannotDelete++;
					document.frmRoleMgtListRole.chk.checked = false;
					//Debug Starts for check all
                                document.frmRoleMgtListRole.chkAll.checked = false;
								//Debug Ends for check all
				   }

				   if(document.frmRoleMgtListRole.flag.value==1)
				   {
					canDelete++;
				   }
			}

			if(cannotDelete > 0 && canDelete == 0)
			{
							vFlag = 2;
			}
			else if(cannotDelete == 0 && canDelete == 0)
			{
							vFlag = 3;
			}
			else if(cannotDelete == 0 && canDelete > 0)
			{
							vFlag = 4;

			}

	}

	if(vFlag == 1)
	{
		confirm("Only checked records will be deleted, Click the Delete button again.");
	}

	if(vFlag == 2)
	{
	   alert("Checked records cannot be deleted as it is being referred or mapped.");
	}

	if(vFlag == 3)
	{
		alert("Please select the record(s) to be deleted");
	}

	if(vFlag == 4)
	{
		if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
		{
			document.frmRoleMgtListRole.breedProcess.value = 'deleteSpecies';

			 document.frmRoleMgtListRole.submit();
		}
	}

}



        
function checkAll()
{
    

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

            

        </script>
        
    </head>
    <%

                String uTypeId = (String) request.getAttribute("uTypeId");
               
               
              
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
                           <!--<td width="230" class="menuTablePad">-->
			<!-- LEFT MENU STARTS HERE -->
			<!--<%//@ include file = "../../include/menu-roles-leftmenu.jsp" %>
                        </td>-->
			<!-- LEFT MENU ENDS HERE -->
                            
                                <td width="700" class="subDeptTablePad"><!-- CONTENTS START HERE -->
                                    <table  border="1" cellpadding="0" cellspacing="0" width="100%" align="center" class="formLayout">
                                        
                                          <tr>
    <td colspan="2" class="tblMainHead">
	Species: <span class="styleBoldTwo">Listings </span></td>
  </tr>   
                                            <tr> <td colspan="4" class="tblDescrp">                                         
                  You are viewing the list of <strong>Species</strong> created by you.<br/> To create a Species click <strong>Add</strong> button.<br/>To edit a Species select the checkbox before each record and then click on the <strong>Edit</strong> button.<br/> To delete Species select the checkbox(s) before each record and then click on the <strong>Delete</strong> button.</td></tr>
                                        
                                            
                                            <tr height="30">
                                            <td align = "right">
                                            <input type="button" value="Add" onclick="addRow()" class="gradBtn" align="right"/>
                                            <input type="button" value="Edit" onclick="editRow('dataTable')" class="gradBtn" align="right"/>
                                            <input type="button" value="Delete" onclick="deleteRow('dataTable')" class="gradBtn" align="right"/>
                                            </td>
                                        </tr>

                                       
                                        <tr>
                                          
                                            
                                            <td><table id="dataTable" width="100%"  align="center" cellpadding="0" cellspacing="1" class="formLayout" style="table-layout:fixed">
                                                    
                                                    
                                                    <tr> <form name="frmRoleMgtListRole" id="frmRoleMgtListRole" action="BreedDetails.do" >
                                                             <input type="hidden" name="breedProcess" value="speciesView" />
                                                        <td width="20" class="tblRowHeadTwo"><input type="checkbox" name="chkAll" onClick = "checkAll()"/></td>
                                                         <td width="350" height="27" class="tblRowHeadTwo">Species </td>
                                                        <td width="60" height="27" class="tblRowHeadTwo">Active</td>
                                                        <td width="60" height="27" class="tblRowHeadTwo">Inactive</td>
                                                    
                                                    
                                                               <%
                                                                
                                                                    ArrayList lst = (ArrayList) session.getAttribute("specieslist");
                                                                    
                                                                    if (lst!=null && lst.size() != 0) {
                                                                       
                                                                        Iterator itr = lst.iterator();
                                                                        while (itr.hasNext()) {
                                                                            HLCBreedVO donObj = (HLCBreedVO) itr.next();
                                                                             String flag = donObj.getFlag();
                                                                            String speciesId = donObj.getUserTypeId();
                                                                            String SpeciesName = donObj.getUserTybeName();
                                                                            String speciesStatus = donObj.getUserTypeStatus();
                                                                                                        
                                                                         %>
                                                                        
                                                         <input type="hidden" name="speciesId" value="<%=speciesId%>" />
                                                         <input type="hidden" name="flag" value="<%=flag%>" />
                                                  
                                                        <tr>
                                                           
                                                            <td  class="listCellBg" style="text-align:right"><input type="checkbox" name="chk"   value="<%=speciesId%>"/></td>
                                                            <td height="26" class="listCellBg"  style="text-align:center;word-wrap:break-word"><%=SpeciesName%></td>

                                                           
                                                             <%

                                                                        if(Integer.parseInt(speciesStatus)==1)
                                                                        {
                                                                            %>
                                                                            <td  width="40" class="listCellBg"style="text-align:center" ><input type="radio" name=<%=speciesId%> value="1" checked="true" disabled="true" /></td>
                                                                            <td width="40" class="listCellBg" style="text-align:center"><input type="radio" name=<%=speciesId%> value="0" disabled="true"/></td>
                                                                               <%
                                                                            }
                                                                else
                                                                    {
                                                                    %>
                                                                    <td width="40" class="listCellBg"style="text-align:center" ><input type="radio" name=<%=speciesId%> value="1" disabled="true"/></td>
                                                                            <td width="40" class="listCellBg" style="text-align:center"><input type="radio" name=<%=speciesId%> value="0" checked="true" disabled="true"/></td>
                                                                              <% } %>
                                                          
                                                           
                                                        </tr>  

                                                        <% }
                                                                   } else {%>
                                                        <tr>
                                                           
                                                            <td height="20" colspan="5"  class="listCellBg"><div class="alignCenter"><strong>No Records Found</strong></div></td>
                                                        </tr>
                                                        <% }%>
                                                        </form>
                                                        </tr>
                                                   
                                              
                                                    <tr>
                                                         <% String statuscheck = (String)request.getAttribute("err");
					                    if(statuscheck!=null && statuscheck.equals("st")){
					                  %>

					                 <tr>
					                 <td colspan="2" class="styleError"><strong>species Details Can not Delete. Try  Again.</strong></td>
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