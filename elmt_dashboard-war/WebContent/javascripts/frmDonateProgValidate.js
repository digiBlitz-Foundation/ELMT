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
var sum;
function MemberIdSelect(){
	    if(document.frmDonateProg.selectmemType.selectedIndex!=0)
		document.frmDonateProg.memid.disabled=false;
		else
		document.frmDonateProg.memid.disabled=true;
		}
		
/*		
function donationSelect(){
		if(document.frmDonateProg.donAmt_sel.selectedIndex!=0)
		document.frmDonateProg.donAmnt_txt.disabled=false;
		else
		document.frmDonateProg.donAmnt_txt.disabled=true;
		}*/
//-----------------------------------------------------------------------------------------------
//-------------------------for Total Amount field-----------------------------
function Sumup(){
	sum=0;
	sum=Number(document.frmDonateProg.amount_txt.value)+sum;
	
	chbxnum2=document.frmDonateProg.donCbxCt.value;
    //alert(chbxnum2);
	for(i=0;i<chbxnum2;i++)
	{ chbxname = "donCb"+i;
	  txtname="donTb"+i;
	  //alert(chbxname); 
	  if(document.getElementById(''+chbxname).checked)
	  {  var txtval= document.getElementById(''+txtname).value;
	     sum= Number(txtval) +sum;
	  }
	}
	
	/*if(document.frmDonateProg.donAmt_sel.selectedIndex!=0)
	{if(document.frmDonateProg.donAmt_sel.value==5)
	 {sum = 5+sum;}
	 else if(document.frmDonateProg.donAmt_sel.value==10)
	 {sum= 10 + sum;}
	 else if(document.frmDonateProg.donAmt_sel.value==15)
	 {sum = 15 + sum;}
	  else if(document.frmDonateProg.donAmt_sel.value==20)
	 {sum = 20 + sum;}
	 else if(document.frmDonateProg.donAmt_sel.value==25)
	 {sum = 25 +sum;}
	 else if(document.frmDonateProg.donAmt_sel.value=="Others")
	 {sum = Number(document.frmDonateProg.donAmnt_txt.value)+ sum;}
	}
	if(document.frmDonateProg.selectmail.selectedIndex!=0)
 	{sum = Number(document.frmDonateProg.amountTwo_txt.value)+sum;}
	
	if(document.frmDonateProg.memTyp_sel.selectedIndex==2 || document.frmDonateProg.memTyp_sel.selectedIndex==6 )
	{sum= Number(document.frmDonateProg.famAdd_sel.value) * Number(document.frmDonateProg.addOnAmount.value) + sum;}
	
	/*var cbxct=document.frmDonateProg.cbxct.value
	
	for(i=0;i<cbxct;i++)
	{
		var cxname="document.frmDonateProg.cbx+i.checked";alert();
	if(document.frmDonateProg.cbx+i.checked)
	{
		sum=50+sum	;
	}
	
	}*/
	/*var val=document.frmDonateProg.memTyp_sel.value;
	sp=val.split("#");
		//alert(sp[1]);
	if(sp[1]!="Life Member" && sp[1]!="Full Member")
	{
		f = document.forms['frmDonateProg'].elements;	
		
		for(v=0 ; v< f.length; v++){
		if(f[v].type == "checkbox"){
			f[v].checked=false;
		}
		}
		
	}*/
	
	/* ====================== for renewal family addon chk bx price calc block =========== 
	
	var chkValue = "";
	e = document.forms['frmDonateProg'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
			//var chkBoxNameChk = e[i].value.substring(e[i].value.length-3,e[i].value.length);
			//alert(chkBoxNameChk);
			 if(e[i].checked == true) {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}*/
	//alert(count);
	var addonamt=document.frmDonateProg.addOnAmount.value;
	
	//alert(addonamt);
		
	//var tot=0;
	//tot=count*addonamt;
	//alert(tot);
	
	
	var ctryAmt=document.frmDonateProg.ctryAmt.value;//alert(Number(ctryAmt));
	sum=sum+Number(ctryAmt);
	
	var conval=document.frmDonateProg.memTyp_sel.value;//alert(conval);
	if(document.frmDonateProg.memTyp_sel.selectedIndex!=0)
	{
	spval=conval.split("#");
	//alert(spval[1]);
	
	if(spval[1]=="Full Member" || spval[1]=="Life Member")
	{//alert("inside");
		var famMemb=document.frmDonateProg.famMemb.value;
		sum=sum+famMemb*addonamt;
	}
	}
		//sum=sum+tot;
	document.frmDonateProg.totalAmount.value= sum;
	//alert("sum:"+sum);
}
//--------------------------------------------------------------------------------
//-------------------function for character validation--------------------
function isnotAlpha(str){
stringCheck="!@#$%^&*()_+|<>?/=-~.,`0123456789;:][{}"+"\\"+"\'";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
   { f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}
//---------------------------------------------------------------------------------------	
//------------------------------------------------------------------------------------------
//------------------------function for Alpha Numeric
function isnotAlphaNumeric(str){
stringAlphaNumCheck="!@#$%^&*()_+|<>?/=-~.,;:][{}"+"\\"+"\'";
f3=1;
for(j=0;j<str.length;j++)
{if(stringAlphaNumCheck.indexOf(str.charAt(j))!=-1)
{f3=0;}}
if(f3==0)
{return true;}else{return false;}
}
//----------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------
//--------------------------------function for Valid Email
function isnotVlaidEmail(str){
			 strmail=str;
			 firstat = strmail.indexOf("@");
			 lastat = strmail.lastIndexOf("@");
			 strmain=strmail.substring(0,firstat);
			 strsub=strmail.substring(firstat,str.length);
			 flag=false;
			 if(strmail.length>120)
			 { flag=true;alert("1");}
			 if(strmain.indexOf('  ')!=-1 || firstat==0 || firstat!=lastat || strsub.indexOf(' ')!=-1 )
			 {flag=true;}

			stringMailCheck1="!#$%^&*()_+|<>?/=-~,;:][{}"+"\\"+"\'"+"\"";
			f3=1;
			for(j=0;j<strsub.length;j++)
			{if(stringMailCheck1.indexOf(strsub.charAt(j))!=-1)
			{f3=0;}}
			if(f3==0)
			{flag=true;}

			stringMailCheck2="!@#$%^&*()+|<>?/=-~,;:][{}"+"\\"+"\'"+"\"";
			f4=1;
			for(j=0;j<strmain.length;j++)
			{if(stringMailCheck2.indexOf(strmain.charAt(j))!=-1)
			{f4=0;}}
			if(f4==0)
			{flag=true;}
			
			 k=0;
			 strlen=strsub.length;
			 for(i=0;i<strlen-1;i++)
			 { if(strsub.charAt(i)=='.')
			 {k=k+1;}}
			 if(k>2)
			 { flag=true;}
			 if(firstat==-1 || lastat==-1)
			 {flag=true;}
			 if(Number(strmain))
			 {flag=true;}
			 if(firstat != lastat )
			 {flag=true;}
			 firstdot=strmail.indexOf(".",firstat);
			 lastdot=strmail.lastIndexOf(".");
			 if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1)
			 {flag=true;}
			
			return flag;
}
//-----------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//-----------------------function for pure Integer Numbers
function isnotInteger(str){
stringIntCheck="0123456789";
f2=1;
for(j=0;j<str.length;j++)
{ if(stringIntCheck.indexOf(str.charAt(j))==-1)
 {f2=0;}}
if(f2==0)
{return true;} else { return false;}
}
//-----------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
//-------------for dynamic value to textbox
//---------------------------------------------------------------------------------
function checkclear(){
document.frmDonateProg.txtChNumber.value="";
document.frmDonateProg.checkDate.value="";
document.frmDonateProg.inFavorof.value="";
}

function cardclear(){
document.frmDonateProg.ccTypeId.selectedIndex=0;
document.frmDonateProg.txtCard.value="";
document.frmDonateProg.txtCvvId.value="";
document.frmDonateProg.txtPrName.value="";
document.frmDonateProg.selExpMonthId.selectedIndex=0;
document.frmDonateProg.selExpYearId.selectedIndex=0;
}
//-----------------------------------------------------------------------------------------------
//---------------------------------function for Family Member Add On------------------------
function MemberoneValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member One-----------
	 if(document.frmDonateProg.selectSalute1.selectedIndex==0)
	 {alert("Select a salutation in Family Member one");
	 document.frmDonateProg.selectSalute1.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmDonateProg.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(document.frmDonateProg.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if((document.frmDonateProg.firstname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmDonateProg.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if((document.frmDonateProg.middlename1.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmDonateProg.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(document.frmDonateProg.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if((document.frmDonateProg.lastname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	 if(document.frmDonateProg.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmDonateProg.suffix1.focus();
	return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmDonateProg.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmDonateProg.selectDay1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmDonateProg.selectYear1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmDonateProg.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmDonateProg.gender1[i1].checked)
		{	chosen1= document.frmDonateProg.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone1.value=="" && document.frmDonateProg.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmDonateProg.phone2.value!="")
{		var s1=document.frmDonateProg.phone1.value.indexOf('(');
		var s2=document.frmDonateProg.phone1.value.indexOf(')');
		var s5=document.frmDonateProg.phone1.value.indexOf('+');
		var s6=document.frmDonateProg.phone1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone1.value.indexOf('-');
		var s8=document.frmDonateProg.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone1.value.length;
 strnum = document.frmDonateProg.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmDonateProg.phone1.focus();
 return false;}
 if(document.frmDonateProg.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
if(isnotInteger(document.frmDonateProg.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmDonateProg.mobile1.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax1.value.indexOf('(');
		var s2=document.frmDonateProg.fax1.value.indexOf(')');
		var s5=document.frmDonateProg.fax1.value.indexOf('+');
		var s6=document.frmDonateProg.fax1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax1.value.indexOf('-');
		var s8=document.frmDonateProg.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}

 len7=document.frmDonateProg.fax1.value.length;
 strnum = document.frmDonateProg.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmDonateProg.fax1.focus();
 return false;}
 
 if(document.frmDonateProg.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmDonateProg.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmDonateProg.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	 
return true;
}
function MembertwoValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member two-----------
	 if(document.frmDonateProg.selectSalute2.selectedIndex==0)
	 {alert("Select a salutation in Family Member two");
	 document.frmDonateProg.selectSalute2.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

	if(document.frmDonateProg.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(document.frmDonateProg.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if((document.frmDonateProg.firstname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmDonateProg.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if((document.frmDonateProg.middlename2.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmDonateProg.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(document.frmDonateProg.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if((document.frmDonateProg.lastname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmDonateProg.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");
	 document.frmDonateProg.suffix2.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	if((document.frmDonateProg.suffix2.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmDonateProg.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmDonateProg.selectDay2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmDonateProg.selectYear2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmDonateProg.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmDonateProg.gender2[i2].checked)
		{	chosen2= document.frmDonateProg.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmDonateProg.phone2.value=="" && document.frmDonateProg.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmDonateProg.phone2.value!="")
{		var s1=document.frmDonateProg.phone2.value.indexOf('(');
		var s2=document.frmDonateProg.phone2.value.indexOf(')');
		var s5=document.frmDonateProg.phone2.value.indexOf('+');
		var s6=document.frmDonateProg.phone2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone2.value.indexOf('-');
		var s8=document.frmDonateProg.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone2.value.length;
 strnum = document.frmDonateProg.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmDonateProg.phone2.focus();
 return false;}
 if(document.frmDonateProg.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
if(isnotInteger(document.frmDonateProg.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmDonateProg.mobile2.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax2.value.indexOf('(');
		var s2=document.frmDonateProg.fax2.value.indexOf(')');
		var s5=document.frmDonateProg.fax2.value.indexOf('+');
		var s6=document.frmDonateProg.fax2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax2.value.indexOf('-');
		var s8=document.frmDonateProg.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}

 len7=document.frmDonateProg.fax2.value.length;
 strnum = document.frmDonateProg.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmDonateProg.fax2.focus();
 return false;}
 
 if(document.frmDonateProg.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmDonateProg.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmDonateProg.email2.value=="")
	{alert("Enter Email in Family Member two");
	 document.frmDonateProg.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email2.value))
	{alert("Enter a valid Email in Family Member two");
	 document.frmDonateProg.email2.focus();
	 return false;}
return true;
}
//----------------------------------------------------------------------------------------

function MemberthreeValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member three-----------
	 if(document.frmDonateProg.selectSalute3.selectedIndex==0)
	 {alert("Select a salutation in Family Member three");
	 document.frmDonateProg.selectSalute3.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member three--------

	if(document.frmDonateProg.firstname3.value=="")
	{alert("Enter First Name of Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if(document.frmDonateProg.firstname3.value.length>80)
	{alert("Enter valid First Name of Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname3.value))
	{alert("Enter a valid First Name in Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if((document.frmDonateProg.firstname3.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member three-------------------------------------
	if(document.frmDonateProg.middlename3.value.length>80)
	{alert("Enter Middle Name of Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename3.value))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
	if((document.frmDonateProg.middlename3.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member three------------------------
	if(document.frmDonateProg.lastname3.value=="")
	{alert("Enter Last Name of Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if(document.frmDonateProg.lastname3.value.length>80)
	{alert("Enter valid Last Name of Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname3.value))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if((document.frmDonateProg.lastname3.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}

//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member three-----------------------
	/*if(document.frmDonateProg.suffix3.value=="")
	{alert("Enter Suffix in Family Member three");
	 document.frmDonateProg.suffix3.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix3.value.length>80)
	{alert("Enter valid Suffix of Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix3.value))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}
	if((document.frmDonateProg.suffix3.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member three-----------
	if(document.frmDonateProg.selectMonth3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectMonth3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member three-----------
	if(document.frmDonateProg.selectDay3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectDay3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member three-----------
	if(document.frmDonateProg.selectYear3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectYear3.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member three--------------------------
	chosen3="";
	len3 = document.frmDonateProg.gender3.length ;
	for(i3=0;i3<len3;i3++){
		if(document.frmDonateProg.gender3[i3].checked)
		{	chosen3= document.frmDonateProg.gender3[i3].value;	}	}

	if(chosen3=="")
	{	alert("Check any of Gender Option in Family Member three.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone3.value=="" && document.frmDonateProg.mobile3.value=="" )
{ alert("Enter a Contact Number in Family Member three");
  document.frmDonateProg.phone3.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member three --------------


if(document.frmDonateProg.phone3.value!="")
{		var s1=document.frmDonateProg.phone3.value.indexOf('(');
		var s2=document.frmDonateProg.phone3.value.indexOf(')');
		var s5=document.frmDonateProg.phone3.value.indexOf('+');
		var s6=document.frmDonateProg.phone3.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone3.value.indexOf('-');
		var s8=document.frmDonateProg.phone3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone3.value.length;
 strnum = document.frmDonateProg.phone3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member three");
 document.frmDonateProg.phone3.focus();
 return false;}
 if(document.frmDonateProg.phone3.value.length>40)
  {alert("Enter valid Phone Number in Family Member three");
  document.frmDonateProg.phone3.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member three----------------
if(isnotInteger(document.frmDonateProg.mobile3.value))
{alert("Enter a valid Mobile Number in Family Member three.");
document.frmDonateProg.mobile3.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax3.value.indexOf('(');
		var s2=document.frmDonateProg.fax3.value.indexOf(')');
		var s5=document.frmDonateProg.fax3.value.indexOf('+');
		var s6=document.frmDonateProg.fax3.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax3.value.indexOf('-');
		var s8=document.frmDonateProg.fax3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}

 len7=document.frmDonateProg.fax3.value.length;
 strnum = document.frmDonateProg.fax3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member three");
 document.frmDonateProg.fax3.focus();
 return false;}
 
 if(document.frmDonateProg.fax3.value.length>40)
  {alert("Enter valid Fax in Family Member three");
  document.frmDonateProg.fax3.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member three-------------------------
	if(document.frmDonateProg.email3.value=="")
	{alert("Enter Email in Family Member three");
	 document.frmDonateProg.email3.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email3.value))
	{alert("Enter a valid Email in Family Member three");
	 document.frmDonateProg.email3.focus();
	 return false;}
return true;
}
function MemberfourValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member four-----------
	 if(document.frmDonateProg.selectSalute4.selectedIndex==0)
	 {alert("Select a salutation in Family Member four");
	 document.frmDonateProg.selectSalute4.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member four--------

	if(document.frmDonateProg.firstname4.value=="")
	{alert("Enter First Name of Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
	if(document.frmDonateProg.firstname4.value.length>80)
	{alert("Enter valid First Name of Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname4.value))
	{alert("Enter a valid First Name in Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
	if((document.frmDonateProg.firstname4.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname4.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member four-------------------------------------
	if(document.frmDonateProg.middlename4.value.length>80)
	{alert("Enter Middle Name of Family Member four");
	document.frmDonateProg.middlename4.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename4.value))
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmDonateProg.middlename4.focus();
	return false;}
	if((document.frmDonateProg.middlename4.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmDonateProg.middlename4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member four------------------------
	if(document.frmDonateProg.lastname4.value=="")
	{alert("Enter Last Name of Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
	if(document.frmDonateProg.lastname4.value.length>80)
	{alert("Enter valid Last Name of Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname4.value))
	{alert("Enter a valid Last Name in Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
	if((document.frmDonateProg.lastname4.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member four-----------------------
	/*if(document.frmDonateProg.suffix4.value=="")
	{alert("Enter Suffix in Family Member four");
	 document.frmDonateProg.suffix4.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix4.value.length>80)
	{alert("Enter valid Suffix of Family Member four");
	document.frmDonateProg.suffix4.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix4.value))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmDonateProg.suffix4.focus();
	return false;}
	if((document.frmDonateProg.suffix4.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmDonateProg.suffix4.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member four-----------
	if(document.frmDonateProg.selectMonth4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmDonateProg.selectMonth4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member four-----------
	if(document.frmDonateProg.selectDay4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmDonateProg.selectDay4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member four-----------
	if(document.frmDonateProg.selectYear4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmDonateProg.selectYear4.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member four--------------------------
	chosen4="";
	len4 = document.frmDonateProg.gender4.length ;
	for(i4=0;i4<len4;i4++){
		if(document.frmDonateProg.gender4[i4].checked)
		{	chosen4= document.frmDonateProg.gender4[i4].value;	}	}

	if(chosen4=="")
	{	alert("Check any of Gender Option in Family Member four.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone4.value=="" && document.frmDonateProg.mobile4.value=="" )
{ alert("Enter a Contact Number in Family Member four");
  document.frmDonateProg.phone4.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member four --------------


if(document.frmDonateProg.phone4.value!="")
{		var s1=document.frmDonateProg.phone4.value.indexOf('(');
		var s2=document.frmDonateProg.phone4.value.indexOf(')');
		var s5=document.frmDonateProg.phone4.value.indexOf('+');
		var s6=document.frmDonateProg.phone4.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone4.value.indexOf('-');
		var s8=document.frmDonateProg.phone4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone4.value.length;
 strnum = document.frmDonateProg.phone4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member four");
 document.frmDonateProg.phone4.focus();
 return false;}
 if(document.frmDonateProg.phone4.value.length>40)
  {alert("Enter valid Phone Number in Family Member four");
  document.frmDonateProg.phone4.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member four----------------
if(isnotInteger(document.frmDonateProg.mobile4.value))
{alert("Enter a valid Mobile Number in Family Member four.");
document.frmDonateProg.mobile4.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax4.value.indexOf('(');
		var s2=document.frmDonateProg.fax4.value.indexOf(')');
		var s5=document.frmDonateProg.fax4.value.indexOf('+');
		var s6=document.frmDonateProg.fax4.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax4.value.indexOf('-');
		var s8=document.frmDonateProg.fax4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;
		}

 len7=document.frmDonateProg.fax4.value.length;
 strnum = document.frmDonateProg.fax4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member four");
 document.frmDonateProg.fax4.focus();
 return false;}
 
 if(document.frmDonateProg.fax4.value.length>40)
  {alert("Enter valid Fax in Family Member four");
  document.frmDonateProg.fax4.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member four-------------------------
	if(document.frmDonateProg.email4.value=="")
	{alert("Enter Email in Family Member four");
	 document.frmDonateProg.email4.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email4.value))
	{alert("Enter a valid Email in Family Member four");
	 document.frmDonateProg.email4.focus();
	 return false;}
return true;
}
	 
function clrAmt()
{
	document.frmDonateProg.amountTwo_txt.value=0;	
}
	 
function myvalidate(){
//-----------------------------------------------------------------------------------------
//--------------------------for Membership Type Select

	if(document.frmDonateProg.memTyp_sel.selectedIndex==0)
	{alert("Select any of the Membership Type");
	document.frmDonateProg.memTyp_sel.focus();
	return false;}
	
	//---------------------for Family Member ------------------------------------------
	
	/*var mem=document.frmDonateProg.memTyp_sel.value;
	seltyp=mem.split("#");
	var selec=seltyp[1];
	alert(selec);
	
	if(selec=="Family Member")
	{if(document.frmDonateProg.memberid.value=="" && document.frmDonateProg.memberid.indexOf(" ")==0)
	{alert("Enter Member Id ");
	 document.frmDonateProg.memberid.focus();
	 return false;
	 }
	}
	 if(isnotAlphaNumeric(document.frmDonateProg.memberid.value))
	{alert("Enter valid Member Id ");
	 document.frmDonateProg.memberid.focus();
	 return false;}
	if(document.frmDonateProg.memberid.value.length>80)
	{alert("Enter valid Member Id ");
	 document.frmDonateProg.memberid.focus();
	 return false;}
	
	}*/
	
	//--------------------------for non hlc  Membership Id  
    chbxnum1=document.frmDonateProg.orgCbxCt.value;
   for(i=0;i<chbxnum1;i++)
	{ chbxname = "orgNameCbx"+i;
	  txtname="orgNameTxtId"+i;
	  //alert(chbxname); 
	  if(document.getElementById(''+chbxname).checked)
	  {  var txtval= document.getElementById(''+txtname).value;
		/* if(txtval=="" ||txtval==0)
		  {alert("Enter the Non HLC Organization Member Id");
		  document.getElementById(''+txtname).focus();
		  return false;}*/
		  /*alert(document.getElementById(''+txtname).length);
		  if(document.getElementById(''+txtname).length>20)
		  {
			  alert("Non HLC Organization Member Id exceeds the Range");
		  	  document.getElementById(''+txtname).focus();
			  return false;
		  
		  }*/
		 // alert(chbxname);
		
	  }
	  //return false;
	}
	
	
	//------------------------------for Donation Amount
	
	
	  chbxnum2=document.frmDonateProg.donCbxCt.value;
    //alert(chbxnum2);
	for(i=0;i<chbxnum2;i++)
	{ chbxname = "donCb"+i;
	  txtname="donTb"+i;
	  //alert(chbxname); 
	  if(document.getElementById(''+chbxname).checked)
	  {  var txtval= document.getElementById(''+txtname).value;
		 if(txtval=="" ||txtval==0)
		  {alert("Enter the Donation Amount");
		  document.getElementById(''+txtname).focus();
		  return false;}
		 // alert(chbxname);
		 if(!Number(txtval))
		 {alert("Enter valid Donation Amount");
		  document.getElementById(''+txtname).focus();
		  return false;}
		  
	  }
	  // return false;
	}
	
//-----------------------------------------------------------------------------------------
//--------------------------for Membership Id  

/*	if(document.frmDonateProg.selectmemType.selectedIndex!=0)
	{if(document.frmDonateProg.memid.value=="")
	{alert("Enter a MemberID");
	document.frmDonateProg.memid.focus();
	return false;} }
	//alert(document.frmDonateProg.famAdd_sel.value);*/
	
	//---------------------for don amt others ------------------------------------------
	/*if(document.frmDonateProg.donAmt_sel.value=="Others")
	{
		if(document.frmDonateProg.otherdon.value=="" || document.frmDonateProg.otherdon.value==0)
		{
			alert("Enter A Donation Amount");
			document.frmDonateProg.otherdon.focus();
			return false;
		}
	}*/
	
	
	//-------------------------- for family member parent id ---------------------
	
	//alert(document.frmDonateProg.memTyp_sel.value);
	var conval=document.frmDonateProg.memTyp_sel.value;
	spval=conval.split("#");
	//alert(spval[1]);
	
	if(spval[1]=="Family Member")
	{//alert("inside");
		if(document.frmDonateProg.memberid.value=="")
		{
			alert("Enter the Parent Id");
			document.frmDonateProg.memberid.focus();
			return false;
		}
		
		if(document.frmDonateProg.memberid.value.indexOf(' ')==0)
		{
			alert("Enter a valid Parent Id");
			document.frmDonateProg.memberid.focus();
			return false;
		}
	}
	
//========================================================================================================
//===============================for One Family Member Add on
	if(document.frmDonateProg.famAdd_sel.value == 1)
	{

//------------------------for Registry Option in Family Member One--------------------------
	/*chosenmem1="";
	lenmem1 = document.frmDonateProg.famUser1.length ;
	for(i1=0;i1<lenmem1;i1++){
		if(document.frmDonateProg.famUser[i1].checked)
		{	chosen1= document.frmDonateProg.famUser[i1].value;	}	}

	if(chosenmem1=="")
	{	alert("Check the registration Option in Family Member One.");
		return false; }*/
	/*if(chosenmem1=="no")
	{ */
	//alert(document.frmDonateProg.famUser1[1].checked);
	if(document.frmDonateProg.famUser1[1].checked==true)
	{ 
//--------------------------------for First Name in Family Member One--------

	if(document.frmDonateProg.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(document.frmDonateProg.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if((document.frmDonateProg.firstname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmDonateProg.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if((document.frmDonateProg.middlename1.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmDonateProg.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(document.frmDonateProg.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if((document.frmDonateProg.lastname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	 if(document.frmDonateProg.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmDonateProg.suffix1.focus();
	return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmDonateProg.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmDonateProg.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmDonateProg.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmDonateProg.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmDonateProg.gender1[i1].checked)
		{	chosen1= document.frmDonateProg.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone1.value=="" && document.frmDonateProg.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmDonateProg.phone1.value!="")
{		var s1=document.frmDonateProg.phone1.value.indexOf('(');
		var s2=document.frmDonateProg.phone1.value.indexOf(')');
		var s5=document.frmDonateProg.phone1.value.indexOf('+');
		var s6=document.frmDonateProg.phone1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone1.value.indexOf('-');
		var s8=document.frmDonateProg.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone1.value.length;
 strnum = document.frmDonateProg.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmDonateProg.phone1.focus();
 return false;}
 if(document.frmDonateProg.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
if(isnotInteger(document.frmDonateProg.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmDonateProg.mobile1.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax1.value.indexOf('(');
		var s2=document.frmDonateProg.fax1.value.indexOf(')');
		var s5=document.frmDonateProg.fax1.value.indexOf('+');
		var s6=document.frmDonateProg.fax1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax1.value.indexOf('-');
		var s8=document.frmDonateProg.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}

 len7=document.frmDonateProg.fax1.value.length;
 strnum = document.frmDonateProg.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmDonateProg.fax1.focus();
 return false;}
 
 if(document.frmDonateProg.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmDonateProg.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmDonateProg.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	 
	 //-------------------for User Name in Family Member One ----
/*alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}

if(document.frmDonateProg.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName1.value)|| document.frmDonateProg.loginName1.value.length > 25 || document.frmDonateProg.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmDonateProg.loginName1.focus();
 return false;}*/

	}
	
	if(document.frmDonateProg.famUser1[0].checked==true)
	{ if(document.frmDonateProg.userNameId1.value=="" || document.frmDonateProg.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmDonateProg.userNameId1.focus();
	
	   return false;}
	}
	
	}
	
	
//--------------------------------------------------------------------------------
//-----------------------for two Members Add on------------------------
if(document.frmDonateProg.famAdd_sel.value == 2)
	{
	//------------------------------------------------------------------------------------------

	if(document.frmDonateProg.famUser1[1].checked==true)
	{

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmDonateProg.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(document.frmDonateProg.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if((document.frmDonateProg.firstname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmDonateProg.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if((document.frmDonateProg.middlename1.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmDonateProg.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(document.frmDonateProg.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if((document.frmDonateProg.lastname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	
	 if(document.frmDonateProg.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmDonateProg.suffix1.focus();
	return false;}
	
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmDonateProg.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmDonateProg.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmDonateProg.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmDonateProg.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmDonateProg.gender1[i1].checked)
		{	chosen1= document.frmDonateProg.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone1.value=="" && document.frmDonateProg.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmDonateProg.phone1.value!="")
{		var s1=document.frmDonateProg.phone1.value.indexOf('(');
		var s2=document.frmDonateProg.phone1.value.indexOf(')');
		var s5=document.frmDonateProg.phone1.value.indexOf('+');
		var s6=document.frmDonateProg.phone1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone1.value.indexOf('-');
		var s8=document.frmDonateProg.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone1.value.length;
 strnum = document.frmDonateProg.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmDonateProg.phone1.focus();
 return false;}
 if(document.frmDonateProg.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
if(isnotInteger(document.frmDonateProg.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmDonateProg.mobile1.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax1.value.indexOf('(');
		var s2=document.frmDonateProg.fax1.value.indexOf(')');
		var s5=document.frmDonateProg.fax1.value.indexOf('+');
		var s6=document.frmDonateProg.fax1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax1.value.indexOf('-');
		var s8=document.frmDonateProg.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}

 len7=document.frmDonateProg.fax1.value.length;
 strnum = document.frmDonateProg.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmDonateProg.fax1.focus();
 return false;}
 
 if(document.frmDonateProg.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmDonateProg.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmDonateProg.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	 
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}

if(document.frmDonateProg.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName1.value)|| document.frmDonateProg.loginName1.value.length > 25 || document.frmDonateProg.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmDonateProg.loginName1.focus();
 return false;}*/
	}
if(document.frmDonateProg.famUser1[0].checked==true )
	{ if(document.frmDonateProg.userNameId1.value=="" || document.frmDonateProg.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmDonateProg.userNameId1.focus();
	   return false;}
	}
	

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

if(document.frmDonateProg.famUser2[1].checked==true)
	{

	if(document.frmDonateProg.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(document.frmDonateProg.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if((document.frmDonateProg.firstname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmDonateProg.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if((document.frmDonateProg.middlename2.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmDonateProg.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(document.frmDonateProg.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if((document.frmDonateProg.lastname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmDonateProg.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");
	 document.frmDonateProg.suffix2.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	if((document.frmDonateProg.suffix2.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmDonateProg.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmDonateProg.selectDay2.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmDonateProg.selectYear2.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmDonateProg.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmDonateProg.gender2[i2].checked)
		{	chosen2= document.frmDonateProg.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmDonateProg.phone2.value=="" && document.frmDonateProg.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmDonateProg.phone2.value!="")
{		var s1=document.frmDonateProg.phone2.value.indexOf('(');
		var s2=document.frmDonateProg.phone2.value.indexOf(')');
		var s5=document.frmDonateProg.phone2.value.indexOf('+');
		var s6=document.frmDonateProg.phone2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone2.value.indexOf('-');
		var s8=document.frmDonateProg.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone2.value.length;
 strnum = document.frmDonateProg.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmDonateProg.phone2.focus();
 return false;}
 if(document.frmDonateProg.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
if(isnotInteger(document.frmDonateProg.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmDonateProg.mobile2.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax2.value.indexOf('(');
		var s2=document.frmDonateProg.fax2.value.indexOf(')');
		var s5=document.frmDonateProg.fax2.value.indexOf('+');
		var s6=document.frmDonateProg.fax2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax2.value.indexOf('-');
		var s8=document.frmDonateProg.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}

 len7=document.frmDonateProg.fax2.value.length;
 strnum = document.frmDonateProg.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmDonateProg.fax2.focus();
 return false;}
 
 if(document.frmDonateProg.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmDonateProg.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmDonateProg.email2.value=="")
	{alert("Enter Email in Family Member two");
	 document.frmDonateProg.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email2.value))
	{alert("Enter a valid Email in Family Member two");
	 document.frmDonateProg.email2.focus();
	 return false;}
	 
	}

	
if(document.frmDonateProg.famUser2[0].checked==true)
	{ if(document.frmDonateProg.userNameId2.value=="" || document.frmDonateProg.userNameId2.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Two");
	   document.frmDonateProg.userNameId2.focus();
	   return false;}
	
	
	}
	}
//--------------------------------------------------------------------------------

/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName2.value=="")
{ alert("Enter a User Name in Family Member Two");
 document.frmDonateProg.loginName2.focus();
 return false;}

if(document.frmDonateProg.loginName2.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Two");
 document.frmDonateProg.loginName2.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName2.value)|| document.frmDonateProg.loginName2.value.length > 25 || document.frmDonateProg.loginName2.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Two");
  document.frmDonateProg.loginName2.focus();
 return false;}*/
	
 	

if(document.frmDonateProg.famAdd_sel.value==3)
	{
	//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmDonateProg.famUser1[1].checked==true)
	{



	if(document.frmDonateProg.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(document.frmDonateProg.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if((document.frmDonateProg.firstname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmDonateProg.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if((document.frmDonateProg.middlename1.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmDonateProg.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(document.frmDonateProg.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if((document.frmDonateProg.lastname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	
	 if(document.frmDonateProg.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmDonateProg.suffix1.focus();
	return false;}
	
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmDonateProg.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmDonateProg.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmDonateProg.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmDonateProg.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmDonateProg.gender1[i1].checked)
		{	chosen1= document.frmDonateProg.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone1.value=="" && document.frmDonateProg.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmDonateProg.phone2.value!="")
{		var s1=document.frmDonateProg.phone1.value.indexOf('(');
		var s2=document.frmDonateProg.phone1.value.indexOf(')');
		var s5=document.frmDonateProg.phone1.value.indexOf('+');
		var s6=document.frmDonateProg.phone1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone1.value.indexOf('-');
		var s8=document.frmDonateProg.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone1.value.length;
 strnum = document.frmDonateProg.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmDonateProg.phone1.focus();
 return false;}
 if(document.frmDonateProg.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
if(isnotInteger(document.frmDonateProg.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmDonateProg.mobile1.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax1.value.indexOf('(');
		var s2=document.frmDonateProg.fax1.value.indexOf(')');
		var s5=document.frmDonateProg.fax1.value.indexOf('+');
		var s6=document.frmDonateProg.fax1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax1.value.indexOf('-');
		var s8=document.frmDonateProg.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}

 len7=document.frmDonateProg.fax1.value.length;
 strnum = document.frmDonateProg.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmDonateProg.fax1.focus();
 return false;}
 
 if(document.frmDonateProg.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmDonateProg.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmDonateProg.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	 
	}
	
	if(document.frmDonateProg.famUser1[0].checked==true)
	{ if(document.frmDonateProg.userNameId1.value=="" || document.frmDonateProg.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmDonateProg.userNameId1.focus();
	   return false;}
	}
	
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}

if(document.frmDonateProg.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName1.value)|| document.frmDonateProg.loginName1.value.length > 25 || document.frmDonateProg.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmDonateProg.loginName1.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

	if(document.frmDonateProg.famUser2[1].checked==true)
	{

	if(document.frmDonateProg.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(document.frmDonateProg.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if((document.frmDonateProg.firstname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmDonateProg.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if((document.frmDonateProg.middlename2.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmDonateProg.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(document.frmDonateProg.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if((document.frmDonateProg.lastname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmDonateProg.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");
	 document.frmDonateProg.suffix2.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	if((document.frmDonateProg.suffix2.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmDonateProg.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmDonateProg.selectDay2.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmDonateProg.selectYear2.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmDonateProg.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmDonateProg.gender2[i2].checked)
		{	chosen2= document.frmDonateProg.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmDonateProg.phone2.value=="" && document.frmDonateProg.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmDonateProg.phone2.value!="")
{		var s1=document.frmDonateProg.phone2.value.indexOf('(');
		var s2=document.frmDonateProg.phone2.value.indexOf(')');
		var s5=document.frmDonateProg.phone2.value.indexOf('+');
		var s6=document.frmDonateProg.phone2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone2.value.indexOf('-');
		var s8=document.frmDonateProg.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone2.value.length;
 strnum = document.frmDonateProg.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmDonateProg.phone2.focus();
 return false;}
 if(document.frmDonateProg.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
if(isnotInteger(document.frmDonateProg.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmDonateProg.mobile2.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax2.value.indexOf('(');
		var s2=document.frmDonateProg.fax2.value.indexOf(')');
		var s5=document.frmDonateProg.fax2.value.indexOf('+');
		var s6=document.frmDonateProg.fax2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax2.value.indexOf('-');
		var s8=document.frmDonateProg.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}

 len7=document.frmDonateProg.fax2.value.length;
 strnum = document.frmDonateProg.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmDonateProg.fax2.focus();
 return false;}
 
 if(document.frmDonateProg.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmDonateProg.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmDonateProg.email2.value=="")
	{alert("Enter Email in Family Member Two");
	 document.frmDonateProg.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email2.value))
	{alert("Enter a valid Email in Family Member Two");
	 document.frmDonateProg.email2.focus();
	 return false;}

	}
	
	if(document.frmDonateProg.famUser2[0].checked==true || document.frmDonateProg.userNameId2.value.indexOf(" ")==0)
	{ if(document.frmDonateProg.userNameId2.value=="")
	  {alert("Enter the User Name for Family Member Two");
	   document.frmDonateProg.userNameId2.focus();
	   return false;}
	}
	
/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName2.value=="")
{ alert("Enter a User Name in Family Member Two");
 document.frmDonateProg.loginName2.focus();
 return false;}

if(document.frmDonateProg.loginName2.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Two");
 document.frmDonateProg.loginName2.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName2.value)|| document.frmDonateProg.loginName2.value.length > 25 || document.frmDonateProg.loginName2.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Two");
  document.frmDonateProg.loginName2.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member three--------

	if(document.frmDonateProg.famUser3[1].checked==true)
	{

	if(document.frmDonateProg.firstname3.value=="")
	{alert("Enter First Name of Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if(document.frmDonateProg.firstname3.value.length>80)
	{alert("Enter valid First Name of Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname3.value))
	{alert("Enter a valid First Name in Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if((document.frmDonateProg.firstname3.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member three-------------------------------------
	if(document.frmDonateProg.middlename3.value.length>80)
	{alert("Enter Middle Name of Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename3.value))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
	if((document.frmDonateProg.middlename3.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member three------------------------
	if(document.frmDonateProg.lastname3.value=="")
	{alert("Enter Last Name of Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if(document.frmDonateProg.lastname3.value.length>80)
	{alert("Enter valid Last Name of Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname3.value))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if((document.frmDonateProg.lastname3.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member three-----------------------
	/*if(document.frmDonateProg.suffix3.value=="")
	{alert("Enter Suffix in Family Member three");
	 document.frmDonateProg.suffix3.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix3.value.length>80)
	{alert("Enter valid Suffix of Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix3.value))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}
	if((document.frmDonateProg.suffix3.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member three-----------
	if(document.frmDonateProg.selectMonth3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectMonth3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member three-----------
	if(document.frmDonateProg.selectDay3.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectDay3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member three-----------
	if(document.frmDonateProg.selectYear3.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectYear3.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member three--------------------------
	chosen3="";
	len3 = document.frmDonateProg.gender3.length ;
	for(i3=0;i3<len3;i3++){
		if(document.frmDonateProg.gender3[i3].checked)
		{	chosen3= document.frmDonateProg.gender3[i3].value;	}	}

	if(chosen3=="")
	{	alert("Check any of Gender Option in Family Member three.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone3.value=="" && document.frmDonateProg.mobile3.value=="" )
{ alert("Enter a Contact Number in Family Member three");
  document.frmDonateProg.phone3.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member three --------------


if(document.frmDonateProg.phone3.value!="")
{		var s1=document.frmDonateProg.phone3.value.indexOf('(');
		var s2=document.frmDonateProg.phone3.value.indexOf(')');
		var s5=document.frmDonateProg.phone3.value.indexOf('+');
		var s6=document.frmDonateProg.phone3.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone3.value.indexOf('-');
		var s8=document.frmDonateProg.phone3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone3.value.length;
 strnum = document.frmDonateProg.phone3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member three");
 document.frmDonateProg.phone3.focus();
 return false;}
 if(document.frmDonateProg.phone3.value.length>40)
  {alert("Enter valid Phone Number in Family Member three");
  document.frmDonateProg.phone3.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member three----------------
if(isnotInteger(document.frmDonateProg.mobile3.value))
{alert("Enter a valid Mobile Number in Family Member three.");
document.frmDonateProg.mobile3.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax3.value.indexOf('(');
		var s2=document.frmDonateProg.fax3.value.indexOf(')');
		var s5=document.frmDonateProg.fax3.value.indexOf('+');
		var s6=document.frmDonateProg.fax3.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax3.value.indexOf('-');
		var s8=document.frmDonateProg.fax3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}

 len7=document.frmDonateProg.fax3.value.length;
 strnum = document.frmDonateProg.fax3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member three");
 document.frmDonateProg.fax3.focus();
 return false;}
 
 if(document.frmDonateProg.fax3.value.length>40)
  {alert("Enter valid Fax in Family Member three");
  document.frmDonateProg.fax3.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member three-------------------------
	if(document.frmDonateProg.email3.value=="")
	{alert("Enter Email in Family Member three");
	 document.frmDonateProg.email3.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email3.value))
	{alert("Enter a valid Email in Family Member three");
	 document.frmDonateProg.email3.focus();
	 return false;}
	 
	}
	
	if(document.frmDonateProg.famUser3[0].checked==true)
	{ if(document.frmDonateProg.userNameId3.value=="" || document.frmDonateProg.userNameId3.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Three");
	   document.frmDonateProg.userNameId3.focus();
	   return false;}
	}
	 
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName3.value=="")
{ alert("Enter a User Name in Family Member Three");
 document.frmDonateProg.loginName3.focus();
 return false;}

if(document.frmDonateProg.loginName3.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Three");
 document.frmDonateProg.loginName3.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName3.value)|| document.frmDonateProg.loginName3.value.length > 25 || document.frmDonateProg.loginName3.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Three");
  document.frmDonateProg.loginName3.focus();
 return false;}*/

	}
//--------------------------------------------------------------------------------

	
if(document.frmDonateProg.famAdd_sel.value==4)
	{		 

	
	if(document.frmDonateProg.famUser1[1].checked==true)
	{

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmDonateProg.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(document.frmDonateProg.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
	if((document.frmDonateProg.firstname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member One");
	document.frmDonateProg.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmDonateProg.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
	if((document.frmDonateProg.middlename1.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmDonateProg.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmDonateProg.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");

	document.frmDonateProg.lastname1.focus();
	return false;}
	if(document.frmDonateProg.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
	if((document.frmDonateProg.lastname1.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmDonateProg.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	
	 if(document.frmDonateProg.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmDonateProg.suffix1.focus();
	return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmDonateProg.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmDonateProg.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmDonateProg.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmDonateProg.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmDonateProg.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmDonateProg.gender1[i1].checked)
		{	chosen1= document.frmDonateProg.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone1.value=="" && document.frmDonateProg.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmDonateProg.phone2.value!="")
{		var s1=document.frmDonateProg.phone1.value.indexOf('(');
		var s2=document.frmDonateProg.phone1.value.indexOf(')');
		var s5=document.frmDonateProg.phone1.value.indexOf('+');
		var s6=document.frmDonateProg.phone1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone1.value.indexOf('-');
		var s8=document.frmDonateProg.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmDonateProg.phone1.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone1.value.length;
 strnum = document.frmDonateProg.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmDonateProg.phone1.focus();
 return false;}
 if(document.frmDonateProg.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmDonateProg.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
if(isnotInteger(document.frmDonateProg.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmDonateProg.mobile1.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax1.value.indexOf('(');
		var s2=document.frmDonateProg.fax1.value.indexOf(')');
		var s5=document.frmDonateProg.fax1.value.indexOf('+');
		var s6=document.frmDonateProg.fax1.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax1.value.indexOf('-');
		var s8=document.frmDonateProg.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}

 len7=document.frmDonateProg.fax1.value.length;
 strnum = document.frmDonateProg.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmDonateProg.fax1.focus();
 return false;}
 
 if(document.frmDonateProg.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmDonateProg.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmDonateProg.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmDonateProg.email1.focus();
	 return false;}

	}
	
	if(document.frmDonateProg.famUser1[0].checked==true)
	{ if(document.frmDonateProg.userNameId1.value=="" || document.frmDonateProg.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmDonateProg.userNameId1.focus();
	   return false;}
	}
	
/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}

if(document.frmDonateProg.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmDonateProg.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName1.value)|| document.frmDonateProg.loginName1.value.length > 25 || document.frmDonateProg.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmDonateProg.loginName1.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

	if(document.frmDonateProg.famUser2[1].checked==true)
	{


	if(document.frmDonateProg.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(document.frmDonateProg.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
	if((document.frmDonateProg.firstname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member two");
	document.frmDonateProg.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmDonateProg.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
	if((document.frmDonateProg.middlename2.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmDonateProg.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmDonateProg.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(document.frmDonateProg.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
	if((document.frmDonateProg.lastname2.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmDonateProg.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmDonateProg.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");
	 document.frmDonateProg.suffix2.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}
	if((document.frmDonateProg.suffix2.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmDonateProg.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmDonateProg.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmDonateProg.selectDay2.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmDonateProg.selectYear2.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member two.");
	 document.frmDonateProg.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmDonateProg.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmDonateProg.gender2[i2].checked)
		{	chosen2= document.frmDonateProg.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmDonateProg.phone2.value=="" && document.frmDonateProg.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmDonateProg.phone2.value!="")
{		var s1=document.frmDonateProg.phone2.value.indexOf('(');
		var s2=document.frmDonateProg.phone2.value.indexOf(')');
		var s5=document.frmDonateProg.phone2.value.indexOf('+');
		var s6=document.frmDonateProg.phone2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone2.value.indexOf('-');
		var s8=document.frmDonateProg.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmDonateProg.phone2.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone2.value.length;
 strnum = document.frmDonateProg.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmDonateProg.phone2.focus();
 return false;}
 if(document.frmDonateProg.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmDonateProg.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
if(isnotInteger(document.frmDonateProg.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmDonateProg.mobile2.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax2.value.indexOf('(');
		var s2=document.frmDonateProg.fax2.value.indexOf(')');
		var s5=document.frmDonateProg.fax2.value.indexOf('+');
		var s6=document.frmDonateProg.fax2.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax2.value.indexOf('-');
		var s8=document.frmDonateProg.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmDonateProg.fax2.focus();
			return false;
		}

 len7=document.frmDonateProg.fax2.value.length;
 strnum = document.frmDonateProg.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmDonateProg.fax2.focus();
 return false;}
 
 if(document.frmDonateProg.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmDonateProg.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmDonateProg.email2.value=="")
	{alert("Enter Email in Family Member two");
	 document.frmDonateProg.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email2.value))
	{alert("Enter a valid Email in Family Member two");
	 document.frmDonateProg.email2.focus();
	 return false;}
	 
	}
	
	if(document.frmDonateProg.famUser2[0].checked==true)
	{ if(document.frmDonateProg.userNameId2.value=="" || document.frmDonateProg.userNameId2.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Two");
	   document.frmDonateProg.userNameId2.focus();
	   return false;}
	}
	
	

/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName2.value=="")
{ alert("Enter a User Name in Family Member Two");
 document.frmDonateProg.loginName2.focus();
 return false;}

if(document.frmDonateProg.loginName2.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Two");
 document.frmDonateProg.loginName2.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName2.value)|| document.frmDonateProg.loginName2.value.length > 25 || document.frmDonateProg.loginName2.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Two");
  document.frmDonateProg.loginName2.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member three--------

	if(document.frmDonateProg.famUser3[1].checked==true)
	{


	if(document.frmDonateProg.firstname3.value=="")
	{alert("Enter First Name of Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if(document.frmDonateProg.firstname3.value.length>80)
	{alert("Enter valid First Name of Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname3.value))
	{alert("Enter a valid First Name in Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
	if((document.frmDonateProg.firstname3.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member three");
	document.frmDonateProg.firstname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member three-------------------------------------
	if(document.frmDonateProg.middlename3.value.length>80)
	{alert("Enter Middle Name of Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename3.value))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
	if((document.frmDonateProg.middlename3.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmDonateProg.middlename3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member three------------------------
	if(document.frmDonateProg.lastname3.value=="")
	{alert("Enter Last Name of Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if(document.frmDonateProg.lastname3.value.length>80)
	{alert("Enter valid Last Name of Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname3.value))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
	if((document.frmDonateProg.lastname3.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmDonateProg.lastname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member three-----------------------
	/*if(document.frmDonateProg.suffix3.value=="")
	{alert("Enter Suffix in Family Member three");
	 document.frmDonateProg.suffix3.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix3.value.length>80)
	{alert("Enter valid Suffix of Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix3.value))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}
	if((document.frmDonateProg.suffix3.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmDonateProg.suffix3.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member three-----------
	if(document.frmDonateProg.selectMonth3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectMonth3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member three-----------
	if(document.frmDonateProg.selectDay3.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectDay3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member three-----------
	if(document.frmDonateProg.selectYear3.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member three.");
	 document.frmDonateProg.selectYear3.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member three--------------------------
	chosen3="";
	len3 = document.frmDonateProg.gender3.length ;
	for(i3=0;i3<len3;i3++){
		if(document.frmDonateProg.gender3[i3].checked)
		{	chosen3= document.frmDonateProg.gender3[i3].value;	}	}

	if(chosen3=="")
	{	alert("Check any of Gender Option in Family Member three.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone3.value=="" && document.frmDonateProg.mobile3.value=="" )
{ alert("Enter a Contact Number in Family Member three");
  document.frmDonateProg.phone3.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member three --------------


if(document.frmDonateProg.phone3.value!="")
{		var s1=document.frmDonateProg.phone3.value.indexOf('(');
		var s2=document.frmDonateProg.phone3.value.indexOf(')');
		var s5=document.frmDonateProg.phone3.value.indexOf('+');
		var s6=document.frmDonateProg.phone3.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone3.value.indexOf('-');
		var s8=document.frmDonateProg.phone3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member three");
			document.frmDonateProg.phone3.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone3.value.length;
 strnum = document.frmDonateProg.phone3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member three");
 document.frmDonateProg.phone3.focus();
 return false;}
 if(document.frmDonateProg.phone3.value.length>40)
  {alert("Enter valid Phone Number in Family Member three");
  document.frmDonateProg.phone3.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member three----------------
if(isnotInteger(document.frmDonateProg.mobile3.value))
{alert("Enter a valid Mobile Number in Family Member three.");
document.frmDonateProg.mobile3.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax3.value.indexOf('(');
		var s2=document.frmDonateProg.fax3.value.indexOf(')');
		var s5=document.frmDonateProg.fax3.value.indexOf('+');
		var s6=document.frmDonateProg.fax3.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax3.value.indexOf('-');
		var s8=document.frmDonateProg.fax3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member three");
			document.frmDonateProg.fax3.focus();
			return false;
		}

 len7=document.frmDonateProg.fax3.value.length;
 strnum = document.frmDonateProg.fax3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member three");
 document.frmDonateProg.fax3.focus();
 return false;}
 
 if(document.frmDonateProg.fax3.value.length>40)
  {alert("Enter valid Fax in Family Member three");
  document.frmDonateProg.fax3.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member three-------------------------
	if(document.frmDonateProg.email3.value=="")
	{alert("Enter Email in Family Member three");
	 document.frmDonateProg.email3.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email3.value))
	{alert("Enter a valid Email in Family Member three");
	 document.frmDonateProg.email3.focus();
	 return false;}
	 
	}
	
	if(document.frmDonateProg.famUser3[0].checked==true)
	{ if(document.frmDonateProg.userNameId3.value=="" || document.frmDonateProg.userNameId3.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Three");
	   document.frmDonateProg.userNameId3.focus();
	   return false;}
	}
	
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName3.value=="")
{ alert("Enter a User Name in Family Member Three");
 document.frmDonateProg.loginName3.focus();
 return false;}

if(document.frmDonateProg.loginName3.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Three");
 document.frmDonateProg.loginName3.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName3.value)|| document.frmDonateProg.loginName3.value.length > 25 || document.frmDonateProg.loginName3.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Three");
  document.frmDonateProg.loginName3.focus();
 return false;}*/
	 
//------------------------------------------------------------------------------------------
//-----------------------------fosr Salutation for Family Member four-----------

if(document.frmDonateProg.famUser4[1].checked==true)
	{

	/* if(document.frmDonateProg.selectSalute4.selectedIndex==0)
	 {alert("Select a salutation in Family Member four");
	 document.frmDonateProg.selectSalute4.focus();
	 return false;}*/
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member four--------

	if(document.frmDonateProg.firstname4.value=="")
	{alert("Enter First Name of Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
	if(document.frmDonateProg.firstname4.value.length>80)
	{alert("Enter valid First Name of Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.firstname4.value))
	{alert("Enter a valid First Name in Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
	if((document.frmDonateProg.firstname4.value.indexOf('  ')!=-1)||(document.frmDonateProg.firstname4.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member four");
	document.frmDonateProg.firstname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member four-------------------------------------
	if(document.frmDonateProg.middlename4.value.length>80)
	{alert("Enter Middle Name of Family Member four");
	document.frmDonateProg.middlename4.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.middlename4.value))
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmDonateProg.middlename4.focus();
	return false;}
	if((document.frmDonateProg.middlename4.value.indexOf('  ')!=-1)||(document.frmDonateProg.middlename4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmDonateProg.middlename4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member four------------------------
	if(document.frmDonateProg.lastname4.value=="")
	{alert("Enter Last Name of Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
	if(document.frmDonateProg.lastname4.value.length>80)
	{alert("Enter valid Last Name of Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
	if(isnotAlpha(document.frmDonateProg.lastname4.value))
	{alert("Enter a valid Last Name in Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
	if((document.frmDonateProg.lastname4.value.indexOf('  ')!=-1)||(document.frmDonateProg.lastname4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member four");
	document.frmDonateProg.lastname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member four-----------------------
	/*if(document.frmDonateProg.suffix4.value=="")
	{alert("Enter Suffix in Family Member four");
	 document.frmDonateProg.suffix4.focus();
	 return false;}*/
	 if(document.frmDonateProg.suffix4.value.length>80)
	{alert("Enter valid Suffix of Family Member four");
	document.frmDonateProg.suffix4.focus();
	return false;}
	/*if(isnotAlpha(document.frmDonateProg.suffix4.value))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmDonateProg.suffix4.focus();
	return false;}
	if((document.frmDonateProg.suffix4.value.indexOf('  ')!=-1)||(document.frmDonateProg.suffix4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmDonateProg.suffix4.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member four-----------
	if(document.frmDonateProg.selectMonth4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmDonateProg.selectMonth4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member four-----------
	if(document.frmDonateProg.selectDay4.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member four.");
	 document.frmDonateProg.selectDay4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member four-----------
	if(document.frmDonateProg.selectYear4.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member four.");
	 document.frmDonateProg.selectYear4.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member four--------------------------
	chosen4="";
	len4 = document.frmDonateProg.gender4.length ;
	for(i4=0;i4<len4;i4++){
		if(document.frmDonateProg.gender4[i4].checked)
		{	chosen4= document.frmDonateProg.gender4[i4].value;	}	}

	if(chosen4=="")
	{	alert("Check any of Gender Option in Family Member four.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmDonateProg.phone4.value=="" && document.frmDonateProg.mobile4.value=="" )
{ alert("Enter a Contact Number in Family Member four");
  document.frmDonateProg.phone4.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member four --------------


if(document.frmDonateProg.phone4.value!="")
{		var s1=document.frmDonateProg.phone4.value.indexOf('(');
		var s2=document.frmDonateProg.phone4.value.indexOf(')');
		var s5=document.frmDonateProg.phone4.value.indexOf('+');
		var s6=document.frmDonateProg.phone4.value.lastIndexOf('+');
		var s7=document.frmDonateProg.phone4.value.indexOf('-');
		var s8=document.frmDonateProg.phone4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member four");
			document.frmDonateProg.phone4.focus();
			return false;
		}
																					  
 len7=document.frmDonateProg.phone4.value.length;
 strnum = document.frmDonateProg.phone4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member four");
 document.frmDonateProg.phone4.focus();
 return false;}
 if(document.frmDonateProg.phone4.value.length>40)
  {alert("Enter valid Phone Number in Family Member four");
  document.frmDonateProg.phone4.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member four----------------
if(isnotInteger(document.frmDonateProg.mobile4.value))
{alert("Enter a valid Mobile Number in Family Member four.");
document.frmDonateProg.mobile4.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmDonateProg.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmDonateProg.fax1.focus();
			return false;
		}*/

	var s1=document.frmDonateProg.fax4.value.indexOf('(');
		var s2=document.frmDonateProg.fax4.value.indexOf(')');
		var s5=document.frmDonateProg.fax4.value.indexOf('+');
		var s6=document.frmDonateProg.fax4.value.lastIndexOf('+');
		var s7=document.frmDonateProg.fax4.value.indexOf('-');
		var s8=document.frmDonateProg.fax4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member four");
			document.frmDonateProg.fax4.focus();
			return false;
		}

 len7=document.frmDonateProg.fax4.value.length;
 strnum = document.frmDonateProg.fax4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member four");
 document.frmDonateProg.fax4.focus();
 return false;}
 
 if(document.frmDonateProg.fax4.value.length>40)
  {alert("Enter valid Fax in Family Member four");
  document.frmDonateProg.fax4.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member four-------------------------
	if(document.frmDonateProg.email4.value=="")
	{alert("Enter Email in Family Member four");
	 document.frmDonateProg.email4.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmDonateProg.email4.value))
	{alert("Enter a valid Email in Family Member four");
	 document.frmDonateProg.email4.focus();
	 return false;}

	}
	
	if(document.frmDonateProg.famUser4[0].checked==true)
	{ if(document.frmDonateProg.userNameId4.value=="" || document.frmDonateProg.userNameId4.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Four");
	   document.frmDonateProg.userNameId4.focus();
	   return false;}
	}
	
	
	
/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmDonateProg.loginName4.value=="")
{ alert("Enter a User Name in Family Member Four");
 document.frmDonateProg.loginName4.focus();
 return false;}

if(document.frmDonateProg.loginName4.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Four");
 document.frmDonateProg.loginName4.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmDonateProg.loginName4.value)|| document.frmDonateProg.loginName4.value.length > 25 || document.frmDonateProg.loginName4.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Four");
  document.frmDonateProg.loginName4.focus();
 return false;}*/
	
	}
//-------------------------------------------------------------------------------------
//----------------------------for Payment Option----------------------------

chosenrd="";
	lenrd = document.frmDonateProg.r11.length ;
	for(ird=0;ird<lenrd;ird++){
		if(document.frmDonateProg.r11[ird].checked){
			chosenrd= document.frmDonateProg.r11[ird].value;
		}
	}

	if(chosenrd==""){
		alert("Check any of the Payment Option.");
		return false;
	}	
//=============================== For Card Details ===========================================
//=============================== For Check Number ===========================================

	if(chosenrd=="check"){
				
		if(document.frmDonateProg.txtChNumber.value==""){
			alert("Enter Check Number in Check Details");
			document.frmDonateProg.txtChNumber.focus();
			return false;
		}

		if(isnotAlphaNumeric(document.frmDonateProg.txtChNumber.value)){
			alert("Enter valid Check Number in Check Details.");
			document.frmDonateProg.txtChNumber.focus();
    		return false;
		}

		if(document.frmDonateProg.txtChNumber.value.indexOf('.')!=-1){
			alert("Enter a Valid check number in Check Details.");
			document.frmDonateProg.txtChNumber.focus();
			return false;
		}

		if(document.frmDonateProg.txtChNumber.value.indexOf(" ")==0){
			alert("Enter a Valid check number in Check Details.");
			document.frmDonateProg.txtChNumber.focus();
			return false;
		}

//--------------------------------
//--------for Check Date

maxdays=0;
if(document.frmDonateProg.checkDate.value=="")
 { alert("Enter a Check Date in Payment Information");
  document.frmDonateProg.checkDate.focus();
  return false;}

/*if(!(document.frmDonateProg.checkDate.value==""))
{	 todaysDate=new Date();
	 nowDate=todaysDate.getDate();
	 nowYear=todaysDate.getYear();
	 nowMonth1=todaysDate.getMonth();
	 nowMonth=1+nowMonth1;
	if(nowDate<10)
	{nowDate="0"+nowDate;}
	if(nowMonth<10)
	{nowMonth="0"+nowMonth;}
	 
	 
strdate=document.frmDonateProg.checkDate.value;
mm = Number(strdate.substring(0,2));
dd = Number(strdate.substring(3,5));
yyyy=Number(strdate.substring(6,10));
if(mm >12 || mm< 1)
{alert("Enter valid month in the Check Date in the Payment Details");
 document.frmDonateProg.checkDate.focus();
 return false;}
 if(yyyy<nowYear || yyyy>2100)
{alert("Enter valid year in the Check Date in the Payment Details");
 document.frmDonateProg.checkDate.focus();
return false;}
switch (mm) {
case 1:
case 3:
case 5:
case 7:
case 8:
case 10:
case 12:
maxdays=31;
break;
case 4:
case 6:
case 9:
case 11:
maxdays=30;
break;
case 2:
maxdays=(yyyy%4==0?29:28);
default:
maxdays=0;} 
if((yyyy==nowYear)&&(mm<nowMonth))
{alert("Enter valid date in the Check Date in the Payment Details");
document.frmDonateProg.checkDate.focus();
return false;}
if(dd>maxdays || dd<1)
{ alert("Enter valid date in the Check Date in the Payment Details");
 document.frmDonateProg.checkDate.focus();
 return false;}
 if((dd<nowDate)&&(mm==nowMonth)&&(yyyy==nowYear))
{alert("Enter valid date in the Check Date in the Payment Details");
document.frmDonateProg.checkDate.focus();
return false;}
 

}*/


//------------------------------
//--------for In Favor of

if(document.frmDonateProg.inFavorof.value=="")
 { alert("Enter a Bank Name info in Payment Information");
  document.frmDonateProg.inFavorof.focus();
  return false;}

if(document.frmDonateProg.inFavorof.value.indexOf(' ')==0)
 { alert("Enter valid Bank Name info in Payment Information");
  document.frmDonateProg.inFavorof.focus();
  return false;}

  
/*if(document.frmDonateProg.inFavorof.value.length>80)
 { alert("In Favor of info in Payment Information is out of range");
  document.frmDonateProg.inFavorof.focus();
  return false;}

if(isnotAlpha(document.frmDonateProg.inFavorof.value))
{alert("Enter valid Bank Name Info in Payment Information");
 document.frmDonateProg.inFavorof .focus();
  return false;}*/
  	
	
	//-----------------------for Name on check


if(document.frmDonateProg.nameOnchk.value.indexOf(' ')==0)
 { alert("Enter valid Name on Check info in Payment Information");
  document.frmDonateProg.nameOnchk.focus();
  return false;}
if(document.frmDonateProg.nameOnchk.value=="")
 { alert("Enter valid Name on Check info in Payment Information");
  document.frmDonateProg.nameOnchk.focus();
  return false;}
if(document.frmDonateProg.nameOnchk.value.length>80)
 { alert(" Name on Check info in Payment Information is out of range");
  document.frmDonateProg.nameOnchk.focus();
  return false;}

/*if(isnotAlpha(document.frmDonateProg.nameOnchk.value))
{alert("Enter valid name in the Name on Check Info in Payment Information");
 document.frmDonateProg.nameOnchk.focus();
  return false;}
  if(Dospace(document.frmDonateProg.nameOnchk.value))
  {alert("Enter valid name in the Name on Check Info in Payment Information");
   document.frmDonateProg.nameOnchk.focus();
  return false;}*/
	
	}
//================================== For Card Details ========================================

	if(chosenrd=="card"){
//================================== For Card Type =========================================

		if ( document.frmDonateProg.ccTypeId.selectedIndex == 0 ){
			alert ( "Please select card type." );
			document.frmDonateProg.ccTypeId.focus();
			return false;
		}
//================================== For Card Number =========================================
		if(document.frmDonateProg.txtCard.value==""){
			alert("Enter a Card Number in the Card Details");
			document.frmDonateProg.txtCard.focus();
			return false;
		}

		if(!Number(document.frmDonateProg.txtCard.value)){
			alert("Enter valid Card Number in the Card Details");
			document.frmDonateProg.txtCard.focus();
			return false;
		}
	
	if ( document.frmDonateProg.ccTypeId.selectedIndex == 3 ){
		if(document.frmDonateProg.txtCard.value.length!=15 ){
			alert("Enter valid Card Number in the Card Details");
			document.frmDonateProg.txtCard.focus();
			return false;
		}
	}
	
	if ( document.frmDonateProg.ccTypeId.selectedIndex == 1 || document.frmDonateProg.ccTypeId.selectedIndex == 2 ){
		if(document.frmDonateProg.txtCard.value.length!=16 ){
			alert("Enter valid Card Number in the Card Details");
			document.frmDonateProg.txtCard.focus();
			return false;
		}
	}
	
		if(document.frmDonateProg.txtCard.value.indexOf('.')!=-1){
			alert("Enter Valid Card Number in the Card Details.");
			document.frmDonateProg.txtCard.focus();
			return false;
		}

//================================== For CVV Number =========================================
	
		if(document.frmDonateProg.txtCvvId.value.indexOf(" ")!=0 && document.frmDonateProg.txtCvvId.value!=""){
			/*alert("Enter a  valid CVV Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}*/
		//alert(document.frmDonateProg.txtCvvId.value.length);
	
		if(document.frmDonateProg.txtCvvId.value.length>4){
			alert("Enter valid CVV Number in Card Details");
			document.frmDonateProg.txtCvvId.focus();
			return false;
		}
	
		if(document.frmDonateProg.txtCvvId.value.length<3){
			alert("Enter valid CVV Number in Card Details");
			document.frmDonateProg.txtCvvId.focus();
			return false;
		}
	
		if(document.frmDonateProg.txtCvvId.value.indexOf('.')!=-1){
			alert("Enter Valid Cvv Number in Card Details.");
			document.frmDonateProg.txtCvvId.focus();
			return false;
		}
		
		if(isnotInteger(document.frmDonateProg.txtCvvId.value)){
			alert("Enter Valid Cvv Number in Card Details.");
			document.frmDonateProg.txtCvvId.focus();
			return false;
		}
		
		
	}

//================================= For Print Name on Card =================================	
		if(document.frmDonateProg.txtPrName.value==""){
			alert("Enter valid Print Name in Card Details.");
			document.frmDonateProg.txtPrName.focus();
			return false;
		}
	
		if(document.frmDonateProg.txtPrName.value.length>80){
			alert("Entered Print Name in Card Details is out of Range.");
			document.frmDonateProg.txtPrName.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmDonateProg.txtPrName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.frmDonateProg.txtPrName.focus();
			return false;
		}
	
		if(Number(document.frmDonateProg.txtPrName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.frmDonateProg.txtPrName.focus();
			return false;
		}
	
		if(document.frmDonateProg.txtPrName.value.indexOf(' ')==0){
			alert("Enter a Valid Print Name in Card Details.");
			document.frmDonateProg.txtPrName.focus();
			return false;
		}
	
		if(document.frmDonateProg.txtPrName.value.indexOf('  ')!==-1){
			alert("Enter Valid Print Name in Card Details.");
			document.frmDonateProg.txtPrName.focus();
			return false;
		}

//================================= For Expiry Month =================================	
	
		var rightNow=new Date();
		var theYear=rightNow.getYear();
		var tMonth=rightNow.getMonth();
		var theMonth=1+tMonth;
		var theDate=rightNow.getDate();
	
		if ( document.frmDonateProg.selExpMonthId.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration Month." );
			document.frmDonateProg.selExpMonthId.focus();
			return false;
		}
	
		if (document.frmDonateProg.selExpYearId.value==theYear){
			 if(document.frmDonateProg.selExpMonthId.value<theMonth){
				alert("Please Select Valid Card Expiration Month.");
				document.frmDonateProg.selExpMonthId.focus();
				return(false);   
			}
		}
		
//================================= For Expiry Year =================================	
	
		if ( document.frmDonateProg.selExpYearId.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration year." );
			document.frmDonateProg.selExpYearId.focus();
			return false;
		}
	
		if (document.frmDonateProg.selExpYearId.value<theYear){
			alert("Please Select Valid Card Expiration Year.");
			document.frmDonateProg.selExpYearId.focus();
			return(false);   
		}
	}




//---------------------------------------------------------------------------------
	
return true;
}

function clrRad()
{
	
	chosenrd="";
	lenrd = document.frmDonateProg.r11.length ;
	for(ird=0;ird<lenrd;ird++){
		if(document.frmDonateProg.r11[ird].checked){
			chosenrd= document.frmDonateProg.r11[ird].value;
		}
	}
	
if(chosenrd=="check")
{
		
		document.frmDonateProg.cardselect.selectedIndex=0;
		document.frmDonateProg.cardNo.value="";
		document.frmDonateProg.cVVNo.value="";
		document.frmDonateProg.printName.value="";
		document.frmDonateProg.expirymonth.selectedIndex=0;
		document.frmDonateProg.expiryyear.selectedIndex=0;
		
}
else
{
		document.frmDonateProg.checkNo.value="";
		//document.frmDonateProg.checkDate.value="";
		document.frmDonateProg.inFavorof.value="";
		document.frmDonateProg.nameOnchk.value="";
		
}

}
	
	function sameUsr1()
	{
		// alert(document.frmDonateProg.logNam.value);
	     if(document.frmDonateProg.logNam.value == document.frmDonateProg.userNameId1.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmDonateProg.userNameId1.focus();
		 
		    document.getElementById("userNameId1").value = "";
			document.getElementById("firstNameId1").value = "";
			document.getElementById("lastNameId1").value = "";
			document.getElementById("phoneId1").value = "";
						
		}
		   
		   return false;
   }
   
   function sameUsr2()
	{
		// alert(document.frmDonateProg.logNam.value);
	     if(document.frmDonateProg.logNam.value == document.frmDonateProg.userNameId2.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmDonateProg.userNameId2.focus();
		 
		    document.getElementById("userNameId2").value = "";
			document.getElementById("firstNameId2").value = "";
			document.getElementById("lastNameId2").value = "";
			document.getElementById("phoneId2").value = "";
						
		}
		   
		   return false;
   }

	function sameUsr3()
	{
		// alert(document.frmDonateProg.logNam.value);
	     if(document.frmDonateProg.logNam.value == document.frmDonateProg.userNameId3.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmDonateProg.userNameId3.focus();
		 
		    document.getElementById("userNameId3").value = "";
			document.getElementById("firstNameId3").value = "";
			document.getElementById("lastNameId3").value = "";
			document.getElementById("phoneId3").value = "";
						
		}
		   
		   return false;
   }
   
   function sameUsr4()
	{
		// alert(document.frmDonateProg.logNam.value);
	     if(document.frmDonateProg.logNam.value == document.frmDonateProg.userNameId4.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmDonateProg.userNameId4.focus();
		 
		    document.getElementById("userNameId4").value = "";
			document.getElementById("firstNameId4").value = "";
			document.getElementById("lastNameId4").value = "";
			document.getElementById("phoneId4").value = "";
						
		}
		   
		   return false;
   }
   
   function nonComp()
   {
		var conval=document.frmDonateProg.memTyp_sel.value;//alert(conval);
		
		if(document.frmDonateProg.memTyp_sel.selectedIndex!=0)
		{
		spval=conval.split("#");
		//alert(spval[1]);
		
		document.frmDonateProg.ctryAmt.value=0;
		//alert(document.frmDonateProg.ctryAmt.value);
		if(spval[1] != "Life Member" && spval[1] != "Family Member")
		{//alert("inside");
			document.frmDonateProg.periodicals[0].checked = true;
			
			if(document.frmDonateProg.country.value != "USA")
			{
				//alert(document.frmDonateProg.country.value);
				ctryPrize();	
				switchDiv('mAddress');
			}
		}
			//var famMemb=document.frmDonateProg.famMemb.value;
			//sum=sum+famMemb*addonamt;
		}	   
	   
   }
   
   
   //================== display Country Price =======================

function ctryPrize()
{
//alert(rid);

   var memTypSel=document.myform.memTyp_sel.value
   memTypId=memTypSel.split("#");
   var ctry=document.myform.country.value;
   
   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "./MembCtryPrizeAjax.do?ctryName="+ctry+"&memTypId="+memTypId[0]; 
//alert(url);
        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processRequest11; 
        httpRequest.send(null); 
   } 
   
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processRequest11() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("ctryPrice")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
                //Update the HTML 
                updateHTML11(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML11(salutationXML) 
    { 

        

        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 
       
        
        
		 if(salutationText==undefined || salutationText==null || salutationText=="null" || salutationText=="")
        {
        document.myform.ctryAmt.value="0";
        }else
        document.myform.ctryAmt.value=salutationText;
	Sumup();

	}


//----------------------------------------------