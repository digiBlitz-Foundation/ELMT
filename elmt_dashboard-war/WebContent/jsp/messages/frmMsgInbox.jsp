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
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMeeAnnualConvRegister.js" type="text/javascript" ></script>
<!--<link href="css/core-ie.css" type="text/css" rel="stylesheet" />-->

<script language="javascript">
function checkAll() {
     el = document.forms['frmInbox'].elements;
     for (i=0; i < el.length; i++) {
       if(el[i].type == "checkbox") {
          if(el[i].checked== true && el[i].value== "ChkAll") {
            //alert("ok");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox") {
                  void(el[j].checked=1);
               }
            }
            break;
          }
          if(el[i].checked== false && el[i].value== "ChkAll") {
            //alert("uncheck");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox") {
                  void(el[j].checked=0);
               }
            }
          }   
       }
     }
 }
 
function DelAll(){
	var chkValue = "";
	e = document.forms['frmInbox'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}
	if(count == 0 ){
		alert("Check any one of the them");
	}
	else{
		//alert(chkValue);
		document.frmInbox.messageIds.value = chkValue;
		document.frmInbox.msgProcess.value = "deleteMsgs";
		document.frmInbox.method = "post";
		document.frmInbox.action = "messages.do";
		document.frmInbox.submit();
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
			<!--< %@ include file = "../../include/menu-messages-member.jsp" % >-->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->
							
		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<form name="frmInbox">
				
												<input type="hidden" name="messageIds" value="sury">
												<input type="hidden" name="msgProcess" value="">
				<table width="70%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
					  <tr>
						<td colspan="2" class="tblMainHead"><strong></strong> Messages: <span class="styleBoldTwo">Inbox</span></td>
					  </tr>
					  <%
					  	ArrayList messageList = (ArrayList) request.getAttribute("showInbox");
					  %>
					  <tr>
						<td colspan="2" class="tblDescrp">
							<br />
							<span class="msgHead">Inbox (<%=messageList.size()%>)</span>  - <span class="styleBoldOne">Your Messages </span> <br />
							<br />
							You are viewing the list of messages you have in your <strong>Inbox</strong>. <br /><br /> To view a message
							click on it. To delete a message <strong>'Check'</strong> the box corresponding to it in the list and 
							click on the <strong>'Delete'</strong> button.
							<br /><br />
							</td>
					  </tr>
							  <tr>
								<td>
								
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer" id="mainTbl">
									  <tr>
										<td class="tblRowHead">
										
											<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" id="tableHead">
											  <tr>
												<td width="13%"><span class="disclaimer">(select All)</span></td>
												<td width="38%" class="alignLeft">
												<input type="button" name="delete" value="Delete" class="gradTwoBtn" onclick="DelAll();" />
												</td>
<!--												<td width="22%" class="textCommon">
													<strong>Messages</strong> 
													<span class="styleBoldTwo">1 - 10</span>							</td>
												<td width="27%">
													<a href="#" class="linkFour">&laquo; Prev</a><span class="divider"> | </span>
													<a href="#" class="linkFour">Next &raquo;</a>							</td>
-->											  </tr>
											</table>
										
										</td>
									  </tr>
									  <tr>
										<td height="25" >
											
											<table width="100%" border="0" cellpadding="0" cellspacing="1" id="inboxTbl">
											  <tr class="tblMainHead">
												<td width="6%" height="25" >
												<input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" >
												</td>
												<td width="31%" height="25">From</td>
												<td width="41%" height="25">Subject</td>
												<td width="22%">Date</td>
											  </tr>
											  
	<%! 			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
					String dateFormat(String fieldName){					
						Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
							System.out.println("clDate in jsp" +clDate);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}
						
						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
					}
					%>			  
											  
											  
											  
											  <%
												if(messageList!=null && messageList.size()!=0){
													Iterator msgIt = messageList.iterator();
													while(msgIt.hasNext()){
														HLCMessageVO msgVO = (HLCMessageVO) msgIt.next();
														String firstName =  msgVO.getFirstName();
														String lastName = msgVO.getLastName();
														Date postDate = msgVO.getPostDate();
														System.out.println("postDate in jsp" +postDate);
														String subject =  msgVO.getSubject();
														String messageId = msgVO.getMessageId();
														boolean viewStatus = msgVO.isViewStatus();
														String linkClass = "linkMailChecked";
														if(viewStatus==false)
														linkClass = "linkMail";
													  %>
													  <tr>
														<td height="25" class="listCellBg">
														<input type="checkbox" name="checkbox5" value="<%=messageId%>" /></td>
														<td class="listCellBg"><a href="messages.do?msgProcess=viewMsg&messageId=<%=messageId%>" class="<%=linkClass%>"><%=firstName%>&nbsp;<%=lastName%></a> </td>
														<td class="listCellBg"><%=subject%></td>
														<td class="listCellBg"><%=dateFormat(postDate.toString())%> </td>
													  </tr>
													  <%
														}
												}
												else{
													%>
													<tr>
													<td height="25" colspan="5" class="listCellBg">No Messages are available.</td>
												  </tr>
													<%
												}
											  %>
											</table>
									
										</td>
									  </tr>
									  <tr>
										<td class="tblRowHead">
										
											<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" id="tableHead">
											  <tr>
												<td width="13%">&nbsp;</td>
												<td width="38%" class="alignLeft">&nbsp;</td>
<!--												<td width="22%" class="textCommon">
													<strong>Messages</strong> 
													<span class="styleBoldTwo">1 - 10</span>							</td>
												<td width="27%">
													<a href="#" class="linkFour">&laquo; Prev</a><span class="divider"> | </span>
													<a href="#" class="linkFour">Next &raquo;</a>							</td>
-->											  </tr>
											</table>
										
										</td>
									  </tr>
									  <tr>
										<th height="25" class="alignCenter">&nbsp;</th>
									  </tr>
									   <tr>
										<td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
									  </tr>
							</table>
						
						</td>
					  </tr>
				</table>
				</form>
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