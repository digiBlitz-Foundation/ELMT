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
<%@ page import="com.hlcmro.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeICPAssessment.js" type="text/javascript" ></script>

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
				<table width="100" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
				  <tr>
					<td colspan="2">
					<%
						String mapAreaId = "";
						String areaId = "";
						String areaChairId = "";
						String areaCode = "";
						String areaName = "";
						String userId = "";
						String userCode = "";
						String firstName = "";
						String middleName = "";
						String lastName = "";
						String emailId = "";
						String nameDet = "";
						HLCAreaChairsVO objACVO = (HLCAreaChairsVO)request.getAttribute("areaChairDetailVO");
						if(objACVO!=null){
							mapAreaId = objACVO.getMapAreaId();
							areaId = objACVO.getAreaId();
							areaChairId = objACVO.getAreaChairId();
							areaCode = objACVO.getAreaCode();
							areaName = objACVO.getAreaName();
							userId = objACVO.getUserId();
							userCode = objACVO.getUserCode();
							firstName = objACVO.getFirstName();
							middleName = objACVO.getMiddleName();
							lastName = objACVO.getLastName();
							emailId = objACVO.getEmailId();
							if(areaName==null) areaName = "";
							if(firstName==null) firstName = "";
							if(middleName==null) middleName = "";
							if(lastName==null) lastName = "";
							nameDet = firstName + " " + middleName + " " + 	lastName;	
						}
						String stateCount = (String)request.getAttribute("stateCount");
																								
					%>
						<table width="597" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
						<tr>
						<td colspan="2" class="tblMainHead"><strong></strong> Meetings:  <span class="styleBoldTwo">Area Chair Details </span></td>
						</tr>
						
						  <tr> 
							<td colspan="2" class="tblRowHead"> <span class="rowHead">Area Chair Details</span></td>
						  </tr>
						  <tr> 
							<td width="300" class="tableLeft">Area Chair ID:</td>
							<td width="297" class="tableRight"><span class="styleBoldOne"><%=areaChairId%></span></td>
						  </tr>
						  
						  <tr> 
							<td class="tableLeft">Area Chair Name:</td>
							<td class="tableRight"><%=nameDet%></td>
						  </tr>
						  <tr>
                            <td class="tableLeft">Area </td>
						    <td class="tableRight"><%=areaName%></td>
					      </tr>
						  <tr>
                            <td class="tableLeft"> No. Of States: </td>
						    <td class="tableRight"><%=stateCount%></td>
					      </tr>
						  <tr>
							<td class="tableLeft">&nbsp;</td>
							<td class="tableRight"><input name="Submit" type="button" onclick="javascript:history.back(-1);" class="gradBtn" value="Back to Listing" /></td>
						  </tr>
					  </table>
					  </form>
				  <tr>
						<td >&nbsp; 
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