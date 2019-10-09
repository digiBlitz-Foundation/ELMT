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
<script src="javascripts/frmMeeInsureValid.js" type="text/javascript" ></script>

<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> -->
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
var arHttpRequest;

function HLCMemberDetails(){
    var memberid=document.frmMeeInsureEduAct.memberShipNo.value;
        var url = "./RiderInfoAjaxAction.do?memberid="+ memberid; 
        if (window.ActiveXObject){ 
            arHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest){ 
            arHttpRequest = new XMLHttpRequest(); 
        } 
        arHttpRequest.open("POST", url, true); 
        arHttpRequest.onreadystatechange = function() {membStatus(); } ; 
        arHttpRequest.send(null); 
   } 
   
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function membStatus() 
    { 
   
        if (arHttpRequest.readyState == 4) 
        { 
            if(arHttpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var arnameXML = arHttpRequest.responseXML.getElementsByTagName("memberstatus")[0]; 
                 var arnameText = arnameXML.childNodes[0].nodeValue; 
				
				//alert
				
                if(arnameText=="false"){    
                alert("Member Id Doesn't Exists!"); 
				document.frmMeeInsureEduAct.memberShipNo.value="";
            	document.frmMeeInsureEduAct.memberShipNo.focus();
                return;
                }    
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
</script>
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
					<td colspan="2" class="tblMainHead"> Meetings: <span class="styleBoldTwo">Insurance Release - Educational Activities </span></td>
				  </tr>
				  
				  <tr>
					<td>

 <%
String memberId = (String) session.getAttribute("memberId");
//out.print("memberId" + memberId);
if(memberId==null)
memberId = "NA";

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
HLCActivityOrganizerVO objActivityDet = (HLCActivityOrganizerVO) session.getAttribute("ActivityOrganizerVODet");

	ArrayList listContact = (ArrayList) session.getAttribute("dynamicOrgDetails");
	
		String prefix1 = "";
		String first_name = "";
		String middle_name = "";
		String last_name = "";
		String sufix = "";
		String email_id = "";
		String suite = "";
		String address1 = "";
		String address2 = "";
		String city = "";
		String state = "";
		String country = "";
		String zip = "";
		String phone_no = "";
		String mobile_no = "";
		String fax_no = "";
		
		if(listContact !=null && listContact.size()!=0){
			Iterator it = listContact.iterator();
			while(it.hasNext()){
				prefix1 = (String)it.next();
				if(prefix1==null)
				prefix1 = "";
				first_name  = (String)it.next();
				if(first_name==null)
				first_name = "";
				middle_name  = (String)it.next();
				if(middle_name==null)
				middle_name = "";
				last_name = (String)it.next();
				if(last_name==null)
				last_name = "";
				sufix =  (String)it.next();
				if(sufix==null)
				sufix = "";
				email_id  = (String)it.next();
				if(email_id==null)
				email_id = "";
				suite =  (String)it.next();
				if(suite==null)
				suite = "";
				address1 =  (String)it.next();
				if(address1==null)
				address1 = "";
				address2 = (String)it.next();
				if(address2==null)
				address2 = "NA";
				city = (String)it.next();
				if(city==null)
				city = "";
				state =  (String)it.next();
				if(state==null)
				state = "";
				country = (String)it.next();
				if(country==null)
				country = "";
				zip = (String)it.next();
				if(zip==null)
				zip = "";
				phone_no = (String)it.next();
				if(phone_no==null)
				phone_no = "";
				mobile_no = (String)it.next();
				if(mobile_no==null)
				mobile_no = "";
				fax_no = (String)it.next();
				if(fax_no==null)
				fax_no = "NA";
			}
		}
%>

					
						<form name="frmMeeInsureEduAct" method="post" action="insEduAct.do" onsubmit="return myvalidate();">
						<%
						String orgMeetingId= (String)request.getAttribute("orgMeetingId");
						%>
						<input type="hidden" name="orgMeetingId" value="<%=orgMeetingId%>">	
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
						 <tr class="rowHead">
							<td colspan="2" class="tblRowHead">Required fields are marked with an asterisk* </td>
							</tr>
						  <tr> 
							<td colspan="2" class="tblRowHead"> Activity Details: </td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Name of Activity:</td>
							<td  class="tableRight"><input type="text" class="textboxOne" name="activityName" readonly="true" value="<%=objActivityDet.getActivityName()%>"></td>
						  </tr>
						   <%
						 				String finalArea="";
										String areaName="";
										String getUseaAreaId = objActivityDet.getUseaAreaId();
										//out.print( "getUseaAreaId" + getUseaAreaId);
										ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
										if(areaDetails!=null && areaDetails.size()!=0){
										Iterator areaIt = areaDetails.iterator();
										while(areaIt.hasNext()){
										String[] areaDet =(String[])areaIt.next();
										String areaId = areaDet[0];
										//out.print("areaId" +areaId);
										 areaName = areaDet[2];
										// out.print("areaName" +areaName);
										if(areaId.equals(getUseaAreaId)){
										finalArea = areaName;
										//out.print("finalArea" + finalArea);
									}
							  }
							}
							  %>                                                                                 

						  <tr> 

							<td class="tableLeft"> Area:</td>
							<td  class="tableRight"><input type="text" class="textboxOne" name="hlcArea" value=<%=finalArea%> readonly="true" /></td>
						  </tr>
						  <%
						  String activityDate ="";
						  if(activityDate!=null){
						  activityDate = sdf.format(objActivityDet.getActivityDate());
						  }
						  %>
						  <tr> 
							<td class="tableLeft"> Date(s)to be held:</td>
							<td colspan="-1" class="tableRight"> <input type="text" class="textboxOne" name="dateHeld" value=<%=activityDate%> readonly="true" /></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Location:</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" value="<%=objActivityDet.getLocation()%>" name="location" readonly="true" /></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> State:</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="state" value="<%=objActivityDet.getState()%>" readonly="true"/></td>
						  </tr>
					     
						   <tr> 
							<td colspan="2" class="tableSpan">
							<a href="javascript:MM_openBrWindow('terms-conditions.html','terms','width=520,height=565')" class="linkFour">View Terms &amp; Conditions</a>							</td>
						  </tr>
						  <tr> 
							<td colspan="2" class="tableSpan"> 
							<input type="checkbox" name="checkbox3" value="checkbox" id="chkAccept"/>  
							I Agree to the terms and conditions. <span class="asterisk">*</span></td>
						  </tr>
						  <tr> 
							<td colspan="2" class="tblRowHead"> Participant&#8217;s Details: </td>
						  </tr>
 							<tr> 
							<td class="tableLeft">Email Id:</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="memberId"  value="<%=email_id%>" id="txtemail" readonly="true"/></td>
						  </tr>
						  <tr> 
							<td height="27" class="tableLeft">First 
								Name:</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="participantName" value="<%=first_name%>" readonly="true" /></td>
						  </tr>
						  <tr>
						    <td height="27" class="tableLeft">Middle Name: </td>
						    <td colspan="-1" class="tableRight"><label>
						      <input type="text" class="textboxOne" name="middleName" value="<%=middle_name%>" readonly="true" />
						    </label></td>
					      </tr>
						  <tr>
                            <td height="27" class="tableLeft">Last 
                              Name:</td>
						    <td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="lastName" value="<%=last_name%>" readonly="true" /></td>
					      </tr>
		
						  <tr> 
							<td class="tableLeft"> Address:</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="address" value="<%=address1%>" readonly="true" /></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Address2:</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="address2" value="<%=address2%>" readonly="true" /></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> Country:</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="country" value="<%=country%>" readonly="true" /></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> State</td>
							<td colspan="-1" class="tableRight"> <span class="row"><span class="formX"> 
							  <input type="text" class="textboxOne" name="participantState" value="<%=state%>" readonly="true" />
							  </span></span></td>
						  </tr>
						  <tr> 
							<td class="tableLeft"> City</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="city" value="<%=city%>" readonly="true" /></td>
						  </tr>

						  <tr> 
							<td class="tableLeft"> Zip Code</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="zipcode" value="<%=zip%>" readonly="true" /></td>
						  </tr>
						  <tr>
                            <td class="tableLeft">Phone</td>
						    <td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="phone" value="<%=phone_no%>" readonly="true" />                            </td>
					      </tr>
						  <tr> 
							<td class="tableLeft">Fax</td>
							<td colspan="-1" class="tableRight"><input type="text" class="textboxOne" name="fax" value="<%=fax_no%>" readonly="true" />							</td>
						  </tr>
						  
					
						  
						  <tr> 
							<td colspan="2" class="tblRowHead"> Other Information: </td>
						  </tr>
						  <tr> 
							<td class="tableLeft">Are You a member?</td>
							<td  class="tableRight"> <input type="radio" name="isUseaMember" value="yes" id="radioyes" onclick="isRadio();"/>
							  Yes 
							  <input type="radio" name="isUseaMember" value="no" id="radioyes" checked="checked" onclick="isRadio();" />
							  No</td>
						  </tr>
						  <tr> 
							<td class="tableLeft">If yes, Your Membership Number</td>
							<td colspan="-1" class="tableRight"> <input type="text" class="textboxOne" name="memberShipNo" id="memberShipNo" disabled="disabled" onblur="HLCMemberDetails();"/></td>
						  </tr>
						   <tr> 
							<td class="tableLeft">Number of horses i will be riding during activity:</td>
							<td class="tableRight"><input type="text" class="textboxOne"  name="horseNo" id="horseNo" maxlength="8" />	<span class="asterisk">*</span></td>
						  </tr>
						  <tr> 
							<td class="tableLeft">Level now riding:</td>
							<td  class="tableRight">
							<select name="ridingLevel" id="level_sel" class="selectboxOne">
								<option selected="selected" value="">Select Levels</option>
							<%
							Vector levels = (Vector)request.getAttribute("AllLevels");
							if(levels.size()!=0 && levels !=null){
								Enumeration enum = levels.elements();
								while(enum.hasMoreElements()){
									String[] levelNames = (String[])enum.nextElement();
									String levelid = (String)levelNames[0];
									String levelType = (String)levelNames[1];
									String levelCode = (String)levelNames[2];
									
							%>
										
						   <option value="<%=levelid%>"><%=levelType%> - <%=levelCode%></option>
							<%
							  }
							}
							  %>
						      </select>
							<span class="asterisk">*</span></td>
						  </tr>
						   
						  <tr> 
							<td class="tableLeft">&nbsp; </td>
							<td class="tableLeft"><span class="row">
							  <input type="submit" class="gradBtn" value="Submit" />&nbsp;&nbsp;<input type="button" class="gradBtn" value="Cancel" onclick="javascript:history.back(-1);" />
							  </span></td>
						  </tr>
						</table>
							
						</form>
					</td>
				  </tr>
				  
				  <tr>
				  
					<td height="20">&nbsp; <span class="row"><span class="formX"> </span></span> 
					  <!-- DO NOT DELETE THIS ROW -->
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