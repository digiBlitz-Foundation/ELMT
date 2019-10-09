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
//alert();
	var chkValue = "";
	e = document.forms['myform'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
		 
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}
		 
		document.myform.chkdEveLevels.value = chkValue;
		
		//alert("Final" + count + " checked Value:  ********" + document.myform.chkdEveLevels.value);
}

function myValidate(){
//alert();
  	if(document.myform.selArea.value==""){
		alert("Select an Area");
		document.myform.selArea.focus();
		return false;
	}
	
	
var eventLvlValue=document.myform.eventLevelCnt.value;
var isChecked = false;
	
	for(var k=0;k<eventLvlValue;k++){
	var chName = "tmpEventLevel"+k;
		if(document.getElementById(chName).checked){
			isChecked = true;
		}
	}
if(isChecked==false){
		alert("Check any one of the check box");
		return false;
	}	
 	DelAll();
	return true;
}
</script>	
	
<script language="javascript">
function postData(selArea){
	if(selArea!=null && selArea!=""){
		document.myform.method="post";
		document.myform.action="./ChampLevel.do?cmd=eveLevel&selArea="+selArea;
		document.myform.submit();
	}else{
		alert("Select a Valid Area");
		return false;		
	}
	return true;
}	

 </script>
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
					<td colspan="2" class="tblMainHead">
						Online Entries: <span class="styleBoldTwo"> Championship Level Map </span>					</td>
				  </tr>
				<%
				String eventTypeId = (String)request.getAttribute("eventType");
				String areaId = (String)request.getAttribute("areaId");			
				%>  			
				  <tr>
					<td colspan="2" class="tblDescrp">
 				You can map an <strong>Area</strong>  for an <strong>Event Level</strong>. <br />
				 
					<br />					</td>
				  </tr>
				  <tr>
					<td>
						<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
						  <tr> 
							<td colspan="2" class="tblRowHead"> Map Championship Level: </td>
						  </tr>
						  <form name="myform" id="myform" action="ChampLevel.do" method="post" onsubmit="return myValidate();">
					    	<input type="hidden" name="cmd" value="mapLevel" />
							<input type="hidden" name="chkdEveLevels" id="chkdEveLevels" value=""/>	
							<input type="hidden" name="eventType" id="eventType" value=""/>	
				  <tr>
						<td class="tableLeft"> Area:</td>
					    <td class="tableRight"><span class="alignLeft"></span>						  
			         <select name="selArea" id="selArea" class="selectboxOne" onchange="postData(this.value);">
                        <option selected="selected" value="">Select One</option>
						<%
						
						ArrayList allAreaList = (ArrayList)request.getAttribute("areaDetails");
						if(allAreaList!=null&& allAreaList.size()!=0){
						Iterator areaLst = allAreaList.iterator();
						while(areaLst.hasNext()){
								String AreaLstArr[] = (String [])areaLst.next();
								String area_id = AreaLstArr[0];
								String area_code = AreaLstArr[1];
								String area_name = AreaLstArr[2];
								out.print("area_id "+area_id);
								if(areaId.trim().equalsIgnoreCase(area_id)){
						%>
							<option  value="<%=area_id%>" selected="selected"><%=area_name%></option>
							<%
											}
											else{
									%>
							<option  value="<%=area_id%>"><%=area_name%></option>
							<%

							}
							}
						}
					
						%>
                      </select>&nbsp;&nbsp;<span class="asterisk">&nbsp;*</span>							  
										  
					</td>
					</tr>					  				
							
		
				
								 					
			<%
		ArrayList eventLevelDetails = (ArrayList)request.getAttribute("eventLevelDetails");
		System.out.println("eventLevelDetails in jsp: "+eventLevelDetails);		
							if(eventLevelDetails!=null && eventLevelDetails.size()!=0){
			
			%>
			<tr> 							 
				<td colspan="2" class="tableLeftTxtArea">Event Level(s):<span class="asterisk">&nbsp;*</span></td>
				</tr>
						  <tr>											
									<td width="477" colspan="2" class="tableLeftTxtArea">&nbsp;
<input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" > Select All									</td>
							</tr>
			<input type="hidden" name="eventLevelCnt" id="eventLevelCnt" value="<%=eventLevelDetails.size()%>"/>										
						<% Iterator itl = eventLevelDetails.iterator();
									int i=0;
								  while(itl.hasNext()){
								  
								String [] levelDet = (String [])itl.next();
								//String evId = levelDet[0];
								String evLevelId = levelDet[0];
								String evLevelCode = levelDet[1];
								
								
			            boolean entIdStatus = false;
						ArrayList eventLevelAreaDets = (ArrayList)request.getAttribute("eventLevelAreaDets");
						String chStatus = "";
					if(eventLevelAreaDets!=null && eventLevelAreaDets.size()!=0){
					Iterator itr = eventLevelAreaDets.iterator();	
					
				while(itr.hasNext()){
								String[] mapEntList = (String [])itr.next();
								String areaEventLevelId = mapEntList[1];
								if(evLevelId.equals(areaEventLevelId)){
								entIdStatus = true;
								break;
								}
								}
								}
						if(entIdStatus==true) chStatus = "checked";
						else chStatus = "";
											
											%>
										
									<tr> 
									<td  colspan="2" class="tableLeftTxtArea">&nbsp;
		<input type="checkbox" size="10" name="tmpEventLevel" id="tmpEventLevel<%=i%>" <%=chStatus%> value="<%=evLevelId%>" />&nbsp;<%=evLevelCode%>		
													</td>
													</tr>
				<% 
					i++;													
					}%>
				  <tr> 
					<td colspan="2" class="alignCenter">
					<input type="submit" value="Submit" class="gradBtn" />
					<input name="button" type="button" class="gradBtn" value="Cancel" onclick="location.href='index.jsp'"/>							</td>
				  </tr>
					
				<%}%>
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