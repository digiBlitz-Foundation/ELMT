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

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script language="javascript">
function callMapList(viewPointId)
{
	strURL = "./artifactMapping.do?artiMapProcess=searchMappedGroup&viewPoint="+viewPointId;
	window.location.href = strURL;
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
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
		
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
<table border="0" cellpadding="0" cellspacing="0" align="center" class="tblInnerContainer">
  <tr>
    <td colspan="4" class="tblMainHead">
	View Point: <span class="styleBoldTwo">Search Mapped Groups List </span></td>
  </tr>
  <tr>
				<td colspan="2" class="tblDescrp" align="justify"><font size="-1"><strong>
				Please choose the any one of the view point in order to view the mapped group list</strong></font></td>
			  </tr>
				  
	 
		<form name="frmSearchMappedViewPoint" action="artifactMapping.do"  method="post" onsubmit="return myValidate();">	
	
<input type="hidden" name="artiMapProcess" value="searchMappedGroup">
		 
			
	  						  
 	
	 <tbody id="showSearchCrite"> 
  <tr>
		<td colspan="4">
		
			
 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
   <%String viewPointId = (String)request.getAttribute("viewPointId");
				
				 %>
 		
			  <tbody id="memShow" class="tableInner">
				
				  
				  
				    <tr class="tableInner">
					<td class="tableLeft">View Point:</td>
					<td class="tableRight">
						<select name="viewPoint" id="viewPoint" class="selectboxOne" onchange="callMapList(this.value);">
							<option selected="selected" value="">Select One</option>
							<%
									 ArrayList viewList = (ArrayList) request.getAttribute("viewList");
          					 if(viewList!=null && viewList.size()!=0){
							Iterator it = viewList.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								String viewId = s[0];
								String viewName = s[1];		
								
											

											
											if (viewId.equals(viewPointId)){
											 %>
											 
											 <option value="<%=viewId%>" selected="selected"><%=viewName%></option>
											 <%
											 }
								 
					           else{
					           %>
					            <option  value="<%=viewId%>" ><%=viewName%></option>
					           <%
					           }
											 
											 }
										}
									


							%>
							</select></td>
				  </tr>
				  
				  
				  
				  
				 </tbody> 
				 
				  
					<tr>
						<td colspan="5" class="alignCenter">
						<input align="middle" type="submit" value="Search" class="gradBtn" /></td>
				   </tr>
				   </table>
				  
				 		 
			  
					</td>
	</tr>
	 </tbody>	
	   </form>
<form name="frmMappedViewPoint" action="artifactMapping.do" >
<input type="hidden" name="artiMapProcess" value="">
 <table border="0" cellpadding="0" align="center" cellspacing="1" class="formLayout">
      <tr>
			
			<td width="103" class="tblRowHeadTwo">View Point</td>
			<td width="94" class="tblRowHeadTwo">LOB</td>
				<td width="94" class="tblRowHeadTwo">Views</td>
			<td width="94" class="tblRowHeadTwo">Groups</td>
			<td width="103" class="tblRowHeadTwo">Process/Domain</td>
			
		
			
		   </tr>
		   <%ArrayList userMapPointList = (ArrayList)request.getAttribute("userMapPointList");
           									 if(userMapPointList!=null && userMapPointList.size()!=0){
           							Iterator ituserMapPoint = userMapPointList.iterator();
           							while(ituserMapPoint.hasNext()){
           								String[] viewPointUser = (String[])ituserMapPoint.next();
           								String viewPoint = viewPointUser[0];
           								String lob = viewPointUser[1];
           								String view = viewPointUser[2];
           								String group = viewPointUser[3];
           								String processdDom = viewPointUser[4];
           		if(lob!=null && view!=null && group !=null && processdDom !=null){						
		   %>
		   <tr>
		   <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=viewPoint%></td>
		    <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=lob%></td>
			 <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=view%></td>
			  <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=group%></td>
			   <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=processdDom%></td>

		   </tr>
   			<%}}
           							}else{ %>	
           							<td height="26" colspan="5" bgcolor="#E3E1D2" class="alignCenter"><strong>No Records were Found !</strong></td>
 
           							<%} %>
		 
 </table>

</form>
			  </table>
				 
		</td>
	</tr>
<!-- Based on id -->

<tr>
 	<td>
		 
	</td>
</tr>  

<!--end of the file-->
</table>
			<!-- CONTENTS END HERE -->		
	
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