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
<%@ page import="java.util.*" %>
<%@ page import="com.breed.DAO.*"%>
<%@ page import="com.color.DAO.*"%>
<%@ page import="com.hlcmrm.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.hlccommon.util.HLCHorseRegisterationVO"%>
<%@ page import="com.hlchorse.form.util.*" %>
<%@ page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/frmHorseTrainerDet.js" type="text/javascript"></script>
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmHorseNotRegistered.js" type="text/javascript" ></script>
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script src="javascripts/cscombo_new.js" type="text/javascript"></script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
<script language="javascript">
function clearOwnerDetailsForNo(){
	document.getElementById('adoId').value="no";
	document.getElementById('ownerUseaNo2_id1').value="";
	document.getElementById('ownerFname2_id1').value="";
	document.getElementById('ownerLname2_id1').value="";
	document.getElementById('ownerPhone2_id1').value="";
	document.getElementById('userNameId2').value="";
	document.getElementById('firstNameId2').value="";
	document.getElementById('lastNameId2').value="";
	document.getElementById('phoneId2').value="";
	document.getElementById('userNameId3').value="";
	document.getElementById('firstNameId3').value="";
	document.getElementById('lastNameId3').value="";
	document.getElementById('phoneId3').value="";
	document.getElementById('existAddCompNameId1').value="";
	document.getElementById('cpAddfirstNameId1').value="";
	document.getElementById('cpAddlastNameId1').value="";
	document.getElementById('ecmpAddPhoneId1').value="";
	document.getElementById('newAddFirstNameIdComp').value="";
	document.getElementById('newAddAddressIdComp').value="";
	document.getElementById('newAddCountryIdComp').value="";
	document.getElementById('newAddStateIdComp').value="";
	document.getElementById('newAddCityIdComp').value="";
	document.getElementById('newAddZipIdComp').value="";
	document.getElementById('newAddEmailIdComp').value="";
	document.getElementById('newAddPhoneIdComp').value="";
	document.getElementById('newAddFaxIdComp').value="";
	document.getElementById('cpAddFirstNameIdComp').value="";
	document.getElementById('cpAddLastNameIdComp').value="";
}
function forLoad(){
	document.getElementById('adoId').value="no";
}
function forValue(){
	document.getElementById('adoId').value="yes";
}
function detailsAlert(){
	var message = "Selected Owner Details will be added as your Trainer Details.";
	chosen="";
	var ado = document.getElementById('adoId').value;
	if(ado=="yes"){
		len=document.myform.regAddFor.length;
		for(i=0;i<len;i++){
			if(document.myform.regAddFor[i].checked){
				chosen= document.myform.regAddFor[i].value;
			}
		}
		if(chosen==""){
			alert("Select any Owner Information Option First");
			var leng = document.myform.regFor.length;
			for(var k=0; k<leng; k++){
				document.myform.regFor[k].checked = false;
			}
			return false;
		}
	}
	alert(message);
	return true;
}

function comRegClear(){
	document.getElementById("existCompNameIdT1").value = "";
	document.myform.cpfirstNameIdT1.value="";
	document.myform.cplastNameIdT1.value="";
	document.myform.ecmpPhoneIdT1.value="";
}
function rCheck(){
 	var a = document.myform.hlcNo.value;
      if(a!="" && a.indexOf(' ')!=0){
 		  riderDetails();
      }
     else{
	   	  clearRider();
     }
}
var arHttpRequest;
var req;
     function riderDetails(){
		 param = document.myform.hlcNo.value;
			var  url = null;
			if(param.length==0)
			return;
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			req.onreadystatechange = processRider;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function processRider(){ 
    			if (req.readyState == 4){ 
						   // alert(req.status);
							if(req.status == 200){ 
							//  alert(req.status);
								 var xmlDoc = req.responseXML.documentElement;
								  
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									var userId =xmlDoc.getElementsByTagName('userId')[0].childNodes[0].nodeValue; 
 									var prefix =xmlDoc.getElementsByTagName('prefix')[0].childNodes[0].nodeValue; 
									var emailId =xmlDoc.getElementsByTagName('emailId')[0].childNodes[0].nodeValue; 
									var address1 =xmlDoc.getElementsByTagName('address1')[0].childNodes[0].nodeValue; 
 									var city =xmlDoc.getElementsByTagName('city')[0].childNodes[0].nodeValue; 
									var state =xmlDoc.getElementsByTagName('state')[0].childNodes[0].nodeValue; 
									var country =xmlDoc.getElementsByTagName('country')[0].childNodes[0].nodeValue; 
									var zip =xmlDoc.getElementsByTagName('zip')[0].childNodes[0].nodeValue; 
									var mobile =xmlDoc.getElementsByTagName('mobile')[0].childNodes[0].nodeValue; 
									
								 
									var firstNameObj = document.getElementById("riderFname_id");
								    var lastNameObj = document.getElementById("riderLname_id");
									var phoneObj = document.getElementById("riderPhone_id"); 
							      
									 var prefixObj = document.getElementById("rprefix");  
									var emailIdObj = document.getElementById("rEmail");  
									var address1Obj = document.getElementById("rStreet");  
								   
									var cityObj = document.getElementById("rCity");  
									var stateObj = document.getElementById("rState");  
									 
									var zipObj = document.getElementById("rZipcode");  
									var mobileObj = document.getElementById("rCell");  
								 
									firstNameObj.value =  firstName;






									lastNameObj.value = lastName ;
									phoneObj.value = phone ; 
									prefixObj.value =  prefix;  
									emailIdObj.value = emailId ;  
									address1Obj.value =  address1;  
									cityObj.value = city ;  
									stateObj.value = state ;  
									zipObj.value = zip ;  
									mobileObj.value = mobile ;  
									
									
							} 
											if(req.status==500) {
												clearRider();
												alert("Membership Id is not valid");
												document.myform.riderUseaNo_id.focus();
											}
											else{ 
												
											} 
						}	
						
					} 
function clearRider(){
		document.getElementById("riderUseaNo_id").value = "";
		document.getElementById("riderFname_id").value = "";
		document.getElementById("riderLname_id").value = "";
		document.getElementById("riderPhone_id").value = "";
		document.getElementById("rprefix").value = "";
		document.getElementById("rEmail").value = ""; 
		document.getElementById("rStreet").value = "";
		document.getElementById("rCity").value = "";
		document.getElementById("rState").value = ""; 
		document.getElementById("rZipcode").value = "";  
		document.getElementById("rCell").value = ""; 
}
 
var arHttpRequest;
var req;
     function userDetails(param){
	       
			var  url = null;
			if(param.value.length==0)
			return;
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			
			req.onreadystatechange = processRequest1;         
			req.open("GET", url, true);
			req.send(null);  
			//}
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function processRequest1(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
							 
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									var userId =xmlDoc.getElementsByTagName('userId')[0].childNodes[0].nodeValue; 
									var dob =xmlDoc.getElementsByTagName('dob')[0].childNodes[0].nodeValue; 
									var age =xmlDoc.getElementsByTagName('age')[0].childNodes[0].nodeValue; 
								 
									var firstNameObj = document.getElementById("ownerFname2_id1");
								    var lastNameObj = document.getElementById("ownerLname2_id1");
									var phoneObj = document.getElementById("ownerPhone2_id1"); 
							        var userObj = document.getElementById("addUserDetId"); 
								 
									
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
										 if(phone=="null"){
										 phone = "xxxx";
										 }
									 


										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
										userObj.value=userId;
									
									
							} 
											if(req.status==500) {
											  alert("MembershipId does'nt exists");
											  clearFields();
											  document.myform.ownerUseaNo2_id.focus();
											  return;
											}
											else{ 
												
											} 
						}	
						
					} 
		 
 function clearFields() {
		document.getElementById("ownerUseaNo2_id1").value = "";
		document.getElementById("ownerFname2_id1").value = "";
		document.getElementById("ownerLname2_id1").value = "";
 		document.getElementById("ownerPhone2_id1").value = "";
		document.getElementById("addUserDetId").value = "";
		 
 }
var arHttpRequest;
var req;
     function userTDetails(param){
	       
			var  url = null;
			if(param.value.length==0)
			return;
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			
			req.onreadystatechange = processTRequest1;         
			req.open("GET", url, true);
			req.send(null);  
			//}
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function processTRequest1(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
							 
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									var userId =xmlDoc.getElementsByTagName('userId')[0].childNodes[0].nodeValue; 
									var dob =xmlDoc.getElementsByTagName('dob')[0].childNodes[0].nodeValue; 
									var age =xmlDoc.getElementsByTagName('age')[0].childNodes[0].nodeValue; 
								 
									var firstNameObj = document.getElementById("firstNameId1");
								    var lastNameObj = document.getElementById("lastNameId1");
									var phoneObj = document.getElementById("phoneId1"); 
							        var userObj = document.getElementById("userDetId"); 
								 
									
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
										 if(phone=="null"){
										 phone = "xxxx";
										 }
									 


										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
										userObj.value=userId;
									
									
							} 
											if(req.status==500) {
											  alert("MembershipId does'nt exists");
											  clearTFields();
											  document.myform.userNameId.focus();
											  return;
											}
											else{ 
												
											} 
						}	
						
					} 
		 
 function clearTFields() {
		document.getElementById("ownerUseaNo2_id1").value = "";
		document.getElementById("ownerFname2_id1").value = "";
		document.getElementById("ownerLname2_id1").value = "";
 		document.getElementById("ownerPhone2_id1").value = "";
		document.getElementById("userDetId").value = "";
		 
 } 
 function nonUserTDetails(param){
	  //alert('hi');
					//alert(param.value);
						if(param.value.length==0)
						return;
							var  url = null;
							url = "annualAjax.do?method=memDetails&nonmemberId="+escape(param.value);
						 

							if (window.ActiveXObject){ 
								req = new ActiveXObject("Microsoft.XMLHTTP"); 
							} 
							else if (window.XMLHttpRequest){ 
								req = new XMLHttpRequest(); 
							} 
						
							req.onreadystatechange = processTRequest33;         
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processTRequest33(){ 
						if (req.readyState == 4){ 
						   //alert(req.readyState);
							if(req.status == 200){ 
									//clearDetails();
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
									//var usrdob =xmlDoc.getElementsByTagName('userdob')[0].childNodes[0].nodeValue;
									//var usrage =xmlDoc.getElementsByTagName('userage')[0].childNodes[0].nodeValue; 

									var fNameObj = document.getElementById("firstNameIdT1");
									var lNameObj = document.getElementById("lastNameIdT1");
									var phObj = document.getElementById("phoneIdT1");  
									var usObj = document.getElementById("userDetId");  
									//var userDobObj = document.getElementById("dobId");
									//var userageObj = document.getElementById("ageId");
									 
									
									fNameObj.value= fName;
									lNameObj.value=lName;
									usObj.value=usId;
									//userDobObj.value=usrdob;
									//userageObj.value=usrage;
									//alert(firstNameObj.value);
									//alert(lastNameObj.value);
									
									
									//document.AnnualRegForm.newBadge.value=fName+" "+lName;
									
									if(ph=="null"){
									 	ph = "xxxx";
									 }
									 
										var phLen = ph.length;
										var minPhLen = phLen - 4;
										phObj.value=ph.substring(minPhLen,phLen);
									//showAge();
							} 
							if(req.status==500) {
							  alert("userName does'nt exists");
							  Tclear();
							  document.myform.userNameId3.focus();
							  return;
							}
							else{ 
								//alert("Error loading page\n"+ req.status +":"+ req.statusText); 
							} 
							  
						}	
					} 
function Tclear() {
	document.getElementById('userNameIdT1').value="";
	document.getElementById("firstNameIdT1").value = "";
	document.getElementById("lastNameIdT1").value = "";
	document.getElementById("phoneIdT1").value = "";
	document.getElementById("userDetId").value = "";
}
 function nonUserDetails(param){
	  //alert('hi');
					//alert(param.value);
						if(param.value.length==0)
						return;
							var  url = null;
							url = "annualAjax.do?method=memDetails&nonmemberId="+escape(param.value);
						 

							if (window.ActiveXObject){ 
								req = new ActiveXObject("Microsoft.XMLHTTP"); 
							} 
							else if (window.XMLHttpRequest){ 
								req = new XMLHttpRequest(); 
							} 
						
							req.onreadystatechange = processRequest33;         
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processRequest33(){ 
						if (req.readyState == 4){ 
						   //alert(req.readyState);
							if(req.status == 200){ 
									//clearDetails();
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
									//var usrdob =xmlDoc.getElementsByTagName('userdob')[0].childNodes[0].nodeValue;
									//var usrage =xmlDoc.getElementsByTagName('userage')[0].childNodes[0].nodeValue; 

									var fNameObj = document.getElementById("firstNameId3");
									var lNameObj = document.getElementById("lastNameId3");
									var phObj = document.getElementById("phoneId3");  
									var usObj = document.getElementById("addUserDetId");  
									
									fNameObj.value= fName;
									lNameObj.value=lName;
									usObj.value=usId;
									
									if(ph=="null"){
									 	ph = "xxxx";
									 }
									 
										var phLen = ph.length;
										var minPhLen = phLen - 4;
										phObj.value=ph.substring(minPhLen,phLen);
									//showAge();
							} 
							if(req.status==500) {
							  alert("userName does'nt exists");
							  clear();
							  document.myform.userNameId3.focus();
							  return;
							}
							else{ 
								//alert("Error loading page\n"+ req.status +":"+ req.statusText); 
							} 
							  
						}	
					} 
function clear() {
	document.getElementById("userNameId3").value = "";
	document.getElementById("firstNameId3").value = "";
	document.getElementById("lastNameId3").value = "";
	document.getElementById("phoneId3").value = "";
	document.getElementById("addUserDetId").value = "";

}								
   
function userDetails1(param){
			var  url = null;
			if(param.value.length==0)
			return;
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			

			req.onreadystatechange = processRequest11;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function processRequest11(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
							 
								 var xmlDoc = req.responseXML.documentElement;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 

									var userId =xmlDoc.getElementsByTagName('userId')[0].childNodes[0].nodeValue; 
									 
								 
									var firstNameObj = document.getElementById("firstNameId2");
								    var lastNameObj = document.getElementById("lastNameId2");
									var phoneObj = document.getElementById("phoneId2"); 

							        var userObj = document.getElementById("userDetId"); 
								 
									
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
										 if(phone=="null"){
										 phone = "xxxx";
										 }
									 
										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
										userObj.value=userId;
								 
									
							} 
											if(req.status==500) {
											  alert("MembershipId does'nt exists");
											  clearFields2();
											  document.myform.userNameId2.focus();
											  return;
											}
											else{ 
												
											} 
						}	
						
					} 
		 
 function clearFields2() {
		document.getElementById("userNameId2").value = "";
		document.getElementById("firstNameId2").value = "";
		document.getElementById("lastNameId2").value = "";
 		document.getElementById("phoneId2").value = "";
		document.getElementById("addUserDetId").value = "";
		 
 }
 	
     function nonUserDetails1(param){
	
						if(param.value.length==0)
						return;
							var  url = null;
							url = "annualAjax.do?method=memDetails&nonmemberId="+escape(param.value);
						 

							if (window.ActiveXObject){ 
								req = new ActiveXObject("Microsoft.XMLHTTP"); 
							} 
							else if (window.XMLHttpRequest){ 
								req = new XMLHttpRequest(); 
							} 
						
							req.onreadystatechange = processRequest22;         
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processRequest22(){ 
						if (req.readyState == 4){ 
							if(req.status == 200){ 
									//clearDetails();
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
								
									var fNameObj = document.getElementById("cpAddfirstNameId1");
									var lNameObj = document.getElementById("cpAddlastNameId1");
									var phObj = document.getElementById("ecmpAddPhoneId1");  
									var usObj = document.getElementById("addUserDetId");  
								
									fNameObj.value= fName;
									lNameObj.value=lName;
									usObj.value=usId;
									if(ph=="null"){
									 	ph = "xxxx";
									 }
									 
										var phLen = ph.length;
										var minPhLen = phLen - 4;
										phObj.value=ph.substring(minPhLen,phLen);
							} 
							if(req.status==500) {
							  alert("Company Name does'nt exists");
							  clear2();
							  document.myform.existAddCompNameId1.focus();
							  return;
							}
							else{ 
								//alert("Error loading page\n"+ req.status +":"+ req.statusText); 
							} 
							  
						}	
					} 


		          function clear2() {
						document.getElementById("existAddCompNameId1").value = "";
						document.getElementById("cpAddfirstNameId1").value = "";
						document.getElementById("cpAddlastNameId1").value = "";
						document.getElementById("ecmpAddPhoneId1").value = "";
						document.getElementById("addUserDetId").value = "";
					}					
     function nonUserTDetails1(param){
	
						if(param.value.length==0)
						return;
							var  url = null;
							url = "annualAjax.do?method=memDetails&nonmemberId="+escape(param.value);
						 

							if (window.ActiveXObject){ 
								req = new ActiveXObject("Microsoft.XMLHTTP"); 
							} 
							else if (window.XMLHttpRequest){ 
								req = new XMLHttpRequest(); 
							} 
						
							req.onreadystatechange = processTRequest22;         
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processTRequest22(){ 
						if (req.readyState == 4){ 
							if(req.status == 200){ 
									//clearDetails();
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
								
									var fNameObj = document.getElementById("cpfirstNameIdT1");
									var lNameObj = document.getElementById("cplastNameIdT1");
									var phObj = document.getElementById("ecmpPhoneIdT1");  
									var usObj = document.getElementById("userDetId");  
								
									fNameObj.value= fName;
									lNameObj.value=lName;
									usObj.value=usId;
									if(ph=="null"){
									 	ph = "xxxx";
									 }
									 
										var phLen = ph.length;
										var minPhLen = phLen - 4;
										phObj.value=ph.substring(minPhLen,phLen);
							} 
							if(req.status==500) {
							  alert("Company Name does'nt exists");
							  clearT2();
							  document.myform.existCompNameIdT1.focus();
							  return;
							}
							else{ 
								//alert("Error loading page\n"+ req.status +":"+ req.statusText); 
							} 
							  
						}	
					} 
	function clearT2() {
		document.getElementById("existCompNameIdT1").value = "";
		document.getElementById("cpAddfirstNameIdT1").value = "";
		document.getElementById("cpAddlastNameIdT1").value = "";
		document.getElementById("ecmpAddPhoneIdT1").value = "";
		document.getElementById("userDetId").value = "";
	}						
</script>
<style type="text/css">
<!--
.style1 {color: #990000}
-->
</style>
</head>

<body onload="forLoad();">
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
			<td width="260" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
			<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
					 	<div class="cmmnForm">
						<div class="colspan">
							<strong>Membership:</strong> <span class="styleBoldTwo">Edit Horse Registration Details </span>						</div>
							
							<div id="commonBG" class="textCommon" ><span class="asterisk"> IMPORTANT </span> --The only accepts payment by credit card for services purchased online. If you prefer to pay by check, please complete the appropriate <a href="http://useventing.com/start.php?section=docs" target="_blank">form</a> and mail with your check to the office.
				  </div>
<form name="myform" id="myform" method="post" action="horseRegEdit.do" onsubmit="return myValidate();" >
						<input type="hidden" name="addOwnerUserId" id="addUserDetId" /> 
						<input type="hidden" name="process" value="horseReg">
						<input type="hidden" name="userDetId" id="userDetId" />
<input type="hidden" value="<bean:message key='FEH.minage'/>" name="FEHMin"/>
<input type="hidden" value="<bean:message key='FEH.maxage'/>" name="FEHMax"/>
<input type="hidden" value="<bean:message key='YEH.minage'/>" name="YEHMin"/>
<input type="hidden" value="<bean:message key='YEH.maxage'/>" name="YEHMax"/>						
						<div class="rowExpand" onclick="expandColl('parta');">Horse Registration Details:</div>
<%
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
 	HLCHorseRegisterationVO HorseDisp =(HLCHorseRegisterationVO) request.getAttribute("ListVO");
	if(HorseDisp==null)	out.print("HorseDisp is null");	
	System.out.print(HorseDisp.getPrevRiderMemberId());
	String horseMemberId = (String) HorseDisp.getHorseMemberId();
    String competitionName = (String) HorseDisp.getCompetitionName();
    String registeredName = (String) HorseDisp.getRegisteredName();
    String baRegisteredName = (String)HorseDisp.getBaRegisteredName();
    String baPastName = (String)HorseDisp.getBaPastName();
    String riderMemberId = (String)HorseDisp.getRiderMemberId();
    String prevRiderMemberId = (String)HorseDisp.getPrevRiderMemberId();
    String addRiderMemberId = (String)HorseDisp.getAddRiderMemberId();
    String ownerId = (String)HorseDisp.getOwnerId();
    String prevOwnerId = (String)HorseDisp.getPrevOwnerId();
    String addOwnerId = (String)HorseDisp.getAddOwnerId();
    String prevOwnerName = (String)HorseDisp.getPrevOwnerName();
    String addOwnerName = (String)HorseDisp.getAddOwnerName();
	String paymentId = (String)HorseDisp.getPaymentId();
	 String requestStatus = (String)HorseDisp.getRequestStatus();
    String firstName = (String)HorseDisp.getFirstName();
    String lastName = (String)HorseDisp.getLastName();
    String comments = (String)HorseDisp.getComments();
    String color = (String)HorseDisp.getColor();
    String gender = (String)HorseDisp.getGender();
    String height = (String)HorseDisp.getHeight();
    String yearFoaled = (String)HorseDisp.getYearFoaled();
    //String breed = (String)HorseDisp.getBreed();
    String country1 = (String)HorseDisp.getCountry();
    String sire = (String)HorseDisp.getSire();
	String sireBreed = (String)HorseDisp.getSireBreed();
    String dam = (String)HorseDisp.getDam();
    String damBreed = (String)HorseDisp.getDamBreed();
   // String breed2 = (String)HorseDisp.getBreed2();
    String sireBreed2 = (String)HorseDisp.getSireBreed2();
    String damBreed2 = (String)HorseDisp.getDamBreed2();
    String importedFrom = (String)HorseDisp.getImportedFrom();
//    String importDate = sdf.format(HorseDisp.getImportDate();
    Date checkDate = HorseDisp.getCheckDate();

	String chk_dte = "";	
	if(checkDate!=null){
		chk_dte = sdf.format(HorseDisp.getCheckDate());	
	}
//	String checkDate = sdf.format(HorseDisp.getCheckDate());
    Date importDate = HorseDisp.getImportDate();
	String imp_dte = "";
	if(importDate!=null){
		imp_dte = sdf.format(HorseDisp.getImportDate());
	}
 
  
    String checkNumber = (String)HorseDisp.getCheckNumber();
 
    String paymentStatus = (String)HorseDisp.getPaymentStatus();
    String checkName = (String)HorseDisp.getCheckName();
    String sslTxnId = (String)HorseDisp.getSslTxnId();
    String bankName = (String)HorseDisp.getBankName();
  
    String amount = (String)HorseDisp.getAmount();
	String regstrBy = (String)HorseDisp.getRegisteredBy();
	String membertype= (String)HorseDisp.getMemberTypeName();
	String statusName = (String)HorseDisp.getStatusName();
	String membAmount = (String)HorseDisp.getMembershipAmount();

	if(horseMemberId ==null)
	horseMemberId  = "";
	if(competitionName  ==null)
	competitionName   = "";
	if(registeredName  ==null)
	registeredName   = "";
	if(horseMemberId ==null)
	horseMemberId  = "";			
	if(baRegisteredName  ==null)
	baRegisteredName   = "";									
	if(baPastName  ==null)
	baPastName   = "";
	if(riderMemberId  ==null)
	riderMemberId   = "";
	if(prevRiderMemberId  ==null)
	prevRiderMemberId   = "";												
	if(addRiderMemberId  ==null)
	addRiderMemberId   = "";
	if(ownerId  ==null)
	ownerId   = "- N.A -";
	if(prevOwnerId  ==null)
	prevOwnerId   = "- N.A -";												
	if(addOwnerId  ==null)
	addOwnerId   = "- N.A -";
	if(prevOwnerName  ==null)
	prevOwnerName   = "- N.A -";
	if(addOwnerName  ==null)
	addOwnerName   = "- N.A -";												
	if(paymentId  ==null)
	paymentId   = "- N.A -";
	if(requestStatus  ==null)
	requestStatus   = "- N.A -";
	if(firstName  ==null)
	firstName   = "- N.A -";
	if(lastName  ==null)
	lastName   = "- N.A -";			
	if(comments  ==null)
	comments   = "- N.A -";									
	if(color  ==null)
	color   = "";
	if(gender  ==null)
	gender   = "";
	if(height  ==null)
	height   = "";												
	if(yearFoaled  ==null)
	yearFoaled   = "";
	if(country1  ==null)
	country1   = "";												
	if(sire  ==null)
	sire   = "";
	if(dam  ==null)
	dam   = "";												
	if(importedFrom   ==null)
	importedFrom    = "";									
	 
	if(regstrBy   ==null)
	regstrBy    = "";
	if(membertype  ==null)
	membertype   = "";
%>						
							 
							 <div class="row">
							<span class="label">Horse MemberId:</span>
							<span class="formX">
							<input type="text" readonly="true" class="readOnly" name="horseMemberId" id="horseMemberId"  value="<%=horseMemberId%>" size="20" />
							</span>	
							</div>
							 
							<div class="row">
							<span class="label">Existing Horse Registration Type:</span>
							<span class="formX">
							<input type="text" readonly="true" class="readOnly" name="membertype" id="membertype"  value="<%=membertype%>" onblur="rCheck();" size="20" />
							</span>						</div>
						 <div class="row">
                            
                             
                <input type="hidden" name="membAmount" value="<%=membAmount%>" id="membAmount" />            
				<span class="label">Horse Registration Type:</span>
				<span class="formX">
				<select name="feeDisp" id="horseSelect" class="selectboxOne" onChange="Dispall();" >
				  <option selected="selected" value="" >Select One</option>  
                                            
                     <% 
					Vector horsememberVect=new Vector();
					horsememberVect=(Vector)request.getAttribute("horsememberVect");
					Enumeration itrators= (Enumeration)horsememberVect.elements();
					int siz=horsememberVect.size();

                     if(siz!=0)
                     {
                     while(itrators.hasMoreElements()){
                                
                                String[] sarray = (String[]) itrators.nextElement();
                                
                                String memberTypeId = sarray[0];
                                String membershipName = sarray[1];
                                String membershipAmount = sarray[2];
                                String cnct=memberTypeId+"#"+membershipName+"#"+membershipAmount;
                        %>
                                    
				   <option  value="<%=cnct%>"><%=membershipName%></option>
			<%}}%>	  <!-- end loop  -->
				</select>
			    <span class="asterisk">*</span> </span>			</div>
			<div class="row">
				<span class="label">Registration Amount:</span>
				<span class="formX">
					<strong>$</strong>&nbsp;
					 
					<input id="fee_txt" class="readOnly" type="text" name="fee_txt" size="10" readonly="true" value=""/>
				</span>			</div>
				
						<div class="rowHead">Horse Information Section:</div>
						
						<div class="row">
							<span class="label">Horse Name: </span>
							<span class="formX">
							 <input type="text" class="textboxOne" name="competitionName" id="competitionName1"  value="<%=competitionName%>"  size="25" />
						  </span>						</div>
						<div class="row">
							<span class="label">Registered By:</span>
							<span class="formX">
							<input type="text"  class="textboxOne" name="regstrBy" id="regstrBy"  value="<%=regstrBy%>"  size="20" />
							</span>						</div>								
								<%
								String regname="";
								if(HorseDisp.getRegisteredName()!=null && HorseDisp.getRegisteredName().trim().length()!=0){
								regname = HorseDisp.getRegisteredName();
								}
								else{
								regname ="";
								}
								%>
								<div class="row">
									<span class="label">Registered Name:</span>
									<span class="formX"><input type="text" class="textboxOne"  name="registeredName" id="registeredName1"  value="<%=registeredName%>"  size="20" /></span>								</div>
								<%
								String pastname="";
								if(HorseDisp.getBaPastName()!=null && HorseDisp.getBaPastName().trim().length()!=0){
								pastname = HorseDisp.getBaPastName();
								}
								else{
								pastname ="";
								}							
								%>
								<div class="row">
									<span class="label">Past Name:</span>
									<span class="formX"><input type="text"  class="textboxOne" name="baPastName" id="baPastName1"  value="<%=baPastName%>"  size="20" /></span>								</div>
								<%
								String breename="";
								if(HorseDisp.getBaRegisteredName()!=null && HorseDisp.getBaRegisteredName().trim().length()!=0){
								breename = HorseDisp.getBaRegisteredName();
								}
								else{
								breename ="";
								}								
								%>
								<div class="row">
									<span class="label">Breed Assoc. Horse is registered with:</span>
									<span class="formX"><input type="text"  class="textboxOne" name="breename" id="breename1"  value="<%=breename%>" onblur="rCheck();" size="20" /></span>								</div>
								

<%
//Rider Information Details	
ArrayList riderInfoDetails = (ArrayList) request.getAttribute("riderInfoDetails");
	String rid_prefix1="";
	String rid_first_name = "";
	String rid_middle_name = "";
	String rid_last_name = "";
	String rid_sufix = "";
	String rid_email_id = "";
	String rid_suite = "";
	String rid_address1 = "";
	String rid_address2 = "";
	String rid_city = "";
	String rid_state = "";
	String rid_country = "";
	String rid_zip = "";
	String rid_phone_no = "";
	String rid_mobile_no = "";
	String rid_fax_no = "";
		if(riderInfoDetails !=null && riderInfoDetails.size()!=0){
			Iterator it = riderInfoDetails.iterator();
			while(it.hasNext()){			
				rid_prefix1 = (String)it.next();
				if(rid_prefix1==null)
				rid_prefix1 = "-N.A-";
				rid_first_name  = (String)it.next();
				if(rid_first_name==null)
				rid_first_name = "-N.A-";
				rid_middle_name  = (String)it.next();
				if(rid_middle_name==null)
				rid_middle_name = "-N.A-";
				rid_last_name = (String)it.next();
				if(rid_last_name==null)
				rid_last_name = "-N.A-";
				rid_sufix =  (String)it.next();
				if(rid_sufix==null)
				rid_sufix = "-N.A-";
				rid_email_id  = (String)it.next();
				if(rid_email_id==null)
				rid_email_id = "-N.A-";
				rid_suite =  (String)it.next();
				if(rid_suite==null)
				rid_suite = "-N.A-";
				rid_address1 =  (String)it.next();
				if(rid_address1==null)
				rid_address1 = "-N.A-";
				rid_address2 = (String)it.next();
				if(rid_address2==null)
				rid_address2 = "-N.A-";
				rid_city = (String)it.next();
				if(rid_city==null)
				rid_city = "-N.A-";
				rid_state =  (String)it.next();
				if(rid_state==null)
				rid_state = "-N.A-";
				rid_country = (String)it.next();
				if(rid_country==null)
				rid_country = "-N.A-";
				rid_zip = (String)it.next();
				if(rid_zip==null)
				rid_zip = "-N.A-";
				rid_phone_no = (String)it.next();
				if(rid_phone_no==null)
				rid_phone_no = "-N.A-";

				rid_mobile_no = (String)it.next();
				if(rid_mobile_no==null)
				rid_mobile_no = "-N.A-";
				rid_fax_no = (String)it.next();
				if(rid_fax_no==null)
				rid_fax_no = "-N.A-";
				}
			}						
%>	
					<div class="rowHead">
				<strong>Rider Information Section:</strong>			</div>
			<div class="row">
				<span class="label">No.:</span>
				<span class="formX">
				 <input type="text" class="textboxOne" name="hlcNo" id="riderUseaNo_id"  value="<%=riderMemberId%>" onblur="rCheck();" size="20" />
				 <span class="asterisk">*</span>				 </span></div>
	 
								 
								 
			<div class="row">
				<span class="label">Salutation:</span>
				<span class="formX">
				<input type="text" name="rprefix" id="rprefix" readonly="true" class="readOnly" size="10" value="<%=rid_prefix1%>" />
				</span>			</div>
			<div class="row">
				<span class="label">First Name:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true"  name="rName" id="riderFname_id" size="20" value="<%=rid_first_name%>" /></span>			</div>
				<div class="row">
				<span class="label">Last Name:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true"  name="lName" id="riderLname_id" size="20" value="<%=rid_last_name%>"/></span>			</div>
			<div class="row">
				<span class="label">Street:</span>
				<span class="formX"><input type="text"  class="readOnly"  readonly="true" id="rStreet" name="rStreet" size="20" value="<%=rid_address2%>" /></span>			</div>
			<div class="row">
				<span class="label">City:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true" id="rCity" name="rCity" size="15" value="<%=rid_city%>" /></span>			</div>
			<div class="row">
				<span class="label">State:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true" id="rState" name="rState" size="20" value="<%=rid_state%>" /></span>			</div>
			<div class="row">
				<span class="label">Zipcode:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true" id="rZipcode" name="rZipcode" size="8"  value="<%=rid_zip%>"/></span>			</div>
				<div class="row">
				<span class="label">Phone:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true" name="rPhone" id="riderPhone_id" size="15" value="<%=rid_phone_no%>" /></span>			</div>
			<div class="row">
				<span class="label">Cell:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true" id="rCell" name="rCell" size="15"  value="<%=rid_mobile_no %>"/></span>			</div>
			<div class="row">
				<span class="label">Email:</span>
				<span class="formX"><input type="text" class="readOnly" readonly="true" id="rEmail" name="rEmail" size="20" value="<%=rid_email_id%>" /></span>			</div>
			 
 	 
			  
	 		  
									 
	 
	
	
	
	<div class="rowHead">
				<strong>Requested  Owner Information Section:</strong>			</div>
			<div class="row">
				<span class="label">Do you want to edit the owner?</span>
				<span class="formX">
				   <input type="radio" size="10" name="ado" id="adoId" value="yes" onclick="switchDiv('addOwn');showHideRadio('ado','existOwn','no'); forValue();" /> 
			    Yes
					<input type="radio" size="10" name="ado" id="adoId" value="no" checked="checked" onClick="switchDiv('existOwn');showHideRadio('ado','addOwn','no'), showHideRadio('ado','companyAddUser','no'), showHideRadio('ado','existAddComp','no'), showHideRadio('ado','compAddQuest','no'); comRadio(); comRadioClear1(); clearOwnerDetailsForNo();" > No				</span>			</div>
			 
			<div id="addOwn">
				<table width="100%" cellpadding="0" cellspacing="1" border="0">
					<tr>
							<td class="tableLeftTxtArea">Choose one option that apply:</td>
							<td class="tableRight">
							
							<input type="radio" size="10" name="regAddFor" id="rself1" value="rid" onClick="switchDiv('ridAddUser'),showHideRadio('regAddFor','ridAddMemb','mem'), showHideRadio('regAddFor','accAddUser','mem'),  showHideRadio('regAddFor','companyAddUser','mem'), showHideRadio('regAddFor','existAddComp','mem'), showHideRadio('regAddFor','compAddQuest','mem'),clearNotHLCdetails1();copyRiderOwner();" />
							The owner is the rider. <br /> 
							<input type="radio" size="10" name="regAddFor" id="rself1" value="mem" onClick="switchDiv('ridAddMemb'),showHideRadio('regAddFor','ridAddUser','rid'), showHideRadio('regAddFor','accAddUser','rid'),  showHideRadio('regAddFor','companyAddUser','rid'),showHideRadio('regAddFor','compAddQuest','rid'), showHideRadio('regAddFor','existAddComp','rid'); comRegClear1(); comNewClear1(); comRadioClear1(); clearNotHLCdetails1();" />
							Owner is Member. <br />
							<input type="radio" size="10" name="regAddFor" id="rself1" value="acc" onClick="switchDiv('accAddUser'),showHideRadio('regAddFor','ridAddUser','acc'),   showHideRadio('regAddFor','companyAddUser','acc'),showHideRadio('regAddFor','compAddQuest','acc'), showHideRadio('regAddFor','ridAddMemb','acc'), showHideRadio('regAddFor','existAddComp','acc'), clearHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1();clear2();" />
							The owner has a Dashboard Username(Login Id).<br />
						 							
							<input type="radio" size="10" name="regAddFor" id="rself1" value="cmp" onClick="switchDiv('compAddQuest'), showHideRadio('regAddFor','ridAddUser','cmp'),showHideRadio('regAddFor','ridAddMemb','cmp'), showHideRadio('regAddFor','accAddUser','cmp'),  showHideRadio('regAddFor','companyAddUser','cmp'), showHideRadio('regAddFor','existAddComp','cmp'), clearHLCdetails1(); clearNotHLCdetails1(); " />
							The owner is a Company.							</td>
				  </tr>
							 
						  <tr>
							<td colspan="2" id="ridAddUser">
								  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr> 
									  <td colspan="2" class="tblMainHead">Owner Information</td>
									</tr>
									<tr>
									  <td class="tableLeft">Member ID:</td>
									  <th class="tableRight"><input name="ownerUseaNoTwo1" id="ownerUseaNo2_id1" class="textboxOne" size="20" /> <span class="asterisk">*</span></th>
									</tr>
									<tr> 
										<td class="tableLeft">First Name:</td>
										<th class="tableRight"><input name="ownerFNameTwo1" id="ownerFname2_id1" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="readonly"  size="20" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Last Name:</td>
										<th class="tableRight"><input name="ownerLNameTwo1" id="ownerLname2_id1" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="readonly"  size="20" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Phone:</td>
										<th class="tableRight">xxx-xxx-<input name="ownerPhoneTwo1" id="ownerPhone2_id1" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="readonly"  size="8" /></th>
									</tr>
								 </table>							</td>
						  </tr> 
						   <tr id="compAddQuest">
							<td class="tableLeft">Is the company already registered ?</span>
							<td class="tableRight">
								<input type="radio" size="10" name="ecmp1" id="ecmp" value="yes" onClick="switchDiv('existAddComp'); showHideRadio('ecmp1','companyAddUser','yes'); comNewClear1();"> Yes
								<input type="radio" size="10" name="ecmp1" id="ecmp" value="no"  onClick="switchDiv('companyAddUser'); showHideRadio('ecmp1','existAddComp','no'); comRegClear1();"> No							</td>
						  </tr>
						  <tr>
							<td colspan="2" id="ridAddMemb">
								  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr> 
									  <td colspan="2" class="tblMainHead">Owner Information - Member</td>
									</tr>
									<tr>
									  <td class="tableLeft">Member ID:</td>
									  <th class="tableRight"><input name="userNameId2" id="userNameId2" class="textboxOne" size="20" onblur="userDetails1(this);"/> <span class="asterisk">*</span> </th>
									</tr>
									<tr> 
										<td class="tableLeft">First Name:</td>
										<th class="tableRight"><input name="firstNameId2" class="textboxOne" id="firstNameId2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Last Name:</td>
										<th class="tableRight"><input name="lastNameId2" class="textboxOne" id="lastNameId2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Phone: (Last 4 digits)</td>
										<th class="tableRight">xxx-xxx-<input name="phoneId2" class="textboxOne" id="phoneId2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
									</tr>
								 </table>								 </td>
						  </tr>						  
						  <tr>
							<td colspan="2" id="accAddUser">
							   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr> 
									  <td colspan="2" class="tblMainHead">Owner Information - Web User </td>
									</tr>
									<tr>
									  <td class="tableLeft">Username:</td>
									  <th class="tableRight"><input name="userNameId3" id="userNameId3" class="textboxOne" size="20" onblur="nonUserDetails(this);" /> <span class="asterisk">*</span> </th>
									</tr>
									<tr> 
										<td class="tableLeft">First Name:</td>
										<th class="tableRight"><input name="firstNameId3" class="textboxOne" id="firstNameId3" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Last Name:</td>
										<th class="tableRight"><input name="lastNameId3" class="textboxOne" id="lastNameId3" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Phone: (Last 4 digits)</td>
										<th class="tableRight">xxx-xxx-<input name="phoneId3" id="phoneId3" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" readonly="readonly" size="8" /></th>
									</tr>
							  </table>								</td>
						  </tr>
						  
						  <tr>
							<td colspan="2" id="existAddComp">
							   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr> 
									  <td colspan="2" class="tblMainHead">Owner Information - Company </td>
									</tr>
									
									<tr>
									  <td class="tableLeft">Company Name:</td>
									  <th class="tableRight"><input name="existAddCompNameId1" id="existAddCompNameId1" class="textboxOne" size="20" onblur="nonUserDetails1(this);" /> <span class="asterisk">*</span> </th>
									</tr>
									<tr> 
										<td class="tableLeft">Contact Person First Name:</td>
										<th class="tableRight"><input name="cpAddfirstNameId1" class="textboxOne" id="cpAddfirstNameId1" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Contact Person Last Name:</td>
										<th class="tableRight"><input name="cpAddlastNameId1" class="textboxOne" id="cpAddlastNameId1" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
									</tr>
									<tr>
										<td class="tableLeft">Phone: (Last 4 digits)</td>
										<th class="tableRight">xxx-xxx-<input name="ecmpAddPhoneId1" id="ecmpAddPhoneId1" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" readonly="readonly" size="8" /></th>
									</tr>
							  </table>							</td>
						  </tr>

						  <tr>
						<td colspan="2" id="companyAddUser">
							<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
								  
								  <tr> 
								  <td colspan="2" class="tblMainHead">Company Information - New Company </td>
								</tr>
								  <tr>
									<td class="tableLeft"> Company Name:</td>
									<td class="tableRight"><input name="newAddFirstNameIdComp" id="newAddFirstNameIdComp" class="textboxOne" size="20" onblur="usrStat();"/>
									<span class="asterisk">*</span> </td>
								  </tr>
								  <tr> 
									<td class="tableLeft"> Address</td>
									<td colspan="-1" class="tableRight">
										<input name="newAddAddressIdComp" id="newAddAddressIdComp" class="textboxOne" size="20" />
										<span class="asterisk">*</span> </td>
								  </tr>
								  <tr> 
									<td class="tableLeft"> Country</td>
									<td colspan="-1" class="tableRight">
									<SELECT name="newAddCountryIdComp" id="newAddCountryIdComp" class="selectboxOne"  onChange="FillState(document.myform.newAddCountryIdComp, document.myform.newAddStateIdComp, '--Select One--');">
									</SELECT>
									<span class="asterisk">*</span> </td>
								  </tr>
								  <tr> 
									<td class="tableLeft"> State</td>
									<td colspan="-1" class="tableRight"> <span class="row"><span class="formX"> 
									 <SELECT name="newAddStateIdComp" id="newAddStateIdComp" class="selectboxOne" ></SELECT>
									  <span class="asterisk">*</span> </span></span></td>
								  </tr>
								  <tr> 
									<td class="tableLeft"> City</td>
									<td colspan="-1" class="tableRight">
										<input name="newAddCityIdComp" id="newAddCityIdComp" class="textboxOne" size="20" />
										<span class="asterisk">*</span> </td>
								  </tr>
								  <tr> 
									<td class="tableLeft"> Zip Code</td>
									<td colspan="-1" class="tableRight">
										<input name="newAddZipIdComp" id="newAddZipIdComp" class="textboxOne" size="20" />
										<span class="asterisk">*</span> </td>
								  </tr>
								   <tr> 
									<td class="tableLeft">EMail-ID</td>
									<td colspan="-1" class="tableRight">
									   <input name="newAddEmailIdComp" id="newAddEmailIdComp" class="textboxOne" size="20" />
									   <span class="asterisk">*</span> </td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Phone</td>
									<td colspan="-1" class="tableRight">
									   <input name="newAddPhoneIdComp" id="newAddPhoneIdComp" class="textboxOne" size="20" />
									   <span class="asterisk">*</span> </td>
								  </tr>
								  <tr> 
									<td class="tableLeft">Fax</td>
									<td colspan="-1" class="tableRight">
									   <input name="newAddFaxIdComp" id="newAddFaxIdComp" class="textboxOne" size="20" /></td>
								  </tr>
						  	      <tr> 
									<td class="tableLeft">Contact Person First Name</td>
									<td colspan="-1" class="tableRight">
									   <input name="cpAddFirstNameIdComp" id="cpAddFirstNameIdComp" class="textboxOne" size="20" />
									   <span class="asterisk">*</span></td>								  </tr>
								  <tr> 
									<td class="tableLeft">Contact Person Last Name</td>
									<td colspan="-1" class="tableRight">
									   <input name="cpAddLastNameIdComp" id="cpAddLastNameIdComp" class="textboxOne" size="20" />
									   <span class="asterisk">*</span></td>								  </tr>
						  </table>						</td>
				  </tr>
				</table>
			</div>	
			
<%
 
	ArrayList listContact = (ArrayList) request.getAttribute("ownerDetails");
		String prefix1="";
		String first_name = "";
		String middle_name = "";
		String last_name = "";
		String sufix = "";
		String email_id = "";
		String suite = "";
		String address1 = "";
		String address2 = "";
		String city = "";
		String state = "";
		String country = "";
		String zip = "";
		String phone_no = "";
		String mobile_no = "";
		String fax_no = "";
		if(listContact !=null && listContact.size()!=0){
			Iterator it = listContact.iterator();
			while(it.hasNext()){			
				prefix1 = (String)it.next();
				if(prefix1==null)
				prefix1 = "N/A";
				first_name  = (String)it.next();
				if(first_name==null)
				first_name = "N/A";
				middle_name  = (String)it.next();
				if(middle_name==null)
				middle_name = "N/A";
				last_name = (String)it.next();
				if(last_name==null)
				last_name = "N/A";
				sufix =  (String)it.next();
				if(sufix==null)
				sufix = "N/A";
				email_id  = (String)it.next();
				if(email_id==null)
				email_id = "N/A";
				suite =  (String)it.next();
				if(suite==null)
				suite = "N/A";
				address1 =  (String)it.next();
				if(address1==null)
				address1 = "N/A";
				address2 = (String)it.next();
				if(address2==null)
				address2 = "N/A";
				city = (String)it.next();
				if(city==null)
				city = "N/A";
				state =  (String)it.next();
				if(state==null)
				state = "N/A";
				country = (String)it.next();
				if(country==null)
				country = "N/A";
				zip = (String)it.next();
				if(zip==null)
				zip = "N/A";
				phone_no = (String)it.next();
				if(phone_no==null)
				phone_no = "N/A";
				mobile_no = (String)it.next();	
				if(mobile_no==null)
				mobile_no = "N/A";
				fax_no = (String)it.next();
				if(fax_no==null)
				fax_no = "N/A";
				}
			}
	%>				
			
	 		 
	 <div id="existOwn">
								<div class="row">
									<span class="label">Name:</span>
									<span class="formX"><input type="text"  readonly="true" class="readOnly" name="ownerName2" id="ownerName2"  value="<%=first_name%>&nbsp;<%=last_name%>" size="20" /></span>                       			</div>

									<input type="hidden" name="ownFirstName" id="ownFirstName" value="<%=first_name%>" />
									<input type="hidden" name="ownLastName" id="ownLastName" value="<%=last_name%>" />
									<input type="hidden" name="ownUserId" id="ownUserId" value="<%=ownerId%>" />
							<div class="row">
									<span class="label">State:</span>
									<span class="formX"><input type="text"  readonly="true" class="readOnly" name="state" id="state"  value="<%=state%>"  size="20" /></span>								</div>
								<div class="row">
									<span class="label">Zipcode:</span>
									<span class="formX"><input type="text"  readonly="true" class="readOnly" name="zip" id="zip"  value="<%=zip%>"   size="20" /></span>								</div>
									<div class="row">
									<span class="label">Phone Number:</span>
									<span class="formX"><input type="text"  readonly="true" class="readOnly" name="phone_no" id="phone_no"  value="<%=phone_no%>"   size="20" /></span>								</div>
								<div class="row">
									<span class="label">Email:</span>
									<span class="formX">
									
									<input type="text"  readonly="true" class="readOnly" name="email_id" id="email_id"  value="<%=email_id%>"   size="30" /></span>								</div>								
                </div>
<div class="formPart">
	<div class="rowHead">Trainer Information Section:</div>	
	<div>
		<table width="100%" cellpadding="0" cellspacing="1" border="0">
		<tr>
		<td colspan="2" align="justify" class="tableSpan"><strong>Note:</strong>&nbsp;<span class="styleBoldOne">Trainer selection below is for Horse Registration purposes only. For competition purposes, the competitor must designate the current Trainer (if any), and secure the Trainer's signature when completing each event entry form.</span></td>
		</tr>
		<tr>
			<td class="tableLeftTxtArea">Choose one option that apply: </td>
			<td class="tableRight">
				<input type="radio" size="10" name="regFor" id="regFor" value="mem1" onClick="switchDiv('ridUser'),showHideRadio('regFor','ridMemb','mem1'), clearHLCdetails1(); clearNotHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1(),arCheck(); " />
				The Trainer is the Rider. <br />
<input type="radio" size="10" name="regFor" id="regFor" value="own1" onClick="showHideRadio('regFor','ridUser','own1'), clearHLCdetails1(); clearNotHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1(); return detailsAlert();" />
				The Trainer is the Owner. <br />
				<input type="radio" size="10" name="regFor" id="regFor" value="other" onClick="showHideRadio('regFor','ridUser','other'), showHideRadio('regFor','ridMemb','other'), clearNotHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1();" />
				Others. <br />
<!--				<input type="radio" size="10" name="regAddFor" id="regAddFor" value="acc" onClick="switchDiv('accAddUser'),showHideRadio('regAddFor','ridAddUser','acc'), showHideRadio('regAddFor','companyAddUser','acc'), showHideRadio('regAddFor','ridAddMemb','acc'), showHideRadio('regAddFor','existAddComp','acc'), showHideRadio('regAddFor','compAddQuest','acc'), clearHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1();clearTT();" />
				The Trainer has a Dashboard Username (Login ID)<br />
				<input type="radio" size="10" name="regAddFor" id="rself1" value="cmp" onClick="switchDiv('compAddQuest'),showHideRadio('regAddFor','ridAddUser','cmp'), showHideRadio('regAddFor','ridAddMemb','cmp'), showHideRadio('regAddFor','accAddUser','cmp'), showHideRadio('regAddFor','companyAddUser','cmp'), showHideRadio('regAddFor','existAddComp','cmp'), clearHLCdetails1(); clearNotHLCdetails1();" />
				The Trainer is a Company.
-->			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="ridUser">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr> 
							<td colspan="2" class="tblMainHead"> Trainer - Rider </td>
						</tr>
						<tr>
							<td class="tableLeft">Member ID:</td>
							<th class="tableRight"><input name="ownerUseaNoTwo" id="ownerUseaNo2_id" class="textboxOne"size="20"  readonly="readonly"/></th>
						</tr>
						<tr> 
							<td class="tableLeft">First Name:</td>
							<th class="tableRight"><input name="ownerFNameTwo" id="ownerFname2_id"  class="textboxOne" size="20" readonly="readonly"/></th>
						</tr>
						<tr>
							<td class="tableLeft">Last Name:</td>
							<th class="tableRight"><input name="ownerLNameTwo" id="ownerLname2_id"  class="textboxOne" size="20" readonly="readonly"/></th>
						</tr>
						<tr>
							<td class="tableLeft">Phone:</td>
							<th class="tableRight"><input name="ownerPhoneTwo" id="ownerPhone2_id"  class="textboxOne" size="20" readonly="readonly"/></th>
						</tr>
					</table>
				</div>
			</td>
		</tr> 
		<tr>
			<td colspan="2">
			<div id="compQuest">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tableLeft">Is the company already registered </span>
						<td class="tableRight">
							<input type="radio" size="10" name="ecmp1" id="ecmp1" value="yes" onClick="switchDiv('existAddComp'); showHideRadio('ecmp1','companyAddUser','yes'); comNewClear1();"> Yes
						<input type="radio" size="10" name="ecmp1" id="ecmp1" value="no"  onClick="switchDiv('companyAddUser'); showHideRadio('ecmp1','existAddComp','no'); comRegClear1();"> No							</td>
					</tr>
				</table>
				</div>

				
			</td>
		</tr>

		<tr>
			<td colspan="2">
				<div id="ridMemb">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr> 
							<td colspan="2" class="tblMainHead"> Trainer Information - Member</td>
						</tr>
						<tr>
							<td class="tableLeft">Member ID:</td>
							<th class="tableRight"><input name="userNameId2" id="userNameId2" class="textboxOne" size="20" onblur="userDetailsT(this);"/> <span class="asterisk">*</span> </th>
						</tr>
						<tr> 
							<td class="tableLeft">First Name:</td>
							<th class="tableRight"><input name="firstNameId2" class="textboxOne" id="firstNameId2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
						</tr>
						<tr>
							<td class="tableLeft">Last Name:</td>
							<th class="tableRight"><input name="lastNameId2" class="textboxOne" id="lastNameId2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
						</tr>
						<tr>
							<td class="tableLeft">Phone: (Last 4 digits)</td>
							<th class="tableRight">xxx-xxx-<input name="phoneId2" class="textboxOne" id="phoneId2" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
						</tr>
					</table>
			</div>								 </td>
		</tr>						  
		<tr>
			<td colspan="2">
				<div id="accUser">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr> 
							<td colspan="2" class="tblMainHead"> Trainer Information - Web User </td>
						</tr>
						<tr>
							<td class="tableLeft">Username:</td> 
							<th class="tableRight"><input name="userNameId3" id="userNameId3" class="textboxOne" size="20" onblur="nonUserDetailsT(this);" /> <span class="asterisk">*</span> </th>
						</tr>
						<tr> 
							<td class="tableLeft">First Name:</td>
							<th class="tableRight"><input name="firstNameId3" class="textboxOne" id="firstNameId3" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
						</tr>
						<tr>
							<td class="tableLeft">Last Name:</td>
							<th class="tableRight"><input name="lastNameId3" class="textboxOne" id="lastNameId3" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
						</tr>
						<tr>
							<td class="tableLeft">Phone: (Last 4 digits)</td>
							<th class="tableRight">xxx-xxx-<input name="phoneId3" id="phoneId3" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" readonly="readonly" size="8" /></th>
						</tr>
					</table>
			</div>								</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<div id="existComp">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr> 
							<td colspan="2" class="tblMainHead"> Trainer Information - Company </td>
						</tr>
						
						<tr>
							<td class="tableLeft">Company Name:</td>
							<th class="tableRight"><input name="existAddCompNameId1" id="existAddCompNameId1" class="textboxOne" size="20" onblur="nonUserDetailsTT(this);"  /> <span class="asterisk">*</span> </th>
						</tr>
						<tr> 
							<td class="tableLeft">Contact Person First Name:</td>
							<th class="tableRight"><input name="cpAddfirstNameId1" class="textboxOne" id="cpAddfirstNameId1" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
						</tr>
						<tr>
							<td class="tableLeft">Contact Person Last Name:</td>
							<th class="tableRight"><input name="cpAddlastNameId1" class="textboxOne" id="cpAddlastNameId1" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></th>
						</tr>
						<tr>
							<td class="tableLeft">Phone: (Last 4 digits)</td>
							<th class="tableRight">xxx-xxx-<input name="ecmpAddPhoneId1" id="ecmpAddPhoneId1" class="textboxOne" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" readonly="readonly" size="8" /></th>
						</tr>
					</table>
			</div>							</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<div id="companyUser">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						
						<tr> 
							<td colspan="2" class="tblMainHead"> Trainer Information - New Company </td>
						</tr>
						<tr>
							<td class="tableLeft"> Company Name:</td>
							<td class="tableRight"><input name="newAddFirstNameIdComp" id="newAddFirstNameIdComp" class="textboxOne" size="20"  onblur="usrStatT();"/>
							<span class="asterisk">*</span> </td>
						</tr>
						<tr> 
							<td class="tableLeft"> Address</td>
							<td colspan="-1" class="tableRight">
								<input name="newAddAddressIdComp" id="newAddAddressIdComp" class="textboxOne" size="20" />
							<span class="asterisk">*</span> </td>
							
						</tr>
						<tr> 
							<td class="tableLeft"> Country</td>
							<td colspan="-1" class="tableRight">
						<tr> 
							<td class="tableLeft"> City</td>
							<td colspan="-1" class="tableRight">
								<input name="newAddCityIdComp" id="newAddCityIdComp" class="textboxOne" size="20" />
							<span class="asterisk">*</span> </td>
						</tr>
						<tr> 
							<td class="tableLeft"> Zip Code</td>
							<td colspan="-1" class="tableRight">
								<input name="newAddZipIdComp" id="newAddZipIdComp" class="textboxOne" size="20" />
							<span class="asterisk">*</span> </td>
						</tr>
						<tr> 
							<td class="tableLeft">EMail-ID</td>
							<td colspan="-1" class="tableRight">
								<input name="newAddEmailIdComp" id="newAddEmailIdComp" class="textboxOne" size="20" />
							<span class="asterisk">*</span> </td>
						</tr>
						<tr> 
							<td class="tableLeft">Phone</td>
							<td colspan="-1" class="tableRight">
								<input name="newAddPhoneIdComp" id="newAddPhoneIdComp" class="textboxOne" size="20" />
							<span class="asterisk">*</span> </td>
						</tr>
						<tr> 
							<td class="tableLeft">Fax</td>
							<td colspan="-1" class="tableRight">
							<input name="newAddFaxIdComp" id="newAddFaxIdComp" class="textboxOne" size="20" /></td>
						</tr>
						<tr> 
							<td class="tableLeft">Contact Person First Name</td>
							<td colspan="-1" class="tableRight">
								<input name="cpAddFirstNameIdComp" id="cpAddFirstNameIdComp" class="textboxOne" size="20" />
							<span class="asterisk">*</span></td>
						</tr>
						<tr> 
							<td class="tableLeft">Contact Person Last Name</td>
							<td colspan="-1" class="tableRight">
								<input name="cpAddLastNameIdComp" id="cpAddLastNameIdComp" class="textboxOne" size="20" />
							<span class="asterisk">*</span></td>
						</tr>
					</table>
			</div>						</td>
		</tr>
		</table>	
	</div>
				
		<div class="rowHead">Horse Description:</div>
 
 
			 
			               
				 <div class="row">
				<span class="label">Color:</span>
				
				<span class="formX">
				<select name="colorselect" id="colorSelectId" class="selectboxOne">
				  <option selected="selected" value="">Select One</option>
						<%
						String colorExistId = HorseDisp.getColorId();
						ArrayList lst = (ArrayList) request.getAttribute("DisplayColorDetails");
						if(lst.size()!=0){
							Iterator itr = lst.iterator();
							while(itr.hasNext()){
									HLCHorseColorVO objColorVO = (HLCHorseColorVO)itr.next();
									String colorId = objColorVO.getColorId();
									String colorCode = objColorVO.getColorCode();
									String colorDesc = objColorVO.getColorDesc();
									if(colorId.equals(colorExistId)){
										%>
									<option value="<%=colorId%>" selected="selected"><%=colorDesc%></option>
									 <%}else{
									 %>
									  <option value="<%=colorId%>"> <%=colorDesc%></option>
									 <%
									 }
									 
							  }
							}
							  %>   
			    </select>
				
				<span class="asterisk">*</span>				</span> </div>
				 
			<div class="row">
				<span class="label">Sex:</span>
				<span class="formX">
				<select name="genderselect" id="genderSelectId" class="selectboxOne">
				<option selected="selected" value="">Select One</option>
				<%if(gender.equals("Gelding")){
				%>
					  <option selected="selected" value="Gelding"><%=gender%></option>
					  <%
				}
				else{
				%>
			   <option value="Gelding">Gelding</option>
			   <%}%>
			   
			   <%if(gender.equals("Stallion")){%>
					  <option selected="selected" value="Stallion"><%=gender%></option>
					  <%
				}
				else{
				%>
			   <option value="Stallion">Stallion</option>
			   <%}%>
			   
			   <%if(gender.equals("Mare")){%>
					  <option selected="selected" value="Mare"><%=gender%></option>
				<%
				}
				else{
				%>
			   <option value="Mare">Mare</option>
			   <%}%>
			    </select>
				<span class="asterisk">*</span>				</span>			</div>
			 
				<%
				String hgt="";

				if(HorseDisp.getHeight()!=null && HorseDisp.getHeight().trim().length()!=0){
				hgt = HorseDisp.getHeight();
				}
				else{
				hgt ="";
				}
				
				%>
			<div class="row">
				<span class="label">Height</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=hgt%>"  name="height" id="height_id" size="10" /></span>			</div>
			<div class="row">
				<span class="label">Year foaled:</span> 
				<span class="formX"><input type="text" class="textboxOne" value="<%=yearFoaled%>"  name="foaled" id="foaled_id" size="10" /><span class="asterisk">*</span>
				</span>			</div>
			<div class="row">
				<span class="label">Breed:</span>
				<span class="formX">
				<select name="breed" id="breed" class="selectboxOne">
				  <option selected="selected" value="">Select One</option>
				  <%
				        String existingBreed = HorseDisp.getBreedId();
						ArrayList breed = (ArrayList) request.getAttribute("DisplayBreedDetails");
						if(breed.size()!=0){
							Iterator itr = breed.iterator();
							while(itr.hasNext()){
									HLCBreedVO objBreedVO = (HLCBreedVO) itr.next();
									String breedId = objBreedVO.getBreedId();
									String breedCode = objBreedVO.getBreedCode();
									String breedDesc =  objBreedVO.getBreedDesc();
									if(breedId.equals(existingBreed)){
				%>
									<option value="<%=breedId%>" selected="selected"><%=breedDesc%></option>
									<%
									}
									else{
										%>
										<option value="<%=breedId%>"> <%=breedDesc%></option>
										<%
									}
								}
					}
									%>   
			    </select></span>			</div>
			<div class="row">
				<span class="label">Breed Two:</span>
				<span class="formX">
				<select name="breedTwo" id="breedTwo" class="selectboxOne">
				  <option selected="selected" value="">None</option>
				      <%
					  String existingBreed2 = HorseDisp.getBreed2Id();
						ArrayList breed1 = (ArrayList)request.getAttribute("DisplayBreedDetails");
						if(breed1.size()!=0){
							Iterator itr1 = breed1.iterator();
							while(itr1.hasNext()){
									HLCBreedVO objBreedVO1 = (HLCBreedVO) itr1.next();
									String breedId1 = objBreedVO1.getBreedId();
									String breedCode1 = objBreedVO1.getBreedCode();
									String breedDesc1 =  objBreedVO1.getBreedDesc();
											if(breedId1.equals(existingBreed2)){
											%>
											<option value="<%=breedId1%>" selected="selected"><%=breedDesc1%></option>
											<%
											}
											else{
											%>
											<option value="<%=breedId1%>"> <%=breedDesc1%></option>
											<%
											}
											}
											}
											%>
			    </select>
			    </span>			</div>
				          <%
							   String countryOrg="";
							   if(HorseDisp.getCountry()!=null && HorseDisp.getCountry().trim().length()!=0){
							    countryOrg = HorseDisp.getCountry();
							   }
							   else{
							   countryOrg = "";
							   }	   %>
			<div class="row">
				<span class="label">Country of origin:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=countryOrg%>" name="countryOrigin" id="countryOrigin" size="15" /> (If not USA)</span>			</div>
 							<%
							   String sireName="";
							   if(HorseDisp.getSire()!=null && HorseDisp.getSire().trim().length()!=0){
							     sireName = HorseDisp.getSire();
							   }
							   else{
							   sireName ="";
							   }
							   
							   %>
			<div class="row">
				<span class="label">Sire Name:</span>
				<span class="formX"><input type="text" class="textboxOne" name="sireName" id="sireName" value="<%=sireName%>" size="15" /></span>			</div>
			<div class="row">
				<span class="label">Sire Breed:</span>
				<span class="formX">
				<select name="sireBreed" id="sireBreed" class="selectboxOne">
				  <option selected="selected" value="">Select One</option>
				  <%
				   		String existingBreed3 = HorseDisp.getSireBreedId();
						ArrayList breed3 = (ArrayList) request.getAttribute("DisplayBreedDetails");
						if(breed3.size()!=0){
							Iterator itr3 = breed3.iterator();
							while(itr3.hasNext()){
									HLCBreedVO objBreedVO3 = (HLCBreedVO) itr3.next();
									String breedId3 = objBreedVO3.getBreedId();
									String breedCode3 = objBreedVO3.getBreedCode();
									String breedDesc3 =  objBreedVO3.getBreedDesc();
									if(breedId3.equals(existingBreed3)){
											%>
											<option value="<%=breedId3%>" selected="selected"><%=breedDesc3%></option>
											<%
											}
											else{
											%>
											<option value="<%=breedId3%>"> <%=breedDesc3%></option>
											<%
											}
											}
											}
											%>
			    </select></span>			</div>
			<div class="row">
				<span class="label">Sire Breed Two:</span><span class="formX">
				<select name="sireBreedTwo" id="sireBreedTwo" class="selectboxOne">
                  <option selected="selected" value="">None</option>
                  <%
				  	String existingBreed4 = HorseDisp.getSireBreed2Id();
					System.out.print("existingBreed4"+ existingBreed4);
						ArrayList breed2 = (ArrayList) request.getAttribute("DisplayBreedDetails");
						if(breed2.size()!=0){
							Iterator itr2 = breed2.iterator();
							while(itr2.hasNext()){
									HLCBreedVO objBreedVO2 = (HLCBreedVO) itr2.next();
									String breedId2 = objBreedVO2.getBreedId();
									String breedCode2 = objBreedVO2.getBreedCode();
									String breedDesc2 =  objBreedVO2.getBreedDesc();
											if(breedId2.equals(existingBreed4)){
											%>
											<option value="<%=breedId2%>" selected="selected"><%=breedDesc2%></option>
											<%
											}
											else{
											%>
											<option value="<%=breedId2%>"> <%=breedDesc2%></option>
											<%
											}
											}
											}
											%>
                </select>
				</span></div>
				         <%
							   String damName="";
							   if(HorseDisp.getDam()!=null && HorseDisp.getDam().trim().length()!=0){
							     damName = HorseDisp.getDam();
							   }
							   else{
							   damName ="";
							   }
							   
							   %>
			<div class="row">
				<span class="label">Dam Name:</span>
				<span class="formX"><input type="text" class="textboxOne" name="damName" value="<%=damName%>" id="damName" size="15" /></span>			</div>
			<div class="row">
				<span class="label">Dam Breed:</span>
				<span class="formX">
				<select name="damBreed" id="damBreed" class="selectboxOne">
				  <option selected="selected" value="">Select One</option>
				   <%
				   	String exisDamBreed = HorseDisp.getDamBreedId();
						ArrayList breed4 = (ArrayList) request.getAttribute("DisplayBreedDetails");
						if(breed4.size()!=0){
							Iterator itr4 = breed4.iterator();
							while(itr4.hasNext()){
									HLCBreedVO objBreedVO4 = (HLCBreedVO) itr4.next();
									String breedId4 = objBreedVO4.getBreedId();

									String breedCode4 = objBreedVO4.getBreedCode();
									String breedDesc4 =  objBreedVO4.getBreedDesc();
									if(breedId4.equals(exisDamBreed)){
											%>
											<option value="<%=breedId4%>" selected="selected"><%=breedDesc4%></option>
											<%
											}
											else{
											%>
											<option value="<%=breedId4%>"> <%=breedDesc4%></option>
											<%
											}
											}
											}
											%>
			    </select></span>			</div>
			<div class="row">
				<span class="label">Dam Breed Two:</span>
				<span class="formX">
				<select name="damBreedTwo" id="damBreedTwo" class="selectboxOne">
				  <option selected="selected" value="">None</option>
				  <%
				  	String exisDamBreed1 = HorseDisp.getDamBreed2Id();
						ArrayList breed5 = (ArrayList) request.getAttribute("DisplayBreedDetails");
						if(breed5.size()!=0){
							Iterator itr5 = breed5.iterator();
							while(itr5.hasNext()){
									HLCBreedVO objBreedVO5 = (HLCBreedVO) itr5.next();
									String breedId5 = objBreedVO5.getBreedId();
									String breedCode5 = objBreedVO5.getBreedCode();

									String breedDesc5 =  objBreedVO5.getBreedDesc();
									if(breedId5.equals(exisDamBreed1)){
											%>
											<option value="<%=breedId5%>" selected="selected"><%=breedDesc5%></option>
											<%
											}
											else{
											%>
											<option value="<%=breedId5%>"> <%=breedDesc5%></option>
											<%
											}
											}
											}
											%>
			    </select>
				</span>	</div>
						<%
						String importForm ="";
						if(HorseDisp.getImportedFrom()!=null && HorseDisp.getImportedFrom().trim().length()!=0){
						importForm = HorseDisp.getImportedFrom();
						}
						else{
						importForm ="";
						}
						%>	
			<div class="row">
				<span class="label">Imported From:</span>
				<span class="formX"><input type="text" class="textboxOne" value="<%=importForm%>"  name="importedFrm" id="impFrm_id" size="25" />
				</span>			</div>
			 
			
			<div class="row"> <span class="label">Date Imported:</span> <span class="formX">
			  <input type="text"  value="<%=imp_dte%>" name="importedDate" id="dateImported" size="20" class="textboxOne" />
			  <a href="javascript:cal1.popup();"><img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a> 	</span>			</div>
		 
 <%
		System.out.print("loggedBy in horse registration:" + session.getAttribute("loggedBy"));
		
		if(session.getAttribute("loggedBy")==null){%>
		<input type="hidden" name="status" value="no">	
        <%}
int si=0;
String logBy="user";
if(session.getAttribute("loggedBy")!=null){
String loggedBy="";
loggedBy=(String)session.getAttribute("loggedBy");
logBy=loggedBy;
if(loggedBy.equalsIgnoreCase("Admin")){
  
	%>
	 <div id="phoneReg">
		<div class="rowHead">
		Phone Registration Information:		</div>	
				<%  
				 
				String horsesertypVect[] =(String[])request.getAttribute("horsesertypVect");
				DecimalFormat myFormatter = new DecimalFormat("######.00");
				String typeId ="";
				String typeName ="";
				String typePrice ="";
				
				String output ="";
				if(horsesertypVect!=null){
						  typeId = horsesertypVect[0];
						  typeName = horsesertypVect[1];
						  typePrice = horsesertypVect[2];
						double finalAmt = Double.parseDouble(typePrice);
						System.out.print("finalAmt" + finalAmt);
						   output = myFormatter.format(finalAmt);
				}
 				%>
   
<div class="row">

<span class="floatLeft">
<input type="hidden" name="status" value="yes">
<input type="hidden" name="servicePrice" value="<%=typeId%>" >
<input type="checkbox" name="phoneCharge" id="cn" value="<%=typePrice%>" size="10" onClick="Dispall();"> </span>
<span class="floatLeftRadio"><%=typeName%>
</span>
<span class="floatRight"><strong><%=output%></strong>&nbsp;&nbsp;</span>            </div>
<% }
else {
%>
 <input type="hidden" name="status" value="no">	
<% }
}%>
</div>
 
			
						<div class="rowHead">
		Payment Information:	</div>
		<div>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">			 
				  <tr>
					<td class="tableLeft"><strong>Total Amount:</strong></td>
					<td class="tableRight"> <strong>$</strong> 
					<input type="hidden" name="tempAmount" readonly="true" class="readOnly" size="10" value="" />
					 
					<input type="text" name="totalAmount" readonly="true" class="readOnly" size="10" value="" />&nbsp; U.S. Dollars	 </td>				 
				  </tr>
				 <% if(session.getAttribute("loggedBy")!=null){%>
					<tr>
					<td class="tableLeft">
						<input type="radio" size="10" name="r11" id="r11" value="check"  onclick="switchDiv('chkEncAcm'), showHideRadio('r11','chrgCrdAcm','check'), hideImgDiv('imgId'), checkClear();cardClear();"/> Check enclosed.				 	</td>
					<td class="tableRight">
						<input type="radio" size="10" name="r11" id="r11" value="card" checked="checked"
onclick="switchDiv('chrgCrdAcm'), showHideRadio('r11','chkEncAcm','card'), showImgDiv('imgId'), cardClear();checkClear();"/> Please charge my card.					</td>
				  </tr>
				   <input type="hidden" name="c11" id="c11" value="adminSec">
				  <%}else{%>
				  
				 <tr>
					<td class="tableRight">
						<input type="radio" size="10" name="r11" id="r11" value="card" checked="checked"
onclick="switchDiv('chrgCrdAcm')"/> Please charge my card.					</td>
				  </tr>
				  <input type="hidden" name="c11" id="c11" value="userSec">	   
				  <%}%>
				  
				  <tr>
					<td colspan="2">
<div id="chkEncAcm">
						<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" class="tableInner">
							<tr>
								<td class="tblMainHead" colspan="3">Check Details:</td>
							</tr>
							<tr>
							  <td colspan="2" class="tableSpan">
							If paying by check , please mail your payment to: 
								<br />
								<br />
								<strong>
								<br />
								Horse  Registration
								<br />
								525 Old Waterford Road NW
								<br />
								Leesburg, VA 20176												    </strong><br />
								<br />
								<strong>Note:</strong><span class="styleBoldOne"> Your registration status will be pending until check is processed.		</span> <br />
						<br /></td>
						  </tr>
						    <%
							  if(session.getAttribute("loggedBy")!=null){
							 %>
							 <input type="hidden" name="roughVal" value="yes"> 
		 			 <td class="tableLeft">Check Amount:</td>
							  <td class="tableRight"><strong>$</strong>
							  <input type="text" name="chkBalAmt" id="chkBalAmt" class="textboxOne" size="16" />&nbsp; U.S. Dollars 							  </td>
							</tr>

							<tr>
							<% }else{%>
							 <input type="hidden" name="roughVal" value="no"> 
							 <%}%>
							<tr>
							  <td class="tableLeft">Check No:</td>
							  <td class="tableRight"><input type="text" name="checkNumber" id="checkNumber" class="textboxOne" size="16" /> <span class="asterisk">*</span>							  </td>
							</tr>
							<%	if(session.getAttribute("loggedBy")!=null){%>
						<input type="hidden" name="chkdate" value="yes">
							<tr>
							  <td class="tableLeft">Check Date:</td>
							  <td class="tableRight"><input type="text" name="checkDate" id="checkDate" class="textboxOne" size="11" maxlength="13"/>

							   <a href="javascript:cal2.popup();">
				   <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a>
					  <span class="asterisk">*</span>												  </td>
							</tr>
							<%}
							else{%>
							<input type="hidden" name="chkdate" value="no">
							<tr>
							  <td class="tableLeft">Check Date:</td>
							  <td class="tableRight"><input type="text" name="checkDate" id="checkDate" class="textboxOne" readonly="true" size="11" />

							   <a href="javascript:cal2.popup();">
				   <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a>
					  <span class="asterisk">*</span>												  </td>
							</tr>
<%							}%>
							<tr>
							  <td class="tableLeft">Bank Name :</td>
							  <td class="tableRight">
							  <input type="text" name="bankName" id="bankName" class="textboxOne" size="16" /> <span class="asterisk">*</span>							  </td>
							</tr>
							<tr>
							  <td class="tableLeft">Name on Check:</td>
							  <td class="tableRight">
							  <input type="text" name="nameCheck" id="nameCheck" class="textboxOne" size="16" /> <span class="asterisk">*</span>							  </td>
							</tr>
						</table>
						</div>					</td>
				  </tr>
				  <tr>
					<td colspan="2">
<div id="chrgCrdAcm">
						<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" class="tableInner">
							
							<tr>
								<td class="tblMainHead" colspan="2">Card Details:</td>
							</tr>
							
								<tr>
								<td class="tableLeft">Card Type:</td>
							  <td class="tableRight">
									<select name="ccType" id="ccType" class="selectboxOne" >
									  <option selected="selected" value="">Select One</option>
									  <option value="Visa">Visa</option>
									  <option value="MasterCard">Master Card</option>
									  <option value="American Express">AmEx</option>
									</select>
									<span class="asterisk">*</span>								</td>
							</tr>
							
							<tr>
								<td class="tableLeft">Card No.:</td>
							  <td class="tableRight">
							  <input type="text" name="ccNumber" id="ccNumber" class="textboxOne" size="16" />
								  <span class="asterisk">*</span></td>
							</tr>
							<tr>
								<td class="tableLeft">Card CVV No.:
								</td>
							  <td class="tableRight">
							  <input type="text" name="ccCvvid" id="ccCvvid" class="textboxOne" size="5" />	
							   <%if(session.getAttribute("loggedBy")==null){%>
						<span class="asterisk">*</span>
																			<%
																			}
																			%>	&nbsp;(see details below)						  </td>
							</tr>
						
							<tr>
								<td class="tableLeft">Print Name On Card:</td>
							  <td class="tableRight">
							  <input type="text" name="ccName" id="ccName" class="textboxOne" size="25" />
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
												<%
												java.util.Calendar c6 = java.util.Calendar.getInstance();
												int year5 = c6.get(Calendar.YEAR);
												System.out.println("Current Date = "+year5);
												for(int f=year5;f<=year5+15;f++) 
												{
												%>
												<option  value="<%=f%>"><%=f%></option>
												<%
												}
												%>				
									</select>
									<span class="asterisk">*</span>																         </td>
						  </tr>
						  
					<%
						String finalDate="";
		 	 
			 
		 				java.util.Calendar c5 = java.util.Calendar.getInstance();
    					int day = c5.get(Calendar.DATE);
						int month1 = c5.get(Calendar.MONTH);
						
						int month=month1+1;
						int year = c5.get(Calendar.YEAR);
						String date="";
						String chkDat="";
						
						if(month<10)
						{
							date = year+"-"+"0"+month+"-"+day;
							 
							chkDat = "0"+month+"/"+day+"/"+year;
						}
						else
						{

						date = year+"-"+month+"-"+day;
						chkDat = month+"/"+day+"/"+year;
						}
	 
			
			
			if(session.getAttribute("loggedBy")!=null){
			%>
			<input type="hidden" name="chkact" value="yes">
							<tr>
									<td class="tableLeft">Activation Date:</td>
									<td class="tableRight">
									<input type="text" name="activeDatVal" id="activeDatVal" class="textboxOne"  size="16" value="<%=chkDat%>" /> 	
									<a href="javascript:cal3.popup();">
				   <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a>
					  <span class="asterisk">*</span></td>		
						  </tr>
			
			<%}else{
			%>
			<input type="hidden" name="chkact" value="no">
			<%}%>		  					
						 
					 </table>								</td>
					 
			</tr>
			
			 <tr>
				<td>&nbsp;</td>
				</tr>	
			<tr>
			  <td colspan="2" class="alignCenter">
					<input type="submit" value="Register" class="gradBtn" />&nbsp;
		<input type="button" value="Cancel" class="gradBtn" onclick="location.href='RegHorseListing.do?process=UserListing'" />				  </td>
			</tr>
			<tr> 
					<td colspan="2">
						<div id="imgId">
						<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" class="tableInner">
				<tr>
				<td>&nbsp;</td>
				</tr>
					
				<tr>
					<td><center><img src="images/cvv_graphic.jpg" /></center></td></tr>
					</table>
					</div>
					</td>
					</tr>
		</table>
		</div>
			
	<div id="spacer">&nbsp;</div>
						 
</form>
</div>
			<!-- CONTENTS END HERE -->		 </td>
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
<script language="javascript">
	var cal1 = new calendar2(document.forms['myform'].elements['dateImported']);
	 cal1.year_scroll = true;
	 cal1.time_comp = false;
	 
	var cal2 = new calendar2(document.forms['myform'].elements['checkDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
	
 	<%  if(session.getAttribute("loggedBy")!=null){	%>
    var cal3 = new calendar2(document.forms['myform'].elements['activeDatVal']);
	cal3.year_scroll = true;
	cal3.time_comp = false;
 <% }%>
 	if(document.getElementById('adoId').value=="yes"){
		FillCountry(document.myform.newAddCountryIdComp, document.myform.newAddStateIdComp, 'USA');
		FillState(document.myform.newAddCountryIdComp, document.myform.newAddStateIdComp, '---Select---');
	}
</script>
</html>