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
// JavaScript Document

function enable()
{
		document.AnnualRegForm.newClubId.disabled = false;
		document.AnnualRegForm.newClubNameId.disabled = false;
}
function disable()
{
		document.AnnualRegForm.newClubId.disabled = true;
		document.AnnualRegForm.newClubNameId.disabled = true;
}

//===========================================Text field ====================
function enableText()
{
	document.AnnualRegForm.accomId.disabled = false;
}

function disableText()
{
	document.AnnualRegForm.accomId.disabled = true;
}

//------------------------DOSPACE--------------------------------------------------------------------------
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}
//-------------------------function for Special Character------------------------------------
function isnotSpecial(str){
stringSpecialCheck="!#$%^&*()+|<>?/=-~,;:][{}"+"\\"+"\'";
f4=1;
for(j=0;j<str.length;j++)
{if(stringSpecialCheck.indexOf(str.charAt(j))!=-1)
{f4=0;}}
if(f4==0)
{return true;}else{return false;}
}
//------------------------ISNOT ALPHA-------------------------------------------------------------------------
function isnotAlpha(str){
stringCheck="!@#$%^&*()_+|<>?/=-~.,`0123456789;:][{}"+"\\"+"\'"+"\"";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
   { f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}
//===================================================================================================
function clearHLCdetails(){
	document.AnnualRegForm.userNameId.value="";
	document.AnnualRegForm.firstNameId.value="";
	document.AnnualRegForm.lastNameId.value="";
	document.AnnualRegForm.phoneId.value="";
}
function clearNotHLCdetails(){
	document.AnnualRegForm.userNameId1.value="";
	document.AnnualRegForm.firstNameId1.value="";
	document.AnnualRegForm.lastNameId1.value="";
	document.AnnualRegForm.phoneId1.value="";
}
function clearNewdetails(){
	document.AnnualRegForm.newFirstNameId.value="";
	document.AnnualRegForm.newLastNameId.value="";
	document.AnnualRegForm.newBirthmonthId.value="";
	document.AnnualRegForm.newBirthdayId.value="";
	document.AnnualRegForm.newBirthyearId.value="";
	document.AnnualRegForm.sexId.value="";
	document.AnnualRegForm.newAddressId.value="";
	document.AnnualRegForm.newCountryId.value="";
	document.AnnualRegForm.newStateId.value="";
	document.AnnualRegForm.newCityId.value="";
	document.AnnualRegForm.newZipId.value="";
	document.AnnualRegForm.newEmailId.value="";
	document.AnnualRegForm.newPhoneId.value="";
	document.AnnualRegForm.newFaxId.value="";

}
function myvalidate(){

//===================================For radio Button====================================
	chosen="";
	len = document.AnnualRegForm.rself.length ;
	for(i=0;i<len;i++)
	{
	if(document.AnnualRegForm.rself[i].checked)
		{ chosen= document.AnnualRegForm.rself[i].value; }
	}
	if(chosen=="")
	{
		alert("Select the Membership Information");
	 	 return false;
	}
//===============================For HLC Member Information=================================
	if(chosen=="mem"){
		
		if(document.AnnualRegForm.userNameId.value==""){
		alert("UserName is Empty");
		document.AnnualRegForm.userNameId.focus();
		return false;
		}
		if(document.AnnualRegForm.userNameId.value!=""){
			if(isnotSpecial(document.AnnualRegForm.userNameId.value))
			{
				alert("UserName is not valid");
				document.AnnualRegForm.userNameId.focus();
				return false;
			}
			if((document.AnnualRegForm.userNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.userNameId.value.indexOf(' ')==0)){
		alert("User Name is not valid");
		document.AnnualRegForm.userNameId.focus();
		return false;
		}
		if(document.AnnualRegForm.userNameId.value.length > 80){
			alert("User Name is not valid");
			document.AnnualRegForm.userNameId.focus();
			return false;
		}
	}
		
}

//===============================For Web User Information=================================
	if(chosen=="web"){
		
		if(document.AnnualRegForm.userNameId1.value==""){
		alert("UserName is Empty");
		document.AnnualRegForm.userNameId1.focus();
		return false;
		}
	if(document.AnnualRegForm.userNameId1.value!=""){
			if(isnotSpecial(document.AnnualRegForm.userNameId1.value))
			{
				alert("UserName is not valid");
				document.AnnualRegForm.userNameId1.focus();
				return false;
			}
			if((document.AnnualRegForm.userNameId1.value.indexOf('  ')!=-1)||(document.AnnualRegForm.userNameId1.value.indexOf(' ')==0)){
		alert("User Name is not valid");
		document.AnnualRegForm.userNameId1.focus();
		return false;
		}
		if(document.AnnualRegForm.userNameId1.value.length > 80){
			alert("User Name is not valid");
			document.AnnualRegForm.userNameId1.focus();
			return false;
		}
	}
	//==========================================For Pony Club Details============================
chosen="";
	len = document.AnnualRegForm.pclub.length ;
	for(i=0;i<len;i++){
		if(document.AnnualRegForm.pclub[i].checked){
			chosen= document.AnnualRegForm.pclub[i].value;
		}
	}
//=============================for club memebr Id===================================
if(chosen=="yes"){
	if(document.AnnualRegForm.newClubId.value==""){
		alert("Club MemberId is Empty");
		document.AnnualRegForm.newClubId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubId.value!=""){
			if(isnotSpecial(document.AnnualRegForm.newClubId.value))
			{
				alert("Club MemberId is not valid");
				document.AnnualRegForm.newClubId.focus();
				return false;
			}
			if((document.AnnualRegForm.newClubId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubId.value.indexOf(' ')==0)){
		alert("Club MemberId is not valid");
		document.AnnualRegForm.newClubId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubId.value.length > 80){
			alert("Club MemberId is not valid");
			document.AnnualRegForm.newClubId.focus();
			return false;
		}
	}
//====================================for club member =========================================
	
if(document.AnnualRegForm.newClubNameId.value==""){
		alert("Club Member Name is Empty");
		document.AnnualRegForm.newClubNameId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubNameId.value!=""){
			if(isnotSpecial(document.AnnualRegForm.newClubNameId.value))
			{
				alert("Club Member Name is not valid");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
			if((document.AnnualRegForm.newClubNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubNameId.value.indexOf(' ')==0)){
		alert("Club Member Name is not valid");
		document.AnnualRegForm.newClubNameId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubNameId.value.length > 80){
			alert("Club Member Name is not valid");
			document.AnnualRegForm.newClubNameId.focus();
			return false;
		}
	}
	
}

}
//===============================For New User Information =================================
	if(chosen=="new"){
//==================================for first Name =======================================

		if(document.AnnualRegForm.newFirstNameId.value==""){
		alert("FirstName is Empty");
		document.AnnualRegForm.newFirstNameId.focus();
		return false;
		}
		
	if(document.AnnualRegForm.newFirstNameId.value!=""){
			if(isnotAlpha(document.AnnualRegForm.newFirstNameId.value))
			{
				alert("First Name is not valid");
				document.AnnualRegForm.newFirstNameId.focus();
				return false;
			}
	if((document.AnnualRegForm.newFirstNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newFirstNameId.value.indexOf(' ')==0)){
		alert("First Name is not valid");
		document.AnnualRegForm.newFirstNameId.focus();
		return false;
		}	
		if(document.AnnualRegForm.newFirstNameId.value.length > 80){
			alert("First Name is not valid");
			document.AnnualRegForm.newFirstNameId.focus();
			return false;
		}
	}
//=====================================for Last Name ============================================
if(document.AnnualRegForm.newLastNameId.value==""){
		alert("Last Name is Empty");
		document.AnnualRegForm.newLastNameId.focus();
		return false;
		}
		
	if(document.AnnualRegForm.newLastNameId.value!=""){
			if(isnotAlpha(document.AnnualRegForm.newLastNameId.value))
			{
				alert("Last Name is not valid");
				document.AnnualRegForm.newLastNameId.focus();
				return false;
			}
	if((document.AnnualRegForm.newLastNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newLastNameId.value.indexOf(' ')==0)){
		alert("Last Name is not valid");
		document.AnnualRegForm.newLastNameId.focus();
		return false;
		}	
		if(document.AnnualRegForm.newLastNameId.value.length > 80){
			alert("Last Name is not valid");
			document.AnnualRegForm.newLastNameId.focus();
			return false;
		}
	}
//============================= DOB ========================================================

if(document.AnnualRegForm.newBirthmonthId.value=="")
{alert(" Select Month in Date of Birth ");
 document.AnnualRegForm.newBirthmonthId.focus();
 return false;}
 if(!(document.AnnualRegForm.newBirthmonthId.value==""))
 { leno=document.AnnualRegForm.newBirthmonthId.length;
  for(i=0;i<leno;i++)
  { if(document.AnnualRegForm.newBirthmonthId[i].selected)
 { choseno=document.AnnualRegForm.newBirthmonthId[i].value ;}}}
 
 //------month checking----
 var lyear=document.AnnualRegForm.newBirthyearId.value;
 var lcheck=(lyear%4);

if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 2)&&(document.AnnualRegForm.newBirthdayId.value >29)&&(lcheck=="0"))
 {
	alert ("Date is not valid") ;
	document.AnnualRegForm.newBirthdayId.focus();
	return false;
 }
var lyear1=document.AnnualRegForm.newBirthyearId.value;
 var lcheck1=(lyear1%4);
 
 if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 2)&&(document.AnnualRegForm.newBirthdayId.value >28)&&(lcheck1>0))
 {
	alert ("Date is not valid") ;
	document.AnnualRegForm.newBirthdayId.focus();
	return false;
 }
 if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 4)&&(document.AnnualRegForm.newBirthdayId.value=="31"))
 {
	alert ("Date is not valid") ;
	document.AnnualRegForm.newBirthdayId.focus();
	return false;
 }
 if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 6)&&(document.AnnualRegForm.newBirthdayId.value=="31"))
 {
	alert ("Date is not valid") ;
	document.AnnualRegForm.newBirthdayId.focus();
	return false;
 }
 if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 9)&&(document.AnnualRegForm.newBirthdayId.value=="31"))
 {
	alert ("Date is not valid") ;
	document.AnnualRegForm.newBirthdayId.focus();
	return false;
 }
 if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 11)&&(document.AnnualRegForm.newBirthdayId.value=="31"))
 {
	alert ("Date is not valid") ;
	document.AnnualRegForm.newBirthdayId.focus();
	return false;
 }


 if(document.AnnualRegForm.newBirthdayId.value=="")
 {alert(" Select Day in Date of Birth");
  document.AnnualRegForm.newBirthdayId.focus();
  return false;}
  if(!(document.AnnualRegForm.newBirthdayId.value==""))
  { leno=document.AnnualRegForm.newBirthdayId.length;
   for(i=0;i<leno;i++)
   { if(document.AnnualRegForm.newBirthdayId[i].selected)
  { choseno=document.AnnualRegForm.newBirthdayId[i].value ;}}}


 if(document.AnnualRegForm.newBirthyearId.value=="")
 {alert(" Select Year in Date of Birth");
  document.AnnualRegForm.newBirthyearId.focus();
  return false;}
  if(!(document.AnnualRegForm.newBirthyearId.value==""))
  { leno=document.AnnualRegForm.newBirthyearId.length;
   for(i=0;i<leno;i++)
   { if(document.AnnualRegForm.newBirthyearId[i].selected)
  { choseno=document.AnnualRegForm.newBirthyearId[i].value ;}}}

//============================for Gender===========================================

chosen="";
	len = document.AnnualRegForm.sexId.length ;
	for(i=0;i<len;i++)
	{
	if(document.AnnualRegForm.sexId[i].checked)
		{ chosen= document.AnnualRegForm.sexId[i].value; }
	}
	if(chosen=="")
	{
		alert("Select the Gender");
	 	 return false;
	}
//==============================For Address =================================
if(document.AnnualRegForm.newAddressId.value==""){
			alert("Address is not valid");
			document.AnnualRegForm.newAddressId.focus();
			return false;
		}
if(document.AnnualRegForm.newAddressId.value!=""){
			
	if((document.AnnualRegForm.newAddressId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newAddressId.value.indexOf(' ')==0)){
		alert("Address is not valid");
		document.AnnualRegForm.newAddressId.focus();
		return false;
		}	
		if(document.AnnualRegForm.newAddressId.value.length > 255){
			alert("Address is not valid");
			document.AnnualRegForm.newAddressId.focus();
			return false;
		}
	}
	
	
//================================= For Country ===================================
 
	var cdln = "";
	if(typeof(window.document.AnnualRegForm.newCountryId) == 'object'){
		if (window.document.AnnualRegForm.newCountryId.value != ""){
			var clid;
			clid = window.document.AnnualRegForm.newCountryId[window.document.AnnualRegForm.newCountryId.selectedIndex].value;
			cdln = clid;
		}
		if(cdln == "Select One"){
			alert("Please select the Country");
			window.document.AnnualRegForm.newCountryId.focus();
			return false;
		}
	}

	if(document.AnnualRegForm.newCountryId.selectedIndex == 0 ){
        alert ( "Please select the Country." );
		document.AnnualRegForm.newCountryId.focus();
        return false;
    }

//================================ For State ====================================

	var edln = "";
	if(typeof(window.document.AnnualRegForm.newStateId) == 'object'){
		if (window.document.AnnualRegForm.newStateId.value != ""){
			var lid;
			lid = window.document.AnnualRegForm.newStateId[window.document.AnnualRegForm.newStateId.selectedIndex].value;
			edln = lid;
		}
		if(edln.length == 1){
			alert("Please select the State.");
			window.document.AnnualRegForm.newStateId.focus();
			return false;
		}
	} 

	if ( document.AnnualRegForm.newStateId.selectedIndex == 0 ){
        alert ( "Please select the State Name." );
		document.AnnualRegForm.newStateId.focus();
        return false;
    }
//__________________________________________city___________________________________________________________________


	
	if(document.AnnualRegForm.newCityId.value=="")
	   {alert(" Enter City Name in New User Information ");
	     document.AnnualRegForm.newCityId.focus();
	    return false; }
	if(document.AnnualRegForm.newCityId.value!=""){
	if(document.AnnualRegForm.newCityId.value.indexOf(' ')==0)
	{alert("Enter City ");
	 document.AnnualRegForm.newCityId.focus();
	 return false; }
	
	if(isnotAlpha(document.AnnualRegForm.newCityId.value))
	{ alert("Enter Valid City in New User Information ");
	  document.AnnualRegForm.newCityId.focus();
	   return false; }
	if(Dospace(document.AnnualRegForm.newCityId.value))
	   { alert("Enter Valid City in New User Information");
	     document.AnnualRegForm.newCityId.focus();
	   return false; }
	if( document.AnnualRegForm.newCityId.value.length > 80 )
	   { alert("Enter within 80 characters for City in New User Information" );
	      document.AnnualRegForm.newCityId.focus();
      return false; }
	}
//___________________________________________________ZipCode_________________________________________________________

if(document.AnnualRegForm.newZipId.value==""){
		alert("Enter Zipcode in New User Information");
		document.AnnualRegForm.newZipId.focus();
		return false;
	}
	if(document.AnnualRegForm.newZipId.value!=""){
      if(!Number(document.AnnualRegForm.newZipId.value))
        {alert("Enter valid Zipcode in New User Information ");
        document.AnnualRegForm.newZipId.focus();
        return false;}
        if((document.AnnualRegForm.newZipId.value.length <5 ))
        {alert("Enter Valid Zipcode in New User Information");
         document.AnnualRegForm.newZipId.focus();
        return false;}
 
         if((document.AnnualRegForm.newZipId.value.length >6 ))
            {alert("Enter Valid Zipcode in New User Information");
            document.AnnualRegForm.newZipId.focus();
            return false;}
        if(Dospace(document.AnnualRegForm.newZipId.value))
 	   { alert("Enter Valid Zipcode in New User Information ");
 	     document.AnnualRegForm.newZipId.focus();
	   return false; }
	}
//--------------------------------------EMAIL---------------------------------------

 
if(document.AnnualRegForm.newEmailId.value=="")
 {alert("Enter your Email ID");
  document.AnnualRegForm.newEmailId.focus();
 return false;}
 
 if(!(document.AnnualRegForm.newEmailId.value== ""))
 { strmail=document.AnnualRegForm.newEmailId.value;
 firstat = strmail.indexOf("@");
 lastat = strmail.lastIndexOf("@");
 strmain=strmail.substring(0,firstat);
 strsub=strmail.substring(firstat,document.AnnualRegForm.newEmailId.value.length);
 if(strmail.length>120)
 {alert("Email is out of range");
  document.AnnualRegForm.newEmailId.focus();
 return false;}
 if(strmain.indexOf('  ')!=-1 || firstat==0 || strsub.indexOf(' ')!=-1 )
 {alert("Enter valid Email ");
  document.AnnualRegForm.newEmailId.focus();
 return false;}
 if(isnotSpecial(strmain) || isnotSpecial(strsub))
 {alert("Enter valid Email ");
  document.AnnualRegForm.newEmailId.focus();
 return false;}
 k=0;
 strlen=strsub.length;
 for(i=0;i<strlen-1;i++)
 { if(strsub.charAt(i)=='.')
 {k=k+1;}}
 if(k>2)
 {alert("Enter valid Email ");
  document.AnnualRegForm.newEmailId.focus();
 return false;}
 if(firstat==-1 || lastat==-1)
 {alert("Enter valid Email" );
  document.AnnualRegForm.newEmailId.focus();
 return false;}
 if(Number(strmain))
 {alert("Enter valid Email ");
  document.AnnualRegForm.newEmailId.focus();
  return false;}
 if(firstat != lastat )
 {alert("Enter valid Email ");
  document.AnnualRegForm.newEmailId.focus();
 return false;}
 firstdot=strmail.indexOf(".",firstat);
 lastdot=strmail.lastIndexOf(".");
 if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1)
 {alert("Enter valid Email ");
  document.AnnualRegForm.newEmailId.focus();
  return false;}
}

//----------------------IF ENTER PHONE ---------------------------------------

if(document.AnnualRegForm.newPhoneId.value=="")
{ alert("Enter Phone Number");
  document.AnnualRegForm.newPhoneId.focus();
  return false;}
  
  //--------------------------------PHONE NUMBER---------------------------------------


if(document.AnnualRegForm.newPhoneId.value!="")
{		var s1=document.AnnualRegForm.newPhoneId.value.indexOf('(');
		var s2=document.AnnualRegForm.newPhoneId.value.indexOf(')');
		var s5=document.AnnualRegForm.newPhoneId.value.indexOf('+');
		var s6=document.AnnualRegForm.newPhoneId.value.lastIndexOf('+');
		var s7=document.AnnualRegForm.newPhoneId.value.indexOf('-');
		var s8=document.AnnualRegForm.newPhoneId.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number");
			document.AnnualRegForm.newPhoneId.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number");
			document.AnnualRegForm.newPhoneId.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number");
			document.AnnualRegForm.newPhoneId.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number");
			document.AnnualRegForm.newPhoneId.focus();
			return false;
		}
																					  
 len7=document.AnnualRegForm.newPhoneId.value.length;
 strnum = document.AnnualRegForm.newPhoneId.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number");
 document.AnnualRegForm.newPhoneId.focus();
 return false;}
 if(document.AnnualRegForm.newPhoneId.value.length>40)
  {alert("Enter valid Phone Number");
  document.AnnualRegForm.newPhoneId.focus();
  return false;}
  
}
  
 //-----------------------------------------FAX--------------------------------
 

if(document.AnnualRegForm.newFaxId.value!="")
{		var s1=document.AnnualRegForm.newFaxId.value.indexOf('(');
		var s2=document.AnnualRegForm.newFaxId.value.indexOf(')');
		var s5=document.AnnualRegForm.newFaxId.value.indexOf('+');
		var s6=document.AnnualRegForm.newFaxId.value.lastIndexOf('+');
		var s7=document.AnnualRegForm.newFaxId.value.indexOf('-');
		var s8=document.AnnualRegForm.newFaxId.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax ");
			document.AnnualRegForm.newFaxId.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax ");
			document.AnnualRegForm.newFaxId.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax ");
			document.AnnualRegForm.newFaxId.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax ");
			document.AnnualRegForm.newFaxId.focus();
			return false;
		}

 len7=document.AnnualRegForm.newFaxId.value.length;
 strnum = document.AnnualRegForm.newFaxId.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax ");
 document.AnnualRegForm.newFaxId.focus();
 return false;}
 
 if(document.AnnualRegForm.newFaxId.value.length>40)
  {alert("Enter valid Fax ");
  document.AnnualRegForm.newFaxId.focus();
  return false;}
  if(isnotAlpha1(document.AnnualRegForm.newFaxId.value))
{ alert("Enter Valid Fax ");
  document.AnnualRegForm.newFaxId.focus();
   return false; }
  
 }
 	
}
//==========================================For Pony Club Details============================
chosen="";
	len = document.AnnualRegForm.pclub.length ;
	for(i=0;i<len;i++){
		if(document.AnnualRegForm.pclub[i].checked){
			chosen= document.AnnualRegForm.pclub[i].value;
		}
	}
//=============================for club memebr Id===================================
if(chosen=="yes"){
	if(document.AnnualRegForm.newClubId.value==""){
		alert("Club MemberId is Empty");
		document.AnnualRegForm.newClubId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubId.value!=""){
			if(isnotSpecial(document.AnnualRegForm.newClubId.value))
			{
				alert("Club MemberId is not valid");
				document.AnnualRegForm.newClubId.focus();
				return false;
			}
			if((document.AnnualRegForm.newClubId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubId.value.indexOf(' ')==0)){
		alert("Club MemberId is not valid");
		document.AnnualRegForm.newClubId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubId.value.length > 80){
			alert("Club MemberId is not valid");
			document.AnnualRegForm.newClubId.focus();
			return false;
		}
	}
//====================================for club member =========================================
	
if(document.AnnualRegForm.newClubNameId.value==""){
		alert("Club Member Name is Empty");
		document.AnnualRegForm.newClubNameId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubNameId.value!=""){
			if(isnotSpecial(document.AnnualRegForm.newClubNameId.value))
			{
				alert("Club Member Name is not valid");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
			if((document.AnnualRegForm.newClubNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubNameId.value.indexOf(' ')==0)){
		alert("Club Member Name is not valid");
		document.AnnualRegForm.newClubNameId.focus();
		return false;
		}
		if(document.AnnualRegForm.newClubNameId.value.length > 80){
			alert("Club Member Name is not valid");
			document.AnnualRegForm.newClubNameId.focus();
			return false;
		}
	}
	
}
//==================================== for Badge Information ====================================

if(document.AnnualRegForm.newBadgeId.value==""){
		alert("Badge Name cannot be Empty");
		document.AnnualRegForm.newBadgeId.focus();
		return false;
		}
		if(document.AnnualRegForm.newBadgeId.value!=""){
			if(isnotAlpha(document.AnnualRegForm.newBadgeId.value))
			{
				alert("Badge Name is not valid");
				document.AnnualRegForm.newBadgeId.focus();
				return false;
			}
			if((document.AnnualRegForm.newBadgeId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newBadgeId.value.indexOf(' ')==0)){
		alert("Badge Name is not valid");
		document.AnnualRegForm.newBadgeId.focus();
		return false;
		}
		if(document.AnnualRegForm.newBadgeId.value.length > 80){
			alert("Badge Name is not valid");
			document.AnnualRegForm.newBadgeId.focus();
			return false;
		}
	}

//=============================== for Registration Information =============================
if(document.AnnualRegForm.newRegTypeId.selectedIndex == 0){
			alert("Please Select the Registration Information");
			document.AnnualRegForm.newRegTypeId.focus();
			return false;
		}
//==================================for Special Accomodation Information======================
//==========================================For Pony Club Details============================
chosen="";
	len = document.AnnualRegForm.accom.length ;
	for(i=0;i<len;i++){
		if(document.AnnualRegForm.accom[i].checked){
			chosen= document.AnnualRegForm.accom[i].value;
		}
	}
	if (chosen=="yes1")
	if(document.AnnualRegForm.accomId.value == ""){
			alert("Special Accomodation Information cannot be Empty");
			document.AnnualRegForm.accomId.focus();
			return false;
		}
	if(document.AnnualRegForm.accomId.value != ""){
		if(document.AnnualRegForm.accomId.value.length >1024){
			alert("Special Accomodation Information is not valid");
			document.AnnualRegForm.accomId.focus();
			return false;
		}
	}
//========================================================================================
	return true;
}