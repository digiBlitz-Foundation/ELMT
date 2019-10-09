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
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE><%=(String)session.getAttribute("title")%></TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1" />
<SCRIPT SRC="javascripts/basic.js" TYPE="text/javascript" ></SCRIPT>
<SCRIPT SRC="javascripts/frmAdvertise.js" TYPE="text/javascript" ></SCRIPT>
 <LINK HREF="../../css/core-ie.css" TYPE="text/css" REL="stylesheet" /> 
 <SCRIPT language="javascript">
 function createBtn(){
	strURL = "./TransactDet.do?process=mapTransac";
	window.location.href = strURL; 
 }
 function listBtn(){
	strURL = "./TransactDet.do?process=listAllTransac";
	window.location.href = strURL; 
 }
 </SCRIPT>
</HEAD>

<BODY>
<TABLE WIDTH="760" BORDER="0" ALIGN="center" CELLPADDING="0" CELLSPACING="0" id="mainTab">
  <TR>
    <TD CLASS="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "../../include/header.jsp" %>
		<!-- HEADER ENDS HERE -->
	</TD>
  </TR>
  <TR>
    <TD CLASS="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%@ include file = "../../include/infobar.jsp" %>
		<!-- INFO BAR ENDS HERE -->	
	</TD>
  </TR>
  <TR>
    <TD CLASS="tableCommonBg">
		
		<TABLE WIDTH="760" BORDER="0" ALIGN="center" CELLPADDING="0" CELLSPACING="5" id="centerTab">
		  
		  <TR>
			<TD WIDTH="230" CLASS="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </TD>
			<TD WIDTH="500" CLASS="subDeptTablePad">
		
<TABLE BORDER="0" CELLPADDING="0" ALIGN="center" CELLSPACING="0" CLASS="tblInnerContainer">
  <TR>
    <TD COLSPAN="2" CLASS="tblMainHead">
		Membership: <SPAN CLASS="styleBoldTwo">Transaction Type Master </SPAN></TD>
  </TR>
  <TR>
    <TD COLSPAN="2" CLASS="tblDescrp">
    <STRONG><BR />
    You have successfully made an entry to the Transaction Type Master Details!<BR />
    <BR />
    <SPAN>
    <INPUT name="button" TYPE="button" CLASS="gradBtn" VALUE="Create Another" onClick="createBtn();" />&nbsp;<STRONG><SPAN>
    <INPUT name="button2" TYPE="button" CLASS="gradBtn" VALUE="Home" onClick="listBtn();" />
    </SPAN></STRONG></SPAN><BR />
</STRONG></TD>
  </TR>
  <TR>
  	<TD>&nbsp;</TD>
  </TR>
  
  <TR>
    <TD HEIGHT="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></TD>
  </TR>
</TABLE>

<!-- CONTENTS END HERE -->		
			</TD>
		  </TR>
	  </TABLE>
	
	</TD>
  </TR>
  <TR>
    <TD CLASS="footerBg">
		<!-- FOOTER STARTS HERE -->
			<%@ include file = "../../include/footer.jsp" %>
		<!-- FOOTER ENDS HERE -->
	</TD>
  </TR>
</TABLE>

</BODY>
</HTML>