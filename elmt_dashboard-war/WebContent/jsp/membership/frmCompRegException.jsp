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
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcmeeting.util.*"%>


<%! public String chkNull(String fieldValue) {
	if(fieldValue==null) fieldValue = "NG";
	return fieldValue;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
</head>
<script language="javascript">
<!-- Suresh Here -->
// AJAX Mehtod Call here
//=============================================== Horse Validation ==========================================================
	function retrieveURL(methodName,param,hrName, relOpt, hrMemId) {
		if(param.value.length>0 && param.value!="" && param.value=="Other") {
			var paramName = param.name;
			var url = null;
			url = "dropDownHrRel.do?method="+escape(methodName)+"&horseName="+escape(hrName);
			if (window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			document.getElementById(hrMemId).value = "";
			req.onreadystatechange = function() {
									if (req.readyState == 4) { // Complete
										if (req.status == 200) { // OK response
											var xmlDoc = req.responseXML.documentElement;
											var xRows= xmlDoc.getElementsByTagName('entry');
											var objDDL = document.getElementById(relOpt);
											objDDL.innerHTML="";
											
											if(xRows.length==0){
												setToDefault(relOpt, hrMemId);
											}
											
											for (var i=0; i<xRows.length; i++) {
												var nameNodes = xRows[i].getElementsByTagName("optionHrMemberId");
												var valueNodes = xRows[i].getElementsByTagName("optionHrName");
												var valueRiderNodes = xRows[i].getElementsByTagName("optionRId");
												
												if (nameNodes.length > 0 && valueNodes.length > 0) {
													var theValue = nameNodes[0].firstChild.nodeValue;
													var theText = valueNodes[0].firstChild.nodeValue;
													var theRider = valueRiderNodes[0].firstChild.nodeValue;
												}
												
												var option = new Option( theValue + " - "+ theText  + " - " +theRider, theValue);
												
												try {
													objDDL.add(option,null);
												}catch(e){
													objDDL.add(option,-1);
												}
											}
										} else {
											alert("Problem: " + req.statusText);
										}
									}
			}
			
			//alert(url);
			req.open("GET", url, true);
			req.send(null);
		} else {
			document.getElementById(hrMemId).value = param.value;
			setToDefault(relOpt, hrMemId);
		}
	}
	
	function displayRelationValue(optValue) {
		if (req.readyState == 4) { // Complete
			if (req.status == 200) { // OK response
				var xmlDoc = req.responseXML.documentElement;
//				if(xml) {
				var xRows= xmlDoc.getElementsByTagName('entry');
				var objDDL = document.getElementById("riderRelation3");
				objDDL.innerHTML="";
				// setToDefault('selWinSubTypechkIssue1');
				for (var i=0; i<xRows.length; i++) {
					var nameNodes = xRows[i].getElementsByTagName("optionHrMemberId");
					var valueNodes = xRows[i].getElementsByTagName("optionHrName");
					var valueRiderNodes = xRows[i].getElementsByTagName("optionRId");
					if (nameNodes.length > 0 && valueNodes.length > 0) {
						var theValue = nameNodes[0].firstChild.nodeValue;
						var theText = valueNodes[0].firstChild.nodeValue;
						var theRider = valueRiderNodes[0].firstChild.nodeValue;
					}
					var option = new Option( theValue + " - "+ theText  + " - " +theRider, theValue);
					try {
						objDDL.add(option,null);
					}catch(e){
						objDDL.add(option,-1);
					}
				}
			} else {
				alert("Problem: " + req.statusText);
			}
		}
	}
	
	function setToDefault(objName, hrMemId){
		var currObj = document.getElementById(objName);
		currObj.innerHTML="";
		var rootObj =  document.createElement("option");
		var attrib = document.createAttribute("value");
		attrib.value="";
		rootObj.setAttributeNode(attrib);
		newtext=document.createTextNode('Select One');
		rootObj.appendChild(newtext);
		currObj.appendChild(rootObj);
		//document.getElementById(hrMemId).value = "";
	}
	
	function loadHrMemberId(param, objName){
		if(param.value.length>0 && param.value!="") {
			document.getElementById(objName).value = param.value;
		}
	}
	
//=============================================== Rider Validation ==========================================================
	function loadRiderId(param, objName){
		if(param.value.length>0 && param.value!="" && param.value!= "Other") {
			document.getElementById(objName).value = param.value;
		}
		else{
			document.getElementById(objName).value = "";
		}
	}
	
	
	function checkAllFields(){
		var rCnt = document.frmComRegVal.rSize.value;
		for(i = 1; i<=rCnt ; i++){
			var horseFieldName = "horseMemberId"+i;
			var riderFieldName = "riderMemberId"+i;			
			var horseName = "horseName"+i;
			var riderFname = "riderFname"+i;
			var riderLname = "riderLname"+i;
			
			if(document.getElementById(horseFieldName).value == "" || document.getElementById(horseFieldName).value.indexOf(" ")==0){
				alert("Horse Member Id Can't be Empty");
				document.getElementById(horseFieldName).focus();
				return false;
			}
			
			if(document.getElementById(riderFieldName).value == "" || document.getElementById(riderFieldName).value.indexOf(" ")==0){
				alert("Rider Member Id Can't be Empty");
				document.getElementById(riderFieldName).focus();
				return false;
			}
			
			if(document.getElementById(horseName).value == "" || document.getElementById(horseName).value.indexOf(" ")==0){
				alert("Horse Name Can't be Empty");
				document.getElementById(horseName).focus();
				return false;
			}
			
			if(document.getElementById(riderFname).value == "" || document.getElementById(riderFname).value.indexOf(" ")==0){
				alert("Rider First Name Can't be Empty");
				document.getElementById(riderFname).focus();
				return false;
			}
			
			if(document.getElementById(riderLname).value == "" || document.getElementById(riderLname).value.indexOf(" ")==0){
				alert("Rider Last Name Can't be Empty");
				document.getElementById(riderLname).focus();
				return false;
			}
			
		}
		return true;
	}
	
	
//==================================================================================================================

function setValues(obj,count)
{
	var hiCt = "horseMemberId"+count;
	var hnCt = "horseName"+count;
	var rfnCt = "riderFname"+count;
	var rlnCt = "riderLname"+count;
	var riCt = "riderMemberId"+count;
	var riSCode = "riderStateCode"+count;
	
	document.getElementById(hiCt).value = "";
	document.getElementById(hnCt).value = "";
	document.getElementById(rfnCt).value = "";
	document.getElementById(rlnCt).value = "";
	document.getElementById(riCt).value = "";
	document.getElementById(riSCode).value = "";
	
	if(obj.value !="")
	{
	val = obj.value.split("#");
	
	//alert("hiCt :"+hiCt);
	
	//alert("count :"+count);
	
	document.getElementById(hiCt).value = val[0];
	document.getElementById(hnCt).value = val[1];
	document.getElementById(rfnCt).value = val[3];
	document.getElementById(rlnCt).value = val[4];
	document.getElementById(riCt).value = val[2];
	document.getElementById(riSCode).value = val[5];
	}
	
}

function setExactRider(obj,count)
{	
	var rfnCt = "riderFname"+count;
	var rlnCt = "riderLname"+count;
	var riCt = "riderMemberId"+count;
	var riSCode = "riderStateCode"+count;
		
	document.getElementById(rfnCt).value = "";
	document.getElementById(rlnCt).value = "";
	document.getElementById(riCt).value = "";
	document.getElementById(riSCode).value = "";
	
	if(obj.value !="")
	{
	val = obj.value.split("#");
			
	document.getElementById(rfnCt).value = val[1];
	document.getElementById(rlnCt).value = val[2];
	document.getElementById(riCt).value = val[0];
	document.getElementById(riSCode).value = val[3];
	}
	
}

function setExactHorse(obj,count)
{
	var hiCt = "horseMemberId"+count;
	var hnCt = "horseName"+count;
		
	document.getElementById(hiCt).value = "";
	document.getElementById(hnCt).value = "";
		
	if(obj.value !="")
	{
	val = obj.value.split("#");
	
	//alert("hiCt :"+hiCt);
	
	//alert("count :"+count);
	
	document.getElementById(hiCt).value = val[0];
	document.getElementById(hnCt).value = val[1];
	
	}
	
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
	  <form name="frmComRegVal" id="frmComRegVal" method="post" action="competitionReg.do" onsubmit="return checkAllFields();">
	  <input type="hidden" name="process" value="validate" />
		<table width="760"  border="0" align="center" cellpadding="0" cellspacing="5" id="mainTab">
		  
		  <tr>
			<td  align="left" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				<table width="100%"  border="0" cellpadding="0" align="center" cellspacing="0">
				   <tr>
					<td colspan="2" class="tblMainHead">
						Exception Report: <span class="styleBoldTwo">Exception List </span></td>
				  </tr>
				  <tr>
					<td colspan="2" class="tblDescrp">
 				You Can View All Exception List for Competition registration. <br />
				 
					<br />					</td>
				  </tr>
				  <tr>
					<td>
					<table border="0" cellpadding="0" align="center" cellspacing="1">
		  <tr>
			<td width="144" height="27" class="tblRowHeadTwo">Horse Name</td>
			<td width="144" class="tblRowHeadTwo">Horse MemberId</td>
			<td width="92" class="tblRowHeadTwo">Rider  Name </td>
			<td width="63" class="tblRowHeadTwo">Rider Id</td>
		   </tr>
		  <tr>
		  <%
		  String uploadId = (String) request.getAttribute("uploadId");
		  System.out.println("uploadId Value in JSP:" + uploadId);
		  
		  ArrayList exceptionList = (ArrayList)request.getAttribute("exceptionList");
		  int rowCnt = 0;
		  if(exceptionList!=null && exceptionList.size()!=0){
		  Iterator itExp = exceptionList.iterator();
		  while(itExp.hasNext()) {
			   rowCnt = rowCnt + 1;
			   ValidateCompRegVO valCompRegVO = (ValidateCompRegVO)itExp.next();
			   ArrayList hrList = valCompRegVO.getHorseList();

			   ArrayList riderList = valCompRegVO.getRiderList();
			   
			   ArrayList relationList = valCompRegVO.getRelationList();
			  			   
			   String riderLastName = valCompRegVO.getRiderLName();
			   
			   String hrName = valCompRegVO.getHorseName();
			   if(hrName!=null && hrName.trim().length()!=0){
					if(hrName.length()>=3){
							hrName = hrName.substring(0,3);
					 }
				}
				
			   if(riderLastName!=null && riderLastName.trim().length()!=0){
					if(riderLastName.length()>=3){
							riderLastName = riderLastName.substring(0,3);
					 }
				}

		  %>
		   <input type="hidden" name="eventId<%=rowCnt%>" value="<%=valCompRegVO.getEventId()%>"/>
		   <input type="hidden" name="eventType<%=rowCnt%>" value="<%=valCompRegVO.getEventType()%>"/>
		   <input type="hidden" name="eventLevel<%=rowCnt%>" value="<%=valCompRegVO.getEventLevel()%>"/>
		   <input type="hidden" name="eventDivAma<%=rowCnt%>" value="<%=valCompRegVO.getEventDivisionAmateur()%>"/>
		   <input type="hidden" name="eventDivAge<%=rowCnt%>" value="<%=valCompRegVO.getEventDivisionAge()%>"/>
		   <input type="hidden" name="eventDivExp<%=rowCnt%>" value="<%=valCompRegVO.getEventDivisionExperience()%>"/>
		   <input type="hidden" name="eventHrName<%=rowCnt%>" value="<%=valCompRegVO.getHorseName()%>"/>
		   <input type="hidden" name="eventHrUsefId<%=rowCnt%>" value="<%=valCompRegVO.getHorseUsefId()%>"/>
		   
		   <input type="hidden" name="eventRFName<%=rowCnt%>" value="<%=valCompRegVO.getRiderFName()%>"/>
		   <input type="hidden" name="eventRLName<%=rowCnt%>" value="<%=valCompRegVO.getRiderLName()%>"/>
		   <input type="hidden" name="eventRUsefId<%=rowCnt%>" value="<%=valCompRegVO.getRiderUsefId()%>"/>
		   <input type="hidden" name="eventOwnerFName<%=rowCnt%>" value="<%=valCompRegVO.getOwnerFirstName()%>"/>
		   <input type="hidden" name="eventOwnerLName<%=rowCnt%>" value="<%=valCompRegVO.getOwnerLastName()%>"/>
		   
		   <input type="hidden" name="eventOwnerUseaId<%=rowCnt%>" value="<%=valCompRegVO.getOwnerUseaId()%>"/>
		   <input type="hidden" name="eventOwnerUsefId<%=rowCnt%>" value="<%=valCompRegVO.getOwnerUsefId()%>"/>
		   <input type="hidden" name="eventTempRegId<%=rowCnt%>" value="<%=valCompRegVO.getTmpRegistrationId()%>"/>
		   <input type="hidden" name="eventRiderMemberId<%=rowCnt%>" value="<%=valCompRegVO.getRiderMemberId()%>"/>
		   <input type="hidden" name="eventHorseMemberId<%=rowCnt%>" value="<%=valCompRegVO.getHorseMemberId()%>"/>		   
		   
			<tr>
				<%--<th bgcolor="#E3E1D2" class="alignLeft">
				<%=chkNull(valCompRegVO.getHorseName())%>
				<br />
				<%
				if(hrList!=null && hrList.size()==0) {
			%>
				<input type="text" name="horseName" size="30"/>
			<%
			}
			else if(hrList!=null && hrList.size()==1){
				Iterator itHr = hrList.iterator();
				if(itHr.hasNext()){
				String hrArray[] = (String[])itHr.next();
				String hrId = hrArray[0];
				String hrIdName = hrArray[1];
			%>
				<input type="text" name="horseName<%=rowCnt%>" value="<%=hrIdName%>" size="30"/>
			<%
			}
			}
			else if(hrList!=null && hrList.size()>1){
				Iterator itHr = hrList.iterator();
				%>
				<select name="horseNameList<%=rowCnt%>" id="horseNameList<%=rowCnt%>" class="selectboxOne" onChange="retrieveURL('meeHorseRelVal',this, '<%=hrName%>', 'riderRelation<%=rowCnt%>', 'horseMemberId<%=rowCnt%>');">
				<%
				while(itHr.hasNext()){
				String hrArray[] = (String[])itHr.next();
				String hrId = hrArray[0];
				String hrIdName = hrArray[1];
			%>
				<option value="<%=hrId%>"><%=hrId%> - <%=hrIdName%> </option>
			<%
			}
			%>

			<option value="Other"> - Other - </option>
			</select>
			<%
			}
			%>
			<br />				
			<select name="riderRelation<%=rowCnt%>" id="riderRelation<%=rowCnt%>" class="selectboxOne" 
			onchange="loadHrMemberId(this, 'horseMemberId<%=rowCnt%>')" >
			<option selected="selected" value="">Select One</option>
			</select>
			</th>--%>
								
				
				<%
				boolean matchStatus=false;
				try{
			       if(valCompRegVO.getHorseName()!=null && valCompRegVO.getHorseMemberId()!=null &&
			       valCompRegVO.getRiderFName()!=null && valCompRegVO.getRiderLName()!=null && 
			       valCompRegVO.getRiderMemberId()!=null && relationList!=null){
						Iterator itHr = relationList.iterator();
						if(itHr.hasNext()){
						String hrArray[] = (String[])itHr.next();
						String hrId = hrArray[1];
						String hrIdName = hrArray[0];
						String fName = hrArray[2];
						String lName = hrArray[3];
						String ridId = hrArray[4];
						
						//out.print("matchStatus 1:"+matchStatus);	
							if(valCompRegVO.getHorseName().equalsIgnoreCase(hrIdName) && valCompRegVO.getHorseMemberId().														                            equalsIgnoreCase(hrId) && valCompRegVO.getRiderFName().equalsIgnoreCase(fName) && valCompRegVO.                            getRiderLName().equalsIgnoreCase(lName) && valCompRegVO.getRiderMemberId().equalsIgnoreCase(ridId) ){
						        matchStatus=true;%>
								
							<input type="hidden" name="horseName<%=rowCnt%>" value="<%=hrIdName%>" />
							<input type="hidden" name="horseMemberId<%=rowCnt%>" value="<%=hrId%>"/>
							<input type="hidden" name="riderFname<%=rowCnt%>" value="<%=fName%>" />
							<input type="hidden" name="riderLname<%=rowCnt%>" value="<%=lName%>" />
							<input type="hidden" name="riderMemberId<%=rowCnt%>" value="<%=ridId%>" />
						    <%}
				        }
					}	
				}catch(Exception e)
				{
					System.out.print("exception in JSP :"+e);
				}
				//out.print("matchStatus 2:"+matchStatus);	
				if(matchStatus==false){%>
				
			<th bgcolor="#E3E1D2" class="alignLeft">
			<%=chkNull(valCompRegVO.getHorseName())%>
			<br />
				
			<% try
				{
				if(relationList!=null && relationList.size()==0) {
			%>
				<input type="text" name="horseName<%=rowCnt%>" id="horseName<%=rowCnt%>" size="30"/>
			<%
			}
			else if(relationList!=null && relationList.size()==1){
				Iterator itHr = relationList.iterator();
				if(itHr.hasNext()){
				String hrArray[] = (String[])itHr.next();
				String hrId = hrArray[1];
				String hrIdName = hrArray[0];
			%>
				<input type="text" name="horseName<%=rowCnt%>" id="horseName<%=rowCnt%>" value="<%=hrIdName%>" size="30"/>
			<%
			}
			}
			else if(relationList!=null && relationList.size()>1){
				Iterator itHr = relationList.iterator();
				%>
				<input type="text" name="horseName<%=rowCnt%>" id="horseName<%=rowCnt%>" size="30"/><br/>
				
				<select name="horseNameList<%=rowCnt%>" id="horseNameList<%=rowCnt%>" class="selectboxOne" onChange="setValues(this,'<%=rowCnt%>');">
				
				<option value="">Select One</option>
				
				<%
				while(itHr.hasNext()){
				String hrArray[] = (String[])itHr.next();
				String hrId = hrArray[1];
				String hrIdName = hrArray[0];
				String fName = hrArray[2];
				String lName = hrArray[3];
				String ridId = hrArray[4];
				
				String ridSCode  = "";
				
				if(hrArray[5]!=null)
				{
					ridSCode = hrArray[5];
				}
				
				String ownSCode  = "";
				
				if(hrArray[6]!=null)
				{
					ownSCode = hrArray[6];
				}
				
				String ridTyp  = "";
				
				if(hrArray[6]!=null)
				{
					if(hrArray[7].equalsIgnoreCase("Rider"))
					{
						ridTyp = "R";
					}
					else if(hrArray[7].equalsIgnoreCase("Previous Rider"))
					{
						ridTyp = "PR";
					}
				}
				
			%>
				<option value="<%=hrId+"#"+hrIdName+"#"+ridId+"#"+fName+"#"+lName+"#"+ridSCode%>"><%=hrId%> - <%=hrIdName+" ("+ownSCode+") "%> - <%=ridId%> - <%=ridTyp%></option>
			<%
			}
			%>

			</select>
			<%
			}
			else if(hrList!=null && hrList.size()==0)
			{%>
				<input type="text" name="horseName<%=rowCnt%>" id="horseName<%=rowCnt%>" size="30"/><br/>
			<%}
			else if(hrList!=null && hrList.size()==1)
			{
				Iterator itHr = hrList.iterator();
				if(itHr.hasNext()){
				String horseDet[] = (String[])itHr.next();
				String horseId = horseDet[0];
				String horseName = horseDet[1]; 				
			%>
				<input type="text" name="horseName<%=rowCnt%>" id="horseName<%=rowCnt%>" value="<%=horseName%>" size="30"/>
			<%}}
			else if(hrList!=null && hrList.size()>1)
			{
			
			Iterator itHr = hrList.iterator();
				%>
				<input type="text" name="horseName<%=rowCnt%>" id="horseName<%=rowCnt%>" size="30"/><br/>
				
				<select name="horseExactNameList<%=rowCnt%>" id="horseExactNameList<%=rowCnt%>" class="selectboxOne" onChange="setExactHorse(this,'<%=rowCnt%>');">
				
				<option value="">Select One</option>
				
				<%
				while(itHr.hasNext()){
				String hrArray[] = (String[])itHr.next();
				String hrId = hrArray[0];
				String hrIdName = hrArray[1];
				
				String ownSCode  = "";
				
				if(hrArray[2]!=null)
				{
					ownSCode = hrArray[2];
				}
				
			%>
				<option value="<%=hrId+"#"+hrIdName%>"><%=hrId%> - <%=hrIdName%> - <%=ownSCode%></option>
			<%
			}
			%>

			</select>
				<%}
				%>					
			<br />							
			</th>
				
				<th bgcolor="#E3E1D2" class="alignLeft">
				<%=chkNull(valCompRegVO.getHorseMemberId())+" - "+chkNull(valCompRegVO.getEventLevel())%><br />
				<%
				if(relationList!=null && relationList.size()==0) {
			%>
				<input type="text" name="horseMemberId<%=rowCnt%>" id="horseMemberId<%=rowCnt%>" value="" size="8"/>
			<%
			}
			else if(relationList!=null && relationList.size()==1){
				Iterator itHr = relationList.iterator();
				if(itHr.hasNext()){
				String hrArray[] = (String[])itHr.next();
				String hrId = hrArray[1];
				String hrIdName = hrArray[0];
			%>
				<input type="text" name="horseMemberId<%=rowCnt%>" id="horseMemberId<%=rowCnt%>" value="<%=hrId%>" size="8" />
			<%
			}
			}
			else if(relationList!=null && relationList.size()>1){
			%>
			<input type="text" name="horseMemberId<%=rowCnt%>" id="horseMemberId<%=rowCnt%>" value="" size="8" />
			<%
			}
			else if(hrList!=null && hrList.size()==0) {
			%>
				<input type="text" name="horseMemberId<%=rowCnt%>" id="horseMemberId<%=rowCnt%>" value="" size="8"/>
			<%
			}
			else if(hrList!=null && hrList.size()==1){
				Iterator itHr = hrList.iterator();
				if(itHr.hasNext()){
				String hrArray[] = (String[])itHr.next();
				String hrId = hrArray[0];
				String hrIdName = hrArray[1];
			%>
				<input type="text" name="horseMemberId<%=rowCnt%>" id="horseMemberId<%=rowCnt%>" value="<%=hrId%>" size="8" />
			<%
			}
			}
			else if(hrList!=null && hrList.size()>1){
			%>
			<input type="text" name="horseMemberId<%=rowCnt%>" id="horseMemberId<%=rowCnt%>" value="" size="8"/>
			<%
			}%>
			
			</th>
				<td bgcolor="#E3E1D2" class="alignLeft">
				<%=chkNull(valCompRegVO.getRiderFName())%>&nbsp;<%=chkNull(valCompRegVO.getRiderLName())%>
				<br />

				<%
				//System.out.println("Size:" + riderList.size());
				if(relationList!=null && relationList.size()==0) {
			%>
				 <input type="text" name="riderFname<%=rowCnt%>" id="riderFname<%=rowCnt%>"/>
		   		 <input type="text" name="riderLname<%=rowCnt%>" id="riderLname<%=rowCnt%>"/>
			<%
			}
			else if(relationList!=null && relationList.size()>1) {
			%>
				<input type="text" name="riderFname<%=rowCnt%>" id="riderFname<%=rowCnt%>"/>
		   		<input type="text" name="riderLname<%=rowCnt%>" id="riderLname<%=rowCnt%>"/>
			<%
			}				
			else if(relationList!=null && relationList.size()==1){
				Iterator itRider = relationList.iterator();
				if(itRider.hasNext()){
				String hrArray[] = (String[])itRider.next();
				String riderFname = hrArray[2];
				String riderLname = hrArray[3];
				String riderMemberId = hrArray[4];
			%>				
				<input type="text" name="riderFname<%=rowCnt%>" id="riderFname<%=rowCnt%>" value="<%=riderFname%>"/>
    	   		<input type="text" name="riderLname<%=rowCnt%>" id="riderLname<%=rowCnt%>" value="<%=riderLname%>"/>
				
			<%
			}
			}						
			else if(riderList!=null && riderList.size()==0) {
			%>
				 <input type="text" name="riderFname<%=rowCnt%>" id="riderFname<%=rowCnt%>"/>
		   		 <input type="text" name="riderLname<%=rowCnt%>" id="riderLname<%=rowCnt%>"/>
			<%
			}
			else if(riderList!=null && riderList.size()>1) {
			Iterator itRider = riderList.iterator();
			%>
			<select name="riderExactNameList<%=rowCnt%>" id="riderExactNameList<%=rowCnt%>" class="selectboxOne" onChange="setExactRider(this,'<%=rowCnt%>');">
				
				<option value="">Select One</option>
				
				<%
				while(itRider.hasNext()){
				String ridArray[] = (String[])itRider.next();
				String rId = ridArray[2];
				String rFName = ridArray[0];
				String rLName = ridArray[1];
				
				String rState = "";
				
				if(ridArray[3] != null)
				{
				 	rState = ridArray[3];
				}
			%>
				<option value="<%=rId+"#"+rFName+"#"+rLName+"#"+rState%>"><%=rId%> - <%=rFName+" "+rLName%></option>
			<%
			}
			%>

			</select>
			
				<input type="text" name="riderFname<%=rowCnt%>" id="riderFname<%=rowCnt%>"/>
		   		<input type="text" name="riderLname<%=rowCnt%>" id="riderLname<%=rowCnt%>"/>
			<%
			}			
			else if(riderList!=null && riderList.size()==1){
				Iterator itRider = riderList.iterator();
				if(itRider.hasNext()){
				String hrArray[] = (String[])itRider.next();
				String riderFname = hrArray[0];
				String riderLname = hrArray[1];
				String riderMemberId = hrArray[2];
			%>				
				<input type="text" name="riderFname<%=rowCnt%>" value="<%=riderFname%>" id="riderFname<%=rowCnt%>"/>
    	   		<input type="text" name="riderLname<%=rowCnt%>" value="<%=riderLname%>" id="riderLname<%=rowCnt%>"/>
				
			<%
			}
			}
						
			%>	
			<br />				
				</td>
				<td bgcolor="#E3E1D2" class="alignLeft">
				<%=chkNull(valCompRegVO.getRiderMemberId())%>
				<br />
				<%
				if(riderList!=null && riderList.size()==1) {
					Iterator itRider = riderList.iterator();
						if(itRider.hasNext()){
							String hrArray[] = (String[])itRider.next();
							String riderFname = hrArray[0];
							String riderLname = hrArray[1];
							String riderMemberId = hrArray[2];
							String riderStateCode = "";
							if(hrArray[3]!=null)
							{
								riderStateCode = hrArray[3];
							}
				%>

				<input type="text" name="riderMemberId<%=rowCnt%>" id="riderMemberId<%=rowCnt%>" value="<%=riderMemberId%>"  size="5"/> - 
				<input name="riderStateCode<%=rowCnt%>" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="<%=riderStateCode%>" size="2" readonly="readonly" />
				<%
					}
				}
				else if(relationList!=null && relationList.size()==1) {
					Iterator itRider = relationList.iterator();
						if(itRider.hasNext()){
							String hrArray[] = (String[])itRider.next();
							String riderFname = hrArray[2];
							String riderLname = hrArray[3];
							String riderMemberId = hrArray[4];
							String riderStateCode = "";
							if(hrArray[5]!=null)
							{
								riderStateCode = hrArray[5];
							}			
				
				%>
					<input type="text" name="riderMemberId<%=rowCnt%>" id="riderMemberId<%=rowCnt%>" value="<%=riderMemberId%>"  size="5"/> - 
				<input name="riderStateCode<%=rowCnt%>" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="<%=riderStateCode%>" size="2" readonly="readonly" />
				<%}
				}
				else {
			%>
				<input type="text" name="riderMemberId<%=rowCnt%>" id="riderMemberId<%=rowCnt%>" size="5"/> - 
				<input name="riderStateCode<%=rowCnt%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="2" readonly="readonly" />
			<%
				}
				
				}
				
				catch(Exception e)
				{
					System.out.print("exception in JSP :"+e);
				}
				}
			%>
				</td>
			</tr>
			
			<%
			}
			%>
			<tr>
			    <th  colspan="6" class="alignCenter">
				<input type="hidden" name="uploadId" value="<%=uploadId%>"/>
	  <input type="hidden" value="<%=exceptionList.size()%>" name="rSize"/>
	  <input type="submit" value="Validate" name="validate"/>
				</th>
           </tr>
			
			<%
			}
			else{
			%>
		  <tr>
			    <th bgcolor="#E3E1D2" colspan="6" class="alignCenter">No Records Found</th>
           </tr>
		   <%
		   }
		   %>
	  </table></td>
				  </tr>
				</table>
			<!-- CONTENTS END HERE -->		
			</td>
		  </tr>
	  </table>
	  
	</form>
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
