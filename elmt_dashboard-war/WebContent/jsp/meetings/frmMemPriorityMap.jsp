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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
</head>

<script language="javascript">

function checkAll() {
 
     el = document.forms['myform'].elements;
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
            
            for (j=0; j < el.length; j++) {
			 //alert(el[j].type);
               if(el[j].type == "checkbox") {
                  void(el[j].checked=0);
               }
			    if(el[j].type == "select-one") {
                  void(el[j].selectedIndex=0);
               }
			   
            }
          }   
       }
     }
 }
 
function DelAll(){
	var chkValue = "";
	//alert(document.getElementById('priorityIdfinal_place').value);
	e = document.forms['myform'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
	 ///alert("elements:" +el[i].type);
		if(e[i].type == "checkbox"){
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 //alert(e[i].name);
				 var selComBoName = "priorityId"+e[i].name;
				 //alert(selComBoName);
				 
				 var selVal = document.getElementById(selComBoName).value;
				 
				 chkValue +=  e[i].value + "!" + selVal + "#";
			}
		}
	}
		//alert(chkValue);
		document.myform.entityIds.value = chkValue;
		//alert("Final" + count + " checked Value:  ********" + document.myform.entityIds.value);
}

function entPrivValidate(){
//alert(document.frmMapLevel.eventTypeId.value);
  	if(document.frmMapLevel.eventTypeId.value==""){
		alert("Select any one Role.");
		document.frmMapLevel.eventTypeId.focus();
		return false;
	}
/*	e = document.forms['myform'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
	if(e[i].type == "checkbox"){
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 var selComBoName = "priorityId"+e[i].name;
	 			 var selVal = document.getElementById(selComBoName).value;
				 if(selVal==""){
				 alert("please select priority value");
				 document.getElementById(selComBoName).focus();
				 return false;
				 }
			}
		}
	}*/
   
 	DelAll();
	return true;
}
	
	
function postData(){
//alert(document.frmMapLevel.eventTypeId.value);
 	if(frmMapLevel.eventTypeId.value!=""){
		frmMapLevel.process.value = "mapPriorityProcess";
		frmMapLevel.method="post";
		frmMapLevel.action="map.do";
		frmMapLevel.submit();
	}
	else{
		alert("Select any one Event Type");
		frmMapLevel.eventTypeId.focus();
	}
}
 </script>
<body>
 <%
	String EventId = (String)request.getAttribute("eventTypeId");
	System.out.print("EventId:" + EventId);
	if(EventId==null){
		EventId = "";
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
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			
<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
				   <tr>
					<td colspan="2" class="tblMainHead">
						Roles &amp; Privileges: <span class="styleBoldTwo"> Entity Role Mapping </span>					</td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">
 				You can map an <strong>Event Level</strong> or Multiple <strong>Event Level</strong> for
 				a given Membership Type Name as given below. <br />
				 
					<br />					</td>
				  </tr>
				  <tr>
					<td>
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						  <tr> 
							<td colspan="2" class="tblRowHead"> Map An Event Level For A Member: </td>
						  </tr>
			<form name="frmMapLevel" id="frmMapLevel" >
			<input type="hidden" name="process" value="" />
			<tr>
					<td class="tableLeft">Select a Event Type:</td>
					<td class="tableRight"><span class="alignLeft">
					<select name="eventTypeId" id="eventTypeId" class="selectboxOne" onchange="postData();">
						<option selected="selected" value="">Select One</option>
						<%
							Vector allTypesVect=(Vector)request.getAttribute("allTypesVect");
							if(allTypesVect!=null){
							Enumeration itrators= (Enumeration)allTypesVect.elements();
							while(itrators.hasMoreElements()){
								String[] levels = (String[]) itrators.nextElement();                                    
								String typeid=levels[0];
								String name=levels[1];
								String status = levels[2];
								String add_date = levels[3];
								 if(typeid.equals(EventId)){
						%>
					<option  value="<%=typeid%>" selected="selected"><%=name%></option>
						<%
							}
							else{
						%>
					<option  value="<%=typeid%>"><%=name%></option>
						<%
							}
							}
							}
						%>
					</select>
					</span>
					
					</td>
					</tr>
					
			
			
			
			</form>
						  <form name="myform" id="myform" method="post" action="map.do" onsubmit="return entPrivValidate();">
						  <input type="hidden" name="process" value="mappingPriorityLevel" />
							<input type="hidden" name="entityIds" value="puni">
							<input type="hidden" name="EventId" value="<%=EventId%>"> 
						
						  <tr> 
							 
							<td colspan="2" class="tableLeftTxtArea"> Accessible Event Level(s):</td>
							</tr>
						  <tr>
						    <td colspan="2">
							
							<table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td width="238" class="tableLeftTxtArea">&nbsp;
								  <input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" > Select All									</td>
								    <td width="238" class="tableLeftTxtArea"><strong>Priority</strong></td>
								</tr>
													<%
													//int chkSelct = 0;
													ArrayList DispCompResult=(ArrayList)request.getAttribute("DispCompResult");
													if(DispCompResult!= null && DispCompResult.size()!=0){
													int n = DispCompResult.size();
													System.out.print("n" +n);
													Iterator itr = DispCompResult.iterator();
													while(itr.hasNext()){
														//chkSelct++;
														String[] res = (String[]) itr.next();
															String compResultTypeId = res[0];
															String compResultName = res[1];
															String compResultDesc = res[2];
															String addDate = res[3];
															int pNo =0;
															//System.out.print("compResultTypeId:" + compResultTypeId);
															boolean entIdStatus = false;
																ArrayList mapCompResultDetails = (ArrayList)request.getAttribute("mapEventTypeDetails");
																
																if(mapCompResultDetails!=null && mapCompResultDetails.size()!=0){
																	Iterator itMemCompResultList = mapCompResultDetails.iterator();
																	//String[] evtMapList = {mapEventTypeId, tepmEventTypeId, compResultId, eventTypeName, resultName,String.valueOf(priority)};
																	while(itMemCompResultList.hasNext()){
																		String[] mapEntList = (String [])itMemCompResultList.next();
																	 	String mapEventTypeId = mapEntList[0];
																		String tepmEventTypeId = mapEntList[1];
																		String compResultId = mapEntList[2];
																		String eventTypeName = mapEntList[3];
																		String resultName = mapEntList[4];
																		String priority = mapEntList[5];
																		pNo = Integer.parseInt(priority);
																		//System.out.print("compResultId:" + compResultId);
																		//System.out.print("pNo" + pNo);
																		if(compResultTypeId.equals(compResultId)){
																			entIdStatus = true;
																			break;
																		}
																	}
											}
											if(entIdStatus==true){									
													%>
													<tr> 
													<td class="tableLeftTxtArea">&nbsp;
															<input type="checkbox" size="10"  name="<%=compResultName%>"  value="<%=compResultTypeId%>" checked="checked"  />&nbsp;<%=compResultName%>													</td>
													 
													
													<td class="tableLeftTxtArea"><span class="formX">
													  <select name="priorityId<%=compResultName%>" id="priorityId<%=compResultName%>" class="selectboxOne">
													  <option value="0" selected="selected">0</option>
                                               		<%
														
															for(int i=1;i<=n;i++) {
															if(pNo==i){
															%>
                                                            <option value="<%=i%>" selected="selected"><%=i%></option>
															<%
															}
															else{%>
															  <option value="<%=i%>"><%=i%></option>
															<%}
															}
														%>
                                                      </select>
													</span>&nbsp;</td>
													</tr>
											<%
											 }
									 	else{ 
											%>
													 <tr> 
													<td class="tableLeftTxtArea">&nbsp;
															<input type="checkbox" size="10" name="<%=compResultName%>"  value="<%=compResultTypeId%>" />&nbsp;<%=compResultName%>
															</td>
															<td class="tableLeftTxtArea"><span class="formX">
													  <select name="priorityId<%=compResultName%>" id="priorityId<%=compResultName%>" class="selectboxOne">
                                                          <option value="0" selected="selected">0</option>
														   <%
															for(int i=1;i<=n;i++) {
															%>
                                                        <option value="<%=i%>"><%=i%></option>
															<%
															}
														%>
                                                      </select>
													</span>&nbsp;</td>
													</tr> 
											 <%
											  }
										 }
									 }
									%>
							  </table>
							
							</td>
						    </tr>
						  <tr> 
							<td colspan="2" class="alignCenter">
							
							<input type="submit" value="Submit" class="gradBtn" />
						    <input name="button" type="button" class="gradBtn" value="Cancel" onclick="javascript:history.back(-1);"/>							</td>
						  </tr>
						  </form>
						  <tr> 
							<td colspan="2" class="alignCenter">&nbsp;<!-- DO NOT DELETE THIS ROW --></td>
						  </tr>
						</table>					</td>
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