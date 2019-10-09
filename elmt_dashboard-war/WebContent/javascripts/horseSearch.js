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
//=========================== function for doublespace validation =============================
var str="";
function Dospace(str){
	if(str.indexOf("  ")!=-1){
		return true;
	}}

function showHide(chkBxNam,divId){
	if(document.forms['frmCreateServType'].elements[chkBxNam].checked == true){
			document.getElementById(divId).style.display = "block";	
	}else {
			document.getElementById(divId).style.display = "none";	
	} 
}

function showHideRadio(radioNam,divId,radVal){
	if(document.forms['frmCreateServType'].elements[radioNam].value == radVal){
			document.getElementById(divId).style.display = "block";	
	}
	else {
			document.getElementById(divId).style.display = "none";	
	} 
}
function showLevels(chkBxNam,divId){
		if(document.forms['frmCreateServType'].elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}
//========================Clearing Horse Details================================================
function clearHorseDetails(){
	
    document.frmCreateServType.horseName.value="";
	document.frmCreateServType.regiName.value="";
	document.frmCreateServType.pastName.value="";
	document.frmCreateServType.breedAsso.value="";
	document.frmCreateServType.prevRider.value="";
	document.frmCreateServType.yearFoaled.value="";
	//document.frmCreateServType.breed.value="";
	document.frmCreateServType.sireName.value="";
	document.frmCreateServType.damName.value="";
	
}


//========================== function for character validation ================================

function isHorseName(str){
	check="`~!@#$%^*()_+=|{}[];:/<>?"+"\\"+"\""+"\"";
	f1=1;
	for(j=0;j<str.length;j++){
		if(check.indexOf(str.charAt(j))!=-1){
			f1=0;}}
	if(f1==0){return true;}
	else{return false;}
}

function isOwnerName(str){
	check="`~!@#$%^&*()_+=|{}1234567890[];:/<>?"+"\\"+"\"";
	f1=1;
	for(j=0;j<str.length;j++){
		if(check.indexOf(str.charAt(j))!=-1){
			f1=0;}}
	if(f1==0){return true;}
	else{return false;}
}


//========================= function for pure Integer Numbers ===================================
function isnotInteger(str){
	stringIntCheck="0123456789 ";
	f2=1;
	for(j=0;j<str.length;j++){
		if(stringIntCheck.indexOf(str.charAt(j))==-1){
			f2=0;
		}
	}
	if(f2==0){
		return true;
	}
	else{
		return false;
	}
}

//========================================================================================================


function validate(){
	stringCheck="!@#$%^&*()_+`|<>?/=-~.,0123456789"+"\\";
	stringCheck2="!@#$%^&*()_+`|<>?/=-~.,"+"\\";
// function for triming the value
String.prototype.trim = function() {
return this.replace(/^\s+|\s+$/g,"");
}	
	var searchName=document.frmCreateServType.horseSearchName.value;
	var memID=document.frmCreateServType.memberId.value;
	var oName=document.frmCreateServType.ownerName.value;
	var rName=document.frmCreateServType.riderName.value;
	var oLastName=document.frmCreateServType.ownerLastName.value;
	var rLastName=document.frmCreateServType.riderLastName.value;
 
		if(searchName.trim()=="" &&
		   memID.trim()=="" &&
		   oLastName.trim() == "" &&
		   rLastName.trim() == "" &&
		   oName.trim()=="" &&
		   rName.trim()=="" ){
			alert("Enter any one of the Name");
			document.frmCreateServType.horseSearchName.focus();
			return false;
		}
		if(isHorseName(searchName.trim())){
			alert("Enter valid Horse Name");
			document.frmCreateServType.horseSearchName.focus();
			return false;
		}
		/*if((document.frmCreateServType.horseSearchName.value.indexOf('  ')!=-1)||(document.frmCreateServType.horseSearchName.value.indexOf(' ')==0)){
			alert("Enter valid Horse Name");
			document.frmCreateServType.horseSearchName.focus();
			return false;
		}*/
		if(searchName.trim().length>80){
			alert("Horse Name should not exceed 80 characters");
			document.frmCreateServType.horseSearchName.focus();
			return false;
		}
//==================================== For Member Id ===========================================		
		if(isnotInteger(memID.trim())){
			alert("Enter valid Horse Member Id");
			document.frmCreateServType.memberId.focus();
			return false;
		}
		if(memID.trim().length>20){
			alert("Horse Member Id should not exceed 20 characters");
			document.frmCreateServType.memberId.focus();
			return false;
		}
		
//==================================== For Rider Name ===========================================		
		if(isOwnerName(oName.trim())){
			alert("Enter valid Owner First Name");
			document.frmCreateServType.ownerName.focus();
			return false;
		}
		if(isOwnerName(oLastName.trim())){
			alert("Enter valid Owner Last Name");
			document.frmCreateServType.ownerLastName.focus();
			return false;
		}
		/*if((document.frmCreateServType.ownerName.value.indexOf('  ')!=-1)||(document.frmCreateServType.ownerName.value.indexOf(' ')==0)){
			alert("Enter valid  Owner Name");
			document.frmCreateServType.ownerName.focus();
			return false;
		}*/
		if(oName.trim().length>80){
			alert(" Owner First Name should not exceed 80 characters");
			document.frmCreateServType.ownerName.focus();
			return false;
		}
		if(oLastName.trim().length>80){
			alert(" Owner Last Name should not exceed 80 characters");
			document.frmCreateServType.ownerLastName.focus();
			return false;
		}
		if(isOwnerName(rName.trim())){
			alert("Enter valid Rider First Name");
			document.frmCreateServType.riderName.focus();
			return false;
		}
		if(isOwnerName(rLastName.trim())){
			alert("Enter valid Rider Last Name");
			document.frmCreateServType.riderLastName.focus();
			return false;
		}
		/*if((document.frmCreateServType.riderName.value.indexOf('  ')!=-1)||(document.frmCreateServType.riderName.value.indexOf(' ')==0)){
			alert("Enter valid Rider  Name");
			document.frmCreateServType.riderName.focus();
			return false;
		}*/
		if(rName.trim().length>80){
			alert("Rider First Name should not exceed 80 characters");
			document.frmCreateServType.riderName.focus();
			return false;
		}
	   if(rLastName.trim().length>80){
			alert("Rider Last Name should not exceed 80 characters");
			document.frmCreateServType.riderLastName.focus();
			return false;
		}
	return true;
}