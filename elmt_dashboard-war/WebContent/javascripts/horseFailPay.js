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
 
function showHideRadio(radioNam,divId,radVal){
		if(document.forms['myform'].elements[radioNam].value == radVal){
				document.getElementById(divId).style.display = "block";	
		}
		else {
				document.getElementById(divId).style.display = "none";	
		} 
}
//=========================== function for doublespace validation =============================
var str="";
function Dospace(str){
	if(str.indexOf("  ")!=-1){
		return true;
	}
	else{
		return false;
	}
}
function isPaymentName(str){
	check="`~!@#%^*()_+=|{}1234567890[];:/<>?"+"\\"+"\"";
	f1=1;
	for(j=0;j<str.length;j++){
		if(check.indexOf(str.charAt(j))!=-1){
			f1=0;}}
	if(f1==0){return true;}
	else{return false;}
}
//========================== function for character validation ================================
function isnotAlpha(str){
	stringCheck="!@#$%^&*()_+|<>?/=-~.,`0123456789;:][{}"+"\\"+"\'";
	f1=1;
	for(j=0;j<str.length;j++){
		if(stringCheck.indexOf(str.charAt(j))!=-1){
			f1=0;
		}
	}
	if(f1==0){
		return true;
	}
	else{
		return false;
	}
}
function isAlpha(str){
	stringCheck1="abcdefghijklmnopqrstuvwxyz";
	f1=1;
	for(j=0;j<str.length;j++){
		if(stringCheck1.indexOf(str.charAt(j))!=-1){
			f1=0;
		}
	}
	if(f1==0){
		return true;
	}
	else{
		return false;
	}
}

//========================= function for pure Integer Numbers ===================================
function isnotInteger(str){
	stringIntCheck="0123456789";
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

//======================== function for two decimal points ======================================
function isnotValidDecimal(str){
	if((str.indexOf("."))!=-1){
		fr1=str.indexOf('.');
		mm = (str.substring(fr1,str.length));
		strnum=(Number(mm.length));
		if(strnum>3){
			return true;
		}
		else{
			return false;
		}
	}
}
//======================= function for Alpha Numeric ============================================
function isnotAlphaNumeric(str){
	stringAlphaNumCheck="!@#$%^&*()_+|<>?/=-~.,;:][{}"+"\\"+"\'";
	f3=1;
	for(j=0;j<str.length;j++){
		if(stringAlphaNumCheck.indexOf(str.charAt(j))!=-1){
			f3=0;
		}
	}
	if(f3==0){
		return true;
	}
	else{
		return false;
	}
}

//========================== function for Special Character =====================================
function isnotSpecial(str){
	stringSpecialCheck="!#$%^&*()+|<>?/=-~,;:][{}"+"\\"+"\'";
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

function isnotZipcode(str){
	stringZip="0123456789";
	fzip=1;
	for(j=0;j<str.length;j++){
		if(stringZip.indexOf(str.charAt(j))!=-1){
			fzip=0;
		}
	}
	if(fzip==0){
		return false;
	}
	else{
	return true;
	}	
}

function isnotValidDecimal(str){
	if((str.indexOf("."))!=-1){
		fr1=str.indexOf('.');
		mm = (str.substring(fr1,str.length));
		strnum=(Number(mm.length));
		if(strnum>3){
			return true;
		}
		else{
			return false;
		}
	}
}

function isSpecialCharacter(str){
	stringCheck="!@#$%^&*()_+|:;{}[]<>?/=-~.,'`;:"+"\\"+"\'";
	f1=1;
	for(j=0;j<str.length;j++){
		if(stringCheck.indexOf(str.charAt(j))!=-1){
			f1=0;
		}
	}
	if(f1==0){
		return true;
	}
	else{
		return false;
	}
}


function checkClear(){
 
	document.myform.checkNumber.value="";
	document.myform.checkDate.value="";
	document.myform.bankName.value="";
	document.myform.nameCheck.value="";	
}

function cardClear(){
	document.myform.ccNumber.value="";
	document.myform.ccCvvid.value="";
	document.myform.ccType.selectedIndex=0;
	document.myform.ccName.value="";
	document.myform.ccExpMonth.selectedIndex=0;
	document.myform.ccExpYear.selectedIndex=0;
	var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getFullYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	if(nowDate<10){nowDate="0"+nowDate;}
	if(nowMonth<10){nowMonth="0"+nowMonth;}
	document.myform.checkDate.value = nowMonth+"/"+nowDate+"/"+nowYear;
}
 
function popupCal(val) {
      if(val==1)
	      document.myform.dateImported.value = "StartDate1";

      if(val==2)
         document.myform.checkDate.value = "StartDate1";
		 
     
      val = window.open("javascripts/calendar2.jsp?sDate=" + val ,'Calendar','width=170,height=190,menubar=no,toolbar=no,status=no,resizable=no,scrollbars=no,top=400,left=150');
      if(val == null) {
         alert("Plz Enable Site Popup Allowed");
      }
      
}

 

function myValidate(){

	stringCheck="!@#$%^&*()_+`|<>?/=-~.,0123456789"+"\\";
	stringCheck2="!@#$%^&*()_+`|<>?/=-~.,"+"\\";

//=========================================================Total Amount==========================================
if(document.myform.totalAmount.value==""){
			alert("Total Amount cannot be empty");
			document.myform.totalAmount.focus();
			return false;
		}



//================================== For Check & Card Option =======================
 sec="";
     sec =document.myform.c11.value;
	  if(sec=="adminSec"){
	chosen="";
	len = document.myform.r11.length ;
	for(i=0;i<len;i++){
		if(document.myform.r11[i].checked){
			chosen= document.myform.r11[i].value;
		}
	}
	if(chosen==""){
		alert("Check any of the Payment Option.");
		return false;
	}
//--------------------------Check  Number ---------------------------
	if(chosen=="check"){
		if(document.myform.checkNumber.value==""){
			alert("Check Number in Check Details cannot be empty");
			document.myform.checkNumber.focus();
			return false;
		}
		/*if(isAlpha(document.myform.checkNumber.value)){
			alert("Enter valid Check Number.");
			document.myform.checkNumber.focus();
			return false;
		}*/
		if(document.myform.checkNumber.value.length>16){
			alert("Check Number exceeds the maximum of 16 characters.");
			document.myform.checkNumber.focus();
			return false;
		}
		if(document.myform.checkNumber.value.indexOf('.')!=-1){
			alert("Enter Valid check number.");
			document.myform.checkNumber.focus();
			return false;
		}
	 
//=============================== For Check Date ========================
		if(document.myform.checkDate.value==""){
			alert("Select Date in Check Details");
			document.myform.checkDate.focus();
			return false;
		}
		if(document.myform.chkdate.value=="yes"){
		if((document.myform.checkDate.value!="") || (document.myform.checkDate.value.indexOf(' ')!=0)){
				dtStr = document.myform.checkDate.value;
				var daysInMonth = DaysArray(12);
				var pos1=dtStr.indexOf(dtCh);
				var pos2=dtStr.indexOf(dtCh,pos1+1);
				var strMonth=dtStr.substring(0,pos1);
				var strDay=dtStr.substring(pos1+1,pos2);
				var strYear=dtStr.substring(pos2+1);
				strYr=strYear;
				if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1);
				if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1);
				for (var i = 1; i <= 3; i++) {
				if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1);
				}
				month=parseInt(strMonth);
				day=parseInt(strDay);
				year=parseInt(strYr);
				if (pos1==-1 || pos2==-1){
				alert("The date format should be : mm/dd/yyyy");
				document.myform.checkDate.focus();
				return false;
				}
				if (strMonth.length<1 || month<1 || month>12){
				alert("Please enter a valid month");
				document.myform.checkDate.focus();
				return false;
				}
				if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
				alert("Please enter a valid day");
				document.myform.checkDate.focus();
				return false;
				}
				if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
				alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
				document.myform.checkDate.focus();
				return false;
				}
				if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
				alert("Please enter a valid date");
				document.myform.checkDate.focus();
				return false;
				}
		}
		}
//===================================In Favor Of====================================

		if(document.myform.bankName.value==""){
			alert("Bank Name cannot be empty.");
			document.myform.bankName.focus();
			return false;
		}
		if(document.myform.bankName.value.length>80){
			alert("Bank Name exceeds the range");
			document.myform.bankName.focus();
			return false;
		}
		if(isPaymentName(document.myform.bankName.value)){
			alert("Enter valid Bank Name");
			document.myform.bankName.focus();
			return false;
		}
		if(document.myform.bankName.value.indexOf(' ')==0){
				alert("Enter valid Bank Name");
			document.myform.bankName.focus();
			return false;
		}
		if(document.myform.bankName.value.indexOf('  ')!==-1){
			alert("Enter valid Bank Name");
			document.myform.bankName.focus();
			return false;

		}
		if(Number(document.myform.bankName.value)){
				alert("Enter valid Bank Name");
			document.myform.bankName.focus();
			return false;
		}

//===================================Name on Check====================================
		if(document.myform.nameCheck.value==""){
			alert("Name on Check cannot be empty.");
			document.myform.nameCheck.focus();
			return false;
		}
		if(document.myform.nameCheck.value.length>80){
			alert("Name on Check exceeds the range");
			document.myform.nameCheck.focus();
			return false;
		}
		if(isPaymentName(document.myform.nameCheck.value)){
			alert("Enter valid Name on Check");
			document.myform.nameCheck.focus();
			return false;
		}
		if(document.myform.nameCheck.value.indexOf(' ')==0){
				alert("Enter valid Name on Check");
			document.myform.nameCheck.focus();
			return false;
		}
		if(document.myform.nameCheck.value.indexOf('  ')!==-1){
				alert("Enter valid Name on Check");
			document.myform.nameCheck.focus();
			return false;
		}
		if(Number(document.myform.nameCheck.value)){
				alert("Enter valid Name on Check");
			document.myform.nameCheck.focus();
			return false;
		}
	}
	  }
//===========================card details=========================
// ======================= For Card No =============================
if(sec=="userSec" || (sec=="adminSec" && chosen=="card")){
	//alert(sec);
	//if(chosen=="card"){
		if (document.myform.ccType.selectedIndex == 0 ){
			alert ( "Please select card type." );
			document.myform.ccType.focus();
			return false;
		}
		if(document.myform.ccNumber.value==""){
			alert("Enter Credit Card Number ");
			document.myform.ccNumber.focus();
			return false;
		}
		if(document.myform.ccNumber.value.indexOf(' ')==0){
			alert("Empty space(s) are not allowed for Card Number.");
			document.myform.ccNumber.focus();
			return false;
		}
		if(document.myform.ccNumber.value.indexOf('  ')!==-1){
			alert("Empty space(s) are not allowed for Card Number.");
			document.myform.ccNumber.focus();
			return false;
		}
		if(!isnotAlpha(document.myform.ccNumber.value)){
			alert("Alphabets are not allowed.");
			document.myform.ccNumber.focus();
			return false;
		}
		if(isSpecialCharacter(document.myform.ccNumber.value)){
			alert("Special Characters are not allowed.");
			document.myform.ccNumber.focus();
			return false;
		}
		if(!Number(document.myform.ccNumber.value)){
			alert("Alphabets and Special Characters are not allowed.");
			document.myform.ccNumber.focus();
			return false;
		}
		
//===================== For card type ================
		if(document.myform.ccType.value=="American Express"){
			if(document.myform.ccNumber.value.length!=15){
				alert("Credit card number should be 15 Character");
				document.myform.ccNumber.focus();
				return false;
			}
	     }
		 else{
			if(document.myform.ccNumber.value.length!=16){
				alert("Credit card number should be 16 Character");
				document.myform.ccNumber.focus();
				return false;
			}
		 }
		if(document.myform.ccNumber.value.indexOf('.')!=-1){
			alert("Alphabets and special characters are not allowed.");
			document.myform.ccNumber.focus();
			return false;
		}

//--------for CVV Number -------------------------------------
		if(sec=="userSec"){			
				if(document.myform.ccCvvid.value==""){
						alert("Enter CVV Number in Card Details");
						document.myform.ccCvvid.focus();
						return false;
					}
				}

		if(document.myform.ccCvvid.value!=""){
			if(document.myform.ccCvvid.value.indexOf(' ')==0){
				alert("Empty space(s) are not allowed for CVV Number");
				document.myform.ccCvvid.focus();
				return false;
			}
			if(document.myform.ccCvvid.value.indexOf('  ')!==-1){
				alert("Empty space(s) are not allowed for CVV Number");
				document.myform.ccCvvid.focus();
				return false;
			}
			if(document.myform.ccCvvid.value.indexOf('.')!=-1){
				alert("Enter Valid CVV Number");
				document.myform.ccCvvid.focus();
				return false;
			}			
			if(isnotInteger(document.myform.ccCvvid.value)){
				alert("Enter Valid CVV Number");
				document.myform.ccCvvid.focus();
				return false;
			}
			if(document.myform.ccType.value=="American Express"){
			if(document.myform.ccCvvid.value.length!=4){
				alert("Enter valid CVV Number");
				document.myform.ccCvvid.focus();
				return false;
			}
			}
			if(document.myform.ccType.value=="Visa" || document.myform.ccType.value=="MasterCard"){
			if(document.myform.ccCvvid.value.length!=3){
				alert("Enter valid CVV Number");
				document.myform.ccCvvid.focus();
				return false;
			}
			}
			
		}

//----for Print Name on Card ----------------------------------------
		if(document.myform.ccName.value==""){
			alert("Print Name cannot be empty");
			document.myform.ccName.focus();
			return false;
		}
	
		if(document.myform.ccName.value.length>80){
			alert("Print Name exceeds the range");
			document.myform.ccName.focus();
			return false;
		}
	
		if(isPaymentName(document.myform.ccName.value)){
			alert("Enter valid Card Name.");
			document.myform.ccName.focus();
			return false;
		}
	
		if(Number(document.myform.ccName.value)){
			alert("Enter valid card name");
			document.myform.ccName.focus();
			return false;
		}
	
		if(document.myform.ccName.value.indexOf(' ')==0){
			alert("Enter Valid Card Name.");
			document.myform.ccName.focus();
			return false;
		}
	
		if(document.myform.ccName.value.indexOf('  ')!==-1){
			alert("Enter Valid Card Name.");
			document.myform.ccName.focus();
			return false;
		}

//---for Expiry month drop down --------------------------------

		var rightNow=new Date();
		var theYear=rightNow.getYear();
		var tMonth=rightNow.getMonth();
		var theMonth=1+tMonth;
		var theDate=rightNow.getDate();
	
		if ( document.myform.ccExpMonth.selectedIndex == 0 ){
			alert ( "Please select a Month." );
			document.myform.ccExpMonth.focus();
			return false;
		}
	
		if (document.myform.ccExpYear.value==theYear){
			 if(document.myform.ccExpMonth.value<theMonth){
				alert("You have selected an Expired Month in card details. Please Select Valid Expiration Month.");
				document.myform.ccExpMonth.focus();
				return(false);   
			}
		}

//-----------for Expiry Year drop down

		if(document.myform.ccExpYear.selectedIndex == 0 ){
			alert ( "Please select a year." );
			document.myform.ccExpYear.focus();
			return false;
		}
		
	
		if (document.myform.ccExpYear.value<theYear){
			alert("You have selected an Expired Year in card details. Please Select Valid Expiration Year.");
			document.myform.ccExpYear.focus();
			return false;   
		}
	//}
}
	//Date validation	
	if(document.myform.logby.value=="yes"){
		if((document.myform.activeDatVal.value!="")||(document.myform.activeDatVal.value.indexOf(' ')!=0)){
				dtStr = document.myform.activeDatVal.value;
				var daysInMonth = DaysArray(12);
				var pos1=dtStr.indexOf(dtCh);
				var pos2=dtStr.indexOf(dtCh,pos1+1);
				var strMonth=dtStr.substring(0,pos1);
				var strDay=dtStr.substring(pos1+1,pos2);
				var strYear=dtStr.substring(pos2+1);
				strYr=strYear;
				if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1);
				if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1);
				for (var i = 1; i <= 3; i++) {
				if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1);
				}
				month=parseInt(strMonth);
				day=parseInt(strDay);
				year=parseInt(strYr);
				if (pos1==-1 || pos2==-1){
				alert("The date format should be : mm/dd/yyyy");
				document.myform.activeDatVal.focus();
				return false;
				}
				if (strMonth.length<1 || month<1 || month>12){
				alert("Please enter a valid month");
				document.myform.activeDatVal.focus();
				return false;
				}
				if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
				alert("Please enter a valid day");
				document.myform.activeDatVal.focus();
				return false;
				}
				if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
				alert("Please enter a valid 4 digit year");
				document.myform.activeDatVal.focus();
				return false;
				}
				if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
				alert("Please enter a valid date");
				document.myform.activeDatVal.focus();
				return false;
				}
		}
	}
	return true;
}


function format(obj, decimal) {
	//alert("obj" +obj);
 //decimal  - the number of decimals after the digit from 0 to 3
//-- Returns the passed number as a string in the xxx,xxx.xx format.
	   anynum=eval(obj);
	   divider =10;
	   switch(decimal){
			case 0:
				divider =1;
				break;
			case 1:
				divider =10;
				break;
			case 2:
				divider =100;
				break;
			default:  	 //for 3 decimal places
				divider =1000;
		}

	   workNum=Math.abs((Math.round(anynum*divider)/divider));

	   workStr=""+workNum

	   if (workStr.indexOf(".")==-1){workStr+="."}

	   dStr=workStr.substr(0,workStr.indexOf("."));dNum=dStr-0
	   pStr=workStr.substr(workStr.indexOf("."))

	   while (pStr.length-1< decimal){pStr+="0"}

	   if(pStr =='.') pStr ='';

	   //--- Adds a comma in the thousands place.    
	   if (dNum>=1000) {
		  dLen=dStr.length
		  dStr=parseInt(""+(dNum/1000))+","+dStr.substring(dLen-3,dLen)
	   }

	   //-- Adds a comma in the millions place.
	   if (dNum>=1000000) {
		  dLen=dStr.length
		  dStr=parseInt(""+(dNum/1000000))+","+dStr.substring(dLen-7,dLen)
	   }
	   retval = dStr + pStr
	   //-- Put numbers in parentheses if negative.
	   if (anynum<0) {retval="("+retval+")";}

	  
	//You could include a dollar sign in the return value.
	  //retval =  "$"+retval
	  //alert("retval" + retval);
	  return retval;
 }
 
//Date Validation

var dtCh= "/";
var minYear=1900;
var maxYear=2500;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31;
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30;}
		if (i==2) {this[i] = 29;}
   } 
   return this;
}