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
/*  Javascript Document 
******************************************************************************************************************
	Product Name: Integrated Enterprise Dashboard - Association / Club V0.5
	Organization: digiBlitz Technologies (P) Ltd.
    Created by: K.N.Sathish
    Created Date: 07/08/2006  
*****************************************************************************************************************
*/

function naviTab(tab_id){
	  for(i=1; i<=3; i++){
			tdId =document.getElementById('tabData'+i);
			divId = document.getElementById('part'+i);
			linkId = document.getElementById('link'+i);
			
			if(tab_id==i){
			  tdId.className="tabHighlight";
			  linkId.className="active";
			  tdId.style.borderBottom="0px solid #FFFFFF";
			  divId.style["display"]="block";
			  divId.style["visibility"]="visible";
			}
			else{
			  tdId.className="tabLowlight";
			  linkId.className="inactive";
			  tdId.style.borderBottom="1px solid #999";
			  divId.style["display"]="none";
			  divId.style["visibility"]="hidden";
			}
	  }
}



function showLevels(chkBxNam,divId){
		if(document.AnnualRegForm.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}
				
function showHide(chkBxNam,divId){
		if(document.AnnualRegForm.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}

function enabDisab(chkBxId,txtBxId){
	  
		if(document.AnnualRegForm.elements[chkBxId].checked == true){
				document.AnnualRegForm.elements[txtBxId].disabled = false;	
		}else {
				document.AnnualRegForm.elements[txtBxId].disabled = "disabled";	
		} 
}

function enableRad(radBtnId,txtBxId){
		if(document.AnnualRegForm.elements[radBtnId].checked == true){
				document.AnnualRegForm.elements[txtBxId].disabled = false;	
		}else{
				document.AnnualRegForm.elements[txtBxId].disabled = "disabled";	
		} 
}

function disable(radBtnNewId,txtBxId){
		if(document.AnnualRegForm.elements[radBtnNewId].checked == true){
				document.AnnualRegForm.elements[txtBxId].disabled = "disabled";	
		}
}	
		
 

function showDates(){
      var obj = document.getElementById("newRegTypeId");

		if(obj.options[obj.selectedIndex].text=='Daily Basis'){
			document.getElementById("meeDates").style.display = "block";
		}else{
			document.getElementById("meeDates").style.display = "none";	
		}
}

function showPrice(){
		if((document.getElementById("selMemb").value==1)||
					(document.getElementById("selMemb").value==2)||
							(document.getElementById("selMemb").value==3)){
			document.getElementById("price").style.display = "block";
		}else{
			document.getElementById("price").style.display = "none";	
		}
}
  
				var req;
				var totalAmount=0.0;
				function showId(){
					document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.memberType.value;
					document.AnnualRegForm.memberName.value="Member";
					document.AnnualRegForm.finalTypId.value = document.AnnualRegForm.membershipTypeFinalId.value;
				}
				function showId1(){
					document.AnnualRegForm.membershipTypeFinalId.value= document.AnnualRegForm.nonMemberType.value;
					document.AnnualRegForm.finalTypId.value = document.AnnualRegForm.membershipTypeFinalId.value;					
					//alert("membershipTypeFinalId2" +document.AnnualRegForm.membershipTypeFinalId.value);
					 document.AnnualRegForm.memberName.value="Non Member";
				}
				function showId2(){
					document.AnnualRegForm.membershipTypeFinalId.value= document.AnnualRegForm.nonMemberType.value;
					document.AnnualRegForm.finalTypId.value = document.AnnualRegForm.membershipTypeFinalId.value;					
					//alert("membershipTypeFinalId2" +document.AnnualRegForm.membershipTypeFinalId.value);
					document.AnnualRegForm.memberName.value="New User";
				}
				
				function showId3(){
					document.AnnualRegForm.membershipTypeFinalId.value= document.AnnualRegForm.juniorMemberType.value;
					document.AnnualRegForm.finalTypId.value = document.AnnualRegForm.membershipTypeFinalId.value;	
					document.AnnualRegForm.finalTypId.value = document.AnnualRegForm.membershipTypeFinalId.value;						
					//alert("membershipTypeFinalId2" +document.AnnualRegForm.membershipTypeFinalId.value);
				}
				
				function showId4(){
					document.AnnualRegForm.membershipTypeFinalId.value= document.AnnualRegForm.nonMemberType.value;
					document.AnnualRegForm.finalTypId.value = document.AnnualRegForm.membershipTypeFinalId.value;						
					//alert("membershipTypeFinalId2" +document.AnnualRegForm.membershipTypeFinalId.value);
				}
				
				  function showAge(){
						var checkVal = "";
						lenrself = document.AnnualRegForm.rself.length ;
						for(i=0;i<lenrself;i++){
							if(document.AnnualRegForm.rself[i].checked){
								checkVal = document.AnnualRegForm.rself[i].value;
								break;
							}
						}
						
						//alert(checkVal);
						if(checkVal=="web"){
							if(document.AnnualRegForm.userNameId1.value==""){
								alert("User Information is Empty");
								if(document.AnnualRegForm.pclub.value=="No"){
									document.AnnualRegForm.pclub.checked=true;
								}
								document.AnnualRegForm.userNameId1.focus();
								return false;
							}
						 
							var age = document.AnnualRegForm.age.value;
							//alert(age);
							//alert(" nonmeber"+ document.AnnualRegForm.membershipTypeFinalId.value);
							//alert("pony "  +document.AnnualRegForm.pclub.value);
							if(age<=18 && age!=0){
								if(isNaN(document.AnnualRegForm.pclub.value)){
									document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value;
								}
								
								if(document.AnnualRegForm.pclub.value=="no"){
									document.AnnualRegForm.pclub.checked=true;
									document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value;
								}
								
								if(document.AnnualRegForm.pclub.value=="yes"){
									document.AnnualRegForm.pclub.checked=true;
									document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.juniorMemberType.value;
								}
								switchDiv('ponyClubber');
							}
							else{
								document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value;
								showHideRadio('rf','ponyClubber','mem');
							}
							//alert(document.AnnualRegForm.membershipTypeFinalId.value);
							
						}
						if(checkVal=="new"){
								if(document.AnnualRegForm.newBirthmonthId.value==""){
									if(document.AnnualRegForm.pclub.value=="no"){
										document.AnnualRegForm.pclub.checked=true;
									}
									document.AnnualRegForm.newBirthmonthId.focus();
									return false;
								}
								 if(document.AnnualRegForm.newBirthdayId.value==""){
										if(document.AnnualRegForm.pclub.value=="No"){
											document.AnnualRegForm.pclub.checked=true;
										}
										document.AnnualRegForm.newBirthdayId.focus();
										return false;
								}
							if(document.AnnualRegForm.newBirthyearId.value==""){
								if(document.AnnualRegForm.pclub.value=="no"){
									document.AnnualRegForm.pclub.checked=true;
								}
							document.AnnualRegForm.newBirthyearId.focus();
							return false;
						}
							var month = document.AnnualRegForm.newBirthmonth.value ;
							var day = document.AnnualRegForm.newBirthday.value ;
							var year = document.AnnualRegForm.newBirthyear.value ;
							if(month!="" && day!="" &&  year!=""){
									var today=new Date();
									var expire=new Date(year,month,day);
									var one_day=1000*60*60*24;
									var tempAge = Math.ceil((today.getTime()-expire.getTime())/(one_day)/365);
								document.AnnualRegForm.age.value = tempAge;
								var age = document.AnnualRegForm.age.value;
								/*if(eval(age)>18){
										if(document.AnnualRegForm.pclub.value=="no"){
										document.AnnualRegForm.pclub.checked=true;
										}
									document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value;
									showHideRadio('rf','ponyClubber','mem');
								}
								else{
									switchDiv('ponyClubber');
									document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.juniorMemberType.value;
								}
								*/
								
								if(age<=18 && age!=0){
									if(isNaN(document.AnnualRegForm.pclub.value)){
										document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value;
									}
									
									if(document.AnnualRegForm.pclub.value=="no"){
										document.AnnualRegForm.pclub.checked=true;
										document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value;
									}
									
									if(document.AnnualRegForm.pclub.value=="yes"){
										document.AnnualRegForm.pclub.checked=true;
										document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.juniorMemberType.value;
									}
									switchDiv('ponyClubber');
								}
								else{
									document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value;
									showHideRadio('rf','ponyClubber','mem');
								}
							
							}
							else{
								alert("Please select valid date of birth");
								
							}
						}
						
				   }
				function getRegAmount(){
				chosen="";
				len = document.AnnualRegForm.rself.length ;
				for(i=0;i<len;i++){
					if(document.AnnualRegForm.rself[i].checked){
						chosen= document.AnnualRegForm.rself[i].value; 
					}
				}
				if(chosen==""){
					alert("Select the Membership Information");
					document.AnnualRegForm.newRegTypeId.selectedIndex=0;
					document.getElementById("meeDates").style.display = "none";
					return false;
				}
				else{
										var  url = null;
										var specObj = document.getElementById('newRegTypeId');
										var selIndex = specObj.selectedIndex;
										var selTxt = specObj.options[selIndex].text;
										var specId = specObj.options[selIndex].value;
					if(specId==""){
						document.AnnualRegForm.regAmount.value=0.00;
						deSelectAll();
					}
					else{
									
						var memId =document.AnnualRegForm.membershipTypeFinalId.value;
				   	    url = "annualAjax.do?method=calcAmount&userTypeId="+escape(memId)+"&specId="+escape(specId);
					
					 if (window.ActiveXObject){ 
							req = new ActiveXObject("Microsoft.XMLHTTP"); 
					 } else if (window.XMLHttpRequest){ 
							req = new XMLHttpRequest(); 
					 } 
					
					 req.onreadystatechange = calcRegAmnt;        
						
					 req.open("GET", url, true);
					 req.send(null);  
				   } 
				   }
			}
			
			function roundUpAmount(amt){
				var rAmount = amt;
				return rAmount;
			}
			
				  function calcRegAmnt(){
					 var amntObj = document.getElementById("regAmountId");
					 var orgObj = document.getElementById("originalAmntId");
					 var specObj = document.getElementById("newRegTypeId"); 
					 var dailyBasisText = specObj.options[specObj.selectedIndex].text;
					 var count=0;
					 if (req.readyState == 4){ 
					   if(req.status==500) { 
						  amntObj.value="";
						  orgObj.value="";
						   return; 
						}
					  if(req.status == 200){  
						var xmlDoc = req.responseXML;
						var regAmnt = xmlDoc.getElementsByTagName('amount')[0].childNodes[0].nodeValue;
						var regPriceId = xmlDoc.getElementsByTagName('priceId')[0].childNodes[0].nodeValue;	
						//alert(document.AnnualRegForm.regPriceId.value);
						document.AnnualRegForm.regPriceId.value = regPriceId;
						if(dailyBasisText=='Daily Basis'){
						 if(Number(document.getElementById('meetDates').value)==1){
							 if(document.forms['AnnualRegForm'].meetingDates.checked==true){
							 	count++;
							 }
						 }
						 else{
							 for (i=0;i<document.forms['AnnualRegForm'].meetingDates.length;i++){
							   if (document.forms['AnnualRegForm'].meetingDates[i].checked==true)
								 count++;
							 } 
						 }
							 
							var totAmt = eval(count)*eval(regAmnt);
							 
							amntObj.value = totAmt.toFixed(2);



							orgObj.value = eval(regAmnt).toFixed(2);
						} else {
							var amt = roundUpAmount(regAmnt);
						  amntObj.value=amt;
						}
					  }
				   }
			  }
			  
			  function roundUpAmount(actualAmount){
					var indexValue = actualAmount.indexOf('.');
					var totalAmount = actualAmount;
					
					if(indexValue==-1){
						totalAmount = totalAmount + ".00";
					}
					else{
						actualAmount = actualAmount.substring(0,indexValue);
						totalAmount = actualAmount + ".00";
					}
					
					return totalAmount;
				}
			
			  
			  
		  function calculateAmount(){
			var amt = 0;			
/*			if(Number(document.AnnualRegForm.activityAmount.value)!=0){
				amt = Number(document.AnnualRegForm.activityAmount.value);				
				alert('Amt inside ' +amt);
			}*/

			var valLen = document.AnnualRegForm.priceIdLen.value;	
			for(i=1;i<=valLen;i++){
				var amtbx = "AmtBx"+i;
				var pricebx = "priceId"+i;
				var chkd = "actCheckBox"+i;

				if(document.getElementById(chkd).checked==true){
					amt = amt + Number(document.getElementById(amtbx).value);
				}
			}				
			document.AnnualRegForm.activityAmount.value = Number(amt).toFixed(2);
			}
			
var httpRequest;
var gPriceId;
var gtransId;
var gamtBx;
	function getActivityAmount(param,paramname){
				var  url = null;
				var checkObj = param.value;
				chosen="";
				len = document.AnnualRegForm.rself.length ;
				var amtbx = "AmtBx"+paramname;
				var priceId = "newPId"+paramname;
				var trans = "trans"+paramname;	
				
				gPriceId = "";
				gtransId = "";
				gamtBx = "";
				
				gamtBx = "AmtBx"+paramname;
				gPriceId = "newPId"+paramname;
				gtransId = "trans"+paramname;
				
				for(i=0;i<len;i++){
					if(document.AnnualRegForm.rself[i].checked){
						chosen= document.AnnualRegForm.rself[i].value; 
					}
				}
				if(chosen==""){
					alert("Select the Membership Information");
					param.checked = 0;
					return false;
				}

			if(param.checked){
					var memId = document.AnnualRegForm.membershipTypeFinalId.value;
					
					url = "annualAjax.do?method=calcAmount&userTypeId="+memId+"&specId="+checkObj;
					
					if (window.ActiveXObject){ 
						httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
					} 
					else if (window.XMLHttpRequest){ 
						httpRequest = new XMLHttpRequest(); 
					}
					httpRequest.onreadystatechange = setOtherAmountonName;
					httpRequest.open("GET", url, true);
					httpRequest.send(null);
				}
				else{
					document.getElementById(gamtBx).value = "0.00";
					calculateAmount();
				}
			} 

		function setOtherAmountonName(){
		
			if(httpRequest.readyState==1){
				return;
			}
			if (httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var xmlDoc = httpRequest.responseXML;
					var priceVal = xmlDoc.getElementsByTagName('priceId')[0].childNodes[0].nodeValue;
					var regAmnt = xmlDoc.getElementsByTagName('amount')[0].childNodes[0].nodeValue;	
					if(priceVal==null && regAmnt==0){
						amntObj = 0.0;
						priceVal = "";
					}
					else{
						amntObj = eval(regAmnt).toFixed(2);
						priceIdField = priceVal;
					}
					document.getElementById(gamtBx).value = amntObj;
					document.getElementById(gPriceId).value = priceIdField;
					calculateAmount();
				}
				if(httpRequest.status==500) {
					amntObj.value="";
					return; 
				}
			}
			else{
			//alert("Error loading page\n");
			}
		}
				
				function setOtherAmount(){

					 if (req.readyState == 4){ 
					   if(req.status==500) { 
						  amntObj.value="";
						   return; 
						}
					  if(req.status == 200){  
						var xmlDoc = req.responseXML;
						var priceVal = xmlDoc.getElementsByTagName('priceId')[0].childNodes[0].nodeValue;
						var regAmnt = xmlDoc.getElementsByTagName('amount')[0].childNodes[0].nodeValue;	
						  amntObj.value=eval(regAmnt).toFixed(2);
					  }
				   }
				  }
				  
		
				function setAcAmount(ticketObj,orgAmntId,amountId){
					var orgName = document.getElementById(orgAmntId);
					var amntName = document.getElementById(amountId);
					var amt= parseFloat(orgName.value)*parseFloat(ticketObj.value);
					if(!isNaN(amt)) {
					  amntName.value = amt; 
					}
					 
				}

				function clearAcAmount(ticketObj,orgAmntId,amountId,selectNamej){
					var ticketName = document.getElementById(ticketObj);
					var orgName = document.getElementById(orgAmntId);
					var amntName = document.getElementById(amountId);  
					var selectObj = document.getElementById(selectNamej);   
					selectObj.options[0].selected="true";
					ticketName.value="";
					amntName.value ="";

					orgName.value="";
					 
				}



				function setActivityAmount() { 

				 if (req.readyState == 4){  
					if(req.status == 200){   
						var amountObj = document.getElementById(amountName);
						var ticketObj = document.getElementById(ticketName);
						var orgAmntObj = document.getElementById(orgAmtName);
						var priceObj = document.getElementById(priceObjName);
						var xmlDoc = req.responseXML.documentElement;	
						var priceVal = xmlDoc.getElementsByTagName('priceId')[0].childNodes[0].nodeValue;
						var regAmnt = xmlDoc.getElementsByTagName('amount')[0].childNodes[0].nodeValue;	

						 if((ticketObj!=null) && trim(ticketObj.value).length>0) {
							amountObj.value = eval(regAmnt*ticketObj.value);
						 }else {
							amountObj.value = regAmnt;
						 }
						 priceObj.value = priceVal;
						 orgAmntObj.value=regAmnt;   		
				   } 
				 }

				}

              
				function setTotalAmount() { 
					var totalAmount=0.00;
					var regAmount = document.getElementById("newRegAmountId");
					 if(!isNaN(regAmount.value)){
					   totalAmount = parseFloat(totalAmount)+parseFloat(regAmount.value);
					 }
						
						 for (i=0;i<document.forms['AnnualRegForm'].activities.length;i++){
							 if (document.forms['AnnualRegForm'].activities[i].checked==true){
								 var objName ="activityAmountId"+document.forms['AnnualRegForm'].activities[i].value; 
								 var amountObj = document.getElementById(objName);
								 if(!isNaN(amountObj.value))
								     totalAmount = parseFloat(totalAmount)+parseFloat(amountObj.value);
							 }
						}	
						
					if(!isNaN(totalAmount))
					document.getElementById("totalAmountId").value=totalAmount;
						}

				  


				   function calcTotalRegAmnt() {
						var specObj = document.getElementById("newRegTypeId"); 
						var amntObj = document.getElementById("regAmountId");
						var orgObj = document.getElementById("originalAmntId");
						var dailyBasisText = specObj.options[specObj.selectedIndex].text; 
						
						var count=0;
					 if(dailyBasisText=='Daily Basis' && amntObj.value.length >0){
						 if(Number(document.getElementById('meetDates').value)==1){
							 if(document.forms['AnnualRegForm'].meetingDates.checked==true){
							 	count++;
							 }
						 }
						 else{
							 for (i=0;i<document.getElementById('meetDates').value;i++){
							   if (document.forms['AnnualRegForm'].meetingDates[i].checked==true)
								 count++;
							 }
						 }
						 amntObj.value = (eval(count)*eval(orgObj.value)).toFixed(2);
						 calculateAmount();
					}
				 }
                
				

				 function dailyBasis(param){ 
				   var dailyBasisText = param.options[param.selectedIndex].text;
					if(dailyBasisText=='Daily Basis'){
					  getDailyDate(dailyBasisText);
					}else {	
					 var parentObj = document.getElementById("meetingDateId");
					 parentObj.innerHTML="";
					}

				 }


				function getDailyDate(annualMeeName){
					 var  url = null;
					 if((annualMeeName!=null)&& trim(annualMeeName).length>0) {
					   url = "memberInfo.do?method=dailyBasis&annualMeeName="+escape(annualMeeName);
					 }
					 if (window.ActiveXObject){ 
							req = new ActiveXObject("Microsoft.XMLHTTP"); 
					 } else if (window.XMLHttpRequest){ 
							req = new XMLHttpRequest(); 
					 } 
					
					 req.onreadystatechange = calcNoOfDays;        
						
					 req.open("GET", url, true);
					 req.send(null);  
				   } 



				function calcNoOfDays(){
					 var parentObj = document.getElementById("meetingDateId");
					 parentObj.innerHTML="";
					 var amntObj = document.getElementById("regAmountId");
					 var orgObj = document.getElementById("originalAmntId");
					 amntObj.value=""; 
					 orgObj.value="";
					

					 if (req.readyState == 4){ 
					   if(req.status==500) { 	      
						   return; 
						}
					  if(req.status == 200){ 
						var table='<table width="100%" border="0" cellspacing="0" cellpadding="0">';	
						var xmlDoc = req.responseXML.documentElement;
						var xRows= xmlDoc.getElementsByTagName('meetingDate');		
					   for (var i=0; i<xRows.length; i++) {
						var dates = xRows[i].childNodes[0].nodeValue;
						 table +='<tr><td class="tableLeft"><input type="checkbox" name="meetingDates" onClick="calcTotalRegAmnt();" value='+dates+'/>'+dates;
					   } 
						table +='</table>';	
						parentObj.innerHTML=table;
					  }
				   }
				 }

				function getMemberInfo(param){
					  var  url = "memberInfo.do?method=memberValid&mid="+escape(param.value);
						if (window.ActiveXObject){ 
							req = new ActiveXObject("Microsoft.XMLHTTP"); 
					   } 
						else if (window.XMLHttpRequest){ 
							req = new XMLHttpRequest(); 
						} 
						req.onreadystatechange = memberValid; 
						 req.open("GET", url, true);
						 req.send(null);  
				   } 
				   
function Trim (Str)
{
if (Str != null)
{
  var start = 0 ;

	if (navigator.appName.toUpperCase().match(/NETSCAPE/) != null)
	{
//	<cfif FindNocase("Netscape6",cgi.user_agent,1) EQ  0>
		var newstr = new String(Str);
	}
	else
	{
//	<cfelse>
		var newstr = Str;
//	</cfif>
	}
  var end = newstr.length - 1 ;

  while (start < end && Str.charAt(start) == " ") start++ ;

  while (end >= 0 && newstr.charAt(end) == " ") end-- ;

  if (end < start) return "" ;

  return newstr.substring(start, (end + 1)) ;
}
else
{
	return newstr;
}
}				   