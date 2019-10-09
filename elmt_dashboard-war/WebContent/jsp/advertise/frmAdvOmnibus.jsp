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
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!--/*  Program Name    : frmAdvOmnibus.jsp
 *  Created Date    : September 4, 2006, 4:24 PM
 *  Author          : Punitha.R
 *  Version         : 1.9
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */
--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmAdvertiseOmnibus.js" type="text/javascript" ></script>
<script src="javascripts/cscombo_new.js" type="text/javascript"></script>
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /></head> -->
<script>

var req;

 function makePOSTRequest(url, parameters) {
      req = false;
      if (window.XMLHttpRequest) { // Mozilla, Safari,...
         req = new XMLHttpRequest();         
      } else if (window.ActiveXObject) { // IE
         try {
            req = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e) {
            try {
               req = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }
	  
      if (!req) {
         alert('Cannot create XMLHTTP instance');
         return false;
      }

      req.onreadystatechange = setAmount;
      req.open('POST', url, true);
      req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      req.setRequestHeader("Content-length", parameters.length);
      req.setRequestHeader("Connection", "close");      
	  req.send(parameters);
	  
   }

function getAmountDetails() {
		var selPlanDisp = document.getElementById("selPlanDispId").value;
		//alert(eval(selPlanDisp));
		selPlanDisp
		var mediaId = document.getElementById("mediaIdVal").value;
		
		var poststr = "";
		for(i = 1; i<=eval(selPlanDisp); i++){
			var chkIssueId = "chkIssueId" + i;
			var selWinTypeIdchkIssue = "selWinTypeIdchkIssue" + i;
			var selWinSubTypeIdchkIssue = "selWinSubTypeIdchkIssue" + i;
			var selWinDimchkIssue = "selWinDimchkIssue" + i;
			//var txtWinPlace = "txtWinPlace" + i;
			
			
			poststr	= poststr +  chkIssueId + "=" + encodeURI( document.getElementById(chkIssueId).value ) + "&" +
					selWinTypeIdchkIssue + "=" + encodeURI( document.getElementById(selWinTypeIdchkIssue).value ) + "&" + 
					selWinSubTypeIdchkIssue + "=" + encodeURI( document.getElementById(selWinSubTypeIdchkIssue).value ) + "&" + 
					selWinDimchkIssue + "=" + encodeURI( document.getElementById(selWinDimchkIssue).value ) + "&" ; 
		}
		poststr = "method=advGetAmount&selPlanDisp=" + encodeURI(selPlanDisp) +  "&mediaId=" + encodeURI(mediaId) + "&" + poststr
      	makePOSTRequest("dropDown.do", poststr);
		//alert(poststr);
   }
 
 function setAmount() {
 	//alert('Hi');
      if (req.readyState == 4) {
         if (req.status == 200) {
			var xmlDoc = req.responseXML.documentElement;
			var xRows= xmlDoc.getElementsByTagName('price');
			var nameNodes = xRows[0].firstChild.nodeValue;
			document.getElementById("amount").value = nameNodes;
           
         } else {
            alert('There was a problem with the request.');
         }
      }
   }

  
  
function retrieveURL(methodName,param) {

if(param.value.length>0 && param.value!="") {
 	var paramName = param.name;
  	var url = null;

  if(paramName=='selWinTypechkIssue1'){
    url = "dropDown.do?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }

 if(paramName=='selWinTypechkIssue2'){
     url = "dropDown.do?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }
  
  if(paramName=='selWinTypechkIssue3'){
     url = "dropDown.do?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }
  
  if(paramName=='selWinTypechkIssue4'){
     url = "dropDown.do?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }
  
     
      if (window.XMLHttpRequest) {
           req = new XMLHttpRequest();
       } else if (window.ActiveXObject) {
           req = new ActiveXObject("Microsoft.XMLHTTP");
       }
       if(paramName=='selWinTypechkIssue1'){
            req.onreadystatechange = displaySubTypeChange;
       }
	   
	     if(paramName=='selWinTypechkIssue2'){
            req.onreadystatechange = displaySubTypeChange2;
       }     
	   
	   
	   if(paramName=='selWinTypechkIssue3'){
            req.onreadystatechange = displaySubTypeChange3;
       }     
	   
		if(paramName=='selWinTypechkIssue4'){
            req.onreadystatechange = displaySubTypeChange4;
       }
	   
	 
       req.open("GET", url, true);
       req.send(null);

    } 
	 else {   
	    //setToDefault('selWinSubTypechkIssue1');
		getAmountDetails();
    }
   
  }  
 
  
  function setToDefault(objName){
    var currObj = document.getElementById(objName);
    currObj.innerHTML="";
	var rootObj =  document.createElement("option");
	var attrib = document.createAttribute("value");
    attrib.value="";
	rootObj.setAttributeNode(attrib);
    newtext=document.createTextNode('Select One');
    rootObj.appendChild(newtext);
    currObj.appendChild(rootObj);

  }
  
  
  
  function displaySubTypeChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	    
	    var objDDL = document.getElementById("selWinSubTypechkIssue1");  
		
	    objDDL.innerHTML="";
		// setToDefault('selWinSubTypechkIssue1');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		 getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  
  
  function displaySubTypeChange2() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	   // setToDefault('selWinSubTypechkIssue2');
	    var objDDL = document.getElementById("selWinSubTypechkIssue2");  
	    objDDL.innerHTML="";
		//setToDefault('selWinSubTypechkIssue2');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  
  function displaySubTypeChange3() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	  //  setToDefault('selWinSubTypechkIssue3');
	    var objDDL = document.getElementById("selWinSubTypechkIssue3");  
	    objDDL.innerHTML="";
		//setToDefault('selWinSubTypechkIssue3');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  
  
    function displaySubTypeChange4() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	   // setToDefault('selWinSubTypechkIssue4');
	    var objDDL = document.getElementById("selWinSubTypechkIssue4");  
	    objDDL.innerHTML="";
		//setToDefault('selWinSubTypechkIssue4');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  

</script>
<body onload="initIssue();">
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
			<td width="250" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			
<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
<table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="2" class="tblMainHead">Advertisement Onmibus: <span class="styleBoldTwo">Agency and Contact person information</span></td>
  </tr>
  <tr>
    <td colspan="2" class="tblDescrp">
	    
		<strong>Fill in the following information to place your Advertisements in <span class="styleBoldOne">Omnibus</span> for any events being 
		conducted.</strong><br />
		<br />
 
		<strong>Special Instructions: </strong> Cancellations or changes in orders cannot be accepted after the 
		published closing date. All copy elements are subject to Publisher approval. Advertiser and/or its agency 
		acknowledges receipt of and agrees to the terms and conditions included in the publication's current rates. <br /> 
		<strong>Terms: </strong> Pre-payment is required for all 1x frequency insertions. Advertiser will be invoiced 
		per issue of advertisement thereafter. If invoice is not paid within 30 days of invoice date a 1.5% interest 
		will be charged per month on past due accounts. Ads will be subject to cancellation if invoice is past die 
		60 days. Please see advertising rate sheet and follow the requirements on supplied artwork.
		<br />
	</td>
  </tr>
  <tr>
  	<td>
	<%
		String mediaId = (String)request.getAttribute("mediaId");
		if(mediaId==null){
			response.sendRedirect("advertisement.do?advProcess=show");
		}
	%>

<!-- action="OmnibusInsert.do" -->	
	<form name="frmAdvOmni" id="frmAdvOmni" method="post" onsubmit="return myvalidate();" action="OmnibusInsert.do">
		<input type="hidden" name="advInsert" value="insert">
		<input type="hidden" name="mediaId" id="mediaIdVal" value="<%=mediaId%>" />
			<table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
			 <tr>
				    <td colspan="2" class="tblRowHead">Required fields are mandatory with asterisk* </td>
			</tr>
			<tr>
			<td colspan="2" class="tblRowHead">Ad Agencies and Contact person information:</td>
			</tr>
			
			<tr>
			<td class="tableLeft">Advertiser's Name:</td>
			<td class="tableRight"><input type="text" name="txtAdvName" class="textboxOne" size="25" />
			<span class="asterisk">*</span></td>
		    </tr>
			
			<tr>
			<td class="tableLeft">Ad Agency Name:</td>
			<td class="tableRight"><input type="text" name="txtAgentName" class="textboxOne" size="25" />
            <span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td colspan="2" class="tblRowHead"><strong>Contact Person details:</strong></td>
			</tr>
			
			<tr>
			<td class="tableLeft">First Name:</td>
			<td class="tableRight"><input type="text" name="txtFirstName"class="textboxOne" size="25" />
            <span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td class="tableLeft">Middle Name:</td>
			<td class="tableRight"><input type="text" name="txtMidName"class="textboxOne" size="25" />            </td>
			</tr>
			
			<tr>
			<td class="tableLeft">Last Name:</td>
			<td class="tableRight"><input type="text" name="txtLastName"class="textboxOne" size="25" />
            <span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td class="tableLeft">Street:</td>
			<td class="tableRight"><input type="text" name="txtStreetName"class="textboxOne" size="25" />
            <span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td class="tableLeft">Suite:</td>
			<td class="tableRight"><input type="text" name="txtSuiteName" class="textboxOne" size="25" /></td>
		    </tr>
			
			<tr>
			<td class="tableLeft">Country:</td>
			<td class="tableRight">
			<select name="selConCountry" id="selConCountry" class="selectboxOne" 
			onChange="FillState(document.frmAdvOmni.selConCountry, document.frmAdvOmni.selConState, '');">
			<option selected >Select One</option>
			</select>
            <span class="asterisk">*</span> </td>
		    </tr>
			
			<tr>
			<td class="tableLeft">State:</td>
			<td class="tableRight">
			<select name="selConState"id="selConState" class="selectboxOne">
			</select>
            <span class="asterisk">*</span> </td>
			</tr>
			
			<tr>
			<td class="tableLeft">City:</td>
			<td class="tableRight"><input type="text"  name="txtConCity"class="textboxOne" size="20" />
            <span class="asterisk">*</span></td>
				  </tr>
				  
		    <tr>
			<td class="tableLeft">Zip:</td>
			<td class="tableRight"><input type="text"  name="txtConZip" class="textboxOne" size="25" />
            <span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td class="tableLeft">Phone:</td>
			<td class="tableRight"><input type="text" name="txtConPhone"class="textboxOne" size="25" maxlength="40" />
            <span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td class="tableLeft">Fax:</td>
			<td class="tableRight"><input type="text"  name="txtConFax"class="textboxOne" size="25" />            </td>
			</tr>
			
			<tr>
			<td class="tableLeft">EMail:</td>
			<td class="tableRight"><input type="text"  name="txtConMail"class="textboxOne" size="25" />
            <span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td class="tableLeft">Invoice to:</td>
			<td class="tableRight">
			<input type="radio" name="rdoAdvertising" value="advertiser" />Advertiser 
			<input type="radio" name="rdoAdvertising" value="agency" />Advertising Agency
			<span class="asterisk">*</span></td>
			</tr>
			
			<tr>
			<td class="tableLeft">Have you advertised with us before? </td>
			<td class="tableRight">
			<input type="radio" name="rdoQuest" value="yes" onclick="yesClear();"/>Yes
			<input type="radio" name="rdoQuest" value="no" onclick="noClear();"/>No
			<span class="asterisk">*</span></td></tr>
			
			<tr>
			<td class="tableLeft">If yes, when?</td>
			<td class="tableRight"><input type="text" name="txtYesDate" id="txtYesDate" readonly="true" class="textboxOne" size="15" 
			 />
            <a href="javascript:cal1.popup();"> <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a> <span class="asterisk">*</span>			</td>  
			</tr>
			
			<tr>
			<td class="tblDescrp" colspan=2><strong>Note:</strong> Pre-payment in full is required for all 1x frequency insertions. Advertiser will be involved per issue thereafter.</td>
		    </tr>
				  
			<tr>
			<td class="tableLeft">Frequency Rate:</td>
			<td class="tableRight">
			<select name="selPlanDisp" id="selPlanDispId"  class="selectboxOne" onchange="displayRadios(selPlanDisp);">
				<option selected="selected">Select One</option>
				<%
				int incValue = 0;
				List listFreq = (ArrayList)request.getAttribute("dispFreqDetails");
				if(listFreq!=null && listFreq.size()!=0){
					Iterator elistFreq =listFreq.iterator();
					while(elistFreq.hasNext()){
						String[] strFerq  = (String [])elistFreq.next();
						//String freqlist [] = {frequencyId,frequencyName,mediaId};
						//Debug.print("===============================");
						String freq_id = strFerq[0];
						String freq_Name = strFerq[1];
						incValue++;
						if(incValue==5){
							break;
						}
				%>
				<option  value="<%=freq_id%>"><%=freq_Name%></option>
			<%
					}
				}
			%>
			</select>
			
            <span class="asterisk">*</span></td>
			</tr>
			<%
			for(int i = 1 ; i <incValue; i++) {
			%>
			
			<tr id="<%=i%>" class="hideDiv">
					  <td colspan="2">
						  <table border="0" cellpadding="0" align="center" cellspacing="0" class="tableInner">
						  <tr>
						  <td colspan="2" class="tblMainHead">Frequence <%=i%>X </td>
					  </tr>
					  
					     <tr>
							 <td class="tableLeft">Issue Types:</td>
							 <td class="tableRight"><select name="chkIssue<%=i%>" id="chkIssueId<%=i%>" class="selectboxOne"  >
                               <option selected="selected">Select One</option>
                               <%
							Vector vIssueLst1 = (Vector)request.getAttribute("dispIssueDetails");
							if(vIssueLst1!=null && vIssueLst1.size()!=0){
									Enumeration eIssueLst1 =vIssueLst1.elements();
									while(eIssueLst1.hasMoreElements()){
										String[] sIss = (String [])eIssueLst1.nextElement();
										//Debug.print("===============================");
										String issue_id1=sIss[0];
										String issue_name1=sIss[1];
										String media_id1=sIss[2];
										String issue_status1=sIss[3];
										%>
                               <option value="<%=issue_id1%>"><%=issue_name1%></option>
                               <%}
							}
							%>
                             </select>
						      <span class="asterisk">*</span>					</td>
					 </tr>
					  
						   <tr>
							 <td class="tableLeft">Advertisement Types:</td>
							 <td class="tableRight">
							 <select name="selWinTypechkIssue<%=i%>" id="selWinTypeIdchkIssue<%=i%>" class="selectboxOne"  onchange="retrieveURL('advSubType',this);">
							  <option selected="selected">Select One</option>
                             <%
							Vector vType = (Vector)request.getAttribute("DisplayTypeDetails");
							if(vType!=null && vType.size()!=0){
								Enumeration eDisp = vType.elements();
								String displayTypeId =  "";
								String displayTypeName =  "";
								String mediaIdVal = "";
								while(eDisp.hasMoreElements()){
									String[] s = (String [])eDisp.nextElement();
									displayTypeId = s[0];
									displayTypeName = s[1];
									mediaIdVal  = s[2];
							%>
                               <option value="<%=displayTypeId%>"><%=displayTypeName%></option>

                               <%}
							}
							%>
                             </select>
						     <span class="asterisk">*</span>					</td>
					 </tr>
						   <tr>
							<td class="tableLeft">Advertisement Sub-Types:</td>
							<td class="tableRight">
								<select name="selWinSubTypechkIssue<%=i%>" id="selWinSubTypeIdchkIssue<%=i%>" class="selectboxOne" onchange="getAmountDetails();"  >
								  <option selected="selected" value="">Select One</option>
								  </select>
								  <span class="asterisk">*</span>					</td>
								  </tr>
						     <tr>
							 <td class="tableLeft">Ad Dimension:</td>
							 <td class="tableRight">
							 <select name="selWinDimchkIssue<%=i%>" id="selWinDimchkIssue<%=i%>" class="selectboxOne" >
							 <option selected="selected">Select One</option>
								<%
									Vector vDimLst = (Vector)request.getAttribute("DisplayDimensionDetails");
									if(vDimLst!=null && vDimLst.size()!=0){
										Enumeration eDimLst = vDimLst.elements();
										String dimListId = "";
										String dimListName = "";
										String dimListStatus = "";
									while(eDimLst.hasMoreElements()){
										String[] s = (String [])eDimLst.nextElement();
										dimListId = s[0];
										dimListName = s[1];
								%>
							 
							<option value="<%=dimListId%>"><%=dimListName%></option>
							<%}
							}%>
							</select>
							<span class="asterisk">*</span> </td>
					 	    </tr>
						  
						  <tr>
							<td class="tableLeft">Placement:</td>
							<td class="tableRight"> <input type="text" name="txtWinPlace<%=i%>"   size="25" />							</td>
						    </tr>
						   </table>						   </td>
				  </tr>			
				  
				  <%
				  }
				  %><tr>
					<td colspan="2" class="tblRowHead">&nbsp;Other Information</td>
				  </tr>
					<tr>
						<td class="tableLeft">Advertising Material Coming From:</td>
						<td class="tableRight">
					<input type="text" name="txtMatName"class="textboxOne" size="25" />
						  <span class="asterisk">*</span></td>
				  </tr>
				  <tr>
					<td class="tableLeft">Date:</td>
					<td class="tableRight"><input type="text" name="txtDetDate"  readonly="true" class="textboxOne" size="25" />
					<a href="javascript:cal2.popup();">
					  <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a>
                      <span class="asterisk">*</span></td>
				  </tr>
				  <tr>
					<td class="tableLeft">Ad Supplied on </td>
					<td class="tableRight">
						<input type="radio" name="rdoSupply" value="cd" />CD
					  	<input type="radio" name="rdoSupply" value="email" />Email
					
				    <span class="asterisk">*</span></td>
				  </tr>
				  <tr>
					  <td class="tableLeftTxtArea">Special Instruction: </td>
				    <td class="tableRight"><textarea name="txtAreaIns" class="textAreaOne" rows="5"></textarea></td>
				  </tr>
				   <tr>
					<td colspan="2" class="tblRowHead">&nbsp;Payment Information</td>
				  </tr>
				  <tr>
					  <td class="tableLeft"><strong>Total Amount:</strong></td>
				    <td class="tableRight"> <strong>$</strong>
					 <input type="text"  name="amount" id= "amount" class="textboxOne" size="10" readonly="readonly" />
				      <span class="asterisk">*</span></td>
				  </tr>
				  <tr>
									  	<td class="tableLeft">
									 		<input type="radio" size="10" name="r11" value="check" checked="checked" onclick="switchDiv('chkEnc'), showHideRadio('r11','chrgCrd','check'),cardClear();"/> Check enclosed.				 	</td>
									 	<td class="tableRight">
									 		<input type="radio" size="10" name="r11" value="card" 
onclick="switchDiv('chrgCrd'), showHideRadio('r11','chkEnc','card'),checkClear();"  /> Please charge my card.					</td>
									  </tr>
	  			  		  			  <tr id="chkEnc">
										<td colspan="2">

											<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" class="tableInner">
												<tr>
													<td class="tblMainHead" colspan="3">Check Details:</td>
												</tr>
												<tr>
												  <td class="tableLeft">Check No:</td>
												  <td class="tableRight"><input type="text" name="checkNumber" class="textboxOne" size="16" /> <span class="asterisk">*</span>							  </td>
												</tr>
												<tr>
												  <td class="tableLeft">Check Date:</td>
												  <td class="tableRight"><input type="text" name="checkDate" class="textboxOne" size="16" />

												  <a href="javascript:cal3.popup();">
					                   <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">												  </a>
										  <span class="asterisk">*</span>												  </td>
												</tr>
												<tr>
												  <td class="tableLeft">Bank Name :</td>
												  <td class="tableRight">
												  <input type="text" name="bankName" class="textboxOne" size="16" /> <span class="asterisk">*</span>							  </td>
												</tr>
											</table>					</td>
									  </tr>

									  <tr id="chrgCrd">
										<td colspan="2">

											<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" class="tableInner">
												<tr>
													<td class="tblMainHead" colspan="2">Card Details:</td>
												</tr>
												<tr>
													<td class="tableLeft">Card No.:</td>
												  <td class="tableRight">
												  <input type="text" name="ccNumber" class="textboxOne" size="16" />
					                                  <span class="asterisk">*</span></td>
												</tr>
												<tr>
													<td class="tableLeft">Card CVV No.:</td>
												  <td class="tableRight">
												  <input type="text" name="ccCvvid" class="textboxOne" size="5" />
					                                  <span class="asterisk">*</span></td>
												</tr>
												<tr>
													<td class="tableLeft">Card Type:</td>
												  <td class="tableRight">
														<select name="ccType" id="ccType" class="selectboxOne">
														  <option selected="selected">Select One</option>
														  <option value="Visa">Visa</option>
														  <option value="Master Card">Master Card</option>
														  <option value="AmEx">AmEx</option>
														</select>
					                                    <span class="asterisk">*</span>								</td>
												</tr>
												<tr>
													<td class="tableLeft">Print Name On Card:</td>
												  <td class="tableRight">
												  <input type="text" name="ccName" class="textboxOne" size="25" />
					                                  <span class="asterisk">*</span></td>
												</tr>
												<tr>
													<td class="tableLeft">Expiry Date:</td>
												  <td class="tableRight">
														<select name="ccExpMonth" id="ccExpMonth" class="selectboxOne">
														  <option value="" selected="selected">Month</option>
														  <option value="01">January</option>
														  <option value="02">February</option>
														  <option value="03">March</option>
														  <option value="04">April</option>
														  <option value="05">May</option>
														  <option value="06">June</option>
														  <option value="07">July</option>
														  <option value="08">August</option>
														  <option value="09">September</option>
														  <option value="10">October</option>
														  <option value="11">November</option>
														  <option value="12">December</option>
														</select>
														<select name="ccExpYear" id="ccExpYear" class="selectboxOne">
															  <option value="" selected="selected" >Year</option>
															  <option  value="2006">2006</option>
															  <option  value="2007">2007</option>
															  <option  value="2008">2008</option>
															  <option  value="2009">2009</option>
															  <option  value="2010">2010</option>
															  <option  value="2011">2011</option>
															  <option  value="2012">2012</option>
															  <option  value="2013">2013</option>
															  <option  value="2014">2014</option>
															  <option  value="2015">2015</option>
														</select>
					                                    <span class="asterisk">*</span>			         </td>
								      </tr>
								 </table>								</td>
		<tr>
		<td class="tableLeft">&nbsp;</td>
		<td class="tableRight">
		<input type="hidden" name="finalValue" value="" />
		<input  name="subsub" type="submit" value="Place Advertisement" class="gradBtn" /></td>
		</tr>
		</table>
	</form>
	</td>
  </tr>
  
  <tr>
    <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
  </tr>
</table>

<script language="javascript">
	FillCountry(document.frmAdvOmni.selConCountry, document.frmAdvOmni.selConState, '---Select---');
	FillState(document.frmAdvOmni.selConCountry, document.frmAdvOmni.selConState, '');
</script>
<script language="javascript">
	var cal1 = new calendar2(document.forms['frmAdvOmni'].elements['txtYesDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;

	var cal2 = new calendar2(document.forms['frmAdvOmni'].elements['txtDetDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;

	var cal3 = new calendar2(document.forms['frmAdvOmni'].elements['checkDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;

</script>

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