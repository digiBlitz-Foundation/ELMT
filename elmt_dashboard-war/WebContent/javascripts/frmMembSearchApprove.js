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
//------------------for approval date------------------------------------------------------------------------

function isnotAlphaNumeric1(str){
stringAlphaNumCheck="!@#$%^&*()_+|<>?=~-`.,;:][{}"+"\\";
f3=1;
for(j=0;j<str.length;j++)
{if(stringAlphaNumCheck.indexOf(str.charAt(j))!=-1)
{f3=0;}}
if(f3==0)
{return true;
}
else{
return false;
}
}
//-----------------------------------
var dtCh= "/";
var minYear=1900;
var maxYear=2100;

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
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}
//------------------------for approvalDate --------
function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The Date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Enter a valid month in Approval Date ")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Enter a valid day in Approval Date")
		return false
	}
   if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Enter a valid Approval Date ")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear ){
		alert("Enter a valid year in Approval Date ")
		return false
	}
return true;
	}

//----------------
function myval()
{
	if(document.frmMembRegi.uStatusId.value==""){
		alert(" Select any Status ");
		document.frmMembRegi.uStatusId.focus();
		return false;
	}

if(document.frmMembRegi.approvalDate.value=="")
  { alert("Enter a Approval Date");
  document.frmMembRegi.approvalDate.focus();
  return false;
  }
 if(isnotAlphaNumeric1(document.frmMembRegi.approvalDate.value))
	{alert("Enter a valid Approval Date");
	 document.frmMembRegi.approvalDate.focus();
	 return false;
     }

if (isDate(document.frmMembRegi.approvalDate.value)==false){
			document.frmMembRegi.approvalDate.focus()
			return false; 
		}

return true;
}
