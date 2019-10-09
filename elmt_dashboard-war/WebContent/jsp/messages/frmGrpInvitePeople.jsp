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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="../../javascripts/basic.js" type="text/javascript" ></script>
<link href="css/core-ie.css" type="text/css" rel="stylesheet" />
<script>

function fire()
{
	document.inviteGroupForm.method.value="initAdd";
	document.inviteGroupForm.submit();
}
//-------------------------function for Special Character
function isnotSpecial(str){
	stringSpecialCheck="!#$%^&*()+|<>?/=~,;:][{}"+"\\"+"\'";
	f4=1;
		for(j=0;j<str.length;j++){
			if(stringSpecialCheck.indexOf(str.charAt(j))!=-1){
				f4=0;
			}
		}
		if(f4==0){
			return true;
		}
		else{
			return false;
		}
}
function myvalidate(){
	var elements = Number(document.getElementById('cat_sel_id').value);
	for(i=0;i<elements;i++){
				strmail=document.getElementById('emailIds'+i).value;
				//alert(strmail);
				firstat = strmail.indexOf("@");
				lastat = strmail.lastIndexOf("@");
				strmain=strmail.substring(0,firstat);
				strsub=strmail.substring(firstat,strmail.length);
				if(strmail.length>120){
					alert("Email is out of range");
					document.getElementById('emailIds'+i).focus();
					return false;
				}
				if(strmain.indexOf('  ')!=-1 || firstat==0 || strsub.indexOf(' ')!=-1 ){
					alert("Enter valid Email");
					document.getElementById('emailIds'+i).focus();
					return false;
				}
				if(isnotSpecial(strmain) || isnotSpecial(strsub)){
					alert("Enter valid Email");
					document.getElementById('emailIds'+i).focus();
					return false;
				}
				k=0;
				strlen=strsub.length;
				for(j=0;j<strlen-1;j++){ 
					if(strsub.charAt(j)=='.'){
						k=k+1;
					}
				}
				if(k>3){
					alert("Enter valid Email");
					document.getElementById('emailIds'+i).focus();
					return false;
				}
				if(firstat==-1 || lastat==-1){
					alert("Enter valid Email" );
					document.getElementById('emailIds'+i).focus();
					return false;
				}
				if(Number(strmain)){
					alert("Enter valid Email");
					document.getElementById('emailIds'+i).focus();
					return false;
				}
				if(firstat != lastat ){
					alert("Enter valid Email");
					document.getElementById('emailIds'+i).focus();
					return false;
				}
				firstdot=strmail.indexOf(".",firstat);
				lastdot=strmail.lastIndexOf(".");
				
				if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1){
					alert("Enter valid Email");
					document.getElementById('emailIds'+i).focus();
					return false;
				}
	}
	if(document.inviteGroupForm.invSubject.value=="" || document.inviteGroupForm.invSubject.value.indexOf(' ')==0){
		alert('Subject of mail cannot be empty');
		document.inviteGroupForm.invSubject.focus();
		return false;
	}
	if(document.inviteGroupForm.msg.value=="" || document.inviteGroupForm.msg.value.indexOf(' ')==0){
		alert('Mail Message cannot be empty');
		document.inviteGroupForm.msg.focus();
		return false;
	}
}
</script>
</head>

<body>

<%	
     String noEmails = request.getParameter("noEmail");
		if(noEmails==null) noEmails="1";
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
			<!--< %@ include file = "../../include/menu-messages-member.jsp" % >-->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<html:form method="post" action="/inviteAction.do" onsubmit="return myvalidate();">
				<input type="hidden" name="method" value="invitePeople"/>
				 <html:hidden property="groupId"/>
				 <html:hidden property="groupName"/>

				<table width="70%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
				  <tr>
					<td colspan="2" class="tblMainHead"><strong></strong> Groups: <span class="styleBoldTwo">Invite People To Group</span></td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">
						<!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />--><br />
					  Go ahead and <strong>invite</strong> people to your Group and start your own network
					  of friends and contacts.
					  </td>
				  </tr>
				  
				  <tr>
					<td>
				  
						<table width="100%" border="0" cellpadding="0" cellspacing="0" >
							   <tr>
									<td colspan="2" class="tblRowHead">Group Information</td>
							  </tr>
							  <tr>
								<td class="tableLeft">Group name: </td>
								<td class="tableRight"><span class="styleBoldOne"><bean:write name="inviteGroupForm" property="groupName"/></span></td>
							  </tr>
							  <tr>
								<td colspan="2" class="tblMainHead">Invite People to Join </td>
							  </tr>
							  <tr class="tblDescrp">
								<td colspan="2"><p>The Invite feature lets you send email to invite people to join your Group. 
								This is one way to extend your online community and keep connected with other people who are 
								interested in this type of Group. <strong>(Seperate the Email IDs with a comma)</strong> </p></td>
							  </tr>
							  <tr>
								<td class="tableLeft">No. Of People To Be Invited : </td>
								<td class="tableRight">
								<html:select property="noEmail" styleId="cat_sel_id" styleClass="selectboxOne" onchange="fire()">
										 <html:option value="1">One</html:option>
										 <html:option value="2">Two</html:option>
										 <html:option value="3">Three</html:option>
										 <html:option value="4">Four</html:option>
										 <html:option value="5">Five</html:option>
										 <html:option value="6">Six</html:option>
										 <html:option value="7">Seven</html:option>
										 <html:option value="8">Eight</html:option>
										 <html:option value="9">Nine</html:option>
										 <html:option value="10">Ten</html:option>
									</html:select>								</td>
							  </tr>
							  <div id="dd" style="position: absolute; visibility: visible; height: 11; width: 11;">
					           <%	
							       int countNo=Integer.parseInt(noEmails);
									for(int i=0;i<countNo;i++){%>
							  <tr>
								<td class="tableLeftTxtArea">Enter Email ID(s): </td>
								<td class="tableRight"><input type="text" name="emailIds" id="emailIds<%=i%>" class="textboxOne" size="35" />
								<span class="styleBoldOne">*</span></td>
							  </tr>

							  <!--</tr>-->
							  <%		
								      }								
							  %>
							
							  <tr>
								<td class="tableLeft">Subject: </td>
								<td class="tableRight"><html:text property="invSubject" styleClass="textboxOne" size="35" /><span class="styleBoldOne">*</span></td>
							  </tr>
							  <tr class="tblDescrp">
								<td colspan="2"><p><strong>Enter an introductory message.</strong> Enter a message explaining why you are   inviting these people to your Group. Your message will be included with the   email invitation.</p></td>
							  </tr>
							  <tr>
								<td class="tableLeftTxtArea">Message: </td>
								<td class="tableRight"><textarea name="msg" class="textAreaOne" rows="5"></textarea>
								 <span class="styleBoldOne">*</span></td>
							  </tr>
							   <tr>
								<td colspan="2" height="30" class="alignCenter">
								<input name="Submit" type="submit" class="gradBtn" value="Invite" /> 
								<input name="Submit2" type="button" class="gradBtn" value="Cancel" /></td>
							   </tr>
								<tr>
								<td height="25" colspan="4" class="alignCenter">&nbsp;</td>
								</tr>
						</table>
					</td>
					</tr>
				</table>
				</html:form>

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