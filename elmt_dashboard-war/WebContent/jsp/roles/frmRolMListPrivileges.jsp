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

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
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
    <td class="tableCommonBg"><table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
      <tr>
        <td width="230" class="menuTablePad"><!-- LEFT MENU STARTS HERE -->
              
<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
              <!-- LEFT MENU ENDS HERE -->
        </td>
        <td width="500" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table  border="0" cellpadding="0" cellspacing="0"  align="center" class="formLayout">
                <tr>
                  <td colspan="5" class="tblMainHead"> Roles &amp; Privileges: <span class="styleBoldTwo">Privilege Listings </span></td>
                </tr>
                <tr>
                  <td colspan="5" class="tblDescrp">
				   
                    You are viewing the list of <strong>Privileges</strong> created by you. To	edit	a	privilege	click on the <strong>Edit</strong> button beside each record. To deactivate a privilege click on the <strong>'Deactivate'</strong> button beside the corresponding record. </td>
                </tr>
                <tr>
                  <td>
				  
				  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="formLayout">
				  	  
                      
					  <tr>
                        <td colspan="4" style="border-bottom:1px solid #999;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
                            
                        </table>
						</td>
                      </tr>
                      <tr>
                        <td width="278" height="27" class="tblRowHead">Name of Privilege </td>
                        <td width="93" class="tblRowHead">Edit</td>
                      </tr>
                      
					   <%  
					   ArrayList roleList = (ArrayList) request.getAttribute("allPrivList");
      					 if(roleList!=null && roleList.size()!=0){
							Iterator it = roleList.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								String privilegeId = s[0];
								String privilegeName = s[1];
							%>
							<form name="frmRolMgtListPriv" id="frmRolMgtListPriv" method="post" action="roles.do" onsubmit="return myvalidate();">
								<input name="privId" type="hidden" class="oneBtn" value="<%=privilegeId%>" />
								<input type="hidden" name="roleProcess" value="initEditPriv" />
								<tr>
									<td height="10" class="listCellBg"><%=privilegeName%></td>
									<td class="listCellBg">
										<input name="Submit2" type="submit" class="oneBtn" value="Edit" />
									</td>
								</tr>
						  </form>
                      	<%
						}
						}
						else {
						%>
						  <tr><td colspan="2" class="listCellBg">No Records are found.</tr>
		 			    <%
					  	}
					  	%>
                      <!--
					  		<tr>

							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="#" class="linkThree">Prev</a> | <a href="#" class="linkThree">Next</a>			</td>
						   </tr>
						 -->
                      <tr>
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
